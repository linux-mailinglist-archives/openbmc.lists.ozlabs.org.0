Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE1F4E372E
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 04:03:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMxC01BvRz2xsM
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 14:03:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M8P1oLah;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M8P1oLah; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMx9P5LLJz2yHL
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 14:02:17 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id w8so14322802pll.10
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 20:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xJ9GfFhZddrKv5u5rmWflw0LJ2oRtvcB/gDMBiL/rp4=;
 b=M8P1oLahsOLmJTBWPq6/rIKRcHQ7HtBE1Imq6Cr/Wbqea6x0iHQIheO0+NBo6TX8ds
 lEPh6RUteANxutB9Kg+HGuMLHmq74rVfWmzWh3qoAYEP/5BzUuWd1s4T+GN1msD9AXEl
 N0/L+JchOwoAL9CKwtuFMyBy8oWR4+jcBE350hgylL0HRRcEZN2mikFiLnt2ItJRxDwJ
 E33bTj+I74uYJyAb1fPVJiXDmInACOsu/xuIKITq4GbUu6UF7JNmRekYkVSl8HREDeZi
 ueHQ7kFOwcK3eHzjpPI3HSQbJNmbnRw4nF6QDYBfwRJ3fbKqxQrAG0S1CQ+QRPJTTSTu
 CQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xJ9GfFhZddrKv5u5rmWflw0LJ2oRtvcB/gDMBiL/rp4=;
 b=aP/7V/LTm8PKShJRl+uck9+zpzKBRQ/akz+mOPU4LQEihIB4UiiLAosyW63Rmxh3zz
 SMpIb6ltQ9rPPeSpKVT/er7lf1apj7kZSzKxWNokMCOehn5FT18V9Hayho5HqEVUolp1
 koEfkMZf+LTV4EZ7PAoWA1XS8jfgQOv5rmbGrtyJOtKh4D561X98/Wm412sheWJlT+tY
 r3BBCslDPxmr5Ddze/QDD3SJDwNtb6TETsqkQ1OV2DpD+vWy2X0DMJYPsHcjSa5fSMxo
 4ggP/5i3IsP1yxcP6icPWYe8DclPfvIne6o24MjDjtzKu7W4trkc8gRqiQMszYiX92eC
 nWSw==
X-Gm-Message-State: AOAM531c6vpsXsexvLRDV3PIXIzI/83Xbs1qi6ZP11FajQCy/P6CHjyn
 TMQSiKdu9InhFlsJ3Q9iPaM=
X-Google-Smtp-Source: ABdhPJxejzOS7CmfYnr2p9hbK5RbYdFK7B1XowQFBemWphsmp6UG/GFFh1k8JhjVutbh78bBFULRMA==
X-Received: by 2002:a17:902:d4cc:b0:154:3174:e4ff with SMTP id
 o12-20020a170902d4cc00b001543174e4ffmr13652769plg.134.1647918135489; 
 Mon, 21 Mar 2022 20:02:15 -0700 (PDT)
Received: from localhost.localdomain ([180.217.158.152])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056a0022ce00b004fabe9fac23sm16660pfj.151.2022.03.21.20.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 20:02:14 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v6 2/3] dt-bindings: edac: nuvoton: add NPCM memory controller
Date: Tue, 22 Mar 2022 11:01:51 +0800
Message-Id: <20220322030152.19018-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322030152.19018-1-ctcchien@nuvoton.com>
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

