Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 675D1930DCE
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 08:05:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Rr3e4LUA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMsBM28B3z3dD2
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 16:05:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Rr3e4LUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMs9p1fgTz30Sv
	for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2024 16:05:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721023499;
	bh=UMIaaYyzGC7AALePU2IwZ4gxreZoadBWwOb7icOpseo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Rr3e4LUAQK2mLYzfQraW2hIUVU5BX35RxgPK5WwwG/woaAkupvPX/11vrzeZiiYI/
	 gOOt3DJFz4OVWIwSRUuols6wp6D6Dk5Mklu2ICJj/xBzCPZMsxb5Qnlkl6WNQFz1as
	 LftX9RXPEjOYbzkkVlirpsULHxeqVVHA+OA/Zo9bmBizEuutyg9P45AS/7fL7Kjq09
	 LAuyr5BUF4A9MM6c0vSheQCPiqBBmGrcNriJgv3XRzyUl8/kSyyelV5dsbAETk/Ilv
	 qZ/51KXXiO8xjaU4Odw+rn+m9JZ+/FZHIgCrL01LGKrx+Fjt6FE9i+53oU+cvkrXhE
	 5rH10HZ495SNA==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0D6D064DDF;
	Mon, 15 Jul 2024 14:04:59 +0800 (AWST)
Message-ID: <1c0d0b77405bbc5a2ddb5893405cc816a30a18cb.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 1/3] arm64: dts: nuvoton: npcm8xx: add
 reference 25m clock property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Mon, 15 Jul 2024 14:04:58 +0800
In-Reply-To: <20240714152617.3055768-1-tmaimon77@gmail.com>
References: <20240714152617.3055768-1-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

In the future, can you please send your series with a cover letter with
the patches threaded under it?

If you're not already using it, b4 is a helpful tool for sending
patches:

https://b4.docs.kernel.org/en/latest/

I ask because it's not clear to me what the relationship of this series
is with respect to what's going on upstream. A cover letter is a great
place to explain whether the patches are:

1. A backport of those under review upstream
2. A backport of patches already merged upstream
3. Specific to the openbmc/linux tree and have no upstream equivalent

In the case of 1 and 2 (which are the ideal cases), I really prefer you
include a link to the upstream equivalents. The link makes it easier
for me to gauge how mature the patches are.

Regarding the patch content (rather than process), while the patches
all touch the NPCM8XX devicetree, they don't seem to have a coherent
feel otherwise :(

On Sun, 2024-07-14 at 18:26 +0300, Tomer Maimon wrote:
> The NPCM8XX clock driver uses a 25Mhz external clock, therefore adding
> clock property.
>=20
> The new required clock property does not break the NPCM8XX clock ABI
> since the NPCM8XX clock driver hasn't merged yet to the Linux vanilla.

This is a statement with respect to upstream, but it seems we've
already applied some of the patches here, and so there's possibly a
concern?

>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++----
>  arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     | 7 +++++++
>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/ar=
ch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> index 91c1b5c4d635..9bd22f7d43f4 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> @@ -58,6 +58,7 @@ clk: clock-controller@f0801000 {
>  			compatible =3D "nuvoton,npcm845-clk";
>  			#clock-cells =3D <1>;
>  			reg =3D <0x0 0xf0801000 0x0 0x1000>;
> +			clocks =3D <&refclk>;
>  		};
> =20
>  		apb {
> @@ -81,7 +82,7 @@ timer0: timer@8000 {
>  				compatible =3D "nuvoton,npcm845-timer";
>  				interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>  				reg =3D <0x8000 0x1C>;
> -				clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> +				clocks =3D <&refclk>;
>  				clock-names =3D "refclk";
>  			};
> =20
> @@ -153,7 +154,7 @@ watchdog0: watchdog@801c {
>  				interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
>  				reg =3D <0x801c 0x4>;
>  				status =3D "disabled";
> -				clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> +				clocks =3D <&refclk>;
>  				syscon =3D <&gcr>;
>  			};
> =20
> @@ -162,7 +163,7 @@ watchdog1: watchdog@901c {
>  				interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
>  				reg =3D <0x901c 0x4>;
>  				status =3D "disabled";
> -				clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> +				clocks =3D <&refclk>;
>  				syscon =3D <&gcr>;
>  			};
> =20
> @@ -171,7 +172,7 @@ watchdog2: watchdog@a01c {
>  				interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>  				reg =3D <0xa01c 0x4>;
>  				status =3D "disabled";
> -				clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> +				clocks =3D <&refclk>;
>  				syscon =3D <&gcr>;
>  			};
>  		};
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/a=
rm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> index a5ab2bc0f835..83c2f4e138e5 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> @@ -19,6 +19,13 @@ chosen {
>  	memory {
>  		reg =3D <0x0 0x0 0x0 0x40000000>;
>  	};
> +
> +	refclk: refclk-25mhz {

The node name should probably just be 'clock' according to the generic
node names recommendation?

> +		compatible =3D "fixed-clock";
> +		clock-output-names =3D "ref";
> +		clock-frequency =3D <25000000>;
> +		#clock-cells =3D <0>;
> +	};

Defining this in the .dts but referencing the label inside the .dtsi
feels a bit off to me (as the .dtsi is no-longer self-contained). How
about we define the node in the .dtsi but override it in the .dts?

Andrew
