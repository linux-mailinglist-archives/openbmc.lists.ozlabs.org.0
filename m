Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8AC681F71
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 00:12:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5P9H1hR6z2yxQ
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 10:12:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=supermicro.com.tw header.i=@supermicro.com.tw header.a=rsa-sha256 header.s=dkim header.b=FuU0LOvf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=supermicro.com.tw (client-ip=211.75.19.8; helo=twmgb.supermicro.com.tw; envelope-from=ryans@supermicro.com.tw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=supermicro.com.tw header.i=@supermicro.com.tw header.a=rsa-sha256 header.s=dkim header.b=FuU0LOvf;
	dkim-atps=neutral
X-Greylist: delayed 1535 seconds by postgrey-1.36 at boromir; Mon, 30 Jan 2023 20:07:14 AEDT
Received: from twmgb.supermicro.com.tw (211-75-19-8.hinet-ip.hinet.net [211.75.19.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P52PZ4515z3c6R
	for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2023 20:07:14 +1100 (AEDT)
Received: from pps.filterd (twmgb.supermicro.com.tw [127.0.0.1])
	by twmgb.supermicro.com.tw (8.17.1.19/8.17.1.19) with ESMTP id 30U4hpW8018330;
	Mon, 30 Jan 2023 16:41:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=supermicro.com.tw; h=from : to : cc
 : subject : date : message-id : content-type : mime-version; s=dkim;
 bh=6cX6x8eabzWoGkg9fJbjPWURlLqzZeMQmho/rl8v40M=;
 b=FuU0LOvfqVxvk50jdDZX4gL4fsOapnKfzNSSZQKH2qgOkC1gi+166dZtwjRdXyTS4Of8
 2IiEqxCs/ld5myeuoGSf+3iSfGIW+WmUXPFed72gi0UD5t7bvyD8VseIFybfyybhrOUE
 dNik7XqcBw5aa3qFRdcW1yPbLo5IiSAGIHLZ8xEMT+spL7wzsBsGK4GOB/glZ+PXgfR0
 4Mriai3XyaboqXAZcYfgE7SvXz35FNQ+VRNkcK1+vjlkTnMoLgPQ5FcfnupLTpiAQ3m6
 fZU6qdlQJmEouNiks3A3NAUixs7mlmdujj6IfjV8Z0U2ChqP6NN2rTaO7cOQeTYuweLC mQ== 
Received: from tw-ex2013-mbx1.supermicro.com (TW-EX2013-MBX1.supermicro.com [10.128.8.63])
	by twmgb.supermicro.com.tw (PPS) with ESMTPS id 3nckvd8j5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 16:41:22 +0800
Received: from TW-EX2013-MBX1.supermicro.com (10.128.8.63) by
 TW-EX2013-MBX1.supermicro.com (10.128.8.63) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Mon, 30 Jan 2023 16:41:22 +0800
Received: from TW-EX2013-MBX1.supermicro.com ([fe80::8c8f:732c:cad9:8f60]) by
 TW-EX2013-MBX1.supermicro.com ([fe80::8c8f:732c:cad9:8f60%12]) with mapi id
 15.00.1497.036; Mon, 30 Jan 2023 16:41:21 +0800
From: Ryan Sie <RyanS@supermicro.com.tw>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] Add Supermicro X13DEM BMC machine
Thread-Topic: Re: [PATCH] Add Supermicro X13DEM BMC machine
Thread-Index: Adk0hpijphR4SRfcQoKnmN5IjhPJ6Q==
Date: Mon, 30 Jan 2023 08:41:21 +0000
Message-ID: <cd2a9b0031154d578ee97715fef8d791@TW-EX2013-MBX1.supermicro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.151.176.70]
Content-Type: multipart/alternative;
	boundary="_000_cd2a9b0031154d578ee97715fef8d791TWEX2013MBX1supermicroc_"
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_07,2023-01-27_01,2022-06-22_01
X-Mailman-Approved-At: Tue, 31 Jan 2023 10:12:19 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_cd2a9b0031154d578ee97715fef8d791TWEX2013MBX1supermicroc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,



Thanks for the reminder, i write the review in red letters.



-----Original Message-----
From: Andrew Jeffery andrew@aj.id.au<mailto:andrew@aj.id.au>
Sent: Monday, January 23, 2023 10:01 AM
To: Ryan Sie lesly895@gmail.com<mailto:lesly895@gmail.com>; openbmc@lists.o=
zlabs.org<mailto:openbmc@lists.ozlabs.org>
Cc: Ryan Sie - TW (HW 1) RyanS@supermicro.com.tw<mailto:RyanS@supermicro.co=
m.tw>
Subject: Re: [PATCH] Add Supermicro X13DEM BMC machine



[CAUTION: External Mail]



Hi Ryan,



Thanks for the patch. Please make sure to Cc the upstream lists:



* linux-aspeed@lists.ozlabs.org<mailto:linux-aspeed@lists.ozlabs.org>

* devicetree@vger.kernel.org<mailto:devicetree@vger.kernel.org>



and any other people or lists that are found by running scripts/get_maintai=
ner.pl.



Also, please run your patch through scripts/checkpatch.pl



I have a few other comments and queries:



On Wed, 28 Dec 2022, at 16:52, Ryan Sie wrote:

> Signed-off-by: Ryan Sie <ryans@supermicro.com.tw<mailto:ryans@supermicro.=
com.tw>>

> ---

>  arch/arm/boot/dts/Makefile                    |   1 +

>  .../boot/dts/aspeed-bmc-supermicro-x13dem.dts | 476

> ++++++++++++++++++

>  2 files changed, 477 insertions(+)

>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts

>

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile

> index 2ee9c043218b..3b89006fa008 100644

> --- a/arch/arm/boot/dts/Makefile

> +++ b/arch/arm/boot/dts/Makefile

> @@ -1623,6 +1623,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \

>    aspeed-bmc-quanta-q71l.dtb \

>    aspeed-bmc-quanta-s6q.dtb \

>    aspeed-bmc-supermicro-x11spi.dtb \

> +   aspeed-bmc-supermicro-x13dem.dtb \

>    aspeed-bmc-inventec-transformers.dtb \

>    aspeed-bmc-tyan-s7106.dtb \

>    aspeed-bmc-tyan-s8036.dtb \

> diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts

> b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts

> new file mode 100644

> index 000000000000..b94783a52999

> --- /dev/null

> +++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts

> @@ -0,0 +1,476 @@

> +/dts-v1/;

> +

> +#include "aspeed-g6.dtsi"

> +#include <dt-bindings/gpio/aspeed-gpio.h> #include

> +<dt-bindings/i2c/i2c.h>

> +

> +/ {

> +   model =3D "AST2600 BMC";

> +   compatible =3D "aspeed,ast2600";

> +

> +   chosen {

> +           stdout-path =3D &uart5;

> +           bootargs =3D "console=3DttyS4,115200 earlyprintk";

> +   };

> +

> +   memory@80000000 {

> +           device_type =3D "memory";

> +           reg =3D <0x80000000 0x40000000>;

> +   };

> +

> +   reserved-memory {

> +           #address-cells =3D <1>;

> +           #size-cells =3D <1>;

> +           ranges;

> +

> +           gfx_memory: framebuffer {

> +                   size =3D <0x01000000>;

> +                   alignment =3D <0x01000000>;

> +                   compatible =3D "shared-dma-pool";

> +                   reusable;

> +           };

> +

> +           video_engine_memory: jpegbuffer {

> +                   size =3D <0x02000000>;      /* 32M */

> +                   alignment =3D <0x01000000>;

> +                   compatible =3D "shared-dma-pool";

> +                   reusable;

> +           };

> +

> +           ssp_memory: ssp_memory {

> +                   size =3D <0x00200000>;

> +                   alignment =3D <0x00100000>;

> +                   compatible =3D "shared-dma-pool";

> +                   no-map;

> +           };



How is this reserved memory used?

Supermicro internal use, i will remove it.



> +

> +   };

> +

> +   leds {

> +       compatible =3D "gpio-leds";

> +       powerfail {

> +           default-state =3D "off";

> +           gpios =3D <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_LOW>;

> +       };

> +   };

> +

> +   iio-hwmon {

> +           compatible =3D "iio-hwmon";

> +           io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,

> +                   <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,

> +                   <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,

> +                   <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;

> +   };

> +

> +#if 0

> +   aliases {

> +           i2c18 =3D &imux18;

> +           i2c19 =3D &imux19;

> +           i2c20 =3D &imux20;

> +           i2c21 =3D &imux21;

> +           i2c22 =3D &imux22;

> +           mmc0 =3D &emmc;

> +   };

> +#else

> +   aliases {

> +           mmc0 =3D &emmc;

> +   };

> +#endif



Please remove the ifdefery.

I will remove it.



> +

> +};

> +

> +&emmc_controller {

> +   status =3D "okay";

> +   timing-phase =3D <0x700FF>;



This is not a valid property. Instead you need to use the clk-phase* proper=
ties that upstream provides:



https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git=
/torvalds/linux.git/tree/Documentation/devicetree/bindings/mmc/mmc-controll=
er.yaml?h=3Dv6.2-rc5*n348__;Iw!!ORmjBF0Gq6jo!Ycod3yQsReZptIU0NgDMRyLN3q37O4=
r90hvpuRQyDxlG5EdTGrcNLCKR51sA_ndx8on6ng4dVgBm16nGTg4$<https://urldefense.c=
om/v3/__https:/git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/devicetree/bindings/mmc/mmc-controller.yaml?h=3Dv6.2-rc5*=
n348__;Iw!!ORmjBF0Gq6jo!Ycod3yQsReZptIU0NgDMRyLN3q37O4r90hvpuRQyDxlG5EdTGrc=
NLCKR51sA_ndx8on6ng4dVgBm16nGTg4$>



These require knowing how much phase correction you need for a given bus sp=
eed.

I will remove timing-phase property, use default first.





> +};

> +

> +&emmc {

> +   status =3D "okay";

> +

> +   non-removable;

> +   max-frequency =3D <100000000>;

> +   sdhci-drive-type =3D /bits/ 8 <3>;

> +#if 1

> +   bus-width =3D <4>;

> +#else

> +   bus-width =3D <8>;

> +   pinctrl-0 =3D <&pinctrl_emmc_default

> +                   &pinctrl_emmcdat4_default

> +                   &pinctrl_emmcdat5_default

> +                   &pinctrl_emmcdat6_default

> +                   &pinctrl_emmcdat7_default>;

> +#endif



Please remove the ifdefery

I will remove it.



> +};

> +

> +//&jtag1 {

> +//        status =3D "okay";

> +//};



Remove commented nodes.

I will remove it.



> +

> +&fmc {

> +   status =3D "okay";

> +   flash@0 {

> +           status =3D "okay";

> +           label =3D "bmc";

> +           spi-max-frequency =3D <25000000>;

> +           spi-tx-bus-width =3D <1>;

> +           m25p,fast-read;

> +           partitions {

> +                   compatible =3D "fixed-partitions";

> +                   #address-cells =3D <1>;

> +                   #size-cells =3D <1>;

> +

> +                   u-boot@0 {

> +                           reg =3D <0x0 0x100000>;

> +                           label =3D "u-boot";

> +                   };

> +                   u-boot-env@3f0000 {

> +                           reg =3D <0x3f0000 0x10000>;

> +                           label =3D "u-boot-env";

> +                   };

> +                   u-boot-env-redund@7f0000 {

> +                           reg =3D <0x7f0000 0x10000>;

> +                           label =3D "u-boot-env-redund";

> +                   };

> +           };

> +   };

> +};



Do you actually have both SPI-NOR and eMMC storage for the BMC?

Yes, nor-flash for uboot, emmc for kernel+filesystem+supermicro features



> +

> +&spi1 {

> +   status =3D "okay";

> +   flash@0 {

> +           status =3D "okay";

> +           label =3D "spi1:0";

> +           spi-max-frequency =3D <25000000>;

> +           spi-bus-width =3D <1>;

> +           partitions {

> +                   compatible =3D "fixed-partitions";

> +                   #address-cells =3D <1>;

> +                   #size-cells =3D <1>;

> +                   all-bios@0 {

> +                           label =3D "all_part_bios";

> +                           reg =3D <0x000000000 0x02000000>;

> +                   };

> +           };

> +   };

> +

> +};

> +

> +&spi2 {

> +   status =3D "disabled";

> +

> +   pinctrl-names =3D "default";

> +   pinctrl-0 =3D <&pinctrl_spi2_default &pinctrl_spi2cs1_default

> &pinctrl_spi2cs2_default

> +                           &pinctrl_qspi2_default>;

> +

> +   flash@0 {

> +           status =3D "okay";

> +           label =3D "spi2:0";

> +           spi-max-frequency =3D <100000000>;

> +           spi-bus-width =3D <2>;

> +           m25p,fast-read;

> +   };

> +};

> +

> +//&peci0 {

> +//        status =3D "okay";

> +//};



Delete commented nodes

I will remove it.



> +

> +&syscon {

> +   uart-clock-high-speed;



This isn't a valid property. Please run your devicetree through `make dtbs_=
check`.

I will remove it.





> +   status =3D "okay";

> +};

> +

> +&adc0 {

> +   status =3D "okay";



You must also add the pinctrl properties here to ensure your ADC lines aren=
't accidentally muxed for other purposes.

I will modify it.



> +};

> +

> +&adc1 {

> +   status =3D "okay";



Again here.

I will modify it.





> +};

> +

> +&gpio0 {

> +   status =3D "okay";

> +   gpio-line-names =3D

> +           /*A0-A7*/       "","","","","","","","",

> +           /*B0-B7*/       "","","","","","","","",

> +           /*C0-C7*/       "","","","","","","","",

> +           /*D0-D7*/       "","","","","","","","",

> +           /*E0-E7*/        "","","","","","","","",

> +           /*F0-F7*/        "","","","","","","","",

> +           /*G0-G7*/       "","","","","","","","",

> +           /*H0-H7*/       "","NMI_N","PWRBTN_N","RST_N","","","","",

> +           /*I0-I7*/  "","","","","","","","",

> +           /*J0-J7*/ "","","","","","","","",

> +           /*K0-K7*/        "","","","","","","","",

> +           /*L0-L7*/ "","","","","","","","",

> +           /*M0-M7*/     "","","","","","","","",

> +           /*N0-N7*/       "","","","","","","","",

> +           /*O0-O7*/      "","","","","","","","",

> +           /*P0-P7*/        "","","","","","","","",

> +           /*Q0-Q7*/      "","","","","","","","",

> +           /*R0-R7*/       "","","","","","","","",

> +           /*S0-S7*/        "","","","","PWROK_IN","","","",

> +           /*T0-T7*/        "","","","","","","","",

> +           /*U0-U7*/       "","","","","","","","",

> +           /*V0-V7*/       "","","","","","","","",

> +           /*W0-W7*/     "","","","","","","","",

> +           /*X0-X7*/        "","BIOS_CMP_IN","","","","","","",

> +           /*Y0-Y7*/        "","","","","","","","",

> +           /*Z0-Z7*/        "","","PWRBTN_IN","","","","","";

> +};

> +

> +&gpio1 {

> +   status =3D "disabled";

> +};

> +

> +&sgpiom0 {

> +   status =3D "disabled";

> +   gpio-line-names =3D

> +           /* SGPIO output lines */

> +           /*OA0-OA7*/  "","","","","","","","",

> +           /*OB0-OB7*/  "","","","","","","","",

> +           /*OC0-OC7*/  "","","","","","","","",

> +           /*OD0-OD7*/ "","","","","","","","",

> +           /*OE0-OE7*/  "","","","","","","","",

> +           /*OF0-OF7*/   "","","","","","","","",

> +           /*OG0-OG7*/ "","","","","","","","",

> +           /*OH0-OH7*/ "","","","","","","","",

> +           /*OI0-OI7*/    "","","","","","","","",

> +           /*OJ0-OJ7*/    "","","","","","","","",

> +           /*DUMMY*/   "","","","","","","","",

> +           /*DUMMY*/   "","","","","","","","",

> +

> +           /* SGPIO input lines */

> +           /*IA0-IA7*/     "","","","","","","","",

> +           /*IB0-IB7*/     "","","","","","","","",

> +           /*IC0-IC7*/     "","","","","","","","",

> +           /*ID0-ID7*/     "","","","","","","","",

> +           /*IE0-IE7*/      "","","","","","","","",

> +           /*IF0-IF7*/      "","","","","","","","",

> +           /*IG0-IG7*/     "","","","","","","","",

> +           /*IH0-IH7*/     "","","","","","","","",

> +           /*II0-II7*/        "","","","","","","","",

> +           /*IJ0-IJ7*/       "","","","","","","","";

> +};

> +

> +&kcs3 {

> +   aspeed,lpc-io-reg =3D <0xCA2>;

> +   status =3D "okay";

> +};

> +

> +&kcs4 {

> +   aspeed,lpc-io-reg =3D <0xCA4>;

> +   status =3D "okay";

> +};

> +

> +//&lpc_sio {

> +//        status =3D "okay";

> +//};



Delete commented nodes.



I don't think this node is even legitimate. Does this devicetree compile?

I confirm that it has been compiled



> +

> +&lpc_snoop {

> +   snoop-ports =3D <0x80>;

> +   status =3D "okay";

> +};

> +

> +//&mbox {

> +//        status =3D "okay";

> +//};



Delete commented node.

I will modify it.



> +

> +&uart1 {

> +   status =3D "okay";

> +   pinctrl-names =3D "default";

> +   pinctrl-0 =3D <&pinctrl_txd1_default

> +                   &pinctrl_rxd1_default

> +                   &pinctrl_nrts1_default

> +                   &pinctrl_ndtr1_default

> +                   &pinctrl_ndsr1_default

> +                   &pinctrl_ncts1_default

> +                   &pinctrl_ndcd1_default

> +                   &pinctrl_nri1_default>;

> +};

> +

> +&uart2 {

> +   status =3D "okay";

> +   pinctrl-names =3D "default";

> +   pinctrl-0 =3D <&pinctrl_txd2_default

> +                   &pinctrl_rxd2_default

> +                   &pinctrl_nrts2_default

> +                   &pinctrl_ndtr2_default

> +                   &pinctrl_ndsr2_default

> +                   &pinctrl_ncts2_default

> +                   &pinctrl_ndcd2_default

> +                   &pinctrl_nri2_default>;

> +};

> +

> +&uart3 {

> +   status =3D "okay";

> +};

> +

> +&uart4 {

> +   status =3D "okay";

> +};

> +

> +&uart5 {

> +   status =3D "okay";

> +};

> +

> +&uart_routing {

> +   status =3D "okay";

> +};

> +

> +&mdio0 {

> +   status =3D "okay";

> +

> +   ethphy0: ethernet-phy@0 {

> +           compatible =3D "ethernet-phy-ieee802.3-c22";

> +           reg =3D <0>;

> +   };

> +};

> +

> +&mac0 {

> +    status =3D "okay";

> +

> +    phy-mode =3D "rgmii";

> +    phy-handle =3D <&ethphy0>;

> +

> +    pinctrl-names =3D "default";

> +    pinctrl-0 =3D <&pinctrl_rgmii1_default>; };

> +

> +&mdio1 {

> +   status =3D "disabled";

> +

> +   ethphy1: ethernet-phy@0 {

> +           compatible =3D "ethernet-phy-ieee802.3-c22";

> +           reg =3D <0>;

> +   };

> +};

> +

> +&mac1 {

> +   status =3D "disabled";

> +   pinctrl-names =3D "default";

> +   pinctrl-0 =3D <&pinctrl_rgmii2_default>;

> +   phy-mode =3D "rgmii";

> +   phy-handle =3D <&ethphy1>;

> +};

> +

> +&mdio2 {

> +   status =3D "disabled";

> +

> +   ethphy2: ethernet-phy@0 {

> +           compatible =3D "ethernet-phy-ieee802.3-c22";

> +           reg =3D <0>;

> +   };

> +};

> +

> +&mac2 {

> +   status =3D "okay";

> +   pinctrl-names =3D "default";

> +   pinctrl-0 =3D <&pinctrl_rmii3_default>;

> +   use-ncsi;

> +};

> +

> +&mdio3 {

> +   status =3D "disabled";

> +

> +   ethphy3: ethernet-phy@0 {

> +           compatible =3D "ethernet-phy-ieee802.3-c22";

> +           reg =3D <0>;

> +   };

> +};

> +

> +&mac3 {

> +   status =3D "disabled";

> +   pinctrl-names =3D "default";

> +   phy-handle =3D <&ethphy3>;

> +   phy-mode =3D "rgmii";

> +

> +};

> +

> +&i2c0 {

> +   status =3D "okay";

> +};

> +

> +&i2c1 {

> +   status =3D "disabled";

> +};

> +

> +&i2c2 {

> +   multi-master;

> +   status =3D "okay";

> +#if 0

> +   i2c-switch@71 {

> +           compatible =3D "nxp,pca9548";

> +           #address-cells =3D <1>;

> +           #size-cells =3D <0>;

> +           reg =3D <0x71>;

> +           i2c-mux-idle-disconnect;

> +

> +           imux18: i2c@2 {

> +                   #address-cells =3D <1>;

> +                   #size-cells =3D <0>;

> +                   reg =3D <2>;

> +           };

> +

> +           imux19: i2c@3 {

> +                   #address-cells =3D <1>;

> +                   #size-cells =3D <0>;

> +                   reg =3D <3>;

> +           };

> +

> +           imux20: i2c@4 {

> +                   #address-cells =3D <1>;

> +                   #size-cells =3D <0>;

> +                   reg =3D <4>;

> +           };

> +

> +           imux21: i2c@5 {

> +                   #address-cells =3D <1>;

> +                   #size-cells =3D <0>;

> +                   reg =3D <5>;

> +           };

> +

> +           imux22: i2c@6 {

> +                   #address-cells =3D <1>;

> +                   #size-cells =3D <0>;

> +                   reg =3D <6>;

> +           };

> +   };

> +#endif



Delete the ifdefery

I will remove it.





The rest looks okay.



Cheers,



Andrew


--_000_cd2a9b0031154d578ee97715fef8d791TWEX2013MBX1supermicroc_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"\7D14\6587\5B57 \5B57\5143";
	margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.a
	{mso-style-name:"\7D14\6587\5B57 \5B57\5143";
	mso-style-priority:99;
	mso-style-link:\7D14\6587\5B57;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi Andrew, <o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Thanks for the reminder, i w=
rite the review in red letters.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-----Original Message-----<b=
r>
From: Andrew Jeffery <a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>=
 <br>
Sent: Monday, January 23, 2023 10:01 AM<br>
To: Ryan Sie <a href=3D"mailto:lesly895@gmail.com">lesly895@gmail.com</a>; =
<a href=3D"mailto:openbmc@lists.ozlabs.org">
openbmc@lists.ozlabs.org</a><br>
Cc: Ryan Sie - TW (HW 1) <a href=3D"mailto:RyanS@supermicro.com.tw">RyanS@s=
upermicro.com.tw</a><br>
Subject: Re: [PATCH] Add Supermicro X13DEM BMC machine<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[CAUTION: External Mail]<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi Ryan,<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Thanks for the patch. Please=
 make sure to Cc the upstream lists:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">* <a href=3D"mailto:linux-as=
peed@lists.ozlabs.org">
<span style=3D"color:windowtext;text-decoration:none">linux-aspeed@lists.oz=
labs.org</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">* <a href=3D"mailto:devicetr=
ee@vger.kernel.org">
<span style=3D"color:windowtext;text-decoration:none">devicetree@vger.kerne=
l.org</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">and any other people or list=
s that are found by running scripts/get_maintainer.pl.<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Also, please run your patch =
through scripts/checkpatch.pl<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I have a few other comments =
and queries:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">On Wed, 28 Dec 2022, at 16:5=
2, Ryan Sie wrote:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Signed-off-by: Ryan Sie=
 &lt;<a href=3D"mailto:ryans@supermicro.com.tw"><span style=3D"color:window=
text;text-decoration:none">ryans@supermicro.com.tw</span></a>&gt;<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; ---<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; arch/arm/boot/dts=
/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 &#43;<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; .../boot/dts/aspe=
ed-bmc-supermicro-x13dem.dts | 476
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; 2 files changed, =
477 insertions(&#43;)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; create mode 10064=
4 arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; diff --git a/arch/arm/b=
oot/dts/Makefile b/arch/arm/boot/dts/Makefile
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; index 2ee9c043218b..3b8=
9006fa008 100644<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; --- a/arch/arm/boot/dts=
/Makefile<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&#43;&#43; b/arch/=
arm/boot/dts/Makefile<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; @@ -1623,6 &#43;1623,7 =
@@ dtb-$(CONFIG_ARCH_ASPEED) &#43;=3D \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; aspeed-bmc=
-quanta-q71l.dtb \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; aspeed-bmc=
-quanta-s6q.dtb \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; aspeed-bmc=
-supermicro-x11spi.dtb \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; aspee=
d-bmc-supermicro-x13dem.dtb \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; aspeed-bmc=
-inventec-transformers.dtb \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; aspeed-bmc=
-tyan-s7106.dtb \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; aspeed-bmc=
-tyan-s8036.dtb \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; diff --git a/arch/arm/b=
oot/dts/aspeed-bmc-supermicro-x13dem.dts<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; b/arch/arm/boot/dts/asp=
eed-bmc-supermicro-x13dem.dts<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; new file mode 100644<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; index 000000000000..b94=
783a52999<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; --- /dev/null<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&#43;&#43; b/arch/=
arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; @@ -0,0 &#43;1,476 @@<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;/dts-v1/;<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#include &quot;asp=
eed-g6.dtsi&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#include &lt;dt-bi=
ndings/gpio/aspeed-gpio.h&gt; #include
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&lt;dt-bindings/i2=
c/i2c.h&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;/ {<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; model=
 =3D &quot;AST2600 BMC&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; compa=
tible =3D &quot;aspeed,ast2600&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; chose=
n {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stdout-path =3D &amp;uart5;<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bootargs =3D &quot;console=3Dtty=
S4,115200 earlyprintk&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; memor=
y@80000000 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_type =3D &quot;memory&quo=
t;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x80000000 0x4000000=
0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; reser=
ved-memory {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;1&gt;;<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gfx_memory: framebuffer {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; size =3D &lt;0x01000000&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; alignment =3D &lt;0x01000000&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; compatible =3D &quot;shared-dma-pool&quot;;<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; reusable;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; video_engine_memory: jpegbuffer =
{<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; size =3D &lt;0x02000000&gt;;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/* 32M */<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; alignment =3D &lt;0x01000000&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; compatible =3D &quot;shared-dma-pool&quot;;<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; reusable;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">&gt; &#4=
3;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssp_memory: =
ssp_memory {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">&gt; &#4=
3;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size =3D &lt;0x00200000&gt;;<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">&gt; &#4=
3;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alignment =3D &lt;0x00100000&gt;;<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">&gt; &#4=
3;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;shared-dma-pool&qu=
ot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">&gt; &#4=
3;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">&gt; &#4=
3;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">How is this reserved memory =
used?<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">Supermic=
ro internal use, i will remove it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; leds =
{<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp; compatible =3D &quot;gpio-leds&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp; powerfail {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default-state =3D &quot;off&quot=
;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpios =3D &lt;&amp;gpio0 ASPEED_=
GPIO(G, 5) GPIO_ACTIVE_LOW&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; iio-h=
wmon {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;iio-hwmon&q=
uot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io-channels =3D &lt;&amp;adc0 0&=
gt;, &lt;&amp;adc0 1&gt;, &lt;&amp;adc0 2&gt;, &lt;&amp;adc0 3&gt;,<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &lt;&amp;adc0 4&gt;, &lt;&amp;adc0 5&gt;, &lt;&amp;adc0 6&g=
t;, &lt;&amp;adc0 7&gt;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &lt;&amp;adc1 0&gt;, &lt;&amp;adc1 1&gt;, &lt;&amp;adc1 2&g=
t;, &lt;&amp;adc1 3&gt;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &lt;&amp;adc1 4&gt;, &lt;&amp;adc1 5&gt;, &lt;&amp;adc1 6&g=
t;, &lt;&amp;adc1 7&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#if 0<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; alias=
es {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i2c18 =3D &amp;imux18;<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i2c19 =3D &amp;imux19;<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i2c20 =3D &amp;imux20;<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i2c21 =3D &amp;imux21;<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i2c22 =3D &amp;imux22;<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmc0 =3D &amp;emmc;<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#else<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; alias=
es {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmc0 =3D &amp;emmc;<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#endif<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Please remove the ifdefery.<=
o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will r=
emove it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;emmc_controll=
er {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">&gt; &#4=
3;&nbsp;&nbsp; timing-phase =3D &lt;0x700FF&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">This is not a valid property=
. Instead you need to use the clk-phase* properties that upstream provides:=
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><a href=3D"https://urldefens=
e.com/v3/__https:/git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/Documentation/devicetree/bindings/mmc/mmc-controller.yaml?h=3Dv6.2-r=
c5*n348__;Iw!!ORmjBF0Gq6jo!Ycod3yQsReZptIU0NgDMRyLN3q37O4r90hvpuRQyDxlG5EdT=
GrcNLCKR51sA_ndx8on6ng4dVgBm16nGTg4$"><span style=3D"color:windowtext;text-=
decoration:none">https://urldefense.com/v3/__https://git.kernel.org/pub/scm=
/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings=
/mmc/mmc-controller.yaml?h=3Dv6.2-rc5*n348__;Iw!!ORmjBF0Gq6jo!Ycod3yQsReZpt=
IU0NgDMRyLN3q37O4r90hvpuRQyDxlG5EdTGrcNLCKR51sA_ndx8on6ng4dVgBm16nGTg4$</sp=
an></a>
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">These require knowing how mu=
ch phase correction you need for a given bus speed.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will r=
emove timing-phase property, use default first.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;emmc {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; non-r=
emovable;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; max-f=
requency =3D &lt;100000000&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; sdhci=
-drive-type =3D /bits/ 8 &lt;3&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#if 1<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; bus-w=
idth =3D &lt;4&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#else<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; bus-w=
idth =3D &lt;8&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-0 =3D &lt;&amp;pinctrl_emmc_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_emmcdat4_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_emmcdat5_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;pinctrl_emmcdat6_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_emmcdat7_default&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#endif<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Please remove the ifdefery<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will r=
emove it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//&amp;jtag1 {<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//};<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Remove commented nodes.<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will r=
emove it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;fmc {<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; flash=
@0 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label =3D &quot;bmc&quot;;<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi-max-frequency =3D &lt;250000=
00&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi-tx-bus-width =3D &lt;1&gt;;<=
o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m25p,fast-read;<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; partitions {<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; compatible =3D &quot;fixed-partitions&quot;;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #size-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; u-boot@0 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt=
;0x0 0x100000&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label =3D &=
quot;u-boot&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; u-boot-env@3f0000 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt=
;0x3f0000 0x10000&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label =3D &=
quot;u-boot-env&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; u-boot-env-redund@7f0000 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt=
;0x7f0000 0x10000&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label =3D &=
quot;u-boot-env-redund&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Do you actually have both SP=
I-NOR and eMMC storage for the BMC?<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">Yes, nor=
-flash for uboot, emmc for kernel&#43;filesystem&#43;supermicro features<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;spi1 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; flash=
@0 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label =3D &quot;spi1:0&quot;;<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi-max-frequency =3D &lt;250000=
00&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi-bus-width =3D &lt;1&gt;;<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; partitions {<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; compatible =3D &quot;fixed-partitions&quot;;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #size-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; all-bios@0 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label =3D &=
quot;all_part_bios&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt=
;0x000000000 0x02000000&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;spi2 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-names =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-0 =3D &lt;&amp;pinctrl_spi2_default &amp;pinctrl_spi2cs1_default<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &amp;pinctrl_spi2cs2_de=
fault<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;pinctr=
l_qspi2_default&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; flash=
@0 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label =3D &quot;spi2:0&quot;;<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi-max-frequency =3D &lt;100000=
000&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi-bus-width =3D &lt;2&gt;;<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m25p,fast-read;<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//&amp;peci0 {<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//};<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Delete commented nodes<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will r=
emove it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;syscon {<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; uart-=
clock-high-speed;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">This isn't a valid property.=
 Please run your devicetree through `make dtbs_check`.<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will r=
emove it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;adc0 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">You must also add the pinctr=
l properties here to ensure your ADC lines aren't accidentally muxed for ot=
her purposes.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will m=
odify it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;adc1 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Again here.<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will m=
odify it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;gpio0 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; gpio-=
line-names =3D<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*A0-A7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*B0-B7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*C0-C7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*D0-D7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*E0-E7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&qu=
ot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*F0-F7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&qu=
ot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*G0-G7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*H0-H7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;NMI_N&quot;,&quot;PWRBTN_N&quot;,&quot;RST=
_N&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*I0-I7*/&nbsp; &quot;&quot;,&qu=
ot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,=
&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*J0-J7*/ &quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;=
&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*K0-K7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&qu=
ot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*L0-L7*/ &quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;=
&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*M0-M7*/&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&q=
uot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*N0-N7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*O0-O7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&q=
uot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*P0-P7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&qu=
ot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*Q0-Q7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&q=
uot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*R0-R7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*S0-S7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&qu=
ot;PWROK_IN&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*T0-T7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&qu=
ot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*U0-U7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*V0-V7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*W0-W7*/&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&q=
uot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*X0-X7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;BIOS_CMP_IN&quot;,&quot;&quot;,&quot=
;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*Y0-Y7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&qu=
ot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*Z0-Z7*/&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;PWRBTN_IN&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;;<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;gpio1 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;sgpiom0 {<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; gpio-=
line-names =3D<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* SGPIO output lines */<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OA0-OA7*/&nbsp; &quot;&quot;,&=
quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot=
;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OB0-OB7*/&nbsp; &quot;&quot;,&=
quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot=
;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OC0-OC7*/&nbsp; &quot;&quot;,&=
quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot=
;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OD0-OD7*/ &quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OE0-OE7*/&nbsp; &quot;&quot;,&=
quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot=
;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OF0-OF7*/&nbsp;&nbsp; &quot;&q=
uot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot=
;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OG0-OG7*/ &quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OH0-OH7*/ &quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OI0-OI7*/&nbsp;&nbsp;&nbsp; &q=
uot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;=
,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*OJ0-OJ7*/&nbsp;&nbsp;&nbsp; &q=
uot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;=
,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*DUMMY*/&nbsp;&nbsp; &quot;&quo=
t;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&=
quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*DUMMY*/&nbsp;&nbsp; &quot;&quo=
t;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&=
quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* SGPIO input lines */<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*IA0-IA7*/&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;=
&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*IB0-IB7*/&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;=
&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*IC0-IC7*/&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;=
&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*ID0-ID7*/&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;=
&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*IE0-IE7*/&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,=
&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*IF0-IF7*/&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,=
&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*IG0-IG7*/&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;=
&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*IH0-IH7*/&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;=
&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*II0-II7*/&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&=
quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*IJ0-IJ7*/&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;kcs3 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; aspee=
d,lpc-io-reg =3D &lt;0xCA2&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;kcs4 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; aspee=
d,lpc-io-reg =3D &lt;0xCA4&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//&amp;lpc_sio {<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//};<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Delete commented nodes.<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I don't think this node is e=
ven legitimate. Does this devicetree compile?<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I confir=
m that it has been compiled<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;lpc_snoop {<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; snoop=
-ports =3D &lt;0x80&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//&amp;mbox {<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;//};<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Delete commented node.<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will m=
odify it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;uart1 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-names =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-0 =3D &lt;&amp;pinctrl_txd1_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_rxd1_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_nrts1_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_ndtr1_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_ndsr1_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_ncts1_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_ndcd1_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_nri1_default&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;uart2 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-names =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-0 =3D &lt;&amp;pinctrl_txd2_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_rxd2_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_nrts2_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_ndtr2_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_ndsr2_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_ncts2_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_ndcd2_default<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;pinctrl_nri2_default&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;uart3 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;uart4 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;uart5 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;uart_routing =
{<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;mdio0 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; ethph=
y0: ethernet-phy@0 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;ethernet-ph=
y-ieee802.3-c22&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0&gt;;<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;mac0 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43; &nbsp;&nbsp;&nbsp=
;status =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
 phy-mode =3D &quot;rgmii&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
 phy-handle =3D &lt;&amp;ethphy0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
 pinctrl-names =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
 pinctrl-0 =3D &lt;&amp;pinctrl_rgmii1_default&gt;; };<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;mdio1 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; ethph=
y1: ethernet-phy@0 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;ethernet-ph=
y-ieee802.3-c22&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0&gt;;<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;mac1 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-names =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-0 =3D &lt;&amp;pinctrl_rgmii2_default&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; phy-m=
ode =3D &quot;rgmii&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; phy-h=
andle =3D &lt;&amp;ethphy1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;mdio2 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; ethph=
y2: ethernet-phy@0 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;ethernet-ph=
y-ieee802.3-c22&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0&gt;;<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;mac2 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-names =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-0 =3D &lt;&amp;pinctrl_rmii3_default&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; use-n=
csi;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;mdio3 {<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; ethph=
y3: ethernet-phy@0 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;ethernet-ph=
y-ieee802.3-c22&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0&gt;;<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;mac3 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; pinct=
rl-names =3D &quot;default&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; phy-h=
andle =3D &lt;&amp;ethphy3&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; phy-m=
ode =3D &quot;rgmii&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;i2c0 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;i2c1 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;disabled&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&amp;i2c2 {<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; multi=
-master;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; statu=
s =3D &quot;okay&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#if 0<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; i2c-s=
witch@71 {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;nxp,pca9548=
&quot;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x71&gt;;<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i2c-mux-idle-disconnect;<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imux18: i2c@2 {<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; reg =3D &lt;2&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imux19: i2c@3 {<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; reg =3D &lt;3&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imux20: i2c@4 {<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; reg =3D &lt;4&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imux21: i2c@5 {<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; reg =3D &lt;5&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imux22: i2c@6 {<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #size-cells =3D &lt;0&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; reg =3D &lt;6&gt;;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;#endif<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Delete the ifdefery<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:red">I will r=
emove it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">The rest looks okay.<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Cheers,<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Andrew<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_cd2a9b0031154d578ee97715fef8d791TWEX2013MBX1supermicroc_--
