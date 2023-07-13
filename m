Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD831751CF4
	for <lists+openbmc@lfdr.de>; Thu, 13 Jul 2023 11:14:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1ppb4b77z3c7Q
	for <lists+openbmc@lfdr.de>; Thu, 13 Jul 2023 19:14:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1ppC4yFbz3bYR
	for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2023 19:14:26 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJsOh-00064e-Uu; Thu, 13 Jul 2023 11:14:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJsOd-00E5Je-3M; Thu, 13 Jul 2023 11:13:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJsOc-004WHz-Ed; Thu, 13 Jul 2023 11:13:58 +0200
Date: Thu, 13 Jul 2023 11:13:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH 34/58] mmc: sdhci-of-aspeed: Convert to platform remove
 callback returning void
Message-ID: <20230713091358.p4r42rnhzje4avdj@pengutronix.de>
References: <20230713080807.69999-1-frank.li@vivo.com>
 <20230713080807.69999-34-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kadj4nzld535btjr"
Content-Disposition: inline
In-Reply-To: <20230713080807.69999-34-frank.li@vivo.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kadj4nzld535btjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 04:07:43PM +0800, Yangtao Li wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
> index 25b4073f698b..42d54532cabe 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -450,22 +450,19 @@ static int aspeed_sdhci_probe(struct platform_devic=
e *pdev)
>  	return ret;
>  }
> =20
> -static int aspeed_sdhci_remove(struct platform_device *pdev)
> +static void aspeed_sdhci_remove(struct platform_device *pdev)
>  {
>  	struct sdhci_pltfm_host *pltfm_host;
>  	struct sdhci_host *host;
> -	int dead =3D 0;
> =20
>  	host =3D platform_get_drvdata(pdev);
>  	pltfm_host =3D sdhci_priv(host);
> =20
> -	sdhci_remove_host(host, dead);
> +	sdhci_remove_host(host, 0);

Please mention additional cleanups in the commit log (or split them into
separate patches).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kadj4nzld535btjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSvwFUACgkQj4D7WH0S
/k6wiggAt93FG44I5BusUjcLCaJIc68VoaotrR0JLJCtFzMpQRD3O6i07AtzGcj0
GTZ7/O9cLM8BXkhMCFCB2qtEF367tZSFsu7M5JfXZLxBQq705O0CLXl7XxM+O/co
6la8+3RcyhF7DmifGiz41BBJNq+so3v/LlBbLd5BUuBFV4lWwzq2tbNZTXEzFttF
sE+Tx0t9kkozlelYHVp+NXIp0XDGTpjgt4ROx3rGWJ/dF44n0C7YPpVmLZVM2qxe
8tEPNxoij66WrTI+APD83psJ71CNc2J3cdDl0BuqmpL49GY1OJGxenufxVmOEjGW
bCOH1R0Rqn1aiBByQQQ5tD+PfrRNVg==
=b7ZI
-----END PGP SIGNATURE-----

--kadj4nzld535btjr--
