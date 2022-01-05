Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2094856FB
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 18:02:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTbPd13Whz30DX
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 04:02:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=lOkKBtKO;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dR1zI/4/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=lOkKBtKO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dR1zI/4/; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTbPB0wpvz2yMS
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 04:01:49 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C337D5C00EA;
 Wed,  5 Jan 2022 12:01:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 05 Jan 2022 12:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=gZVte9yNJbxKeltac7YbPcsBufw
 MRwexW+t+Tl++sY4=; b=lOkKBtKO0mepkhmHplBb+UJnUl4bDSEZ2sEGDie0DLL
 Y3R8QdYPFkkETAhQWTfdIK9fmm6qqsyBhhauL9QcXEQzfmjkhSpRRr5KiOLv/ehM
 olWuqJIg+3wmWV1oGJ00+fpdsL77PrmPjBqiXkb4uY0LY/odYembdbaAf2owdDd7
 cNer8NGOiLOOPbefQPeqNwRNyG+t419KzFDYxrArxxu8VgQ5+WE3fNHjhabx/oTD
 FmrNPnR1WGeglPZlue25/HLqGsdvJvMgiS33JhyL90yTxJaauA9dQWzK7Gr58WQo
 vxPyk+Mu/RhfXewtI7g0hxXYQAVRocFiErX0M1djrXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gZVte9
 yNJbxKeltac7YbPcsBufwMRwexW+t+Tl++sY4=; b=dR1zI/4/ly5bX1EoSJuUGZ
 6DXRJ4d8C6yhSZmViUTodA5r75J7sTNhQU4T9TdxOcURVplwWrBRkuxSobz++5pt
 QIG0opBVqH42/ZKSHaFdw7lskx0ZCwXBADe8+gYRe1cWGMFxFWWcc+cOnWgGRqLK
 Vo3mUUA+9gPu+QyUF8kxztO3i3PhD/KT44swjgp0ZxcH3ve7Vq/DQbnopdVLPB30
 6QheO835dABx4AaJo/s7LJ24JZkijfk5vsrLS5pRmrFx1Jfhgg2FS1utfV/15RwW
 BD2uHvFRizH2YJbm6q3uoOZRiW1FtFVKMIQPH1vvS/3apoR5972TmkyF7pIqAYWg
 ==
X-ME-Sender: <xms:-M7VYUIzAZkrH4JBUd_ZFU1yDwX0MELehka_xKb4TlyQUc7o8N0lBQ>
 <xme:-M7VYUI7Xv4Kx1h-diBdH9CteLcH_fd_9861d56HgwJPTsjLwQENd7640SwQmAWJT
 Uwb1SqywE_nVI2rY4g>
X-ME-Received: <xmr:-M7VYUvflMsqMUjus2w2bPy3guKcXhlRJSMc3gwWGrS5zzIv_4BNeev1xM4mojh5IKwTp2b-hNnTu9p7_j2JyPNHH9oi88MGyjwFMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefjedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 eptdefjeetuedtfeelfeeiieevveekgeeuvedtveefiedvhfeiueeugffhkeelvdfhnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:-M7VYRbhB5ckdwYSgZLVUeBwr4Hn6tNHHzZQfo0il6jenpN4_KrKIg>
 <xmx:-M7VYbZeIDOzsJASq50yqX3hc5sAy5F3R31BdVGN4J4H2zMKsBl35g>
 <xmx:-M7VYdBzjn5TBU1iYhz87QWTrWTeFurOhE06RCGn7LdAbzb2Y9eQ-Q>
 <xmx:-M7VYSy5VapW3nVH1Kl-gdzrKPFSv8L9W0NtgV_Oj8KQltDIN-4gog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Jan 2022 12:01:43 -0500 (EST)
Date: Wed, 5 Jan 2022 11:01:42 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Nikhil V <nikhil.vu@zohocorp.com>
Subject: Re: [ERROR: Nothing RPROVIDES 'u-boot-default-env']
Message-ID: <YdXO9vLJP6pJRjGm@heinlein>
References: <17e1f659f9b.c8f061fb4115.9212316766481010802@zohocorp.com>
 <ff7a3d7fc5ed91ab62b935421f779a6407e817fc.camel@yadro.com>
 <17e1fba2bcf.ce6abdb85070.1975040279944804325@zohocorp.com>
 <bd8a1dec629cc9dd69c44578122a178d7af6eb7e.camel@yadro.com>
 <17e20148a9c.10fd4f6105879.8717643372259739590@zohocorp.com>
 <17e29ef3ecb.f538ffea22697.1377643688691911450@zohocorp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gWvTFwvY+vebXp01"
Content-Disposition: inline
In-Reply-To: <17e29ef3ecb.f538ffea22697.1377643688691911450@zohocorp.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, akartashev <a.kartashev@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gWvTFwvY+vebXp01
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 04:40:52PM +0530, Nikhil V wrote:
=20
> =A0=A0=A0 Trying to implement openbmc on SAMA5D27 development board and t=
o use secure boot feature provided by microchip. To make openbmc more secur=
e.

I don't have much help on your specific problem, but I think there is some
surprise in your use of this chip for a few reasons.

   - This isn't really a BMC-oriented chip and is likely missing hardware t=
hat
     a BMC would typically have for interacting with the host processors.

   - The A5 core in this chip is probably slower than the AST2500 (or maybe=
 in
     the same ballpark) which is already a generation behind.

   - Aspeed has secure boot support also / already.

This isn't to say that you might not be able to get the SAMA5D27 working as=
 a
BMC-like device for your system, but the fact that nobody else has decided =
to
build a server around it would give me a bit of concern if it showed up in a
system design I was working on.

--=20
Patrick Williams

--gWvTFwvY+vebXp01
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHVzvQACgkQqwNHzC0A
wRmSpw//f6sFrZVGXOwT++aGgkbTT1uPUXdnkfF1D6RKo9xxXlPLQitFJPLdi7aQ
+oY5++MJ5v6ayBdc35H8rm83Mipul6EDNQD/02DJHRstrdmCnne6sd7TBF5cirkW
Z69mnHqI7HYT/sh1boCi+S0Jslf+dp3w5wySdO2aYjNdckjlVfax762Q7cAnz2/2
eIKxKdSPYr8mlvSQwA2DEopf5Ls/qBPXDwWC4rpUNArVKikT75rwbs+Vo/bfamhs
M0RmzBAhB4A+ZxR/HHltCBwlziftzYPoSAOiDzm87sHtbJixCsgZDhVumq8on4Fi
VSOpeUUIpWFRtbCxdgK4sJv7ZpkQ6AmmwEMku2+G9iao0WTikd4kuVouED/WjgeV
aCI50OfYCBPAeBj6bY6/eC6Sb1QcW0BQEh0u2rg1TkiHmcpGwBWtNCsK03WxkpeH
yO5G14jFTwu0L70djuA6gXnr7TmLyRifXs8GdVy7pc5yWC4tiELmvS3r7ja5iDSm
av15P9ryT1RAMKWlzKm0ZhGlKE0hnaHxPOfdDbJcQnr1tA8tGg/+WZ/7+Sh+bEVZ
DfGv3OCTvVbtwoCjAvHiu4RJh4c99kXW219pSWxxTveqd/u9zbanmZ4aDLplX1EY
Gc2gorK6gPiM1FFNl/8UcLqo08+BwKAubFltA5r4pgGxPCOMRJI=
=R3Bq
-----END PGP SIGNATURE-----

--gWvTFwvY+vebXp01--
