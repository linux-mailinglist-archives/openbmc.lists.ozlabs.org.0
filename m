Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B83471EB5
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 00:21:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0yM5xt2z3f2r
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 10:21:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=FMVowCVO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=FMVowCVO; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JC0mC4RD8z3h3F
 for <openbmc@lists.ozlabs.org>; Mon, 13 Dec 2021 10:12:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639350751;
 bh=IoQi5EMV/XH/LpqMr+ICgxVN4Bq0JmYZIA4yRCf+EI8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=FMVowCVOvdeE/C79RvbcOZTU4BcOnnrVPPyanA1TfQow8SmZgTOnoQ3XAzF4NQYQ8
 vv+gqCw3h9BhdovWNeKnD1y4A3M34Pdn/Q5nRBZ6ffdzWTXNoUA22RKpuQvDo52PDi
 Vzh2h19125jrhlS4aOPY2RcmFlXP3VcBlcXbzSyk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1mnmak3B0C-008t7c; Mon, 13
 Dec 2021 00:12:30 +0100
Date: Mon, 13 Dec 2021 00:12:29 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm/npcm: Add binding for global
 control registers (GCR)
Message-ID: <YbaB3a3pFo9pA2I0@latitude>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-2-j.neuschaefer@gmx.net>
 <YbNqKfwYes0rH07B@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8Nw9gXbH6ji+XyMM"
Content-Disposition: inline
In-Reply-To: <YbNqKfwYes0rH07B@robh.at.kernel.org>
X-Provags-ID: V03:K1:mKk8Aj49glbM/0M2m2dk9cYhezX/sIrY9ojc/IGUkfvsS6FwQ32
 THkfd5/wiOkW2DOSO/UaK2Z/vJgijwMB228OOxdqaRUYdeNRul3LcUZnRyL/Nudbl9fiJqD
 r3Z9wO7XnK0kkWFDrnznS/DsEA876ChdXq1IluGMqZNpfTwawBgpya9VqGLTRJn95tEabEt
 wkbhv06qX/bnCxN8DcPag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YY93j3RXj2M=:yFNRmAusrQsqdZwAwRz4vf
 bpE01BLsoEP8BykGLkpTjjhb6R+ZBk98G3CDkUyyfSzRKafc0hG/LDaHAJiAXGYwGbXoUDXl3
 Eod2/hDh87ucctPRQ7MHekLpRzIynTR5m06adGA3rNvTk1iTtJgUqV9itvz9rusQ1iap6FaYK
 uTqapUQD490QEErncmnWHZSyMBeRSKIy3aRBPBjfc6SGtC768ILZYjltzGi/kuqqvFjtzfWJH
 LoF0Lyh14EDNF1mHnovF4VyLRMhTDWJ0ngryrafQUka5wbuyMuwlcy5J6DYsE5P9QpOL/7CRh
 /tgSEq4qNd39+dqnOGzCCfF6Dz7cuEqfUHHL5knbZbWQWdVQ6dedsLrP5tfZYqZKlBT2OBVkz
 mA/IapCj8bbnTMmU+vsx59GJu+T9XZgLl8hFQbfLaFzaldPFAz9SiaJi4pMcYnRXqXjHlBlr0
 3th+RYvG4EP8LX/i4IXXcGQv21DIxINsQUa8/7zcHYwJwaIMSmgBdA4+D5kxQgPpIw++1NHnL
 f2S7U743/dvEGJW5vxMTRpZYgViCAGIxTSUUnk2EaD/M587NcfunYKJmvkJYUXjMgZXsHPI2X
 8cvkV6un4fa0ifejZlkH84b7KbAjPUAKvw3c8jXYsMqjS4SrBD4fqMPDdUKeJUcCc3cF7zZjP
 rkAHX/a/Veaulj2X5pAp2/1Cr+mxKqdUdZBlCVcFenaWrHpxXy4w+nNCV7I9PMjrF8tLXo170
 DUlU3+xVW7iXRPoBOFohxpZQmP7TIKAQ5gRAQ/UK7vy1niikNpvHDtGjW7po+9X7s6hsFu5oN
 pRVxlUyC1eUxH1EKUZGeXsi7UpFXWRU/f2a5ExReKKKhMGwcVX1QxkCEEmM7Us5lAoAdjY1JJ
 Gw3zR0NQ2ZsqEXzE1AHb1I8UJ2zd/PhWMQJ2SzyuuPQrRGmuKB4Ts+hKH9ogGjJ19kH535hyl
 e47odlZ2Kc6bkp3O8gAQtZQtIWujmnj7yWlXAfdET5JjtjE3LYR8eXalVsLAfFmHfNNgWJ57k
 DIheW2waRiL84cBLvSKbSnTWgHeHHjMeDhIwuoRfF2sMv432lHYoyk0vymB7OOR+NEQ+UO1g0
 xqqKd9l2kCU1eQ=
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
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--8Nw9gXbH6ji+XyMM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 08:54:33AM -0600, Rob Herring wrote:
> On Tue, Dec 07, 2021 at 10:08:16PM +0100, Jonathan Neusch=C3=A4fer wrote:
> > A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
> > be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
> > WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
> > version information.
> >=20
> > This patch adds a binding to describe this node.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> >=20
> > ---
[...]
> > +description: |
>=20
> Don't need '|' if no formatting.

Ok, I'll drop it.

> > +  The Global Control Registers (GCR) are a block of registers in Nuvot=
on SoCs
> > +  that expose misc functionality such as chip model and version inform=
ation or
> > +  pinmux settings.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nuvoton,wpcm450-gcr
> > +          - nuvoton,npcm750-gcr
> > +      - const: syscon
> > +      - const: simple-mfd
>=20
> blank line

I'll add it.

> > +  reg: true
>=20
> Need to define how many entries:
>=20
> maxItems: 1

Ok

> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false

Ah, oops, I missed that I still had this line, when I added the child
node to the example.

> Ideally, you should define the child node names, but you can do this:
>=20
> additionalProperties:
>   type: object
>=20
> which means anything undefined must be a node.

Ok, makes sense, thanks.


Thanks,
Jonathan

--8Nw9gXbH6ji+XyMM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmG2gdwACgkQCDBEmo7z
X9uJYw/+KUq+yx3n/rhPsNIcTamlF8dDPIAtXBzpieCJZTm8+/nZFH91ntW0u4nR
5UjQnU7fMDc8LQlHwhr0QDRNyA/na+xiU/L9+MZyxt6bDHoAhGNuAlLieOWpK87l
AmTUdBbXUHY5COVHA3f86mWf02mSqJAc9Gf8D9T9kQkIpqQ8lPB3nN4sGnAb7gSh
0cMILvfALzWvYgpiDnmxjnLnFoPHkTdcuEVlyzbAn08GJTTxpG+C5cUbckNpqDI9
/o94Rj+y+Bdpg+oU8lYpVCTlza0SMjTDfca+Z6rQ8hMVvZNvuqjpU1X7IqpTGF17
r6gyDlpy6KzP1bbMuxtcJ7iH6ILEJQQhY8JjcljPij42QD8fQ4OYoqNFzufJoQ5/
0p0gLS9p4LVK2Df0NRK/DTgFw37oVdRGBExmEnSNt3VaCJj8CWz78jI0E2Z9ywXG
QS8ybWnaBeLZebGst0U5XzjL87mR+4y/pvhyt9ryZv64woeYwOtwdF3pNGGCG5RF
MNJoM/Mmjkt91/q2564qRwBeZndzoDnKDLtzIKusPyqxSaQ9PaoTeR5tMqRFGTjh
E18TzVK9z8BzIXCoKHUQgJcyxN7ZBOIwuqbEuTLRqoiiMpNnbr2oxLooOIKJo9mY
HUza0e+eOZnI4FF3YR5s2sXMKZwr/BdYelI7ytDiHA9Xn5LAcSg=
=vLrk
-----END PGP SIGNATURE-----

--8Nw9gXbH6ji+XyMM--
