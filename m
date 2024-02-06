Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E430184BE55
	for <lists+openbmc@lfdr.de>; Tue,  6 Feb 2024 20:52:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kz7SoHQc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTv6h6SWfz3cN9
	for <lists+openbmc@lfdr.de>; Wed,  7 Feb 2024 06:52:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kz7SoHQc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTv652Ynrz2xTl
	for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2024 06:52:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CE7661519;
	Tue,  6 Feb 2024 19:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFA8C433C7;
	Tue,  6 Feb 2024 19:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707249130;
	bh=fZx4pRcUc3za8T9n9tUmT3V2JcZVmsY/cAiohlWM/TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kz7SoHQcZnrQNGofmOvgUq1NYXOKfi78ER9R7f1WE7u6k4TGOgErJiuHTjTMHtkU7
	 b0C5oOFjSIJyrUYNmL1vsAbCQg3in+MfyxWbWDKULEl5XPQA8FZuc14SJtuVUAXRct
	 19BbB8vq2Z4PnJOBUbmAkW/657abiTLSsVl3sc4JPJ475XPYjFxxdT8zoSvm6FlFHR
	 30zWR2Hy8HGTUto8eIH7I75P3KyZfPgI7L0eqNPe4qV5erhqMMBvvWEvyLaGXC9GSH
	 79YUXyWfieoPmuNt/Rwbx6029yURZl3XV+iJv7P3Y6XkoMQPaEDgcv+EFwajv19GwJ
	 5zS1nyNj+E4+A==
Date: Tue, 6 Feb 2024 20:52:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Rand Deeb <rand.sec96@gmail.com>
Subject: Re: [PATCH] i2c: Remove redundant comparison in npcm_i2c_reg_slave
Message-ID: <ZcKN5isE0B6q88Fa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Rand Deeb <rand.sec96@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	deeb.rand@confident.ru, lvc-project@linuxtesting.org,
	voskresenski.stanislav@confident.ru
References: <20240206194201.10054-1-rand.sec96@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/c+/7Pm9wtwRPq0h"
Content-Disposition: inline
In-Reply-To: <20240206194201.10054-1-rand.sec96@gmail.com>
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
Cc: lvc-project@linuxtesting.org, voskresenski.stanislav@confident.ru, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org, deeb.rand@confident.ru, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--/c+/7Pm9wtwRPq0h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 10:42:01PM +0300, Rand Deeb wrote:
> In the npcm_i2c_reg_slave() function, there was a redundant
> comparison that checked if 'bus->slave' was null immediately after
> assigning it the 'client' value. There were concerns about a
> potential null dereference because of `client->adapter`, but
> according to Wolfram Sang, "we trusted ourselves here" Therefore,
> this comparison is unnecessary.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Signed-off-by: Rand Deeb <rand.sec96@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--/c+/7Pm9wtwRPq0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXCjeIACgkQFA3kzBSg
Kba5Ow//TTSg9C/r5uHjS757qdLJr5CtKt2ZGXCoiBz/JxVUr5V6F2diEjjqizrC
p0ixL2q1MDpvF4ZUAgwnI+Ht+e71py3Sto8MlfPRWBchfP/ugE9ehK+RWyOho43x
xNlwQqtSOqQG7NtpfOtNSnYHNSYpeD4/giZToeL2mV5d2cXidxYLP1rinoYni4ec
ECqS1eLZV+8pxdkd5X3Im7ahFfPb1hkrWr3yajswDxLdIo8ImEuUiVUMoau5cYNp
4ukBDe76MAweDpwMg4EyIoax2AYRl2ULub227IH5usbOZ1gTIZvH3DeLd5CMrhFx
kvqElCljKdAWfIxytJvTmThl4rMmdxo0/Sa1k9Jv3Rzhu9V6tTdm+WrG7pst5Fjc
9wlwgfUsbMCMMGc3QAlP7WfG9g4w4MwUCZZ9DI2gdHQTz9//y41fvAz2TAXz2MBK
ka7UHwGziX1bhomFJO4jin5mKlPceC0TvEefn2zh0pMTSL7puN3S4yYp45x9cKkQ
cl7iRX2+Na582dlJJWq3YZRBFTzGgTup0vrKPZ+lOG0esgJjOQ73oJoq8YC9qlD9
8gCbxtYMqWvzM3vdyRpL/z0YqDjgfd/3IDgchMP3IhX2w5b3aAahj2Cnr8SdQrfV
vM64XBVkntSTZpWDWGAaYPbB4eeLtLhz7RTexwSAMPJxMn65uNw=
=Z6/z
-----END PGP SIGNATURE-----

--/c+/7Pm9wtwRPq0h--
