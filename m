Return-Path: <openbmc+bounces-873-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 660FDC52E6B
	for <lists+openbmc@lfdr.de>; Wed, 12 Nov 2025 16:10:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d66Jp5qJXz2yv7;
	Thu, 13 Nov 2025 02:10:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762960202;
	cv=none; b=QqYACXTwR020S4NaauwJzcOTVglxNqw3J7pcsNiod6kuQq/aJGHyIouR8h56JtFjTPSzx8lgjhoDNLvkMAiCEt8DyvRJweHtqNxG0GrLfD1M1hmL0ANREWQBETgCtWrzRSXNhdHKd5bP3B12NqZ2M5i1ONEHfkAzTo6pFT2wBV541Bf0y2JqpnPELwMGb86FyKJWDyWDxKwOkVLEcx7e20L7BzQejPUyZFWRuf4pzDlpCZvWtl79E2phfIVUhEQOQoMKNmouf1atPLWCGyhXS+E6aRITjH0Gvb8u4ix4Ig7S+eqAN1j67tCw+CpgEOOqUae1r9lqebbPOfh1ZgV2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762960202; c=relaxed/relaxed;
	bh=DtGZMMsw8V99KZAgaHQJPZ8CoLj3tmmTUHgBPIq1Q90=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O/j9EcabEdtVnFtQRT/2oOqArAZ2HRIqLvjDRYOvmsOKYPRNdYBWEPkUpKyzhgaT3YIijWhjmmlGK5gIDLH69Z9MMUdkhQajSNrzRFn0C96VT2PSExjEtFsHgaAyHH5UKIVQeIKoB00rIW8QRbBfz6H4NYvKewYNQsW2SWi1D2xSymLARockq6V93tdhFJd8/NqC/mvdcbDKwjjYkXPRdleqZFIYZViIO/Mi+pd8/71/SDEsy81zUmHNzTl4NidE7UlkLnj8Cs4EE8CX4sCRlnDdRpZelexDnMxb2fsB9VsSiMXmd02C2tn1yV4hniE2Jy4Z8kzN52z9J6IxWdQp0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MoqMYMpw; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MoqMYMpw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d66Jm57JHz2yhD
	for <openbmc@lists.ozlabs.org>; Thu, 13 Nov 2025 02:09:59 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47755de027eso7108125e9.0
        for <openbmc@lists.ozlabs.org>; Wed, 12 Nov 2025 07:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762960196; x=1763564996; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DtGZMMsw8V99KZAgaHQJPZ8CoLj3tmmTUHgBPIq1Q90=;
        b=MoqMYMpwCi+wk5KV4gFFgJs3T/5HihOAazsQLsaZu0+JuHQaA0F1CKQ0DOCWMWYZlJ
         FqZ9djK43kzcILUKmL+AtSnEe0S2tE4ZiI1UKuGoKZ9ZMxiTsfYLyz1zh6XzoF3GwGzi
         uPba4VpAELlviKrSPLw9VZLoeFInyPOU0+VsJePgiry3aMhwRMbsyxRh4brDwXX7VrFg
         RU7ImgcGESgTIO3h4C4Nbq1dvrVareiKNrwzTUTK+Ot9baWB+UJFTWZlQWpmv/wGwDon
         auR59cyqL/FcJsToAUf06maPvTKlZ2HALYAvK5byfoOsJCe+CyjXslGpcwZBO3kTF3pM
         mOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960196; x=1763564996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtGZMMsw8V99KZAgaHQJPZ8CoLj3tmmTUHgBPIq1Q90=;
        b=K4XI+9QSV2slQ0ZNFJPKCglfRc0Ni4X2gVldKZpksTTGd1OpBNeA2ZagSu3W6GERtU
         5VVtxXVhwvuj1PTJUhHnCLjqx2gacBoBkkYSVJ3qg7/5MlzR62jAQsCEjvITkArk38Py
         HIQR0/fYtsHMvsJlbfPE3KDmNtYmV0bRSPzouCg0VB4f8JYWeRC1MrSp02xDFfLmj+Lq
         +8qHlzY+m51R2CRgfor9K6Z1cNBMXQqrN2bFaUQ6+JDne9rl4YRIJ7XwIylrLVQHuvls
         nYuyrGCjd1JLjGMC3C/7Ma4npbawQhqMEOyf5x7eJqpqk4R7qv8uPL/MjdbDSX4gw1OQ
         dgAQ==
X-Gm-Message-State: AOJu0Yyg5q6i/p/L05o6bfmuhSNbzxxt5YhDuPoqU+3lr+q7ZReh9Tyo
	+2AvHyhkAyTTcq1ox8gV3v3Oi1HTnCGshsoibVAEyBdOZi+riSy8jUos
X-Gm-Gg: ASbGncsvVNj2JGlgCWBsn98GL0+QlqcYQqz9fvGf31qriJG5Fun5LtOxBRfedM+YNr7
	il9sXvArmfWTf/ez2587+hpctAmzAY8n4KS2bDD9nCReY515tLn0tnz3PU0mB1zDf6z/hJ2mN7Z
	AEGceFNgToEkc5kfRNXIfGo1coWGerp+vXEdodnple1YrpwFmOLqRmrjnxWWEhLSnYIFwB8Cayj
	yZgYI+oFlsg3yqpjBt3Ao1prMi2vexnZnrrS4ULRaWUadbTraQkCdsz8kU3J2GP0k3/GOnHV3tX
	QOT//kj44ZFMR8/mz+JkjAQ+ZxDxvWD8Wod58INb5mGdq7SxLNGftn7ZMUveUp5BKkph0pb3Jk0
	m0rN/iM437gMmtlBkTXtvqqckqzwdAK/JiCzukjwgTrKoG+LVOXiPg1VgvAqS3bMUor9QuCcrnE
	iH8MEaPk7QBJU=
X-Google-Smtp-Source: AGHT+IGviozO1G+47njNKiErvjncEx+jjY7PIlVohsiPQB3KFMy0e3qBbtmFS5UVJasOoahpIh4XCg==
X-Received: by 2002:a05:600c:3b11:b0:477:6b4f:3fbd with SMTP id 5b1f17b1804b1-477870b935dmr27381355e9.38.1762960195571;
        Wed, 12 Nov 2025 07:09:55 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62bf40sm33272447f8f.9.2025.11.12.07.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:09:54 -0800 (PST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	joel@jms.id.au,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2] spi: dt-bindings: nuvoton,npcm-pspi: Convert to DT schema
Date: Wed, 12 Nov 2025 17:09:50 +0200
Message-Id: <20251112150950.1680154-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert the Nuvoton NPCM PSPI binding to DT schema format.

Also update the binding to fix shortcoming:
 * Drop clock-frequency property: it is never read in the NPCM PSPI
   driver and has no effect.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
Addressed comments from:
	- Krzysztof Kozlowski: https://patchwork.ozlabs.org/project/openbmc/patch/20251110081457.1008316-1-tmaimon77@gmail.com/

Changes since version 1:
	- Fix commit subject and message.
	- Drop unnecessary description.
	- Use GPIO defines.
	- Add clock-names property.

 .../bindings/spi/nuvoton,npcm-pspi.txt        | 36 ----------
 .../bindings/spi/nuvoton,npcm-pspi.yaml       | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
deleted file mode 100644
index a4e72e52af59..000000000000
--- a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Nuvoton NPCM Peripheral Serial Peripheral Interface(PSPI) controller driver
-
-Nuvoton NPCM7xx SOC support two PSPI channels.
-
-Required properties:
- - compatible : "nuvoton,npcm750-pspi" for Poleg NPCM7XX.
-				"nuvoton,npcm845-pspi" for Arbel NPCM8XX.
- - #address-cells : should be 1. see spi-bus.txt
- - #size-cells : should be 0. see spi-bus.txt
- - specifies physical base address and size of the register.
- - interrupts : contain PSPI interrupt.
- - clocks : phandle of PSPI reference clock.
- - clock-names: Should be "clk_apb5".
- - pinctrl-names : a pinctrl state named "default" must be defined.
- - pinctrl-0 : phandle referencing pin configuration of the device.
- - resets : phandle to the reset control for this device.
- - cs-gpios: Specifies the gpio pins to be used for chipselects.
-            See: Documentation/devicetree/bindings/spi/spi-bus.txt
-
-Optional properties:
-- clock-frequency : Input clock frequency to the PSPI block in Hz.
-		    Default is 25000000 Hz.
-
-spi0: spi@f0200000 {
-	compatible = "nuvoton,npcm750-pspi";
-	reg = <0xf0200000 0x1000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pspi1_pins>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&clk NPCM7XX_CLK_APB5>;
-	clock-names = "clk_apb5";
-	resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI1>
-	cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
-};
diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.yaml
new file mode 100644
index 000000000000..db0fb872020a
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,npcm-pspi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Peripheral SPI (PSPI) Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+description:
+  Nuvoton NPCM Peripheral Serial Peripheral Interface (PSPI) controller.
+  Nuvoton NPCM7xx SOC supports two PSPI channels.
+  Nuvoton NPCM8xx SOC support one PSPI channel.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-pspi # Poleg NPCM7XX
+      - nuvoton,npcm845-pspi # Arbel NPCM8XX
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: PSPI reference clock.
+
+  clock-names:
+    items:
+      - const: clk_apb5
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
+    #include "dt-bindings/gpio/gpio.h"
+    spi0: spi@f0200000 {
+        compatible = "nuvoton,npcm750-pspi";
+        reg = <0xf0200000 0x1000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pspi1_pins>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk NPCM7XX_CLK_APB5>;
+        clock-names = "clk_apb5";
+        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI1>;
+        cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+    };
+
-- 
2.34.1


