Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A34707FF5
	for <lists+openbmc@lfdr.de>; Thu, 18 May 2023 13:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMSkC4LLpz3fCy
	for <lists+openbmc@lfdr.de>; Thu, 18 May 2023 21:41:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=j55cb7OP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=VkGiPouv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=j55cb7OP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=VkGiPouv;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMSjZ2gS3z3bsy
	for <openbmc@lists.ozlabs.org>; Thu, 18 May 2023 21:41:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 8D2283200A0C
	for <openbmc@lists.ozlabs.org>; Thu, 18 May 2023 07:41:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 18 May 2023 07:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1684410076; x=1684496476; bh=BGB5NDXA4864eJlvaJBgnh7s9
	4naPGrv0VJ6hdGv34Q=; b=j55cb7OPMu+rFxUNlidQ6gCnyiiMHnm6W4oXLW9D5
	Vhu5oY0+uyLr+QM9sqXw7rC+2KOLCWmPk/5qCDDGgiyeMMbpH8ogLyu14NTy4MS5
	f5x5Y3o98uMBdq7nHsYmGg6sCsjTIX5ZO3Yhffz+WK4dlrlKGoDeAUN7sLP57oQj
	Z6CyNex2OfJZLi5wyWaWyZ5h2KfLV+taRKk/+sQ1R9dzFE5LBdVcNWEb+uxaUoDM
	kCwA8lSzdwYfBpYUrU7ubSMKiEcfuurAL1WTkNceFrlGLkJ048hpXvdAD5Cs1WkD
	As7njuYmsYLSllC9KX2HrNez0ZDJ9kJ9zBLpI4de+8MzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684410076; x=1684496476; bh=BGB5NDXA4864eJlvaJBgnh7s94naPGrv0VJ
	6hdGv34Q=; b=VkGiPouv/VPM/w7Mpk5mzB2Le10CEQiPUEkq8Tr4CXuNwa0bshu
	/I+sVDnkNS2whpL6oRSGRC4wur8R9tu5LfDPT+Nruo0HLw6OkG1JBqS1IM08qIrk
	pXfTPtM2H73S/Nio+Pxk+OxKEihQh/xuSOfrQlgkV6m42c4mt55/VSqN7Efc8uQd
	KOtIDQ7Eb7ztJNvkbiI22BkWZMuNmsPEGbefscwzDeqJJNbfVXeRr0I2jcOIV4Zk
	AN/pdI9b4zEZx44MvyKaiTjmcYjYMd+nv52SWrxSYTyKl1Uw8yVa1djEdC3Q/zI2
	Bi0ekSML16rvdB9iws6eezrFp/Xur5u9B2w==
X-ME-Sender: <xms:2w5mZM3GVq2_Juws5KYFrBQsXEIT8OSc-sGytaJ858n4rdkD-nUQJw>
    <xme:2w5mZHHvgBd2ZUhsz37DPAKOT2Wcc3e4rmJRhQp0w0eMWplt2O7PFakV7RBTPOsZ8
    0gPFJa7TK3OeMXoaM8>
X-ME-Received: <xmr:2w5mZE7RkYp2aoIHQt4Pnz0wsQnzj-NjdxXgc0VQMJTcVpl52COE9DSBjmDyJj51zZiX2x0GcO-SKLIBpwtI93kj0NIxsJn8fSs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeifedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhephfdttdevueduudetueffieettdegueef
    veevhfegteeffeejffdukeeihfdvvdfgnecuffhomhgrihhnpehfrhgvvgguvghskhhtoh
    hprdhorhhgpdhophgvnhgsmhgtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:2w5mZF2e7d5Y3AhvNrx1K6bhTdHBdcjcW6dsLwmb9NmMmbnN_km4EQ>
    <xmx:2w5mZPG_c0c5FHZD3GyB6VN0NImZ1Xn7X7W4BOXW9HdyHNaBX1PVjw>
    <xmx:2w5mZO_bzdvj1n9uEs9sYxcwEvPtOy6bYCzH30OZz_CzbUFrcDYrQw>
    <xmx:3A5mZGw_b1ZOv4TEAPUD8YJyVMUgV9DZt4XJf2s-DQoqDG0BtbKjTg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 18 May 2023 07:41:15 -0400 (EDT)
Date: Thu, 18 May 2023 06:41:14 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Feature 'usrmerge' is coming...
Message-ID: <ZGYO2rl9ukvVV3Hn@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4hY8F9s2+SX4Oybs"
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


--4hY8F9s2+SX4Oybs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Historically, Linux has had a distinction between directories like
`/bin` and `/usr/bin`.  This has been called 'split-usr' by some.
There has been some effort in some distributions to move
`/{bin,sbin,lib}` to be combined with their peers under `/usr`, which
has been called 'merged-usr'.

An upcoming systemd release this summer is going to remove support for
'split-usr'[1] and I want to get out in front of it so we are not caught
off guard.  Yocto already supports this through a DISTRO_FEATURE named
`usrmerge`.  I have enabled this on the Bletchley machine and what it
does is turn `/bin`, etc. into symlinks to `/usr/bin` (etc.).  I believe
that means it should be trivial for us to enable.

I'm going to leave the commit[2] in Gerrit until May 26th (or later) to
solicit feedback.  If I hear no concerns about it, this will be merged.

It would be good for repository maintainers to look for usage of things
like `${base_bindir}` in their recipes and builds and to start a
migration towards the regular `${bindir}` (and friends).

[1]: https://lists.freedesktop.org/archives/systemd-devel/2022-September/04=
8352.html
[2]: https://gerrit.openbmc.org/c/openbmc/openbmc/+/63586

--=20
Patrick Williams

--4hY8F9s2+SX4Oybs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRmDtgACgkQqwNHzC0A
wRnYzQ//ZMQdxiv26IKA0KTR6NsFBgUI1+fU+EXW6WiYHTTzEZLLbihbJpEtgk/R
KPDIMgKkLvv73MmypjCeqrnDdsCKU6LmNi8ufS/i+FR7lqcAeerSCb8X+g609SFc
HBwq00OufuMP/74jLLabgJSa/OvUh0v68etwGjQFTEYZ1jUuVnoPLLU7JGClY4dZ
g8a1V9ceKdwj3P2fnNtiuYNnLjstSsNRVg8QMwEuL93fgPlsBFuDnX5uxluqj8RS
FwdBsdhecAf3SQHE68lowtTSCS3cGJ0T9pa4/9FFrhYEP9+mpW23GCukbAMPqQls
5VbOGHGTmx3HHfe2Mcobc0rStBefn1DEQz4TGtpRqe0+PTL1QzUejfDq23MXHMyU
9ckxi4EHu7Hmmo28MEz/G1EKllEvtpej9ufe9qugePluWTVxsmCXDeDNvu8JNwSp
yaH+FKyU58u4KVoBAP+gUewb40NN6NszbwNYt6paBSfCHFZEtQcZGNhSNe8iZZ0o
JPj9oasuqe3e4nHL2p6GdHXuinj4SGoJMb2QG9FSeu6gRmESzxJRLIAUaO4JTBoz
GTNRPsKUJS4FbA11KTSe8GWl29bgsMB5e5wiV7HPEZ/4gymQ1rrOEhKzbNcDZ/Li
mkwC19HMjAJ0lqT41UZPE01+mObJds8+zIs2LX93Jd90epjOD3w=
=D1jI
-----END PGP SIGNATURE-----

--4hY8F9s2+SX4Oybs--
