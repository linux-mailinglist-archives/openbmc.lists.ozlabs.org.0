Return-Path: <openbmc+bounces-447-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEA5B25F39
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 10:42:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2dyv6h0Nz2xQ6;
	Thu, 14 Aug 2025 18:42:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755160935;
	cv=none; b=g1Zf9kb71TANycjQ8C0embez0SMZncRdRIXuLHkFO5rEaprBHtpXqYsSA8gVKutCbsPjKzQEiAPK2BKByNJiUgIjFjuAqYOW3HrY/Jo3pulxWaW7SJczJxo75mW+a/MaucvLftCYMzEIuhflI8mBEBz6ke95DzGlxfXiTWA+zgep0eVbDSMp8tA2T26BMgsl9jLjDU5F7w41jOim9GuiK66SaG2YWwihTjdNnYtA8XcWKOJp1Wg2cihe7U8UcKKvs6OocBIfvO8ye+LZ4V6/XUHCL/pKB4hDS8ea7GG/tYnL3z0Rbe20CBg4J/ei6ppbFlMtXTmzaZ3O2o9EGuLC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755160935; c=relaxed/relaxed;
	bh=v8lw86+YpmhQ/yYr2/JhdgNkgqjAlMh/4iG6N3ZqJRU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KUwsxJ183dGR8yze4eH9nIfaKskVRmCCVT/f/oEAEwzzJ+jOKcAulsIpdsitQLxNgTQHVMwW5yY1FS0TUoL5eRs7s8fX+pioLF4LFKVEuZW3MsfgOwn89uDHlAuBubyvH/CuYeNSkHriyqHKc4lUP5cnKZuClzBBRu/TRk+y8B5+SgGLri9prZtbjN8+JUrPFtoXOEw8qtCZ6luKEXJSTQFFP5Y+HeKoROPlGmvLvtGfD+PDO51zJKFgQflgCPgGHDVUm4HtmR2Z6nF0TXP7PU1LrtrH32lxVyhNsdiWwcj5sLozpgxiKH5TPjudSWmcvxSfwGxFpJIcCMK37uG7cA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2dyv2Czfz30WF;
	Thu, 14 Aug 2025 18:42:15 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 16:41:56 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 14 Aug 2025 16:41:56 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v17 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add transfer-mode and global-regs properties and update example
Date: Thu, 14 Aug 2025 16:41:54 +0800
Message-ID: <20250814084156.1650432-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
References: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
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

- Add property "aspeed,global-regs" to get phandle set global
register, for register mode selection and clock divider control.
- Add an optional property "aspeed,transfer-mode" to
allow device tree to specify the desired transfer method used
by each I2C controller instance.
- Update example to demonstrate usage of 'aspeed,global-regs' and
'aspeed,transfer-mode' for AST2600 I2C controller.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index 5b9bd2feda3b..2a9f7d1d2ea1 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -44,6 +44,34 @@ properties:
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
+      Only one mode can be selected per controller.
+      On AST2600, each controller supports all three modes.
+      If not specified, buffer mode is used by default.
+    enum:
+      - byte
+      - buffer
+      - dma
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      The phandle of i2c global register node, For control the i2c register
+      define selection, clock divider mode selection and clock divider control.
+
 required:
   - reg
   - compatible
@@ -66,3 +94,14 @@ examples:
       interrupts = <0>;
       interrupt-parent = <&i2c_ic>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c1: i2c@80 {
+      compatible = "aspeed,ast2600-i2c-bus";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      aspeed,global-regs = <&i2c_global>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+      aspeed,transfer-mode = "buffer";
+    };
-- 
2.34.1


