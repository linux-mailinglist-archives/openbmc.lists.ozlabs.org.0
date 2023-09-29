Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2F7B2D23
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 09:40:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EEV1O/Or;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rxj1g6Lfvz3dDN
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 17:40:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EEV1O/Or;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rxj0w4cpdz3cnP;
	Fri, 29 Sep 2023 17:39:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A0DDFCE224E;
	Fri, 29 Sep 2023 07:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527F2C433C8;
	Fri, 29 Sep 2023 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695973180;
	bh=yAYLz3ukdJtNvf42OO+RRKZ3YtBH+Khh5W18AjODGKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEV1O/OrowYxwsT7xTRih0qWIX7q1hjm5Ayp0pZO2vP6t9NZEYYSn2dIQZjBhoMyZ
	 YR49YoxePkb2gTXXgMb9TzBuAX6wuNqtQXG1Ye1TyTwuHU695VfqN97JaLxmBFmPBt
	 RtWcF3OkpBUAkeMc0TxS4r/iQBQSTD1cC61qFiXVg1d2ONNtYhZ5BeANSPE4/btAux
	 TVQCkjxUVDkfDThiGACVsn9i2umC77hcIrAWiuaIaZ8LYm1ZUd67fUVWIiIIm3lZj+
	 Uv7JhPU9Pp0RP15drIFjgKE4x2m8UhG2pKklx1E2DHGSZvG2bGG4RiCYjdHOuhDeLK
	 y8m6T9k/g4V+w==
Date: Fri, 29 Sep 2023 09:39:37 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Subject: Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
Message-ID: <ZRZ/ObZmntMLw2r+@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jian Zhang <zhangjian.3032@bytedance.com>,
	brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au,
	andrew@aj.id.au, zhangjian3032@gmail.com, yulei.sh@bytedance.com,
	xiexinnan@bytedance.com, Andi Shyti <andi.shyti@kernel.org>,
	Tommy Huang <tommy_huang@aspeedtech.com>,
	"open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+myms6uqEERuj8CP"
Content-Disposition: inline
In-Reply-To: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, Tommy Huang <tommy_huang@aspeedtech.com>, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, brendan.higgins@linux.dev, joel@jms.id.au, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--+myms6uqEERuj8CP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> as a slave, a situation arises where the master sends a START signal
> without the accompanying STOP signal. This action results in a
> persistent I2C bus timeout. The core issue stems from the fact that
> the i2c controller remains in a slave read state without a timeout
> mechanism. As a consequence, the bus perpetually experiences timeouts.
>=20
> In this case, the i2c bus will be reset, but the slave_state reset is
> missing.
>=20
> Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout =
occurs")
> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>

Somebody wants to add tags here? I think it should go to my pull request
this week.


--+myms6uqEERuj8CP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUWfzkACgkQFA3kzBSg
KbaStw/+P9lKIzk5K+HPzW686R3QSD4c9L86eK6C7qSbz3dR8WCLARees+FPn7KK
SLQxjQzUToKNe8bfW9QnSs65v0koPIADF83FOloDj9+0R3+mbsqVohFn7wcPM5t4
NtAzODYxDYOCQP84m25UZC5A+G7zDXxqHM0gE5Y+cbptMCaSVyzRK4/1gBIeuos/
H++dJ0wJ86ozY69MUjCNA0lQPGooZKiuZ81F9NaGRx6yxHO0aKI6ZLkLHpZ/c2G1
mNbtgy2zR1UbahtKUHmfwmT8XuCOOlpTVCnMfjXl1BaElI4unm3F52ZvaHg375eq
7IDpAO5QC4LNEQEmDE90OgvLa3eS4SvEkHeZ4wgr/iTiBicMrqEYATxka4mnjdfV
EyDQIIWgMMaZqpsf0ngjN978y32byRy+IiN47aY2Cn7IeXJxruZ76Cqj6T9Pq4bb
Zeqe/xs5Zt2B2wRsxD/fLSbls6gxHRR8yn0mBZD4XgcCxxsxllP5yQ0pukP13v8F
WPHGoob7CewyIijzwuI64R0I1dkBRecC7WkD2eRnzL0o33N7ct3VY62qgFX2xmIS
AG39798UYyZ/Mecx/hp4/mMnOhXgcPPyYgbmqu9+MGNEG03eHsGumshUOxQIRSnI
d9q4OxxEDFTj3/tEMhEtYDkwKnIwEkAnvKYQGmhfYMZOUXFGBII=
=00HN
-----END PGP SIGNATURE-----

--+myms6uqEERuj8CP--
