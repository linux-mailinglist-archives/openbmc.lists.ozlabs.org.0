Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18373BF497
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:03:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGq35skVzDqXM
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 00:03:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PJHfEF1G"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UBkBpZb0"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGCY4WljzDqlm
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:53 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5CB944FE;
 Thu, 26 Sep 2019 09:35:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=kx+rUjjqHF5WJ
 gMqBjeSZy4lTLFeujHE1Sjc6zHzsKI=; b=PJHfEF1GhavaUG8ndeC0iE74V1jR/
 uy8l3T1HkSe/8xAbYafgU9/J7Aj7xfJrEWeXvn+HdGHXNyWW+zhDzXzs56FX/Ljm
 Xh9QXxswlbPoBuLriOagZUTanxFYrFLleO2dcclNOaUrfvTnpGcE/USnQ3y+GeLE
 v7l06elXFmOMpnO60FGtzTuqxe2mUr2NHwczjFJmVGEVEiBIvj+2Xkn0AJD5fPds
 H2nY5IVT1j94PUCfIwXVViL0likfOKoco7JreYrN/HvpseSJuiRuFcrDrkKykPP+
 8bYhzM5GMsMyDMGlQLgQHBMA4m2RSXbFqF6TFb96lxW086Zp0YBOFgucg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=kx+rUjjqHF5WJgMqBjeSZy4lTLFeujHE1Sjc6zHzsKI=; b=UBkBpZb0
 naMtE5VjP89aVQbgr3n1qqMo39MidYUyBL6pmaHx8zbn/SzUulGRHywCxzix3GS3
 UgHcyIqbNvQhPuRm3rlY+1jjSTIJK1PCfuCqvI+BnE4bD2IOgf1qqAZzNag1nzrY
 3si4yilSbdlA89bfWapIjcujInQMfBKdYqz/Nm4wd8zFrSXF4Q/dt70QXjmgzirz
 5XZf26BDXoVkfR2KIOH6QAc45FZtfPKOlA5s2ocDzlGZUk7960OgCImrma6hCgQ3
 AbBKL7ZzJg+PBBTcpLfJ7FHrLKhgNMdFNFdfhKz7iGLkB9lNdy8MHf+gUJB7teLA
 gkjfvwnCuod1jA==
X-ME-Sender: <xms:tr6MXf8hdE3t_iHKrlLyVpohLI4pRUY28npHvU2JxamFjBeJZYKXMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepuddv
X-ME-Proxy: <xmx:tr6MXS7Z7IxOBvqmIL53CkW6HYcK7gnRDwlytZ6hG-ZaNeLRU2_REg>
 <xmx:tr6MXRbDvo59iP8VzDRJoDAO8ih9qH1fzd31_vpT85gWoFHpZIr-kA>
 <xmx:tr6MXUI-STHm18JI28TwxyHM8SQZRXbxFbpB09tueQGvVtzK4ndgLw>
 <xmx:t76MXdVnTAyuCPBIitRjf7vLx6dvdY7hkyLEOqQfPTk0RYHAPPpVlg>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14546D6005A;
 Thu, 26 Sep 2019 09:35:48 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 15/15] ARM: dts: aspeed-g6: Add missing
 pinctrl-names property to I2C nodes
Date: Thu, 26 Sep 2019 23:06:08 +0930
Message-Id: <20190926133608.30566-16-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926133608.30566-1-andrew@aj.id.au>
References: <20190926133608.30566-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, johnny_huang@aspeedtech.com,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Setting `pinctrl-names = "default";` will make the pinctrl subsystem
configure the pinmux prior to probing the driver.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 6ad1bc094f1c..5bea04b67b5c 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -533,6 +533,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c2_default>;
 		status = "disabled";
 	};
@@ -547,6 +548,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c3_default>;
 		status = "disabled";
 	};
@@ -561,6 +563,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c4_default>;
 		status = "disabled";
 	};
@@ -575,6 +578,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c5_default>;
 		status = "disabled";
 	};
@@ -589,6 +593,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c6_default>;
 		status = "disabled";
 	};
@@ -603,6 +608,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c7_default>;
 		status = "disabled";
 	};
@@ -617,6 +623,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c8_default>;
 		status = "disabled";
 	};
@@ -631,6 +638,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c9_default>;
 		status = "disabled";
 	};
@@ -645,6 +653,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c10_default>;
 		status = "disabled";
 	};
@@ -659,6 +668,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c11_default>;
 		status = "disabled";
 	};
@@ -673,6 +683,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c12_default>;
 		status = "disabled";
 	};
@@ -687,6 +698,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c13_default>;
 		status = "disabled";
 	};
@@ -701,6 +713,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c14_default>;
 		status = "disabled";
 	};
@@ -715,6 +728,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c15_default>;
 		status = "disabled";
 	};
@@ -729,6 +743,7 @@
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
+		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c16_default>;
 		status = "disabled";
 	};
-- 
2.20.1

