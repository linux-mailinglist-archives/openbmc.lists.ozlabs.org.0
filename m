Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92015B6089
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 11:41:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YFPD5JkhzF4WC
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 19:41:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YFNM4jSyzF4VT
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 19:41:03 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x8I9eiRd027217;
 Wed, 18 Sep 2019 12:40:44 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 7838A628F1; Wed, 18 Sep 2019 12:40:44 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [linux dev-5.3 v1] arm: dts: add NPCM7xx RunBMC Olympus Quanta device
 tree
Date: Wed, 18 Sep 2019 12:40:32 +0300
Message-Id: <20190918094032.193442-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.18.0
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
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton NPCM7xx RunBMC Olympus Quanta board
device tree.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 ...nuvoton-npcm750-runbmc-olympus-pincfg.dtsi |  517 +++++++
 .../dts/nuvoton-npcm750-runbmc-olympus.dts    | 1197 +++++++++++++++++
 2 files changed, 1714 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus-pincfg.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus-pincfg.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus-pincfg.dtsi
new file mode 100644
index 000000000000..18f320c14fe0
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus-pincfg.dtsi
@@ -0,0 +1,517 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Quanta Computer Inc. Samuel.Jiang@quantatw.com
+
+/ {
+	pinctrl: pinctrl@f0800000 {
+		gpio0ol_pins: gpio0ol-pins {
+			pins = "GPIO0/IOX1DI";
+			bias-disable;
+			output-low;
+		};
+		gpio1ol_pins: gpio1ol-pins {
+			pins = "GPIO1/IOX1LD";
+			bias-disable;
+			output-low;
+		};
+		gpio2ol_pins: gpio2ol-pins {
+			pins = "GPIO2/IOX1CK";
+			bias-disable;
+			output-low;
+		};
+		gpio3ol_pins: gpio3ol-pins {
+			pins = "GPIO3/IOX1D0";
+			bias-disable;
+			output-low;
+		};
+		gpio5_pins: gpio5-pins {
+			pins = "GPIO5/IOX2LD/SMB1DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio6_pins: gpio6-pins {
+			pins = "GPIO6/IOX2CK/SMB2DSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio7_pins: gpio7-pins {
+			pins = "GPIO7/IOX2D0/SMB2DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio8o_pins: gpio8o-pins {
+			pins = "GPIO8/LKGPO1";
+			bias-disable;
+			output-high;
+		};
+		gpio9ol_pins: gpio9ol-pins {
+			pins = "GPIO9/LKGPO2";
+			bias-disable;
+			output-low;
+		};
+		gpio10_pins: gpio10-pins {
+			pins = "GPIO10/IOXHLD";
+			bias-disable;
+			input-enable;
+		};
+		gpio11_pins: gpio11-pins {
+			pins = "GPIO11/IOXHCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio12ol_pins: gpio12ol-pins {
+			pins = "GPIO12/GSPICK/SMB5BSCL";
+			bias-disable;
+			output-low;
+		};
+		gpio13ol_pins: gpio13ol-pins {
+			pins = "GPIO13/GSPIDO/SMB5BSDA";
+			bias-disable;
+			output-low;
+		};
+		gpio14ol_pins: gpio14ol-pins {
+			pins = "GPIO14/GSPIDI/SMB5CSCL";
+			bias-disable;
+			output-low;
+		};
+		gpio15ol_pins: gpio15ol-pins {
+			pins = "GPIO15/GSPICS/SMB5CSDA";
+			bias-disable;
+			output-low;
+		};
+		gpio20_pins: gpio20-pins {
+			pins = "GPIO20/SMB4CSDA/SMB15SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio21_pins: gpio21-pins {
+			pins = "GPIO21/SMB4CSCL/SMB15SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio22o_pins: gpio22o-pins {
+			pins = "GPIO22/SMB4DSDA/SMB14SDA";
+			bias-disable;
+			output-high;
+		};
+		gpio23_pins: gpio23-pins {
+			pins = "GPIO23/SMB4DSCL/SMB14SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio24_pins: gpio24-pins {
+			pins = "GPIO24/IOXHDO";
+			bias-disable;
+			input-enable;
+		};
+		gpio25_pins: gpio25-pins {
+			pins = "GPIO25/IOXHDI";
+			bias-disable;
+			input-enable;
+		};
+		gpio30_pins: gpio27-pins {
+			pins = "GPIO30/SMB3SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio31_pins: gpio27-pins {
+			pins = "GPIO31/SMB3SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio37ol_pins: gpio37ol-pins {
+			pins = "GPIO37/SMB3CSDA";
+			bias-disable;
+			output-low;
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
+		gpio40o_pins: gpio40o-pins {
+			pins = "GPIO40/SMB3BSCL";
+			bias-disable;
+			output-high;
+		};
+		gpio59_pins: gpio59-pins {
+			pins = "GPIO59/SMB3DSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio76_pins: gpio76-pins {
+			pins = "GPIO76/FANIN12";
+			bias-disable;
+			input-enable;
+		};
+		gpio77_pins: gpio77-pins {
+			pins = "GPIO77/FANIN13";
+			bias-disable;
+			input-enable;
+		};
+		gpio78o_pins: gpio78o-pins {
+			pins = "GPIO78/FANIN14";
+			bias-disable;
+			output-high;
+		};
+		gpio79_pins: gpio79-pins {
+			pins = "GPIO79/FANIN15";
+			bias-disable;
+			input-enable;
+		};
+		gpio82_pins: gpio82-pins {
+			pins = "GPIO82/PWM2";
+			bias-disable;
+			input-enable;
+		};
+		gpio83_pins: gpio83-pins {
+			pins = "GPIO83/PWM3";
+			bias-disable;
+			input-enable;
+		};
+		gpio84_pins: gpio84-pins {
+			pins = "GPIO84/R2TXD0";
+			bias-disable;
+			input-enable;
+		};
+		gpio85o_pins: gpio85o-pins {
+			pins = "GPIO85/R2TXD1";
+			bias-disable;
+			output-high;
+		};
+		gpio86ol_pins: gpio86ol-pins {
+			pins = "GPIO86/R2TXEN";
+			bias-disable;
+			output-low;
+		};
+		gpio87_pins: gpio87-pins {
+			pins = "GPIO87/R2RXD0";
+			bias-disable;
+			input-enable;
+		};
+		gpio88_pins: gpio88-pins {
+			pins = "GPIO88/R2RXD1";
+			bias-disable;
+			input-enable;
+		};
+		gpio89_pins: gpio89-pins {
+			pins = "GPIO89/R2CRSDV";
+			bias-disable;
+			input-enable;
+		};
+		gpio90_pins: gpio90-pins {
+			pins = "GPIO90/R2RXERR";
+			bias-disable;
+			input-enable;
+		};
+		gpio93_pins: gpio93-pins {
+			pins = "GPIO93/GA20/SMB5DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio94ol_pins: gpio94ol-pins {
+			pins = "GPIO94/nKBRST/SMB5DSDA";
+			bias-disable;
+			output-low;
+		};
+		gpio108ol_pins: gpio108ol-pins {
+			pins = "GPIO108/RG1MDC";
+			bias-disable;
+			output-low;
+		};
+		gpio109ol_pins: gpio109ol-pins {
+			pins = "GPIO109/RG1MDIO";
+			bias-disable;
+			output-low;
+		};
+		gpio110ol_pins: gpio110ol-pins {
+			pins = "GPIO110/RG2TXD0/DDRV0";
+			bias-disable;
+			output-low;
+		};
+		gpio111ol_pins: gpio111ol-pins {
+			pins = "GPIO111/RG2TXD1/DDRV1";
+			bias-disable;
+			output-low;
+		};
+		gpio112ol_pins: gpio112ol-pins {
+			pins = "GPIO112/RG2TXD2/DDRV2";
+			bias-disable;
+			output-low;
+		};
+		gpio113ol_pins: gpio113ol-pins {
+			pins = "GPIO113/RG2TXD3/DDRV3";
+			bias-disable;
+			output-low;
+		};
+		gpio114o_pins: gpio114o-pins {
+			pins = "GPIO114/SMB0SCL";
+			bias-disable;
+			output-high;
+		};
+		gpio115_pins: gpio115-pins {
+			pins = "GPIO115/SMB0SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio120_pins: gpio120-pins {
+			pins = "GPIO120/SMB2CSDA";
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
+		gpio125_pins: gpio125-pins {
+			pins = "GPIO125/SMB1CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio126_pins: gpio126-pins {
+			pins = "GPIO126/SMB1BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio127o_pins: gpio127o-pins {
+			pins = "GPIO127/SMB1BSCL";
+			bias-disable;
+			output-high;
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
+		gpio145_pins: gpio145-pins {
+			pins = "GPIO145/PWM5";
+			bias-disable;
+			input-enable;
+		};
+		gpio146_pins: gpio146-pins {
+			pins = "GPIO146/PWM6";
+			bias-disable;
+			input-enable;
+		};
+		gpio147_pins: gpio147-pins {
+			pins = "GPIO147/PWM7";
+			bias-disable;
+			input-enable;
+		};
+		gpio153o_pins: gpio153o-pins {
+			pins = "GPIO153/MMCWP";
+			bias-disable;
+			output-high;
+		};
+		gpio155_pins: gpio155-pins {
+			pins = "GPIO155/nMMCCD/nMMCRST";
+			bias-disable;
+			input-enable;
+		};
+		gpio160o_pins: gpio160o-pins {
+			pins = "GPIO160/CLKOUT/RNGOSCOUT";
+			bias-disable;
+			output-high;
+		};
+		gpio169o_pins: gpio169o-pins {
+			pins = "GPIO169/nSCIPME";
+			bias-disable;
+			output-high;
+		};
+		gpio188o_pins: gpio188o-pins {
+			pins = "GPIO188/SPI3D2/nSPI3CS2";
+			bias-disable;
+			output-high;
+		};
+		gpio189_pins: gpio189-pins {
+			pins = "GPIO189/SPI3D3/nSPI3CS3";
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
+		gpio198o_pins: gpio198o-pins {
+			pins = "GPIO198/SMB0DSDA";
+			bias-disable;
+			output-high;
+		};
+		gpio199o_pins: gpio199o-pins {
+			pins = "GPIO199/SMB0DSCL";
+			bias-disable;
+			output-high;
+		};
+		gpio200_pins: gpio200-pins {
+			pins = "GPIO200/R2CK";
+			input-enable;
+			bias-disable;
+		};
+		gpio202_pins: gpio202-pins {
+			pins = "GPIO202/SMB0CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio203o_pins: gpio203o-pins {
+			pins = "GPIO203/FANIN16";
+			bias-disable;
+			output-high;
+		};
+		gpio208_pins: gpio208-pins {
+			pins = "GPIO208/RG2TXC/DVCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio209ol_pins: gpio209ol-pins {
+			pins = "GPIO209/RG2TXCTL/DDRV4";
+			bias-disable;
+			output-low;
+		};
+		gpio210ol_pins: gpio210ol-pins {
+			pins = "GPIO210/RG2RXD0/DDRV5";
+			bias-disable;
+			output-low;
+		};
+		gpio211ol_pins: gpio211ol-pins {
+			pins = "GPIO211/RG2RXD1/DDRV6";
+			bias-disable;
+			output-low;
+		};
+		gpio212ol_pins: gpio212ol-pins {
+			pins = "GPIO212/RG2RXD2/DDRV7";
+			bias-disable;
+			output-low;
+		};
+		gpio213ol_pins: gpio213ol-pins {
+			pins = "GPIO213/RG2RXD3/DDRV8";
+			bias-disable;
+			output-low;
+		};
+		gpio214ol_pins: gpio214ol-pins {
+			pins = "GPIO214/RG2RXC/DDRV9";
+			bias-disable;
+			output-low;
+		};
+		gpio215ol_pins: gpio215ol-pins {
+			pins = "GPIO215/RG2RXCTL/DDRV10";
+			bias-disable;
+			output-low;
+		};
+		gpio216ol_pins: gpio216ol-pins {
+			pins = "GPIO216/RG2MDC/DDRV11";
+			bias-disable;
+			output-low;
+		};
+		gpio217ol_pins: gpio217ol-pins {
+			pins = "GPIO217/RG2MDIO/DVHSYNC";
+			bias-disable;
+			output-low;
+		};
+		gpio224_pins: gpio224-pins {
+			pins = "GPIO224/SPIXCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio225ol_pins: gpio225ol-pins {
+			pins = "GPO225/SPIXD0/STRAP12";
+			bias-disable;
+			output-low;
+		};
+		gpio226ol_pins: gpio226ol-pins {
+			pins = "GPO226/SPIXD1/STRAP13";
+			bias-disable;
+			output-low;
+		};
+		gpio227ol_pins: gpio227ol-pins {
+			pins = "GPIO227/nSPIXCS0";
+			bias-disable;
+			output-low;
+		};
+		gpio228o_pins: gpio228ol-pins {
+			pins = "GPIO228/nSPIXCS1";
+			bias-disable;
+			output-high;
+		};
+		gpio229o_pins: gpio229o-pins {
+			pins = "GPO229/SPIXD2/STRAP3";
+			bias-disable;
+			output-high;
+		};
+		gpio230_pins: gpio230-pins {
+			pins = "GPIO230/SPIXD3";
+			bias-disable;
+			input-enable;
+		};
+		gpio231o_pins: gpio231o-pins {
+			pins = "GPIO231/nCLKREQ";
+			bias-disable;
+			output-high;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
new file mode 100644
index 000000000000..6e89b68c8dd4
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
@@ -0,0 +1,1197 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Nuvoton Technology kwliu@nuvoton.com
+// Copyright (c) 2019 Quanta Computer Inc. Samuel.Jiang@quantatw.com
+
+/dts-v1/;
+#include "nuvoton-npcm750.dtsi"
+#include "nuvoton-npcm750-runbmc-olympus-pincfg.dtsi"
+
+/ {
+	model = "Nuvoton npcm750 RunBMC Module";
+	compatible = "nuvoton,npcm750";
+
+	aliases {
+		ethernet0 = &emc0;
+		ethernet1 = &gmac0;
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		udc0 = &udc0;
+		udc1 = &udc1;
+		udc2 = &udc2;
+		udc3 = &udc3;
+		udc4 = &udc4;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		udc8 = &udc8;
+		udc9 = &udc9;
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
+	ahb {
+		gmac0: eth@f0802000 {
+			phy-mode = "rgmii-id";
+			snps,eee-force-disable;
+			status = "okay";
+		};
+
+		emc0: eth@f0825000 {
+			phy-mode = "rmii";
+			use-ncsi;
+			status = "okay";
+		};
+
+		ehci1: usb@f0806000 {
+			status = "okay";
+		};
+
+		ohci1: ohci@f0807000 {
+			status = "okay";
+		};
+
+		udc0:udc@f0830000 {
+			status = "okay";
+		};
+
+		udc1:udc@f0831000 {
+			status = "okay";
+		};
+
+		udc2:udc@f0832000 {
+			status = "okay";
+		};
+
+		udc3:udc@f0833000 {
+			status = "okay";
+		};
+
+		udc4:udc@f0834000 {
+			status = "okay";
+		};
+
+		udc5:udc@f0835000 {
+			status = "okay";
+		};
+
+		udc6:udc@f0836000 {
+			status = "okay";
+		};
+
+		udc7:udc@f0837000 {
+			status = "okay";
+		};
+
+		udc8:udc@f0838000 {
+			status = "okay";
+		};
+
+		udc9:udc@f0839000 {
+			status = "okay";
+		};
+
+		aes:aes@f0858000 {
+			status = "okay";
+		};
+
+		sha:sha@f085a000 {
+			status = "okay";
+		};
+
+		fiu0: fiu@fb000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0cs1_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-rx-bus-width = <2>;
+				partitions@80000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					bmc@0{
+						label = "bmc";
+						reg = <0x000000 0x2000000>;
+					};
+					u-boot@0 {
+						label = "u-boot";
+						reg = <0x0000000 0x80000>;
+						read-only;
+					};
+					u-boot-env@100000{
+						label = "u-boot-env";
+						reg = <0x00100000 0x40000>;
+					};
+					kernel@200000 {
+						label = "kernel";
+						reg = <0x0200000 0x600000>;
+					};
+					rofs@800000 {
+						label = "rofs";
+						reg = <0x800000 0x1500000>;
+					};
+					rwfs@1d00000 {
+						label = "rwfs";
+						reg = <0x1d00000 0x300000>;
+					};
+				};
+			};
+			spi-nor@1 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <1>;
+				npcm,fiu-rx-bus-width = <2>;
+				partitions@88000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spare1@0 {
+						label = "spi0-cs1-spare1";
+						reg = <0x0 0x800000>;
+					};
+					spare2@800000 {
+						label = "spi0-cs1-spare2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		fiu3: fiu@c0000000 {
+			pinctrl-0 = <&spi3_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-rx-bus-width = <2>;
+				partitions@A0000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					system1@0 {
+						label = "spi3-system1";
+						reg = <0x0 0x800000>;
+					};
+					system2@800000 {
+						label = "spi3-system2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		sdhci0: sdhci@f0842000 {
+			status = "okay";
+		};
+
+		pcimbox: pcimbox@f0848000 {
+			status = "okay";
+		};
+
+		vcd: vcd@f0810000 {
+			status = "okay";
+		};
+
+		ece: ece@f0820000 {
+			status = "okay";
+		};
+
+		apb {
+
+			watchdog1: watchdog@901C {
+				status = "okay";
+			};
+
+			rng: rng@b000 {
+				status = "okay";
+			};
+
+			serial0: serial@1000 {
+				status = "okay";
+			};
+
+			serial1: serial@2000 {
+				status = "okay";
+			};
+
+			serial2: serial@3000 {
+				status = "okay";
+			};
+
+			serial3: serial@4000 {
+				status = "okay";
+			};
+
+			adc: adc@c000 {
+				#io-channel-cells = <1>;
+				status = "okay";
+			};
+
+			otp:otp@189000 {
+				status = "okay";
+			};
+
+			lpc_kcs: lpc_kcs@7000 {
+				kcs1: kcs1@0 {
+					status = "okay";
+				};
+
+				kcs2: kcs2@0 {
+					status = "okay";
+				};
+
+				kcs3: kcs3@0 {
+					status = "okay";
+				};
+			};
+
+			lpc_host: lpc_host@7000 {
+				lpc_bpc: lpc_bpc@40 {
+					monitor-ports = <0x80>;
+					status = "okay";
+				};
+			};
+
+			i2c0: i2c@80000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@81000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				i2c-switch@70 {
+					compatible = "nxp,pca9548";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x70>;
+					i2c-mux-idle-disconnect;
+
+					i2c_slot1a: i2c-bus@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c_slot1b: i2c-bus@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+
+					i2c_slot2a: i2c-bus@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c_slot2b: i2c-bus@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+
+					i2c_slot3: i2c-bus@4 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <4>;
+					};
+
+					i2c_slot4: i2c-bus@5 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <5>;
+					};
+
+					i2c_slot5: i2c-bus@6 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <6>;
+					};
+				};
+
+				i2c-switch@71 {
+					compatible = "nxp,pca9546";
+					reg = <0x71>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					i2c-mux-idle-disconnect;
+
+					i2c_m2_s1: i2c-bus@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c_m2_s2: i2c-bus@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+					i2c_m2_s3: i2c-bus@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c_m2_s4: i2c-bus@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+				};
+			};
+
+			i2c2: i2c@82000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				tmp421@4c {
+					compatible = "ti,tmp421";
+					reg = <0x4c>;
+				};
+				power-supply@58 {
+					compatible = "delta,dps800";
+					reg = <0x58>;
+				};
+			};
+
+			i2c3: i2c@83000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c4: i2c@84000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				eeprom@54 {
+					compatible = "atmel,24c64";
+					reg = <0x54>;
+				};
+			};
+
+			i2c5: i2c@85000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				slave_mqueue: i2c-slave-mqueue@40000010 {
+					compatible = "i2c-slave-mqueue";
+					reg = <0x40000010>;
+					status = "okay";
+				};
+			};
+
+			i2c6: i2c@86000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				ina219@40 {
+					compatible = "ti,ina219";
+					reg = <0x40>;
+				};
+				ina219@41 {
+					compatible = "ti,ina219";
+					reg = <0x41>;
+				};
+				ina219@44 {
+					compatible = "ti,ina219";
+					reg = <0x44>;
+				};
+				ina219@45 {
+					compatible = "ti,ina219";
+					reg = <0x45>;
+				};
+				tps53679@60 {
+					compatible = "ti,tps53679";
+					reg = <0x60>;
+				};
+				tps53659@62 {
+					compatible = "ti,tps53659";
+					reg = <0x62>;
+				};
+				tps53659@64 {
+					compatible = "ti,tps53659";
+					reg = <0x64>;
+				};
+				tps53622@67 {
+					compatible = "ti,tps53622";
+					reg = <0x67>;
+				};
+				tps53622@69 {
+					compatible = "ti,tps53622";
+					reg = <0x69>;
+				};
+				tps53679@70 {
+					compatible = "ti,tps53679";
+					reg = <0x70>;
+				};
+				tps53659@72 {
+					compatible = "ti,tps53659";
+					reg = <0x72>;
+				};
+				tps53659@74 {
+					compatible = "ti,tps53659";
+					reg = <0x74>;
+				};
+				tps53622@77 {
+					compatible = "ti,tps53622";
+					reg = <0x77>;
+				};
+			};
+
+			i2c7: i2c@87000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				tmp421@4c {
+					compatible = "ti,tmp421";
+					reg = <0x4c>;
+				};
+			};
+
+			i2c8: i2c@88000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				adm1278@11 {
+					compatible = "adm1278";
+					reg = <0x11>;
+					Rsense = <500>;
+				};
+			};
+
+			i2c9: i2c@89000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c10: i2c@8a000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				gpio: pca9555@27 {
+					compatible = "nxp,pca9555";
+					reg = <0x27>;
+
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+			};
+
+			i2c11: i2c@8b000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				pca9539_g1a: pca9539-g1a@74 {
+					compatible = "nxp,pca9539";
+					reg = <0x74>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					reset-gpios = <&gpio7 4 GPIO_ACTIVE_LOW>;
+					G1A_P0_0 {
+						gpio-hog;
+						gpios = <0 0>;
+						output-high;
+						line-name = "TPM_BMC_ALERT_N";
+					};
+					G1A_P0_1 {
+						gpio-hog;
+						gpios = <1 0>;
+						input;
+						line-name = "FM_BIOS_TOP_SWAP";
+					};
+					G1A_P0_2 {
+						gpio-hog;
+						gpios = <2 0>;
+						input;
+						line-name = "FM_BIOS_PREFRB2_GOOD";
+					};
+					G1A_P0_3 {
+						gpio-hog;
+						gpios = <3 0>;
+						input;
+						line-name = "BMC_SATAXPCIE_0TO3_SEL";
+					};
+					G1A_P0_4 {
+						gpio-hog;
+						gpios = <4 0>;
+						input;
+						line-name = "BMC_SATAXPCIE_4TO7_SEL";
+					};
+					G1A_P0_5 {
+						gpio-hog;
+						gpios = <5 0>;
+						output-low;
+						line-name = "FM_UV_ADR_TRIGGER_EN_N";
+					};
+					G1A_P0_6 {
+						gpio-hog;
+						gpios = <6 0>;
+						input;
+						line-name = "RM_THROTTLE_EN_N";
+					};
+					G1A_P1_0 {
+						gpio-hog;
+						gpios = <8 0>;
+						input;
+						line-name = "FM_BMC_TPM_PRES_N";
+					};
+					G1A_P1_1 {
+						gpio-hog;
+						gpios = <9 0>;
+						input;
+						line-name = "FM_CPU0_SKTOCC_LVT3_N";
+					};
+					G1A_P1_2 {
+						gpio-hog;
+						gpios = <10 0>;
+						input;
+						line-name = "FM_CPU1_SKTOCC_LVT3_N";
+					};
+					G1A_P1_3 {
+						gpio-hog;
+						gpios = <11 0>;
+						input;
+						line-name = "PSU1_ALERT_N";
+					};
+					G1A_P1_4 {
+						gpio-hog;
+						gpios = <12 0>;
+						input;
+						line-name = "PSU2_ALERT_N";
+					};
+					G1A_P1_5 {
+						gpio-hog;
+						gpios = <13 0>;
+						input;
+						line-name = "H_CPU0_FAST_WAKE_LVT3_N";
+					};
+					G1A_P1_6 {
+						gpio-hog;
+						gpios = <14 0>;
+						output-high;
+						line-name = "I2C_MUX1_RESET_N";
+					};
+					G1A_P1_7 {
+						gpio-hog;
+						gpios = <15 0>;
+						input;
+						line-name = "FM_CPU_CATERR_LVT3_N";
+					};
+				};
+				pca9539_g1b: pca9539-g1b@75 {
+					compatible = "nxp,pca9539";
+					reg = <0x75>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					G1B_P0_0 {
+						gpio-hog;
+						gpios = <0 0>;
+						input;
+						line-name = "PVDDQ_ABC_PINALERT_N";
+					};
+					G1B_P0_1 {
+						gpio-hog;
+						gpios = <1 0>;
+						input;
+						line-name = "PVDDQ_DEF_PINALERT_N";
+					};
+					G1B_P0_2 {
+						gpio-hog;
+						gpios = <2 0>;
+						input;
+						line-name = "PVDDQ_GHJ_PINALERT_N";
+					};
+					G1B_P0_3 {
+						gpio-hog;
+						gpios = <3 0>;
+						input;
+						line-name = "PVDDQ_KLM_PINALERT_N";
+					};
+					G1B_P0_5 {
+						gpio-hog;
+						gpios = <5 0>;
+						input;
+						line-name = "FM_BOARD_REV_ID0";
+					};
+					G1B_P0_6 {
+						gpio-hog;
+						gpios = <6 0>;
+						input;
+						line-name = "FM_BOARD_REV_ID1";
+					};
+					G1B_P0_7 {
+						gpio-hog;
+						gpios = <7 0>;
+						input;
+						line-name = "FM_BOARD_REV_ID2";
+					};
+					G1B_P1_0 {
+						gpio-hog;
+						gpios = <8 0>;
+						input;
+						line-name = "FM_OC_DETECT_EN_N";
+					};
+					G1B_P1_1 {
+						gpio-hog;
+						gpios = <9 0>;
+						input;
+						line-name = "FM_FLASH_DESC_OVERRIDE";
+					};
+					G1B_P1_2 {
+						gpio-hog;
+						gpios = <10 0>;
+						output-low;
+						line-name = "FP_PWR_ID_LED_N";
+					};
+					G1B_P1_3 {
+						gpio-hog;
+						gpios = <11 0>;
+						output-low;
+						line-name = "BMC_LED_PWR_GRN";
+					};
+					G1B_P1_4 {
+						gpio-hog;
+						gpios = <12 0>;
+						output-low;
+						line-name = "BMC_LED_PWR_AMBER";
+					};
+					G1B_P1_5 {
+						gpio-hog;
+						gpios = <13 0>;
+						output-high;
+						line-name = "FM_BMC_FAULT_LED_N";
+					};
+					G1B_P1_6 {
+						gpio-hog;
+						gpios = <14 0>;
+						output-high;
+						line-name = "FM_CPLD_BMC_PWRDN_N";
+					};
+					G1B_P1_7 {
+						gpio-hog;
+						gpios = <15 0>;
+						output-high;
+						line-name = "BMC_LED_CATERR_N";
+					};
+				};
+			};
+
+			i2c12: i2c@8c000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				pca9539_g2a: pca9539-g2a@74 {
+					compatible = "nxp,pca9539";
+					reg = <0x74>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
+					G2A_P0_0 {
+						gpio-hog;
+						gpios = <0 0>;
+						output-high;
+						line-name = "BMC_PON_RST_REQ_N";
+					};
+					G2A_P0_1 {
+						gpio-hog;
+						gpios = <1 0>;
+						output-high;
+						line-name = "BMC_RST_IND_REQ_N";
+					};
+					G2A_P0_2 {
+						gpio-hog;
+						gpios = <2 0>;
+						input;
+						line-name = "RST_BMC_RTCRST";
+					};
+					G2A_P0_3 {
+						gpio-hog;
+						gpios = <3 0>;
+						output-high;
+						line-name = "FM_BMC_PWRBTN_OUT_N";
+					};
+					G2A_P0_4 {
+						gpio-hog;
+						gpios = <4 0>;
+						output-high;
+						line-name = "RST_BMC_SYSRST_BTN_OUT_N";
+					};
+					G2A_P0_5 {
+						gpio-hog;
+						gpios = <5 0>;
+						output-high;
+						line-name = "FM_BATTERY_SENSE_EN_N";
+					};
+					G2A_P0_6 {
+						gpio-hog;
+						gpios = <6 0>;
+						output-high;
+						line-name = "FM_BMC_READY_N";
+					};
+					G2A_P0_7 {
+						gpio-hog;
+						gpios = <7 0>;
+						input;
+						line-name = "IRQ_BMC_PCH_SMI_LPC_N";
+					};
+					G2A_P1_0 {
+						gpio-hog;
+						gpios = <8 0>;
+						input;
+						line-name = "FM_SLOT4_CFG0";
+					};
+					G2A_P1_1 {
+						gpio-hog;
+						gpios = <9 0>;
+						input;
+						line-name = "FM_SLOT4_CFG1";
+					};
+					G2A_P1_2 {
+						gpio-hog;
+						gpios = <10 0>;
+						input;
+						line-name = "FM_NVDIMM_EVENT_N";
+					};
+					G2A_P1_3 {
+						gpio-hog;
+						gpios = <11 0>;
+						input;
+						line-name = "PSU1_BLADE_EN_N";
+					};
+					G2A_P1_4 {
+						gpio-hog;
+						gpios = <12 0>;
+						input;
+						line-name = "BMC_PCH_FNM";
+					};
+					G2A_P1_5 {
+						gpio-hog;
+						gpios = <13 0>;
+						input;
+						line-name = "FM_SOL_UART_CH_SEL";
+					};
+					G2A_P1_6 {
+						gpio-hog;
+						gpios = <14 0>;
+						input;
+						line-name = "FM_BIOS_POST_CMPLT_N";
+					};
+				};
+
+				pca9539_g2b: pca9539-g2b@75 {
+					compatible = "nxp,pca9539";
+					reg = <0x75>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					G2B_P0_0 {
+						gpio-hog;
+						gpios = <0 0>;
+						input;
+						line-name = "FM_CPU_MSMI_LVT3_N";
+					};
+					G2B_P0_1 {
+						gpio-hog;
+						gpios = <1 0>;
+						input;
+						line-name = "FM_BIOS_MRC_DEBUG_MSG_DIS";
+					};
+					G2B_P0_2 {
+						gpio-hog;
+						gpios = <2 0>;
+						input;
+						line-name = "FM_CPU1_DISABLE_BMC_N";
+					};
+					G2B_P0_3 {
+						gpio-hog;
+						gpios = <3 0>;
+						output-low;
+						line-name = "BMC_JTAG_SELECT";
+					};
+					G2B_P0_4 {
+						gpio-hog;
+						gpios = <4 0>;
+						output-high;
+						line-name = "PECI_MUX_SELECT";
+					};
+					G2B_P0_5 {
+						gpio-hog;
+						gpios = <5 0>;
+						output-high;
+						line-name = "I2C_MUX2_RESET_N";
+					};
+					G2B_P0_6 {
+						gpio-hog;
+						gpios = <6 0>;
+						input;
+						line-name = "FM_BMC_CPLD_PSU2_ON";
+					};
+					G2B_P0_7 {
+						gpio-hog;
+						gpios = <7 0>;
+						output-high;
+						line-name = "PSU2_ALERT_EN_N";
+					};
+					G2B_P1_0 {
+						gpio-hog;
+						gpios = <8 0>;
+						output-high;
+						line-name = "FM_CPU_BMC_INIT";
+					};
+					G2B_P1_1 {
+						gpio-hog;
+						gpios = <9 0>;
+						output-high;
+						line-name = "IRQ_BMC_PCH_SCI_LPC_N";
+					};
+					G2B_P1_2 {
+						gpio-hog;
+						gpios = <10 0>;
+						output-low;
+						line-name = "PMB_ALERT_EN_N";
+					};
+					G2B_P1_3 {
+						gpio-hog;
+						gpios = <11 0>;
+						output-high;
+						line-name = "FM_FAST_PROCHOT_EN_N";
+					};
+					G2B_P1_4 {
+						gpio-hog;
+						gpios = <12 0>;
+						output-high;
+						line-name = "BMC_NVDIMM_PRSNT_N";
+					};
+					G2B_P1_5 {
+						gpio-hog;
+						gpios = <13 0>;
+						output-low;
+						line-name = "FM_BACKUP_BIOS_SEL_H_BMC";
+					};
+					G2B_P1_6 {
+						gpio-hog;
+						gpios = <14 0>;
+						output-high;
+						line-name = "FM_PWRBRK_N";
+					};
+				};
+			};
+
+			i2c13: i2c@8d000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				tmp75@4a {
+					compatible = "ti,tmp75";
+					reg = <0x4a>;
+					status = "okay";
+				};
+				m24128_fru@51 {
+					compatible = "atmel,24c128";
+					reg = <0x51>;
+					pagesize = <64>;
+					status = "okay";
+				};
+			};
+
+			pwm_fan:pwm-fan-controller@103000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <   &pwm0_pins &pwm1_pins
+						&fanin0_pins &fanin1_pins
+						&fanin2_pins &fanin3_pins
+						&fanin4_pins &fanin5_pins
+						&fanin6_pins &fanin7_pins
+						&fanin8_pins &fanin9_pins
+						&fanin10_pins &fanin11_pins>;
+				status = "okay";
+				fan@0 {
+					reg = <0x00>;
+					fan-tach-ch = /bits/ 8 <0x00 0x01>;
+					cooling-levels = <127 255>;
+				};
+				fan@1 {
+					reg = <0x01>;
+					fan-tach-ch = /bits/ 8 <0x02 0x03>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@2 {
+					reg = <0x02>;
+					fan-tach-ch = /bits/ 8 <0x04 0x05>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@3 {
+					reg = <0x03>;
+					fan-tach-ch = /bits/ 8 <0x06 0x07>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@4 {
+					reg = <0x04>;
+					fan-tach-ch = /bits/ 8 <0x08 0x09>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@5 {
+					reg = <0x05>;
+					fan-tach-ch = /bits/ 8 <0x0A 0x0B>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@6 {
+					reg = <0x06>;
+					fan-tach-ch = /bits/ 8 <0x0C 0x0D>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@7 {
+					reg = <0x07>;
+					fan-tach-ch = /bits/ 8 <0x0E 0x0F>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+			};
+
+			peci: peci-bus@100000 {
+				cmd-timeout-ms = <1000>;
+				pull-down = <0>;
+				host-neg-bit-rate = <15>;
+				status = "okay";
+				intel-peci-dimmtemp@30 {
+					compatible = "intel,peci-client";
+					reg = <0x30>;
+					status = "okay";
+				};
+				intel-peci-dimmtemp@31 {
+					compatible = "intel,peci-client";
+					reg = <0x31>;
+					status = "okay";
+				};
+			};
+
+			spi0: spi@200000 {
+				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+				status = "okay";
+			};
+
+			spi1: spi@201000 {
+				status = "okay";
+			};
+		};
+	};
+
+	pinctrl: pinctrl@f0800000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <
+				/******* RunBMC inside Module pins *******/
+				&gpio0ol_pins
+				&gpio1ol_pins
+				&gpio2ol_pins
+				&gpio3ol_pins
+				&gpio8o_pins
+				&gpio9ol_pins
+				&gpio12ol_pins
+				&gpio13ol_pins
+				&gpio14ol_pins
+				&gpio15ol_pins
+				&gpio37ol_pins
+				&gpio38_pins
+				&gpio39_pins
+				&gpio94ol_pins
+				&gpio108ol_pins
+				&gpio109ol_pins
+				&gpio111ol_pins
+				&gpio112ol_pins
+				&gpio113ol_pins
+				&gpio208_pins
+				&gpio209ol_pins
+				&gpio210ol_pins
+				&gpio211ol_pins
+				&gpio212ol_pins
+				&gpio213ol_pins
+				&gpio214ol_pins
+				&gpio215ol_pins
+				&gpio216ol_pins
+				&gpio217ol_pins
+				/******* RunBMC outside Connector pins *******/
+				&gpio5_pins
+				&gpio6_pins
+				&gpio7_pins
+				&gpio10_pins
+				&gpio11_pins
+				&gpio20_pins
+				&gpio21_pins
+				&gpio22o_pins
+				&gpio23_pins
+				&gpio24_pins
+				&gpio25_pins
+				&gpio30_pins
+				&gpio31_pins
+				&gpio40o_pins
+				&gpio59_pins
+				&gpio76_pins
+				&gpio77_pins
+				&gpio78o_pins
+				&gpio79_pins
+				&gpio82_pins
+				&gpio83_pins
+				&gpio84_pins
+				&gpio85o_pins
+				&gpio86ol_pins
+				&gpio87_pins
+				&gpio88_pins
+				&gpio89_pins
+				&gpio90_pins
+				&gpio93_pins
+				&gpio114o_pins
+				&gpio115_pins
+				&gpio120_pins
+				&gpio121_pins
+				&gpio122_pins
+				&gpio123_pins
+				&gpio124_pins
+				&gpio125_pins
+				&gpio126_pins
+				&gpio127o_pins
+				&gpio136_pins
+				&gpio137_pins
+				&gpio138_pins
+				&gpio139_pins
+				&gpio140_pins
+				&gpio141_pins
+				&gpio142_pins
+				&gpio143_pins
+				&gpio144_pins
+				&gpio146_pins
+				&gpio145_pins
+				&gpio147_pins
+				&gpio153o_pins
+				&gpio155_pins
+				&gpio160o_pins
+				&gpio169o_pins
+				&gpio188o_pins
+				&gpio189_pins
+				&gpio196_pins
+				&gpio197_pins
+				&gpio198o_pins
+				&gpio199o_pins
+				&gpio200_pins
+				&gpio202_pins
+				&gpio203o_pins
+				&gpio224_pins
+				&gpio225ol_pins
+				&gpio226ol_pins
+				&gpio227ol_pins
+				&gpio228o_pins
+				&gpio229o_pins
+				&gpio230_pins
+				&gpio231o_pins
+				&ddc_pins
+				&wdog1_pins
+				&wdog2_pins
+				>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		heartbeat {
+		label = "heartbeat";
+			gpios = <&gpio3 14 1>;
+		};
+
+		identify {
+			label = "identify";
+			gpios = <&gpio3 15 1>;
+		};
+	};
+
+	jtag {
+		compatible = "nuvoton,npcm750-jtag";
+		enable_pspi_jtag = <1>;
+		pspi-index = <2>;
+		tck {
+			label = "tck";
+			gpios = <&gpio0 19 0>; /* gpio19 */
+			regbase = <0xf0010000 0x1000>;
+		};
+
+		tdi {
+			label = "tdi";
+			gpios = <&gpio0 18 0>; /* gpio18 */
+			regbase = <0xf0010000 0x1000>;
+		};
+
+		tdo {
+			label = "tdo";
+			gpios = <&gpio0 17 0>; /* gpio17 */
+			regbase = <0xf0010000 0x1000>;
+		};
+		tms {
+			label = "tms";
+			gpios = <&gpio0 16 0>; /* gpio16 */
+			regbase = <0xf0010000 0x1000>;
+		};
+	};
+};
+
+&gcr {
+	serial_port_mux: mux-controller {
+	compatible = "mmio-mux";
+	#mux-control-cells = <1>;
+
+	mux-reg-masks = <0x38 0x07>;
+	idle-states = <6>;
+	};
+};
-- 
2.18.0

