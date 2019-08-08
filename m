Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4357863E9
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 16:09:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4649H40S5PzDqp5
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 00:09:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sirena.co.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.co.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rQyhzfUB"; dkim-atps=neutral
X-Greylist: delayed 2458 seconds by postgrey-1.36 at bilbo;
 Fri, 09 Aug 2019 00:08:50 AEST
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4649GB4DvYzDqHK
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 00:08:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=egMV3q9uEBW5xiJ68iYvqE6+ywPdvkHsBfVwqjoD4mc=; b=rQyhzfUBYPLZwvKm+PR5EX4zO
 zq0eKrBDfmA2kQ1AA00oDjwN1lSG+ZeH8DGBC1KIZsgvcoERHOuS9Yog1x7aEoPEok2MYmrykWaNw
 MOxo54qFXdL0FVZya2kLH4FS5OK/c2ewtxggnhYU+/8LASoTKYNq1fjICbyIdeVR1UQ4g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hviSD-000309-0I; Thu, 08 Aug 2019 13:27:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1B7F82742B42; Thu,  8 Aug 2019 14:27:40 +0100 (BST)
Date: Thu, 8 Aug 2019 14:27:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
Message-ID: <20190808132740.GG3795@sirena.co.uk>
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="S5HS5MvDw4DmbRmb"
Content-Disposition: inline
In-Reply-To: <20190808131448.349161-3-tmaimon77@gmail.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 bbrezillon@kernel.org, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 robh+dt@kernel.org, linux-spi@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--S5HS5MvDw4DmbRmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 04:14:48PM +0300, Tomer Maimon wrote:

> +	ctrl->mode_bits =3D SPI_RX_DUAL | SPI_RX_QUAD
> +		| SPI_TX_DUAL | SPI_TX_QUAD;
> +	ctrl->setup =3D npcm_fiu_setup;

I'm not seeing where we implement dual or quad modes in the driver?
There's some=20

> +	dev_info(dev, "NPCM %s probe succeed\n", fiu->info->name);

Just remove this, it makes the log more verbose but doesn't really add
any information.

--S5HS5MvDw4DmbRmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MI0sACgkQJNaLcl1U
h9Cu2wf9FI8ekzKOtKPknDdXJFSkW34/Y7Fa6IFFOzRNy/zJa/KK4039pd967txp
uqy4z1++x9xd9hct1F2qFzJRRAAfKHxCQVjwfxfXKf5kwHLS/tP9Q3LQtI4Curae
jmY4wrFeNsDTGDtA9BFQFdDbDUp1nNETnWzNPBijNo9cuzTlCsTEEhBpOM5HhhJS
E5i/L3B/If5JDs18ULa4B7vsL4oqMxgHw6ztC2EwkxcNl0/8ymCTzHI8D1kpl/+c
nJ/cX59A4kqGn42v5Zw/dt1zrqAL5lPTywW2RL/WbS7IiDjREsFoHrF4vtnKHJAJ
VEB121JZAJjasaLrxwfT/dO0JDeQFw==
=tVs8
-----END PGP SIGNATURE-----

--S5HS5MvDw4DmbRmb--
