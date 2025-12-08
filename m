Return-Path: <openbmc+bounces-982-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD1ACAE64E
	for <lists+openbmc@lfdr.de>; Tue, 09 Dec 2025 00:16:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQHsk56Dqz2xqf;
	Tue, 09 Dec 2025 10:16:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.233.101.22
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765218249;
	cv=none; b=WWiSdfSXH/UbbQd7TOrxukFmXgXevTWqoIxjeaVT+iuqi+m2/ZwW73qeu0N79oJC7LI5Ly8DFzHpEQtOSRnZR3v0rjwL1RP9+Eiu7PSonjb4qtyKljUlKFQDRCqeTw98PydGq7XKsU6VfZLa61X/nNqmjaK5O8ZBZkHeNGSeb20+TNwHMwMmtd2npki7dF+enK15BN1MSWjlPyTu5NEgg0rHXO8dGP43eQN6CeInK4RKTjxNbiWWhug0ZjEq8MfIZAPKdcuCbzqMPGIbXBCMKHkAxISGHsguobFUGpUdFpHUalFYhzgN2xzNj+DAud+tCbSec2V4/I4scT7BI+acRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765218249; c=relaxed/relaxed;
	bh=22yBtqajb8EKYr1HfLXA4Hs90TWYxmKi/30Koi0Li3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERAVS3ITZynBXStxKApJSomjCzQwFOFBUXnWIC8uUCaILQ8FnUO+5QzpA4Sao/CproWXP6ZDKz3u609ycd2epHIM0xhO+VAqvHOGMUyX68kuvHSeLkne5td2fKtfp0W/i4SSEelZ/U6NFQleim5x4l3WfrNTqtN+0KedR57oKFbHiA1Dy9savPIgaZEsvHJs0R2IL1AaXi6RnkpTfYF4owfAQkKZ5npogBuin4ipy/NG01IvAExazzopo6v0ddCy+/6ER5URdg07KNrht0NhYrksEgvtQpyg2tM1NmqvDBngLdPAPoV32f5cNzFy5ly/Spp7qFTCrIE30VTyfog3Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass (client-ip=185.233.101.22; helo=leonov.paulk.fr; envelope-from=paulk@sys-base.io; receiver=lists.ozlabs.org) smtp.mailfrom=sys-base.io
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sys-base.io (client-ip=185.233.101.22; helo=leonov.paulk.fr; envelope-from=paulk@sys-base.io; receiver=lists.ozlabs.org)
X-Greylist: delayed 584 seconds by postgrey-1.37 at boromir; Tue, 09 Dec 2025 05:24:07 AEDT
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ9Nl5mqZz2xFS
	for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 05:24:07 +1100 (AEDT)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 54A7B1F8005D
	for <openbmc@lists.ozlabs.org>; Mon,  8 Dec 2025 18:13:58 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7BAEBB121CB; Mon,  8 Dec 2025 18:13:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 74EE8B121BB;
	Mon,  8 Dec 2025 18:13:53 +0000 (UTC)
Date: Mon, 8 Dec 2025 19:13:50 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, andrew.jones@linux.dev,
	linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mips@vger.kernel.org, asahi@lists.linux.dev,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	chrome-platform@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-sh@vger.kernel.org, x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
Message-ID: <aTcVXrUXVsyjaT22@shepard>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z9eEZ2V8rb9VqsSG"
Content-Disposition: inline
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>


--z9eEZ2V8rb9VqsSG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=3D216748
>=20
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that we=
re noise).

[...]

> DRM_KMS_DMA_HELPER ---
> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER

For these two, the symbol was removed in commit
09717af7d13d63df141ae6e71686289989d17efd but these two drivers either were
missed by the batch rename or were introduced a bit later.

Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
drivers), it should be replaced with DRM_GEM_CMA_HELPER.

Are you expecting to craft a patch for fixing this or should I do it myself?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--z9eEZ2V8rb9VqsSG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmk3FV4ACgkQhP3B6o/u
lQxHMA/9EINPzAC/mNsqKqe+ejzVAFDvbkqgtj46jdHchIRyg5QqUNEoQvUKACwR
bZftHenlJS3ho4n0eejvmJG9LkV6HYA4X0vXrPKGJTBCMgy1CUl7j7v8ZFn7qhcc
KmyK3klG9hxRNAFrMTlxaE3uzNZWaZ56eEINuq5RkJWv5ieiadTkXR03L4x2l++z
B1RqTh3yh5d57Ckfs7lLGfmiDUQAkhdAm1CASv6bO1jKRiyhuSN95aOZFZ94DV+m
oV44vbSx4aXyh1lb07PxtPMa+WITGI6/mW0+TKhRNd0eAoO19K0zkSNA18KjgiOw
3m/4Vs1pdWSKCTDIgtcymufTpdjqWt5LEpxEuzLprgUXrpoQbS7paAfhB4Ex6yIR
CcQfarVp0SM0/OI5kZc40xoz6UEHrCjw7+loxHuUV+2KHAhfRlQhLcScrQXUO/X3
L2vzAFURuGyVpPbZnq2ftkMT4h6o+W93ZtKP8vIHJjDijdwM3NAt90FT9byKXAYP
AvVBPERmf9+savPI0eDYuO825wAcF3D2rvF4ZElPj4+OD6sq93Z52bDN3CUFHsMD
tKp3GKwBxZ0ENUxQZvrIINzLx40EXOq/MDI1JZd4Nl89W5BBk6QGIRE4hj0FNctf
+4gCjq9z339Ik0u6aVtzq/jdewPuTo2wZ5DVPxsH1RyPX2cBWAg=
=azY3
-----END PGP SIGNATURE-----

--z9eEZ2V8rb9VqsSG--

