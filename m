Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55082424049
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 16:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPcb81Jk6z2yn7
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 01:41:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=mFKxuLyX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=moPqGsVk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=mFKxuLyX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=moPqGsVk; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPcZZ3rCPz2xZH
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 01:40:54 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 922E45C007B;
 Wed,  6 Oct 2021 10:40:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 06 Oct 2021 10:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+o7lQETVX/iWQyZ15RIR9HDw4ja
 HWM7ArR7OXQlPOEw=; b=mFKxuLyXimVJCqnLJcadR0nVEfzYuHcND8U4YPoIpJQ
 iHmjGqNtPvUKbCqH6HwjqAK92OnKwy6OnJ8D8Qzzx7x9B+/L+woujk+Jsbdudi+a
 VmN9CckxYdOBIRNiThGSEJ6BEpIWAWfnwqLqmqVPeB1a+p8yYMxLjn0/CNuoEXcy
 sp9qyOQlq5KE/YltysH0DqZgbe9AYdhj0DEl7LN7x0EOo311FOauBlFDN8/oobD7
 Px1rskxkEX8fZH09Tjq6TBKERaYj+YKf6gNv78Bhroa+d4ZAcZRfLooHTSiPjEAr
 whlx90NvIExX9IlhYoggyiP1+gLOKpsGhcEyMB6lxvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+o7lQE
 TVX/iWQyZ15RIR9HDw4jaHWM7ArR7OXQlPOEw=; b=moPqGsVkqL655GgRkK8WbU
 mFXr7qLRX9gOWj2mpe1Hji1ysT2vB+ZMTY5cUgj5TLs+ke0yoFADOAdMTUJOn2fq
 OrjLWlOl1CYjwPxNcQIkg9Zq/ElKOQ7SYewCKhIE58x4pypwrgmC9HnMwwZQvVD8
 YVyQzg19rzMYjUw4TCQst0KbHk3KRRBetAE+FS6T7MQEzBQEzX2YX7P4egpnkOpa
 5j587QUKTIc6+KEzDbkV1OxYige3RmiYKrsEqdegHHCTR2c1fegSwboKjnQLsWwh
 6DGeM7AukLrrSHBBpFWMs6QDuGvTq87Aw/nRshUsolpemEplk3oufddbst8aGzxQ
 ==
X-ME-Sender: <xms:cbVdYbuXhLhAvMBWYQX1MMe7eJi-Lsys65K3Gx3ca0SBk0DHGN727g>
 <xme:cbVdYce4IAN4H0h3grEdbwS5ywiSPdGNNCnfyBdkelsCHnNHl5h-u_m06ISJG7ehe
 lk0bou2GV4NDeGlzlo>
X-ME-Received: <xmr:cbVdYezOxZsbcWKE6CyJHrxlhYBMRBxHPTRhQXR1QIZ2MEAq1l0nMimEyz073QzT2xCB3Te2fm9m020p163BKBqJUw3U1fpdYZNgC59utr9W4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeliedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:crVdYaOOlLl7lMEfBppuhe4Kvf_aA5OkOog1ucrgNaLWb8q5rp17wQ>
 <xmx:crVdYb_x7pDIKCU-Tm85V8Heqk8qzzvOObQEUiltc11eF9J8qumCQw>
 <xmx:crVdYaUk6WGP1PpWTGvd5TWx3xmBN3c9fvku6xjnqSrRVZY8HxqbXg>
 <xmx:crVdYbxhA28zLVYOOSe4bHXhr_UmTEmvcvrtWGERagIIFI_oFyZIHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Oct 2021 10:40:49 -0400 (EDT)
Date: Wed, 6 Oct 2021 09:40:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: support for gpio  as ipmb sensor
Message-ID: <YV21cD3HOOGi7K2f@heinlein>
References: <PS2PR02MB26959672C7002D26EB5F4A4691AF9@PS2PR02MB2695.apcprd02.prod.outlook.com>
 <ef4d5ac6-49e8-40d6-9e6b-1fe030f3909a@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KbnuAfPTwmKEZNJ+"
Content-Disposition: inline
In-Reply-To: <ef4d5ac6-49e8-40d6-9e6b-1fe030f3909a@www.fastmail.com>
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, naveen moses <naveen.moses@outlook.com>,
 naveen moses <naveen.moses@hotmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--KbnuAfPTwmKEZNJ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 10:46:40AM +1030, Andrew Jeffery wrote:
> On Tue, 5 Oct 2021, at 23:46, naveen moses wrote:

> > So is this acceptable to create a new interface for gpio state under=20
> > xyz/openbmc_project/sensors :
> > interface name : gpioState
> > which has a property named value whose possible values are boolean=20
> > (true or false).
>=20
> What about modelling the behaviour the GPIO state represents rather=20
> than just providing a DBus interface to the GPIO values?

Agreed.  In general we've tried to refrain from exposing raw GPIOs on the d=
bus
and instead tried to model some behavior out of those GPIOs.  Your use case
(wanting to use gpio-monitor) doesn't really seem strong enough to me to wa=
rrant
a change of this direction.  You'd have to add support in `gpio-monitor` to
watch dbus signals, in addition to gpio-lines, and create a new program that
exposes those gpio objects.  And, at the same time you're introducing a poo=
rly
documented API between two dbus providers because you're expecting very spe=
cific
name matching.  Why not just have the original program do whatever you inte=
nded
gpio-monitor to do?

--=20
Patrick Williams

--KbnuAfPTwmKEZNJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFdtW4ACgkQqwNHzC0A
wRkd1g/+IMNxWaIGLrXXbWTOIejghFwwOHtitKjWvl1M4xNtHJyCFgUFkzPEE4NB
g2V7yZewaZC87Seqhd7A8Mkx7AAaTJu6nyjpQ3dvzDys3iwAf4iXxf1O+7JB8gXo
mxMqIioyI3Cem3NyAy9mwHjFub9ATsbYlqFgkk6IAeuSa6pC3/BO3HpSC6Ljc2QL
QGkL4/uriBxbq2xTsrJGU7dj92+OqGXshC2FJ5jWJMdYc6vf4+Hp2dRuYKRZFN9f
Gnettag9NIt+Zr+y/eVKd7qS08nihhxxsV76blVNoezqpiTGkFh3AKb4GB5n4FYx
ZXKPaWn188XN/WS3yPBVCu8XNu3kKVqyp99OzW/JSDN3KhdamgEdStzPjPqLuvZb
Mxrc+FQ+ArrbutjFIbmIWTeqILQiMN1uwjzqx3v2B4Vo9jFsPO3vELS+3X5Jsg30
cmljifB8ZOCZCGzT8ZXR0v1BOnYGIaAYmZq1EYk9091H+uIMpwh9nJbFtDIK6WL0
g53nKo7jXItJHF7SqANzELeRHzOH/hIYJpZfeLX6a5PKLmm63OMIlE63SbshySkl
eOXuIW65U24u70Ngh9U+JRcqzWZp+V3HlQREj1gBtlW5cT9ZOeO04eTmtUevx2ao
CZbFtEXVT0H+a+/Y5sQJSbbowFOtJGKxA58VgSbbF+Wzeh71WrI=
=oHHw
-----END PGP SIGNATURE-----

--KbnuAfPTwmKEZNJ+--
