Return-Path: <openbmc+bounces-863-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8758FC45543
	for <lists+openbmc@lfdr.de>; Mon, 10 Nov 2025 09:15:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4jC63Z2vz2xql;
	Mon, 10 Nov 2025 19:15:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762762514;
	cv=none; b=lMTgWWrWQRez2PIKEaChCpGFlgCxzVRzfhHX5O4IdTufCJeKoOOGz1Q4yxjXnwQ8U3ba4Ohuvqm7wFWoenbHelD4kKvtbxLyuifGTCsUe/p6sMmBgLho1St8JgTyhFAFFv9aawgnvnPybZ6MDNSYLfgRglM+d1jOU/2AgrcqvRURx5Po7bkms9R9Vo969rg9rhNjM4TjJBw19SPR0Jx0ZaQTi044hVzvs8k512HDiPNmA43NzUpIMWLxB2OCkgjMHA9Wwjk5A+IRoB54aVFJJO6lip111ECzL0LlTYHNqg5KxM4qwKf0Pa8sjqjnpbX1vy5nMiqew0QDJbdbYk56Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762762514; c=relaxed/relaxed;
	bh=SeRemWdOh6BINm57bAExN2qF+KGtIQQ7kG3okdFAQq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BjmjedTmMzThqRFk9AVKKj/CEfMivPVKSMXFG+NMaUaUvbv3hYJ1wQxQMmTA29At6weCMuoIrqXH+FWgOaLP66q0AtGpkqYuX8HbmjQgr15D907uBgmuYp4enBogXmqzVIvCS/ww7AOWyQnsnk6zj43CKQ8zfBUbz+JVDIYMX5jX8OwxhPIyLrlx8tH4xpaP57+pGLp7t1Ohw25S21TP/b5wUoAsmm07HCftpxDL6h7+yMFmWhOmbbWW3eO5nAx7cdxT1+HY+iQzNNZC23NOFwXwW7kgFclHRPVyIx875pQqatG2jZ3pj3gxlsGwcXQ9bwTZynw2wj4CAMJpj+GnXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JpWFuTkk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JpWFuTkk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4jC430Z9z2xqj
	for <openbmc@lists.ozlabs.org>; Mon, 10 Nov 2025 19:15:11 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so177452f8f.1
        for <openbmc@lists.ozlabs.org>; Mon, 10 Nov 2025 00:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762762504; x=1763367304; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SeRemWdOh6BINm57bAExN2qF+KGtIQQ7kG3okdFAQq8=;
        b=JpWFuTkkxd/LfmE6hyehKFmEtrVf1sJkETwS57mTE4iXoNn5GIb92Z/pi6XWUsXvK+
         Wkq7VDf+9am0hkQFYB2yn0dDhbIFytsajmpY7nzolS2rUqGWKjU8C3McYbFHe4Y5fvDf
         8jooqc2pGOmh+4xvweKMTw8NV32c5153zudfq4JJaWeBIokp1NqhNoZ3VNBketD3IGGg
         XOZbf9EUBlkKCSNvP1sK+QnaOj1wIkrWWcrVA7qW8YHdk5r0RRT34LH7mlWqWqWVMlkO
         82tV/GxgT+6+OjxQlh0xztzEKtmIXOcAZ+NMfzRvXNwxPIBdIAvFRqx4vxf+WDl6VxnL
         U2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762504; x=1763367304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeRemWdOh6BINm57bAExN2qF+KGtIQQ7kG3okdFAQq8=;
        b=Dj3UQS0U+qWAPXvHhpmSRtVCcprubkYJwB2T8uIJ7KmmQecwjGFR7Tzs3AjIjXSI3H
         qlYKmishMvEYupU9nGFo8GW/z5MJ1aVcZEUrChPXAGVOgRTTeyPrfq3uyoL/T2M+/zJm
         2vV5sVo+nR2BFwdGJ1ZrFrtdk/0yKSEbaDNqjRjolmkG2o48D6Drm0e9s4fRWFM6QHsc
         KGI+9zQCFwEeuRl/VGlNQ4eSjG9MhYHMIeJCpcf8VHcdBzBMiFn2BUS6OAGI1fRhrhlL
         ko7bn1TlKhceyEcmOLzm0KhizUgl42v3OdflOCo6UCg16NlUv3VgWp0Zvk/GSegcA5wr
         8PYA==
X-Gm-Message-State: AOJu0Yyxo/lj/ccf/hfT7howw9oN/3UA0i4pDimbjT1CMDeExkjtPYx9
	2QT4d+uCDLhB45kh2RQmKtfMRN+UqPfsBZQpRcp/jPZwmKKGVMXGUsCc
X-Gm-Gg: ASbGncuKN1RoOF9AW0oUdcv3wD5f1MDem6OnWO46CHS1B6Dx8oFBiGnxD72L/8yJtRz
	b8MB2hbkhtWlhby+eHvZ5hdkvcpZoxrKBfZ3PFp80pbHq5hup2DicLqbmRNcYWUAO4wSxP2TE/g
	ZRoJnm66Gb03VF/vgsGUwlTFWL6Mn3u4F10kuA3vHjb/09NzGboUL0Gyh7cRC55iXtpiRz0M8pk
	C3PG3uBFyJPwq0rqSdkUtjUhT4eUSjIfj1+jsiwak0GinBAOdbyXAT6iBSplj4n28z2xmgv3/1H
	NCZGJkeoSk6heey6PVYvWv5uyY/zKtHOOIM3+dA62X5gVD4q/Z/QCfPuFdFINyvEbXOaXogwSjj
	4xAjWRop1AZvHdbawKb72bqzeqc8yrLNvcrcCWmN1AXfPWnBj/9FCjQiX9dSyKI2+rKwHvUA56+
	zZCz6R78XA9HG7PaT/KK9Ohg==
X-Google-Smtp-Source: AGHT+IFPRvflcsKqu7bHRXK/JyFHX+r+ojZOUJvTf4Pg77kTUGLJ4kifZzrUVNK8QvjfDeCXTC/ucQ==
X-Received: by 2002:a5d:5f86:0:b0:42b:3e20:f1b3 with SMTP id ffacd0b85a97d-42b3e20f52bmr530612f8f.9.1762762503585;
        Mon, 10 Nov 2025 00:15:03 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679214asm22324568f8f.38.2025.11.10.00.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:15:03 -0800 (PST)
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
Subject: [PATCH v1] dt-bindings: spi: Convert nuvoton,npcm-pspi to DT schema
Date: Mon, 10 Nov 2025 10:14:57 +0200
Message-Id: <20251110081457.1008316-1-tmaimon77@gmail.com>
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
Remove the clock-name property since it is not used.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/spi/nuvoton,npcm-pspi.txt        | 36 ----------
 .../bindings/spi/nuvoton,npcm-pspi.yaml       | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 36 deletions(-)
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
index 000000000000..65ad40292408
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.yaml
@@ -0,0 +1,65 @@
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
+  resets:
+    maxItems: 1
+    description: PSPI module reset.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
+    spi0: spi@f0200000 {
+        compatible = "nuvoton,npcm750-pspi";
+        reg = <0xf0200000 0x1000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pspi1_pins>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk NPCM7XX_CLK_APB5>;
+        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI1>;
+        cs-gpios = <&gpio6 11 0x1>;
+    };
+
-- 
2.34.1


