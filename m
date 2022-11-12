Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D74F626B92
	for <lists+openbmc@lfdr.de>; Sat, 12 Nov 2022 21:28:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N8nG35X45z3cJY
	for <lists+openbmc@lfdr.de>; Sun, 13 Nov 2022 07:28:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mJIsCmSj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mJIsCmSj;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N8nFP0C3lz3cHF
	for <openbmc@lists.ozlabs.org>; Sun, 13 Nov 2022 07:27:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 08476B80AEE;
	Sat, 12 Nov 2022 20:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B00C433C1;
	Sat, 12 Nov 2022 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668284865;
	bh=qIBLf/JA6a5lFjnekdMjenQSoI1RAJTDYrJXEqDAAEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJIsCmSjOwb6OqrLO8zMdVtAMFrIBs5PUZ7zen97OjLhozvFBegf9lUFOiui/3hT+
	 Hv1SPGgGq9nar+4AaxeV/zJoSESQ2GA11q9HfzYPieqEnGQfykzAVpT7KMGpAUpGvV
	 9swxaAiQvGttYXkhFlGx/jrxDH2tBy7QwKjMhve4julGkHyU95rINf9nNWLvcr6j7O
	 5Olf5U5YEcK3SfdppYKzw6r+QhWNEpRmyqRuvMR1rJCaFHJ33i/p+D/Shuz/0xYjoq
	 Z7lh6K8ju59Tv0WuH1CX5Q5Br1y7Msx0buCNXL9sjdfLV/9cPetGdjLiRMqC8rbYXB
	 YbTpcFo8+ftnA==
Date: Sat, 12 Nov 2022 21:27:42 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Yuan Can <yuancan@huawei.com>
Subject: Re: [PATCH] i2c: npcm7xx: Fix error handling in npcm_i2c_init()
Message-ID: <Y3ABviGqOD52gEAC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Yuan Can <yuancan@huawei.com>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com,
	andriy.shevchenko@linux.intel.com, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org
References: <20221109112250.124829-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iGjdv8VDVEVYoVbT"
Content-Disposition: inline
In-Reply-To: <20221109112250.124829-1-yuancan@huawei.com>
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--iGjdv8VDVEVYoVbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2022 at 11:22:50AM +0000, Yuan Can wrote:
> A problem about i2c-npcm7xx create debugfs failed is triggered with the
> following log given:
>=20
>  [  173.827310] debugfs: Directory 'npcm_i2c' with parent '/' already pre=
sent!
>=20
> The reason is that npcm_i2c_init() returns platform_driver_register()
> directly without checking its return value, if platform_driver_register()
> failed, it returns without destroy the newly created debugfs, resulting
> the debugfs of npcm_i2c can never be created later.
>=20
>  npcm_i2c_init()
>    debugfs_create_dir() # create debugfs directory
>    platform_driver_register()
>      driver_register()
>        bus_add_driver()
>          priv =3D kzalloc(...) # OOM happened
>    # return without destroy debugfs directory
>=20
> Fix by removing debugfs when platform_driver_register() returns error.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Applied to for-current, thanks!


--iGjdv8VDVEVYoVbT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNwAb4ACgkQFA3kzBSg
KbYNhg//a/yY8ShxwFy/VziW+s6OFkkpX8yI2FsohwhfES5DNQBZFNE4QP6VRCYG
eWi3KEWLh4zS8mfFtp/9YUoc0TYkP3w+jKfVzFsTBneBTu61bKD4g9JYfC2BypV8
slTidPeCKCf1XYZ1lipT71KN77pQzCaC5ByiuysEI2TJ52IOUyyL6yuXPxH8QTGH
iJ1UJlad+nH92FNFPdac69OslSo+VEDhWYLw+zfsUo5z1LRKMedTpUj40ih9Ltlt
/BkBPi+KW9k1f7jOQiCAp9wAWxTaBbC60t2UFY87uF7Blbuuu19hs/egWWG6ED8Q
Dhn4HRhzDu/eyHfOJ2p+BBbWUkcSJvhgAwT8NWUPN73uevOBRnS70O0teUx5+s3b
qMaiK3LVtxIIYHkLHCYY5GbEOrCQLmdRpOj9pVhMezlW3PAYUDuXBHl9gszFi+Ho
JG2uVezTLWjNjNnWD9kF4cRGLDONmGViq34TREA6btK8CKoqxlCLmbZCyDnX+ThQ
vklGXu2R7jR988IL8GcgGA/ib22Dq1xMY14yOoW8rdY4XITT/2sRTua8wpOSAY6W
xxMz7hh+/rBlobgR7mG4K8UswiSZ78NHhUk4CdSELmUT1WsN/pa1i+0pbnd3sWQ+
sPxnQsai3ZYhg4AuEZjOLuDjsfrUrhKHsNpz/TAqpIaECL6JJOM=
=ZkMX
-----END PGP SIGNATURE-----

--iGjdv8VDVEVYoVbT--
