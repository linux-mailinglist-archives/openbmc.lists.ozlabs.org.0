Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81609462070
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 20:27:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2wNJ2ffdz308v
	for <lists+openbmc@lfdr.de>; Tue, 30 Nov 2021 06:27:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZZrHcQYu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZZrHcQYu; 
 dkim-atps=neutral
X-Greylist: delayed 396 seconds by postgrey-1.36 at boromir;
 Tue, 30 Nov 2021 06:27:06 AEDT
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2wMt3cbPz306R;
 Tue, 30 Nov 2021 06:27:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A4122CE13D8;
 Mon, 29 Nov 2021 19:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3847C53FC7;
 Mon, 29 Nov 2021 19:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638213623;
 bh=g/nsYskIq0J2gIpANu+wdPav06i49Mv0L127LqeWDic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZZrHcQYuIz2+z6eGi7PKmEwwhGdcpFmkHNkAtnlOxfYSQqQIiZXQV3n/Zxexl1Sne
 LGEaInfaa0NcDRMmyel5OApl5FeUuMg9RenyiQ515L9vJ4pat2aNNkBeZYmcQZJWH9
 BjOzWz3sACWFtEqYz88K1XcKZ7nWgsn+P8gttjAylwKBkTPLbLuRTwtEIhZXsqAamJ
 a23yF2v3+M+z8O4cz2fK0T+/Gpr2DUKiRtx+PGgh5LmqNYhfVKcmYHIDX4KnUw7zMn
 rOUo06+MlC1ypTvTriX/NCB48pFT0uKtFFkOQ3RAWEMOKMOnvTN4YTafK5mDkONbeN
 TEQ9TUa3ZJJ2w==
Date: Mon, 29 Nov 2021 20:20:20 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 0/2] i2c: aspeed: Late ack Tx done irqs and fix
 unhandled Tx done with NAK
Message-ID: <YaUn9HO4STM+LmAD@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20210616031046.2317-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hSONgx73KSpSsJcS"
Content-Disposition: inline
In-Reply-To: <20210616031046.2317-1-quan@os.amperecomputing.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--hSONgx73KSpSsJcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 10:10:44AM +0700, Quan Nguyen wrote:
> This series consists of two patches to fix the below issues observed
> when testing with slave mode:
>   + Unhandled Tx done with NAK
>   + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
>   read request".
>=20

aspeed maintainers, are you happy with this series now?

> v2:
>   + Split these patches to separate series [Joel]
>   + Added the Fixes lines [Joel]
>   + Fixed multiline comment [Joel]
>   + Refactor irq clearing code [Joel, Guenter]
>   + Revised commit message [Joel, Quan]
>=20
> v1:
>   + These patches are first introduced in
>   https://lkml.org/lkml/2021/5/19/205
>=20
> Quan Nguyen (2):
>   i2c: aspeed: Fix unhandled Tx done with NAK
>   i2c: aspeed: Acknowledge Tx done with and without ACK irq late
>=20
>  drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>=20
> --=20
> 2.28.0
>=20

--hSONgx73KSpSsJcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlJ/QACgkQFA3kzBSg
KbZoxg/+Me1R4XCxqO4t3nohVs8D4zoBBn+b2tQCtqhHNlmbD8hVLPiWu3vfwu3f
xLDMgOHONd6/rxrw5N2bN8t1oX0AXz2yhxMeVYKgO3jm3AIFuf6bQiqNgBEw009r
V0NgFmKmN7VkkA3AX5tZKb67P9MSMoVTmWPteZtSzvbphyZr74U8Gv4XpaX1X6ep
QuQXO3LGvHEJ+WDF5T38eXR1lXZZFTraGqkPmmslFiNOX00XCw5w3zv0PKg8oO4a
7HRqAxvFiWOw+MD29hkSop+Pjt8G8heq+ZUyIFuBJ6VKLWgCtuaBVnR9B4KlSo1U
r96yEHx7zrGx8BMMjp/39Ds3oJzkjQR/LzVMy/DAwb8FO0YtELsMJkg1n18r/BFt
a1ezWd28jFfuVJVTtE5CKZBgPT0wSq4738L236sENmfC0Lo5Zjd3p8miJCnZnlXz
ePc0fL6PjdJCTNZIlM21mBNvNUWiSW+zsF2+ASJDIwFUVbEaBdvt0k4fSW5GoSX0
ribRkt2str4gFtyg+s+19mnb8UHZlQnpQunHqpXiaO93iPGqATZFKpwhCG77qJO3
ifsYMJ+Cui4uPv9xZcTqRJmeqP9ElqYzCz6YVq0EDcLaKaBYfESu0pu1NKTsohB6
JNJlXes7kqTsu0l4dxspbwNwAGiUe8pk+Vfirn6kM41SUNxKaEE=
=MdjE
-----END PGP SIGNATURE-----

--hSONgx73KSpSsJcS--
