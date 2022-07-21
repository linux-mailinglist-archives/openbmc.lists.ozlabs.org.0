Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540D257CC77
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 15:47:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpYlg1Bvpz3053
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 23:47:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QPdX1inL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QPdX1inL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpYlD4Q1vz3053
	for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 23:46:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5D7561F2E;
	Thu, 21 Jul 2022 13:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B17C3411E;
	Thu, 21 Jul 2022 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658411204;
	bh=b8gG2bCPlj2x4Xkb//2x1j95onaGj9Tc/6iMX2KqQyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPdX1inLAlzEf+AVLSF8qSECPFUBNdfpxXbaLxP1D7/LfY3lWSJyStkFGIdiA2yL3
	 5uU4aKBPoLTzCQ6rxWif/Z5QCRqOtXrmUP3wV4zP0yHUiYKm4U+0id02wWX83Eeslw
	 HH4iTsYSkWxeu9vTJzujmH/rq0DBaXK5MDY2z674k51PmkEiRZO6Kzq1NGJn3sJZKT
	 i5fR3C9CQLr5ijj56WpXEt655wZiKp3++Ue0DFas6LAcPMrpYckvYzFisw0IxkU7mt
	 BQRemM9ieRGqiWTqDwkUYHF3+goBN/Rne0Ko7cqf+aZbJqxIygWp4KiiVF+6ao2J60
	 6h66mtbaF64VQ==
Date: Thu, 21 Jul 2022 14:46:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/2] spi: npcm-pspi: add full duplex support
Message-ID: <YtlYt/5VKIblUHBP@sirena.org.uk>
References: <20220721101556.118568-1-tmaimon77@gmail.com>
 <20220721101556.118568-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5SDnULtcW3k8gJQC"
Content-Disposition: inline
In-Reply-To: <20220721101556.118568-2-tmaimon77@gmail.com>
X-Cookie: Exercise caution in your daily affairs.
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--5SDnULtcW3k8gJQC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 01:15:55PM +0300, Tomer Maimon wrote:

> The NPCM PSPI handler, on TX-buffer not null, would perform a dummy read
> but did not save the rx-data, this was valid only for half duplex.

> This patch adds full duplex support for NPCM PSPI driver by storing all
> rx-data when the Rx-buffer is defined also for TX-buffer handling.

This doesn't seem to entirely correspond to what the patch does, nor to
what the driver currently does?  I can't see any dummy read code in the
current driver.

>  static void npcm_pspi_send(struct npcm_pspi *priv)
>  {
>  	int wsize;
> -	u16 val;
> +	u16 val =3D 0;
> =20
>  	wsize =3D min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
>  	priv->tx_bytes -=3D wsize;
> =20
> -	if (!priv->tx_buf)
> -		return;
> -
>  	switch (wsize) {
>  	case 1:
> -		val =3D *priv->tx_buf++;
> +		if (priv->tx_buf)
> +			val =3D *priv->tx_buf++;
>  		iowrite8(val, NPCM_PSPI_DATA + priv->base);
>  		break;

These changes appaear to be trying to ensure that when _send() is called
we now always write something out, even if there was no transmit buffer.
Since the device has been supporting half duplex transfers it is not
clear why we'd want to do that, it's adding overhead to the PIO which
isn't great.  This also isn't what the changelog said, the changelog
said we were adding reading of data when there's a transmit buffer.
Similar issues apply on the read side.

AFAICT the bulk of what the change is doing is trying make the driver
unconditionally do both read and writes to the hardware when it would
previously have only read or written data if there was a buffer
provided.  That's basically open coding SPI_CONTROLLER_MUST_TX and
SPI_CONTROLLER_MUST_RX, if that's what the hardware needs then you
should just set those flags and let the core fix things up.

> +       /*
> +        * first we do the read since if we do the write we previous read=
 might
> +        * be lost (indeed low chances)
> +        */

This reordering sounds like it might be needed but should have been
mentioned in the changelog and is a separate patch.

--5SDnULtcW3k8gJQC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZWLYACgkQJNaLcl1U
h9A4AQf9F0Ou6ruUsB2l9FBA8z/dhz178MbimOt9osjMD/omwua1unnf5WZyjUak
oknbfxdzONnxJ5jKFsMSkILGJhu9PPjZlrHfemFI6oc+K3CftKWOJ4yx3ICwgb6B
KCna1abwEAMAaPqZH6G/mOl4JtVv9o5ne8WQCdJroHW1jUTGJE4gRPSG9hxjp9vy
n1RhgLiOsvpMCDH4jmi1fwoyej2tWkq/PEpIzIAga+T7OR/Qcd4dhyrQRdnxDTOb
RLRi7egoVTZ3/I6wIytwA2+vBZE1UgYdMktPGJ0NRFa7F4j62miVk/lWI5Zwlj7/
zRq/nEIMVxUjXEB67rDSegd0erDq8w==
=rN1K
-----END PGP SIGNATURE-----

--5SDnULtcW3k8gJQC--
