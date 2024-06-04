Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7848FBD4E
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 22:29:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=dd0jH2P2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dasHD2Wn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv2HZ0DYTz3cfx
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 06:28:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=dd0jH2P2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dasHD2Wn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.155; helo=wfhigh4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv2H32n0dz3cbW
	for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2024 06:28:31 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id D5961180009A;
	Tue,  4 Jun 2024 16:28:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 04 Jun 2024 16:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1717532909; x=1717619309; bh=xsl6wya/4L
	hjF5u7n02hOYL1OBUt68rNpsrPgp6Iww8=; b=dd0jH2P2tIR0Bco5tduv/IcoXG
	COHu7dAp1Yrsl8nFujnDUEiwIjAolQBoUkpCiW0Q/I5ShoLULM72jU6Iv/39H7dl
	i4I0WXtTeQgWpy+2ra2GnQY4k8Jpvajw6ezyF8fKKwKIwxeS+GT15SH5Ens/46ql
	VpGUKoGbkQuySOTg3Oj8q/SH2ZLeYwK7OWgWa5YDsszcM6pTXxonkhX058OGQAxL
	mGzeqaT30yid0ELtWwiyLQrpdz8FcJTeYMhX/d4C+AxB9ZYDmBIs9+DmPLTv8lc0
	2NGXZRfc6NGzQy6Qu4MLRkt2cUiJ2mTrWclZOCgzowXkU9C3QMfXdOONbrJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717532909; x=1717619309; bh=xsl6wya/4LhjF5u7n02hOYL1OBUt
	68rNpsrPgp6Iww8=; b=dasHD2Wnvfv2u+Q5ANedZpO8IkP4j6YQe8BEtgvUp+G6
	ve9/JXsEzmKLPzcZfVmfCjakD5YnN63yMwH28DyXtOW8aPtwUNTFFZFmX6a3tvq6
	98W74pYaCjyZHlllYfH9KonWl2F12shNHzHSeM9foxnOUfLV9eTQsGHwPd77Wy1t
	gG3qlu3bSMQES8Ne47ewsD57zWdVsKFKwJ1SJtn6ROF325PGExOwAb3d1u43oqjJ
	JPo0St9VLDOTmsNDUCJDkUxK7sEn7wdeKVfTELRG67IWLRbPtmFuI1nW+SIyRPYX
	Ml6s/Z2Awqd/LjDiqK8iJD+cLYrAt1ZG4WRDHK9RKQ==
X-ME-Sender: <xms:7XhfZib7Yn1ODIVazSggJ5W79Hvd8oYeRAuny9QsooTAsFr6zCL6zg>
    <xme:7XhfZlYvxxNkNsxD_SytmHaFNtoyHEaBhvTY8yvdo29b-iRf6sGss389gNPWJsQI6
    8O6xoHu05c0sivNW30>
X-ME-Received: <xmr:7XhfZs_D_o7--_JMMWFYSEK4-1o1NfUkW7Q69m08FaY3OWQFVom5IXT3vEZieezXEQ00Biyv6aQQBl6A2Wd1T1Mz7J11THlPlb8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelgedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepueeklefghfdthedtveegkedv
    gfegkeehtdeuieffveejvdffkeevgfeuhfekleeinecuffhomhgrihhnpeihohgtthhoph
    hrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:7XhfZkrFHBD9dyY3IrFQdsKwgC5qDZfnjdJVHQpl80YnjwiCqKk48w>
    <xmx:7XhfZtpA_P37j-17ZhydZkPH_5y3vmcEoRCj4uWh4VAaDwZzCRt_tA>
    <xmx:7XhfZiQVihwljyqlE7FgTD7MC3HDlsv8aMuzaabnQuwNJM7Y1ouBBA>
    <xmx:7XhfZtrpll1m0FST31qRguj6gT87vO9gsqBK3l85fEwAbO1f-RwNHA>
    <xmx:7XhfZk3PGOzZGvfnI12wno4AkjSabCsKPvv7xARwT3paFuShGTivWsjv>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jun 2024 16:28:28 -0400 (EDT)
Date: Tue, 4 Jun 2024 15:28:27 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ananth, Rajesh" <rajesh.ananth@smartm.com>
Subject: Re: Build problems
Message-ID: <Zl9463668VSTuCPq@heinlein.vulture-banana.ts.net>
References: <BN8PR04MB590628BC7BC726C6F3B089A794FF2@BN8PR04MB5906.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HynyocXnW3IPCW5v"
Content-Disposition: inline
In-Reply-To: <BN8PR04MB590628BC7BC726C6F3B089A794FF2@BN8PR04MB5906.namprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--HynyocXnW3IPCW5v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2024 at 11:34:52PM +0000, Ananth, Rajesh wrote:
> WARNING: Host distribution "ubuntu-24.04" has not been validated with thi=
s version of the build system; you may possibly experience unexpected failu=
res. It is recommended that you use a tested distribution.

> Traceback (most recent call last):
>   File "/home/rajesh/openbmc/poky/bitbake/bin/bitbake-worker", line 278, =
in child
>     bb.utils.disable_network(uid, gid)
>   File "/home/rajesh/openbmc/poky/bitbake/lib/bb/utils.py", line 1696, in=
 disable_network
>     with open("/proc/self/uid_map", "w") as f:
> PermissionError: [Errno 1] Operation not permitted
>=20
> ERROR: PermissionError: [Errno 1] Operation not permitted

This is a compatibility problem between bitbake and Ubuntu 24.04 which is
not yet resolved.  They are discussing this upstream already.

https://lists.yoctoproject.org/g/docs/topic/106220010#msg5234

--=20
Patrick Williams

--HynyocXnW3IPCW5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZfeOkACgkQqwNHzC0A
wRleMxAAlL6jV0uSvyE22QzKvFR7Jn3Q0tgc2I+ZpAY+FAF240Y23WeAqEinPpSR
kMP9hVwXOQPNdOwmyBiTxMG+1vTqgXL38sNVNx2pBKBSmoSUQMj1wPtdRfI9vnNY
NUG5TMNZcops+NSxTcVAHFnnNDG1c6FOF9bph9Cq/A0HZvaT0bj3pCqHZGN9g0H5
Nojh+pGPEMk/y8G+Ix+C2SCxQwt78cRTD9y0asLfXIdEeIHaLvbFKpGDfMSZl9ws
ZNPylauuNuwAe3PcMKUxcBl3Pzg+g9Gr6S78TUA2biqbKNYfGtGCE9QfKUdUai4h
XhzOh4cNIlRXJZR1KXhw2pp9n0GwiTPhi7wB4BzyrjcfgbwsvvddsRaXpnyIr0y1
jxRr7KOCjqNN47BKfILTJ6AwuDmqVdz2ZjJ6N0S6P5pAxeT4YchMK6FVekVzrtcg
LC+1qbRSgKAOGCbMSBkRbSYd9cpixWrymtJs7XgEa1QiKwjdD9mVhzenZd6Iohie
Itz6jka2G7buOpqT+sRPVCwSKfRSwjvAVwnUEF1tAt4mEPJcuFzCZhlaKjO5Lg4A
54C0BL1qDuNT7u1qkwCJOjCgRB+zVV/zhIf2PXS3PASypMlRqJAJLZqoygf84UWB
JyU5gZeg9hRkmG/e7iaDGDTn/1UZDIBWhfM//3hpNNRKkDM9gsM=
=oVNE
-----END PGP SIGNATURE-----

--HynyocXnW3IPCW5v--
