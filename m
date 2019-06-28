Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F6C591A6
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 04:49:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zh7V1qgGzDqDM
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 12:49:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="j/Cnytgt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YJPFG5ce"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zgvd6FyZzDq7c;
 Fri, 28 Jun 2019 12:39:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 81B662AF1;
 Thu, 27 Jun 2019 22:39:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 Jun 2019 22:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=mj7brQMn9WC1R
 Bc9b3+KJ6wI1lywZI699pQ/yRjWUBE=; b=j/Cnytgth6BbwfY37NgBgjm5t2xvu
 DEB6u8wjO79Rjg50EOXriE0PgaBuaezx3u7A+UQ/v5v4Mi6DFpRHteLeYuVWaX/X
 OtFmD6/wXASUxUUPDZAEC6nPOxOklN0oRPOTB0TOreiJDxYriHipobMXN2U8sQ0Y
 nc9Eb5ZVgcO4Vw/lenhzaVh+gV7S9X2JJ6lbj2LTh/8oD/pIY+o+pxrSkxuNOhrn
 yYhWd6ss5dD6YHTx0XU1+M6kiuGukHd09ebNGAj+jHY7mZGqDeyhqxRvJe5Q1Udz
 eUS8cwPRu3kN0P6rwYfb/4L99unun1VbLevRhyxyWHODTmTpebofWA0zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=mj7brQMn9WC1RBc9b3+KJ6wI1lywZI699pQ/yRjWUBE=; b=YJPFG5ce
 y+3F0krM/gjkdnEG12ZUUctbMmy/1600l9ThqflnLBbq3Ef1mzxAG9fANrwYm0ZV
 XPcypoYCNes2VoYlj670t9EHfqfq1VuGswxe0qqy1zy13wRgf3D0T98TTqL2nNMq
 xLOgtQ5pvh0LlH3IwGYJjeKp1LUV/cuxR1rCBBDU9U+YzxvXChq8b2120FAZInqY
 y72igsMn5ZS+eN7GdaA/X/VP/JmdPdtUChhymBazFfArlP8PGs4i4YXbVGtQPQYW
 Nxl47SC+nuTxcc/1BlDjMuKEUEYBk7FKK0GjGO+zxozYDOxFlwM4WzgdMHKCeWpc
 gVR1ooAGo194Ug==
X-ME-Sender: <xms:230VXQbQ8sPuP2bhgQm5w6Z846Wxz22XWqsw-kLl-CMVMwJzZel0Yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomhgrihhnpe
 guvghvihgtvghtrhgvvgdrohhrghenucfkphepvddtvddrkedurddukedrfedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsth
 gvrhfuihiivgeptd
X-ME-Proxy: <xmx:230VXakRm17wbUExkMLzIpiyGumbWT3CYJZQCvZYwFa_5wE7pT3xKg>
 <xmx:230VXdrF4SwENoGgCTrrc3AijkseqIGXZ5amjKnSHoPZ_BKvLDL8vA>
 <xmx:230VXUBTLC3F80E86vgG-2YEmBRpZj5CW_qk9kY1TgqPeqcIK_wK8w>
 <xmx:230VXVuB0zkq0UK9faZljA7uzImN61J7Z9x9Xeeo0VIj0-7DQHbodw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4EE7F380074;
 Thu, 27 Jun 2019 22:39:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/8] dt-bindings: pinctrl: aspeed: Convert AST2400 bindings
 to json-schema
Date: Fri, 28 Jun 2019 12:08:32 +0930
Message-Id: <20190628023838.15426-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628023838.15426-1-andrew@aj.id.au>
References: <20190628023838.15426-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Johnny Huang <johnny_huang@aspeedtech.com>, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Convert ASPEED pinctrl bindings to DT schema format using json-schema

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
In v2:

* Enforce function/group names in bindings
* Move description above properties
* Simplify specification of compatible
* Cleanup license specification

 .../pinctrl/aspeed,ast2400-pinctrl.txt        | 80 ------------------
 .../pinctrl/aspeed,ast2400-pinctrl.yaml       | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
deleted file mode 100644
index 67e0325ccf2e..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
+++ /dev/null
@@ -1,80 +0,0 @@
-=============================
-Aspeed AST2400 Pin Controller
-=============================
-
-Required properties for the AST2400:
-- compatible : 			Should be one of the following:
-				"aspeed,ast2400-pinctrl"
-				"aspeed,g4-pinctrl"
-
-The pin controller node should be the child of a syscon node with the required
-property:
-
-- compatible : 		Should be one of the following:
-			"aspeed,ast2400-scu", "syscon", "simple-mfd"
-			"aspeed,g4-scu", "syscon", "simple-mfd"
-
-Refer to the the bindings described in
-Documentation/devicetree/bindings/mfd/syscon.txt
-
-Subnode Format
-==============
-
-The required properties of pinmux child nodes are:
-- function: the mux function to select
-- groups  : the list of groups to select with this function
-
-Required properties of pinconf child nodes are:
-- groups: A list of groups to select (either this or "pins" must be
-          specified)
-- pins  : A list of ball names as strings, eg "D14" (either this or "groups"
-          must be specified)
-
-Optional properties of pinconf child nodes are:
-- bias-disable  : disable any pin bias
-- bias-pull-down: pull down the pin
-- drive-strength: sink or source at most X mA
-
-Definitions are as specified in
-Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt, with any
-further limitations as described above.
-
-For pinmux, each mux function has only one associated pin group. Each group is
-named by its function. The following values for the function and groups
-properties are supported:
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
-Example
-=======
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
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
new file mode 100644
index 000000000000..61a110a7db8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2400-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2400 Pin Controller
+
+maintainers:
+  - Andrew Jeffery <andrew@aj.id.au>
+
+description: |+
+  The pin controller node should be the child of a syscon node with the
+  required property:
+
+  - compatible:     Should be one of the following:
+                    "aspeed,ast2400-scu", "syscon", "simple-mfd"
+                    "aspeed,g4-scu", "syscon", "simple-mfd"
+
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.txt
+
+properties:
+  compatible:
+    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      patternProperties:
+        "^function|groups$":
+          allOf:
+            - $ref: "/schemas/types.yaml#/definitions/string"
+            - enum: [ "ACPI", "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC13",
+              "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7",
+              "ADC8", "ADC9", "BMCINT", "DDCCLK", "DDCDAT", "EXTRST", "FLACK",
+              "FLBUSY", "FLWP", "GPID", "GPID0", "GPID2", "GPID4", "GPID6",
+              "GPIE0", "GPIE2", "GPIE4", "GPIE6", "I2C10", "I2C11", "I2C12",
+              "I2C13", "I2C14", "I2C3", "I2C4", "I2C5", "I2C6", "I2C7", "I2C8",
+              "I2C9", "LPCPD", "LPCPME", "LPCRST", "LPCSMI", "MAC1LINK",
+              "MAC2LINK", "MDIO1", "MDIO2", "NCTS1", "NCTS2", "NCTS3", "NCTS4",
+              "NDCD1", "NDCD2", "NDCD3", "NDCD4", "NDSR1", "NDSR2", "NDSR3",
+              "NDSR4", "NDTR1", "NDTR2", "NDTR3", "NDTR4", "NDTS4", "NRI1",
+              "NRI2", "NRI3", "NRI4", "NRTS1", "NRTS2", "NRTS3", "OSCCLK",
+              "PWM0", "PWM1", "PWM2", "PWM3", "PWM4", "PWM5", "PWM6", "PWM7",
+              "RGMII1", "RGMII2", "RMII1", "RMII2", "ROM16", "ROM8", "ROMCS1",
+              "ROMCS2", "ROMCS3", "ROMCS4", "RXD1", "RXD2", "RXD3", "RXD4",
+              "SALT1", "SALT2", "SALT3", "SALT4", "SD1", "SD2", "SGPMCK",
+              "SGPMI", "SGPMLD", "SGPMO", "SGPSCK", "SGPSI0", "SGPSI1", "SGPSLD",
+              "SIOONCTRL", "SIOPBI", "SIOPBO", "SIOPWREQ", "SIOPWRGD", "SIOS3",
+              "SIOS5", "SIOSCI", "SPI1", "SPI1DEBUG", "SPI1PASSTHRU", "SPICS1",
+              "TIMER3", "TIMER4", "TIMER5", "TIMER6", "TIMER7", "TIMER8", "TXD1",
+              "TXD2", "TXD3", "TXD4", "UART6", "USB11D1", "USB11H2", "USB2D1",
+              "USB2H1", "USBCKI", "VGABIOS_ROM", "VGAHS", "VGAVS", "VPI18",
+              "VPI24", "VPI30", "VPO12", "VPO24", "WDTRST1", "WDTRST2" ]
+
+required:
+  - compatible
+
+examples:
+  - |
+    syscon: scu@1e6e2000 {
+        compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
+        reg = <0x1e6e2000 0x1a8>;
+
+        pinctrl: pinctrl {
+            compatible = "aspeed,g4-pinctrl";
+
+            pinctrl_i2c3_default: i2c3_default {
+                function = "I2C3";
+                groups = "I2C3";
+            };
+
+            pinctrl_gpioh0_unbiased_default: gpioh0 {
+                pins = "A8";
+                bias-disable;
+            };
+        };
+    };
-- 
2.20.1

