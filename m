Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD6C5A1EFE
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 04:43:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDPKP2BFGz3bb2
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 12:43:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O1yY9SrK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O1yY9SrK;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDPHd0Pkcz3bXD
	for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 12:42:04 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id a65so327747pfa.1
        for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2022 19:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=+FUdcVoA5R7wkkHkMVOX+IHghKx89t2KDXyDGNa8qBo=;
        b=O1yY9SrKjXVg8w8ll1K2qXubRS4PVOu+gxofkQ4mui3WXNad6GOUznkcKf0WcModKU
         YhPWCEEFr460gdgc1NLOHLAK7XDCYl6U3BiNkn4woazHNMkLpHcBsaZyZ821ifCTyKx6
         T5Jv3tRAS89bvJo6zL+SHgmuAnkPJ6zh6l/5EDYwzlcXhll4FwaAO1OYHSbHePPjonG1
         f/MuDRc+BsyRJ2OiiK4Eu9SQZN7oMKM2KfsTHRUZsiRNGgo8vEk55VdHg1RbSQRvnQsw
         EzvWKHtelymzgPB5T/FKpzzYewyx7nY6xKmeXTaHS/sekrFK6vNSiRE2vun6cvueYn7O
         TraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=+FUdcVoA5R7wkkHkMVOX+IHghKx89t2KDXyDGNa8qBo=;
        b=lmDGwSR1+ZPIxAttxVB/WH7tx1G95UKhZlCbZtRl8gs+fGxRqPcjOvupAFdPpVw5nU
         RoYT5xccS5M3XrCmtfmhIaQYHdzFswH5BSXjU9s3AoeN0gONXdtIOy2IlgN0fLQnPqtR
         DGNKxgfqEy5OM29SiIokys5eEXUbLRLJKKag2GO+LtfjLvHldIxI513CQChjZ5ObYcqL
         B0kKWttrLjGeZfAcqgCP0Y4ydAywcRhUHPPpw2T+F2J5OVqNgsfuN9XrGW8oC/tYvYYC
         MRttRV2F9gKQ/1QqcP3JhG74cOtP/vller6ULRUso/I5x83dkHWEQYc6klTUEfrHYg8W
         rZYQ==
X-Gm-Message-State: ACgBeo1MK6lysTMl7dyaUpbLLnJIzAN/O8RuGkcMXUFT2jpCTqIb/lrM
	0oqQv52AlSa9x236Fmpipss=
X-Google-Smtp-Source: AA6agR6mwiqFX/p94jAcY8/iikp0verp2///cSIUq74RzqcxUx14VBpxcOpjtIOcBIVsWvtK86zqKg==
X-Received: by 2002:a63:8348:0:b0:42b:57d7:bc08 with SMTP id h69-20020a638348000000b0042b57d7bc08mr1575436pge.219.1661481722661;
        Thu, 25 Aug 2022 19:42:02 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s34-20020a17090a69a500b001f021cdd73dsm444473pjj.10.2022.08.25.19.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:42:02 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/5] dt-bindings: media: Add dt-bindings for NPCM Video Capture/Encode Engine
Date: Fri, 26 Aug 2022 10:41:21 +0800
Message-Id: <20220826024124.22747-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220826024124.22747-1-milkfafa@gmail.com>
References: <20220826024124.22747-1-milkfafa@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for NPCM Video Capture/Encode Engine.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../bindings/media/nuvoton,npcm-video.yaml    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml

diff --git a/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml b/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
new file mode 100644
index 000000000000..b5be7ef09038
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nuvoton,npcm-video.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Video Capture/Encode Engine Device Tree Bindings
+
+maintainers:
+  - Joseph Liu <kwliu@nuvoton.com>
+  - Marvin Lin <kflin@nuvoton.com>
+
+description: |
+  Video Capture/Differentiation Engine (VCD) and Encoding Compression Engine
+  (ECE) present on Nuvoton NPCM SoCs.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-video
+      - nuvoton,npcm845-video
+
+  reg:
+    items:
+      - description: VCD registers
+      - description: ECE registers
+
+  reg-names:
+    items:
+      - const: vcd
+      - const: ece
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: VCD reset control
+      - description: ECE reset control
+
+  reset-names:
+    items:
+      - const: vcd
+      - const: ece
+
+  nuvoton,syscon-gcr:
+    $ref: /schemas/types.yaml#definitions/phandle
+    description: Phandle to the Global Control Register DT node
+
+  nuvoton,syscon-gfxi:
+    $ref: /schemas/types.yaml#definitions/phandle
+    description: Phandle to the Graphics Core Information DT node
+
+  memory-region:
+    description:
+      CMA pool to use for buffers allocation instead of the default CMA pool.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - resets
+  - reset-names
+  - nuvoton,syscon-gcr
+  - nuvoton,syscon-gfxi
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
+
+    video: video@f0810000 {
+        compatible = "nuvoton,npcm750-video";
+        reg = <0xf0810000 0x10000>,
+              <0xf0820000 0x2000>;
+        reg-names = "vcd", "ece";
+        interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>,
+                 <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
+        reset-names = "vcd", "ece";
+        nuvoton,syscon-gcr = <&gcr>;
+        nuvoton,syscon-gfxi = <&gfxi>;
+    };
-- 
2.17.1

