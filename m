Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4BB78DEAF
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 21:53:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=JSqGrPY3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RmdgiiXj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbZjH1rLzz3c1L
	for <lists+openbmc@lfdr.de>; Thu, 31 Aug 2023 05:53:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=JSqGrPY3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RmdgiiXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbZhf2c2dz2xdn
	for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2023 05:52:49 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id AAABC32001C6
	for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2023 15:52:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 30 Aug 2023 15:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1693425167; x=1693511567; bh=4COJzTLAOG5LPvc2qTo1Y/EQj
	ADrzima7bNVmm0/seI=; b=JSqGrPY3hAXqZGiYyEZrejQDtHaGYRaO/shJlHugH
	XxSKcJVX30uB8qI5T16nW8SkpaCrpCWRYa0IU/qYVnWdVIwvTdcJ3/iCqVKT7Tf1
	g/GG0WJVx5DXhvl835bo82HIeir6hnWtOxXrKfmaiqCn4AbTgnaNKlvVVkYR/d9w
	NCNdxnHxiWLhy2DXzpZJ6YUwVLDy1HgO8X1182vaKjQmWd/vCX8qwWJt3XyBqIru
	VKgxBAQFNUQ6Rbx25SKYCYecYaYU6tR+w9V5aZ2pQtueOf2jlRFULMS+axb28GZw
	WMU/zhaDYZjenDgPCJVU0WRaGK59pLo0yrFeBj7rJiLDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1693425167; x=1693511567; bh=4COJzTLAOG5LPvc2qTo1Y/EQjADrzima7bN
	Vmm0/seI=; b=RmdgiiXjvPuwWcgk9DOVPlpTcZArt5qixdqyQtYv/OKr2yAlOEe
	u0k0D9odKIhCwr0ifaQpQyIJeKiT0rv8O18tIyCJ6jD6pu10MwQIpVaK3eirbDLX
	F9s7KoXPuAH1Ic9Zr5iAMDrIPl9PUmOsfa4LOvGgVjC4jkEfPJB2bDjYvSH9k39h
	SM1IrVubY98wTM5d0U0mEbTYX1cjzHw3TVuc5rHYkBLODU4pGo66+cCEXIuLOmA4
	fieVm81vL9Y5f/LX5QvK4+NqywLpfTeqEg8WFOgZRzCMYYW1TAvxX/CXd+Mko0zc
	j5sFK2BjDCAgyeUzUpI/+HhZNot0yTvc1ig==
X-ME-Sender: <xms:Dp7vZAIX8TV7j-ZV68BvX3B78aMkWSJiUSC1RceOOSoy7xkP0cvBGA>
    <xme:Dp7vZAK0IMzbk2050M_nVH9mQC-3utXiWL8MTA6L-9wtGKQj9Hh6LVgFr1dfFZ39v
    HTlQvD1WFTWe6EQf14>
X-ME-Received: <xmr:Dp7vZAvJ3vB1UAu9VcF1XTvVrOeLx9alrXKjAq48fkv0CvzfTvQI2xZRLETyFPm3zUrE5DxP4ywMUK49ow6m4Hob90kKrJZY26w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefkedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenfghrlhcuvffnffculddvfedmnecu
    jfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkuc
    ghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrght
    thgvrhhnpeegteeiveegteevveeiveeifeefudeileekgfelfeekheefheeutddvgfetgf
    elueenucffohhmrghinhepghhoohhglhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Dp7vZNbngtwASBBKKqhHQzOqALbJE8shWczKsy58QOmC-1X633l0Bw>
    <xmx:Dp7vZHa-kgneV1kcyIKFAIy2u4Gvw_VDHxzNPVJvsypsI1enyG06fA>
    <xmx:Dp7vZJC4R1TAboNz36M7CzCZ_7lNozJntP67OkPvLVl5t1lE1zBppQ>
    <xmx:D57vZB2lElIVKUKSqjuQpfja1bbORxHOte_jRmig92t3fY9zle8qww>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2023 15:52:46 -0400 (EDT)
Date: Wed, 30 Aug 2023 14:52:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: OpenBMC Developers Conference - Oct 13th, 2023
Message-ID: <ZO-eDB4m3fHMMt_b@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tTiP3gE8d2A8VaBW"
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--tTiP3gE8d2A8VaBW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Developers,

I'm pleased to announce that we will be holding an OpenBMC Developers
conference this year in conjunction with OSFC and hosted by HPE.  The
event will take place on Oct 13th, 2023 from 9am to 4pm in San Jose, CA.

This event will be free and attendance at OSFC is not required (but
encouraged since there are a number of OpenBMC-oriented talks at OSFC).
As the name implies, this event is intended to be attended by active
developers foremost and if the event facility fills up, we will give
priority to active developers.

The format of the event is yet to be determined, but I'm expected we
will have many face-to-face discussions on design and development topics
which have been difficult to get consensus and forward-momentum on
through our normal discussion forums (mailing list, Discord, design
proposals, etc.).


To reserve your spot at the event, please fill out the form at:
    https://docs.google.com/forms/d/e/1FAIpQLScqIU-JGIZIrrgbDpkjLjaXi4QgV_s=
eQ9LL9Ps1DNpxyUMgLQ/viewform?usp=3Dsf_link

Responses are required by Sept 30th, 2023.

[[Some of the information is personal but required by site security.  The
  data will only be shared with me and necessary HPE employees.  Feel
  free to send me an email or Discord message if you have concerns.]]

--=20
Patrick Williams

--tTiP3gE8d2A8VaBW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmTvngoACgkQqwNHzC0A
wRnPMxAAly0MRt5UA+nq0KIB+sXDefreeVHhtOEDF7U91jWFuo/w2fUGywNXRZku
pT9ewekmoxmqo6xSya2V/2FIQF+UVVoNm0qrANFHGupQvTXziKAjs2Iqi7WLb/bM
eBABbfPxJFvuF/tOUjVAB/JEEX3VCNVqEPLaGNXi2j/BK1fvChuYZGVxEjWRRvqi
hJr12DngjUZ96HYCRzPyYuc+IGQeDXmQ731RBvUsWYORrMJLOvxOYLefve08hOgy
qFOkWNPPgSI0kfExWNGl4zJIKlQS6dBKTJSMtR3q9p3FLcMG4YBKjIxlFzTec2+B
zNUzS/bc7+Iau7J2sQPe/ZLkzOvY0NtNHMnAVVfHsnj4rMzyaff9aFcFqG/vksou
sRbZnt4+pEJHHRNHgANC5sJWWznF5w6n5Kwltvlz3ew70zldTHiFqknz8g+zvME0
NXsr2kORDVkJKDm0pDS5TkMPnBZTQl9mLg/Rpm1lzuhMEw4KegQgMkmuaz0d9ILo
gpnOLlr1rTP3z/eCYMSxTbGTRSb/+oJvojwKH+EBLlkTQoTxE25/N4BljOd+AiPG
Q/XKy6K+bIKiCTJjWd0Qu9n3zY0Jse8b6/g8qljJHgz0GxmBYIzD2IX/wnD2hN2t
e6q7kVkanDIFdYn1e9fIp0dVLp9cN6KPOVGfHQkSSJljpAPRhvo=
=ddli
-----END PGP SIGNATURE-----

--tTiP3gE8d2A8VaBW--
