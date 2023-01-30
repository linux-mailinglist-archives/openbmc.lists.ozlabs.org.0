Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC38C682022
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 00:56:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Q7w4TGbz3cBC
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 10:56:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=MgxuetAT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rqZuTOou;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=MgxuetAT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rqZuTOou;
	dkim-atps=neutral
X-Greylist: delayed 522 seconds by postgrey-1.36 at boromir; Tue, 31 Jan 2023 10:56:09 AEDT
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5Q7F3gs2z2xHJ
	for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2023 10:56:09 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id F26843200909
	for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2023 18:47:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 30 Jan 2023 18:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1675122442; x=1675208842; bh=QOt7YFFXiaQ+P6QdNIVRi1/QgLL1dyz8P89
	XYQQRUOg=; b=MgxuetATU1hDduSqhAyiQn63ZfG02IqQycjBw/MZ2edG/dATSia
	P40jb4gr9+vO6HY6MGOoISlAdWoNZ5EOFXolp42qff2kGHVwI5nd0rPHIrDAw5gE
	LALpofpbb/NFo2y/g0MFFgKJAFR6eGNsJBXlBFGSQCvjbdRDw5CGQDeaCA99fbJy
	Sr7h9TJSqtrAp/a2A3XnfwHwK65OEsaAWGPEG/FaDsbEdXC5G5IvosAcSMRTbRAB
	DMuiuXJhrckvAM/a/RwHEICWZzzip9j0r7te9S+FcLLMivtQ/ZceZ2/TiQFCv5sM
	dR/AZlGHNjjygCJwNeV7jrotdM+9/HRN9mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675122442; x=
	1675208842; bh=QOt7YFFXiaQ+P6QdNIVRi1/QgLL1dyz8P89XYQQRUOg=; b=r
	qZuTOoumFDZ+cRESqkcCSFaytm72t761DHhgS4CAveckASL936qFDIGG9JtP4FCL
	JmmXmPWLcUIDxRQgKE0AA97WP0lc1lvHQyrfba9Xk6K+vMIM5HA1snyFmmSwpM4e
	kX3EjmNzyhIL4wwXy6uRHKnfPLWSS5Z8rKSMNOzdTV6z41K+xoyfCgTSqfhGOrDL
	+/+zz8YR+Z6vXOegooE+NZtUgECYzvUC0nw0dt9XQ/34ptcmxregNo+4BVr1aHyI
	8ZVFecabK0u+W1WSZYEcFCiuo7Ksxf8TGgE1fHI8Z6F3O/26LWFI1UElVrVJYXR6
	zzP7sgsQiGFG5PjGyZpPA==
X-ME-Sender: <xms:ClfYY8T7AegwqrgFYjYJDhFUPiXwfuIQCVJZcf1io49xYW8XZQDBow>
    <xme:ClfYY5xmsOk37TXSW247hTBs_EN_ZzV8q8lzkLF-IjVEjI7S5muqbPHP_KDmj0EB4
    mD7Vej_ejyUIeZiRkg>
X-ME-Received: <xmr:ClfYY50wfNOFEmEDRrsuz5t30BIU09Zpc4ry4nhoP0CbQWwRLi2u_t0hNqyTOIX2Hv0TumILtPNg5IhcI5_ZM_puiBeVCHmpbqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeffedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtjeen
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdfgueegteefteevjefghfeiueeijedv
    udeiudetudffudevffdthefhheelleehnecuffhomhgrihhnpehgihhthhhusgdrtghomh
    dpmhgvmhgsvghrshhhihhpqdgrnhguqdhvohhtihhnghdrmhgunecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgi
    drgiihii
X-ME-Proxy: <xmx:ClfYYwAtLdsBojj2YLgs2JSOMNlBvcL9DjlIdELkDcO6NtA6SXHuNQ>
    <xmx:ClfYY1jt7aCBw3PA3Ev9EkWjIM7ywP4tuF9XgTGsaPgS6mm3vyNbWA>
    <xmx:ClfYY8q6keZwzjISN4Eva8jdUtTzUOpMwFQ99b7O6pCRW7mstM96hw>
    <xmx:ClfYY_dQyNdFAkWLJ__FkAXehmyRnjEetd_FhNupxiZhb2Rrt2oaew>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2023 18:47:22 -0500 (EST)
Date: Mon, 30 Jan 2023 17:47:21 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: TOF elections for 2023H1
Message-ID: <Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f1eHd9ZVonybyiKa"
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


--f1eHd9ZVonybyiKa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I'm behind at getting this email out.

Per https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.m=
d,
the schedule for TOF elections is suppose to be as follows:

  * Jan 1st	- Developer contributions close for OpenBMC Development Communi=
ty
              membership eligibility (See =E2=80=9CMetrics=E2=80=9D).
  * Jan 15th - Current TOF must publish a list of eligible voting members.
  * Jan 30th - Nominations (self or peer) for TOF seats must be sent to the
               mailing list.
  * Jan 30th - Developers disputing membership eligibility must submit a
               petition request to the current TOF.
  * Feb 15th - Current TOF must publish a final list of eligible voting mem=
bers
               and upcoming candidates for TOF seats.
  * March 1st - Election begins.
  * March 7th - Election concludes.

Since today is January 30th (in my part of the world) we are ~15 days
behind.  The following will be the schedule for this half:

  * Jan 30th - Current TOF must publish a list of eligible voting members.
  * Feb 15th - Nominations (self or peer) for TOF seats must be sent to the
               mailing list.
  * Feb 15th - Developers disputing membership eligibility must submit a
               petition request to the current TOF.
  * Feb 22st - Current TOF must publish a final list of eligible voting mem=
bers
               and upcoming candidates for TOF seats.
  * March 1st - Election begins.
  * March 7th - Election concludes.

The only real change here is that we will extend TOF membership petitions a=
nd
TOF nominiations until Feb 15th.

With that said...

A. The current election roll-call is available at:
        https://github.com/openbmc/tof-election/blob/main/2023H1/rollcall.j=
son

B. We have 4 members who's 1 year term has ended, which means there are 4
   positions up for election.  These members have an ending term and may
   be renominated:
        * Andrew Jeffery
        * Jason Bills
        * Patrick Williams
        * William Kennington

C. Nominations for (B) may be sent to the mailing list by replying to
   this email.  Only those eligible to vote may be nominated.

D. Disagreements with (A) may be petitioned for inclusion at:
        https://github.com/openbmc/technical-oversight-forum/issues

--=20
Patrick Williams

--f1eHd9ZVonybyiKa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPYVwkACgkQqwNHzC0A
wRlulQ//V3IfhLwO2lTheSrHY9X9FzcAnoL3VlMT+z/U+ucHNfbgnARJRW5kroLy
V7vuF86nrM0kZ0E7FIhVp9YrUyUn5A9rkkSM6VXNtkSU3zG5MHMFh3Xs/f0cM3Xv
dgnbnBx2FRc9HC1/+yK0yy3tCgsHllaKoE/TSUiwtQEh9v42s/6uMbs/NvHVzIQW
znTECrCHbla9rOfRWN46F7OMmZVkMCGBfKR6nHRPWiGBDDU6Z0ZyP27q+hCUH1JL
cBS08Y/lGeBoK5E7u1q3EDkTnO1cGu/xDo3ErbJGxkxh0MmAxM2JgcZ2djZ84bIO
eOjzuzloZJJKZTuNabPq9lJqO0bt1by3zquu2xekBib5ba94Y0CsrI9K9ky6gQkD
xqWTQyvM9oXPrPf1fPqq+V4hp5DIBiaWOmilDGIPNxJaNgiZ0kJwR9Xa6VtDoMgk
3qP0Ck2MBrcmGlQ7pcicoJDYVKn9u5hxxxyARQibu4L7CjwifT8Ih2qy+6Z4PibM
Q1CxZCpl3W9yICzdazyb56s3S8L+ydtwwZdjCSmbQpK71O3CFVvSTfarawabFPUh
J56RVmeR4YG3UIv83GC052mUFbCz7JwYO20Pi562/USvL1FTsiImXZfqdlCchfVL
dj4L+IbERoc24MbfxWPMWScNgDB/3D8iyckhW4N0g2puUl8wQl8=
=W5LQ
-----END PGP SIGNATURE-----

--f1eHd9ZVonybyiKa--
