Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B04DBCCA
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 03:00:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJr2d6c8sz30FL
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 13:00:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iHtg4Ll0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iHtg4Ll0; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJr1355tWz30Dh
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 12:59:19 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so4204088pjb.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 18:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xJ9GfFhZddrKv5u5rmWflw0LJ2oRtvcB/gDMBiL/rp4=;
 b=iHtg4Ll0q4cyNl44XcDa8NErOtHepB9QlTJdcO1U9BDYlg+uotYRUnbIGn73BktwX6
 tjIPW6IICy5I5/cZWGOLEnlrjtl4j/e4w8d8sMrrLMa5uzwT1wVnNzVIEs0BmSdfHxAC
 v2e774+Gjpa8+eJGMMVoLRoYMv6g1BWbyMfx3lKM8sNomCWicz1S/A3Lg7slVBml9X9r
 51WfI8vml0g/lWy02sNtgaNWDGBsR7Vt366PPCxyjEtLuKgFBtcPJyPLOMiTIOjRiip9
 MvmUzqDx/3R7sKzIP1MsILL/yVwSHSfgD5HZsqjdPlWVYoujMk1fDqbypWqN0wNPMlQz
 WY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xJ9GfFhZddrKv5u5rmWflw0LJ2oRtvcB/gDMBiL/rp4=;
 b=frS7ZhvWlzbqbxV+z+AHL+YwrQ/ieW5YlYNx0jGMm46B/qjkYiA35jAr9F5z+dg0Pm
 w0fhKtaWPQgdEnfmyM7vzmFqbxirGhO1HjJnLDOEBT92QhIikZXk9UxW+N53Qk+SztEk
 bh8lbT82X42RN63oWsVRi1aFZaKb4ra4kemWu+IiO9D+bcW1dYBXkB8QxyQuVYjQiWvf
 yu2tAOOH3GW72x183UdGO1qwVayJ2XEaLBngwVVG3XzTmm0uEBC8noqXJu8w8U/+V58s
 Q9Di1ZXQrD21x9R6NXBPZ6sqqv913vd19iswkF1hkzErN9W+6MRmhLWihlYjRCGXoO2V
 Dn9g==
X-Gm-Message-State: AOAM5324NiVDrP+cZ5l7ZiHMvvGLxBTaTAJHE92SXMJVnyYeLUbZ04DU
 3i4GIo+jLX9F5vVMAjlq0Fs=
X-Google-Smtp-Source: ABdhPJyiSLGUAZ5oSsPuma8C4J6uru2hhM5qNewg1ArRv/ZAS5HLo1BS5xqDAFGnuzgGLzkvU6sUZw==
X-Received: by 2002:a17:90a:4802:b0:1c5:df70:ff66 with SMTP id
 a2-20020a17090a480200b001c5df70ff66mr13188998pjh.137.1647482357281; 
 Wed, 16 Mar 2022 18:59:17 -0700 (PDT)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 nn15-20020a17090b38cf00b001bfceefd8cfsm7945528pjb.48.2022.03.16.18.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 18:59:16 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v5 2/3] dt-bindings: edac: nuvoton: add NPCM memory controller
Date: Thu, 17 Mar 2022 09:58:53 +0800
Message-Id: <20220317015854.18864-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220317015854.18864-1-ctcchien@nuvoton.com>
References: <20220317015854.18864-1-ctcchien@nuvoton.com>
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

