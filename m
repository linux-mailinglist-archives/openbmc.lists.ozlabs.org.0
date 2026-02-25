Return-Path: <openbmc+bounces-1412-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BoaGOS+nmnsXAQAu9opvQ
	(envelope-from <openbmc+bounces-1412-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 25 Feb 2026 10:20:36 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC7E194CDF
	for <lists+openbmc@lfdr.de>; Wed, 25 Feb 2026 10:20:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLTZV36kkz3dXC;
	Wed, 25 Feb 2026 20:20:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772011202;
	cv=none; b=SpJ+ghcBrvn2JfDioCB53QyqwwFAIajI1GZblqxLqCd6Z16bPPAogNAQQKMMbCT/ESPDM1KZM7C8j9nXIUeXBePVTPrvTdCPf+VvBLZVJ+P0TR45Pvt5NuScEj5cYQ8mMKRZKwJIB6Q7GKf8WRd1WcoFPJt5aKSNDgHGvxXVUjH7aBd216UkA/Smu9ENDBnVepXLm+wGDr3MpHM07LWj1vdaEEoqMp7jjV0E5i9q/PRFHiPfSak55FC26OmSjYVu6tf1PWaf146gAjMDqzN5U74Cy4uJUkG1zduBRUyn3FWCbERS+PTS13Gqwadfa0d4WNJ+9na7/V0sza4oRMVQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772011202; c=relaxed/relaxed;
	bh=4GE1UuB5Zf3febGkFeJcabfLeF/rQloilvat6kJRzwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NUb1NPMsxnO0tXxPrUlnXRSPxXRkOvNcUTraMm/O3dJ3NiKeoNcH4dfPOPw90p1xntpm0j8A6dQfw0C/C7Of99IOI8rcOKWDvx1BVEbTHd6+WzE4/L29HZ/DYH3UE/YyExlVVgbXy5TSqKjBvO5IPOwIaxflnkc0eZNFd3pFMm+XrP3KJhFmpVrnDZjhYVFoRXCgnLqTc19cqkWyAk7SmdkJbOlRyn2om4ckzi08BF8cCg43R9C8/sliEHunKpLS2ZKN8ePp8fDyw+DY703kgJShIcJuGTVu7QqFXgowtER0LpAHM9TxuITCJNKPA8OLUeCO9Ow6oxA+bBlzEulRKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLTZT57Lpz3dX5;
	Wed, 25 Feb 2026 20:20:01 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 25 Feb
 2026 17:19:41 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 25 Feb 2026 17:19:41 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 25 Feb 2026 17:19:39 +0800
Subject: [PATCH v25 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260225-upstream_i2c-v25-2-9f4bdd954f3f@aspeedtech.com>
References: <20260225-upstream_i2c-v25-0-9f4bdd954f3f@aspeedtech.com>
In-Reply-To: <20260225-upstream_i2c-v25-0-9f4bdd954f3f@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Rayn Chen
	<rayn_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772011180; l=2721;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=oX37qsTcUQZ/XyFfLT9VnkE5sPvidHdjowEh6vs+5BE=;
 b=QqlvBQCChB3mqPzpYxnPzXFaa4Be4013ejFg7dEOh7fjspFug+AfMSLos4WUMeDHySrX0r48S
 mrEb9/haromC8gX4n8AtgegaCnyD1KHHhlsUjsaHtaF/bSOUTRPgVcQ
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.50 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan_chen@aspeedtech.com,openbmc@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-1412-lists,openbmc=lfdr.de];
	NEURAL_HAM(-0.00)[-0.970];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: ADC7E194CDF
X-Rspamd-Action: no action

The AST2600 I2C controller supports three transfer modes (byte, buffer,
DMA). Add "aspeed,transfer-mode" so DT can select the preferred transfer
method per controller instance. Also add the "aspeed,global-regs"
phandle to reference the AST2600 global registers syscon/regmap used by
the controller.

These properties apply only to the AST2600 binding and are not part of
the legacy binding, which uses a mixed controller/target register layout
and does not have the split register blocks or these new configuration
registers. Legacy DTs remain unchanged.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../bindings/i2c/aspeed,ast2600-i2c.yaml           | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
index 077be85137c9..c45c8ceaf897 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -37,6 +37,33 @@ properties:
   resets:
     maxItems: 1
 
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
@@ -59,4 +86,6 @@ examples:
       resets = <&syscon ASPEED_RESET_I2C>;
       clock-frequency = <100000>;
       interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+      aspeed,global-regs = <&i2c_global>;
+      aspeed,transfer-mode = "buffer";
     };

-- 
2.34.1


