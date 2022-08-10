Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CFC58F035
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 18:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2w7k0PxBz3bYy
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 02:17:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.41; helo=mail-io1-f41.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2w6y45Hdz2yn3;
	Thu, 11 Aug 2022 02:16:42 +1000 (AEST)
Received: by mail-io1-f41.google.com with SMTP id d187so5776814iof.4;
        Wed, 10 Aug 2022 09:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=kiGU7zOWuRr6D2fojapSvUuackH6COPGpWOffYlVWS0=;
        b=qfVC/Jn+ybuVhUvpTHeZiK5FSrVeF/NJdeR6RIHRebdtZ1ybadMnyJgpH/M9LRVy9D
         WmWV3exQte7cexNOemZGle7BMmq/5OXI958PnzOmZhmyiVRqhAeTB1q3p/hz8IspoKpd
         0GX4rtDpaSZsg83t0SSGg42tAcC216DjnXcdFmwo0RaVzvr0K9dsie5UlSeNFFtpCqqI
         MJM9yGR0pZcSqTw4zKEjM2G/XKnb1MXUgK1n+kWn16vkOsF0Hy/OX1UtJnAbd5E4mdYH
         MXcUt6SWFxC3fz3Aq9Qxki/myv9H74lt5IRtS9Fo22MFa4x3Nd6f2jOUqcUU6IBvdlAg
         AUPQ==
X-Gm-Message-State: ACgBeo1OT+wu8tVZ6oUrXAob/1+QRpXeAbj/ee/pz1eADv+2RdC7FaBX
	A/W1mKTF/ic/+kPt8dOFkA==
X-Google-Smtp-Source: AA6agR6fftMUcfA/VrqYL6f8ap5o+zuI9m+Us8vMfhi4k1mHAwni95l8MMFQpez6QgSJkwKaqsr7hw==
X-Received: by 2002:a6b:14cc:0:b0:684:7904:1576 with SMTP id 195-20020a6b14cc000000b0068479041576mr7727715iou.130.1660148199820;
        Wed, 10 Aug 2022 09:16:39 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id z17-20020a056602081100b0067885c5fd94sm2496974iow.29.2022.08.10.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 09:16:39 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/2] dt-bindings: mfd: aspeed,ast2x00-scu: Convert to DT schema format
Date: Wed, 10 Aug 2022 10:16:35 -0600
Message-Id: <20220810161635.73936-3-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810161635.73936-1-robh@kernel.org>
References: <20220810161635.73936-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Convert the aspeed,ast2[456]00-scu binding to DT schema format.

The original binding was missing '#address-cells', '#size-cells',
'ranges', and child nodes, so add them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 110 ++++++++++++++++++
 .../devicetree/bindings/mfd/aspeed-scu.txt    |  48 --------
 2 files changed, 110 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-scu.txt

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
new file mode 100644
index 000000000000..1689b986f441
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed System Control Unit
+
+description:
+  The Aspeed System Control Unit manages the global behaviour of the SoC,
+  configuring elements such as clocks, pinmux, and reset.
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+  - Andrew Jeffery <andrew@aj.id.au>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2400-scu
+          - aspeed,ast2500-scu
+          - aspeed,ast2600-scu
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+patternProperties:
+  '^p2a-control@[0-9a-f]+$':
+    description: See Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
+    type: object
+
+  '^pinctrl(@[0-9a-f]+)?$':
+    oneOf:
+      - $ref: /schemas/pinctrl/aspeed,ast2400-pinctrl.yaml
+      - $ref: /schemas/pinctrl/aspeed,ast2500-pinctrl.yaml
+      - $ref: /schemas/pinctrl/aspeed,ast2600-pinctrl.yaml
+
+  '^interrupt-controller@[0-9a-f]+$':
+    description: See Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
+    type: object
+
+  '^silicon-id@[0-9a-f]+$':
+    description: Unique hardware silicon identifiers within the SoC
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - aspeed,ast2400-silicon-id
+              - aspeed,ast2500-silicon-id
+              - aspeed,ast2600-silicon-id
+          - const: aspeed,silicon-id
+
+      reg:
+        description:
+          The reg should be the unique silicon id register, and not backwards
+          compatible one in eg. the 2600.
+        minItems: 1
+        items:
+          - description: silicon id information registers
+          - description: unique chip id registers
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - '#address-cells'
+  - '#size-cells'
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@1e6e2000 {
+        compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
+        reg = <0x1e6e2000 0x1a8>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e6e2000 0x1000>;
+
+        silicon-id@7c {
+            compatible = "aspeed,ast2500-silicon-id", "aspeed,silicon-id";
+            reg = <0x7c 0x4>, <0x150 0x8>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
deleted file mode 100644
index 857ee33f7329..000000000000
--- a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-The Aspeed System Control Unit manages the global behaviour of the SoC,
-configuring elements such as clocks, pinmux, and reset.
-
-Required properties:
-- compatible:	One of:
-		"aspeed,ast2400-scu", "syscon", "simple-mfd"
-		"aspeed,ast2500-scu", "syscon", "simple-mfd"
-
-- reg:		contains the offset and length of the SCU memory region
-- #clock-cells: should be set to <1> - the system controller is also a
-	clock provider
-- #reset-cells: should be set to <1> - the system controller is also a
-	reset line provider
-
-Example:
-
-syscon: syscon@1e6e2000 {
-	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
-	reg = <0x1e6e2000 0x1a8>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
-
-Silicon ID
------------------
-
-Families have unique hardware silicon identifiers within the SoC.
-
-Required properties:
-
- - compatible:		"aspeed,silicon-id" or:
-			"aspeed,ast2400-silicon-id" or
-			"aspeed,ast2500-silicon-id" or
-			"aspeed,ast2600-silicon-id"
-
- - reg:			offset and length of the silicon id information
-			optionally, a second offset and length describes the unique chip id
-
-			The reg should be the unique silicon id register, and
-			not backwards compatible one in eg. the 2600.
-
-Example:
-
-
-silicon-id@7c {
-        compatible = "aspeed,ast2500-silicon-id", "aspeed,silicon-id";
-        reg = <0x7c 0x4 0x150 0x8>;
-};
-- 
2.34.1

