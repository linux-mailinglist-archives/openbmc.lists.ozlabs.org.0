Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBE25E8B
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 09:12:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4583jx004KzDq5W
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 17:12:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453KYD13JSzDqFv
 for <openbmc@lists.ozlabs.org>; Wed, 15 May 2019 00:18:37 +1000 (AEST)
X-AuditID: ac10606f-0adff700000054ce-d8-5cdace387d47
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com
 [172.16.96.152])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 45.8C.21710.83ECADC5; Tue, 14 May 2019 10:18:33 -0400 (EDT)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0415.000; Tue, 14 May 2019 10:18:32 -0400
From: Hongwei Zhang <Hongweiz@ami.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH linux dev-5.0] ARM: dts: aspeed: Add Microsoft Olympus BMC
Thread-Topic: [PATCH linux dev-5.0] ARM: dts: aspeed: Add Microsoft Olympus BMC
Thread-Index: AQHVCbg2gjDJfMCRsECTlQxGaLFLvKZqMBSAgAB544A=
Date: Tue, 14 May 2019 14:18:32 +0000
Message-ID: <14D3C8298A3B0F42A1EB31EE961CFF82308C6B@atlms1.us.megatrends.com>
References: <1557771437-26366-1-git-send-email-hongweiz@ami.com>
 <0192570c-1383-4183-b976-ce5c6b8270a3@www.fastmail.com>
In-Reply-To: <0192570c-1383-4183-b976-ce5c6b8270a3@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42JZI5AwQ9fy3K0Yg1UHOS12XeawWHrzCpvF
 7/N/mS1OtbxgcWDxuNq+i93j9vYmdo+LH48xe5yfsZAxgCWKyyYlNSezLLVI3y6BK+PW872s
 BUdMKg4cOsnSwDhfo4uRk0NCwERi2eUXTF2MXBxCAruYJBZtXcwI4RxmlDh5dCYzSBWbgJrE
 0z8N7CC2iECNxK7NbxhBbGYBXYkv/TfAbGGBAInHLyYwQdQESpya2g3UywFkW0lc/R0DEmYR
 UJV4f3QuWDmvgK/Eis4nYOVCAlUSk65BjOQUcJF4uPAdWJxRQEzi+6k1TBCrxCVuPZnPBHG0
 gMSSPeeZIWxRiZeP/7FC2EoSDSv+QdXrSCzY/YkNwtaWWLbwNTPEXkGJkzOfsExgFJ2FZOws
 JC2zkLTMQtKygJFlFaNQYklObmJmTnq5kV5ibqZecn7uJkZIHOXvYPz40fwQowAHoxIP7/X9
 t2KEWBPLiitzDzFKcDArifBGKd6IEeJNSaysSi3Kjy8qzUktPsQozcGiJM47I+RyjJBAemJJ
 anZqakFqEUyWiYNTqoExaopQW5qP5tXzMkr3vy53T7rCltR3buL3H8elkifP3iZemWDN0P+Y
 wakvv+VgmorL1EUrX1zds1ZaN4w77IDipbmGz48r84jNXMj7VFf5qdyDe1J3i+uKTh2O6Rer
 nSER//L4cqeLhQJfd2woUoiKel8X5TOjYOvhVFsGnWuBLbwa5V+Eq3OVWIozEg21mIuKEwFe
 lTQenwIAAA==
X-Mailman-Approved-At: Wed, 22 May 2019 17:12:17 +1000
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Andrew for your prompt response!
Sure I will use the proper options in git format-patch at the next time, th=
anks for the tips :-)
Our team will review your comments and submit updated version soon.

Best Regards,
--Hongwei

-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>=20
Sent: Monday, May 13, 2019 10:54 PM
To: Hongwei Zhang <Hongweiz@ami.com>; Joel Stanley <joel@jms.id.au>; openbm=
c@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: [PATCH linux dev-5.0] ARM: dts: aspeed: Add Microsoft Olympus =
BMC

Hello Hongwei,

Thanks for the patch!

I think this is the second or third iteration? If you send an updated patch=
 in the future please make sure to use the `-v` option as well as`--subject=
-prefix` to `git format-patch` - this changes the subject to e.g. `[PATCH l=
inux dev-5.0 v2]` and allows us to identify why you've sent the patch from =
reading the subject.

On Tue, 14 May 2019, at 03:48, Hongwei Zhang wrote:
> Olympus is a Microsoft OCP platform equipped with Aspeed 2400 BMC Soc.
>=20
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 204=20
> +++++++++++++++++++++
>  2 files changed, 205 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile=20
> index c01a7b1..072725a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1242,6 +1242,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>  	aspeed-bmc-facebook-tiogapass.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-lenovo-hr630.dtb \
> +	aspeed-bmc-microsoft-olympus.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-opp-palmetto.dtb \
>  	aspeed-bmc-opp-romulus.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> new file mode 100644
> index 0000000..ed25fac
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> @@ -0,0 +1,204 @@
> +//SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Device Tree file for Microsoft Olympus platform.
> + */
> +
> +/dts-v1/;
> +
> +#include "aspeed-g4.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model =3D "Olympus BMC";
> +	compatible =3D "microsoft,olympus-bmc", "aspeed,ast2400";
> +
> +	chosen {
> +		stdout-path =3D &uart5;
> +		bootargs =3D "console=3DttyS4,115200 earlyprintk";
> +	};
> +
> +	memory@40000000 {
> +		reg =3D <0x40000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		vga_memory: framebuffer@5f000000 {
> +			no-map;
> +			reg =3D <0x5f000000 0x01000000>; /* 16M */
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		bmc_heartbeat {
> +			gpios =3D <&gpio ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		power_green {
> +			gpios =3D <&gpio ASPEED_GPIO(U, 2) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		power_amber {
> +			gpios =3D <&gpio ASPEED_GPIO(U, 3) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		identify {
> +			gpios =3D <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		fault {
> +			gpios =3D <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +
> +	iio-hwmon {
> +		compatible =3D "iio-hwmon";
> +		io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +		<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
> +	};
> +};
> +
> +&adc {
> +	status =3D "okay";

Can you please add the pinmux properties for the ADC lines that you're usin=
g?
The iio-hwmon node suggests you're using lines 0-7.

> +};
> +
> +&fmc {
> +	status =3D "okay";
> +
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "bmc";
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";

This is missing the pinctrl-0 property.

I think in the last version of the patch you had this set to:

pinctrl-0 =3D <&pinctrl_spi1debug_default>;

and I queried how the board was strapped - you still need the pinctrl-0 nod=
e, but what I should have been clearer about was that you should probably b=
e using the following instead:

pinctrl-0 =3D <&pinctrl_spi1_default>;

unless your board is strapped for SPI debug mode. This is something you'll =
need to check on the schematics, as pinctrl won't modify the strapping valu=
e to accommodate the devicetree in this case.

Otherwise, the patch looks okay to me!

Cheers,

Andrew

> +
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "pnor";
> +	};
> +};
> +
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +&mac0 {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default &pinctrl_mdio1_default>; };
> +
> +&i2c0 {
> +	status =3D "okay";
> +};
> +
> +&i2c1 {
> +	status =3D "okay";
> +
> +	tmp421@4c {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x4c>;
> +	};
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
> +	clock-frequency =3D <100000>;
> +};
> +
> +&i2c5 {
> +	status =3D "okay";
> +};
> +
> +&i2c6 {
> +	status =3D "okay";
> +
> +	tmp421@4c {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x4c>;
> +	};
> +};
> +
> +&i2c7 {
> +	status =3D "okay";
> +};
> +
> +&vuart {
> +	status =3D "okay";
> +};
> +
> +&wdt2 {
> +	status =3D "okay";
> +};
> +
> +&lpc_ctrl {
> +	status =3D "okay";
> +};
> +
> +&mbox {
> +	status =3D "okay";
> +};
> +
> +&pwm_tacho {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D    <&pinctrl_pwm0_default
> +			&pinctrl_pwm1_default
> +			&pinctrl_pwm2_default
> +			&pinctrl_pwm3_default
> +			&pinctrl_pwm4_default
> +			&pinctrl_pwm5_default
> +			&pinctrl_pwm6_default>;
> +
> +	fan@0 {
> +		reg =3D <0x00>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> +	};
> +
> +	fan@1 {
> +		reg =3D <0x01>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
> +	};
> +
> +	fan@2 {
> +		reg =3D <0x02>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x02>;
> +	};
> +
> +	fan@3 {
> +		reg =3D <0x03>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x03>;
> +	};
> +
> +	fan@4 {
> +		reg =3D <0x04>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x04>;
> +	};
> +
> +	fan@5 {
> +		reg =3D <0x05>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x05>;
> +	};
> +
> +};
> --
> 2.7.4
>=20
>
