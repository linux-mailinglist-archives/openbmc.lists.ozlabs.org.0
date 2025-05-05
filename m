Return-Path: <openbmc+bounces-25-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5506BAA9622
	for <lists+openbmc@lfdr.de>; Mon,  5 May 2025 16:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrkqX07Rmz2xWc;
	Tue,  6 May 2025 00:46:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746456375;
	cv=none; b=L5zbuZsk1TVe2dEUt3HLAxZnDbzH5U+7ISVrPiB+ecgezxifUrmc8GZZKTwGzvRmxdp8y89rqIhajEbreICDmzyZKsuEGBbKYYGdBVMuozELVxtoZvB1VJjT/2f7xBMtwAN8vFQzu7jl9OJVyFLMLvut5EgBz/TWOM2dN/925mJD1j8Fh0/ModJyFvFexD8fwHj62BUtF3YMab4TmhVoKQ0zRV9RTBdZBpEvvZVsXOehs5PL3Ys5OsmDw4sYi6abOyFmuI/cAwiaifmtXLn1UDOcxuLTl+tfxPZTIXotZH8mDPJikQ9jFq2Eb/J2NIi1SS5xVk98O91Li1ljH1zhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746456375; c=relaxed/relaxed;
	bh=JlsKhkoz828MEtVy2v5Fu7Luz+EY3Qo135bmujvMVE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXOZotE1c2rg4xZNHQfAybE/6P8N5SUIsQyv5muUFJlM8KyxAa1DUoGJfGrUvUHCbu7BHZueisGWbkUuFv3JSOWZ+dyNBnsS+uZ9Afiii7iPbABxhRIwzeuXt4lNA5S9j6MQ14drGdYQKk462+IFYunQXZKlZIofPUDUvTzg5EpOm2LFYz9RWnSdX3LSzxXXM9b58GPA0tyms/nYkaPKoi+e661xRyuInc25lGkIzWBUpSrPh6xDX1ea1c0jQxzGR4vYJvfphGLyZMKsBBhlKLgf4Za1xWAWBFBDcyUVEU146FJgWleTNuVVD1ZDp/20QXhLOW64P0RoRRG2kdCjPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g2L9k+WP; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g2L9k+WP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrkqV2brKz2xVq;
	Tue,  6 May 2025 00:46:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C8E561155;
	Mon,  5 May 2025 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC7CC4CEEF;
	Mon,  5 May 2025 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456371;
	bh=x7tnnriKWWyb+OOuz9Jm2Bv/3oa5SNZPvGNweMUWMIU=;
	h=From:To:Cc:Subject:Date:From;
	b=g2L9k+WPZ+3OvN9rVu72Dcp1LHEzvAtWshioq4cwfDRz5dhPuLGkql2COEPoTeti1
	 r6Wyz8I2gy/Rd76okDAVba4h1+yPlgChYIS6+VhXkhkZXfgMHuGPS740zXIoI1k7qG
	 +AJLi/QkoKqnk/f4Ew/DXA7Iv96yQIS/dp7Gk2oKzEE1dJhsDNThHTJL0wjBIwYGv2
	 JLPSd7yrxNnr+OXhYtLrOCstGa1Y+kIanVT5Zoh6sBPFEz8wBYu6u7JyFan7cAcc9A
	 BSJhVVLA1p6xCZZ1q5EiDISbBzSQaJU1Oamejd/CNuc4ACSFN8p/AA7NrXwPdcIZPY
	 xo9hqlVu8qB8g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert aspeed,ast2400-i2c-ic to DT schema
Date: Mon,  5 May 2025 09:46:04 -0500
Message-ID: <20250505144605.1287121-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert the Aspeed I2C interrupt controller binding to schema format.

Drop the "#address-cells" and "#size-cells" as they are unused and
incorrect anyways.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../aspeed,ast2400-i2c-ic.txt                 | 25 ----------
 .../aspeed,ast2400-i2c-ic.yaml                | 46 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 47 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
deleted file mode 100644
index 033cc82e5684..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Device tree configuration for the I2C Interrupt Controller on the AST24XX and
-AST25XX SoCs.
-
-Required Properties:
-- #address-cells	: should be 1
-- #size-cells 		: should be 1
-- #interrupt-cells 	: should be 1
-- compatible 		: should be "aspeed,ast2400-i2c-ic"
-			  or "aspeed,ast2500-i2c-ic"
-- reg			: address start and range of controller
-- interrupts		: interrupt number
-- interrupt-controller	: denotes that the controller receives and fires
-			  new interrupts for child busses
-
-Example:
-
-i2c_ic: interrupt-controller@0 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	#interrupt-cells = <1>;
-	compatible = "aspeed,ast2400-i2c-ic";
-	reg = <0x0 0x40>;
-	interrupts = <12>;
-	interrupt-controller;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
new file mode 100644
index 000000000000..6cff6a7231bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2400-i2c-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed I2C Interrupt Controller (AST24XX/AST25XX)
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-i2c-ic
+      - aspeed,ast2500-i2c-ic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#interrupt-cells'
+  - interrupts
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@0 {
+        compatible = "aspeed,ast2400-i2c-ic";
+        reg = <0x0 0x40>;
+        #interrupt-cells = <1>;
+        interrupts = <12>;
+        interrupt-controller;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b830dfeaa05f..9e37f0c14496 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2328,7 +2328,7 @@ L:	linux-i2c@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
-F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
 F:	drivers/i2c/busses/i2c-aspeed.c
 F:	drivers/irqchip/irq-aspeed-i2c-ic.c
 
-- 
2.47.2


