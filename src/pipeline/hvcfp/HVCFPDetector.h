/**************************************************************************************************
 *
 * Copyright (c) 2019-2023 Axera Semiconductor (Ningbo) Co., Ltd. All Rights Reserved.
 *
 * This source file is the property of Axera Semiconductor (Ningbo) Co., Ltd. and
 * may not be copied or distributed in any isomorphic form without the prior
 * written consent of Axera Semiconductor (Ningbo) Co., Ltd.
 *
 **************************************************************************************************/

#ifndef SKEL_HVCFPDETECTOR_H
#define SKEL_HVCFPDETECTOR_H

#include "inference/detector/yolox.hpp"
#include "inference/detector/pico.hpp"

namespace skel {
    namespace ppl {
        class HVCFPDetector : public skel::infer::Pico
        {
        public:
            HVCFPDetector()
            {
                m_config.num_classes = 2;
                m_config.cls_thresh = 0.3f;
                m_config.nms_thresh = 0.45f;
                m_config.strides = std::vector<int>{8, 16, 32};
                m_config.scales = std::vector<float>{0.08292773365974426, 0.06160334497690201, 0.06760631501674652};
                m_config.zps = std::vector<float>{125, 130, 128};
//                m_config.want_classes = std::vector<int>{0};
            }

            ~HVCFPDetector() = default;
        };
    }
}

#endif //SKEL_HVCFPDETECTOR_H
