Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD567FCBE
	for <lists+openbmc@lfdr.de>; Sun, 29 Jan 2023 05:37:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4JSC09lnz3bhx
	for <lists+openbmc@lfdr.de>; Sun, 29 Jan 2023 15:36:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=V2XUB/e8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=V2XUB/e8;
	dkim-atps=neutral
X-Greylist: delayed 335 seconds by postgrey-1.36 at boromir; Sun, 29 Jan 2023 15:36:25 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4JRY1l36z3bhx
	for <openbmc@lists.ozlabs.org>; Sun, 29 Jan 2023 15:36:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1674966974; bh=2oY9+vEjQVKgGXNs7di0tfK+ZaWMzVuGiWD8inZ5rTY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V2XUB/e8jjKUz/2YuDXeSDWj6SryLVEuM5/DQKCvMQrd9Jvhw//t7uZgY4fBVc7vp
	 gLIvVPsypejL8NtaXck52r7CcmArHasY+h9/0hm/xXcmbz4K4OAl6zUEwcpkPSl/co
	 3sHUTBvxg95pTgV9hoCUicNBZrsKMbpSuaYyh+0tnH2DCAlyd2JUBiDNPdHtZXY7O4
	 +uu9vjSuQ5mOdaMEe2/DkS8P8MZC2XdM27eB2wlCubpQf5aQVkj0GsGnPxMoezSvlV
	 yTJTOqg2sQLqx0EJHo0hRr24vPN4j+TF1WYDyyl8PvYuuperhUgEWdicYoWL+/67xK
	 E9JfeEf5xresg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsjH-1p59P11Hjh-00LDUz; Sun, 29
 Jan 2023 05:30:14 +0100
Date: Sun, 29 Jan 2023 05:30:10 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v4] ARM: Add wpcm450_defconfig for Nuvoton WPCM450
Message-ID: <Y9X2Ur6oHTsFtCmW@probook>
References: <20230129041547.942335-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mrgSoAscP93Rd3cj"
Content-Disposition: inline
In-Reply-To: <20230129041547.942335-1-j.neuschaefer@gmx.net>
X-Provags-ID: V03:K1:XRzcDZoEzXh9V3LG35lDY5DBVCh1R2Im/UHyEglDLr5dYRZ7e3D
 0GXMWuYKavtpYBjBTvq6gTjPk+Xh7OVqQtPHkbJ1pqnYiBL/w/o+UG1F1rf1iTxoErIAWXW
 TXoWV6X509LulYhvJQRDsxYpIcb5REZc1aG1Z6OVdEHOUk6hf5iUyRbrk+TZ6GuRUjZ5tqa
 +ENCC6ZOTX1BtUXHuke9w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xyGLg0iyY3I=;z1g5yfObbSvzR6F6FsY5T/mMxmX
 pcA+YY+kVTfWZ+E0SLqY90LEBV5mKH8jaZm+Cmuv6FP2E8D2CeC/Dwdqns7denuLt7N0Yv7oa
 k0TKLsNi0LwPivbCPKSmvNa2jpxCBdXifHa93kjWnKAeBMYUj0EEgtKDbgAnbobMNMBsRaaA/
 jkNq+hKJHKkawESesLaEYz6zJXfxRkWfXktmrqDGcJoR1Hl6gw199j1UWZiKxX17psDSCxDlS
 lZTFABYMj5Oty6+m8Sf7NJEWUMm4PF5tnUA7whtd75bsotrGDVD0YdfHFzL5Rzm5jbAM5rG9T
 PdjxGtxr74micnyq9ftDa+czfmc7EXOClicUoZyRek4KU+cizYOmh72r7kXDpYBbKehwE66YK
 l7LJcvK5Wgj4x/3UnvPxC2AMEWLxQ2jQxdPd3abb2dA45WNIhlspdOUDtBotr+szh4Kenuzu2
 i8H3P9Bc6HIUGAJCx4UyZVVba/qvOrElKtQbBzq+RzUbiSvXthyLT2YqwWkRvmsQM2O8fGGih
 InTJa8Fu8O/ybOgwFBCbwUJ0WRwE4/byLTvan/fCs9CE+Sg782psrnx7ay74T36u2Z9Ofc2Ea
 y8BOORdYfivFEjP8yOdF9KTmnD/nQYKmc/YPtB0wzLPFaTCiE6izDrGIlYd2drVkg0Cz8CRa9
 uL9xAZHKZORyBm+qu6uMMoJ756wRopq558hXDwQJ8k3tD8z1M3Uj7lDPNOdZaAj6GI25uBO5S
 35+CXDe3BzGbUiHYnhx6+ozxDJ1uzd39D2O4lp8C3m5KE1qX/1peA5L/X7sPIdLl4Kd0p2ro9
 a7WoQr6rJ7RKPdffgaggpyRD3Q2CX+ojF8QLvfKScGqeJX3W8fbnWIzJRwvYMwhExTTJ+i4pl
 rVU5TTbl3VGEkoNr9hhB2+CUHlBp3ilLd2aL0bqbc9zvP7h4wpZ8Pw6k3SoV6ovFDcECayWwi
 ztRNJyg1ITwuQ6guwvZLy5IzmTA=
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--mrgSoAscP93Rd3cj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2023 at 05:15:46AM +0100, Jonathan Neusch=C3=A4fer wrote:
> This defconfig aims to offer a reasonable set of defaults for all
> systems running on a Nuvoton WPCM450 chip.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---

Sorry, I hadn't noticed that v3 already made it into linux-next.

@Joel: I'll leave it up to you to decide whether you keep v3 or replace
it with v4 (although given the upcoming merge window, I guess keeping v3
is safer).


Best regards,
Jonathan

> v4:
> - Add Joel's R-b
> - Disable CPU_FREQ
> - Update for Linux 6.2: Enable CONFIG_SPI_WPCM_FIU, disable
>   CONFIG_LEGACY_TIOCSTI
> - Disable CONFIG_KEXEC, which isn't generally useful for the BMC usecase
>=20
> v3:
> - https://lore.kernel.org/lkml/20221101112134.673869-1-j.neuschaefer@gmx.=
net/
> - Regenerate for 6.1-rc1 and enable a few Nuvoton-specific options as
>   well as the PECI subsystem
>=20
> v2:
> - Regenerate for 5.19-rc1
> ---
>  MAINTAINERS                        |   1 +
>  arch/arm/configs/wpcm450_defconfig | 211 +++++++++++++++++++++++++++++
>  2 files changed, 212 insertions(+)
>  create mode 100644 arch/arm/configs/wpcm450_defconfig
[...]

--mrgSoAscP93Rd3cj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmPV9ikACgkQCDBEmo7z
X9vXWQ/+Ov8IS5JDDJmGLN3jT4vCLiqYEzQDg8K2iagvlwgbZcbHUFAPbANFt4qD
kG5HH2QDOZhrUg9WwnbVs7hsEFaCxNcl3G7fVfEb6LZMbw2iEoh154sxIu3vbnzj
HQBJACyvIfIKnAvgOUah2J9GhbS5iA75OouZsfOhLiDjTVPNLzpGmR8D4RmIk9xL
1rzCSCxkYxJZTJGV9n0yZDTgXU+9mvxkPPqGo4Wgzte99NP4KRa5kJ5YMrybR/D7
h8Q9RM/Dff6v1g1DawqINPU+sEdqKB4uqpK6uPF1ToKYDyvOq4yZ3J6Jzjq5Y9xm
WzN3/O2WvJriRJ8bHG88SSprcP9d9qsAZjNzkqgj2bc5zrfncP2b57zntCBjL3on
tV0wttFbqHsxCrJtppDraZBP0KqA5Az+VaTgIAzi8KkyQUXcd4F4zgrqp/6zd6hv
slnXe9/pLlVZ+mtSjzkXHBvsPj3ca9VGku1rMCNUo3ROSTiTIL7ZvmFU8Yu+QQCP
Hw4cvUFKLSXbwXP3ylkT2tc3X63Jm4M2Y8FEvHYEYBcvoaD+VVzV7P3luPElJwXA
S43cfTOPBnKqAYlBIknc0AySnXp1teizejV1tEPLh71PYlLPpCBiLlCWgloa7lis
nVyrnQzKgOk/6T9ACW081fB0akOkgRpii88qKZDQPQL/X2z2vwA=
=D2LN
-----END PGP SIGNATURE-----

--mrgSoAscP93Rd3cj--
