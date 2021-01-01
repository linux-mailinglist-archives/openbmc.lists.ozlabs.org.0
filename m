Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 418312E83CC
	for <lists+openbmc@lfdr.de>; Fri,  1 Jan 2021 14:16:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6lrw2r5VzDqQX
	for <lists+openbmc@lfdr.de>; Sat,  2 Jan 2021 00:16:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=XJhQKhz+; 
 dkim-atps=neutral
X-Greylist: delayed 322 seconds by postgrey-1.36 at bilbo;
 Sat, 02 Jan 2021 00:14:53 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6lqd0MnwzDqHH
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jan 2021 00:14:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1609506888;
 bh=/A3UN9CKV54GgTD4e74sAhDA5fvuSZZTc4HOFwpvPiQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XJhQKhz+NsDabWSKFjvqsuz8uLKVp9KxnmlcL9/+P4CnYAbEaMwKFs6P9fE6VN0Eu
 ZFmc8qHmkQvGFQIQw1+qncpbr5NfKDOJA5vgq721r4E4hJ7yxuwVFQDpiBqsEwJfyT
 sqqYOnjB/1rliPjddbzd4/UAbOqMo5107V0ndpG8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbRk3-1kJmV82BQX-00bp7I; Fri, 01
 Jan 2021 14:09:15 +0100
Date: Fri, 1 Jan 2021 14:09:14 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH linux dev-5.8 v1 05/11] dt-binding: watchdog: Add DT
 restart priority and reset type
Message-ID: <X+8e+jS+eeUDFS5/@latitude>
References: <20210101122328.43510-1-tmaimon77@gmail.com>
 <20210101122328.43510-6-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Qru6yc8VtLosmXdP"
Content-Disposition: inline
In-Reply-To: <20210101122328.43510-6-tmaimon77@gmail.com>
X-Provags-ID: V03:K1:vwoBAs0wPYp1IwxV8dAhhubn4E/Et1/njyFzOFJblSkcnXYeESy
 UNg+7+dqOgROjT17Wpi1btOVEl7buJOOuYwZwwCqvHPp17NRI+hkARTbDihMhsDHuyVuBH/
 Qk13zSmWZJu6fsIZR4AO3FWI7yHzl5qvJIzBMxiQRSIu+laglab/ol9SheXSeHC2d3+31fq
 Aanr5QiXaC9KT3z4zjgMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u6vgGn5j4X4=:XBJE1mUHkhcdEAgs7K02ds
 34U5Z/ibX1dOYc0IzEvowYI1KHyTLQOo1tI12qbNiSSsiTvPeQeaait9IGsZ6zNUr8xDu8a1d
 IAN+641Iuy5D6MIL3+5QaApt0WKfPLgdjK0Qwy+OquhW9hpoxTYYx9TZpt2z3fhCdqPswbAwC
 RSNLUBhMLyhhbU1LsYpzNEp9PiLSBLkTHNWvv2bpvA81TC/tEAQPNXHbsYWMXsSMZJbEIpX7t
 LVCrWsVx7+le3ypaAPLf2zlvMjmNwk3Gc3up0eZSZtUjUbTMWe9QaABvIl88dw7mNFi81bpMx
 zVPuF7tbLevONqYU5ik/MDztjiUs2EtS3EYwt06jwpkM/L/i+R4qrSBLOXNsmXmbG6Upt1csH
 SMM3B4JVledAM0O46E0qRMh9o4XHVuoKiixt76cQnlgywEc46p0NcD1q/928Uea+GFZDj/6me
 Gc5Jjj5owmwrT8cPZBTva9yX0vQQDXyDkAIrY8q1XLBpLlU5+hFW2FwunDq98+i0RjdpglYC0
 vT6RboDE4QySFvdhoBe605Y5rLOmDYduougvMl+a+tVGzyR25jmrKusXDNQEl6/yMWsQVKH2d
 tl3d/vFa3EHEyJ/0TkCZmbgzcsR6krhupiQxzjRK/0ySUBsBRjAxis3aQRaxaK1npQcBiYUA9
 M5TNELF7lgR5vIfJDTRLWBkSRWYwJN3XNgVji4mX7+3AsjSoqDsKiUBGnFPhhKKwmuNYIY+Dc
 IVn18/ftvyBPWfBnWNWIh5uaTX13tfuPWuj3pGANKwYtphGOxB0mmlXP+fFPfYi2NWG1joRiS
 VuxH+IK+PueyLc/YL8W6tgcCsa/4Jqqk4jImRHwqwEv/9FHPf6XPFJ6FaS2gwnaGNcr6GlIxF
 vk4bt/MDQj6o9TjDxj9g==
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Qru6yc8VtLosmXdP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jan 01, 2021 at 02:23:22PM +0200, Tomer Maimon wrote:
> Add device tree resrart priority documentation and
                  resrart -> restart?

> three reset types documentation.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.=
txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> index 6d593003c933..67ebf3386804 100644
> --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> @@ -17,7 +17,35 @@ Required clocking property, have to be one of:
> =20
>  Optional properties:
>  - timeout-sec : Contains the watchdog timeout in seconds
> +- nuvoton,restart-priority - Contains the card restart priority.
> +- nuvoton,card-reset-type =3D "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
> +  Contains the card reset type for checking and indicating=20
> +  the last card reset status (WDIOF_CARDRESET)

What does "card" mean in this context?

> + =20
> +  If 'nuvoton,card-reset-type' is not specified the default is porst
> =20
> +  Reset types:
> +       - porst: Power reset
> +       - corst: Core reset
> +	   - wdX : Watchdog reset X (X represante 0-2)
> +	   - swX : Software reset X (X represante 1-4)

The indentation is inconsistent, here. The first two list items are
indented with spaces, the second two with tabs.

"represante" looks misspelled. Did you mean "represents"?

> +
> +- nuvoton,ext1-reset-type =3D "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
> +  Contains the external 2 reset type for checking and indicating=20
> +  the last external 2 reset status (WDIOF_EXTERN1)
              external 2 -> external 1

> + =20
> +  If 'nuvoton,card-reset-type' is not specified the default is wd0.
                 card  ->  ext1


> + =20
> +  Reset types are the same as in nuvoton,card-reset-type property.
> +
> +- nuvoton,ext2-reset-type =3D "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
> +  Contains the external 2 reset type for checking and indicating=20
> +  the last external 2 reset status (WDIOF_EXTERN2)
> +
> +  If 'nuvoton,card-reset-type' is not specified the default is sw1.
                 card  ->  ext2

> + =20
> +  Reset types are the same as in nuvoton,card-reset-type property.
> +	  =20
>  Example:
> =20
>  timer@f000801c {
> @@ -25,4 +53,8 @@ timer@f000801c {
>      interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
>      reg =3D <0xf000801c 0x4>;
>      clocks =3D <&clk NPCM7XX_CLK_TIMER>;
> +	nuvoton,restart-priority =3D <155>;
> +	nuvoton,card-reset-type =3D "porst";
> +	nuvoton,ext1-reset-type =3D "wd1";
> +	nuvoton,ext2-reset-type =3D "sw2";

Inconsistent indentation



Best regards,
Jonathan Neusch=C3=A4fer

--Qru6yc8VtLosmXdP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/vHvMACgkQCDBEmo7z
X9tjXw//YruL9hII9ga29EToUTtwKTGfUqb8zH3oA+DKpxyYMq0Mmhxg1sx9vbFI
J31ZCPDl/wVpqVlHq4b/3nuJSOe4egGA5QwxTBmuLyCW2yRHuOA/OeZvuJKrpemW
nMn3yZfK46vHpU2CemJh3pFzKcdAVdld8jKoaD1rXKtCJeWkFmBB2u2ucAy72zlM
6CDhCNUyE/yK6SQhnnmYBta5lvnyrACCFD8LGkLIyFBlnjdE0b11HuPW0uNvbLA1
WVVP2CxrnxM3C+WxLaIKaAjSr4v12iutHbquXRLJzzkHpONZlOAQ+7qKJ36g+QpJ
jEh1upmQ61+2+CFvIB+z9UuWAdkZUlXi6ypIJIIpmHefbR5vlFlU7TYXWDlc/Uzs
a+zqqE7Xlcv036Ye9KnyMUZj4LpX7pzmXeWlMfWBIrMie3vo1Lf0WHxv18MnBgvU
oZqzKyXnL/9GO5xMKic8Y+6BiLefijMOnIFvUfJEmheKjNrnJY+Qn7YDaZugj4ve
vt7Ehd6hmo3oCcCceUXx3ptQ8NcXpqyxmcwNEnHdAYcKoum7dZpQmMwSdvvivo1e
hfquTV6F+kC8vqU6CSwq8XrtvAUsZLwAmP9kHvH07VgySBsF4HwpQPk6XSY8WwZQ
ofk+9DD20/xc3cpK7yKcZ28wJQFQ1knNlISYjWtHaIU/qBcqYOM=
=+OnA
-----END PGP SIGNATURE-----

--Qru6yc8VtLosmXdP--
