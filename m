Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CEA64E7CF
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 08:34:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYLTL3QCkz2xl6
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 18:34:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rqv6ctUP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rqv6ctUP;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYLQk32Pxz304s
	for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2022 18:32:14 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id n3so1204269pfq.10
        for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2022 23:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmFkFrSKnE5UGV/FeBagKO6cow8ZrY/ENIxZIsA8ZEo=;
        b=Rqv6ctUPh65ooObUJAc+XBE63AmQwLkaQjwUl5tlyK0bXkU2Tj8rLaxwvw475iArhg
         QMAhdKYDDqxHGIpWfi9QbKmuA4ovYujkBXIgSkI565jZhVq8j4gnACL+3swSv6v19Kz9
         HQ1G2EMLwInxAYHK2DULn0aIV5HZjFzZjt/YQpigtbIMOF6mzJh1Xab/jdaCz4Tw+Fdp
         ngcuTCvQhxl8itbB9HLd5dv2Lwo2F+4HDzyh9BkL8Noj2pJVl61IqNRluNmGAn52zACo
         AAqPlScoKHzThh0jLhdyZ+JwWUerpZEp4yGXO2gNQ9W77dWzYdOBta2eh0oi+9Ast+zQ
         /U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmFkFrSKnE5UGV/FeBagKO6cow8ZrY/ENIxZIsA8ZEo=;
        b=iRs2rnctA19Vz9eC9weSbxl6oZFKAUxLyHMprHy0kbU4vmy5BMY6oAIOY3yHY+VBZz
         3VzZ7vPf6o9Si1xGvDfMQoIj0ajP/WwuFWVPXnHl2LR4tRO8Csl6/gDd+FqK+3bMZrvF
         9MOJEYVuefeWK1oBTuTgWdrtVktu40sFruH/dpYFfrWqYd8ZuBVDcmZngKJaUFSq8eQp
         XdMtTBGZj1rH+sCggA0zVsAh57KBifE8jw03KhoEBy8yqm8a/ysmP/Trh73PpmZxYR1j
         R4y+DXLt818bWPc7+KjYqkHTLj2Q4XrwgxxRAkvRN/J21rM5rKK49nzU1z3H56d1DOui
         Rt8w==
X-Gm-Message-State: ANoB5plOBXU8Dqi1IX7A59894yA/RI5IUBy6Tz3Trm83QIlUWZ8/i+Tz
	Hzb61Bl7197B2ZODEALAbJU=
X-Google-Smtp-Source: AA0mqf6ithiPn84o576XYEzrdVRRYLuLgSHP7552KuoA1fiuLqt+OGGzM2EAAydlcbTIbSwcmvzpQA==
X-Received: by 2002:aa7:9243:0:b0:566:900d:5ae8 with SMTP id 3-20020aa79243000000b00566900d5ae8mr29818336pfp.24.1671175932028;
        Thu, 15 Dec 2022 23:32:12 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 193-20020a6217ca000000b00574cf11aaf3sm770123pfx.208.2022.12.15.23.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 23:32:11 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski@linaro.org
Subject: [PATCH v16 2/3] dt-bindings: edac: nuvoton: Add document for NPCM memory controller
Date: Fri, 16 Dec 2022 15:31:40 +0800
Message-Id: <20221216073141.3289309-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216073141.3289309-1-milkfafa@gmail.com>
References: <20221216073141.3289309-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, benjaminfair@google.com, Rob Herring <robh@kernel.org>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, ctcchien@nuvoton.com, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Nuvoton NPCM memory controller.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../memory-controllers/nuvoton,npcm-mc.yaml   | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml
new file mode 100644
index 000000000000..0e752a673453
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nuvoton,npcm-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Memory Controller
+
+maintainers:
+  - Marvin Lin <kflin@nuvoton.com>
+  - Stanley Chu <yschu@nuvoton.com>
+
+description: |
+  The Nuvoton BMC SoC supports DDR4 memory with and without ECC (error
+  correction check).
+
+  The memory controller supports single bit error correction, double bit
+  error detection (in-line ECC in which a section (1/8th) of the memory
+  device used to store data is used for ECC storage).
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
+    ahb {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        mc: memory-controller@f0824000 {
+            compatible = "nuvoton,npcm750-memory-controller";
+            reg = <0xf0824000 0x1000>;
+            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.34.1

