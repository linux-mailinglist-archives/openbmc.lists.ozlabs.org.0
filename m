Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4BA55E1F
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 04:05:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YRFs2XVVzDqZB
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 12:05:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="P4gtSWcx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iwyAziBj"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YRF41DppzDqYq;
 Wed, 26 Jun 2019 12:05:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 106C020B1;
 Tue, 25 Jun 2019 22:05:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 25 Jun 2019 22:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=oUFim
 1RQR2A3/rqrJUmJgCqXfmv0uSw//05zNT2TbKk=; b=P4gtSWcxCGlI029YeC2Tz
 E7eL9KkfwCDGfXALuGsbKFSTHA5jLfyrwC6Y0nkaIyAGgBvtCSS4VkShDnEcvhLe
 R+nCoeH6pEatrprXtkdCSuVM6qGklATXZjgqecTMzXC2kNoVuYrjahxwMbYKfVvZ
 DZbHzjlqKUXcJ8hlU++b2G7m07nkXqMMwW1hiGsllIDvHjmvrvqJKT3E7A2/M4Wk
 rPcsd1UiwLXjF8R2nT8wzgimgNzJYfdx4Y2asdpEStu9C9Mz3ciE+/aNowBCtVZa
 w/f0l1xuT9BN3QKmqWT+JQehwshmYuoq1m0IDlN96TDBZGGni3zR0wiQAS5tH5LP
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=oUFim1RQR2A3/rqrJUmJgCqXfmv0uSw//05zNT2Tb
 Kk=; b=iwyAziBjDw3LUyp8TikSBnFPdqq3r28GcDhmD0QMPm24cpmeGhy/qTKdr
 v4ENL5vusM084YGBPqKc2rtADt8OyeuYxLnIjLtzU5RdX4DCMN9PcCPZ/8MytmEs
 drvCXXm1ZEW3j02jeK2P+I794eSzR7URKn+4aCU2Bu5dv3WnrwqK63QxlB4G4pwU
 bEqt68FiXvJJXRAiSk3iI0GuQvU7+3PpLRY5lep1w2s6RmS390ZnuLDh/+UCnDj4
 2X/QgTBw7MlHvFGjIMHZapbtn+Rfy4mvcPB8/QYef/LDm8EVVkH5Ffj2CPj6tBw7
 xv2JGgIIBkLhSpJQjsrEZlgsFDMeA==
X-ME-Sender: <xms:09ISXRppyC45RHp5sT7feHT1-HYLyQ9pXBNA-XcoPX49qTk_1FT3ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:09ISXbOj7PZlIBvKo-K7GuTKcI7vJOKXf27Oh5EEXZDsp6jaK4W__Q>
 <xmx:09ISXbLd4EfO6buAkNT0ztYjsQ5kLw38aaviz3_7brQTb4rhNvmbTA>
 <xmx:09ISXa0nUfnWNZMeIADpZ5vNo68OLP7XzwcBZnJNGLr0Y928lIuE4g>
 <xmx:1NISXVd5JTq0Yu1s0jM8vIvT6oGNDk1Kl-dWadl3NW-_bwXWP8NrIw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BDF7FE00A2; Tue, 25 Jun 2019 22:05:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-730-g63f2c3b-fmstable-20190622v1
Mime-Version: 1.0
Message-Id: <42f067e5-fbfe-4ae3-9943-c191cbee828b@www.fastmail.com>
In-Reply-To: <498f5c2517744d70bc82eb5b4c7fd085@lenovo.com>
References: <1561444696-446373-1-git-send-email-pengms1@lenovo.com>
 <b9abadd4-58e1-4a47-bbcf-f173a1dd2bff@www.fastmail.com>
 <498f5c2517744d70bc82eb5b4c7fd085@lenovo.com>
Date: Wed, 26 Jun 2019 11:35:07 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Peng" <pengms1@lenovo.com>, "Patrick Venture" <venture@google.com>,
 "Benjamin Fair" <benjaminfair@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "Rob Herring" <robh+dt@kernel.org>
Subject: =?UTF-8?Q?Re:_=E7=AD=94=E5=A4=8D:_[External]__Re:_[PATCH]_[PATCH_v1]_ARM?=
 =?UTF-8?Q?:_dts:_aspeed:_Adding_Lenovo_Hr855xg2_BMC?=
Content-Type: text/plain;charset=utf-8
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
Cc: Derek Lin <dlin23@lenovo.com>, Duke KH Du <dukh@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Harry Sung1 <hsung1@lenovo.com>, Yonghui YH21 Liu <liuyh21@lenovo.com>,
 Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 26 Jun 2019, at 11:31, Andrew MS1 Peng wrote:
> Hi Andrew
>=20
> We've got a couple of patches on their way upstream for 5.3 that remov=
e=20
> the need to reserve memory simply to satisfy the aspeed-lpc-ctrl drive=
r.
> If you base the patch on top of Joel's aspeed-5.3-soc tag you can=20
> remove this node and the phandle reference to it.
> 	I reserve 1MB for lpc-bridge in DT file for in-band firmware update=20=

> (phosphor-ipmi-flash).

Ah! Great. I'll keep that in mind in future reviews.

>=20
> Just want to confirm that you want the kernel to hog these lines (the=20=

> consequence is they're unavailable to userspace).
> 	Yes, I have confirmed the setting of GPIO.

Thanks. In which case:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> Regards,
> Andrew Peng
>=20
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Andrew Jeffery <andrew@aj.id.au>=20
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B46=E6=9C=8826=E6=97=A5=
 8:31
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>; Pat=
rick Venture=20
> <venture@google.com>; Benjamin Fair <benjaminfair@google.com>;=20
> linux-kernel@vger.kernel.org; linux-aspeed@lists.ozlabs.org;=20
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;=20
> mark.rutland@arm.com; Rob Herring <robh+dt@kernel.org>
> =E6=8A=84=E9=80=81: Lisa YJ19 Liu <liuyj19@lenovo.com>; Duke KH Du <du=
kh@lenovo.com>;=20
> Yonghui YH21 Liu <liuyh21@lenovo.com>; Harry Sung1 <hsung1@lenovo.com>=
;=20
> Joel Stanley <joel@jms.id.au>; openbmc@lists.ozlabs.org; Derek Lin23=20=

> <dlin23@lenovo.com>
> =E4=B8=BB=E9=A2=98: [External] Re: [PATCH] [PATCH v1] ARM: dts: aspeed=
: Adding Lenovo=20
> Hr855xg2 BMC
>=20
>=20
>=20
> On Tue, 25 Jun 2019, at 16:08, Andrew Peng wrote:
> > Initial introduction of Lenovo Hr855xg2 family equipped with Aspeed=20=

> > 2500 BMC SoC. Hr855xg2 is a x86 server development kit with a ASPEED=
=20
> > ast2500 BMC manufactured by Lenovo.
> > Specifically, This adds the Hr855xg2 platform device tree file used =
by=20
> > the Hr855xg2 BMC machines.
> >=20
> > This also adds an entry of Hr855xg2 device tree file in Makefile
> >=20
> > Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> > Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
> > Signed-off-by: Lisa Liu <liuyj19@lenovo.com>
> > Signed-off-by: Harry Sung <hsung1@lenovo.com>
> > Signed-off-by: Derek Lin <dlin23@lenovo.com>
> > ---
> >  arch/arm/boot/dts/Makefile                       |   1 +
> >  arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts | 687=20
> > +++++++++++++++++++++++
> >  2 files changed, 688 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts=

> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile=
=20
> > index dab2914f..d874777 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1269,6 +1269,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >  	aspeed-bmc-facebook-cmm.dtb \
> >  	aspeed-bmc-facebook-tiogapass.dtb \
> >  	aspeed-bmc-intel-s2600wf.dtb \
> > +	aspeed-bmc-lenovo-hr855xg2.dtb \
> >  	aspeed-bmc-opp-lanyang.dtb \
> >  	aspeed-bmc-opp-palmetto.dtb \
> >  	aspeed-bmc-opp-romulus.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> > b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> > new file mode 100644
> > index 0000000..d8dbf3a
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> > @@ -0,0 +1,687 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Device Tree file for Lenovo Hr855xg2 platform
> > + *
> > + * Copyright (C) 2019-present Lenovo
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "aspeed-g5.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +	model =3D "HR855XG2 BMC";
> > +	compatible =3D "lenovo,hr855xg2-bmc", "aspeed,ast2500";
> > +
> > +	aliases {
> > +		i2c14 =3D &i2c_riser1;
> > +		i2c15 =3D &i2c_riser2;
> > +		i2c16 =3D &i2c_riser3;
> > +		i2c17 =3D &i2c_M2;
> > +		i2c18 =3D &channel_0;
> > +		i2c19 =3D &channel_1;
> > +		i2c20 =3D &channel_2;
> > +		i2c21 =3D &channel_3;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D &uart5;
> > +		bootargs =3D "console=3Dtty0 console=3DttyS4,115200 earlyprintk";=

> > +	};
> > +
> > +	memory@80000000 {
> > +		device_type =3D "memory";
> > +		reg =3D <0x80000000 0x20000000>;
> > +	};
> > +
> > +	reserved-memory {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		ranges;
> > +
> > +		flash_memory: region@98000000 {
> > +			no-map;
> > +			reg =3D <0x98000000 0x00100000>; /* 1M */
> > +		};
>=20
> We've got a couple of patches on their way upstream for 5.3 that remov=
e=20
> the need to reserve memory simply to satisfy the aspeed-lpc-ctrl drive=
r.
>=20
> If you base the patch on top of Joel's aspeed-5.3-soc tag you can=20
> remove this node and the phandle reference to it.
>=20
> > +
> > +		gfx_memory: framebuffer {
> > +			size =3D <0x01000000>;
> > +			alignment =3D <0x01000000>;
> > +			compatible =3D "shared-dma-pool";
> > +			reusable;
> > +		};
> > +	};
> > +
> > +	leds {
> > +		compatible =3D "gpio-leds";
> > +
> > +		heartbeat {
> > +			gpios =3D <&gpio ASPEED_GPIO(C, 7) GPIO_ACTIVE_LOW>;
> > +		};
> > +
> > +		fault {
> > +			gpios =3D <&gpio ASPEED_GPIO(G, 3) GPIO_ACTIVE_LOW>;
> > +		};
> > +	};
> > +
> > +	iio-hwmon {
> > +		compatible =3D "iio-hwmon";
> > +		io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> > +		<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> > +		<&adc 8>, <&adc 9>, <&adc 10>,<&adc 11>,
> > +		<&adc 12>,<&adc 13>,<&adc 14>;
> > +	};
> > +
> > +	iio-hwmon-battery {
> > +		compatible =3D "iio-hwmon";
> > +		io-channels =3D <&adc 15>;
> > +	};
> > +
> > +};
> > +
> > +&fmc {
> > +	status =3D "okay";
> > +	flash@0 {
> > +		status =3D "okay";
> > +		m25p,fast-read;
> > +		label =3D "bmc";
> > +		spi-max-frequency =3D <50000000>;
> > +#include "openbmc-flash-layout.dtsi"
> > +	};
> > +};
> > +
> > +&lpc_ctrl {
> > +	status =3D "okay";
> > +	memory-region =3D <&flash_memory>;
>=20
> i.e. remove the above.
>=20
> > +	flash =3D <&spi1>;
> > +};
> > +
> > +&lpc_snoop {
> > +	status =3D "okay";
> > +	snoop-ports =3D <0x80>;
> > +};
> > +
> > +&uart1 {
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_txd1_default
> > +			&pinctrl_rxd1_default>;
> > +};
> > +
> > +&uart2 {
> > +	/* Rear RS-232 connector */
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_txd2_default
> > +			&pinctrl_rxd2_default
> > +			&pinctrl_nrts2_default
> > +			&pinctrl_ndtr2_default
> > +			&pinctrl_ndsr2_default
> > +			&pinctrl_ncts2_default
> > +			&pinctrl_ndcd2_default
> > +			&pinctrl_nri2_default>;
> > +};
> > +
> > +&uart3 {
> > +	status =3D "okay";
> > +};
> > +
> > +&uart5 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ibt {
> > +	status =3D "okay";
> > +};
> > +
> > +&mac0 {
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_rmii1_default>;
> > +	use-ncsi;
> > +};
> > +
> > +&mac1 {
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>; };=

> > +
> > +&adc{
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_adc0_default
> > +			&pinctrl_adc1_default
> > +			&pinctrl_adc2_default
> > +			&pinctrl_adc3_default
> > +			&pinctrl_adc4_default
> > +			&pinctrl_adc5_default
> > +			&pinctrl_adc6_default
> > +			&pinctrl_adc7_default
> > +			&pinctrl_adc8_default
> > +			&pinctrl_adc9_default
> > +			&pinctrl_adc10_default
> > +			&pinctrl_adc11_default
> > +			&pinctrl_adc12_default
> > +			&pinctrl_adc13_default
> > +			&pinctrl_adc14_default
> > +			&pinctrl_adc15_default>;
> > +};
> > +
> > +&peci0 {
> > +	status =3D "okay";
> > +
> > +	peci-client@30 {
> > +		compatible =3D "intel,peci-client";
> > +		reg =3D <0x30>;
> > +	};
> > +
> > +	peci-client@31 {
> > +		compatible =3D "intel,peci-client";
> > +		reg =3D <0x31>;
> > +	};
> > +
> > +	peci-client@32 {
> > +		compatible =3D "intel,peci-client";
> > +		reg =3D <0x32>;
> > +	};
> > +
> > +	peci-client@33 {
> > +		compatible =3D "intel,peci-client";
> > +		reg =3D <0x33>;
> > +	};
> > +};
> > +
> > +&i2c0 {
> > +	status =3D "okay";
> > +
> > +	i2c-switch@70 {
> > +		compatible =3D "nxp,pca9545";
> > +		reg =3D <0x70>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		i2c_riser1: i2c@0 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			reg =3D <0>;
> > +		};
> > +
> > +		i2c_riser2: i2c@1 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			reg =3D <1>;
> > +		};
> > +
> > +		i2c_riser3: i2c@2 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			reg =3D <2>;
> > +		};
> > +
> > +		i2c_M2: i2c@3 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			reg =3D <3>;
> > +		};
> > +	};
> > +};
> > +
> > +&i2c1 {
> > +	status =3D "okay";
> > +	bus-frequency =3D <90000>;
> > +	HotSwap@10 {
> > +		compatible =3D "adm1272";
> > +		reg =3D <0x10>;
> > +	};
> > +
> > +	VR@45 {
> > +		compatible =3D "pmbus";
> > +		reg =3D <0x45>;
> > +	};
> > +};
> > +
> > +&i2c2 {
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c3 {
> > +	status =3D "okay";
> > +	i2c-switch@70 {
> > +		compatible =3D "nxp,pca9546";
> > +		reg =3D <0x70>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		channel_0: i2c@0 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			reg =3D <0>;
> > +		};
> > +
> > +		channel_1: i2c@1 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			reg =3D <1>;
> > +		};
> > +
> > +		channel_2: i2c@2 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			reg =3D <2>;
> > +		};
> > +
> > +		channel_3: i2c@3 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			reg =3D <3>;
> > +		};
> > +	};
> > +};
> > +
> > +&i2c4 {
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c5 {
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c6 {
> > +	status =3D "okay";
> > +	/* temp1 */
> > +	tmp75@49 {
> > +		compatible =3D "national,lm75";
> > +		reg =3D <0x49>;
> > +	};
> > +
> > +	/* temp2 */
> > +	tmp75@4d {
> > +		compatible =3D "national,lm75";
> > +		reg =3D <0x4d>;
> > +	};
> > +
> > +	eeprom@54 {
> > +		compatible =3D "atmel,24c256";
> > +		reg =3D <0x54>;
> > +		pagesize =3D <16>;
> > +	};
> > +};
> > +
> > +&i2c7 {
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c8 {
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c9 {
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c10 {
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c11 {
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c13 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ehci1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&uhci {
> > +	status =3D "okay";
> > +};
> > +
> > +&gfx {
> > +	status =3D "okay";
> > +	memory-region =3D <&gfx_memory>;
> > +};
> > +
> > +&pwm_tacho {
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_pwm0_default
> > +	&pinctrl_pwm1_default
> > +	&pinctrl_pwm2_default
> > +	&pinctrl_pwm3_default
> > +	&pinctrl_pwm4_default
> > +	&pinctrl_pwm5_default
> > +	&pinctrl_pwm6_default
> > +	&pinctrl_pwm7_default>;
> > +
> > +	fan@0 {
> > +		reg =3D <0x00>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> > +	};
> > +
> > +	fan@1 {
> > +		reg =3D <0x00>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
> > +	};
> > +
> > +	fan@2 {
> > +		reg =3D <0x01>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x02>;
> > +	};
> > +
> > +	fan@3 {
> > +		reg =3D <0x01>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x03>;
> > +	};
> > +
> > +	fan@4 {
> > +		reg =3D <0x02>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x04>;
> > +	};
> > +
> > +	fan@5 {
> > +		reg =3D <0x02>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x05>;
> > +	};
> > +
> > +	fan@6 {
> > +		reg =3D <0x03>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x06>;
> > +	};
> > +
> > +	fan@7 {
> > +		reg =3D <0x03>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x07>;
> > +	};
> > +
> > +	fan@8 {
> > +		reg =3D <0x04>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x08>;
> > +	};
> > +
> > +	fan@9 {
> > +		reg =3D <0x04>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x09>;
> > +	};
> > +
> > +	fan@10 {
> > +		reg =3D <0x05>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0a>;
> > +	};
> > +
> > +	fan@11 {
> > +		reg =3D <0x05>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0b>;
> > +	};
> > +
> > +	fan@12 {
> > +		reg =3D <0x06>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0c>;
> > +	};
> > +
> > +	fan@13 {
> > +		reg =3D <0x06>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0d>;
> > +	};
> > +
> > +	fan@14 {
> > +		reg =3D <0x07>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0e>;
> > +	};
> > +
> > +	fan@15 {
> > +		reg =3D <0x07>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0f>;
> > +	};
> > +
> > +	fan@16 {
> > +		reg =3D <0x07>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0f>;
> > +	};
> > +};
> > +
> > +&gpio {
> > +
> > +	pin_gpio_a1 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
> > +		output-high;
> > +		line-name =3D "BMC_EMMC_RST_N";
> > +	};
> > +
> > +	pin_gpio_a3 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
> > +		output-high;
> > +		line-name =3D "PCH_PWROK_BMC_FPGA";
> > +	};
> > +
> > +	pin_gpio_b5 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "IRQ_BMC_PCH_SMI_LPC_N";
> > +	};
> > +
> > +	pin_gpio_b7 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(B, 7) GPIO_ACTIVE_LOW>;
> > +		output-low;
> > +		line-name =3D "CPU_SM_WP";
> > +	};
> > +
> > +	pin_gpio_e0 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> > +		input;
> > +		line-name =3D "PDB_PSU_SEL";
> > +	};
> > +
> > +	pin_gpio_e2 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(E, 2) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "LOCATOR_LED_N";
> > +	};
> > +
> > +	pin_gpio_e5 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(E, 5) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "FM_BMC_DBP_PRESENT_R1_N";
> > +	};
> > +
> > +	pin_gpio_e6 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(E, 6) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "BMC_ME_SECURITY_OVERRIDE_N";
> > +	};
> > +
> > +	pin_gpio_f0 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(F, 0) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "IRQ_BMC_PCH_NMI_R";
> > +	};
> > +
> > +	pin_gpio_f1 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
> > +		input;
> > +		line-name =3D "CPU2_PROCDIS_BMC_N";
> > +	};
> > +
> > +	pin_gpio_f2 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(F, 2) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "RM_THROTTLE_EN_N";
> > +	};
> > +
> > +	pin_gpio_f3 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		line-name =3D "FM_PMBUS_ALERT_B_EN";
> > +	};
> > +
> > +	pin_gpio_f4 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "BMC_FORCE_NM_THROTTLE_N";
> > +	};
> > +
> > +	pin_gpio_f6 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(F, 6) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "FM_BMC_CPU_PWR_DEBUG_N";
> > +	};
> > +
> > +	pin_gpio_g7 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "BMC_PCIE_I2C_MUX_RST_N";
> > +	};
> > +
> > +	pin_gpio_h6 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "FM_BMC_DBP_PRESENT_R2_N";
> > +	};
> > +
> > +	pin_gpio_i3 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "SPI_BMC_BIOS_WP_N";
> > +	};
> > +
> > +	pin_gpio_j1 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "BMC_USB_SEL";
> > +	};
> > +
> > +	pin_gpio_j2 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "PDB_SMB_RST_N";
> > +	};
> > +
> > +	pin_gpio_j3 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(J, 3) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "SPI_BMC_BIOS_HOLD_N";
> > +	};
> > +
> > +	pin_gpio_l0 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(L, 0) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "PDB_FAN_TACH_SEL";
> > +	};
> > +
> > +	pin_gpio_l1 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(L, 1) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "SYS_RESET_BMC_FPGA_N";
> > +	};
> > +
> > +	pin_gpio_l4 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "FM_EFUSE_FAN_G1_EN";
> > +	};
> > +
> > +	pin_gpio_l5 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(L, 5) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "FM_EFUSE_FAN_G2_EN";
> > +	};
> > +
> > +	pin_gpio_r6 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
> > +		input;
> > +		line-name =3D "CPU3_PROCDIS_BMC_N";
> > +	};
> > +
> > +	pin_gpio_r7 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
> > +		input;
> > +		line-name =3D "CPU4_PROCDIS_BMC_N";
> > +	};
> > +
> > +	pin_gpio_s1 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(S, 1) GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		line-name =3D "DBP_SYSPWROK_BMC";
> > +	};
> > +
> > +	pin_gpio_s2 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "PCH_RST_RSMRST_N";
> > +	};
> > +
> > +	pin_gpio_s6 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(S, 6) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "BMC_HW_STRAP_5";
> > +	};
> > +
> > +	pin_gpio_z3 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "FM_BMC_PCH_SCI_LPC_N";
> > +	};
> > +
> > +	pin_gpio_aa0 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		line-name =3D "FW_PSU_ALERT_EN_N";
> > +	};
> > +
> > +	pin_gpio_aa4 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(AA, 4) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "DBP_CPU_PREQ_N";
> > +	};
> > +
> > +	pin_gpio_ab3 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(AB, 3) GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		line-name =3D "BMC_WDTRST";
> > +	};
> > +
> > +	pin_gpio_ac6 {
> > +		gpio-hog;
> > +		gpios =3D <ASPEED_GPIO(AC, 6) GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name =3D "ESPI_BMC_ALERT_N";
> > +	};
>=20
> Just want to confirm that you want the kernel to hog these lines (the=20=

> consequence is they're unavailable to userspace).
>=20
> Cheers,
>=20
> Andrew
>=20
> > +
> > +};
> > --
> > 2.7.4
> >=20
> >
>
