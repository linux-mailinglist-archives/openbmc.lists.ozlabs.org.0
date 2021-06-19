Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BC73AD954
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 12:09:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6WjH5SSNz306g
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 20:09:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=MAx/+Dik;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=MAx/+Dik; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6Whx0Bc1z303q
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jun 2021 20:08:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624097312;
 bh=QLak8Qq7IU0Xb5Y6tOEtJCrVqVeA4BzC0twUCrEzVeE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=MAx/+DikedSRuS8wrzbkhvhn1/V35f2zdlxgc1fJEHK0Rrb2JANfcsNIY/GN6mxCi
 WfCpy6NHvxtNm6w4NxlNKroDjHzpq+l3J522YKFUTFoJU8ZqGbNqRJZswStZTX2fPH
 V0OSWQhWpoOYJ6tk1OycpN6zDK+8GLW9f8hrAOmw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXyJ-1ln7GR0LD5-00Yx7p; Sat, 19
 Jun 2021 12:08:32 +0200
Date: Sat, 19 Jun 2021 12:08:29 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: arm/npcm: Add binding for global
 control registers (GCR)
Message-ID: <YM3CHdoqmynKAy5q@latitude>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-2-j.neuschaefer@gmx.net>
 <20210615234321.GA1681813@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5sLq0a2qfBclcfeQ"
Content-Disposition: inline
In-Reply-To: <20210615234321.GA1681813@robh.at.kernel.org>
X-Provags-ID: V03:K1:mZoQc1Cmuq59GB9vr/TEJLwKwJF6WJ9UcfMGDo+SrYfX4tvDiMg
 KU48z0CXEZN3WBeLPiV15PgRPXGWpSm4EGTUAA+ZTjMr4+ysq1r7E3kq61qM03LAE8U2Wzi
 ZSOk8+9yXwjByU3/17f4UA02t4Nl03qMtBAc5taX/0PrAATOY+/4Ljdo+gS1l6uvhnoDRMs
 XKsT1xPocYCbF8+L1hF3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/NTpOcxK6wQ=:5f+uIplToDNDAVriAHF0En
 WhsNf2dFrXGkUaicN1wI71EnUe6ixMKyn9D+bta3wIXKvG1LjxIF/gSGI55jZLxSC7T4FZxyB
 9YjB+8T+075SuMUxTAtuzN5YM5kKx5OK+bHemGWLX89BWZBZM+9kuQTEe9K03H12/PXVzu49T
 JkPTTYP/9Fq/XeudJldvO2tGFN7Om1RCPBQ5Qunycsg0NsbRukQTvXRc+sf3ERG6UA7cb5js7
 z502biUc3weOV5svQmLBW+wR0Qlkccop3QOK4R6llrddxnevhw+c++lvdXy7ihGe7SS9aJeuX
 uUI/vzISYlPB5goXQ1yuydfg9yF4OFeeDQ3+kTW/DLdM8sIkE85YHi+daZkvgLIh5gixMWe7V
 873pcThaRV3BrqqohU69hqfrYHjWOGlAWregJ6H2OjuKNkkCbtHtg9Is+DU5xkZ9/h1yaS+ZS
 NDfFpkiChvm3mhCKgPl+Am3je+SPUBBWEVH7clucjV/mSMamCYB3cNoU7o7MdFxcJdCtBSqGN
 OTwW1TmCx6VfOvKuLT3WL6ayWpAinXVO4Di9j2ZwJoNasUUCeQExgaVw06b9HoH1CiK+KZfg4
 hWbMCGynEarRY+pAId/84MMh1re/DH8q8spPhPNxzj/YqtNf7UF1CxW3rW98kBpAWRtk0oL6h
 L0XwHdyL9Inx9uvEx5TJetDUjLs4n/yyOSCkWVb1N3eRyi1CIen2bSdOQASSY2CZo6sPEQaG7
 Jve9Ar2VvdxVl+13Gbz5V3oCBLqUOOvheEHx8w4EVnHXlk/glvqeaeZlG15oYFC/Gp3DXzCmh
 17n1DtAEyfwFkXHp1u6rmCrDjfApxyT4SuBmUbM8bnXHga1TWL0jfmnCvamE0JjCbfMT5UJ8A
 XlfP1pej5lG3JmOTU+4VjgTM0QTPlfpo13yhmugh8JGAKebPcQblGUnmA5z5rfFK9Djei4dKL
 8GmB8mcmth8wJBgd3y3c9NDFlXvaJeLYXBlSYpFKHktIuoEe6c9BwEOb9cBddfLWUaloH/aNe
 lom/CPVh9G3+RIkU1okWyiA0S2lnHUIXRwIpUlBnwOcCLHapUcxSX9OgslOX0/4C8pV1/wNZv
 AGFarUrmThz0lp8HuS19lvJraYOb6dHlI8UZLGcKXfcG6VGJdjCKfV7Sw==
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


--5sLq0a2qfBclcfeQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 05:43:21PM -0600, Rob Herring wrote:
> On Wed, Jun 02, 2021 at 02:03:22PM +0200, Jonathan Neusch=C3=A4fer wrote:
> > A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
> > be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
> > WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
> > version information.
> >=20
> > This patch adds a binding to describe this node.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
[...]
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nuvoton,wpcm450-gcr
> > +          - nuvoton,npcm750-gcr
> > +      - const: syscon
> > +      - const: simple-mfd
>=20
> How is this a simple-mfd? There are no child nodes.

Some device trees, such as arch/arm/boot/dts/nuvoton-npcm730-gbs.dts,
have subnodes of the GCR node (specifically, they (ab)use mmio-mux to
set specific registers to specific values).

> > +  reg: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    gcr: gcr@800000 {
> > +      compatible =3D "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
> > +      reg =3D <0x800000 0x1000>;
> > +    };

=2E.. I guess I should add a child node to the example, here.



Best regards,
Jonathan Neusch=C3=A4fer

--5sLq0a2qfBclcfeQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDNwfUACgkQCDBEmo7z
X9u3pw/+L8YlhSTgdM0NhfMD68vI0EsyemINtlQmV2dFUvVbQM93YSle04v4E5lL
ZF1Rj8h+u0NKJAuguqSENb4meyH3EpACuhIip7bI/eQr2LzdHlocs0zky8kikWA4
LvXKnb0Kiw9meA+OM1cF4C2wXbBE+q6pUfcZ1qr6glsY3pZlMsOWDjRhpRBH7Sy3
VQZdk9UvUUO8/ZiLi/qds3JbqK8JovXbVAOWzxHSH6PuFWUfcogJnoyWFmzWbrGT
GLh06wo8QqS/fiCyuh5ZjKhIdpLqav9L73wPf7o3Gny3hrepOrnfRaDarRhne9qY
DYAY5+giV2cKRTv4ZYEORsYbqj00rClu1QSaJKUJW+D/dSpN5zgif5ZmCHkDMTFu
6L82cq0neluLdj8VH40iRgcvGhrOose6ZZ+ZHNHma0rnDwsK3rxW0+U1RGh6Merc
/dPJUa+iY+ieDdGY8/8NgnkeXdi9Umi8mA6d8TTF9pa41ZVUVYCpO6WYCMfjtfha
vk5JkBA9T6tPjDemEWLs3Qd2EffVor3ciYNjIq2WlPFfrG/f9M+D+FKZJ55Yvt8z
wNGuInoHk7aqEnU3KfR7AnysePQ+x3QYkwUBbjdEc89A5VfyoJnUYV53luNCVXYo
fY7Oq/i8uQGIhrzndv5m8KmKYq4deMP4mzoKiHaexSvHB/k75L4=
=gZYt
-----END PGP SIGNATURE-----

--5sLq0a2qfBclcfeQ--
