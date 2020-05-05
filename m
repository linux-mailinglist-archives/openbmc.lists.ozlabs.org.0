Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BED451C5008
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 10:16:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXcF5sV8zDqjN
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 18:16:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=gXW4YgXJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mtXFTY36; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWXc4l88zDqby
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 17:27:59 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B94D96B0;
 Tue,  5 May 2020 03:27:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 05 May 2020 03:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=09VNgR/pMJ5Ru
 IweMDDcynlfkE6IqDnYzGiRDtPT/7E=; b=gXW4YgXJGpBXfbdUBpOUJbw/Tb4Rj
 BqDKrd75lchsIsCFlqm0xyT7QbDJN88VJUPjZ0CObQNWFgk5pQbtSYosJ73rITSa
 /3LTdXeZvOaHEE46thuCCzQzUDQckmNqb1Ei6U2qdWwcoe/OvOPA1f0OF28vYUFr
 HDA9oej0Q45kMEyHecRtK1BjtMN+IAeq8JnIVEy8TkvKFvUC4eNRZHv+4jB/QxLP
 qZ8A3Pgiuz/g0Av9T4UDp0nVjuaoOtOHxSuFMhcfYeDknQVWo2+MJ3EwFpMjDkEj
 nEsCeZvhg2pXL0g//jqkkRTBZy7RuwngEkpeFvlSaOXjwZSSTBg99TGAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=09VNgR/pMJ5RuIweMDDcynlfkE6IqDnYzGiRDtPT/7E=; b=mtXFTY36
 NZ72KV2LZ5BQ0dhiKy+fQ2EISX9mx8XJx+JI7CoUeLMWIdEF40an6cWtUpdf7ktO
 TRkgsDxC5zPfdZ5iFtzfJ/rFb8KTOJ+8WC9pXamGxdUpwtKor7vkc7U1ZuAzvE7U
 3+pg4CSAzC/r1AlvGqEBcvGTFBRb8yMGVHXSQySRayPtgMtWzJHLj8LMB23wBtUd
 6kFVowVtVEko/zksa5d3fFSO9hKrdOvQlPE/3QXK4QzktoxMzB8LisvWjlTgw9eI
 m3wfWpG9dzV1M9oIvjYzoes3DldBPg00Kt9rt3Snd579cJ5k40JTdvjG0d0+0uBM
 EGSFBssl1rGpVA==
X-ME-Sender: <xms:fBWxXnoXPcaUFb3RenIT5CP8v8KiEb5n0-zbP2onKTbR6_EUk2Kg5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrjeehrdekgeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:fBWxXpXKV-nyDyAfU6pLcaHH0Ag6LFzgBYwrC348MCz1hX3UhjMUsw>
 <xmx:fBWxXqC1XXdJ5qTHQg0qe7C19g0g26y3_6B649ZGyhAgltZxW405qg>
 <xmx:fBWxXsRXZg5zVISc30RgcxguZo-0hJn8JqyHThSBtaOn7PrpfAge3g>
 <xmx:fBWxXoSyKOC09dMWByCdcI299gHz1wr3Z5zGprO07c5VmYSvaTr1ZQ>
Received: from localhost.localdomain
 (ppp14-2-75-84.adl-apt-pir-bras31.tpg.internode.on.net [14.2.75.84])
 by mail.messagingengine.com (Postfix) with ESMTPA id E360D3066052;
 Tue,  5 May 2020 03:27:54 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.4 1/3] dt-bindings: pinctrl: Add HEARTBEAT to
 ASPEED AST2600
Date: Tue,  5 May 2020 16:57:40 +0930
Message-Id: <20200505072742.350305-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505072742.350305-1-andrew@aj.id.au>
References: <20200505072742.350305-1-andrew@aj.id.au>
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
Cc: elkowals@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ball Y23 in the AST2600 defaults to a heartbeat function to light a LED,
generating a pulse-train from power-on.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 87 ++++++++++---------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 064b7dfc4252..b4a9155879ff 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -36,26 +36,26 @@ patternProperties:
               ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMC,
               ESPI, ESPIALT, FSI1, FSI2, FWSPIABR, FWSPID, FWSPIWP, GPIT0,
               GPIT1, GPIT2, GPIT3, GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1,
-              GPIU2, GPIU3, GPIU4, GPIU5, GPIU6, GPIU7, I2C1, I2C10, I2C11,
-              I2C12, I2C13, I2C14, I2C15, I2C16, I2C2, I2C3, I2C4, I2C5, I2C6,
-              I2C7, I2C8, I2C9, I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD, LHSIRQ,
-              LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ, MACLINK1, MACLINK2,
-              MACLINK3, MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4, NCTS1, NCTS2,
-              NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2, NDSR3,
-              NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4, NRTS1,
-              NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PWM0, PWM1, PWM10, PWM11,
-              PWM12, PWM13, PWM14, PWM15, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7,
-              PWM8, PWM9, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3,
-              RMII4, RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12,
-              SALT13, SALT14, SALT15, SALT16, SALT2, SALT3, SALT4, SALT5,
-              SALT6, SALT7, SALT8, SALT9, SD1, SD2, SGPM1, SGPS1, SIOONCTRL,
-              SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1,
-              SPI1ABR, SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1,
-              TACH10, TACH11, TACH12, TACH13, TACH14, TACH15, TACH2, TACH3,
-              TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0, THRU1, THRU2,
-              THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12, UART13,
-              UART6, UART7, UART8, UART9, VB, VGAHS, VGAVS, WDTRST1, WDTRST2,
-              WDTRST3, WDTRST4, ]
+              GPIU2, GPIU3, GPIU4, GPIU5, GPIU6, GPIU7, HEARTBEAT, I2C1, I2C10,
+              I2C11, I2C12, I2C13, I2C14, I2C15, I2C16, I2C2, I2C3, I2C4, I2C5,
+              I2C6, I2C7, I2C8, I2C9, I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD,
+              LHSIRQ, LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ, MACLINK1,
+              MACLINK2, MACLINK3, MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4, NCTS1,
+              NCTS2, NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2,
+              NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4,
+              NRTS1, NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PWM0, PWM1, PWM10,
+              PWM11, PWM12, PWM13, PWM14, PWM15, PWM2, PWM3, PWM4, PWM5, PWM6,
+              PWM7, PWM8, PWM9, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2,
+              RMII3, RMII4, RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11,
+              SALT12, SALT13, SALT14, SALT15, SALT16, SALT2, SALT3, SALT4,
+              SALT5, SALT6, SALT7, SALT8, SALT9, SD1, SD2, SGPM1, SGPS1,
+              SIOONCTRL, SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5,
+              SIOSCI, SPI1, SPI1ABR, SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2,
+              TACH0, TACH1, TACH10, TACH11, TACH12, TACH13, TACH14, TACH15,
+              TACH2, TACH3, TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0,
+              THRU1, THRU2, THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11,
+              UART12, UART13, UART6, UART7, UART8, UART9, VB, VGAHS, VGAVS,
+              WDTRST1, WDTRST2, WDTRST3, WDTRST4, ]
         groups:
           allOf:
             - $ref: "/schemas/types.yaml#/definitions/string"
@@ -64,29 +64,30 @@ patternProperties:
               EMMCG4, EMMCG8, ESPI, ESPIALT, FSI1, FSI2, FWSPIABR, FWSPID,
               FWQSPID, FWSPIWP, GPIT0, GPIT1, GPIT2, GPIT3, GPIT4, GPIT5,
               GPIT6, GPIT7, GPIU0, GPIU1, GPIU2, GPIU3, GPIU4, GPIU5, GPIU6,
-              GPIU7, HVI3C3, HVI3C4, I2C1, I2C10, I2C11, I2C12, I2C13, I2C14,
-              I2C15, I2C16, I2C2, I2C3, I2C4, I2C5, I2C6, I2C7, I2C8, I2C9,
-              I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD, LHSIRQ, LPC, LPCHC, LPCPD,
-              LPCPME, LPCSMI, LSIRQ, MACLINK1, MACLINK2, MACLINK3, MACLINK4,
-              MDIO1, MDIO2, MDIO3, MDIO4, NCTS1, NCTS2, NCTS3, NCTS4, NDCD1,
-              NDCD2, NDCD3, NDCD4, NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2,
-              NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, NRTS4,
-              OSCCLK, PEWAKE, PWM0, PWM1, PWM10G0, PWM10G1, PWM11G0, PWM11G1,
-              PWM12G0, PWM12G1, PWM13G0, PWM13G1, PWM14G0, PWM14G1, PWM15G0,
-              PWM15G1, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, PWM8G0, PWM8G1,
-              PWM9G0, PWM9G1, QSPI1, QSPI2, RGMII1, RGMII2, RGMII3, RGMII4,
-              RMII1, RMII2, RMII3, RMII4, RXD1, RXD2, RXD3, RXD4, SALT1,
-              SALT10G0, SALT10G1, SALT11G0, SALT11G1, SALT12G0, SALT12G1,
-              SALT13G0, SALT13G1, SALT14G0, SALT14G1, SALT15G0, SALT15G1,
-              SALT16G0, SALT16G1, SALT2, SALT3, SALT4, SALT5, SALT6, SALT7,
-              SALT8, SALT9G0, SALT9G1, SD1, SD2, SD3, SGPM1, SGPS1, SIOONCTRL,
-              SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1,
-              SPI1ABR, SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1,
-              TACH10, TACH11, TACH12, TACH13, TACH14, TACH15, TACH2, TACH3,
-              TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0, THRU1, THRU2,
-              THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12G0,
-              UART12G1, UART13G0, UART13G1, UART6, UART7, UART8, UART9, VB,
-              VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3, WDTRST4, ]
+              GPIU7, HEARTBEAT, HVI3C3, HVI3C4, I2C1, I2C10, I2C11, I2C12,
+              I2C13, I2C14, I2C15, I2C16, I2C2, I2C3, I2C4, I2C5, I2C6, I2C7,
+              I2C8, I2C9, I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD, LHSIRQ, LPC,
+              LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ, MACLINK1, MACLINK2,
+              MACLINK3, MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4, NCTS1, NCTS2,
+              NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2, NDSR3,
+              NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4, NRTS1,
+              NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PWM0, PWM1, PWM10G0,
+              PWM10G1, PWM11G0, PWM11G1, PWM12G0, PWM12G1, PWM13G0, PWM13G1,
+              PWM14G0, PWM14G1, PWM15G0, PWM15G1, PWM2, PWM3, PWM4, PWM5, PWM6,
+              PWM7, PWM8G0, PWM8G1, PWM9G0, PWM9G1, QSPI1, QSPI2, RGMII1,
+              RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3, RMII4, RXD1, RXD2,
+              RXD3, RXD4, SALT1, SALT10G0, SALT10G1, SALT11G0, SALT11G1,
+              SALT12G0, SALT12G1, SALT13G0, SALT13G1, SALT14G0, SALT14G1,
+              SALT15G0, SALT15G1, SALT16G0, SALT16G1, SALT2, SALT3, SALT4,
+              SALT5, SALT6, SALT7, SALT8, SALT9G0, SALT9G1, SD1, SD2, SD3,
+              SGPM1, SGPS1, SIOONCTRL, SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD,
+              SIOS3, SIOS5, SIOSCI, SPI1, SPI1ABR, SPI1CS1, SPI1WP, SPI2,
+              SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11, TACH12, TACH13,
+              TACH14, TACH15, TACH2, TACH3, TACH4, TACH5, TACH6, TACH7, TACH8,
+              TACH9, THRU0, THRU1, THRU2, THRU3, TXD1, TXD2, TXD3, TXD4,
+              UART10, UART11, UART12G0, UART12G1, UART13G0, UART13G1, UART6,
+              UART7, UART8, UART9, VB, VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3,
+              WDTRST4, ]
 
 required:
   - compatible
-- 
2.25.1

