Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE12654BC3
	for <lists+openbmc@lfdr.de>; Fri, 23 Dec 2022 04:31:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdXmF14DXz3bVZ
	for <lists+openbmc@lfdr.de>; Fri, 23 Dec 2022 14:31:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eiKDhrRi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eiKDhrRi;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdXjf0lGcz3bPD
	for <openbmc@lists.ozlabs.org>; Fri, 23 Dec 2022 14:29:41 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id c7so2503638pfc.12
        for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2022 19:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04Pq7MkT+QYZidf+j7cMLtCJPnocBGHBHBGxy1XfZlE=;
        b=eiKDhrRitL5X7q82QImmYTLqGN3/rojsRvebXvRXziiZLvsAzFFznqh9e5kWgNa5Fq
         VJxoUNYQUEjNDm5QPSlpBSlWRq7HfmwwPRUCHKB6kaS0WcSV/I0t4IDE9e7YEjTWbgjy
         R2sd1k6MhPq6fCZ+PZQjO9dvGBTru8LafLhdyG7H4E3QhZ4Zfus4AV4fFDxJj4hLoYMz
         vVp3fd5iWoxI5Rd5PypOBWdU4J2pnNy4khOxjPSMcT/UFYvwQjn65LpMd+HiB0Tv/9kZ
         yJpJVXSePfUTG25WiB5vdi6nWPAaIG6oA7Yr4i7Y9csrTqOEqQH7aU/j/9UDquHUr3oy
         zrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04Pq7MkT+QYZidf+j7cMLtCJPnocBGHBHBGxy1XfZlE=;
        b=sGKlF8I9DLOR4E1/Wcx/D+n2cqSD7MK3quXHWlapP8D2imXI8fY3pe1319EQSaEdX1
         iJMQVU80O6eGpbgsY9fwEEImZbHTaAXlQbrzf/QIDlVB3EoWCF9zXQsuZ1PM7f8E40Fl
         SGWOeUtGarDnbvTPpeJJnYzrwLOgTBkC2ILyzpBHTmH/Ck758f8Xhiv7wXw3t9J9VFMs
         UyCSdXxgCVn+8JCaHXIHoDDmaj3d+GOMvJCOaPmyjya3IxOttCMChPqtg+020tsnPM/x
         oSCPTJQqoHo08bxSWBCcBnFD2uD/efl33+RfxZQnlA77iFTcehpOS1Ycc4E4UWgD4sEh
         a4og==
X-Gm-Message-State: AFqh2kqBSjsIqgsbSyM4h/Wq4GCqQLcwmBXPWrDsWLEaPxwhH5Awk9LT
	MpMr7eKKunILD3wjpnoV3K0=
X-Google-Smtp-Source: AMrXdXvt2lWXgZj5PD6wg5sd+uLWfCCJD30dRedp8RD5v4RR5vQTGESsaCIV4BjsQh0lwKBT2PGvdg==
X-Received: by 2002:a05:6a00:1d03:b0:573:a0a0:c5d2 with SMTP id a3-20020a056a001d0300b00573a0a0c5d2mr9368639pfx.7.1671766179660;
        Thu, 22 Dec 2022 19:29:39 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id w192-20020a6282c9000000b00575448ab0e9sm1376854pfd.123.2022.12.22.19.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 19:29:39 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	robh+dt@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org,
	benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com
Subject: [PATCH v17 2/3] dt-bindings: edac: nuvoton: Add document for NPCM memory controller
Date: Fri, 23 Dec 2022 11:28:58 +0800
Message-Id: <20221223032859.3055638-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221223032859.3055638-1-milkfafa@gmail.com>
References: <20221223032859.3055638-1-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Herring <robh@kernel.org>, KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, ctcchien@nuvoton.com, kflin@nuvoton.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Nuvoton NPCM memory controller.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../nuvoton,npcm-memory-controller.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..ac1a5a17749d
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nuvoton,npcm-memory-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Memory Controller
+
+maintainers:
+  - Marvin Lin <kflin@nuvoton.com>
+  - Stanley Chu <yschu@nuvoton.com>
+
+description: |
+  The Nuvoton BMC SoC supports DDR4 memory with or without ECC (error correction
+  check).
+
+  The memory controller supports single bit error correction, double bit error
+  detection (in-line ECC in which a section (1/8th) of the memory device used to
+  store data is used for ECC storage).
+
+  Note, the bootloader must configure ECC mode for the memory controller.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-memory-controller
+      - nuvoton,npcm845-memory-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+
+    mc: memory-controller@f0824000 {
+        compatible = "nuvoton,npcm750-memory-controller";
+        reg = <0xf0824000 0x1000>;
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1

