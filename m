Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB042B0FAD
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 21:56:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXDRX6PRGzDr3k
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 07:56:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-usa.com (client-ip=40.107.220.54;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.kao@fii-usa.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fii-usa.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=S6JkTOmi; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXDQH5Xn2zDr30
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 07:55:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RL9F+QFKYEMgfWsjYBGzXdCgnFHT+u175Q1W/Y7iuGK8ThzCikEhGhkKpUy63IenkywuNDyYgUIydForyAsni2KP6PciAm38VG4igrVR470g/h1M2N+m/DK9wCua9ipIK72QjZBN0O0LsVV5KdMe00tYp+ambh3Hc0yWvTHzSpXeALYtnRBRyt5Q9E0b4dQdZ8byXyj95/gTb+CvtNwy087cLFlYGG+GTAG84XoSEPF7FF9wLMqqnwOZyn55WYys1/6ZglJvEvhEQWUHr9SYb2ehawigITWwUZEZ99ke+mitcjxxZ4SpvQKFZIKo9zKBhPUegZ23x3IkE0wCCl6vwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnTk1ZkesOVQcTYyjkRMawzywE4mHQKUY8l4o0DwVME=;
 b=ZE1RmN3hZsO9M8Gnhnfs0iIPO2Yy3f6DOFyLvMvXdme5Bobzp17wX8FUcjnlJbufJgyKGOZov115W3/7gJOlrhUVVGnzzX2CVmUHrGW+2K3PwT0wQLwbbow4Z/43R2xAaUWsPRJpvD+x7Wmg8s8Ay9G7YQ9j0SOibAYV70NU7impzMek+zs52DGMpEn1gDJ9U4vin3ENj7WKUhpGJ/bxSBklaNh2IE2XAKsg/rCbVMND6ZhVzjXXcN4NfO/z6xGYiquu9T9OaFVzQbOBHPOyTmoOTdXhPAxLj0h2mi3qR5EbBimb0KQP4xhW2oyday1P9elt3uqz8sJxlnAXjTE5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-usa.com; dmarc=pass action=none header.from=fii-usa.com;
 dkim=pass header.d=fii-usa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnTk1ZkesOVQcTYyjkRMawzywE4mHQKUY8l4o0DwVME=;
 b=S6JkTOmisNeT++I6vBwcNGrY1u15xP/ND+66VjGMsl5JC/2I9D93kUr1fAxsZ8Xev9otl1FzniMQ/hmE1xYemKWNxJIUZRPXuvRHaK3HNd/2eyUdmnpaQspbJxPIC4Ec+565f7LE9H3kvg4jBo1aeOJsNdEfGVfCEaKGavAj64yMLFzVWHzIMvHLiaBAZGg993RsKZl1taXhBkSqQoNEBoLGSjeww+Xp7UuF+JF+2KfsTNJo6WMeJcFL8MvSGt9aikzL7NwjfmyPD1SWDWuqekXH16CLlf5ObUl8N3zWfz8etTMXm2m0IeNeyuuSEfUEKqNzzZEZaeOuiMKLO+Iaqg==
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=fii-usa.com;
Received: from DM6PR08MB4890.namprd08.prod.outlook.com (2603:10b6:5:43::18) by
 DM5PR0801MB3656.namprd08.prod.outlook.com (2603:10b6:4:7e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Thu, 12 Nov 2020 20:55:27 +0000
Received: from DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::40be:143a:73a2:b33e]) by DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::40be:143a:73a2:b33e%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 20:55:27 +0000
From: Lancelot Kao <lancelot.kao@fii-usa.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Benjamin Fair <benjaminfair@google.com>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>
Subject: [PATCH v3 linux dev-5.8] =?UTF-8?q?Fii=20Kudo=20project=20device?=
 =?UTF-8?q?=20tree=20file=20=C2=A0=C2=A0=20=C2=A0=20Add=20device=20tree=20?=
 =?UTF-8?q?for=20the=20Kudo=20BMC.=20Kudo=20is=20an=20Ampere=20(Altra)=20s?=
 =?UTF-8?q?erver=20platform=20manufactured=20by=20Fii=20and=20is=20based?=
 =?UTF-8?q?=20on=20a=20Nuvoton=20NPCM730=20SoC.?=
Date: Thu, 12 Nov 2020 14:55:18 -0600
Message-Id: <20201112205518.7624-1-lancelot.kao@fii-usa.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [216.63.87.86]
X-ClientProxiedBy: DM6PR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:5:120::47) To DM6PR08MB4890.namprd08.prod.outlook.com
 (2603:10b6:5:43::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from OpenSystem.houston.foxconn.com (216.63.87.86) by
 DM6PR06CA0034.namprd06.prod.outlook.com (2603:10b6:5:120::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 20:55:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d115c6e-bfc7-4de6-4450-08d8874d48ab
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3656:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR0801MB3656F75913DD1B808D1B06B9C0E70@DM5PR0801MB3656.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2AX5cOkwk2/CGm7D/Z4a0j1MAXRChxa0nPxTUWvzG31mNtQjRn8AZvE8H7iV4HN8lgDQuS2RlVTJ2lOR8oUFY9J60NfNfxeSZYDVqSCLZyNeDh4/ytbYsHSGyoj7GGDIyKW4CMCKPsnFvGoadhykET18lQRMgmmxqFu1J8/LHiL5Rovw6Q85jf/A8nny3xpQcs+yvjJLYLbUtSXuqjJ3osdZ8yWqQ0kf2Os1DziVJ9rYzQjlgLrPAfjBMBYELKudPzvbECKmu/VOWAl1hs+H0xm5Bu/MZNYFH846EMgjfzAFigPOQgM89TBloOiYwHa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB4890.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(136003)(366004)(346002)(396003)(52116002)(36756003)(2616005)(316002)(6666004)(110136005)(54906003)(16526019)(6506007)(86362001)(83380400001)(956004)(186003)(8936002)(30864003)(6486002)(5660300002)(44832011)(66946007)(478600001)(26005)(66556008)(2906002)(66476007)(4326008)(1076003)(6512007)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YrGdsbvitiWG78mvrCgoiL+bl0rv/xT3VH1HmqSDnZjGDrS2sss0Xe7yo2TT7S/lSMc1bC23Y7d+522R+YQuAaVeVZecjV2Dk2oN/s1FqICfvbwUf0tqT/ZWFYAtEFNMAjFMliq0SPDccpkbJY78SVFdAJm+Elm5jC9rNUVKXIfLWQHrNphMabUJpEXVThn4+wdKFSdst1r/cPWX0P1misQUrRrzLX/fXcTdzP2EtmM+CDctbUgBYD+EwzhKCt0hNI/b3Cj2rh9RH4QQG+BOEZuq53SIjLKEhqbCWDQxq5n+lv4IPieHYilXKA3Rt84VG2wq8Cxn+hx//3dmbwtwwCf/j9YmE25t8NrCMnT45zqLqJTDhfypM8d42mgdmWNV1PqNsAsqXZ8KEclmHKAgXV6m3tvtaOdmdmV8R8G9OQc3JoUCBHLF1NvFSAKwoZstXCwHP4DiABvKMxccedoY7grzqtM7AWAvFSxZfA+kw/wSEg3dG73zvTdp5cnuAFQlBzFzNpOFF6k7V20kw8TATV4X0ySqDFU/xyu3wPDgC3g8YReCIoYL0FInARRBWIHLs4avdJ/t1M1M3mRoxw3cp6FNen8Up0iq4535q3z3RBvqpQGspLJJbsbl7J0qPZC6nT50Axhn99yJMrO9DV6X5g==
X-OriginatorOrg: fii-usa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d115c6e-bfc7-4de6-4450-08d8874d48ab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB4890.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 20:55:27.7678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gLStY9oFuYqwCwQzAZdqx9FfITu9rC2gelNre5Gh1tUp3zNrQRQCOZss3I2ZnKJTd/19mu+8RUF6QR8uu4xesvD8lSAY0GVJZEpYUBpwvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0801MB3656
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
Cc: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>,
 Lancelot Kao <lancelot.kao@fii-usa.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Signed-off-by: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>

---
v2:
 - Remove the duplicate the full path and address of node.
 - modified syntax

---
v3:
 - Modify the platform description
 - Merge uvoton-npcm730-kudo-gpio.dtsi to uvoton-npcm730-kudo.dts
 - Removed re-describe statement
 - move comment to above
---
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts | 871 +++++++++++++++++++++
 1 file changed, 871 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
new file mode 100644
index 000000000000..077d815e84fc
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
@@ -0,0 +1,871 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Fii USA Inc. 
+
+/dts-v1/;
+#include "nuvoton-npcm730.dtsi"
+
+/ {
+	model = "Fii Kudo Board";
+	compatible = "fii,kudo", "nuvoton,npcm730";
+
+	aliases {
+		ethernet0 = &emc0;
+		ethernet1 = &gmac0;
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		udc9 = &udc9;
+		emmc0 = &sdhci0;
+		vdma = &vdma;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+	};
+
+	chosen {
+		stdout-path = &serial3;
+	};
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
+
+	jtag_master {
+		compatible = "nuvoton,npcm750-jtag-master";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		
+		// dev/jtag0
+		dev-num = <0>;
+		// pspi or gpio
+		mode = "pspi";
+
+		// pspi2
+		pspi-controller = <2>;
+		reg = <0xf0201000 0x1000>;
+		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk NPCM7XX_CLK_APB5>;
+
+		// TCK, TDI, TDO, TMS
+		jtag-gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>, 
+				<&gpio0 18 GPIO_ACTIVE_HIGH>,
+				<&gpio0 17 GPIO_ACTIVE_HIGH>,
+				<&gpio0 16 GPIO_ACTIVE_HIGH>;
+	};
+	
+	leds {
+		compatible = "gpio-leds";
+		heartbeat {
+			label = "heartbeat";
+			gpios = <&gpio0 14 1>;
+		};
+	};
+
+	pinctrl: pinctrl@f0800000 {
+		gpio61oh_pins: gpio61oh-pins {
+			pins = "GPO61/nDTR1_BOUT1/STRAP6";
+			bias-disable;
+			output-high;
+		};
+		gpio62oh_pins: gpio62oh-pins {
+			pins = "GPO62/nRTST1/STRAP5";
+			bias-disable;
+			output-high;
+		};
+		gpio161ol_pins: gpio161ol-pins {
+			pins = "GPIO161/nLFRAME/nESPICS";
+			bias-disable;
+			output-low;
+		};
+		gpio163i_pins: gpio163i-pins {
+			pins = "GPIO163/LCLK/ESPICLK";
+			bias-disable;
+			input-enable;
+		};
+		gpio167ol_pins: gpio167ol-pins {
+			pins = "GPIO167/LAD3/ESPI_IO3";
+			bias-disable;
+			output-low;
+		};
+		gpio95i_pins: gpio95i-pins {
+			pins = "GPIO95/nLRESET/nESPIRST";
+			bias-disable;
+			input-enable;
+		};
+		gpio65ol_pins: gpio65ol-pins {
+			pins = "GPIO65/FANIN1";
+			bias-disable;
+			output-low;
+		};
+		gpio66oh_pins: gpio66oh-pins {
+			pins = "GPIO66/FANIN2";
+			bias-disable;
+			output-high;
+		};
+		gpio67oh_pins: gpio67oh-pins {
+			pins = "GPIO67/FANIN3";
+			bias-disable;
+			output-high;
+		};
+		gpio68ol_pins: gpio68ol-pins {
+			pins = "GPIO68/FANIN4";
+			bias-disable;
+			output-low;
+		};
+		gpio69i_pins: gpio69i-pins {
+			pins = "GPIO69/FANIN5";
+			bias-disable;
+			input-enable;
+		};
+		gpio70ol_pins: gpio70ol-pins {
+			pins = "GPIO70/FANIN6";
+			bias-disable;
+			output-low;
+		};
+		gpio71i_pins: gpio71i-pins {
+			pins = "GPIO71/FANIN7";
+			bias-disable;
+			input-enable;
+		};
+		gpio72i_pins: gpio72i-pins {
+			pins = "GPIO72/FANIN8";
+			bias-disable;
+			input-enable;
+		};
+		gpio73i_pins: gpio73i-pins {
+			pins = "GPIO73/FANIN9";
+			bias-disable;
+			input-enable;
+		};
+		gpio74i_pins: gpio74i-pins {
+			pins = "GPIO74/FANIN10";
+			bias-disable;
+			input-enable;
+		};
+		gpio75i_pins: gpio75i-pins {
+			pins = "GPIO75/FANIN11";
+			bias-disable;
+			input-enable;
+		};
+		gpio76i_pins: gpio76i-pins {
+			pins = "GPIO76/FANIN12";
+			bias-disable;
+			input-enable;
+		};
+		gpio77i_pins: gpio77i-pins {
+			pins = "GPIO77/FANIN13";
+			bias-disable;
+			input-enable;
+		};
+		gpio78i_pins: gpio78i-pins {
+			pins = "GPIO78/FANIN14";
+			bias-disable;
+			input-enable;
+		};
+		gpio79ol_pins: gpio79ol-pins {
+			pins = "GPIO79/FANIN15";
+			bias-disable;
+			output-low;
+		};
+		gpio80oh_pins: gpio80oh-pins {
+			pins = "GPIO80/PWM0";
+			bias-disable;
+			output-high;
+		};
+		gpio81i_pins: gpio81i-pins {
+			pins = "GPIO81/PWM1";
+			bias-disable;
+			input-enable;
+		};
+		gpio82i_pins: gpio82i-pins {
+			pins = "GPIO82/PWM2";
+			bias-disable;
+			input-enable;
+		};
+		gpio83i_pins: gpio83i-pins {
+			pins = "GPIO83/PWM3";
+			bias-disable;
+			input-enable;
+		};
+		gpio144i_pins: gpio144i-pins {
+			pins = "GPIO144/PWM4";
+			bias-disable;
+			input-enable;
+		};
+		gpio145i_pins: gpio145i-pins {
+			pins = "GPIO145/PWM5";
+			bias-disable;
+			input-enable;
+		};
+		gpio146i_pins: gpio146i-pins {
+			pins = "GPIO146/PWM6";
+			bias-disable;
+			input-enable;
+		};
+		gpio147oh_pins: gpio147oh-pins {
+			pins = "GPIO147/PWM7";
+			bias-disable;
+			output-high;
+		};
+		gpio168ol_pins: gpio168ol-pins {
+			pins = "GPIO168/nCLKRUN/nESPIALERT";
+			bias-disable;
+			output-low;
+		};
+		gpio169oh_pins: gpio169oh-pins {
+			pins = "GPIO169/nSCIPME";
+			bias-disable;
+			output-high;
+		};
+		gpio170ol_pins: gpio170ol-pins {
+			pins = "GPIO170/nSMI";
+			bias-disable;
+			output-low;
+		};
+		gpio218oh_pins: gpio218oh-pins {
+			pins = "GPIO218/nWDO1";
+			bias-disable;
+			output-high;
+		};
+		gpio37i_pins: gpio37i-pins {
+			pins = "GPIO37/SMB3CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio38i_pins: gpio38i-pins {
+			pins = "GPIO38/SMB3CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio39i_pins: gpio39i-pins {
+			pins = "GPIO39/SMB3BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio40i_pins: gpio40i-pins {
+			pins = "GPIO40/SMB3BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio121i_pins: gpio121i-pins {
+			pins = "GPIO121/SMB2CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio122i_pins: gpio122i-pins {
+			pins = "GPIO122/SMB2BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio123i_pins: gpio123i-pins {
+			pins = "GPIO123/SMB2BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio124i_pins: gpio124i-pins {
+			pins = "GPIO124/SMB1CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio125i_pins: gpio125i-pins {
+			pins = "GPIO125/SMB1CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio126i_pins: gpio126i-pins {
+			pins = "GPIO126/SMB1BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio127i_pins: gpio127i-pins {
+			pins = "GPIO127/SMB1BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio136i_pins: gpio136i-pins {
+			pins = "GPIO136/SD1DT0";
+			bias-disable;
+			input-enable;
+		};
+		gpio137oh_pins: gpio137oh-pins {
+			pins = "GPIO137/SD1DT1";
+			bias-disable;
+			output-high;
+		};
+		gpio138i_pins: gpio138i-pins {
+			pins = "GPIO138/SD1DT2";
+			bias-disable;
+			input-enable;
+		};
+		gpio139i_pins: gpio139i-pins {
+			pins = "GPIO139/SD1DT3";
+			bias-disable;
+			input-enable;
+		};
+		gpio140i_pins: gpio140i-pins {
+			pins = "GPIO140/SD1CLK";
+			bias-disable;
+			input-enable;
+		};
+		gpio141i_pins: gpio141i-pins {
+			pins = "GPIO141/SD1WP";
+			bias-disable;
+			input-enable;
+		};
+		gpio190oh_pins: gpio190oh-pins {
+			pins = "GPIO190/nPRD_SMI";
+			bias-disable;
+			output-high;
+		};
+		gpio191oh_pins: gpio191oh-pins {
+			pins = "GPIO191";
+			bias-disable;
+			output-high;
+		};
+		gpio195ol_pins: gpio195ol-pins {
+			pins = "GPIO195/SMB0BSDA";
+			bias-disable;
+			output-low;
+		};
+		gpio196ol_pins: gpio196ol-pins {
+			pins = "GPIO196/SMB0CSCL";
+			bias-disable;
+			output-low;
+		};
+		gpio199i_pins: gpio199i-pins {
+			pins = "GPIO199/SMB0DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio202ol_pins: gpio202ol-pins {
+			pins = "GPIO202/SMB0CSDA";
+			bias-disable;
+			output-low;
+		};
+	};
+};
+
+&gmac0 {
+	phy-mode = "rgmii-id";
+	snps,eee-force-disable;
+	status = "okay";
+};
+
+&emc0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&udc9 {
+	status = "okay";
+};
+
+&aes {
+	status = "okay";
+};
+
+&sha {
+	status = "okay";
+};
+
+&fiu0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0cs1_pins>;
+	status = "okay";
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		spi-rx-bus-width = <2>;
+		partitions@80000000 {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bmc@0{
+				label = "bmc";
+				reg = <0x000000 0x2000000>;
+			};
+			u-boot@0 {
+				label = "u-boot";
+				reg = <0x0000000 0xC0000>;
+				read-only;
+			};
+			u-boot-env@100000{
+				label = "u-boot-env";
+				reg = <0x00100000 0x40000>;
+			};
+			kernel@200000 {
+				label = "kernel";
+				reg = <0x0200000 0x600000>;
+			};
+			rofs@800000 {
+				label = "rofs";
+				reg = <0x800000 0x3500000>;
+			};
+			rwfs@1d00000 {
+				label = "rwfs";
+				reg = <0x3d00000 0x300000>;
+			};
+		};
+	};
+	spi-nor@1 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <1>;
+		spi-max-frequency = <5000000>;
+		spi-rx-bus-width = <2>;
+		partitions@88000000 {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			spare1@0 {
+				label = "spi0-cs1-spare1";
+				reg = <0x0 0x800000>;
+			};
+			spare2@800000 {
+				label = "spi0-cs1-spare2";
+				reg = <0x800000 0x0>;
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>;
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		spi-rx-bus-width = <2>;
+		partitions@A0000000 {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			system1@0 {
+				label = "bios";
+				reg = <0x0 0x0>;
+			};
+			system2@800000 {
+				label = "spi3-system2";
+				reg = <0x800000 0x0>;
+			};
+		};
+	};
+};
+
+&sdhci0 {
+	status = "okay";
+};
+
+&vdma {
+	status = "okay";
+};
+
+&pcimbox {
+	status = "okay";
+};
+
+&vcd {
+	status = "okay";
+};
+
+&ece {
+	status = "okay";
+};
+
+&watchdog1 {
+	status = "okay";
+};
+
+&rng {
+	status = "okay";
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&serial2 {
+	status = "okay";
+};
+
+&serial3 {
+	status = "okay";
+};
+
+&adc {
+	#io-channel-cells = <1>;
+	status = "okay";
+};
+
+&otp {
+	status = "okay";
+};
+
+&i2c1 {
+	i2c-switch@75 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x75>;
+		i2c-mux-idle-disconnect;
+
+		i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			// Rear-Fan 
+			max31790@58 {
+				compatible = "maxim,max31790";
+				reg = <0x58>;
+			};
+		};
+
+		i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			// Mid-Fan 
+			max31790@58 {
+				compatible = "maxim,max31790";
+				reg = <0x58>;
+			};
+		};
+
+		i2c-bus@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+			
+			// INLET1_T
+			lm75@5c {
+				compatible = "ti,lm75";
+				reg = <0x5c>;
+			};
+		};
+
+		i2c-bus@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+			
+			// OUTLET1_T
+			lm75@5c {
+				compatible = "ti,lm75";
+				reg = <0x5c>;
+			};
+		};
+
+		i2c-bus@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+
+			// OUTLET2_T
+			lm75@5c {
+				compatible = "ti,lm75";
+				reg = <0x5c>;
+			};
+		};
+
+		i2c-bus@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+
+			// OUTLET3_T
+			lm75@5c {
+				compatible = "ti,lm75";
+				reg = <0x5c>;
+			};
+		};
+	};
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		i2c-bus@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			// STB-T
+			pmbus@74 {
+				compatible = "pmbus";
+				reg = <0x74>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	smpro@4f {
+		compatible = "ampere,smpro";
+		reg = <0x4f>;
+	};
+
+	smpro@4e {
+		compatible = "ampere,smpro";
+		reg = <0x4e>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		i2c-bus@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			// ADC sensors
+			adm1266@40 {
+				compatible = "adi,adm1266";
+				reg = <0x40>;
+			};
+		};
+
+		i2c-bus@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			// ADC sensors
+			adm1266@41 {
+				compatible = "adi,adm1266";
+				reg = <0x41>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+	};
+};
+
+&i2c13 {
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		i2c-bus@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			// M2_ZONE_T
+			lm75@28 {
+				compatible = "ti,lm75";
+				reg = <0x28>;
+			};
+		};
+
+		i2c-bus@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+
+			// BATT_ZONE_T
+			lm75@29 {
+				compatible = "ti,lm75";
+				reg = <0x29>;
+			};
+		};
+
+		i2c-bus@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+
+			// NBM1_ZONE_T
+			lm75@28 {
+				compatible = "ti,lm75";
+				reg = <0x28>;
+			};
+		};
+		i2c-bus@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+
+			// NBM2_ZONE_T
+			lm75@29 {
+				compatible = "ti,lm75";
+				reg = <0x29>;
+			};
+		};
+	};
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&spi0 {
+	cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <
+			&gpio61oh_pins
+			&gpio62oh_pins
+			&gpio161ol_pins
+			&gpio163i_pins
+			&gpio167ol_pins
+			&gpio95i_pins
+			&gpio65ol_pins
+			&gpio66oh_pins
+			&gpio67oh_pins
+			&gpio68ol_pins
+			&gpio69i_pins
+			&gpio70ol_pins
+			&gpio71i_pins
+			&gpio72i_pins
+			&gpio73i_pins
+			&gpio74i_pins
+			&gpio75i_pins
+			&gpio76i_pins
+			&gpio77i_pins
+			&gpio78i_pins
+			&gpio79ol_pins
+			&gpio80oh_pins
+			&gpio81i_pins
+			&gpio82i_pins
+			&gpio83i_pins
+			&gpio144i_pins
+			&gpio145i_pins
+			&gpio146i_pins
+			&gpio147oh_pins
+			&gpio168ol_pins
+			&gpio169oh_pins
+			&gpio170ol_pins
+			&gpio218oh_pins
+			&gpio37i_pins
+			&gpio38i_pins
+			&gpio39i_pins
+			&gpio40i_pins
+			&gpio121i_pins
+			&gpio122i_pins
+			&gpio123i_pins
+			&gpio124i_pins
+			&gpio125i_pins
+			&gpio126i_pins
+			&gpio127i_pins
+			&gpio136i_pins
+			&gpio137oh_pins
+			&gpio138i_pins
+			&gpio139i_pins
+			&gpio140i_pins
+			&gpio141i_pins
+			&gpio190oh_pins
+			&gpio191oh_pins
+			&gpio195ol_pins
+			&gpio196ol_pins
+			&gpio199i_pins
+			&gpio202ol_pins
+			>;
+};
+
+&gcr {
+	serial_port_mux: mux-controller {
+		compatible = "mmio-mux";
+		#mux-control-cells = <1>;
+
+		mux-reg-masks = <0x38 0x07>;
+		idle-states = <2>;
+	};
+};
-- 
2.17.1

