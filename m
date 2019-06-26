Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF7562FD
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 09:16:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YZ8X59bDzDqWn
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 17:16:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jgTqN9Qt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Mf2hR8iR"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YZ7S2RQ0zDqW5;
 Wed, 26 Jun 2019 17:15:48 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EEAB61721;
 Wed, 26 Jun 2019 03:15:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 26 Jun 2019 03:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=bDsw6KjgIezE4
 hKWkzgtOU4DL3U+oK1ddciLPL0D0S8=; b=jgTqN9Qt0tKbDlrYNXZVyNrppjk4m
 6CXWrAXgwqZaLY4QPjt5tXHK7UUtZGyI8ugpEaBm6puCMqsfd3QSHF/DLq6nCs6B
 8XcRBVaptjMcMKdv+Hw1KMRevzD+e467BNY4EJ6GADwDfeTfOKcr7VBpM0/Szdaf
 +lhBKsUtgSdRwOFGp9mLqqZH71Vh1yV4JYu3lxONUbHvz69bK3SHjbOrf6B8R4/9
 /Foai8Sf2FZx/JXH7WmU3NtsB7qcgMWseJqA2WDz84N95U1P7qQ6r3JwdeoV30+a
 RmIawYcwV5nnKBj2AQtD8PX90Ia8vVFXDjzCL2v8YlDVFOmIO/LNCvarg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=bDsw6KjgIezE4hKWkzgtOU4DL3U+oK1ddciLPL0D0S8=; b=Mf2hR8iR
 wZj13vNy+U9ofaOoVPHadePDABhAjysADa5xu7FXU/SUubGr19fXXUqwUz5wTWVP
 bvLp9t90Mbpi3QEJWb0S8bVLbxaGl76J1COJcX1bRaLFsdaksvMF+V9nmgP1Q42q
 DfJeKq1PLjR4sysLuVqPgCZaW6EH94u6YClOYiiN0ha6LVbEld48wvD398SrY2zO
 shWO8KkPgGKUMugqVWH248/TRFqpKrAV0FO0iBiBjkk8DJUzl7XIxdrI6GXeEScH
 VjjhVffB+t2OjJvVP9s3VbMCGHHm5wUZUMe/CufRmiCBzCSR6JmvqRsN24zyJs6V
 Lx4wnfho/oqcdg==
X-ME-Sender: <xms:oRsTXcyFO1kJUgG0daPO_LgVBeMgDelLnuzUkEviJqxDb34x5UlHFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedt
X-ME-Proxy: <xmx:oRsTXcias8y2_Rv88h13RPQg4Vz1pbXWdgNMFREyLhofO64D2fVWVA>
 <xmx:oRsTXUlVgHMjzU9HOopndEOFDJhFkxOXJHQUDls8jtThFzLHh1ut_w>
 <xmx:oRsTXYKHQ8XXElm0-l45r7flU65FKRCCZP7JW-XclM_R9S1ekkgJzw>
 <xmx:oRsTXWLMjniddxG_YKQDBlR1cgwRFJ08CinFuvbbEUu8_1ncc_LBMg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D486380083;
 Wed, 26 Jun 2019 03:15:41 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: pinctrl: aspeed: Split bindings document in
 two
Date: Wed, 26 Jun 2019 16:44:23 +0930
Message-Id: <20190626071430.28556-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626071430.28556-1-andrew@aj.id.au>
References: <20190626071430.28556-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Have one for each of the AST2400 and AST2500. The only thing that was
common was the fact that both support ASPEED BMC SoCs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../pinctrl/aspeed,ast2400-pinctrl.txt        | 80 +++++++++++++++++++
 ...-aspeed.txt => aspeed,ast2500-pinctrl.txt} | 63 ++-------------
 2 files changed, 85 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
 rename Documentation/devicetree/bindings/pinctrl/{pinctrl-aspeed.txt => aspeed,ast2500-pinctrl.txt} (66%)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
new file mode 100644
index 000000000000..67e0325ccf2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
@@ -0,0 +1,80 @@
+=============================
+Aspeed AST2400 Pin Controller
+=============================
+
+Required properties for the AST2400:
+- compatible : 			Should be one of the following:
+				"aspeed,ast2400-pinctrl"
+				"aspeed,g4-pinctrl"
+
+The pin controller node should be the child of a syscon node with the required
+property:
+
+- compatible : 		Should be one of the following:
+			"aspeed,ast2400-scu", "syscon", "simple-mfd"
+			"aspeed,g4-scu", "syscon", "simple-mfd"
+
+Refer to the the bindings described in
+Documentation/devicetree/bindings/mfd/syscon.txt
+
+Subnode Format
+==============
+
+The required properties of pinmux child nodes are:
+- function: the mux function to select
+- groups  : the list of groups to select with this function
+
+Required properties of pinconf child nodes are:
+- groups: A list of groups to select (either this or "pins" must be
+          specified)
+- pins  : A list of ball names as strings, eg "D14" (either this or "groups"
+          must be specified)
+
+Optional properties of pinconf child nodes are:
+- bias-disable  : disable any pin bias
+- bias-pull-down: pull down the pin
+- drive-strength: sink or source at most X mA
+
+Definitions are as specified in
+Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt, with any
+further limitations as described above.
+
+For pinmux, each mux function has only one associated pin group. Each group is
+named by its function. The following values for the function and groups
+properties are supported:
+
+ACPI ADC0 ADC1 ADC10 ADC11 ADC12 ADC13 ADC14 ADC15 ADC2 ADC3 ADC4 ADC5 ADC6
+ADC7 ADC8 ADC9 BMCINT DDCCLK DDCDAT EXTRST FLACK FLBUSY FLWP GPID GPID0 GPID2
+GPID4 GPID6 GPIE0 GPIE2 GPIE4 GPIE6 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4
+I2C5 I2C6 I2C7 I2C8 I2C9 LPCPD LPCPME LPCRST LPCSMI MAC1LINK MAC2LINK MDIO1
+MDIO2 NCTS1 NCTS2 NCTS3 NCTS4 NDCD1 NDCD2 NDCD3 NDCD4 NDSR1 NDSR2 NDSR3 NDSR4
+NDTR1 NDTR2 NDTR3 NDTR4 NDTS4 NRI1 NRI2 NRI3 NRI4 NRTS1 NRTS2 NRTS3 OSCCLK PWM0
+PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII1 RMII2 ROM16 ROM8 ROMCS1
+ROMCS2 ROMCS3 ROMCS4 RXD1 RXD2 RXD3 RXD4 SALT1 SALT2 SALT3 SALT4 SD1 SD2 SGPMCK
+SGPMI SGPMLD SGPMO SGPSCK SGPSI0 SGPSI1 SGPSLD SIOONCTRL SIOPBI SIOPBO SIOPWREQ
+SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1DEBUG SPI1PASSTHRU SPICS1 TIMER3 TIMER4
+TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 TXD4 UART6 USB11D1 USB11H2 USB2D1
+USB2H1 USBCKI VGABIOS_ROM VGAHS VGAVS VPI18 VPI24 VPI30 VPO12 VPO24 WDTRST1
+WDTRST2
+
+Example
+=======
+
+syscon: scu@1e6e2000 {
+	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
+	reg = <0x1e6e2000 0x1a8>;
+
+	pinctrl: pinctrl {
+		compatible = "aspeed,g4-pinctrl";
+
+		pinctrl_i2c3_default: i2c3_default {
+			function = "I2C3";
+			groups = "I2C3";
+		};
+
+		pinctrl_gpioh0_unbiased_default: gpioh0 {
+			pins = "A8";
+			bias-disable;
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.txt
similarity index 66%
rename from Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
rename to Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.txt
index 3b7266c7c438..2f16e401338a 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.txt
@@ -1,14 +1,6 @@
-======================
-Aspeed Pin Controllers
-======================
-
-The Aspeed SoCs vary in functionality inside a generation but have a common mux
-device register layout.
-
-Required properties for g4:
-- compatible : 			Should be one of the following:
-				"aspeed,ast2400-pinctrl"
-				"aspeed,g4-pinctrl"
+=============================
+Aspeed AST2500 Pin Controller
+=============================
 
 Required properties for g5:
 - compatible : 			Should be one of the following:
@@ -23,8 +15,6 @@ The pin controller node should be the child of a syscon node with the required
 property:
 
 - compatible : 		Should be one of the following:
-			"aspeed,ast2400-scu", "syscon", "simple-mfd"
-			"aspeed,g4-scu", "syscon", "simple-mfd"
 			"aspeed,ast2500-scu", "syscon", "simple-mfd"
 			"aspeed,g5-scu", "syscon", "simple-mfd"
 
@@ -57,24 +47,6 @@ For pinmux, each mux function has only one associated pin group. Each group is
 named by its function. The following values for the function and groups
 properties are supported:
 
-aspeed,ast2400-pinctrl, aspeed,g4-pinctrl:
-
-ACPI ADC0 ADC1 ADC10 ADC11 ADC12 ADC13 ADC14 ADC15 ADC2 ADC3 ADC4 ADC5 ADC6
-ADC7 ADC8 ADC9 BMCINT DDCCLK DDCDAT EXTRST FLACK FLBUSY FLWP GPID GPID0 GPID2
-GPID4 GPID6 GPIE0 GPIE2 GPIE4 GPIE6 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4
-I2C5 I2C6 I2C7 I2C8 I2C9 LPCPD LPCPME LPCRST LPCSMI MAC1LINK MAC2LINK MDIO1
-MDIO2 NCTS1 NCTS2 NCTS3 NCTS4 NDCD1 NDCD2 NDCD3 NDCD4 NDSR1 NDSR2 NDSR3 NDSR4
-NDTR1 NDTR2 NDTR3 NDTR4 NDTS4 NRI1 NRI2 NRI3 NRI4 NRTS1 NRTS2 NRTS3 OSCCLK PWM0
-PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII1 RMII2 ROM16 ROM8 ROMCS1
-ROMCS2 ROMCS3 ROMCS4 RXD1 RXD2 RXD3 RXD4 SALT1 SALT2 SALT3 SALT4 SD1 SD2 SGPMCK
-SGPMI SGPMLD SGPMO SGPSCK SGPSI0 SGPSI1 SGPSLD SIOONCTRL SIOPBI SIOPBO SIOPWREQ
-SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1DEBUG SPI1PASSTHRU SPICS1 TIMER3 TIMER4
-TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 TXD4 UART6 USB11D1 USB11H2 USB2D1
-USB2H1 USBCKI VGABIOS_ROM VGAHS VGAVS VPI18 VPI24 VPI30 VPO12 VPO24 WDTRST1
-WDTRST2
-
-aspeed,ast2500-pinctrl, aspeed,g5-pinctrl:
-
 ACPI ADC0 ADC1 ADC10 ADC11 ADC12 ADC13 ADC14 ADC15 ADC2 ADC3 ADC4 ADC5 ADC6
 ADC7 ADC8 ADC9 BMCINT DDCCLK DDCDAT ESPI FWSPICS1 FWSPICS2 GPID0 GPID2 GPID4
 GPID6 GPIE0 GPIE2 GPIE4 GPIE6 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4 I2C5 I2C6
@@ -90,33 +62,8 @@ SPI2CS1 SPI2MISO SPI2MOSI TIMER3 TIMER4 TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2
 TXD3 TXD4 UART6 USB11BHID USB2AD USB2AH USB2BD USB2BH USBCKI VGABIOSROM VGAHS
 VGAVS VPI24 VPO WDTRST1 WDTRST2
 
-Examples
-========
-
-g4 Example
-----------
-
-syscon: scu@1e6e2000 {
-	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
-	reg = <0x1e6e2000 0x1a8>;
-
-	pinctrl: pinctrl {
-		compatible = "aspeed,g4-pinctrl";
-
-		pinctrl_i2c3_default: i2c3_default {
-			function = "I2C3";
-			groups = "I2C3";
-		};
-
-		pinctrl_gpioh0_unbiased_default: gpioh0 {
-			pins = "A8";
-			bias-disable;
-		};
-	};
-};
-
-g5 Example
-----------
+Example
+=======
 
 ahb {
 	apb {
-- 
2.20.1

