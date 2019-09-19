Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB48B7E51
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 17:38:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z1GS1LFPzDrCN
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 01:38:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z0x56G9pzDrPn
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 01:23:37 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v2 linux dev-5.3 4/4] ARM: dts: aspeed: add Rainier system
Date: Thu, 19 Sep 2019 11:23:40 -0400
Message-Id: <20190919152340.23133-10-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Rainier is a new Power system with an AST2600.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v2:
  - reordered rainier DT elements (alphabetized).
  - added rainier rtc, lpc-ctl, reserved memory, mac devices
---
 arch/arm/boot/dts/Makefile                   |   3 +-
 arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts | 485 +++++++++++++++++++
 2 files changed, 487 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5af075c2f819..2f81a4be50a8 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1293,4 +1293,5 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
-	aspeed-bmc-quanta-q71l.dtb
+	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-opp-rainier.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-rainier.dts
new file mode 100644
index 000000000000..5f45b1effe4a
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
@@ -0,0 +1,485 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2019 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model =3D "Rainier";
+	compatible =3D "ibm,rainier-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 =3D &uart5;
+	};
+
+	chosen {
+		stdout-path =3D &uart5;
+		bootargs =3D "console=3DttyS4,115200n8";
+	};
+
+	memory@80000000 {
+		device_type =3D "memory";
+		reg =3D <0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		ranges;
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg =3D <0x98000000 0x04000000>; /* 64M */
+		};
+	};
+
+};
+
+&emmc_controller {
+	status =3D "okay";
+};
+
+&emmc {
+	status =3D "okay";
+};
+
+&fsim0 {
+	status =3D "okay";
+};
+
+&ibt {
+	status =3D "okay";
+};
+
+&i2c0 {
+	status =3D "okay";
+};
+
+&i2c1 {
+	status =3D "okay";
+};
+
+&i2c2 {
+	status =3D "okay";
+};
+
+&i2c3 {
+	status =3D "okay";
+
+	power-supply@68 {
+		compatible =3D "ibm,cffps2";
+		reg =3D <0x68>;
+	};
+
+	power-supply@69 {
+		compatible =3D "ibm,cffps2";
+		reg =3D <0x69>;
+	};
+
+	power-supply@6a {
+		compatible =3D "ibm,cffps2";
+		reg =3D <0x6a>;
+	};
+
+	power-supply@6b {
+		compatible =3D "ibm,cffps2";
+		reg =3D <0x6b>;
+	};
+};
+
+&i2c4 {
+	status =3D "okay";
+
+	tmp275@48 {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x48>;
+	};
+
+	tmp275@49 {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x49>;
+	};
+
+	tmp275@4a {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x4a>;
+	};
+};
+
+&i2c5 {
+	status =3D "okay";
+
+	tmp275@48 {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x48>;
+	};
+
+	tmp275@49 {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x49>;
+	};
+};
+
+&i2c6 {
+	status =3D "okay";
+
+	tmp275@48 {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x48>;
+	};
+
+	tmp275@4a {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x4a>;
+	};
+
+	tmp275@4b {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x4b>;
+	};
+};
+
+&i2c7 {
+	status =3D "okay";
+
+	si7021-a20@20 {
+		compatible =3D "silabs,si7020";
+		reg =3D <0x20>;
+	};
+
+	tmp275@48 {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x48>;
+	};
+
+	max31785@52 {
+		compatible =3D "maxim,max31785a";
+		reg =3D <0x52>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		fan@0 {
+			compatible =3D "pmbus-fan";
+			reg =3D <0>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@1 {
+			compatible =3D "pmbus-fan";
+			reg =3D <1>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@2 {
+			compatible =3D "pmbus-fan";
+			reg =3D <2>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@3 {
+			compatible =3D "pmbus-fan";
+			reg =3D <3>;
+			tach-pulses =3D <2>;
+			maxim,fan-rotor-input =3D "tach";
+			maxim,fan-pwm-freq =3D <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp =3D <2>;
+			maxim,fan-fault-pin-mon;
+		};
+	};
+
+	pca0: pca9552@60 {
+		compatible =3D "nxp,pca9552";
+		reg =3D <0x60>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		gpio@0 {
+			reg =3D <0>;
+		};
+
+		gpio@1 {
+			reg =3D <1>;
+		};
+
+		gpio@2 {
+			reg =3D <2>;
+		};
+
+		gpio@3 {
+			reg =3D <3>;
+		};
+
+		gpio@4 {
+			reg =3D <4>;
+		};
+
+		gpio@5 {
+			reg =3D <5>;
+		};
+
+		gpio@6 {
+			reg =3D <6>;
+		};
+
+		gpio@7 {
+			reg =3D <7>;
+		};
+
+		gpio@8 {
+			reg =3D <8>;
+		};
+
+		gpio@9 {
+			reg =3D <9>;
+		};
+
+		gpio@10 {
+			reg =3D <10>;
+		};
+
+		gpio@11 {
+			reg =3D <11>;
+		};
+
+		gpio@12 {
+			reg =3D <12>;
+		};
+
+		gpio@13 {
+			reg =3D <13>;
+		};
+
+		gpio@14 {
+			reg =3D <14>;
+		};
+
+		gpio@15 {
+			reg =3D <15>;
+		};
+	};
+
+	dps: dps310@76 {
+		compatible =3D "infineon,dps310";
+		reg =3D <0x76>;
+		#io-channel-cells =3D <0>;
+	};
+};
+
+&i2c8 {
+	status =3D "okay";
+
+	ucd90320@b {
+		compatible =3D "ti,ucd90160";
+		reg =3D <0x0b>;
+	};
+
+	ucd90320@c {
+		compatible =3D "ti,ucd90160";
+		reg =3D <0x0c>;
+	};
+
+	ucd90320@11 {
+		compatible =3D "ti,ucd90160";
+		reg =3D <0x11>;
+	};
+
+	rtc@32 {
+		compatible =3D "epson,rx8900";
+		reg =3D <0x32>;
+	};
+
+	tmp275@48 {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x48>;
+	};
+
+	tmp275@4a {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x4a>;
+	};
+};
+
+&i2c9 {
+	status =3D "okay";
+
+	ir35221@42 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x42>;
+	};
+
+	ir35221@43 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x43>;
+	};
+
+	ir35221@44 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x44>;
+	};
+
+	tmp423a@4c {
+		compatible =3D "ti,tmp423";
+		reg =3D <0x4c>;
+	};
+
+	tmp423b@4d {
+		compatible =3D "ti,tmp423";
+		reg =3D <0x4d>;
+	};
+
+	ir35221@72 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x72>;
+	};
+
+	ir35221@73 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x73>;
+	};
+
+	ir35221@74 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x74>;
+	};
+};
+
+&i2c10 {
+	status =3D "okay";
+
+	ir35221@42 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x42>;
+	};
+
+	ir35221@43 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x43>;
+	};
+
+	ir35221@44 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x44>;
+	};
+
+	tmp423a@4c {
+		compatible =3D "ti,tmp423";
+		reg =3D <0x4c>;
+	};
+
+	tmp423b@4d {
+		compatible =3D "ti,tmp423";
+		reg =3D <0x4d>;
+	};
+
+	ir35221@72 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x72>;
+	};
+
+	ir35221@73 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x73>;
+	};
+
+	ir35221@74 {
+		compatible =3D "infineon,ir35221";
+		reg =3D <0x74>;
+	};
+};
+
+&i2c11 {
+	status =3D "okay";
+
+	tmp275@48 {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x48>;
+	};
+
+	tmp275@49 {
+		compatible =3D "ti,tmp275";
+		reg =3D <0x49>;
+	};
+};
+
+&i2c12 {
+	status =3D "okay";
+};
+
+&i2c13 {
+	status =3D "okay";
+};
+
+&i2c14 {
+	status =3D "okay";
+};
+
+&i2c15 {
+	status =3D "okay";
+};
+
+&lpc_ctrl {
+	status =3D "okay";
+	memory-region =3D <&flash_memory>;
+	flash =3D <&spi1>;
+};
+
+&mac0 {
+	status =3D "okay";
+};
+
+&mac1 {
+	status =3D "okay";
+};
+
+&mac2 {
+	status =3D "okay";
+};
+
+&mac3 {
+	status =3D "okay";
+};
+
+&sdc {
+	status =3D "okay";
+};
+
+&sdhci0 {
+	status =3D "okay";
+
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sd1_default>;
+};
+
+&sdhci1 {
+	status =3D "okay";
+
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sd2_default>;
+};
--=20
2.21.0
