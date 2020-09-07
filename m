Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E370E25F2FE
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 08:08:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlHs10pBxzDqPf
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 16:08:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=L705h4Ju; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlHrB0xpCzDqKW
 for <openbmc@lists.ozlabs.org>; Mon,  7 Sep 2020 16:07:37 +1000 (AEST)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C429D20796;
 Mon,  7 Sep 2020 06:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599458854;
 bh=42wmz1tNUoc8rMX4UkRPfnr1oWjTPa9W6uMU998imG4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L705h4JuI2ZUeoBIT8VwRj5QgJWuYDMrhAi5MzIn3x2cNLw+roON/1kqMeQHWbcz0
 z/LqwBn77XIqTFmrYZYIYGugl5hBlTbHZdoycTvPY9Af6BovqpMaif4i+ZNKvsGo8z
 rL4nM9UHlgs0z4yUVcUs5jHWO8m+ZHbWAHXPY6vc=
From: Felipe Balbi <balbi@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Cristian
 Birsan <cristian.birsan@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin
 Fair <benjaminfair@google.com>, Alan Stern <stern@rowland.harvard.edu>,
 Tony Prisk <linux@prisktech.co.nz>, Bin Liu <b-liu@ti.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH 14/20] usb/phy: mxs-usb: Use pm_ptr() macro
In-Reply-To: <20200903112554.34263-15-paul@crapouillou.net>
References: <20200903112554.34263-1-paul@crapouillou.net>
 <20200903112554.34263-15-paul@crapouillou.net>
Date: Mon, 07 Sep 2020 09:07:24 +0300
Message-ID: <87sgbu15nn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
Cc: Paul Cercueil <paul@crapouillou.net>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Paul Cercueil <paul@crapouillou.net> writes:

> Use the newly introduced pm_ptr() macro, and mark the suspend/resume
> functions __maybe_unused. These functions can then be moved outside the
> CONFIG_PM_SUSPEND block, and the compiler can then process them and
> detect build failures independently of the config. If unused, they will
> simply be discarded by the compiler.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9VzhwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQa/Gg//bd3IcQSisxN9NwJ0buGWxN2zcQEzeylT
kwICmOS/yflI8+18moVfFWWA0Xsofz67WiemzxLSWBCtZ7tlrtZQOK4YM64qTqLK
fbbbUHwPxR0kwzLkJvXDohgFWMGuqf24ym6l6xCBAFh8AhNoR3ZtS9DNfz4tC3Po
hJ+Th9JUQu9HOc4dfBt1ftdbZNafnb8Fhs5Rr+93foHUVQbnbYbsDoOr0kG7n47q
oyUKuyf6lJjYFbverN6N86CkFenRAkIhERHY+FDmmjbnoVo8QbQiQ537+rHDrY6t
qf5K6NuSZpVOylau8GLJiTJBqDQWYUJnRTgqD3Egdkp8wkygAZS+dP8Y+eAMKzKx
+kz/MS9v5t2Kf7FTRdGD1ylfd27Fx14NxNBp485018lup1y0tYsYTOeXshKl1x8j
L5fs01r2IC9lB+WgRiL+8wRgyPOjNux28aklk+XiTIslaFHW66ShgW+41dvWo9ip
62gdC8FAjjDxOVEBW3/OH0ukI/mPOstXUYXxJNdCcCS5RKBC7H654viXhPHLbXpk
i3EOA2LLRipFSwnAbVZokJ9/7ga+4fLJ4LovreKb7VjBfSksaJRREVzNkpo/GAgN
eKevHXu324UpIBWdo2uM1DO7wxsNVzIStWqZvL9wtFnycDfG1PQblP1zpzBBBR1h
q8e02bA+PtY=
=6T5m
-----END PGP SIGNATURE-----
--=-=-=--
