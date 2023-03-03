Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0396AB37F
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 00:27:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVHtW1LKnz3cKj
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 10:27:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IDWrg/lG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=tomato1220@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IDWrg/lG;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSdYL6Z3Mz3cMb
	for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2023 17:36:54 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso5151156pjr.5
        for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2023 22:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODnSNW3NDprb8e2w2ZF2A1vgC7EGiJ9BfGueGcrdmV8=;
        b=IDWrg/lGWgqzMHNMj801dz/1B8+G5HqEFh78PD1OS+NQ4WJSE5HOfL/eoRTujak6Yl
         V2RGw9K2Odq5rt57lpPNbDkxadu1bd2HQyDj4SDUeYsOrLkBf2ZIFQRrwolevn7uPpmB
         E4Kp7xitc3xTysSXC9quJOsp4O87tboEWHuDrKn56Q2PAfP9NijD8lVj+Iu+XvOSpp5g
         CszqPPd8KDKWauV/HAKJNmfKUMXzqRQl+SqTfkb3G26FgB1NtN/8ReEj+UYr8XRHtqi4
         lRPqGKAYntKaHUfe49uW/ng1rTDPDzw4FM5fRtbvmbzd+YY2AfLraNG8Lo1D6tTdp4L0
         MSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODnSNW3NDprb8e2w2ZF2A1vgC7EGiJ9BfGueGcrdmV8=;
        b=zaMpZ1K10fFVeiHq1q1B5zTvN3oLIiPrFMFhdh130IJfKKKCHQBi5J3oWmlKzFO8Qc
         HhZO1qaAU+OGxGYzaRkQEfzrZfTsXLaQDnhenTBVGj/lk8tzoyBMdIjqIivXVaCxzjYV
         E8gACSTDhbUvY+v+OX8QEdZCSgR7jpEioNq3nhKkFxjOsbFSFlE4WmGYqtSf9xMjKhWN
         P+jHRzffK3cswHNFqkUa2WLw2Z4+Qj/3NzF14Ekm3EFNk9DBpOvYbhEmiiUHR/UTc1t0
         9pPsWBKeWclAup4jopoPzSbmxNH42fl9+RlHIXWRVpfuXtxhoaziI++Ry+c9yp4LRvUA
         32nw==
X-Gm-Message-State: AO0yUKXauRhyQWwRUDV9LP+Ux/qmq+nQCFxGM6Xf3h30Kl7wCbjhUudg
	ZeTJYCY2S4zFwesQ4FU8Bq8=
X-Google-Smtp-Source: AK7set9g7+2TiLP0B0zI4ELD0vyzSlLDVuDI0J7Ss3CK7pURYJpmzN1dZkOa00fcjhz5tpcoltev3w==
X-Received: by 2002:a17:902:d502:b0:19d:16e4:ac0f with SMTP id b2-20020a170902d50200b0019d16e4ac0fmr1185475plg.5.1677825412417;
        Thu, 02 Mar 2023 22:36:52 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:36:52 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 2/7] ARM: dts: nuvoton: Add Quanta GSZ BMC Device Tree
Date: Fri,  3 Mar 2023 14:34:30 +0800
Message-Id: <20230303063435.803097-2-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 10:24:04 +1100
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
Cc: devicetree@vger.kernel.org, David Wang <davidwang@quantatw.com>, fran.hsu@quantatw.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the device tree for the Quanta GSZ BMC and it's
based on NPCM730 SoC

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/Makefile                    |    1 +
 .../boot/dts/nuvoton-npcm730-gsz-gpio.dtsi    |  380 ++++
 arch/arm/boot/dts/nuvoton-npcm730-gsz.dts     | 1523 +++++++++++++++++
 3 files changed, 1904 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsz-gpio.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsz.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 40659106cfe1..f2bbbd76d3a9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -397,6 +397,7 @@ dtb-$(CONFIG_ARCH_NPCM7XX) += \
 	nuvoton-npcm730-gsj.dtb \
 	nuvoton-npcm730-gbs.dtb \
 	nuvoton-npcm730-gis.dtb \
+	nuvoton-npcm730-gsz.dtb \
 	nuvoton-npcm730-kudo.dtb \
 	nuvoton-npcm750-evb.dtb \
 	nuvoton-npcm750-runbmc-olympus.dtb
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsz-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-gsz-gpio.dtsi
new file mode 100644
index 000000000000..c081043aaef6
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsz-gpio.dtsi
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2021 Quanta Computer Inc. Fran.Hsu@quantatw.com
+
+/ {
+	pinctrl: pinctrl@f0800000 {
+		gpio1_pins: gpio1-pins {
+			pins = "GPIO1/IOX1LD";
+			input-enable;
+			bias-disable;
+		};
+		gpio2_pins: gpio2-pins {
+			pins = "GPIO2/IOX1CK";
+			input-enable;
+			bias-disable;
+		};
+		gpio3_pins: gpio3-pins {
+			pins = "GPIO3/IOX1D0";
+			input-enable;
+			bias-disable;
+		};
+		gpio4_pins: gpio4-pins {
+			pins = "GPIO4/IOX2DI/SMB1DSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio5_pins: gpio5-pins {
+			pins = "GPIO5/IOX2LD/SMB1DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio8_pins: gpio8-pins {
+			pins = "GPIO8/LKGPO1";
+			bias-disable;
+			input-enable;
+		};
+		gpio9_pins: gpio9-pins {
+			pins = "GPIO9/LKGPO2";
+			bias-disable;
+			input-enable;
+		};
+		gpio11_pins: gpio11-pins {
+			pins = "GPIO11/IOXHCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio12_pins: gpio12-pins {
+			pins = "GPIO12/GSPICK/SMB5BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio13_pins: gpio13-pins {
+			pins = "GPIO13/GSPIDO/SMB5BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio14_pins: gpio14-pins {
+			pins = "GPIO14/GSPIDI/SMB5CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio17_pins: gpio17-pins {
+			pins = "GPIO17/PSPI2DI/SMB4DEN";
+			bias-disable;
+			input-enable;
+		};
+		gpio18_pins: gpio18-pins {
+			pins = "GPIO18/PSPI2D0/SMB4BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio19_pins: gpio19-pins {
+			pins = "GPIO19/PSPI2CK/SMB4BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio24_pins: gpio24-pins {
+			pins = "GPIO24/HGPIO4/IOXHDO";
+			bias-disable;
+			input-enable;
+		};
+		gpio25_pins: gpio25-pins {
+			pins = "GPIO25/HGPIO5/IOXHDI";
+			bias-disable;
+			input-enable;
+		};
+		gpio38_pins: gpio38-pins {
+			pins = "GPIO38/SMB3CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio39_pins: gpio39-pins {
+			pins = "GPIO39/SMB3BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio40_pins: gpio40-pins {
+			pins = "GPIO40/SMB3BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio45_pins: gpio45-pins {
+			pins = "GPIO45/nDCD1/JTDO2";
+			bias-disable;
+			input-enable;
+		};
+		gpio47_pins: gpio47-pins {
+			pins = "GPIO47/nRI1/JCP_RDY2";
+			bias-disable;
+			input-enable;
+		};
+		gpio57_pins: gpio57-pins {
+			pins = "GPIO57/R1MDC";
+			bias-disable;
+			input-enable;
+		};
+		gpio58_pins: gpio58-pins {
+			pins = "GPIO58/R1MDIO";
+			bias-disable;
+			input-enable;
+		};
+		gpio60_pins: gpio60-pins {
+			pins = "GPIO60/HGPIO7/SMB3DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio64_pins: gpio64-pins {
+			pins = "GPIO64/FANIN0";
+			bias-disable;
+			input-enable;
+			input-debounce;
+		};
+		gpio65_pins: gpio65-pins {
+			pins = "GPIO65/FANIN1";
+			bias-disable;
+			input-enable;
+			input-debounce;
+		};
+		gpio71_pins: gpio71-pins {
+			pins = "GPIO71/FANIN7";
+			bias-disable;
+			input-enable;
+		};
+		gpio73_pins: gpio73-pins {
+			pins = "GPIO73/FANIN9";
+			bias-disable;
+			input-enable;
+		};
+		gpio74_pins: gpio74-pins {
+			pins = "GPIO74/FANIN10";
+			bias-disable;
+			input-enable;
+		};
+		gpio78_pins: gpio78-pins {
+			pins = "GPIO78/FANIN14";
+			bias-disable;
+			input-enable;
+		};
+		gpio79_pins: gpio79-pins {
+			pins = "GPIO79/FANIN15";
+			bias-disable;
+			input-enable;
+		};
+		gpio93_pins: gpio93-pins {
+			pins = "GPIO93/GA20/SMB5DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio94_pins: gpio94-pins {
+			pins = "GPIO94/nKBRST/SMB5DSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio110_pins: gpio110_pins {
+			pins = "GPIO110/RG2TXD0/DDRV0";
+			bias-disable;
+			input-enable;
+		};
+		gpio111_pins: gpio111_pins {
+			pins = "GPIO111/RG2TXD1/DDRV1";
+			bias-disable;
+			input-enable;
+		};
+		gpio112_pins: gpio112_pins {
+			pins = "GPIO112/RG2TXD2/DDRV2";
+			bias-disable;
+			input-enable;
+		};
+		gpio113_pins: gpio113_pins {
+			pins = "GPIO113/RG2TXD3/DDRV3";
+			bias-disable;
+			input-enable;
+		};
+		gpio121_pins: gpio121-pins {
+			pins = "GPIO121/SMB2CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio122_pins: gpio122-pins {
+			pins = "GPIO122/SMB2BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio123_pins: gpio123-pins {
+			pins = "GPIO123/SMB2BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio124_pins: gpio124-pins {
+			pins = "GPIO124/SMB1CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio127_pins: gpio127-pins {
+			pins = "GPIO127/SMB1BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio136_pins: gpio136-pins {
+			pins = "GPIO136/SD1DT0";
+			bias-disable;
+			input-enable;
+		};
+		gpio137_pins: gpio137-pins {
+			pins = "GPIO137/SD1DT1";
+			bias-disable;
+			input-enable;
+		};
+		gpio138_pins: gpio138-pins {
+			pins = "GPIO138/SD1DT2";
+			bias-disable;
+			input-enable;
+		};
+		gpio139_pins: gpio139-pins {
+			pins = "GPIO139/SD1DT3";
+			bias-disable;
+			input-enable;
+		};
+		gpio140_pins: gpio140-pins {
+			pins = "GPIO140/SD1CLK";
+			bias-disable;
+			input-enable;
+		};
+		gpio141_pins: gpio141-pins {
+			pins = "GPIO141/SD1WP";
+			bias-disable;
+			input-enable;
+		};
+		gpio142_pins: gpio142-pins {
+			pins = "GPIO142/SD1CMD";
+			bias-disable;
+			input-enable;
+		};
+		gpio143_pins: gpio143-pins {
+			pins = "GPIO143/SD1CD/SD1PWR";
+			bias-disable;
+			input-enable;
+		};
+		gpio144_pins: gpio144-pins {
+			pins = "GPIO144/PWM4";
+			bias-disable;
+			input-enable;
+		};
+		gpio146_pins: gpio146-pins {
+			pins = "GPIO146/PWM6";
+			bias-disable;
+			input-enable;
+		};
+		gpio175ol_pins: gpio175ol-pins {
+			pins = "GPIO175/PSPI1CK/FANIN19";
+			bias-disable;
+			output-low;
+		};
+		gpio176o_pins: gpio176o-pins {
+			pins = "GPIO176/PSPI1DO/FANIN18";
+			bias-disable;
+			output-high;
+		};
+		gpio177_pins: gpio177-pins {
+			pins = "GPIO177/PSPI1DI/FANIN17";
+			bias-disable;
+			input-enable;
+		};
+		gpio192_pins: gpio192-pins {
+			pins = "GPIO192";
+			bias-disable;
+			input-enable;
+		};
+		gpio194_pins: gpio194-pins {
+			pins = "GPIO194/SMB0BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio195_pins: gpio195-pins {
+			pins = "GPIO195/SMB0BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio196_pins: gpio196-pins {
+			pins = "GPIO196/SMB0CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio197_pins: gpio197-pins {
+			pins = "GPIO197/SMB0DEN";
+			bias-disable;
+			input-enable;
+		};
+		gpio199_pins: gpio199-pins {
+			pins = "GPIO199/SMB0DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio202_pins: gpio202-pins {
+			pins = "GPIO202/SMB0CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio204_pins: gpio204-pins {
+			pins = "GPIO204/DDC2SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio208_pins: gpio208-pins {
+			pins = "GPIO208/RG2TXC/DVCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio209_pins: gpio209-pins {
+			pins = "GPIO209/RG2TXCTL/DDRV4";
+			bias-disable;
+			input-enable;
+		};
+		gpio210_pins: gpio210-pins {
+			pins = "GPIO210/RG2RXD0/DDRV5";
+			bias-disable;
+			input-enable;
+		};
+		gpio211_pins: gpio211-pins {
+			pins = "GPIO211/RG2RXD1/DDRV6";
+			bias-disable;
+			input-enable;
+		};
+		gpio213_pins: gpio213-pins {
+			pins = "GPIO213/RG2RXD3/DDRV8";
+			bias-disable;
+			input-enable;
+		};
+		gpio214_pins: gpio214-pins {
+			pins = "GPIO214/RG2RXC/DDRV9";
+			bias-disable;
+			input-enable;
+		};
+		gpio224_pins: gpio224-pins {
+			pins = "GPIO224/SPIXCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio227_pins: gpio227-pins {
+			pins = "GPIO227/nSPIXCS0";
+			bias-disable;
+			input-enable;
+		};
+		gpio228_pins: gpio228-pins {
+			pins = "GPIO228/nSPIXCS1";
+			bias-disable;
+			input-enable;
+		};
+		gpio230_pins: gpio230-pins {
+			pins = "GPIO230/SPIXD3";
+			bias-disable;
+			input-enable;
+		};
+		gpio231_pins: gpio231-pins {
+			pins = "GPIO231/nCLKREQ";
+			bias-disable;
+			input-enable;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsz.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsz.dts
new file mode 100644
index 000000000000..c9f11880ef6d
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsz.dts
@@ -0,0 +1,1523 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2021 Quanta Computer Inc. Fran.Hsu@quantatw.com
+
+/dts-v1/;
+#include "nuvoton-npcm730.dtsi"
+#include "nuvoton-npcm730-gsz-gpio.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Quanta GSZ Board (Device Tree v01.10)";
+	compatible = "nuvoton,npcm750";
+
+	aliases {
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		udc8 = &udc8;
+		emmc0 = &sdhci0;
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
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+		i2c16 = &i2c_9SQ440NQQI8;
+		i2c17 = &i2c_db2001;
+		i2c18 = &i2c_db1200;
+		i2c19 = &i2c_io_exp_1;
+		i2c20 = &i2c_cpu0_pirom;
+		i2c21 = &i2c_cpu1_pirom;
+		i2c22 = &i2c_ncsi_clk;
+		i2c23 = &i2c_m2;
+		i2c24 = &i2c_fivra_cpu0;
+		i2c25 = &i2c_fivra_cpu1;
+		i2c26 = &i2c_vccfa_cpu0;
+		i2c27 = &i2c_vccfa_cpu1;
+		i2c28 = &i2c_vccd_cpu0;
+		i2c29 = &i2c_vccd_cpu1;
+		i2c30 = &i2c_hotswap;
+		i2c31 = &i2c_tps_1;
+		i2c32 = &i2c_p12v_1;
+		i2c33 = &i2c_p12v_2;
+		i2c34 = &i2c_fan_controller_1;
+		i2c35 = &i2c_i2cool_1;
+		i2c36 = &i2c_i2cool_2;
+		i2c37 = &i2c_i2cool_3;
+		i2c38 = &i2c_seq_mobo;
+		i2c39 = &i2c_fru_2;
+		i2c40 = &i2c_io_exp_2;
+		i2c41 = &i2c_io_exp_3;
+		i2c43 = &i2c_fru_3;
+		i2c44 = &i2c_seq;
+		i2c45 = &i2c_fru_1;
+		i2c46 = &i2c_tang;
+		i2c51 = &i2c_pe0_0;
+		i2c52 = &i2c_pe0_1;
+		i2c53 = &i2c_pe0_2;
+		i2c54 = &i2c_pe1_0;
+		i2c55 = &i2c_pe1_1;
+		i2c56 = &i2c_pe1_2;
+		i2c57 = &i2c_pe2_0;
+		i2c58 = &i2c_pe2_1;
+		i2c59 = &i2c_pe2_2;
+		i2c60 = &i2c_pe3_0;
+		i2c61 = &i2c_pe3_1;
+		i2c62 = &i2c_pe3_2;
+		i2c63 = &i2c_pe4_0;
+		i2c64 = &i2c_pe4_1;
+		i2c65 = &i2c_pe4_2;
+		i2c66 = &i2c_pe5_0;
+		i2c67 = &i2c_pe5_1;
+		i2c68 = &i2c_pe5_2;
+		i2c69 = &i2c_pe6_0;
+		i2c70 = &i2c_pe6_1;
+		i2c71 = &i2c_pe6_2;
+		i2c72 = &i2c_pe7_0;
+		i2c73 = &i2c_pe7_1;
+		i2c74 = &i2c_pe7_2;
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
+	gpio-keys {
+		compatible = "gpio-keys";
+		efuse-pg {
+			label = "efuse-pg";
+			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
+			linux,code = <57>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-bmc-live {
+			gpios = <&pca6416 4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		LED_SYS_ERROR {
+			gpios = <&pca6416 3 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_SYS_ATTN {
+			gpios = <&pca6416 5 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_SYS_STATE {
+			gpios = <&pca6416_2 15 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_BMC_FAULT {
+			gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		ERR0 {
+			gpios = <&pca9555 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		ERR1 {
+			gpios = <&pca9555 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		ERR2 {
+			gpios = <&pca9555 2 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	seven-seg-disp {
+		compatible = "seven-seg-gpio-dev";
+		refresh-interval-ms = /bits/ 16 <600>;
+		clock-gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+		data-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+		clear-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	pcie-slot {
+		pcie0: pcie-slot@0 {
+			label = "PE0";
+		};
+
+		pcie1: pcie-slot@1 {
+			label = "PE1";
+		};
+
+		pcie2: pcie-slot@2 {
+			label = "PE2";
+		};
+
+		pcie3: pcie-slot@3 {
+			label = "PE3";
+		};
+
+		pcie4: pcie-slot@4 {
+			label = "PE4";
+		};
+
+		pcie5: pcie-slot@5 {
+			label = "PE5";
+		};
+
+		pcie6: pcie-slot@6 {
+			label = "PE6";
+		};
+
+		pcie7: pcie-slot@7 {
+			label = "PE7";
+		};
+	};
+};
+
+&gcr {
+	serial_port_mux: mux-controller {
+		compatible = "mmio-mux";
+		#mux-control-cells = <1>;
+		mux-reg-masks = <0x38 0x07>;
+		idle-states = <2>; /* Serial port mode 3 (takeover) */
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
+	fixed-link {
+		speed = <100>;
+		full-duplex;
+	};
+};
+
+&mc {
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
+&aes {
+	status = "okay";
+};
+
+&sha {
+	status = "okay";
+};
+
+&udc5 {
+	status = "okay";
+};
+
+&udc6 {
+	status = "okay";
+};
+
+&udc7 {
+	status = "okay";
+};
+
+&udc8 {
+	status = "okay";
+};
+
+&pcimbox {
+	status = "okay";
+};
+
+&sdhci0 {
+	status = "okay";
+};
+
+&fiu0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0cs1_pins>;
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <19000000>;
+		spi-rx-bus-width = <2>;
+		label = "bmc";
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			u-boot@0 {
+				label = "u-boot";
+				reg = <0x0000000 0xf0000>;
+			};
+			image-descriptor@f0000 {
+				label = "image-descriptor";
+				reg = <0xf0000 0x10000>;
+			};
+			hoth-update@100000 {
+				label = "hoth-update";
+				reg = <0x100000 0x100000>;
+			};
+			kernel@200000 {
+				label = "kernel";
+				reg = <0x200000 0x500000>;
+			};
+			rofs@700000 {
+				label = "rofs";
+				reg = <0x700000 0x35f0000>;
+			};
+			rwfs@3cf0000 {
+				label = "rwfs";
+				reg = <0x3cf0000 0x300000>;
+			};
+			hoth-mailbox@3ff0000 {
+				label = "hoth-mailbox";
+				reg = <0x3ff0000 0x10000>;
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>;
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <2>;
+		label="bios";
+	};
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
+&lpc_kcs {
+	kcs1: kcs1@0 {
+		status = "okay";
+	};
+
+	kcs2: kcs2@0 {
+		status = "okay";
+	};
+
+	kcs3: kcs3@0 {
+		status = "okay";
+	};
+};
+
+&lpc_host {
+	lpc_bpc: lpc_bpc@40 {
+		monitor-ports = <0x80>;
+		status = "okay";
+	};
+};
+
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	i2c-switch@75 {
+		compatible = "nxp,pca9548";
+		reg = <0x75>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>; //gpio84
+
+		i2c_9SQ440NQQI8: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_db2001: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_db1200: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_io_exp_1: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			pca6416@20 {
+				compatible = "nxp,pca6416";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
+
+				G1A_P8 {
+					gpio-hog;
+					gpios = <8 0>;
+					input;
+					line-name = "PWRGD_P13V5_CPU0_R";
+				};
+				G1A_P9 {
+					gpio-hog;
+					gpios = <9 0>;
+					input;
+					line-name = "PWRGD_P13V5_CPU1_R";
+				};
+				G1A_P10 {
+					gpio-hog;
+					gpios = <10 0>;
+					input;
+					line-name = "PWRGD_PVPP_HBM_R_CPU0";
+				};
+				G1A_P11 {
+					gpio-hog;
+					gpios = <11 0>;
+					input;
+					line-name = "PWRGD_PVPP_HBM_R_CPU1";
+				};
+			};
+		};
+
+		i2c_cpu0_pirom: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		i2c_cpu1_pirom: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		i2c_ncsi_clk: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		i2c_m2: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&gpio2 21 GPIO_ACTIVE_LOW>; //gpio85
+
+			i2c_fivra_cpu0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			vrm@72 {
+				compatible = "isil,raa229004", "xdpe152";
+				reg = <0x72>;
+			};
+		};
+
+			i2c_fivra_cpu1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			vrm@72 {
+				compatible = "isil,raa229004", "xdpe152";
+				reg = <0x72>;
+			};
+		};
+
+		i2c_vccfa_cpu0: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			vrm@72 {
+				compatible = "isil,isl69260", "xdpe152";
+				reg = <0x72>;
+			};
+		};
+
+		i2c_vccfa_cpu1: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			vrm@72 {
+				compatible = "isil,isl69260", "xdpe152";
+				reg = <0x72>;
+			};
+		};
+
+		i2c_vccd_cpu0: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+			vrm@72 {
+				compatible = "isil,isl69260", "xdpe152";
+				reg = <0x72>;
+			};
+		};
+
+		i2c_vccd_cpu1: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+			vrm@72 {
+				compatible = "isil,isl69260", "xdpe152";
+				reg = <0x72>;
+			};
+		};
+
+		i2c_hotswap: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+			adm1272@1f {
+				compatible = "adi,adm1272";
+				reg = <0x1f>;
+				shunt-resistor-micro-ohms = <267>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&gpio2 22 GPIO_ACTIVE_LOW>; //gpio86
+
+		i2c_tps_1: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			// P3V3, TPS546D24ARVFR
+			tps546d24@25 {
+				compatible = "tps546d24";
+				reg = <0x25>;
+			};
+		};
+
+		i2c_p12v_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_p12v_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_fan_controller_1: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			fan_controller@2c {
+				compatible = "maxim,max31790";
+				reg = <0x2c>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		i2c_i2cool_1: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+			lm75@5c {
+				compatible = "maxim,max31725";
+				reg = <0x5c>;
+				status = "okay";
+			};
+		};
+
+		i2c_i2cool_2: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+			lm75@5c {
+				compatible = "maxim,max31725";
+				reg = <0x5c>;
+				status = "okay";
+			};
+		};
+
+		i2c_i2cool_3: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+			lm75@5c {
+				compatible = "maxim,max31725";
+				reg = <0x5c>;
+				status = "okay";
+			};
+		};
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	pcie-slot = &pcie0;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	gpio@21 {
+			compatible = "nxp,pca8574";
+			reg = <0x21>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names = "", "", "", "", "", "PE0_J16_CABLE_PRSNT_N", "", "";
+			PE0_P5 {
+				gpios = <5 GPIO_ACTIVE_HIGH>;
+				input;
+				line-name = "PE0_J16_CABLE_PRSNT_N";
+			};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c_pe0_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pe0_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_pe0_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			pe0_x8_io_exp: pca9538@72 {
+				compatible = "nxp,pca9538";
+				reg = <0x72>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	mobo_fru_1@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&gpio2 26 GPIO_ACTIVE_LOW>; //gpio90
+
+			i2c_seq_mobo: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			sequencer@59 {
+				compatible = "maxim,max34451";
+				reg = <0x59>;
+			};
+		};
+
+		i2c_fru_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			mobo_fru_2@55 {
+				compatible = "atmel,24c256";
+				reg = <0x55>;
+			};
+		};
+
+		i2c_io_exp_2: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			pca6416_2: pca6416@20 {
+				compatible = "nxp,pca6416";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				reset-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
+
+				G4A_P14 {
+					gpio-hog;
+					gpios = <14 0>;
+					input;
+					line-name = "GRANITE_PRSNT_N";
+				};
+			};
+		};
+
+		i2c_io_exp_3: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+			pca6416_3: pca6416@20 {
+				compatible = "nxp,pca6416";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "PE0_ADP_R_PRSNT_N","PE1_ADP_R_PRSNT_N",
+				"PE2_ADP_R_PRSNT_N", "PE3_ADP_R_PRSNT_N", "PE4_ADP_R_PRSNT_N",
+				"PE5_ADP_R_PRSNT_N", "PE6_ADP_R_PRSNT_N", "PE7_ADP_R_PRSNT_N",
+					"", "", "", "", "", "", "", "";
+				reset-gpios = <&gpio2 25 GPIO_ACTIVE_LOW>;
+				G4B_P0 {
+					gpios = <0 0 GPIO_ACTIVE_LOW>;
+					input;
+					line-name = "PE0_ADP_R_PRSNT_N";
+				};
+				G4B_P1 {
+					gpios = <1 0 GPIO_ACTIVE_LOW>;
+					input;
+					line-name = "PE1_ADP_R_PRSNT_N";
+				};
+				G4B_P2 {
+					gpios = <2 0 GPIO_ACTIVE_LOW>;
+					input;
+					line-name = "PE2_ADP_R_PRSNT_N";
+				};
+				G4B_P3 {
+					gpios = <3 0 GPIO_ACTIVE_LOW>;
+					input;
+					line-name = "PE3_ADP_R_PRSNT_N";
+				};
+				G4B_P4 {
+					gpios = <4 0 GPIO_ACTIVE_LOW>;
+					input;
+					line-name = "PE4_ADP_R_PRSNT_N";
+				};
+				G4B_P5 {
+					gpios = <5 0 GPIO_ACTIVE_LOW>;
+					input;
+					line-name = "PE5_ADP_R_PRSNT_N";
+				};
+				G4B_P6 {
+					gpios = <6 0 GPIO_ACTIVE_LOW>;
+					input;
+					line-name = "PE6_ADP_R_PRSNT_N";
+				};
+				G4B_P7 {
+					gpios = <7 0 GPIO_ACTIVE_LOW>;
+					input;
+					line-name = "PE7_ADP_R_PRSNT_N";
+				};
+			};
+		};
+
+		i2c_fru_3: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+			pdb_fru@55 {
+				compatible = "atmel,24c64";
+				reg = <0x55>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	pcie-slot = &pcie1;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c_pe1_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pe1_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_pe1_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			pe1_x8_io_exp: pca9538@72 {
+				compatible = "nxp,pca9538";
+				reg = <0x72>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
+
+&i2c6 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	pcie-slot = &pcie2;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	gpio@21 {
+			compatible = "nxp,pca8574";
+			reg = <0x21>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names = "", "", "", "", "", "PE2_J16_CABLE_PRSNT_N", "", "";
+			PE2_P5 {
+				gpios = <5 GPIO_ACTIVE_HIGH>;
+				input;
+				line-name = "PE2_J16_CABLE_PRSNT_N";
+			};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c_pe2_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pe2_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_pe2_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			pe2_x8_io_exp: pca9538@72 {
+				compatible = "nxp,pca9538";
+				reg = <0x72>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
+
+&i2c7 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	pcie-slot = &pcie3;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c_pe3_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pe3_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_pe3_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			pe3_x8_io_exp: pca9538@72 {
+				compatible = "nxp,pca9538";
+				reg = <0x72>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
+
+&i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	pcie-slot = &pcie4;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	gpio@21 {
+			compatible = "nxp,pca8574";
+			reg = <0x21>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names = "", "", "", "", "", "PE4_J16_CABLE_PRSNT_N", "", "";
+			PE4_P5 {
+				gpios = <5 GPIO_ACTIVE_HIGH>;
+				input;
+				line-name = "PE4_J16_CABLE_PRSNT_N";
+			};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c_pe4_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pe4_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_pe4_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			pe4_x8_io_exp: pca9538@72 {
+				compatible = "nxp,pca9538";
+				reg = <0x72>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
+
+&i2c9 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	pcie-slot = &pcie5;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c_pe5_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pe5_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_pe5_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			pe5_x8_io_exp: pca9538@72 {
+				compatible = "nxp,pca9538";
+				reg = <0x72>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
+
+&i2c10 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	pcie-slot = &pcie6;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	gpio@21 {
+			compatible = "nxp,pca8574";
+			reg = <0x21>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names = "", "", "", "", "", "PE6_J16_CABLE_PRSNT_N", "", "";
+			PE6_P5 {
+				gpios = <5 GPIO_ACTIVE_HIGH>;
+				input;
+				line-name = "PE6_J16_CABLE_PRSNT_N";
+			};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c_pe6_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pe6_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			pca9538@72 {
+				compatible = "nxp,pca9538";
+				reg = <0x72>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+
+		i2c_pe6_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			pe6_x8_io_exp: pca9538@72 {
+				compatible = "nxp,pca9538";
+				reg = <0x72>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			fan_controller@2c {
+				compatible = "maxim,max31790";
+				reg = <0x2c>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&i2c11 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	pcie-slot = &pcie7;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c_pe7_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pe7_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_pe7_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			pe7_x8_io_exp: pca9538@72 {
+				compatible = "nxp,pca9538";
+				reg = <0x72>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
+
+&i2c12 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c13 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	pca9555: pca9555@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c14 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pca6416: pca6416@20 {
+		compatible = "nxp,pca6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		reset-gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+
+		G14_P8 {
+			gpio-hog;
+			gpios = <8 0>;
+			output-high;
+			line-name = "RST_PCIE_PE0_N";
+		};
+		G14_P9 {
+			gpio-hog;
+			gpios = <9 0>;
+			output-high;
+			line-name = "RST_PCIE_PE1_N";
+		};
+		G14_P10 {
+			gpio-hog;
+			gpios = <10 0>;
+			output-high;
+			line-name = "RST_PCIE_PE2_N";
+		};
+		G14_P11 {
+			gpio-hog;
+			gpios = <11 0>;
+			output-high;
+			line-name = "RST_PCIE_PE3_N";
+		};
+		G14_P12 {
+			gpio-hog;
+			gpios = <12 0>;
+			output-high;
+			line-name = "RST_PCIE_PE4_N";
+		};
+		G14_P13 {
+			gpio-hog;
+			gpios = <13 0>;
+			output-high;
+			line-name = "RST_PCIE_PE5_N";
+		};
+		G14_P14 {
+			gpio-hog;
+			gpios = <14 0>;
+			output-high;
+			line-name = "RST_PCIE_PE6_N";
+		};
+		G14_P15 {
+			gpio-hog;
+			gpios = <15 0>;
+			output-high;
+			line-name = "RST_PCIE_PE7_N";
+		};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&gpio2 24 GPIO_ACTIVE_LOW>; //gpio88
+
+		i2c_seq: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			sequencer@59 {
+				compatible = "maxim,max34451";
+				reg = <0x59>;
+			};
+		};
+
+		i2c_fru_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_tang: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+			max31725@5c {
+				compatible = "maxim,max31725";
+				reg = <0x5c>;
+				status = "okay";
+			};
+		};
+
+	};
+};
+
+&spi0 {
+	cs-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio175ol_pins &gpio176o_pins
+		&gpio177_pins>;
+	status = "okay";
+	jtag_master {
+		compatible = "nuvoton,npcm750-jtag-master";
+		spi-max-frequency = <25000000>;
+		reg = <0>;
+
+		pinctrl-names = "pspi", "gpio";
+		pinctrl-0 = <&pspi1_pins>;
+		pinctrl-1 = <&gpio175ol_pins &gpio176o_pins
+				&gpio177_pins>;
+
+		tck-gpios = <&gpio5 15 GPIO_ACTIVE_HIGH>;
+		tdi-gpios = <&gpio5 16 GPIO_ACTIVE_HIGH>;
+		tdo-gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
+		tms-gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <
+			/* GPI pins*/
+			&gpio4_pins
+			&gpio5_pins
+			&gpio8_pins
+			&gpio9_pins
+			&gpio11_pins
+			&gpio12_pins
+			&gpio13_pins
+			&gpio14_pins
+			&gpio17_pins
+			&gpio18_pins
+			&gpio19_pins
+			&gpio24_pins
+			&gpio25_pins
+			&gpio38_pins
+			&gpio39_pins
+			&gpio40_pins
+			&gpio45_pins
+			&gpio47_pins
+			&gpio57_pins
+			&gpio58_pins
+			&gpio60_pins
+			&gpio64_pins
+			&gpio65_pins
+			&gpio71_pins
+			&gpio73_pins
+			&gpio74_pins
+			&gpio78_pins
+			&gpio79_pins
+			&gpio93_pins
+			&gpio94_pins
+			&gpio110_pins
+			&gpio111_pins
+			&gpio112_pins
+			&gpio113_pins
+			&gpio121_pins
+			&gpio122_pins
+			&gpio123_pins
+			&gpio124_pins
+			&gpio127_pins
+			&gpio136_pins
+			&gpio137_pins
+			&gpio138_pins
+			&gpio139_pins
+			&gpio140_pins
+			&gpio141_pins
+			&gpio142_pins
+			&gpio143_pins
+			&gpio144_pins
+			&gpio146_pins
+			&gpio192_pins
+			&gpio194_pins
+			&gpio195_pins
+			&gpio196_pins
+			&gpio199_pins
+			&gpio202_pins
+			&gpio204_pins
+			&gpio208_pins
+			&gpio209_pins
+			&gpio210_pins
+			&gpio211_pins
+			&gpio213_pins
+			&gpio214_pins
+			&gpio224_pins
+			&gpio227_pins
+			&gpio228_pins
+			&gpio230_pins
+			&gpio231_pins
+			&gpio177_pins
+
+			/* GPO pins*/
+			&gpio175ol_pins
+			&gpio176o_pins
+			>;
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*0-31*/	"","","","","","SATA_PRESENCE","RESET_OUT","POWER_OUT",
+			"","","","","SIO_POWER_GOOD","PS_PWROK","","",
+			"","","","","","","","",
+			"CPU1_THERMTRIP","CPU2_THERMTRIP","","","","","","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*32-63*/	"","","","","","P3VBAT","CPU_CATERR","",
+			"CPU_MCERR","","","","","","","",
+			"","","","","","","","",
+			"","","","","","","","";
+	U86_reset {
+		gpio-hog;
+		gpios = <0 0>;
+		output-low;
+		line-name = "RST_SMB_MUX_PCA9546_0_R_N";
+	};
+};
+
+&gpio2 {
+	gpio-line-names =
+	/*64-95*/	"POWER_BUTTON","RESET_BUTTON","","","","","","",
+			"","CPU1_VRHOT","CPU2_VRHOT","","","DEBUG_EN_N","XDP_PRST_N","",
+			"","TCK_MUX_SEL","PWR_DEBUG_N","PREQ_N","","","","",
+			"","","","","","","PCH_BMC_THERMTRIP","";
+};
+
+&gpio3 {
+	gpio-line-names =
+	/*96-127*/	"","","","","","","","",
+			"","","","","","","","",
+			"","","","","","","","",
+			"","","","","","","","SMI";
+};
+
+&gpio4 {
+	gpio-line-names =
+	/*128-159*/	"","","","","","","","",
+			"CPU1_MEM_THERM_EVENT","CPU2_MEM_THERM_EVENT","CPU_ERR0","CPU_ERR1",
+			"CPU_ERR2","","","POST_COMPLETE",
+			"PRDY_N","SYSPWROK","","","","","","",
+			"","","","","","","","";
+};
+
+&gpio6 {
+	gpio-line-names =
+	/*192-223*/	"","","","CPU1_PRESENCE","CPU2_PRESENCE","","","SIO_S5",
+			"","","","","","","","",
+			"","","","","","","","",
+			"","","","","","","","";
+};
+
+&gpio7 {
+	gpio-line-names =
+	/*224-255*/	"","","","PLTRST_N","CPU1_FIVR_FAULT","","CPU2_FIVR_FAULT","",
+			"","","","","","","","",
+			"","","","","","","","",
+			"","","","","","","","";
+};
+
+&peci0 {
+	cmd-timeout-ms = <1000>;
+	pull-down = <0>;
+	host-neg-bit-rate = <15>;
+	status = "okay";
+
+	intel-peci-dimmtemp@30 {
+		compatible = "intel,peci-client";
+		reg = <0x30>;
+		status = "okay";
+	};
+
+	intel-peci-dimmtemp@31 {
+		compatible = "intel,peci-client";
+		reg = <0x31>;
+		status = "okay";
+	};
+};
-- 
2.25.1

