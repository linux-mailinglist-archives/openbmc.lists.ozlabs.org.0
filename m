Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 952184ABA57
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 12:28:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JskR22SPVz30jV
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 22:28:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=OKjDivke;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=OKjDivke; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JskQh0bVKz2xD7
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 22:27:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644233241;
 bh=bSkEZSwNdnc9xMNGqzoYVpfNSEmdW/ref73MmstW5+I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=OKjDivkeCav3IJRVELBJczSmr0EAG3vndIv4Idkg7kKntIQWeydwOqWCGiUCxA/0s
 QWTMtfHEwvJMUaWESCoXmjM+3AOjQgEuVfR0AftDjFJcD8Fz3D5BTyb4DadSWzFqSL
 8fTcvSNkFvAHRXt0VaA5FfaudjgXyIWc7fV5Y3cI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEFzr-1nQhMS2D01-00ABLe; Mon, 07
 Feb 2022 12:27:21 +0100
Date: Mon, 7 Feb 2022 12:27:19 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v1 2/6] i2c: npcm: Fix timeout calculation
Message-ID: <YgECF6jZ7wj8TOfl@latitude>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-3-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RZxU18GLaf6NWGkB"
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-3-warp5tw@gmail.com>
X-Provags-ID: V03:K1:b064a7NKHMgEF0K2xAV1J3QyZzhrY5hXbM6HPqaw3wSsioPSz57
 QCtE6C3BEk0+/Sv/aNi4DhaHOSt35BV+Lg+G8nt3n256zXBiDTmeGoFyzzeWnXN8OvjZGNf
 xoLZSJFHBiPf35wndAyrO81+bpEzCRDOzCLgfvk02kWCktIZbv9XoDVsvkpktRF+c1QMKw3
 1cmDHtFr9/kIzgjziTXqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RlAXS82ILPM=:xltpRSPtwPIvdTQYxyI9WR
 3Cfn3UEhgKgkP7+xcW5TueAsfFrO5puMf9y7rvfbIUmtJsrJYdjwHa/PmpyN/UWnTsZ1hWV3q
 jFAjemyxntf+vZgnjg7mX0DUivwLWAonpFFoY10RP1pamZm13CuKwBL+XIVr8aK3y9RgBCtet
 9wro3s59VjJkNpdcPZOIQnXCnnEi70U9k2goNBhEcftMtJ9h7ETG6NzrQ9QWJ1HASbJhJ72+Y
 R+XelwA2t1/aBvrpRjrin0pIaAvZOWJiyUB/Gi0Fxs5pcDLPCV6HTYEAy1kMj1ux/Rh35ubbM
 O3BUME6sRwLdDxcGjoIsGBovdDc6x6my2oOV5j0F3VMml/u7fakSiwE/mkz47ez2LRQH4DolX
 TAtNxxlusy2/ECL9rO4qkNyXmPCsGpiBsM2OjoB4wM7JT3vhIzxk19kKi+BUtJttHuaCEqaM1
 tj99OrTJXXu6CP6fOjWv+uM/JFHvQ2L9nl3ozmQtqrxodG3Cr27X4cdPcVc14MXexdS5LxGPT
 x3FegzM/OZQvH1bng/KDoq2nfhTxvTu2iX8CLbmkTIzvwyKJGzf2XjTmirn5x0yqL6aRQCMFd
 jyMKTbaM4RFYF3BxGYPhbRbeZnuKVICqVGA49kE3CaZKNXGq2JN3AAkM2oNnO2s0imusEHOcd
 RRe04CjmI7+sAGZZ4uxlFC/6ni82ei4z5pDIU0ix2LTUyqQUgMXA4CaTKCUJ9FqMWkVx/G2Ws
 scmm5v6Tx1TSQvdpeCeO48PxnQ1aNr2DFStmuSsB+XorMyLscOB8Y6Z6zEAINv9EIrpubvHrj
 KUoUUe4VcDNrKrQV7TeYp1fEIdJaaqAxRur0NeFoNNNFU+JodSvOVtrPRrm5jv5I3NTD7n7/G
 MVzhFr/vY0+J0v8qjJuv3Qh5Z2+j7bqI9XgHdzqcMljOSgjqmlKAzvUv5Zmp3e9rgSBwk7Q0F
 g/xNtAGj2n+mcPeeNgQ+zrqxjXKkikvIQzwrselA8cx/oSk6RNfcf6FKxUoZuIn5HA9jZ2tqO
 5Jmqm2D0TeodgmheaAyl/2P7VwGykRxiiWTaUjcmp1G0XZKRrrVs/Cz3X/Ik3bqgXLnznUy0/
 2wKyyJmovRCx0Q=
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
 linux-i2c@vger.kernel.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--RZxU18GLaf6NWGkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 07, 2022 at 02:33:34PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Use adap.timeout for timeout calculation instead of hard-coded
> value of 35ms.


> Use syscon to access gcr, instead of "compatible".

Please put the GCR/syscon change into a separate patch, because it is
not obvious from the commit title that such a change would happen in
this patch.

>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 2ad166355ec9..ddeee6f53621 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2047,7 +2047,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter =
*adap, struct i2c_msg *msgs,
>  	u16 nwrite, nread;
>  	u8 *write_data, *read_data;
>  	u8 slave_addr;
> -	int timeout;
> +	unsigned long timeout;
>  	int ret =3D 0;
>  	bool read_block =3D false;
>  	bool read_PEC =3D false;
> @@ -2099,13 +2099,13 @@ static int npcm_i2c_master_xfer(struct i2c_adapte=
r *adap, struct i2c_msg *msgs,
>  	 * 9: bits per transaction (including the ack/nack)
>  	 */
>  	timeout_usec =3D (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + =
nwrite);
> -	timeout =3D max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
> +	timeout =3D max(bus->adap.timeout, usecs_to_jiffies(timeout_usec));
>  	if (nwrite >=3D 32 * 1024 || nread >=3D 32 * 1024) {
>  		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>  		return -EINVAL;
>  	}
> =20
> -	time_left =3D jiffies + msecs_to_jiffies(DEFAULT_STALL_COUNT) + 1;
> +	time_left =3D jiffies + timeout + 1;
>  	do {
>  		/*
>  		 * we must clear slave address immediately when the bus is not
> @@ -2131,7 +2131,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter =
*adap, struct i2c_msg *msgs,
>  	}
> =20
>  	npcm_i2c_init_params(bus);
> -	bus->dest_addr =3D slave_addr;
> +	bus->dest_addr =3D slave_addr << 1;

This seems unrelated to timeout calculation.

>  	bus->msgs =3D msgs;
>  	bus->msgs_num =3D num;
>  	bus->cmd_err =3D 0;
> @@ -2233,9 +2233,9 @@ static int npcm_i2c_probe_bus(struct platform_devic=
e *pdev)
>  	struct i2c_adapter *adap;
>  	struct clk *i2c_clk;
>  	static struct regmap *gcr_regmap;
> -	static struct regmap *clk_regmap;
>  	int irq;
>  	int ret;
> +	struct device_node *np =3D pdev->dev.of_node;
> =20
>  	bus =3D devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
>  	if (!bus)
> @@ -2250,15 +2250,11 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
>  		return PTR_ERR(i2c_clk);
>  	bus->apb_clk =3D clk_get_rate(i2c_clk);
> =20
> -	gcr_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr"=
);
> +	gcr_regmap =3D syscon_regmap_lookup_by_phandle(np, "syscon");
>  	if (IS_ERR(gcr_regmap))
>  		return PTR_ERR(gcr_regmap);
>  	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
> =20
> -	clk_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk"=
);
> -	if (IS_ERR(clk_regmap))
> -		return PTR_ERR(clk_regmap);

I agree that clk_regmap can be removed, but I'd rather see it in a
separate patch, because it's unrelated to the timeout calculation.

> -
>  	bus->reg =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(bus->reg))
>  		return PTR_ERR(bus->reg);
> @@ -2269,7 +2265,7 @@ static int npcm_i2c_probe_bus(struct platform_devic=
e *pdev)
>  	adap =3D &bus->adap;
>  	adap->owner =3D THIS_MODULE;
>  	adap->retries =3D 3;
> -	adap->timeout =3D HZ;
> +	adap->timeout =3D msecs_to_jiffies(35);
>  	adap->algo =3D &npcm_i2c_algo;
>  	adap->quirks =3D &npcm_i2c_quirks;
>  	adap->algo_data =3D bus;


Best regards,
Jonathan

--RZxU18GLaf6NWGkB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIBAhcACgkQCDBEmo7z
X9uCbA/+NL/rpWypOlFcnBB6ISQecB6S6RoUnN3cnFt2SaNw2nQGu5P/Nrzbx1L4
9fBT0i385RpgaUqTHIV3ldE+75kstoCC4af1nuTXWG03Y6jhEbly/Hs0u6f4TOnJ
2y3DnEigDmCcG7K57OlsucUlhQMpJ4591qgZJV80Jf6ZjkmBR6VXnSPY0ISAwOjB
RH+QZyG91QRDIS7Az8Xw0PnaEhy/YntqCGICaT2D3yXcTWb8qPGJNu0uaBOVP+9o
vNPbJ76zLdsuW351xKFE2uY3cxnqwwznqeU4dzWBKe/wDC77wCq0Irsi+y7dA3S5
dna8ZzSXBPP0wDAltMiMqQKrZp8L21DWZeT/V2/ohg7XhQ9Q2fLIWLhf9XUupTAZ
rEJH+Ebq1GVSJZdEj7lKmxUlL2C1FvMb8g4yMItrs/5+ZpsY6XZbZHonWJGJ32IZ
zS/mCGJyIwb8/K2J/ts9zYCOqXgaybLXmyf5vWwEp3udg5ZicnruqiG4xtZDysSk
KLKQpdLKVaPwqdzHdZaxshXP1P/cgF53BAy0uIadanoBRF0MdgaJdOZuA69jVN5Q
Jr7V27NC2zCWOX+QG9x63hS5MXCnwcwCUn9qgS3WezBZWB1Y7/QPfuOZC8ETgIP0
Le3Ngiv9rt9esIaW9YjoW3/+QBxhulJKMiYerTqGWN/2fVD35CI=
=QKMT
-----END PGP SIGNATURE-----

--RZxU18GLaf6NWGkB--
