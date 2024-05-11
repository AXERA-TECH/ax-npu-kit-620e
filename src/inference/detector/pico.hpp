/**************************************************************************************************
 *
 * Copyright (c) 2019-2023 Axera Semiconductor (Shanghai) Co., Ltd. All Rights Reserved.
 *
 * This source file is the property of Axera Semiconductor (Shanghai) Co., Ltd. and
 * may not be copied or distributed in any isomorphic form without the prior
 * written consent of Axera Semiconductor (Shanghai) Co., Ltd.
 *
 **************************************************************************************************/

#pragma once

#include "inference/engine_wrapper.hpp"
#include "inference/detection.hpp"

#include "utils/io.hpp"
#include "utils/frame_utils.hpp"

#include <algorithm>
#include <vector>

namespace skel
{
    namespace infer
    {
        struct PicoConfig
        {
            int num_classes;
            float cls_thresh;
            float nms_thresh;
            std::vector<int> strides;
            std::vector<int> want_classes;
            std::vector<float> zps;
            std::vector<float> scales;
        };

        class Pico : public EngineWrapper
        {
        public:
            Pico()
            { }

            ~Pico() = default;

            void SetConfig(const PicoConfig& config)
            {
                m_config = config;
            }

            PicoConfig GetConfig() const
            {
                return m_config;
            }

            int Detect(const AX_VIDEO_FRAME_T& img,
                       std::vector<skel::detection::Object>& outputs)
            {
                if (!m_hasInit)
                    return AX_ERR_SKEL_NOT_INIT;

                int ret = 0;

                if (m_input_size[0] != img.u32Height || m_input_size[1] != img.u32Width) {

                    AX_VIDEO_FRAME_T dst;
                    ret = Preprocess(img, dst);
                    if (ret != 0)
                    {
                        utils::FreeFrame(dst);
                        return ret;
                    }

                    ret = Run(dst);
                    if (ret != 0)
                    {
                        utils::FreeFrame(dst);
                        return ret;
                    }
                    utils::FreeFrame(dst);
                }
                else {
                    ret = Run(img);
                    if (ret != 0)
                    {
                        return ret;
                    }
                }

                // generate proposals
                std::vector<skel::detection::Object> proposals;
                for (int i = 0; i < m_output_num; i++)
                {
                    auto& output_info = m_io_info->pOutputs[i];
                    auto& buf = m_io.pOutputs[i];
                    utils::cache_io_flush(&buf);

                    AX_U8* pfBuf = (AX_U8*)buf.pVirAddr;
                    skel::detection::generate_pico_proposals(pfBuf, m_config.strides[i], m_input_size[0], m_input_size[1],
                                                             m_config.cls_thresh, proposals, m_config.num_classes, m_config.scales[i], m_config.zps[i]);
                }

                // nms & rescale coords & select class
                outputs.clear();
                skel::detection::reverse_letterbox(proposals, outputs, m_config.nms_thresh, m_input_size[0], m_input_size[1], img.u32Height, img.u32Width);

                if (!m_config.want_classes.empty())
                {
                    for (auto it = outputs.begin(); it != outputs.end(); )
                    {
                        if (std::find(m_config.want_classes.begin(), m_config.want_classes.end(), it->label) == m_config.want_classes.end())
                            it = outputs.erase(it);
                        else
                            it++;
                    }
                }

                return 0;
            }

        protected:
            PicoConfig m_config;
        };
    }
}
