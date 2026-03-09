Return-Path: <openbmc+bounces-1451-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLWoNadurmn8EAIAu9opvQ
	(envelope-from <openbmc+bounces-1451-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 09 Mar 2026 07:54:31 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDBA23478F
	for <lists+openbmc@lfdr.de>; Mon, 09 Mar 2026 07:54:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTnmg6P0Jz3cB0;
	Mon, 09 Mar 2026 17:54:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773039251;
	cv=none; b=NCogvAz1cJADtQVqbhs8M/CqpJCkF91doEWWLQzkU5wJ8YEHpJCba4SslW24/ZU+FgKj7gc4J8AlzSQeXtP3SZjDsD1Rm+5hV5zaf6zmxWWAyAqexfr28l/p/byQSQOHG8hZUiwj+wbs16lbp2FDchZESGrSC9zssfsiFlEqUgYPTBrJnGkR3jBB9oJdTT2AI27bT7V+dLHWhmhKVRW55VOSke0X+X1SCPweGc86HjhsQgaA0tqrFJIKj+UywWPgDtGDFnB3vGmuSWNfCpfr5n2SW/sfqYvHQXeOb6dqHrFtgoZpSaxntggYPX7bb37egsib1gXyCOBpWI1A1KNnYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773039251; c=relaxed/relaxed;
	bh=L0WdrOPHBiinlmWuuOWYkjfATE33JBqjsFD6TNkEf4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=klO5fy4pysE7V+dwfSxE4VeE7NTZIsQbOUuE9/Eqmrf5MoCUg+OgVDxViRQ/7+n/IEUoLyEmfmqCo3OsQ5lOEZJfpM1uG6si5KGPFykUVDphNgSBOPPYjwhSfVHgK4Oc4qtcE7vAiYUeGtBVZ81+NliWUKQgQJ6f2Q3mgv3108quGq9D/Xf1gS8sLZkf3JzcQxdHSdKKXC/OUkvr47yh9nwi9lumrIUCjlpyXMksbBax4vhesH1vRjL9rz0ZM335aRL2puX7molaPi97PViPO2SN2E34HsSZIbmMN7So+QgF2KO1V80VAt40i0u7oXDu2g+VF0RHkW9g0SjWnaoaEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTnmf3ZqYz3c9j;
	Mon, 09 Mar 2026 17:54:10 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 9 Mar
 2026 14:53:53 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 9 Mar 2026 14:53:53 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Mon, 9 Mar 2026 14:53:52 +0800
Subject: [PATCH v26 1/4] dt-bindings: i2c: Split AST2600 binding into a new
 YAML
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
Message-ID: <20260309-upstream_i2c-v26-1-5fedcff8ffe8@aspeedtech.com>
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
In-Reply-To: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773039232; l=3549;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=y16S4hcxAJwB0pyqLtb5Y4AIAVCk4wmOv1io+0cDITE=;
 b=SoSi+zPDhNAd+EyDeCFCM6wDff5eeDMU0nsYP6FH3jMluCSfRU68ZSLB0ee7XX2v0qnbhb1l/
 9hILMfeRgEdBmtMW1mTpwesylkbsaI4B0q1btbVX60Ve7sn5A3vhHHA
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2EDBA23478F
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.80:email,aspeedtech.com:mid,aspeedtech.com:email,devicetree.org:url,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FROM_NEQ_ENVFROM(0.00)[ryan_chen@aspeedtech.com,openbmc@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1451-lists,openbmc=lfdr.de];
	NEURAL_HAM(-0.00)[-0.098];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

The AST2600 I2C controller introduces a completely new register layout
with separate controller and target register blocks, unlike the mixed
register layout used by AST2400/AST2500.

Move AST2600 I2C binding from aspeed,i2c.yaml to a dedicated
aspeed,ast2600-i2c.yaml schema.

Besides the split, this also adjusts for AST2600-specific requirements.
- require two reg regions (controller register block + buffer block)
- use clock-frequency for bus speed description
- interrupts are required on AST2600
- use correct DTS coding style in example

No compatible strings are changed.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v26:
- commit message: include details of changes from original binding
- fix example property ordering to follow DTS coding style
- use consistent "AST2600" naming
---
 .../bindings/i2c/aspeed,ast2600-i2c.yaml           | 62 ++++++++++++++++++++++
 .../devicetree/bindings/i2c/aspeed,i2c.yaml        |  3 +-
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
new file mode 100644
index 000000000000..de2c359037da
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED I2C on the AST2600 SoCs
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-i2c-bus
+
+  reg:
+    items:
+      - description: controller registers
+      - description: controller buffer space
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: Desired operating frequency of the I2C bus in Hz.
+    minimum: 500
+    maximum: 4000000
+    default: 100000
+
+  resets:
+    maxItems: 1
+
+required:
+  - reg
+  - compatible
+  - clocks
+  - resets
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c@80 {
+        compatible = "aspeed,ast2600-i2c-bus";
+        reg = <0x80 0x80>, <0xc00 0x20>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&syscon ASPEED_CLK_APB>;
+        resets = <&syscon ASPEED_RESET_I2C>;
+        clock-frequency = <100000>;
+        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index 5b9bd2feda3b..d4e4f412feba 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs
+title: ASPEED I2C on the AST24XX, AST25XX SoCs
 
 maintainers:
   - Rayn Chen <rayn_chen@aspeedtech.com>
@@ -17,7 +17,6 @@ properties:
     enum:
       - aspeed,ast2400-i2c-bus
       - aspeed,ast2500-i2c-bus
-      - aspeed,ast2600-i2c-bus
 
   reg:
     minItems: 1

-- 
2.34.1


