Return-Path: <openbmc+bounces-875-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD24FC53B3B
	for <lists+openbmc@lfdr.de>; Wed, 12 Nov 2025 18:33:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d69Vf4JP5z2yvJ;
	Thu, 13 Nov 2025 04:33:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762968826;
	cv=none; b=bj8Gl1P9TuBbmddRbq7u4JLUgbDQvu8y5uidwVFve9JajT8Ui84MJ/NbOW3nY7T0tEVRBveb1dKIyVTJi1JrOtmCVqdGX6WybMT7nMAYjEyBcAYwa6U2Ge0BSSIC3Jn8Gfkgwx9k1jEocw86T2JPU63arT6qo8KRY0jsMIj8gssHOax81VXGigglFkbo/rt9GDE9OSzVghu1XIWeohnlOKWECAvWumeB1HWSXy0f1HVA2e9YKK3RV9mN/YkGsmpV6nqNQIJ0Vs4zH+nlTcEcAgemYM4o0XHCVfon0J+DYG4nlC1QWyviDm15Fs2M3bDCpQAJAB3Gcg0/GovLnPLuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762968826; c=relaxed/relaxed;
	bh=44Kc/j2JhoyAbLrRyX1QwglgFc2dUpdlPh4jWhsbUTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hiUbat6P7wkK19XlzXc1VjxMA398h2A71gb6uY/moLi5+VP30ceT/Oz2tmwpqgrq9q5IdGLk2ZbSJGLt+1IhkUILayO2leGWrYyXwzwecFVNmS7O2kidcVcRApdxUFJvZWlppxc8Syv0RhxwZKe4UHjioswsaxaCFH2Y0wx4rSRNMeF8z9CcfvTq9AluAyACLjVOEraSA8oftAKXkSKUiCT5b2isc1Zkf3Oe4E0i0zQo6kyxiPHI3s/KpI2AZvhH+m5AqE4k+M6WPEg/F2gMLkwJDk1EbNdp/w8i1vz89dpMVSjpgVYwXWQXoF5OVce61M2crbEU/5UYyn+IvUm33w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jawQzjbo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jawQzjbo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d69Vc60lSz2yv7
	for <openbmc@lists.ozlabs.org>; Thu, 13 Nov 2025 04:33:43 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b3b29153fso614047f8f.3
        for <openbmc@lists.ozlabs.org>; Wed, 12 Nov 2025 09:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762968819; x=1763573619; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44Kc/j2JhoyAbLrRyX1QwglgFc2dUpdlPh4jWhsbUTw=;
        b=jawQzjboL/OraecBshSxrHjcXQt9JQTyDLDG5z36ZG9Cpmdsnc7dyOSw/HwBvYEy90
         zDwKUFVtH4qucYLfDjq2MPXwQUhKjpOiybop4RphoCdR6QUWDwKAX3yhIhf2c/R9k8ty
         DK4DP6Ung+JngWi76/ozbEdx9j/o6YyY/V/u3GIc/nF/qhflWLKL0rBAzwG47zbGCjjZ
         aBUODQ7nsV1WI+koPWeSuVnMAeYOx9/hWZUio/viEYRCXQUL232whzocesTEiNjt9oQS
         YpwU5SkErS+nSNZBng5F0UxWfh8IMZdtGQY+RAhK8FCUULlI8pBxJMKxemH9xEJzUcFi
         IJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968819; x=1763573619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44Kc/j2JhoyAbLrRyX1QwglgFc2dUpdlPh4jWhsbUTw=;
        b=ipxjlNhkWFdYqYD2KlUWZDEXh5ffEIPKxuCd4zkvyRf0snj+zLbnHXgHShe6eP5pUm
         RDYiJ+cUFuNE9T5N0qDe/PooY3VGagfsMomF+uwPcjODI2Ywoboj5mMi9FIkYRX5tk1d
         e1pQ2OsaZ00ZzTirLfIMISVC5njxVeVYi1rgUFp4H1xZut29aEbUWlDzrgtcJfYR8F2y
         WxachLTfu2TJ/ZLltrfBqQAdWiWfREelNcCIrIJ9HnKvqbLRSsJe8XaS23d5gHH6SBqC
         b/NZ3KeTKHv3basrwPZzxGWKJd8k0US19ywDOGGzPOjY9lPTbjABEbgWqyoa8i/J6/cl
         S+Cg==
X-Gm-Message-State: AOJu0Yxu7gGzP+RZls32G7ZcMNP9/Vw8aNFhOqfhfUA1sRr4og8gkfg4
	dwHP+b3SoaodzZzsbEv1APBFoYOnnGGMvem+q83NrIYxYOzwHtckfrk8
X-Gm-Gg: ASbGncu0Yi5SUqhVsw38o5rbsz1oNgSJGkyHIURzS9BpHExQSLeo7RLu+f2wiub+YR1
	rKXGBa1bvFZby9fWZ7q6cgB7+n8iqNRhH952dWR4Z/znEAxNuVy1xB55uKvzlz2hRSzm3QuDmhy
	dx809ej0g+3+ibfdUUpp0jN4shulOfZ0JN8xx0zYd73pDQjP+nD1htw8n9komoiaa5qfC/lHith
	3zKi557Uw1c6DUOT2vKfiMdrsMY4dsJ5N0vptZBVKIdpZ78uJGOURTMr8g4rYnj/wsO428w4z+c
	T6kEeYrZqHQnC3IVhPubflT7fDIyNAXrzywAmpmnyExV0WqvYo4eEGP/QvHD0EoKCP5pd0/6FLM
	pwuanM9QOfyVwWRYRxWLjwQVR1eI6FBWidzSqKmmhDn24J4YwYwfplEAFCb9vwa9Nt9WhPh0L3O
	8MVejGM/TrddDF/bts6kyH/A==
X-Google-Smtp-Source: AGHT+IH6Qjzo8T7i3m2l3eXDsCIqvaE7ouHOEbD83pVacao2ZlOAWd37u6dKpswf2G543Njjogyyhw==
X-Received: by 2002:a05:6000:144c:b0:42b:3bee:a7ff with SMTP id ffacd0b85a97d-42b4bb95233mr3102189f8f.24.1762968818723;
        Wed, 12 Nov 2025 09:33:38 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b29e4b9bdsm31970655f8f.32.2025.11.12.09.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 09:33:38 -0800 (PST)
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
Subject: [PATCH v1] spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema
Date: Wed, 12 Nov 2025 19:33:14 +0200
Message-Id: <20251112173314.1751671-1-tmaimon77@gmail.com>
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

Convert the Nuvoton NPCM FIU binding to DT schema format.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/spi/nuvoton,npcm-fiu.txt         | 58 -------------
 .../bindings/spi/nuvoton,npcm-fiu.yaml        | 87 +++++++++++++++++++
 2 files changed, 87 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
deleted file mode 100644
index fb38e96d395f..000000000000
--- a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* Nuvoton FLASH Interface Unit (FIU) SPI Controller
-
-NPCM FIU supports single, dual and quad communication interface.
-
-The NPCM7XX supports three FIU modules,
-FIU0 and FIUx supports two chip selects,
-FIU3 support four chip select.
-
-The NPCM8XX supports four FIU modules,
-FIU0 and FIUx supports two chip selects,
-FIU1 and FIU3 supports four chip selects.
-
-Required properties:
-  - compatible : "nuvoton,npcm750-fiu" for Poleg NPCM7XX BMC
-			     "nuvoton,npcm845-fiu" for Arbel NPCM8XX BMC
-  - #address-cells : should be 1.
-  - #size-cells : should be 0.
-  - reg : the first contains the register location and length,
-          the second contains the memory mapping address and length
-  - reg-names: Should contain the reg names "control" and "memory"
-  - clocks : phandle of FIU reference clock.
-
-Required properties in case the pins can be muxed:
-  - pinctrl-names : a pinctrl state named "default" must be defined.
-  - pinctrl-0 : phandle referencing pin configuration of the device.
-
-Optional property:
-  - nuvoton,spix-mode: enable spix-mode for an expansion bus to an ASIC or CPLD.
-
-Aliases:
-- All the FIU controller nodes should be represented in the aliases node using
-  the following format 'fiu{n}' where n is a unique number for the alias.
-  In the NPCM7XX BMC:
-  		fiu0 represent fiu 0 controller
-  		fiu1 represent fiu 3 controller
-  		fiu2 represent fiu x controller
-
-  In the NPCM8XX BMC:
-  		fiu0 represent fiu 0 controller
-  		fiu1 represent fiu 1 controller
-  		fiu2 represent fiu 3 controller
-  		fiu3 represent fiu x controller
-
-Example:
-fiu3: spi@c00000000 {
-	compatible = "nuvoton,npcm750-fiu";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
-	reg-names = "control", "memory";
-	clocks = <&clk NPCM7XX_CLK_AHB>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi3_pins>;
-	flash@0 {
-			...
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
new file mode 100644
index 000000000000..b12676da7426
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,npcm-fiu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Flash Interface Unit (FIU) SPI Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+description: |
+  NPCM FIU supports single, dual and quad communication interface.
+
+  The NPCM7XX supports three FIU modules:
+    FIU0 and FIUx support two chip selects
+    FIU3 supports four chip selects.
+
+  The NPCM8XX supports four FIU modules:
+    FIU0 and FIUx support two chip selects
+    FIU1 and FIU3 support four chip selects.
+
+  Alias convention:
+    The '/aliases' node should define:
+      For NPCM7xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux;
+      For NPCM8xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux; fiu3=&fiu1;
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-fiu # Poleg NPCM7XX
+      - nuvoton,npcm845-fiu # Arbel NPCM8XX
+
+  reg:
+    minItems: 1
+    items:
+      - description: FIU registers
+      - description: Memory-mapped flash contents (optional)
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: control
+      - const: memory
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  nuvoton,spix-mode:
+    type: boolean
+    description: Enable SPIX mode for an expansion bus to an ASIC or CPLD.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    fiu3: spi@c0000000 {
+        compatible = "nuvoton,npcm750-fiu";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfb000000 0x1000>,
+              <0x80000000 0x10000000>;
+        reg-names = "control", "memory";
+        clocks = <&clk NPCM7XX_CLK_AHB>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&spi3_pins>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+        };
+    };
-- 
2.34.1


