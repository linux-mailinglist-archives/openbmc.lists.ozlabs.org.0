Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39E4CA0AD
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 10:26:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7pdj1Xpwz3brN
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 20:26:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lingdd6g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lingdd6g; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7pc76SgJz3brY
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 20:24:55 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id t5so1398945pfg.4
 for <openbmc@lists.ozlabs.org>; Wed, 02 Mar 2022 01:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ogow4DiJjDktRfj4hcio5HqKMsSdPYDh3kYUtkpLBD0=;
 b=lingdd6g7q8/UiV48cU4Vyvp0EvmSgJciUFxe5a5cOud+7ZqKFtjqRTq050oPfJEoS
 uos95crCxAFnySkP7Gzo9EX+DMV0YvtDiU16etjaUCcis6ARd0SmzYIpMzCtnQx9ZIuP
 QRCSh0+2/SBvvJ73l+qKZXvBKamttACEO1cOr8joyaSWDPVzImdBRutShfUxHIApO9+j
 vtDxGDiLrLyDZ7lrJb3Pgr43Hn+56ylqqhmm5M5sRhgNLRgNEziZ6mxXIQl2Uw4eIfb/
 II56FZ/3KXwUYSIqNSJUfDdkwtHEPRdoRLHV0Hxxc2DkHY1bGn38fQBRzDdY6GpoNDx8
 IF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ogow4DiJjDktRfj4hcio5HqKMsSdPYDh3kYUtkpLBD0=;
 b=Vez6ltkLGlxzWCrWHoZuqnybLPC0kopTRXI2v00jyZZN7Bc7wOA/P17FQTuVtbtwp5
 +fLYXR37xUI3OD1S/UzLU44JdQEDnCbyebJSMIMqMi2ngI9Uq0PoTcfH8LQ4tqosH0nQ
 HX9G20pdHjOKNv+lmqAa8YtTx9rhAbFXU4HR9bypWQB0Dzqnfygaet0GeFFF+trb+X2w
 k8PzWyEyKobXw9BMJ/sryC5F56Kx4BYGaWbxRJ4bqY7SziJFkM/WuAVtfYC64zFDaj4a
 DtbGt76aFnuVk4pFq94sDmBJAzx05NB5UAq2QIEzqRm+T1J2hBSU6gcau+uOGZJsWg1K
 WfMA==
X-Gm-Message-State: AOAM530PHbctwRT8+QHWs/8sOZjePzWTxo5zuQ4dRrxMUeTwZ26jCWbC
 BvclhkXdfvVdwAOShjFV3Qc=
X-Google-Smtp-Source: ABdhPJx+eXTu+5IPKHxuqlJY7ZgWlcuuRD5Zk9LmMPCBlrtqE+s9rjTw0bk6RdbOhX9DruZmHhFxgA==
X-Received: by 2002:a63:d47:0:b0:373:598c:e0aa with SMTP id
 7-20020a630d47000000b00373598ce0aamr25225085pgn.243.1646213094357; 
 Wed, 02 Mar 2022 01:24:54 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.140])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a056a00085600b004f397d1f3b5sm21351153pfk.171.2022.03.02.01.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 01:24:53 -0800 (PST)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com
Subject: [PATCH v2 2/3] dt-bindings: edac: npcm-edac.yaml
Date: Wed,  2 Mar 2022 17:24:33 +0800
Message-Id: <20220302092434.16625-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302092434.16625-1-ctcchien@nuvoton.com>
References: <20220302092434.16625-1-ctcchien@nuvoton.com>
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
 Medad CChien <ctcchien@nuvoton.com>, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the device tree bindings for the EDAC driver npcm-edac.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 .../devicetree/bindings/edac/npcm-edac.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/npcm-edac.yaml

diff --git a/Documentation/devicetree/bindings/edac/npcm-edac.yaml b/Documentation/devicetree/bindings/edac/npcm-edac.yaml
new file mode 100644
index 000000000000..936e9787ec80
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/npcm-edac.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/npcm-edac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Memory Controller EDAC
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
+      - nuvoton,npcm8xx-memory-controller
+      - nuvoton,npcm7xx-memory-controller
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
+            compatible = "nuvoton,npcm7xx-memory-controller";
+            reg = <0x0 0xf0824000 0x0 0x1000>;
+            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+
-- 
2.17.1

