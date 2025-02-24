Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93535A41504
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 07:00:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1VSm6Llvz3dS0
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 17:00:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740376797;
	cv=none; b=bpKBKNayTzUQ4LNQ6rnanf49PaX2IdzYqtH862rRxgd9uFWNb7+IMy6qTi61f8/V8/x/b3LRodEOFx7LZ4w7SnK3whf2DvKGnxqto4MQiyU+LRrxk8K1rvcEaOvZXM+nWeYj0QAR7c1zL2D3AiLmmrOo84nNM8FmqxqT0wKAZdo3QyvR1kf9+SMdbSZJOgFdml60cSiYaRwDVwDisQbt/eFfPHL3AwGlVLmNgzotCpvd+H7kWkWnYpC2iufw+YLqQ86dBotMazGJtBkgARFf9Whkw8Y18qMYwYvoWqGQ9pVEdUCEaEZGJFxTm0Ho6tlu+84U7Ir9ezhSs+QLg5V4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740376797; c=relaxed/relaxed;
	bh=SmOGtJnwvXAm2XsZztdte1SqP5W8S3VZiQDWEkQ4xoM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jj6IDKg/8flVeribgZ52UjEljqhdDNEkfPOrmLE65VgD0OAfnBzvHY3Zad/vPs8ZAItpJCD+pq8zsr7s5L2+j5Qqa5cQf6CJdiV6opvkYncO+nmXG+/MZusFRVtu0Cr5ypryJOyGx8n+V9amMcT+PrQfGoFJsDjU+4kQtXdbWqjqv+fKPdrxe9rDOz6swtHrE64ExrbCPsQpPlWBjxfWaUX/5YGDso5CFanyjR64GTnujMdoHE7ZRNndGmfzNaTgyN3HIgwMpX7+htKn1xh3yD6vXh/lPGRBq5xrHKu6NhFcpn7siZ/WCBaAUvsiD8T5rdQNhpKmGdPdrqomWuh7sA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1VSY0LWMz2ypV;
	Mon, 24 Feb 2025 16:59:57 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 24 Feb
 2025 13:59:36 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 24 Feb 2025 13:59:36 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
Date: Mon, 24 Feb 2025 13:59:34 +0800
Message-ID: <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
and description for ast2600-i2cv2.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index 5b9bd2feda3b..356033d18f90 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -44,12 +44,60 @@ properties:
     description: frequency of the bus clock in Hz defaults to 100 kHz when not
       specified
 
+  multi-master:
+    type: boolean
+    description:
+      states that there is another master active on this bus
+
+  aspeed,enable-dma:
+    type: boolean
+    description: |
+      I2C bus enable dma mode transfer.
+
+      ASPEED ast2600 platform equipped with 16 I2C controllers that share a
+      single DMA engine. DTS files can specify the data transfer mode to/from
+      the device, either DMA or programmed I/O. However, hardware limitations
+      may require a DTS to manually allocate which controller can use DMA mode.
+      The "aspeed,enable-dma" property allows control of this.
+
+      In cases where one the hardware design results in a specific
+      controller handling a larger amount of data, a DTS would likely
+      enable DMA mode for that one controller.
+
+  aspeed,enable-byte:
+    type: boolean
+    description: |
+      I2C bus enable byte mode transfer.
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of i2c global register node.
+
 required:
   - reg
   - compatible
   - clocks
   - resets
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-i2cv2
+
+    then:
+      properties:
+        reg:
+          minItems: 2
+      required:
+        - aspeed,global-regs
+    else:
+      properties:
+        aspeed,global-regs: false
+        aspeed,enable-dma: false
+
 unevaluatedProperties: false
 
 examples:
@@ -66,3 +114,13 @@ examples:
       interrupts = <0>;
       interrupt-parent = <&i2c_ic>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c1: i2c@80 {
+      compatible = "aspeed,ast2600-i2cv2";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      aspeed,global-regs = <&i2c_global>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1

