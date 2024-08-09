Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9946094E3D9
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2024 01:30:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=g28UZlwv;
	dkim=fail reason="key not found in DNS" header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=AA13aPQo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Whv5z266Gz2xbd
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2024 09:30:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=g28UZlwv;
	dkim=fail reason="key not found in DNS" header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=AA13aPQo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Fri, 09 Aug 2024 17:52:24 AEST
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgGN83qn1z2yRC;
	Fri,  9 Aug 2024 17:52:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723189945; x=1754725945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qEKb2tBDFYtPQQYes4QRP4tJM5p3ULThCqzPcDFNfNc=;
  b=g28UZlwvIuxa2nUv1mXHCWrZtV1ZX3QAf63CMZ3wRf2CAZnuNfnH1sQp
   4Dw6QNkBrGpnINzAbEL69HQHO+s4gxdm0og5JInlC2ZI4ZQ1F5JBQb2fs
   GqfI7/RK5u9jY00t484Y4zSeHFM8P8Rtpk8FaKaWy3Yn6OZE/rNq6aTkm
   MPclTsaog3TDylh3RaNldUsItAL8y4u5KeAsOcBo/16e1TK+fFOynoed7
   n2K98KQxaaUspiIw2wKiddnd+VbJjw4AE9nxzs/Vdpav9upp3PwkFvmSZ
   6Ekhrl4WmsDGtznqKwK0hseaIFsU4dyl0EMEtnMbNqH5A82EsfaAAW0bm
   g==;
X-CSE-ConnectionGUID: JwcAz+0XR/aH896pBitJDw==
X-CSE-MsgGUID: kVdMZKR1RUmNWIVSMJj3Ag==
X-IronPort-AV: E=Sophos;i="6.09,275,1716242400"; 
   d="scan'208";a="38329660"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Aug 2024 09:51:11 +0200
X-CheckPoint: {66B5CA6F-0-F0206917-F54EFEED}
X-MAIL-CPID: 27227B5B5898C08BF0A2BD19511608BD_4
X-Control-Analysis: str=0001.0A782F1A.66B5CA6F.0103,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6E8C163A4B;
	Fri,  9 Aug 2024 09:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723189866;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qEKb2tBDFYtPQQYes4QRP4tJM5p3ULThCqzPcDFNfNc=;
	b=AA13aPQoadQSDdUv+s7cijsOmK61bm3M1gbgjqsMZ1SJ/kkwz2qelWR3Ov56morwxcIApY
	F3Q3T8cakL6YGCgH2h3benXKQ95OuY7vyPe//NM/2IDJK+B/4BJDZdjaHC1j8V/o33C6Yx
	e5LNf5Ol3x7oh+oGRPf0zO+jVnUSo8XooBtvWpaWHjz8qkWHq2s6UQJLrtFgF9Zo8bVY48
	NPiXjXUklM5xqEhpQQ8xesdLf0RsYPK8wpNZPuG83hODi6SF6ayNMdSjoopRyCd93YJOU9
	NFUoodsMHZbTFHBp5XMbTQJ7hHGOJqshzycYN8qA3+fPZYeXqYriYg2foLyPng==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Dinh Nguyen <dinguyen@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Mark Jackson <mpfj@newflow.co.uk>, Tony Lindgren <tony@atomide.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: Fix undocumented LM75 compatible nodes
Date: Fri, 09 Aug 2024 09:51:03 +0200
Message-ID: <22384730.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240808164941.1407327-1-robh@kernel.org>
References: <20240808164941.1407327-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 12 Aug 2024 09:30:17 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, "Rob Herring \(Arm\)" <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Am Donnerstag, 8. August 2024, 18:49:38 CEST schrieb Rob Herring (Arm):
> "lm75" without any vendor is undocumented. It works with the Linux
> kernel since the I2C subsystem will do matches of the compatible string
> without a vendor prefix to the i2c_device_id and/or driver name.
>=20
> Mostly replace "lm75" with "national,lm75" as that's the original part
> vendor and the compatible which matches what "lm75" matched with. In a
> couple of cases the node name or compatible gives a clue to the actual
> part and vendor and a more specific compatible can be used. In these
> cases, it does change the variant the kernel picks.
>=20
> "nct75" is an OnSemi part which is compatible with TI TMP75C based on
> a comparison of the OnSemi NCT75 datasheet and configuration the Linux
> driver uses. Adding an OnSemi compatible would be an ABI change.
>=20
> "nxp,lm75" is most likely an NXP part. NXP makes a LM75A and LM75B.
> Both are 11-bit resolution and 100ms sample time, so "national,lm75b" is
> the closest match.
>=20
> While we're here, fix the node names to use the generic name
> "temperature-sensor".
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, Please take this directly.
> ---
>  .../aspeed/aspeed-bmc-facebook-greatlakes.dts |  2 +-
>  .../socfpga/socfpga_cyclone5_vining_fpga.dts  |  4 +--
>  .../dts/marvell/armada-385-clearfog-gtr.dtsi  |  8 ++---
>  .../boot/dts/nuvoton/nuvoton-npcm730-kudo.dts | 32 +++++++++----------
>  .../boot/dts/nuvoton/nuvoton-npcm750-evb.dts  |  6 ++--
>  arch/arm/boot/dts/nxp/imx/imx53-mba53.dts     |  4 +--
>  arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi   |  4 +--
>  .../dts/nxp/lpc/lpc4357-ea4357-devkit.dts     |  4 +--
>  .../boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  2 +-
>  arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-
>  .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  4 +--
>  11 files changed, 36 insertions(+), 36 deletions(-)
>=20
< [snip]
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/dt=
s/nxp/imx/imx53-mba53.dts
> index 2117de872703..d155b3ec22ef 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> @@ -175,8 +175,8 @@ expander: pca9554@20 {
>  		gpio-controller;
>  	};
> =20
> -	sensor2: lm75@49 {
> -		compatible =3D "lm75";
> +	sensor2: temperature-sensor@49 {
> +		compatible =3D "national,lm75";

I checked the old schematics. This is an NXP LM75A, so 'national,lm75a'
would be the correct compatible.

>  		reg =3D <0x49>;
>  	};
>  };
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi b/arch/arm/boot/=
dts/nxp/imx/imx53-tqma53.dtsi
> index b2d7271d1d24..d01c3aee0272 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
> @@ -254,8 +254,8 @@ pmic: mc34708@8 {
>  		interrupts =3D <6 4>; /* PATA_DATA6, active high */
>  	};
> =20
> -	sensor1: lm75@48 {
> -		compatible =3D "lm75";
> +	sensor1: temperature-sensor@48 {
> +		compatible =3D "national,lm75";

I checked the old schematics. This is an NXP LM75A, so 'national,lm75a'
would be the correct compatible.

Best regards,
Alexander

>  		reg =3D <0x48>;
>  	};
> =20
> [snip]


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


