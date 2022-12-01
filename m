Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA763F721
	for <lists+openbmc@lfdr.de>; Thu,  1 Dec 2022 19:08:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNPFj17b8z3bYf
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 05:08:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=DzRIOOfL;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=nWB2+ohR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=DzRIOOfL;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=nWB2+ohR;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNPF23Q8Sz2xCd
	for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2022 05:07:49 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 29C485C005C;
	Thu,  1 Dec 2022 13:07:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 01 Dec 2022 13:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1669918065; x=1670004465; bh=7SSGPjpHlX
	Vfvzu7YRshvzoyKh1tvnp8YMuezGf2OvE=; b=DzRIOOfL9JNcsgVYVMrDS+pSS3
	E7dZC1AbznF6A9dLrz7+Nrykd6Ud9hVOk6Kwpgoua/G7B03FavFnPMGmgjihrs9I
	sSZMxNUw34yLjUUrRy/D27gr4BgowfQK+HoGA5B2r8tKt4Z/yqTolpwevPsrQVrr
	v5joBUR0lYOs1+fa3FclbYDkJxPixrLa8/s5MPNO3/Je8zPx51czsJIbQLXX5RGP
	0RMpx6HwGhd4uroeYfu5wXP2g8SxM/hTWaqBjJELlJA5V+8r2gfZaNsKSMVr1RXr
	aPuxpJBl6Ba2Ri+HnqcRFi8ycwB3qL1zGm6MDZj+X5m2uUoWqwn5ypb3ytpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669918065; x=1670004465; bh=7SSGPjpHlXVfvzu7YRshvzoyKh1t
	vnp8YMuezGf2OvE=; b=nWB2+ohREvu50fS0jd8FrD98uNEOaXURES+hjecAknTF
	R56nNPVBBDqs25N0iBs0BVn8ybrXMCCS8VJ0MASxzcdggZSvZx5j9j5vWwxJ4Wyo
	tiw6I9brE96Wt5zA1Gm9NLLpm/gifb+CaivM02KQGZCycEy98Kp26NqbiCmi3DbY
	ps8+vjxGf8ZfQeHZcRDJKTsUUOvEBsy3Mc1ZcrDukySwo7tD5enDLbSuOwFXgE4A
	2VLf3D01ky8e6DL+bRiVlA/ueR/hhvrtmE/P9mNtxYrfSS5m6OBvPgW659ui/dEp
	EaZwtJ9aAouXlYrHQbaEQCpF306qCYBg86kty4udow==
X-ME-Sender: <xms:cO2IY9X9JfvpDw0M5Ur6FvegAEwKda5pvDJ-Ty9aYUqbZfGXLEnRWQ>
    <xme:cO2IY9mNjA8hp8oK4H3slzbSTvc2nAgRgmT6qmkfncGZymmVFUjSzlyKo93nErJjO
    bCt04m3CnNlOT2Ou8s>
X-ME-Received: <xmr:cO2IY5aztc9X539BB0B2zAfvgwYpF_CRnyaixFqfeqE5kxOFqcaBZB23Wi9ENocmYCsdTjhiw9E_795eQa_n-BUpK6ZTJ24-KT8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeejjeetleehleeijedutddufffhueeufefhfeelheevgedviefgffehudelheelhfen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:cO2IYwWn4ZY21A-qpn0oHjR4qhN3Xnovh4HIQC7BnO9Gg9gJuAbNzQ>
    <xmx:cO2IY3lfAoXrf3SEjou465OXNdTscybmU8iAIIreO2Ln6WJitrtvqQ>
    <xmx:cO2IY9f4OzYj6bJTdOiN92yENVQHDfDqNk5L5Uu118qDcrZi9KS_-w>
    <xmx:ce2IY2tt8eeOvvb5HIGZkdxWXQ16PuCjQHTmSxaPI10UTz8MeZE5_A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 13:07:43 -0500 (EST)
Date: Thu, 1 Dec 2022 12:07:42 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Missing fan present object in fansensor (and expected usage of
 object manager)
Message-ID: <Y4jtbqORZxk3WLD3@heinlein.taila677.ts.net>
References: <CAGm54UFOHuVnC1ta1PPbr3TzS4SS4=nOQiHuJ65YbD_1WCD-Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EyEhpyZznkIaCE1a"
Content-Disposition: inline
In-Reply-To: <CAGm54UFOHuVnC1ta1PPbr3TzS4SS4=nOQiHuJ65YbD_1WCD-Cg@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--EyEhpyZznkIaCE1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2022 at 09:38:17PM +0800, Lei Yu wrote:
> This email is to discuss an issue found in fansensor service, and
> about the expected usage of object manager.
>=20
> # The issue
> With upstream dbus-sensors (7627c86), the fan-present objects are
> missing on DBus.
> The fansensor service should create objects like
> `/xyz/openbmc_project/inventory/fan0` to represent the fan presence
> status [1].
> However, with the changes of "fixing the ObjectManager in the right
> place"[2], it creates an object manager with
> `/xyz/openbmc_project/sensors` instead of `/`, and the objects created
> on different object paths are actually not created anymore.
>=20
> I see there is a fix for the "control" objects in the fanensor[3], but
> the fan-present objects are still missing.
>=20
> The fix is simple that we could add an extra object manager on
> `/xyz/openbmc_project/inventory/`.
>=20
> # Expected usage of object manager
> But that involves extra object managers.

There isn't really any harm in extra object managers.  They are "cheap"
as they're effectively just a string held in the sd-bus library.

> For a service that creates objects on different paths (e.g. sensors,
> control, inventory), should it really create different object
> managers?

We've had some ambiguity in where the object manager should be hosted.
=46rom a dbus perspective there is no requirement, but it makes it
difficult to call GetManagedObjects.  The direction that we've been
going is that:

    1. Some hierarchies are now explicitly documenting where an ObjectManag=
er
       is required (like sensors does now).  This should generally go at
       the level 1 deeper than "openbmc_project".

    2. Daemons can still optionally host an ObjectManager at the root if
       this is somehow helpful.

> The caller of such service (e.g. bmcweb) usually calls
> `GetManagedObjects` to the object manager interface to get the
> objects. In the above case, it has to call `GetManagedObjects`
> multiple times on different paths.

The reason for having the ObjectManager lower in the hierarchy is so
that the GetManagedObjects call is cheaper and doesn't give you every
object hosted by that service.  In something like the PLDM daemon this
might be lots of objects that the particular call has no interest in.

I don't suspect there is really any case, with the current
implementation, where bmcweb is going to attempt to prune the calls by
grabbing objects from two different hierarchies in a single call.  We've
decided to simplify the "where do I find the ObjectManager" instead of
optimizing the performance of "give me exactly what I want with this specif=
ic
query".

> So the question is, what is the *expected* and *proper* way to use
> object manager for such case?
>=20
> [1]: https://github.com/openbmc/dbus-sensors/blob/master/src/TachSensor.c=
pp#L77
> [2]: https://github.com/openbmc/dbus-sensors/commit/14ed5e99
> [3]: https://github.com/openbmc/dbus-sensors/commit/d9067251

FWIW, Nan fixed[1] the same issue you're seeing in dbus-sensors in the
phosphor-health-monitor by adding the ObjectManager at the root.  We
don't currently require one at `/xyz/openbmc_project/inventory` but I
wouldn't be surprised if we do in the not-too-distant future.

1. https://github.com/openbmc/phosphor-health-monitor/commit/af109947dad9c6=
dbf496c4111c625e5ae407dd81

--=20
Patrick Williams

--EyEhpyZznkIaCE1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmOI7WwACgkQqwNHzC0A
wRkKsQ/9Hi2r657HHRQBQhNSBU91dpb48/k/A7z1V5IeDoeFH0EN5iLBeoUSVhKy
ERidgK/mlnBRyie73esswiKWwZ4MBi5NzET6yljCQQDs7ObZCEX32GSLjGjFJCZl
PW8QlJfjwrlWSJdTs5/psKhL+rAgIhhm1EwwVk4UnklKFQ0v7yKaAHuy2oLE6s4a
9ruTivQPqLHNDx89wC4EAPseU0LJAkNc8Q/RO4Lpy7f+ylgl/cgPdRs+YlaKCQmp
b5i+hByym2ALydzJCiVp8sggUVHDUQjxn8HAbXPCzskvWdCaNaAdKojOuwsD6L1Z
VSCPP0AVdxtRtZS5dqkQD/a6j/BTzuhI3qA7a67ClTUVGGpxV6G0MLbQCazps70k
UDDO5zd9H8a0hbtlzCbNcdnIm0xQvgI0Fjd94R1lKui7H8xqGI3Nenn8TShMaq2G
vOtdmyUQc5eIqjUAzUsFqZgqPjZQSiNYNLRlbeBWVlME945bgdEe3HI7pw8nDdTR
doXUcnOdIxeKFIyRuE+XpRh7vXNvkC50F4Ag7e+mZdcoOVG7wqOj8y2gX6Y/i2sS
qRJt1oXkOxMWZJgt0YBl4irpXz06m1H227v0ukkicamJzwvvZdzX5tF4UgQHu1UJ
ki5kTv+PVF+tA+JdiNwME9ruJUuHtVHw/K+czm6kytDnsSY8veY=
=qmDg
-----END PGP SIGNATURE-----

--EyEhpyZznkIaCE1a--
