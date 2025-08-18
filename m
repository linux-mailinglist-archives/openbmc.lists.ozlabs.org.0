Return-Path: <openbmc+bounces-472-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D495B2B238
	for <lists+openbmc@lfdr.de>; Mon, 18 Aug 2025 22:18:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5PDZ4QZtz3cgk;
	Tue, 19 Aug 2025 06:18:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755548318;
	cv=none; b=WiqUXay636sD9zIg6jS4p7VueG821uJwwkHjDKaZnmEUTBZSD4zRuYyq9DPsv9CY2PKXMMsaoCkhzsmO1asM2x7opviz9b8DJw1WMv2sQshUGz1OmZUAdbuZzlMJVmAp5tv9jmMIeqAoLQDn0Yk5yjAy0W2+72SkwEnTvjSMvK8oaA0vCShnN5SKcnq+tXULTqKpEjeexj2tVKolSpBZRS/493urMkNGuDp5ZUPkN/2/tU75rHyNaXwmv2M3bwyrbXrVoA8U8YH47ltO0fN+uEfkhn9b62bNxJNfSMHOyGn6RIF1YBPbWv8aj6YG06RjS9JhfB7yy5oTjOuQQKhDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755548318; c=relaxed/relaxed;
	bh=53ekt8G3a6k5ywseLR5dG6ON6ewqk92FlpANm4mXzWw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hG0hkwEsqZuxVQNVDwEGi8c1N4E284DS2JbG8Ia+RSPOECbc/dszFDDybyer0q0Vc84uHPxN0EHGNWGZmMyDPkpyCU6QZAOlJc1zcDB9jxpSju7Fv7Rj3GN+KKoL+/y4AA2IzaqfGiuzqFKDx/CX5o3QNdlXKZQzonLDkuoJxAL8SH07SVR6FN/D0HWD2keaB1SBGw3WHc92pLjTqP9TKhmErfmgKOgUbKecBUNH3cxSwixcap9cHXPdiZcUmhX2WN75xZ8LAUiI50Xev+KDqm8GZ6uDTzPYwywixWqXsp/hWLr7Yh0eNjE4TczH2xSK3sDNOzspw6qSA57lHeQzLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=ZGXVJfG2; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=G8+0HFqK; dkim-atps=neutral; spf=pass (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=ZGXVJfG2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=G8+0HFqK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5PDV5XFVz3cfx
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 06:18:33 +1000 (AEST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id DF671EC0FAB
	for <openbmc@lists.ozlabs.org>; Mon, 18 Aug 2025 16:18:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 18 Aug 2025 16:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1755548310; x=1755634710; bh=53ekt8G3a6k5ywseLR5dG6ON6ewqk92F
	lpANm4mXzWw=; b=ZGXVJfG2D/Z+NYKpO4HOy7l2UfsmZqRjHi8geEgtcLAu7ekH
	HtAb4Cn0W+QU/jzn6/eYL6d2CQUBFi9jtHTsdF7WwdSIOKpGBvQ6LkOs8K86e/jP
	QcnYI9WrYq3HPFZcQNHBwac1kWxihWSChXLyX+XqgxmMnX61joavKcoHyEqVjDG3
	oieVQC8R14iwllUlPqIblwaWnrwJy4y+WbsiRmyz99JzFsAUEk/pjrVwKqdLfoGg
	uqJNhM7lHLrOAfrUKDmDay+BiJBZaIdg9cw/8jInr/cwJ+iMG7bx+ZL4bToBMPd7
	pVGPQKImWx+YY4RXtInEchkYcdgGADTgZhOIZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755548310; x=
	1755634710; bh=53ekt8G3a6k5ywseLR5dG6ON6ewqk92FlpANm4mXzWw=; b=G
	8+0HFqKwbDq4qTURTm73CDkNVBLccqm0AWs6kBSBSEMltl2iE4F85OTYsNVU6n8U
	VR3yfomOX6uDZ99YFNDBoyVGi76Ntx/JarFHPDeBC0eQ1g80z5PLGrjfpbuj7kkQ
	bHqI4CZevkK4qqccrL/iSskQxVkLKbrpvZM74K2pOmdnPmov3FCTAHgcOdrNB7k7
	oiyVJdHm+hn/CCmqzazN4cqZLpGAu35r4BEHB+zLLUG1QDLUGjtxiy0/VlqyeMQZ
	MxKDtyyp/3EtQdC3EF+Kg+0nA0JKWleh1Hau7gQzCqFBf+1BzRXE/hnp+UCH9IBb
	/FC745JJeiuAL/TIjE/mQ==
X-ME-Sender: <xms:loqjaDfyCywPtH82S-2iJcTCFzuGHREgOMSfaNehxdajixbMdOMBqQ>
    <xme:loqjaLP2ifWk2N77cm8gUolUwPqG182Mt0MpO5xGctxjGqR0X9uwBUBrQkPsOdBx_
    MDEF78HQq3PQWlW0co>
X-ME-Received: <xmr:loqjaF5d3I6I_FnYt4YsCi2Q46p3Sqe0LW7rY8OLc92CF3nftaC8SteAhPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheefheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvdenucfh
    rhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgi
    drgiihiieqnecuggftrfgrthhtvghrnhepudeuvdeftddvveejudeuleelkeeiudevjeff
    ffffvdffvdejkeeujeevteeifeefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhi
    tghksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:loqjaHIqgwd1iGUed-K0vBW2bAY3GIg5vC7xdYTnWm8GLWADXNxoGQ>
    <xmx:loqjaHdrvslQhmJzp8LgU0xbDbxBdJV3ouyfWYhilU7IvqlHU1hVSA>
    <xmx:loqjaCe1U03gm6NKQzHiDzpV_TOdo3IJ47Zg66Xl5Yl9gfZVdL3Usg>
    <xmx:loqjaCPL7MvwNhlEElTwtYqrgn90WIt94PCS4I8lHJJGnQloFfj5zQ>
    <xmx:loqjaEIhKBzBxIYL7aeOLwIzwnPSdbQ97ancUKbH_AJfJd4d8FpcCOqG>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 18 Aug 2025 16:18:30 -0400 (EDT)
Date: Mon, 18 Aug 2025 16:18:29 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: TOF elections for 2025H2
Message-ID: <aKOKlY97pOtfuaEv@heinlein>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofS7w6U0hMS0o48o"
Content-Disposition: inline
X-Spam-Status: No, score=3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
	FROM_SUSPICIOUS_NTLD_FP,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--ofS7w6U0hMS0o48o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

It is time again for TOF elections.  The current roll-call is available
at:
    https://github.com/openbmc/tof-election/tree/main/2025H1

For this half, we have 3 seats up for election.  Currently those are
held by Andrew Geissler, Ed Tanous, and Manojkiran Eda.  All 3 are
eligible for re-nomination / re-election.

Nominations for those 3 seats may be sent to the mailing list by
replying to this email.  Only those eligible to vote may nominate or be
nominated.

Nominations are due by Sunday August 31, 2025.  The election, if
required, will be held immeidately after with more details to follow.

As usual, disagreements with the rollcall results can be raised to the
TOF.

--=20
Patrick Williams

--ofS7w6U0hMS0o48o
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmijipMACgkQqwNHzC0A
wRkF8BAAjkkpwB+vxU0QUaB4+CYsgOph7W8mgMRvLLE5DWPf1ja/eR8LhR9AQgRY
v6aiaO1fkku8tCIyA7kX642GXb0Ru1f9U+awbYfq6yVe4WiQsre27k4SEy6GSePs
4YSqj84EJSEmljyU67v4AMRXEoGdlgXt41rrhHPba+9E8WJsfe2RmXDDkHGS00oO
iQAfYr26UkyjZDHV52xP0hnrb8vtsuxFe60eg1xaPFnlQaCPrtj9YkFAelcUJQVx
9oOvMtl1ANz9yqrFz7qzwUjE/T6Cqu0gOi0JCgHtyQp+Blkl23Ond10Qe9j0QW1v
9QnKwJ2wY2jZ4VSaYZO4pNb95OtuNdrDocaODfxVsyO3+euGZhPIXJugjERees75
NCi8UNMXvJSPzLBGMFum0Ogf1pybu9Sc4aQ/tV1/61Ds/hjKC7nXjwJkj3DdeMcG
qeSVlZAsMA1AuRlf50IrUWrDjN1SMSJ/U+tU0d5/Rq98gKqY5itTwublGiW1GuAN
nA0h2wkXCw1xoSRAEX4qW35n6ECDVmIJ+qd8ORE5oGTgNTlWad6+ZFqN4CkTVhrW
UaMAeI3URbpJx1EpeGhOHbWmUn25YAhwCtusJV9BBhqnE3nhiwmxZNvKK022AHsi
hu/+sf006v1kCAoIF4x6NNZ4+estLUqiWl2Ae2wVIpWuMZ1wwoU=
=w5No
-----END PGP SIGNATURE-----

--ofS7w6U0hMS0o48o--

