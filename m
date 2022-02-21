Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDCE4BEF81
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:25:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jgQ6rsJz3bXg
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:25:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=lcLAC3Lb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=lcLAC3Lb; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2LFg2Hr5z3bWj
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 22:49:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645444156;
 bh=9wq7WtAJcIzsC43pheO+mOf/CLyOnMHoPtsnM+1Q4JQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=lcLAC3LbLAG4Z2MM6AZap1Y4EopsKgoYLOWADpRmeKpKNujSHq9sqWNknKBUBEBKN
 6UW31xIWfs5PtluSWpa+P1AdlXLqfddnor/Hx+PWfh2k9ODg4cXmHb9/BdeC/1dHe5
 rjnYkLVSmhfiHpRgWMDTo4nDAd42tXXnuN2+t0wg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf0BG-1nsg341v34-00gV35; Mon, 21
 Feb 2022 12:49:16 +0100
Date: Mon, 21 Feb 2022 12:49:12 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 05/11] i2c: npcm: Remove unused clock node
Message-ID: <YhN8OGIR9eSCus8E@latitude>
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-6-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5bsHzk28K+QW/lWF"
Content-Disposition: inline
In-Reply-To: <20220220035321.3870-6-warp5tw@gmail.com>
X-Provags-ID: V03:K1:A3A94t6ywOBQp5e/eufvWk1pKc7j11XIziyDptaPzqcGk5A/uoU
 5IgYxy5UOPRt+qY3IdhUe8KMsnxkzYgiFigoezPYO3GN4dcVkF2d1Mi7shfsaOJcDG7kCKL
 UDTQsUlEcQJoHW+4esUkzbXX43lJRUomqY1/ivWGA+l20tMn5mpnwBFLxf23AQg7lh1hts3
 cDzjDFB6kb4oNPQ/RDb4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0xJ5SR0QHkc=:StKWUAaEns4yWxlxobvPjI
 4uhT+HjljB966gTpr4qY4/5jxRKlSQYSEHMqqwX6Pv1g5nSMDlAI8OfmA0hqXHw+IjdyeYISE
 kz4gtIJ+etuIEjUhg9O0sOTMRkVEnx0rYpIH/4yscpSZd57hAYZhkVqo9O4I0YOmLyTzM+28h
 +ZiZy1yecl5AHAMotCzuFcmpFetxoDQUDlIqv3GH+iLxRZSb9UcMjo6dd0p6snUCN8H5PHaGp
 FCgq5rsBsLqFOxmRS61xvVPc5Ev5rixfzj4Nkr9Up8ZX7anZc/peRhSh4yecv4yunifqZnmN/
 BbWavMTNtWrTnU3DlrjHsd2T20+lnU1kFi7utDaX//O4xHO32+s4sQmG2hZ9kcfiguJ1ub6GI
 gNDoneXTvGtWtzxnhirIkeC9x1WMBaWv30rnhedpfliOnY3WTimTi8hq2FEA2xYLY9mog3RfG
 s07UB80OS7raI1XX5IAfpX8r2jK/ycsBYXzkKkbBv81i5iU9lUbWoHfs1/vdGPGDzP7b7u7tx
 ePfvpz84bdLlZLgU/fvxVkgfwc8Y4C/DA/RrEw5bgK1MS1M6DHeT+UtoZGeLb03dZAb1veRr7
 C3t6YitwBi4vhEi8pEan4GommmKR1zDyf6zNTCmbRc4DyepPg2rD15VIfhfqKACtFZ0PbRusk
 7Iu2YC3iZJypvp0EaZkr6YHnqvomFuCUe0E4CTSE5R7Pa7qX9AYfCk1MUidDTL090V+zdXd/D
 RQ+27I74IP7jmFQ3bDqyT1lGHDufBa2dp4yuIfCxEqUYwAQ0EpEzbsVFmy2vjC6s1P5i9HgOU
 Dx/BLhHqnaBS9L0fniab51eWzwOapNW2r7UOma3HC9ANP+R5SwXYRU61c1QfbOXS5Oe4YmCZJ
 YN0N4lzGvDtiWxIvolKTVlp01TG68azWZcaywM2p9M1Oc/32AYQkwO+HbqoDT5LMiTWVOpg3R
 DTEZNFNkxNtfYH8wXnxJKh3UELU/a1au+sMVbRTcwL+SWDr3gT7UqN5zi5hK7UdphgseuqwEd
 Dw3J2jVlbki8SYp0pMbg/c6WRsci0lhziUv9b6Q/wBnUUqsATaLs7WuPFH/rgz3/JwXZLPK14
 0qX3Y1HZI7eIxE=
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


--5bsHzk28K+QW/lWF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 20, 2022 at 11:53:15AM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Remove unused npcm750-clk node.

You're not actually removing a node, for example in the sense of removing a
devicetree node from a devicetree.

So, I think "Remove unused variable clk_regmap." would be a better
description.

>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index a51db3f50274..9ccb9958945e 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2233,7 +2233,6 @@ static int npcm_i2c_probe_bus(struct platform_devic=
e *pdev)
>  	struct i2c_adapter *adap;
>  	struct clk *i2c_clk;
>  	static struct regmap *gcr_regmap;
> -	static struct regmap *clk_regmap;
>  	int irq;
>  	int ret;
>  	struct device_node *np =3D pdev->dev.of_node;
> @@ -2256,10 +2255,6 @@ static int npcm_i2c_probe_bus(struct platform_devi=
ce *pdev)
>  		return PTR_ERR(gcr_regmap);
>  	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
> =20
> -	clk_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk"=
);
> -	if (IS_ERR(clk_regmap))
> -		return PTR_ERR(clk_regmap);
> -

The change itself looks good to me,

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

>  	bus->reg =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(bus->reg))
>  		return PTR_ERR(bus->reg);
> --=20
> 2.17.1
>=20


Thanks,
Jonathan

--5bsHzk28K+QW/lWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmITfBYACgkQCDBEmo7z
X9u67A/8DITpR6PwEHyOhlZUQgCqO7IkhgngdjLbfGYcdhSAtq69YPAq+CNYRPUh
QqSLYsT1ZFHfNEBUgotfG9UcBLQvJexV4usHwRR3s443Fikou8a+J1HDNvwOOKeO
ygPaffGiYEtNtZn+CXhkOCpJ05R5gmMZP3CK/HXF+AM2EDKsO0OtsgOlJWpczyqj
Jw8IAtnN08SNM7BH8uoNkZfSTWaPoS4Muyvp7+OX+y24rht7BO5nmofDhRsNKZ7Y
dfUQRa44Z/7J/wN7TcW7eoYAn0cw9K8UUZWu94w++eqSJsRbUPcXjskESgooFMyw
IoHxHhOuvN4kBLCx/62qeIaait5lcWqUWFXxRe08EjhR4AQJpmWy/3F21mRiw8R3
uF3gP6iZuUToM1JyHqcXq2RaF3O63y7s6rVJLcpi3yJqpDCZUxvbrqb3kzPFURAM
nNW1uJemP43tNEeNcQw4doc5yKh1FqE9XEFctqkvdXRnJYdnj5TuG3gu/FQzKjPN
p75J9u7doqvA/n3OI0jT3ByJkW2mZK3F3k4rEgfKU7zmxEKhDlqlTcqFwh7bjPrO
fAtN0CiZh9PCPt4CubsFBW1AbCAuHV3J6buMi+/QZPGRz9aw3gP7Jwnddl5BH4EJ
yiyyA2QC5RnVqB9AENHP8EhFEhgMDSvCgMiRMatAF3/uZ6I7LIU=
=P2fi
-----END PGP SIGNATURE-----

--5bsHzk28K+QW/lWF--
