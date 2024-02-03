Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3BC8488C1
	for <lists+openbmc@lfdr.de>; Sat,  3 Feb 2024 21:45:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uAvlptMw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TS4Qk4mpqz3c9y
	for <lists+openbmc@lfdr.de>; Sun,  4 Feb 2024 07:45:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uAvlptMw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TS4Q76B9fz3bnx
	for <openbmc@lists.ozlabs.org>; Sun,  4 Feb 2024 07:44:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2A934CE093A;
	Sat,  3 Feb 2024 20:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CB5C433C7;
	Sat,  3 Feb 2024 20:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706993084;
	bh=x/oqty0khXvRPmeM2qld9ejEfXUIdA5TFFykrWN2wRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAvlptMwBN8IRS1KUwxHSKLksiK2lRlKumrYzNBRolXCz4OPWO2JWGwRIlZSwLJa4
	 CYgCsVYcaqNFTJtfPOHut6MdQjq0Ww6C/aPKmk395M2e7xKPYmFGWlOClv5LuwWNKA
	 1eUL5MTDJVi+S7/3zVRlb/JQ7Syo7Cr2BkjjuhAii985cdnoRaU4KL4+koQuMR+dAZ
	 fPlo/yrNQ9qJ+mtrioHuOS/MHE1MLBLbhlIo7UQp32ol4Ft+yf9GB3XyYvDuMZD3/O
	 wU/+rF+PftYAu3oRasyvGDmNEJNxILk10SEIoCuzUDkcBquvKlKsm0OA0zagKyE0Jx
	 gChlHBhYngANg==
Date: Sat, 3 Feb 2024 21:44:40 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Subject: Re: Re: [lvc-project] [PATCH] i2c: Fix NULL pointer dereference in
 npcm_i2c_reg_slave
Message-ID: <Zb6luAVHcnX2fXz3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Tali Perry <tali.perry1@gmail.com>,
	Rand Deeb <rand.sec96@gmail.com>, lvc-project@linuxtesting.org,
	voskresenski.stanislav@confident.ru,
	Benjamin Fair <benjaminfair@google.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Nancy Yuen <yuenn@google.com>,
	linux-i2c@vger.kernel.org, deeb.rand@confident.ru,
	Tomer Maimon <tmaimon77@gmail.com>
References: <20240109145121.8850-1-rand.sec96@gmail.com>
 <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
 <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4qMMyxx03EcHjoHW"
Content-Disposition: inline
In-Reply-To: <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru>
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
Cc: voskresenski.stanislav@confident.ru, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org, deeb.rand@confident.ru, Rand Deeb <rand.sec96@gmail.com>, lvc-project@linuxtesting.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--4qMMyxx03EcHjoHW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If I'm not missing something, npcm_i2c_reg_slave() is called via a
> function pointer ->reg_slave here [1]. And seems `client` can't be NULL
> there. Other drivers implementing ->reg_slave function don't check its
> argument.

Correct, we trust ourselves here.

> Maybe we should just drop `if (!bus->slave)` check?

Yes.


--4qMMyxx03EcHjoHW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+pbgACgkQFA3kzBSg
KbZ35BAAnKpAXvpH6l/0FPmAfClZMt4L47HMb59BDAJvcvRxKNRo+RZD9Q2Z42BD
Agz8OGyuvPVs29cZEmza509ZzTnBJRjfqHQssdFJpK8i+t0APRiLxAYDwsT1IdWb
s1zUCno2d8vlIQMRpP9558NcWCdQxGgBES4wqVtsYNMx54XuLIO3P4Hm1h4MU7fb
BQCmVccAIDmLAk8KTpHio7y6/00kfeqTAclqF0yVD8/71JAXR1bR6isDdKLMDMTs
xrEInejo4tj1FkJdCZV+nBk2bweVGRiW909UB/9hqMaKY54I7MKp4qludDsKEhTJ
8LWe2OlIsqvHYGOHGPHDA/HVQV4T3HcGGrVSdyQrbSTPBRsTg/EXNJ1s7mr18aB7
g+0QVQ32NO+Pi3otwTXvnu7tg7u9Xae4v18fOdFiK/ezzFnxISZT7p+khMQdkcKv
y2ymfN0UD+JqVOs0dhielqZI8bt98MAy3ngZqTX3vKBejfmsgYO7kkJJiApr6h4B
n1KGg6tMb87K7S6lUlh4E0IFRtLzQDvDFnEDAH8uhjIcWVe8mLvVvdnYYYIpFP6N
KrYZEUCBfgmlHyuBYW1vtFMwy28oKhND0v4aCbk9DChb6H+b4WwQE9teTXdQKTfy
07gyCLvRK0eLCbYJFSQHvnK5q9Giv7Moy+h8Z77VRMypA56VwfU=
=oFAy
-----END PGP SIGNATURE-----

--4qMMyxx03EcHjoHW--
