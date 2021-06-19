Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6430B3AD95D
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 12:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6Wtx1NNcz306J
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 20:17:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=JUfgaKxx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=JUfgaKxx; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6Wth1mNlz2yWy
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jun 2021 20:17:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624097824;
 bh=pUWqg54W1aADz7YDfDz1OgtQ7oXBYT2s7PJeI3X1NW4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=JUfgaKxxGBrGh3bibpkb4jw9Ul3cu88f/87nLiHJS/q7DWEW+VpaKdAqR++NI45lT
 C2VO+U6lYJ05BhQtV+5YXtf73oDB9VopMyWzKppztQo19JftxzjpYpGVguajqR/UCA
 AttW9xLRW7Jp1HdllAY2sXV2NrC+b5Llyf3qLSgs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mv2xU-1l3XuK0AEq-00qyG7; Sat, 19
 Jun 2021 12:17:04 +0200
Date: Sat, 19 Jun 2021 12:17:03 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
Message-ID: <YM3EH6Cu2GsLjd3O@latitude>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-5-j.neuschaefer@gmx.net>
 <20210615234558.GA1684841@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Gfvb67XozB+au/Ks"
Content-Disposition: inline
In-Reply-To: <20210615234558.GA1684841@robh.at.kernel.org>
X-Provags-ID: V03:K1:ySRazohGAFjgQt775MkM8h6zUwRgArurfbV/FAqh42AIuk3U7yW
 Fb0ralSgR/vtJr2LlzMViqSG1CVldpEBTBY5/Hhr+FLFydjBZ35nFLyFp+mAJjFeTEu+0qd
 vEK9EiqAzA4/dvJ89IjiUbyAc1fQ0RbbXP6Jkv6neBGGiHlSlk1u1DxuuSGZTJIfvbP6q7k
 TLYslpMhHMGkyftuFjEjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R+G/zDXiB5Y=:mzD+Gg1RkHyUMfjgSFULEN
 Lhcsp/UOYvEBlDu+62yqP4w+2VgOoz+vxp34vqKIbNfhrp88s6PtTL7iG+EeLGYv0Q5N2Ts9N
 4NOg2lb7vnA4+nfxQvU2fIn/GkDQ5v/F0d8PENZkAdcR0CwrEzMqNuFCL5llLRsNCiZgcwwu8
 ve+rmpy9fC/n3QT8hdl/rV4M+OiEBXHdxx/DbFxCVzUFvb8wayw3xGsSEbdQQlL0rf4Az3J4a
 8iDDAaDiK8TH8yNC6h9r2chJu56Vty29g0NFYIZUIx1mgRn/F7NdPPdFGgUGR1zMTpiKPs4lP
 O4fjqKbPX5MWw885tDEV2HhsqvjpSZK20/BUx86/qFJ70nexOABvn70s6CXngpASr0hMfhY8G
 wWNusDA3oGslqWvu4/sBFcpwzdcpZ22oKyTyIAbjDjcBEl6xG2ThRuNzKmjTaesOY7XqoI7iW
 9V/AyVmS2QXJ3iVZDK62XOeuzSEXe3jmpABpnK4xZcUmOatDAiipiTUdfs3lPDPf5gctvwMSb
 RXklePKMy4H0kW7uX1Z8BV+fmgfm9UW+Y+QxKRDOoruVLaPsnKnohxKTRZUShecS+sxy6U+jH
 6OW8DF8i7p6ON9EcR3KIp1GrYeQLYiLlzyuhGmbHRJirBoVMU64vT4DBmdW2NKkJ8dFzSX/0V
 hZ8lhfwZaakvHB8NCabO2Ovzt8ffWLNj995r7yqbI1nCnvv2YTLU/CdM9SwsJ5IAmbtNHw4uH
 uiU4MoiDH700XKqNDwMstmhQb1eNFm8qZ+OfTCLmpLRMR3CuKPL8zBqvb+P8u2PlfcUewZbI9
 otua6hLfA5nhlKdKATBmaxmo79GCqjjYCgQYttDDfEzLSyAOPPYTikEawc7+lTTH3VOmko06h
 KMsoUm9tsyb5/jRO9gVxirgZ671lfzXnThUuOX9esFevbGKI2PKOZASwRwxO/2i4dOaCdX4XA
 1J+A5Y1/Z8HG6OzAMtA7bEq2sGL2QnTyPBajykRINY5Pgd7SC81qJgXgYQdQ4gWJR8AcxSR9N
 D2HMGhSksUE0ti7fRsFgyeGzkd4X8R/6NryvGpwj0kM0libxAxOW9iceuXmIyPixNgiu1ps/p
 iEcQ/jdEcJEUUL9htl/Ir0s7DWkezcdkw+Ubcy84ifNf7AltMObULh0zA==
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 openbmc@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Gfvb67XozB+au/Ks
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 05:45:58PM -0600, Rob Herring wrote:
> On Wed, Jun 02, 2021 at 02:03:25PM +0200, Jonathan Neusch=C3=A4fer wrote:
> > This binding is heavily based on the one for NPCM7xx, because the
> > hardware is similar. One notable difference is that there are no
> > sub-nodes for GPIO banks, because the GPIO registers are arranged
> > differently.
> >=20
> > Certain pins support blink patterns in hardware. This is currently not
> > modelled in the DT binding.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
[...]
> > +properties:
> > +  compatible:
> > +    const: "nuvoton,wpcm450-pinctrl"
>=20
> Don't need quotes.

Ok, I'll remove them.

>=20
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 2

and I just noticed the inconsistency in quotes here. I'll fix it.

> > +
> > +  interrupts: true
> > +
> > +patternProperties:
> > +  # There are two kinds of subnodes:
> > +  # 1. a pinmux node configures pin muxing for a group of pins (e.g. r=
mii2)
> > +  # 2. a pinctrl node configures properties of a single pin
> > +  "^.*$":
> > +    if:
> > +      type: object
> > +    then:
>=20
> Don't do this hack for new bindings. Pick a node name pattern you can=20
> match on.

Ok.

>=20
> > +      allOf:
> > +        - $ref: pincfg-node.yaml#
> > +        - $ref: pinmux-node.yaml#
> > +      properties:
[...]
> > +        phandle: true
>=20
> Needing this should be fixed now.

Ok, I'll drop it.



Thanks,
Jonathan Neusch=C3=A4fer

--Gfvb67XozB+au/Ks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDNxB4ACgkQCDBEmo7z
X9tBKw/9E2aL/JEYtxWOl9pHdUKEQ1dWghDn5bM+5blODa9NL2r2wE7ZqdSyMxwc
g20MY053o4XwFt0S/ctzDonBtbhktpJLUaJAM6eXplC1atSdR0IGGGA7bNnCrQ0t
G9vXW8attJAK1+1eINYK3HLLehSw5zRtkY7iO7XacCf+mAEplRtvh5GPyPj7VNt3
vSdwEzdaM/uW/7wtkAbzUqtBG1zCSqCTtXn5Bd96yCVwBWPlyDEsecRTCqiDo3HG
qCcME+UuzM4T70fy1heABFX2HeRehVvJ5f1pyZWsBAQB/XIA4SL8IFr4T3DXJwxn
9mwdU6+NAGisGBqBowy9OZZ8KFUUXB7xNtr01SVLB/+LUYSG9XD1uM+Xq9c6LMsY
0xS1Pqyv7BRA7LQzZkztclciHdtKbTCa0XLZ22xMd2V9xh/y1IeVFuraP4zExy24
7LCX0XTK7Qy2lnpZMablJ9aAqK2syoC94/xSGXtvuROP57itM/FxdQ/wfYFKtbxQ
eUcm/ifS2Bhg83U63SAKjLzBt+igIAMAlH8GmQL+eGfBapXJeUEeW6YBXoB+vb4u
c0WPFbdKY6b/zuG60ZdnELqPEk92A1oBBPznlrUhtdALkBxLUaQSvd9pdNYCgsjm
if4OeP/aKBz0tfhZOb+QFKMjhlAuewPosV8UQYGqH0uSxxoAe2M=
=eRq1
-----END PGP SIGNATURE-----

--Gfvb67XozB+au/Ks--
