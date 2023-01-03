Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E765BD4B
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 10:38:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmSNd0KcNz3bnH
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 20:38:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmSMX4BFxz3bcN;
	Tue,  3 Jan 2023 20:37:57 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 3039R8HQ072914;
	Tue, 3 Jan 2023 17:27:09 +0800 (GMT-8)
	(envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Jan
 2023 17:37:09 +0800
From: ryan_chen <ryan_chen@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, ryan_chen <ryan_chen@aspeedtech.com>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 2/2] dtsi:aspeed: add miss pinctrl in pinctrl dtsi
Date: Tue, 3 Jan 2023 17:37:02 +0800
Message-ID: <20230103093702.2613574-3-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
References: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 3039R8HQ072914
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

add miss pcie rc, secure i2c, i3c, 8bit emmc, uart ncts..

Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 216 +++++++++++++++++++++++
 1 file changed, 216 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
index 7cd4f075e325..d04399b35e39 100644
--- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
@@ -2,6 +2,16 @@
 // Copyright 2019 IBM Corp.
 
 &pinctrl {
+	pinctrl_pcierc0_default: pcierc0_default {
+		function = "PCIERC0";
+		groups = "PCIERC0";
+	};
+
+	pinctrl_pcierc1_default: pcierc1_default {
+		function = "PCIERC1";
+		groups = "PCIERC1";
+	};
+
 	pinctrl_adc0_default: adc0_default {
 		function = "ADC0";
 		groups = "ADC0";
@@ -297,6 +307,66 @@ pinctrl_i2c9_default: i2c9_default {
 		groups = "I2C9";
 	};
 
+	pinctrl_si2c1_default: si2c1_default {
+		function = "SI2C1";
+		groups = "SI2C1";
+	};
+
+	pinctrl_si2c2_default: si2c2_default {
+		function = "SI2C2";
+		groups = "SI2C2";
+	};
+
+	pinctrl_si2c3_default: si2c3_default {
+		function = "SI2C3";
+		groups = "SI2C3";
+	};
+
+	pinctrl_si2c4_default: si2c4_default {
+		function = "SI2C4";
+		groups = "SI2C4";
+	};
+
+	pinctrl_si2c5_default: si2c5_default {
+		function = "SI2C5";
+		groups = "SI2C5";
+	};
+
+	pinctrl_si2c6_default: si2c6_default {
+		function = "SI2C6";
+		groups = "SI2C6";
+	};
+
+	pinctrl_si2c7_default: si2c7_default {
+		function = "SI2C7";
+		groups = "SI2C7";
+	};
+
+	pinctrl_si2c8_default: si2c8_default {
+		function = "SI2C8";
+		groups = "SI2C8";
+	};
+
+	pinctrl_si2c9_default: si2c9_default {
+		function = "SI2C9";
+		groups = "SI2C9";
+	};
+
+	pinctrl_si2c10_default: si2c10_default {
+		function = "SI2C10";
+		groups = "SI2C10";
+	};
+
+	pinctrl_i3c1_default: i3c1_default {
+		function = "I3C1";
+		groups = "I3C1";
+	};
+
+	pinctrl_i3c2_default: i3c2_default {
+		function = "I3C2";
+		groups = "I3C2";
+	};
+
 	pinctrl_i3c3_default: i3c3_default {
 		function = "I3C3";
 		groups = "I3C3";
@@ -857,6 +927,11 @@ pinctrl_emmc_default: emmc_default {
 		groups = "EMMCG4";
 	};
 
+	pinctrl_emmcg8_default: emmcg8_default {
+		function = "EMMC";
+		groups = "EMMCG8";
+	};
+
 	pinctrl_sgpm1_default: sgpm1_default {
 		function = "SGPM1";
 		groups = "SGPM1";
@@ -952,6 +1027,11 @@ pinctrl_spi2cs2_default: spi2cs2_default {
 		groups = "SPI2CS2";
 	};
 
+	pinctrl_ssprstroot_default: ssprstroot_default {
+		function = "SSPRSTROOT";
+		groups = "SSPRSTROOT";
+	};
+
 	pinctrl_tach0_default: tach0_default {
 		function = "TACH0";
 		groups = "TACH0";
@@ -1142,6 +1222,16 @@ pinctrl_usb2bd_default: usb2bd_default {
 		groups = "USBB";
 	};
 
+	pinctrl_usb2adp_default: usb2adp_default {
+		function = "USB2ADP";
+		groups = "USBA";
+	};
+
+	pinctrl_usb2ahp_default: usb2ahp_default {
+		function = "USB2AHP";
+		groups = "USBA";
+	};
+
 	pinctrl_usb11bhid_default: usb11bhid_default {
 		function = "USB11BHID";
 		groups = "USBB";
@@ -1181,4 +1271,130 @@ pinctrl_wdtrst4_default: wdtrst4_default {
 		function = "WDTRST4";
 		groups = "WDTRST4";
 	};
+
+	pinctrl_ncts1_default: ncts1_default {
+		function = "NCTS1";
+		groups = "NCTS1";
+	};
+
+	pinctrl_ncts2_default: ncts2_default {
+		function = "NCTS2";
+		groups = "NCTS2";
+	};
+
+	pinctrl_ncts3_default: ncts3_default {
+		function = "NCTS3";
+		groups = "NCTS3";
+	};
+
+	pinctrl_ncts4_default: ncts4_default {
+		function = "NCTS4";
+		groups = "NCTS4";
+	};
+
+	pinctrl_ndcd1_default: ndcd1_default {
+		function = "NDCD1";
+		groups = "NDCD1";
+	};
+
+	pinctrl_ndcd2_default: ndcd2_default {
+		function = "NDCD2";
+		groups = "NDCD2";
+	};
+
+	pinctrl_ndcd3_default: ndcd3_default {
+		function = "NDCD3";
+		groups = "NDCD3";
+	};
+
+	pinctrl_ndcd4_default: ndcd4_default {
+		function = "NDCD4";
+		groups = "NDCD4";
+	};
+
+	pinctrl_ndsr1_default: ndsr1_default {
+		function = "NDSR1";
+		groups = "NDSR1";
+	};
+
+	pinctrl_ndsr2_default: ndsr2_default {
+		function = "NDSR2";
+		groups = "NDSR2";
+	};
+
+	pinctrl_ndsr3_default: ndsr3_default {
+		function = "NDSR3";
+		groups = "NDSR3";
+	};
+
+	pinctrl_ndsr4_default: ndsr4_default {
+		function = "NDSR4";
+		groups = "NDSR4";
+	};
+
+	pinctrl_nri1_default: nri1_default {
+		function = "NRI1";
+		groups = "NRI1";
+	};
+
+	pinctrl_nri2_default: nri2_default {
+		function = "NRI2";
+		groups = "NRI2";
+	};
+
+	pinctrl_nri3_default: nri3_default {
+		function = "NRI3";
+		groups = "NRI3";
+	};
+
+	pinctrl_nri4_default: nri4_default {
+		function = "NRI4";
+		groups = "NRI4";
+	};
+
+	pinctrl_ndtr1_default: ndtr1_default {
+		function = "NDTR1";
+		groups = "NDTR1";
+	};
+
+	pinctrl_ndtr2_default: ndtr2_default {
+		function = "NDTR2";
+		groups = "NDTR2";
+	};
+
+	pinctrl_ndtr3_default: ndtr3_default {
+		function = "NDTR3";
+		groups = "NDTR3";
+	};
+
+	pinctrl_ndtr4_default: ndtr4_default {
+		function = "NDTR4";
+		groups = "NDTR4";
+	};
+
+	pinctrl_nrts1_default: nrts1_default {
+		function = "NRTS1";
+		groups = "NRTS1";
+	};
+
+	pinctrl_nrts2_default: nrts2_default {
+		function = "NRTS2";
+		groups = "NRTS2";
+	};
+
+	pinctrl_nrts3_default: nrts3_default {
+		function = "NRTS3";
+		groups = "NRTS3";
+	};
+
+	pinctrl_nrts4_default: nrts4_default {
+		function = "NRTS4";
+		groups = "NRTS4";
+	};
+
+	pinctrl_fwspi18_default: fwspi18_default {
+		function = "FWSPI18";
+		groups = "FWSPI18";
+	};
+
 };
-- 
2.34.1

