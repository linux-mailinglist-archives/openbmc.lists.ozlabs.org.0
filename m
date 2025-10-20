Return-Path: <openbmc+bounces-772-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90032BEF018
	for <lists+openbmc@lfdr.de>; Mon, 20 Oct 2025 03:32:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqdFx1HKlz304h;
	Mon, 20 Oct 2025 12:32:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760923941;
	cv=none; b=PNe7FVqc5MeQymtzGRt01M/98gSYqbB9eWqaeU4wWpVM78WbCp/50AodmJwCrbXdgfE+2X8oYPAxCR9dnIgKLRm+Dx/5lh5WbmRdBN+zlL9GOjApqp+qlR2E3d+UhzJNyJKM076zHPLUBwo343aIQANAMHx7/KOkvAwQKOwSszAkKC1seQJ+NmC68SEamkJzJzxEQy0r2X6cksrhTFDpCRLc8+3vf2KBAymX9YBTGSMLcjalDg8h8KPW/SQv/x0wn/ktMMDKfPadA55QJqOGUp+jnUTTZ1gw6U+H0dsKZ5bI8GQB+OZEuQH2A4Y2PzGIf5vBApwb7eqmJGOLaxOJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760923941; c=relaxed/relaxed;
	bh=gBpO6VRQaDxhyPH6O+sj5PUhXmK/jr8u4u0axzQ0g7o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KAK7FND/V8IhoEr0GHMe3rC9SouZTNlRHYLQTf768VrUs8xMEdzhJHoX91uDqJSs70u+5b/3isqxkpSU42PDy9C+oNymyjZRRoTBf9HH1O0FKGu8cMXPVPiinXyi6H5CxmL9hrHx7f1K1R5hbRR3uRj5+UEP8KFsEUH+Td/YFXppY20kQQDenehgbUeeFVGlYkcbs6a1iltS760RpdCld3wOG2iSlBPI1h2/PmQqqK7yrzJLGPKjHaM7l0oulhiRIQoigqBiBmQJhDzarIUHJ0nHp3VeyC+6uXOrv7pLCOXysotTyEXnXgZBXRFvo93jdRAUcexeHpRprqaIV/CSew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqdFw3WHRz303B;
	Mon, 20 Oct 2025 12:32:20 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 20 Oct
 2025 09:32:01 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 20 Oct 2025 09:32:01 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v19 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add global-regs and transfer-mode properties
Date: Mon, 20 Oct 2025 09:31:58 +0800
Message-ID: <20251020013200.1858325-3-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020013200.1858325-1-ryan_chen@aspeedtech.com>
References: <20251020013200.1858325-1-ryan_chen@aspeedtech.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The AST2600 I2C controller supports three transfer modes: byte,
buffer, and DMA. To allow board designers and firmware to
explicitly select the preferred transfer mode for each controller
instance. "aspeed,transfer-mode" to allow device tree to specify
the desired transfer method used by each I2C controller instance.

And AST2600 i2c controller have two register mode, one is legacy
register layout which is mix controller/target register control
together, another is new mode which is separate controller/target
register control.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
index 2dcddb0ecc2e..7fab9281d7b1 100644
--- a/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
@@ -43,11 +43,39 @@ properties:
     description: frequency of the bus clock in Hz defaults to 100 kHz when not
       specified
 
+  aspeed,transfer-mode:
+    description: |
+      ASPEED ast2600 platform equipped with 16 I2C controllers each i2c controller
+      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buffer mode), and
+      share a DMA engine.
+      Select I2C transfer mode for this controller. Supported values are:
+        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
+        - "buffer": Use buffer (32-byte buffer) for i2c transmit. (default)
+                    Better performance then byte mode.
+        - "dma": Each controller DMA mode is shared DMA engine. The AST2600 SoC
+                 provides a single DMA engine shared for 16 I2C controllers,
+                 so only a limited number of controllers can use DMA simultaneously.
+                 Therefore, the DTS must explicitly assign which controllers are
+                 configured to use DMA.
+      On AST2600, each controller supports all three modes.
+      If not specified, buffer mode is used by default.
+    enum:
+      - byte
+      - buffer
+      - dma
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to the i2c global syscon node, containing the
+      SoC-common i2c register set.
+
 required:
   - reg
   - compatible
   - clocks
   - resets
+  - aspeed,global-regs
 
 unevaluatedProperties: false
 
@@ -58,10 +86,12 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "aspeed,ast2600-i2c-bus";
-      reg = <0x40 0x40>;
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      aspeed,global-regs = <&i2c_global>;
       clocks = <&syscon ASPEED_CLK_APB>;
       resets = <&syscon ASPEED_RESET_I2C>;
       bus-frequency = <100000>;
       interrupts = <0>;
       interrupt-parent = <&i2c_ic>;
+      aspeed,transfer-mode = "buffer";
     };
-- 
2.34.1


