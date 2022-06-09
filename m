Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E154460B
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 10:38:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJcvK6fXsz3blV
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 18:38:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rn8tuogv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rn8tuogv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJctx21rKz30D8
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 18:38:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F3426173A;
	Thu,  9 Jun 2022 08:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D254DC34114;
	Thu,  9 Jun 2022 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654763909;
	bh=rqdfJh6xPKhl8T+EneX0C8sQ9ZT1h27ePNG036/Imb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rn8tuogvppo6Sr42DVEuylyvO5K/d5ffaKvWL5+6xzgrjfovejum42P7zcpQQz3FR
	 qE5B00wIiNiesDik4Kv4wVqEpKrfKBK2TfqDqkZ2mOagyB8pawxpVXVKJsCygv96Cn
	 CC0G33ljHJj41SRY7vvYVqebJjap7+HMyur2V8jh8pE9jAmBUH5JtYR3K+bhZMUl/T
	 bIKQCT3oi5mTKDSS3zfnt0Y0sG8mJ14cgUjxhntiN8ZBXEUDmr2Y7S6CUJkt2Ko1JP
	 rbP+n55omhXWeNn+pOWpR7o/uLuex9O+kunkxoP02UbGEc8wklLfWkOEb3l0quOJCo
	 rfbnPjkQTZ1nw==
Date: Thu, 9 Jun 2022 10:38:24 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: Re: [PATCH] i2c: npcm7xx: barco-p50-gpio: Add check for
 platform_driver_register
Message-ID: <YqGxgAHzV7CvtD2c@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220609081409.3582764-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PpyMwTpO/hHIKfHN"
Content-Disposition: inline
In-Reply-To: <20220609081409.3582764-1-jiasheng@iscas.ac.cn>
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-i2c@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--PpyMwTpO/hHIKfHN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sorry, that's my fault.
> The title should be "i2c: npcm7xx: Add check for platform_driver_register".
> Need I submit a v2 to change the patch?

Not needed, I already fixed it.


--PpyMwTpO/hHIKfHN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhsX0ACgkQFA3kzBSg
KbZNzBAAtKYEtrKIxNiPg7VFv4K3pDVav17+5g9+noHxUKtfb5O8MTOSwfKWHhis
let+U5P3BTw89Sm+uMb6rKig2uTnjgblwWY+mhnkWVEZqfmiVQqExQKHN9tN9RK2
AdEIm2KrGZQMlDpiiBIT/uo8fltbP3+vfcDz6FhuHNEoYq/nv5oluIlFmz2PtQop
JQDvpF20Xv49PhqDaAO7Lma+mVZpaq/q8WUlqVaIGFEoIaZWQ2HlY+3/d4DxB0Ty
sNapLXz2SLca05mnbKVAeqTuHTx5bI1Emsh2z4AiwoZAEVE96hSch+BRd6+OIsE7
G38VibJk9drZVp/kBWyz/VQUS7ovCPbeKpsAlGOLPvGhZ3ZTOYBoJ7lkx8oY7hwu
bIRyMcD07AFhrJEMrqjy7reycaQgYVTg0K65URDF5pBD28oA3zgqdQQpoNGVtCg2
Q48k1ZySJ1cSxC3UI6tbHWT35k5H/putGMuOSf0hVkcX1tNgZmfq3BgGgFQIP+P/
8WvaYnQWePjrZAdcJvooIaRaTq52x2UhjHbR+lvJDdvY86FZULap6SMH1RYs/ixL
TrdOJXM150ByyiKfE/ASZ8gNmjEF18cuOUQGqqBVTAmPG38LwHIzYihM+iYpHNT6
0CMY6je5CGFE/dj0J7mBNdY2OmEknYAgx+Nt4xeVYycaEYkClvg=
=ZuEt
-----END PGP SIGNATURE-----

--PpyMwTpO/hHIKfHN--
