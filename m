Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C8770473D
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 09:59:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL7tt35Qsz3f4v
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 17:59:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.a=rsa-sha256 header.s=mail header.b=DPG9ROIG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=crapouillou.net (client-ip=89.234.176.197; helo=aposti.net; envelope-from=paul@crapouillou.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.a=rsa-sha256 header.s=mail header.b=DPG9ROIG;
	dkim-atps=neutral
X-Greylist: delayed 554 seconds by postgrey-1.36 at boromir; Tue, 16 May 2023 17:59:21 AEST
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL7tK6KqNz3bcv
	for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 17:59:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1684223401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qKHuxejJ0gYscGISO/Lzq18vk4+b4iOzo6srIsttI8Q=;
	b=DPG9ROIGCjLeyrplpljQ4YAX1l0ZnPhORRJ6fpBTYqXuRjfrN8DM4fxvjte0yqxnczjIre
	2UoUOZOUT6GyFMCi49aKlcljzWX7TgGQh9b8fIVGaCwOA5NJG/CI+PCaI8981caXsONPm/
	TkmO2iMhrGoY8qk+QXngBmMa2AAuLu0=
Message-ID: <ba2c8adf84ed0ae7036873064871b7a17494f2e1.camel@crapouillou.net>
Subject: Re: [PATCH v4 5/7] pinctrl: ingenic: relax return value check for
 IRQ get
From: Paul Cercueil <paul@crapouillou.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen
	 <matti.vaittinen@fi.rohmeurope.com>
Date: Tue, 16 May 2023 09:49:58 +0200
In-Reply-To: <17d04e9b7d76fbc0804dde8e1c4a429d7f19de80.1684220962.git.mazziesaccount@gmail.com>
References: <cover.1684220962.git.mazziesaccount@gmail.com>
	 <17d04e9b7d76fbc0804dde8e1c4a429d7f19de80.1684220962.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-mips@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Daniel Scally <djrscally@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, Marcin Wojtas <mw@semihalf.com>, Akhil R <akhilrajeev@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jonathan Cameron 
 <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Matti,

Le mardi 16 mai 2023 =C3=A0 10:13 +0300, Matti Vaittinen a =C3=A9crit=C2=A0=
:
> fwnode_irq_get[_byname]() were changed to not return 0 anymore.
>=20
> Drop check for return value 0.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>=20
> ---
>=20
> The first patch of the series changes the fwnode_irq_get() so this
> depends
> on the first patch of the series and should not be applied alone.
> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 2f220a47b749..86e71ad703a5 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -4201,8 +4201,6 @@ static int __init ingenic_gpio_probe(struct
> ingenic_pinctrl *jzpc,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D fwnode_irq_get(fw=
node, 0);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err < 0)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return err;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!err)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -EINVAL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0jzgc->irq =3D err;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0girq =3D &jzgc->gc.irq;
> --=20
> 2.40.1
>=20
>=20

