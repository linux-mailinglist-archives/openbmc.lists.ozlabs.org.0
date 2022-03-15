Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 940334D943D
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 06:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHjN32sYfz30Gj
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 16:56:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CVIblUDi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CVIblUDi; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHjLT4LkNz30QQ
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 16:55:29 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id q11so15370377pln.11
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 22:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QXDQqZpvCdVKtoVqANwNRMstDUhJJwpS39hbEsKoKQs=;
 b=CVIblUDiGw8kYvTInHv32Eli2kEolQo1I7czw54oOSq5u2FpxWy1LjWoyHdFgBu4k8
 e2y2a1DhrLMvRC8Z5/RdBysU2i6K3EDXprmbBm1vyKB7d3xE249itkqLLZOaHrWxAbDC
 oN1cPcgrAGIlPNx4xU6FgTxLoCc/rMB+lt+zAENUOfAIPQdy0VY72Br26Hm8Y9PXxHS9
 oLYBc4vc5ajcuV6OD4ntfTkqRCL0QmDmRQFvF1kTuSKSDBzoCaFW1nmH/Dn5UrnbPRsY
 i/MhDxdhX9xpgONjzGw2aY82nB8s+F/8dQY2j9tAN4nP/t4kGAWE+uL1klLG6AvNokuV
 nxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QXDQqZpvCdVKtoVqANwNRMstDUhJJwpS39hbEsKoKQs=;
 b=WB6T78KyPtrdm8kPvHCydihuL/XsdfH4/SZ6Nvmnw1pfyTtza+2BiGzgcXVq3e7J4h
 6FpkMR6tm38qrT/Pq+hq+YD6yy+EGhAN8U0HKSKncZwFXOr34+gsymox//cmWsOPj4D0
 tLwmnawqPuxxkCkhKafry2u80v24g9hRqy+kt3NbDPT2hxVxEu2XXABRL3AFuyHWlml8
 rxVaGBTf81iHqDjq9PglBVoIWuc9CY6wXl1zJ9by6/7RijQK2sE/K+1UxaIP1ut3kerI
 16mbLCti7LJPy/bJahAjRz/7kGo8pt7/wEtLo7MZULQZSUJqiwN4SkAHtpkuAsEQfWBV
 usvg==
X-Gm-Message-State: AOAM5317vb94V6aSftskNNtq/BkkNihPjUbg1lBLhLnrdVa8fWS5g/c6
 srFam+gxWyAx1HoBIf0NpBY=
X-Google-Smtp-Source: ABdhPJwtZVljF4KXdkFa4DRFgZCtXatbuarB7Sq4rE94lahO0P7dfBA/i9+1Qx78AxAYNpY/gCrTrw==
X-Received: by 2002:a17:90b:f98:b0:1bf:70fe:90af with SMTP id
 ft24-20020a17090b0f9800b001bf70fe90afmr2773507pjb.6.1647323727442; 
 Mon, 14 Mar 2022 22:55:27 -0700 (PDT)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a634755000000b00368f3ba336dsm18679369pgk.88.2022.03.14.22.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 22:55:27 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v4 2/3] dt-bindings: edac: nuvoton: add NPCM memory controller
Date: Tue, 15 Mar 2022 13:55:03 +0800
Message-Id: <20220315055504.27671-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220315055504.27671-1-ctcchien@nuvoton.com>
References: <20220315055504.27671-1-ctcchien@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added device tree binding documentation for Nuvoton BMC
NPCM memory controller.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..97469294f4ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Memory Controller
+
+maintainers:
+  - Medad CChien <ctcchien@nuvoton.com>
+
+description: |
+  The Nuvoton BMC SoC supports DDR4 memory with and without ECC (error
+  correction check).
+
+  The memory controller supports single bit error correction, double bit
+  error detection (in-line ECC in which a section (1/8th) of the
+  memory device used to store data is used for ECC storage).
+
+  Note, the bootloader must configure ECC mode for the memory controller.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm845-memory-controller
+      - nuvoton,npcm750-memory-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: uncorrectable error interrupt
+      - description: correctable error interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: ue
+      - const: ce
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    ahb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        mc: memory-controller@f0824000 {
+            compatible = "nuvoton,npcm750-memory-controller";
+            reg = <0x0 0xf0824000 0x0 0x1000>;
+            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+
-- 
2.17.1

