Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 532D0781648
	for <lists+openbmc@lfdr.de>; Sat, 19 Aug 2023 03:09:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rrkD+ZxJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSLHz1JcCz3cSV
	for <lists+openbmc@lfdr.de>; Sat, 19 Aug 2023 11:09:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rrkD+ZxJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=ptda=ee=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSLHL4QFBz3bP2;
	Sat, 19 Aug 2023 11:09:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71E4A6142D;
	Sat, 19 Aug 2023 01:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63F0C433C7;
	Sat, 19 Aug 2023 01:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692407352;
	bh=9Tf4XWdyF0gnUvKdLPaOFUMb1gsm5vaORMOYX7HsTiI=;
	h=From:To:Cc:Subject:Date:From;
	b=rrkD+ZxJLxgoW1Wx2VSZzqv8e8csnq+L8Z5NQzsALCMs7ZlZ8H/bXOS99RYDYMzMW
	 TsL+oL2OjwXeplw3tx4QgzP8+Oj24uHiaGokF8InVAtmwlD0acmUjqCWpHN9xpHgjm
	 W9wX17sUwMpfTfunlDuuIbn8vJ4TkY5JcqL//1MKLe7Z+sRF4ciTpp/ECl67IpPxI0
	 wxDQiiL+oLzzS4HSmQnh+gEW4OkzOc9z/Cy7niMMV9KYlVm/dULMKsMj2meBcFOExc
	 wyiHEVzY4jSISz3ujwdswSyhXoclRW7+nmOYgdcpnZxu95VJKVdpyfRXyjgaIaVE/K
	 OOHVm45K/RSvw==
Received: (nullmailer pid 916158 invoked by uid 1000);
	Sat, 19 Aug 2023 01:09:10 -0000
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH] dt-bindings: pinctrl: aspeed: Allow only defined pin mux node properties
Date: Fri, 18 Aug 2023 20:09:06 -0500
Message-Id: <20230819010907.916061-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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

The Aspeed pinctrl bindings are missing an additionalProperties/
unevaluatedProperties schemas on the child pin mux nodes which means any
undefined properties are allowed. In addition, using
'additionalProperties' for child nodes with any name works better than a
pattern matching everything with an if/then schema to select nodes only.

With 'additionalProperties' added, 'pins' and 'bias-disable'
properties need to be added as they were not defined. A $ref to
pinmux-node.yaml which defines the common property types was also
missing.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Really 'pins' should have some constraints, but I don't know what the
possible values are. Happy to add if someone can tell me what.
---
 .../pinctrl/aspeed,ast2400-pinctrl.yaml       |  52 ++++----
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       |  56 ++++----
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 120 +++++++++---------
 3 files changed, 113 insertions(+), 115 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index bef85c25cdef..37c0a74c7c01 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -25,30 +25,32 @@ properties:
   reg:
     maxItems: 2
 
-patternProperties:
-  '^.*$':
-    if:
-      type: object
-    then:
-      patternProperties:
-        "^function|groups$":
-          $ref: /schemas/types.yaml#/definitions/string
-          enum: [ ACPI, ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15,
-                  ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, DDCCLK, DDCDAT,
-                  EXTRST, FLACK, FLBUSY, FLWP, GPID, GPID0, GPID2, GPID4, GPID6, GPIE0,
-                  GPIE2, GPIE4, GPIE6, I2C10, I2C11, I2C12, I2C13, I2C14, I2C3, I2C4,
-                  I2C5, I2C6, I2C7, I2C8, I2C9, LPCPD, LPCPME, LPCRST, LPCSMI, MAC1LINK,
-                  MAC2LINK, MDIO1, MDIO2, NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2,
-                  NDCD3, NDCD4, NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4,
-                  NDTS4, NRI1, NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, OSCCLK, PWM0,
-                  PWM1, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, RGMII1, RGMII2, RMII1,
-                  RMII2, ROM16, ROM8, ROMCS1, ROMCS2, ROMCS3, ROMCS4, RXD1, RXD2, RXD3,
-                  RXD4, SALT1, SALT2, SALT3, SALT4, SD1, SD2, SGPMCK, SGPMI, SGPMLD,
-                  SGPMO, SGPSCK, SGPSI0, SGPSI1, SGPSLD, SIOONCTRL, SIOPBI, SIOPBO,
-                  SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1DEBUG, SPI1PASSTHRU,
-                  SPICS1, TIMER3, TIMER4, TIMER5, TIMER6, TIMER7, TIMER8, TXD1, TXD2,
-                  TXD3, TXD4, UART6, USB11D1, USB11H2, USB2D1, USB2H1, USBCKI, VGABIOS_ROM,
-                  VGAHS, VGAVS, VPI18, VPI24, VPI30, VPO12, VPO24, WDTRST1, WDTRST2]
+additionalProperties:
+  $ref: pinmux-node.yaml#
+  additionalProperties: false
+
+  properties:
+    pins: true
+    bias-disable: true
+
+  patternProperties:
+    "^function|groups$":
+      enum: [ ACPI, ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15,
+              ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, DDCCLK, DDCDAT,
+              EXTRST, FLACK, FLBUSY, FLWP, GPID, GPID0, GPID2, GPID4, GPID6, GPIE0,
+              GPIE2, GPIE4, GPIE6, I2C10, I2C11, I2C12, I2C13, I2C14, I2C3, I2C4,
+              I2C5, I2C6, I2C7, I2C8, I2C9, LPCPD, LPCPME, LPCRST, LPCSMI, MAC1LINK,
+              MAC2LINK, MDIO1, MDIO2, NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2,
+              NDCD3, NDCD4, NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4,
+              NDTS4, NRI1, NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, OSCCLK, PWM0,
+              PWM1, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, RGMII1, RGMII2, RMII1,
+              RMII2, ROM16, ROM8, ROMCS1, ROMCS2, ROMCS3, ROMCS4, RXD1, RXD2, RXD3,
+              RXD4, SALT1, SALT2, SALT3, SALT4, SD1, SD2, SGPMCK, SGPMI, SGPMLD,
+              SGPMO, SGPSCK, SGPSI0, SGPSI1, SGPSLD, SIOONCTRL, SIOPBI, SIOPBO,
+              SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1DEBUG, SPI1PASSTHRU,
+              SPICS1, TIMER3, TIMER4, TIMER5, TIMER6, TIMER7, TIMER8, TXD1, TXD2,
+              TXD3, TXD4, UART6, USB11D1, USB11H2, USB2D1, USB2H1, USBCKI, VGABIOS_ROM,
+              VGAHS, VGAVS, VPI18, VPI24, VPI30, VPO12, VPO24, WDTRST1, WDTRST2]
 
 allOf:
   - $ref: pinctrl.yaml#
@@ -56,8 +58,6 @@ allOf:
 required:
   - compatible
 
-additionalProperties: false
-
 examples:
   - |
     syscon: scu@1e6e2000 {
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index 14c391f16899..863da5d80826 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -37,32 +37,34 @@ properties:
       0: compatible with "aspeed,ast2500-gfx", "syscon"
       1: compatible with "aspeed,ast2500-lhc", "syscon"
 
-patternProperties:
-  '^.*$':
-    if:
-      type: object
-    then:
-      patternProperties:
-        "^function|groups$":
-          $ref: /schemas/types.yaml#/definitions/string
-          enum: [ ACPI, ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15,
-                  ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, DDCCLK, DDCDAT,
-                  ESPI, FWSPICS1, FWSPICS2, GPID0, GPID2, GPID4, GPID6, GPIE0, GPIE2,
-                  GPIE4, GPIE6, I2C10, I2C11, I2C12, I2C13, I2C14, I2C3, I2C4, I2C5,
-                  I2C6, I2C7, I2C8, I2C9, LAD0, LAD1, LAD2, LAD3, LCLK, LFRAME, LPCHC,
-                  LPCPD, LPCPLUS, LPCPME, LPCRST, LPCSMI, LSIRQ, MAC1LINK, MAC2LINK,
-                  MDIO1, MDIO2, NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4,
-                  NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2,
-                  NRI3, NRI4, NRTS1, NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PNOR, PWM0,
-                  PWM1, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, RGMII1, RGMII2, RMII1,
-                  RMII2, RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12, SALT13,
-                  SALT14, SALT2, SALT3, SALT4, SALT5, SALT6, SALT7, SALT8, SALT9, SCL1,
-                  SCL2, SD1, SD2, SDA1, SDA2, SGPS1, SGPS2, SIOONCTRL, SIOPBI, SIOPBO,
-                  SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1CS1, SPI1DEBUG,
-                  SPI1PASSTHRU, SPI2CK, SPI2CS0, SPI2CS1, SPI2MISO, SPI2MOSI, TIMER3,
-                  TIMER4, TIMER5, TIMER6, TIMER7, TIMER8, TXD1, TXD2, TXD3, TXD4, UART6,
-                  USB11BHID, USB2AD, USB2AH, USB2BD, USB2BH, USBCKI, VGABIOSROM, VGAHS,
-                  VGAVS, VPI24, VPO, WDTRST1, WDTRST2]
+additionalProperties:
+  $ref: pinmux-node.yaml#
+  additionalProperties: false
+
+  properties:
+    pins: true
+    bias-disable: true
+
+  patternProperties:
+    "^function|groups$":
+      enum: [ ACPI, ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15,
+              ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, DDCCLK, DDCDAT,
+              ESPI, FWSPICS1, FWSPICS2, GPID0, GPID2, GPID4, GPID6, GPIE0, GPIE2,
+              GPIE4, GPIE6, I2C10, I2C11, I2C12, I2C13, I2C14, I2C3, I2C4, I2C5,
+              I2C6, I2C7, I2C8, I2C9, LAD0, LAD1, LAD2, LAD3, LCLK, LFRAME, LPCHC,
+              LPCPD, LPCPLUS, LPCPME, LPCRST, LPCSMI, LSIRQ, MAC1LINK, MAC2LINK,
+              MDIO1, MDIO2, NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4,
+              NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2,
+              NRI3, NRI4, NRTS1, NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PNOR, PWM0,
+              PWM1, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, RGMII1, RGMII2, RMII1,
+              RMII2, RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12, SALT13,
+              SALT14, SALT2, SALT3, SALT4, SALT5, SALT6, SALT7, SALT8, SALT9, SCL1,
+              SCL2, SD1, SD2, SDA1, SDA2, SGPS1, SGPS2, SIOONCTRL, SIOPBI, SIOPBO,
+              SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1CS1, SPI1DEBUG,
+              SPI1PASSTHRU, SPI2CK, SPI2CS0, SPI2CS1, SPI2MISO, SPI2MOSI, TIMER3,
+              TIMER4, TIMER5, TIMER6, TIMER7, TIMER8, TXD1, TXD2, TXD3, TXD4, UART6,
+              USB11BHID, USB2AD, USB2AH, USB2BD, USB2BH, USBCKI, VGABIOSROM, VGAHS,
+              VGAVS, VPI24, VPO, WDTRST1, WDTRST2]
 
 allOf:
   - $ref: pinctrl.yaml#
@@ -71,8 +73,6 @@ required:
   - compatible
   - aspeed,external-nodes
 
-additionalProperties: false
-
 examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 859a1889dc1e..612464aef98b 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -23,65 +23,65 @@ properties:
   compatible:
     const: aspeed,ast2600-pinctrl
 
-patternProperties:
-  '^.*$':
-    if:
-      type: object
-    then:
-      properties:
-        function:
-          $ref: /schemas/types.yaml#/definitions/string
-          enum: [ ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15, ADC2,
-                  ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMC, ESPI, ESPIALT,
-                  FSI1, FSI2, FWQSPI, FWSPIABR, FWSPID, FWSPIWP, GPIT0, GPIT1, GPIT2, GPIT3,
-                  GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1, GPIU2, GPIU3, GPIU4, GPIU5,
-                  GPIU6, GPIU7, I2C1, I2C10, I2C11, I2C12, I2C13, I2C14, I2C15, I2C16,
-                  I2C2, I2C3, I2C4, I2C5, I2C6, I2C7, I2C8, I2C9, I3C3, I3C4, I3C5,
-                  I3C6, JTAGM, LHPD, LHSIRQ, LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ,
-                  MACLINK1, MACLINK2, MACLINK3, MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4,
-                  NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2,
-                  NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4,
-                  NRTS1, NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PWM0, PWM1, PWM10, PWM11,
-                  PWM12, PWM13, PWM14, PWM15, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, PWM8,
-                  PWM9, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3, RMII4,
-                  RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12, SALT13, SALT14,
-                  SALT15, SALT16, SALT2, SALT3, SALT4, SALT5, SALT6, SALT7, SALT8,
-                  SALT9, SD1, SD2, SGPM1, SGPM2, SGPS1, SGPS2, SIOONCTRL, SIOPBI, SIOPBO,
-                  SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1ABR, SPI1CS1, SPI1WP, SPI2,
-                  SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11, TACH12, TACH13, TACH14,
-                  TACH15, TACH2, TACH3, TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0,
-                  THRU1, THRU2, THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12,
-                  UART13, UART6, UART7, UART8, UART9, USBAD, USBADP, USB2AH, USB2AHP,
-                  USB2BD, USB2BH, VB, VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3, WDTRST4 ]
-
-        groups:
-          $ref: /schemas/types.yaml#/definitions/string
-          enum: [ ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15, ADC2,
-                  ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMCG1, EMMCG4,
-                  EMMCG8, ESPI, ESPIALT, FSI1, FSI2, FWQSPI, FWSPIABR, FWSPID, FWSPIWP,
-                  GPIT0, GPIT1, GPIT2, GPIT3, GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1,
-                  GPIU2, GPIU3, GPIU4, GPIU5, GPIU6, GPIU7, HVI3C3, HVI3C4, I2C1, I2C10,
-                  I2C11, I2C12, I2C13, I2C14, I2C15, I2C16, I2C2, I2C3, I2C4, I2C5,
-                  I2C6, I2C7, I2C8, I2C9, I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD, LHSIRQ,
-                  LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ, MACLINK1, MACLINK2, MACLINK3,
-                  MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4, NCTS1, NCTS2, NCTS3, NCTS4,
-                  NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2,
-                  NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, NRTS4,
-                  OSCCLK, PEWAKE, PWM0, PWM1, PWM10G0, PWM10G1, PWM11G0, PWM11G1, PWM12G0,
-                  PWM12G1, PWM13G0, PWM13G1, PWM14G0, PWM14G1, PWM15G0, PWM15G1, PWM2,
-                  PWM3, PWM4, PWM5, PWM6, PWM7, PWM8G0, PWM8G1, PWM9G0, PWM9G1, QSPI1,
-                  QSPI2, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3, RMII4,
-                  RXD1, RXD2, RXD3, RXD4, SALT1, SALT10G0, SALT10G1, SALT11G0, SALT11G1,
-                  SALT12G0, SALT12G1, SALT13G0, SALT13G1, SALT14G0, SALT14G1, SALT15G0,
-                  SALT15G1, SALT16G0, SALT16G1, SALT2, SALT3, SALT4, SALT5, SALT6,
-                  SALT7, SALT8, SALT9G0, SALT9G1, SD1, SD2, SD3, SGPM1, SGPM2, SGPS1, SGPS2,
-                  SIOONCTRL, SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1,
-                  SPI1ABR, SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11,
-                  TACH12, TACH13, TACH14, TACH15, TACH2, TACH3, TACH4, TACH5, TACH6,
-                  TACH7, TACH8, TACH9, THRU0, THRU1, THRU2, THRU3, TXD1, TXD2, TXD3,
-                  TXD4, UART10, UART11, UART12G0, UART12G1, UART13G0, UART13G1, UART6,
-                  UART7, UART8, UART9, USBA, USBB, VB, VGAHS, VGAVS, WDTRST1, WDTRST2,
-                  WDTRST3, WDTRST4]
+additionalProperties:
+  $ref: pinmux-node.yaml#
+  additionalProperties: false
+
+  properties:
+    function:
+      enum: [ ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15, ADC2,
+              ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMC, ESPI, ESPIALT,
+              FSI1, FSI2, FWQSPI, FWSPIABR, FWSPID, FWSPIWP, GPIT0, GPIT1, GPIT2, GPIT3,
+              GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1, GPIU2, GPIU3, GPIU4, GPIU5,
+              GPIU6, GPIU7, I2C1, I2C10, I2C11, I2C12, I2C13, I2C14, I2C15, I2C16,
+              I2C2, I2C3, I2C4, I2C5, I2C6, I2C7, I2C8, I2C9, I3C3, I3C4, I3C5,
+              I3C6, JTAGM, LHPD, LHSIRQ, LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ,
+              MACLINK1, MACLINK2, MACLINK3, MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4,
+              NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2,
+              NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4,
+              NRTS1, NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PWM0, PWM1, PWM10, PWM11,
+              PWM12, PWM13, PWM14, PWM15, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, PWM8,
+              PWM9, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3, RMII4,
+              RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12, SALT13, SALT14,
+              SALT15, SALT16, SALT2, SALT3, SALT4, SALT5, SALT6, SALT7, SALT8,
+              SALT9, SD1, SD2, SGPM1, SGPM2, SGPS1, SGPS2, SIOONCTRL, SIOPBI, SIOPBO,
+              SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1ABR, SPI1CS1, SPI1WP, SPI2,
+              SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11, TACH12, TACH13, TACH14,
+              TACH15, TACH2, TACH3, TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0,
+              THRU1, THRU2, THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12,
+              UART13, UART6, UART7, UART8, UART9, USBAD, USBADP, USB2AH, USB2AHP,
+              USB2BD, USB2BH, VB, VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3, WDTRST4 ]
+
+    groups:
+      enum: [ ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15, ADC2,
+              ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMCG1, EMMCG4,
+              EMMCG8, ESPI, ESPIALT, FSI1, FSI2, FWQSPI, FWSPIABR, FWSPID, FWSPIWP,
+              GPIT0, GPIT1, GPIT2, GPIT3, GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1,
+              GPIU2, GPIU3, GPIU4, GPIU5, GPIU6, GPIU7, HVI3C3, HVI3C4, I2C1, I2C10,
+              I2C11, I2C12, I2C13, I2C14, I2C15, I2C16, I2C2, I2C3, I2C4, I2C5,
+              I2C6, I2C7, I2C8, I2C9, I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD, LHSIRQ,
+              LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ, MACLINK1, MACLINK2, MACLINK3,
+              MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4, NCTS1, NCTS2, NCTS3, NCTS4,
+              NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2,
+              NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, NRTS4,
+              OSCCLK, PEWAKE, PWM0, PWM1, PWM10G0, PWM10G1, PWM11G0, PWM11G1, PWM12G0,
+              PWM12G1, PWM13G0, PWM13G1, PWM14G0, PWM14G1, PWM15G0, PWM15G1, PWM2,
+              PWM3, PWM4, PWM5, PWM6, PWM7, PWM8G0, PWM8G1, PWM9G0, PWM9G1, QSPI1,
+              QSPI2, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3, RMII4,
+              RXD1, RXD2, RXD3, RXD4, SALT1, SALT10G0, SALT10G1, SALT11G0, SALT11G1,
+              SALT12G0, SALT12G1, SALT13G0, SALT13G1, SALT14G0, SALT14G1, SALT15G0,
+              SALT15G1, SALT16G0, SALT16G1, SALT2, SALT3, SALT4, SALT5, SALT6,
+              SALT7, SALT8, SALT9G0, SALT9G1, SD1, SD2, SD3, SGPM1, SGPM2, SGPS1, SGPS2,
+              SIOONCTRL, SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1,
+              SPI1ABR, SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11,
+              TACH12, TACH13, TACH14, TACH15, TACH2, TACH3, TACH4, TACH5, TACH6,
+              TACH7, TACH8, TACH9, THRU0, THRU1, THRU2, THRU3, TXD1, TXD2, TXD3,
+              TXD4, UART10, UART11, UART12G0, UART12G1, UART13G0, UART13G1, UART6,
+              UART7, UART8, UART9, USBA, USBB, VB, VGAHS, VGAVS, WDTRST1, WDTRST2,
+              WDTRST3, WDTRST4]
+
+    pins: true
+    bias-disable: true
 
 allOf:
   - $ref: pinctrl.yaml#
@@ -89,8 +89,6 @@ allOf:
 required:
   - compatible
 
-additionalProperties: false
-
 examples:
   - |
     syscon: scu@1e6e2000 {
-- 
2.40.1

