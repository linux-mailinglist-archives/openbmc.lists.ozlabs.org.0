Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47937638AD2
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 14:05:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJZq623v6z3f36
	for <lists+openbmc@lfdr.de>; Sat, 26 Nov 2022 00:05:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iHO2YBeq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iHO2YBeq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJZpY3Xklz3cFn
	for <openbmc@lists.ozlabs.org>; Sat, 26 Nov 2022 00:05:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12252623AE;
	Fri, 25 Nov 2022 13:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3695C433D7;
	Fri, 25 Nov 2022 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669381505;
	bh=guHVk8mGlrW6zqC9iGeaF/LVeF/HixFYDxJ3wSRANjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHO2YBeqU0UetAaZDqcRknhGxiD287z5KyO8lcJJBuvfpGSJVrMNkhLauSXUnegpB
	 C9U2wtclacwhiMglllaVDXkiGdXJKcMQH+/8a/2KcUQUCC9BzBWttRG1tQwG70EnWx
	 GK/fAITY/WeNyUkdl1IcwJrOAZUdvCllYHIQfdjKTYVrMmjhYfEOwloQqO4GTcbXbK
	 GaB7e3OSsi/3al4IopY6xLkWsc8N+N7dC14uk1u/ALkvw/iSPhKdiehUfhVN7UEQkw
	 hixkRHzn4a1Wmj1XXq+2+24W3tbGn9IT8u6o6ubb0l5rI1DHNKtrrACoWL2VRQiuNX
	 mYhvWdkaoQFcw==
Date: Fri, 25 Nov 2022 13:04:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 2/3] spi: wpcm-fiu: Add driver for Nuvoton WPCM450
 Flash Interface Unit (FIU)
Message-ID: <Y4C9druicCm0m3wi@sirena.org.uk>
References: <20221124191400.287918-1-j.neuschaefer@gmx.net>
 <20221124191400.287918-3-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="smw0hoe4UY9/oecT"
Content-Disposition: inline
In-Reply-To: <20221124191400.287918-3-j.neuschaefer@gmx.net>
X-Cookie: Time and tide wait for no man.
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--smw0hoe4UY9/oecT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2022 at 08:13:59PM +0100, Jonathan Neusch=E4fer wrote:

> The Flash Interface Unit (FIU) is the SPI flash controller in the
> Nuvoton WPCM450 BMC SoC. It supports four chip selects, and direct
> (memory-mapped) access to 16 MiB per chip. Larger flash chips can be
> accessed by software-defined SPI transfers.

Those software defined SPI transfers seem to be most of the way to
supporting normal SPI controller operations, they just need wiring up.
That would both support people hooking other SPI chips up to the board
and might help support future flash stuff without needing custom code in
the driver like you've got now.

> +static int wpcm_fiu_do_uma(struct wpcm_fiu_spi *fiu, unsigned int cs,
> +			   bool use_addr, bool write, int data_bytes)
> +{

This appears to only support half duplex access but the driver doesn't
flag itself as SPI_CONTROLLER_HALF_DUPLEX. =20


> +	cts |=3D FIU_UMA_CTS_D_SIZE(data_bytes);

I'm guessing there's a limit on data_bytes that should be enforced.  The
driver should probably also flag a max transfer size, though that might
cause issues if the limit is different between spi-mem and regular
transfers.

> +/*
> + * RDID (Read Identification) needs special handling because Linux expec=
ts to
> + * be able to read 6 ID bytes and FIU can only read up to 4 at once.
> + *
> + * We're lucky in this case, because executing the RDID instruction twic=
e will
> + * result in the same result.
> + *
> + * What we do is as follows (C: write command/opcode byte, D: read data =
byte,
> + * A: write address byte):
> + *
> + *  1. C D D D
> + *  2. C A A A D D D
> + */

If the driver were implementing regular SPI operations and advertising
a maximum transfer length this should just work without having to jump
through hoops.  The core can split transfers up into sections that fit
within the controller limits transparently.

--smw0hoe4UY9/oecT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOAvXUACgkQJNaLcl1U
h9DAMAf/X47Ck+FvdSSBNIQ2z8oJdpjFNxzfM7WEi4iqoF1oOcS8IcsxYATK2qDA
1jz12Ea4fmOTjGJdikq/DeNru44Rcfu/zybRf22nlhAAVMOMh6CAFC1vp2sOhqEM
db+4lBppUmKISAdxNZ2J0JzUjjA+rdXIFEe8aljjQPNo6OkAcoKiRI8pJHX8nYiv
Ps6looHKtrsBiVvyUvrBvTT2OUuFQf976dgg8VwMOLc+5wAJPNyBxvpBrp7YRXrp
rj+wTZ9QHu5bHYR09EHkdkz41AKVd8VfvnzdWD596OjnxpCoRXlwOO3x3O2UKd1J
7ziwXD0IG42CiiNgzG2SAq82ltJGyg==
=ZhBB
-----END PGP SIGNATURE-----

--smw0hoe4UY9/oecT--
