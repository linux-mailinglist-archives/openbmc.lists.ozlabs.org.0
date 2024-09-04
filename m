Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3796C0C4
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2024 16:36:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzQ6B440wz3c9g
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 00:36:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725460573;
	cv=none; b=HaVUo6Mxqy7h1C53ifVAQVNRFhEyadZEz8g/tPNUTf+d635Ixh7tckVc1/0TgpBeiW+/8vOq0jM0juFoD7cUDp/iEoLFUEf/UR7lFH5+Fj27PL0nAZBGFXtARpWfTm4ETplI38ujo/s1RuJ77JthbVMWUVx0iY9GpxdvwQ7WPvGC/ONqxKqwPgAhvtVD0PgpCu3tyaZiUnVGIUYqCpLDuA0MR0aAE2DGMQ6VfCTpEGc1tHlqv0f7aRBYm/2IbfBpzdVtoePuYX0+5mrK2wjw5NM8nJbt4aMhnzygCKzLkQFu4SfFmcLlKe9N0vP4y+d+0ieYIgIMP6uC2xVkX9oGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725460573; c=relaxed/relaxed;
	bh=kj2clCChKXuhbWZBnkwVBRKzmXG53AJoCdhdrolgS5I=;
	h=DKIM-Signature:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=NXuF5/SK+sOZyWGstq8OsFJXsqlZfkoAFjugvwtn5T/T/xWyRLUWRXkMLNynbTB9C37PCDa9E4XigTErcoeCliH7ZVUPjICNbn9dQ7SKrOP2GAsHU2jh0SAJhAo0oToiHXDE6+EV/+GGwz/K55eygJpCRWDQgN6ElLSsf3gOl9oV60d244aDlDEbyz4gKTLXxLhhEZ1GW923AjaEeHMQzk4Ib/nbu/IDmGN5oJpfG/R+7Bh6NadDaSJT+qRsYhKhxh0cHu4fgWFoBjLf/WExnzNMnbs48VlZdBiFrUAaC7x2R8QEanOqNaRD/nbAq2dMr1IUwkj1Jo3lzsorrz/QKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Vkfl7ylU; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=fJnzHNzI; dkim-atps=neutral; spf=pass (client-ip=103.168.172.152; helo=fhigh1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Vkfl7ylU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=fJnzHNzI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.152; helo=fhigh1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzQ620nXFz2xdY
	for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2024 00:36:08 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B846811401A3;
	Wed,  4 Sep 2024 10:36:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 04 Sep 2024 10:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1725460564; x=1725546964; bh=kj2clCChKX
	uhbWZBnkwVBRKzmXG53AJoCdhdrolgS5I=; b=Vkfl7ylURX/p48NAOGslch6Ddn
	/E0rsl73kM2vmSyAHP+Tkt+klkbS7uWBgVD1xXAwtfJoFP3xV9WYA9j4Cduaw7cp
	HRHmGvBrDJKGy2mxp05HivgtSnkLGn3Ldy+L9uZEDU75+nXvKz+mdAY1FbCburG6
	/t7BYGh6kPffSyflqSEiWdY8dEvPRg+FdqH+5OMTX0YQYKllFpZH6fz0zZIP+vMx
	yYp9uOmgIqdsLWatHRiGT0KexcnRE8KCCDMrZM5s6qoUjLo8MMYc6Si1tZFR5kd2
	UJI+ICIKR+B8VwWQoVhgTcYlJ93CB/xFpxc2SYifM8BIAjTmZmVL0inavE9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725460564; x=1725546964; bh=kj2clCChKXuhbWZBnkwVBRKzmXG5
	3AJoCdhdrolgS5I=; b=fJnzHNzIF+qBp0h06iIMsjoIg1BIziPjTWsX5CIoBLFH
	WziDnhHegs2Fpj13cw83UmAFlilNsFnKsopoxMvsD9HcO8PpuM70ktoico7+AYdm
	A9Je9gnGSlpG3v9BoYHbK5A2OY9C3utUZJ3yBYHpfiHdBHlFY1z1exUd7ko3SzrR
	BSFzzcQRNV02b7vnJxwhZJCsHssxxMtB8el3Y0upCnpTcyjsG3ELHYs/TPKKTEJS
	YanJubOLJcTEIHWB/m8Yw4Ron+cgImwwZN0InLU2vnAmtJWuzCr55eOt6QnbGM6m
	EGtRuPDIp5GUv3+GbASMiWQVgkBhG1/DOshp99+ZMA==
X-ME-Sender: <xms:U3DYZhMtH8OsE4Q7Qm-o0Aen-g2eZ9kxKZwOCvx2-PBH_WRuERb9JQ>
    <xme:U3DYZj9fP2YJzbVNdOP6vS-Es9Z6OruKjx4XLxyqPtQhv-J0Gn_jyTt74zU-U8t-N
    4NnWbKRjSvQS_tyW88>
X-ME-Received: <xmr:U3DYZgSAAuDA1tNs-7bKuUg7C19orM_Dhi30k7vcTUFcFb8a5LztolsA-A0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehjedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnegfrhhlucfv
    nfffucdludejmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhf
    hrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftgig
    rdighiiiqeenucggtffrrghtthgvrhhnpeejveefgfevteetvdejhfdutedvhfeltdehhe
    fhteeileffhfelueetvdeihffhhfenucffohhmrghinhepghhoohhglhgvrdgtohhmpdho
    phgvnhgsmhgtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtohep
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhihgrnhhgrdgsrhhirghnse
    hinhhvvghnthgvtgdrtghomhdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdho
    iihlrggsshdrohhrgh
X-ME-Proxy: <xmx:VHDYZtuFp2BYfA0_jOGcUCd1H1TJs97vsqm6LHhFUXE9vR0L_lyOPg>
    <xmx:VHDYZpeEvjURS67JKHFYzfjPs5lVXPFuPxM4V0asm1jjSjFCrqeVag>
    <xmx:VHDYZp26WLvyCFuOIOoZibvngP6r4_sm5ygqqb0EHFRMoIrNxBEgPw>
    <xmx:VHDYZl8Uyh3w4RdZ-mogsExQN4UVM0JTZmUEZfE8_MQ6ENV1Gc0p0A>
    <xmx:VHDYZqrthvEZjKTK21flpGYGaGFcj4-hx9qaJUD5skzDI8S1ZZtX2TJz>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 10:36:03 -0400 (EDT)
Date: Wed, 4 Sep 2024 10:36:02 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: =?utf-8?B?Q2hpYW5nLkJyaWFuIOaxn+azs+e3uw==?= TAO <Chiang.Brian@inventec.com>
Subject: Re: No CI executed in gerrit
Message-ID: <ZthwUrPeUpQEZUcG@heinlein.vulture-banana.ts.net>
References: <1d0f4c32d611462a9352875d0c054647@inventec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FzZwl6/VlYWzG7q5"
Content-Disposition: inline
In-Reply-To: <1d0f4c32d611462a9352875d0c054647@inventec.com>
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


--FzZwl6/VlYWzG7q5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2024 at 03:27:04AM +0000, Chiang.Brian =E6=B1=9F=E6=B3=B3=
=E7=B7=BB TAO wrote:
> Hello, this is Chiang Brian from Inventec. Recently, I=E2=80=99ve added i=
nto CLA and pushed some commits to openbmc gerrit; however, it still says U=
ser not approved, see admin, no CI somehow.  I would like to ask whether is=
 there something I miss

Welcome to the project.

> Or is there anything I can do with? Thank for helping.
>=20
> Here is the CLA list: Inventec - Google Drive<https://drive.google.com/dr=
ive/folders/19RJNsE9nnNV8pMnV-6Q63mbhDMXKTUo1> and the commits

It looks like Vic Ye is listed as the CLA manager (along with Liao Ray).
Vic is part of the "inventec/ci-authorized-owners" group in Gerrit,
which gives him permissions to modify the "inventec/ci-authorized"
group.  The expectation is that he uploads a new CLA and then adjusts
the Gerrit groups accordingly.

It appears this hasn't been done in a while.  I've removed a number of
people from the "inventec/ci-authorized" group now which are no longer
listed in the CLA.  I've also added you to it.

https://gerrit.openbmc.org/admin/groups/5b1703324528d35f782c95cc64e62eaf56d=
a34db,members
https://gerrit.openbmc.org/admin/groups/d649794b2286397677520b70b73d68d6a1d=
bbfad,members

> entity-manager: Strip space of NVMe SSDs PN and SN (74210) =C2=B7 Gerrit =
Code Review (openbmc.org)<https://gerrit.openbmc.org/c/openbmc/entity-manag=
er/+/74210>
> dbus-sensor: support the psu sensor peak reading (74225) =C2=B7 Gerrit Co=
de Review (openbmc.org)<https://gerrit.openbmc.org/c/openbmc/dbus-sensors/+=
/74225>
>=20

I retriggered these two commits in Jenkins now that you are in the
appropriate CI group.


--=20
Patrick Williams

--FzZwl6/VlYWzG7q5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmbYcFAACgkQqwNHzC0A
wRn20g//fewzRDUW9DaNW7w3Ayqo9XZe1nLVGQh1oQavxTNRYe0yzBYOJtCJTW5+
aiCFdbRcgRgVtIiDqwyeH2oI8Utcf2aVmb9MlWSkPHtYFJYTjCU3SkpzOdXbEXTu
7TT+z5iJZl7WlsIR6OpAnaFO6B594MSTD34tsYec3DlUv95gtYEOrTOT2ElyOe9Z
Wo28ookDVjzRFD01j7xbCT96OTLgRoh0fdglGARqD7EoBmbuTE4w/ZEczIkBlqZ8
liODdN5nyDpFDTPJuzDiAEdW85OEFPYuYSKHfe+gyYSr+LuzaNFbCU8E9ZWXJ0R2
kdkOHbJCRKZxNq5jVaZGjI5760pcE0nOxiiC9Rdb6egLMWD3c9IIJ/3YQ31u1M0o
5RDQNCKUde7nj9D+GoCDLiBr2CwrhhLkWJVXs4JHCpwcovwnuPWDSDQyOCv/dkyG
BFxPuTposElL96pPgb3iLGcOF63uMLEmbS5BjzJ0VdHG0LfZQ5AkLQIVk3w3Q4yS
01XZ4jDK0yseZeSj22NbJ3zu5+4G/OMCaRnbA4ls/RZX5RDct+4c66ptVQ4paIti
UpjWhS0WN79y01qZJnRVesDD39D0J4FT/UxSMzFM16djj0KXgbj/njqzWsiS3UOs
OtycDehHi2ppfqnTFgEaQVKa7ELFwC/pS0FWZm68Iyq/jYL99E0=
=LBC3
-----END PGP SIGNATURE-----

--FzZwl6/VlYWzG7q5--
