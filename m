Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D7F85F126
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 06:53:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I4NBAazq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgMkh265dz3ccC
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 16:53:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I4NBAazq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgMk44nTwz3c7s;
	Thu, 22 Feb 2024 16:52:44 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-168-240.adl-adc-lon-bras34.tpg.internode.on.net [118.210.168.240])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED3EF20075;
	Thu, 22 Feb 2024 13:52:42 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708581163;
	bh=BnzXSf7NRVVN6BdovXPH7hrGQTBu4DMHfok/NYEng9I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I4NBAazqHD18TYZt090qAPQSc7JvqbYz3cV6JphSdmbully5ShrM6JTQwgzhPj/Lp
	 zn44xovBVx3lAcDm7Oz4jI9xVeLCbN1AVKdllAbX+rsV4as7gcdABH4RRotF1NjAek
	 msGePzx5ogoSyqD53D0zyekDkEr86ZxcNPUaw9R/K9Rd91MSo5BAqvR5mlHoWIQQve
	 AznY5f/wVIWs/s28nM67iKYxotgU1VNaaZDH+q/dOfzRtArTumxasn6x3/OPce+KDY
	 QUMjo6FjO6tRNseTB7DR5RLoOuQYMvwvzr3ZYIjU8RPZl/7VPslK6jtIw6OIC+5RRd
	 kt8EVCkSof5Lw==
Message-ID: <a4bb9821f672729941e988db20bf8bc275f37279.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: x4tf: Add dts for asus x4tf project
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kelly Hung <ppighouse@gmail.com>, robh+dt@kernel.org
Date: Thu, 22 Feb 2024 16:22:42 +1030
In-Reply-To: <20240222032504.1147489-1-Kelly_Hung@asus.com>
References: <20240222032504.1147489-1-Kelly_Hung@asus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kelly_hung@asus.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-02-22 at 11:25 +0800, Kelly Hung wrote:
> Base on aspeed-g6.dtsi and can boot into BMC console.
>=20
> Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   3 +-
>  .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  | 651 ++++++++++++++++++
>  2 files changed, 653 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index d3ac20e316d0..f7cc69b636fc 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -62,4 +62,5 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>  	aspeed-bmc-ufispace-ncplite.dtb \
>  	aspeed-bmc-vegman-n110.dtb \
>  	aspeed-bmc-vegman-rx20.dtb \
> -	aspeed-bmc-vegman-sx20.dtb
> +	aspeed-bmc-vegman-sx20.dtb \
> +	aspeed-bmc-asus-x4tf.dtb

Please keep the list sorted alphabetically.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts b/arch/arm=
/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
> new file mode 100644
> index 000000000000..fbe39eaec154
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
> @@ -0,0 +1,651 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2024 ASUS Corp.
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include "aspeed-g6-pinctrl.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model =3D "ASUS-X4TF";
> +	compatible =3D "asus,x4tf", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial4:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		video_engine_memory: video {
> +			size =3D <0x04000000>;
> +			alignment =3D <0x01000000>;
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible =3D "iio-hwmon";
> +		io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +				<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +				<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-heartbeat {
> +			gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		led-uid {
> +			gpios =3D <&gpio0 ASPEED_GPIO(P, 1) (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAI=
N)>;
> +			default-state =3D "off";
> +		};
> +
> +		led-status_Y {
> +			gpios =3D <&gpio1 ASPEED_GPIO(B, 1) GPIO_ACTIVE_LOW>;
> +			default-state =3D "off";
> +		};
> +
> +		led-sys_boot_status {
> +			gpios =3D <&gpio1 ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
> +			default-state =3D "off";
> +		};
> +	};
> +};
> +
> +&adc0 {
> +	vref =3D <2500>;
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
> +		&pinctrl_adc2_default &pinctrl_adc3_default
> +		&pinctrl_adc4_default &pinctrl_adc5_default
> +		&pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +	vref =3D <2500>;
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_adc8_default &pinctrl_adc9_default
> +		&pinctrl_adc10_default &pinctrl_adc11_default
> +		&pinctrl_adc12_default &pinctrl_adc13_default
> +		&pinctrl_adc14_default &pinctrl_adc15_default>;
> +};
> +
> +&peci0 {
> +	status =3D "okay";
> +};
> +
> +&lpc_snoop {
> +	snoop-ports =3D <0x80>;
> +	status =3D "okay";
> +};
> +
> +&mdio2 {
> +	status =3D "okay";
> +
> +	ethphy2: ethernet-phy@0 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0>;
> +	};
> +};
> +
> +&mdio3 {
> +	status =3D "okay";
> +
> +	ethphy3: ethernet-phy@0 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0>;
> +	};
> +};

Are these necessary given you have `use-ncsi` specified for the MACs
below?

> +
> +&mac2 {
> +	status =3D "okay";
> +	phy-mode =3D "rmii";
> +	use-ncsi;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii3_default>;
> +};
> +
> +&mac3 {
> +	status =3D "okay";
> +	phy-mode =3D "rmii";
> +	use-ncsi;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii4_default>;
> +};
> +
> +&fmc {
> +	status =3D "okay";
> +
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "bmc-spi";
> +		spi-max-frequency =3D <50000000>;
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			bmc@0 {
> +				label =3D "bmc";
> +				reg =3D <0x0 0x4000000>;
> +			};
> +
> +			u-boot@0 {
> +				label =3D "u-boot";
> +				reg =3D <0x0 0x200000>;
> +			};
> +
> +			u-boot-env@1f0000 {
> +				label =3D "u-boot-env";
> +				reg =3D <0x1f0000 0x10000>;
> +			};
> +
> +			kernel@200000 {
> +				label =3D "kernel";
> +				reg =3D <0x200000 0xc00000>;
> +			};
> +
> +			rofs@a00000 {
> +				label =3D "rofs";
> +				reg =3D <0xa00000 0x2a00000>;
> +			};
> +
> +			rwfs@2a00000 {
> +				label =3D "rwfs";
> +				reg =3D <0x2a00000 0x43f0000>;
> +			};

Is this different to the default OpenBMC layouts? Can you use the
appropriate DTSI?

> +		};
> +	};
> +};
> +
> +&spi1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status =3D "okay";
> +		label =3D "bios-spi";
> +		spi-max-frequency =3D <50000000>;
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			biosfullimg@0 {
> +				reg =3D <0x0 0x2000000>; //32768 *1024 =3D 32 MB
> +				label =3D "biosfullimg";
> +			};
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +};
> +
> +&i2c1 {
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	status =3D "okay";
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&i2c4 {
> +	status =3D "okay";
> +
> +	temperature-sensor@48 {
> +		compatible =3D "ti,tmp75";
> +		reg =3D <0x48>;
> +	};
> +
> +	temperature-sensor@49 {
> +		compatible =3D "ti,tmp75";
> +		reg =3D <0x49>;
> +	};
> +
> +	pca9555_4_20: gpio@20 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	pca9555_4_22: gpio@22 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x22>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	pca9555_4_24: gpio@24 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-line-names =3D
> +		/*A0 - A3 0*/	"", "STRAP_BMC_BATTERY_GPIO1", "", "",
> +		/*A4 - A7 4*/	"", "", "", "",
> +		/*B0 - B7 8*/	"", "", "", "", "", "", "", "";
> +	};
> +
> +	pca9555_4_26: gpio@26 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x26>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	i2c-mux@70 {
> +		compatible =3D "nxp,pca9546";
> +		status =3D "okay";
> +		reg =3D <0x70>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		channel_1: i2c@0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0>;
> +		};
> +
> +		channel_2: i2c@1 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <1>;
> +		};
> +
> +		channel_3: i2c@2 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <2>;
> +		};
> +
> +		channel_4: i2c@3 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <3>;
> +		};
> +	};
> +};
> +
> +&i2c5 {
> +	status =3D "okay";
> +
> +	pca9555_5_24: gpio@24 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	i2c-mux@70  {
> +		compatible =3D "nxp,pca9546";
> +		status =3D "okay";
> +		reg =3D <0x70 >;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		channel_5: i2c@0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0>;
> +
> +			pca9555_5_5_20: gpio@20 {
> +				compatible =3D "nxp,pca9555";
> +				reg =3D <0x20>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-line-names =3D
> +					"", "", "", "", "", "", "", "",
> +					"", "", "SYS_FAN6", "SYS_FAN5",
> +					"SYS_FAN4", "SYS_FAN3",
> +					"SYS_FAN2", "SYS_FAN1";
> +			};
> +
> +			pca9555_5_5_21: gpio@21 {
> +				compatible =3D "nxp,pca9555";
> +				reg =3D <0x21>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +			};
> +
> +			power-monitor@44 {
> +				compatible =3D "ti,ina219";
> +				reg =3D <0x44>;
> +				shunt-resistor =3D <2>;
> +			};
> +		};
> +
> +		channel_6: i2c@1 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <1>;
> +		};
> +
> +		channel_7: i2c@2 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <2>;
> +		};
> +
> +		channel_8: i2c@3 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <3>;
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	status =3D "okay";
> +
> +	pca9555_6_27: gpio@27 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x27>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	pca9555_6_20: gpio@20 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-line-names =3D
> +		/*A0 0*/	"", "", "", "", "", "", "", "",
> +		/*B0 8*/	"Drive_NVMe1", "Drive_NVMe2", "", "",
> +		/*B4 12*/	"", "", "", "";
> +	};
> +
> +	pca9555_6_21: gpio@21 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x21>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +};
> +
> +&i2c7 {
> +	status =3D "okay";
> +
> +	i2c-mux@70 {
> +		compatible =3D "nxp,pca9546";
> +		status =3D "okay";
> +		reg =3D <0x70>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		idle-state =3D <1>;
> +
> +		channel_9: i2c@0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0>;
> +
> +			temperature-sensor@48 {
> +				compatible =3D "ti,tmp75";
> +				reg =3D <0x48>;
> +			};
> +
> +			temperature-sensor@49 {
> +				compatible =3D "ti,tmp75";
> +				reg =3D <0x49>;
> +			};
> +
> +			power-monitor@40 {
> +				compatible =3D "ti,ina219";
> +				reg =3D <0x40>;
> +				shunt-resistor =3D <2>;
> +			};
> +
> +			power-monitor@41 {
> +				compatible =3D "ti,ina219";
> +				reg =3D <0x41>;
> +				shunt-resistor =3D <5>;
> +			};
> +		};
> +
> +		channel_10: i2c@1 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <1>;
> +		};
> +
> +		channel_11: i2c@2 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <2>;
> +		};
> +
> +		channel_12: i2c@3 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <3>;
> +		};
> +	};
> +
> +	i2c-mux@71 {
> +		compatible =3D "nxp,pca9546";
> +		status =3D "okay";
> +		reg =3D <0x71>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		i2c-mux-idle-disconnect;
> +
> +		channel_13: i2c@0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0>;
> +		};
> +
> +		channel_14: i2c@1 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <1>;
> +		};
> +
> +		channel_15: i2c@2 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <2>;
> +		};
> +
> +		channel_16: i2c@3 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <3>;
> +		};
> +	};
> +};
> +
> +&i2c8 {
> +	status =3D "okay";
> +
> +	i2c-mux@70 {
> +		compatible =3D "nxp,pca9546";
> +		status =3D "okay";
> +		reg =3D <0x70>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		i2c-mux-idle-disconnect;
> +
> +		channel_17: i2c@0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0>;
> +		};
> +
> +		channel_18: i2c@1 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <1>;
> +
> +			temperature-sensor@48 {
> +				compatible =3D "ti,tmp75";
> +				reg =3D <0x48>;
> +			};
> +
> +			power-monitor@41 {
> +				compatible =3D "ti,ina219";
> +				reg =3D <0x41>;
> +				shunt-resistor =3D <5>;
> +			};
> +		};
> +
> +		channel_19: i2c@2 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <2>;
> +		};
> +
> +		channel_20: i2c@3 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <3>;
> +		};
> +	};
> +};
> +
> +&i2c9 {
> +	status =3D "okay";
> +};
> +
> +&i2c10 {
> +	status =3D "okay";
> +};
> +
> +&i2c11 {
> +	status =3D "okay";
> +};
> +
> +&i2c14 {
> +	status =3D "okay";
> +	multi-master;
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c08";
> +		reg =3D <0x50>;
> +	};
> +
> +	eeprom@51 {
> +		compatible =3D "atmel,24c08";
> +		reg =3D <0x51>;
> +	};
> +};
> +
> +&sgpiom0 {
> +	status =3D "okay";
> +	ngpios =3D <128>;
> +};
> +
> +&video {
> +	status =3D "okay";
> +	memory-region =3D <&video_engine_memory>;
> +};
> +
> +&sdc {
> +	status =3D "okay";
> +};
> +
> +&lpc_snoop {
> +	status =3D "okay";
> +	snoop-ports =3D <0x80>;
> +};
> +
> +&kcs1 {
> +	aspeed,lpc-io-reg =3D <0xca0>;
> +	status =3D "okay";
> +};
> +
> +&kcs2 {
> +	aspeed,lpc-io-reg =3D <0xca8>;
> +	status =3D "okay";
> +};
> +
> +&kcs3 {
> +	aspeed,lpc-io-reg =3D <0xca2>;
> +	status =3D "okay";
> +};
> +
> +&uart3 {
> +	status =3D "okay";
> +};
> +
> +&uart4 {
> +	status =3D "okay";
> +	/* GPIOB6 will be used in ASD function, do not set to be TXD4 */
> +	pinctrl-0 =3D <&pinctrl_txd2_default &pinctrl_rxd2_default>;

Are you sure this works? You're configuring the pins for UART2 on the
node for UART4. Enable UART2 instead?

Andrew
