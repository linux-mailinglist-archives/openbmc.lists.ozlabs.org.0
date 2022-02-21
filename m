Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31F84BEF82
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:25:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jh62NLsz3bPX
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:25:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Z3vaRQu6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Z3vaRQu6; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2LNc3hfLz2xs7
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 22:56:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645444519;
 bh=vB9e0s/XLYK57e1m4pHossv3dKKvG9cVckBgccyxB/4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Z3vaRQu6Yete4we3x+kcNxmQdKplN8XwYcCaQzAqcj4X53OHCv9jQ+utUrhUj5wDR
 d66uuI6zlW7tx74gCqPpAk3pbQjRwqaflIbDC7BwVEMz/xE5OoikYALNZSidaJmsJx
 zxdrhDcD7HO24pJLR+3zbHnfpIQnUU7T2nGyh1Ag=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1no3US3ydW-00TCnw; Mon, 21
 Feb 2022 12:55:19 +0100
Date: Mon, 21 Feb 2022 12:55:15 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 08/11] i2c: npcm: Correct register access width
Message-ID: <YhN9o7IKl7M974Db@latitude>
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-9-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="atvLe0wtstfQwleA"
Content-Disposition: inline
In-Reply-To: <20220220035321.3870-9-warp5tw@gmail.com>
X-Provags-ID: V03:K1:3zCblU8IFjRoGL3Lqw6q+AUxItgEZUawI+DgaSGPnD+rb191X8q
 7XgtAPeYJttwuVdwgIrVeNNQjN4kPGVP3f1+9lj3dWZo8KMYgyY4oGbZHJ+9Zr85mED7XPk
 je3/BQn6jgwnL9dm03xyxyNGocjmwC8+1MwJahQ9RiggSMRws2e0XXibcMr/4JlmtO1coem
 SP2mASSZkA5Vhp0uUjZXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dEnf+Vyi2s4=:xZBSf2e4fR3ckdR3q+Tqzc
 G3vBuBeZvqIOK7xA3gEWg14IO22q732Wk8656RU8ElYK5qVYuiHSDsaDh6rjI6DrponbcT5sQ
 kOGyNIdOwFtyplEBuR7lYwhZgmKfDkM6FQAnZNhAJPgTaAsdn7iq0RNvDXocEn2Je+CFmXZPg
 P9Aa/svea1DUHf7pOXweBQK03O5EePIZfyYct5e47n0WxJBFt5wlU+HzIXFScykqJlc3B1t7E
 9b2SI6Uv9/o5Yb8jieO3NaYU4rfdqvLrcZxpWxretuKfR9Z3bmV5COW5wlWDKdiQXGlptoN5V
 RDUHv6A6dLQLXLJqtLoveidWFJbiPFu4+8cLYBJbOYuhNlbo+dSyl5Y4uBoeaP83M5mxvI4VS
 UVxVkx8bWQo8DiteowWVjst0C7J3TRvMml0UhCUevfgKLe3od1dxrBuS1xS6HMcXEF56dsF6E
 ei/NenKMQhnuCaRU4MPFBsNg28kr+4ACDMkND/2lk6TKIauSRvWS0CQeAMOnvtptsTtb2jQc5
 280AilNBRFDnBbhtipkFzsMXanPZwnILqhyUX6H6qasGGRm3na6WEb/BRULsrRYAI2IOGmbTK
 xb0V8gGUqsDCsbuUZkxJv5osne2jneR20vZjp9iGf+MyaABavxamI8PZrgh2cbrcgak8d/iSQ
 Zbt2x4XvY2rRf1OjeOq4gMDgYyXvR0diJhH8HTz+F+ylGrusiGaQq7OGVjRSqRipi5AELArgl
 e3WA4RpQm0Gn8RQQZq8Ss54UYhXiIwEGE2881sFXnCAkkbxFZVZP65+FXlbCMqt8tOUzM7P0Q
 XsvmcnI/IB+s/StbVqZBj1HHQU0Zh1LnZ0t8zFeEuhUd5KxD5aF/JDF583NCwRQtsgL/G6LeO
 IQrqT4w6FEOtWxw81hsPLtRVlHlfbsZ8rWAUSgnTwztZIRDrSLMXG1beDXyLluDqUgcdEofC8
 7jzs2c2/AyIfJynX9O9HDCP4oQueUFtAg1b7ppkb8meUzWCGxlejxcCutC8nztEsmUKO2mQGF
 ASTdJY9ST6Pa85EyXZ8IZahb2nZzMoJ03/qCS1A+ie2uMk0H+9UmYW7E1a+z5tYPiNZyau/mr
 lNZTC0d1DKdlUc=
X-Mailman-Approved-At: Tue, 22 Feb 2022 13:21:12 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de,
 sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 yangyicong@hisilicon.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--atvLe0wtstfQwleA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 20, 2022 at 11:53:18AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
> the register is only 8-bit wide.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index ee4757eff4b3..4715afcf9ac4 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -360,14 +360,14 @@ static int npcm_i2c_get_SCL(struct i2c_adapter *_ad=
ap)
>  {
>  	struct npcm_i2c *bus =3D container_of(_adap, struct npcm_i2c, adap);
> =20
> -	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> +	return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
>  }
> =20
>  static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
>  {
>  	struct npcm_i2c *bus =3D container_of(_adap, struct npcm_i2c, adap);
> =20
> -	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> +	return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
>  }
> =20
>  static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)


Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


Thanks,
Jonathan

--atvLe0wtstfQwleA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmITfaMACgkQCDBEmo7z
X9u9dg//QF1S0S3Sayv/Y5POeRg7pV8i8t2OEfH9zCVaR+vr1PoolReqj3k2Ej9d
gYEjSbp+xbmuChkgWTj06BPc0LR319rmq26SUjHUNJJEEKFjFSzzMzPkNNau3+/O
47dyiOmGPMAlGDBM7JQwbk5Iry+rAiSSO+C0B4KDCkLitGsYXWzEIzyKQiAAwnpp
E5VX32do5W2wj0gUGQE2ccvPMf4bxFOmrRDgZ5TaVD9W+FSnZOX2aks9RNCub/FA
mucJMKSuTeC7TWQZplf3OitMVV/mcc14vZEq8gz8V+oR9LC+Z6jqyR7VTnvYao6S
Umc4BO0hNVt4otrcUfMfpveIUn7Hl9rCOzu3TkGH347urAX06UqLvPrGR/OZ+eN9
OLL6/idFdnpjZGeJuZKhF1cpOg3EXBtKLJLVIH0Q2S01Xime8JE/7tsfjDbTgEi0
e9A0lQgsr+gH5Fg1ch0/HSvB9JQkMJLPX9IRZmnzLBDTR/wgpk9wj+xHQ4eu+DaI
i45J9mdU5SpKJUenOxUT6OEqMLo7BZYNC0TiNJAj9Z9o80+0D+grf3PQGAbkRrXd
ANHC36MNKQoaVL9UepM/MApMjCbdGexFolHO+x1OAj+wc5ByBEx02761DbY3tGTy
+uoLcZbn3xZJBgEh9ItMeq6thuErcvsUgTKtiCYMSJcYu+whDLU=
=4Mfv
-----END PGP SIGNATURE-----

--atvLe0wtstfQwleA--
