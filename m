Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267977A1A24
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 11:15:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Ah5Cfuz+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T6a7R24R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn7nv01LXz3cSn
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 19:15:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Ah5Cfuz+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T6a7R24R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn7nK5ynDz3bdm
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 19:15:01 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 629B1320096C;
	Fri, 15 Sep 2023 05:14:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 15 Sep 2023 05:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1694769298; x=1694855698; bh=QH
	ZYGeGA/og3uih+23DfIqIfEun0ID9byosPviVYK/0=; b=Ah5Cfuz+KFD1XqIBRf
	PNI2g1FQf+7ydb+OkAFl9QCz6yws/I7CD4TnIJ3CSeNpVYELXdQ0LpvhkthD+36Y
	Xv+Dcu7+NtYO5qApyJNzsGAG/5w/VsGQYeGPe+Vg1rQim3D2YNv9oAm+Dt8T2tTX
	RFZEyHQ58Gq26lJRRCNfRjMa1jYqV63XUtaakP5xHNkXeihaGh4VqU3pCT6J67OG
	5RJGvHjsj/azUM/4eL0NqlgL9PLfP6o6DxACa2FZ6zCrsn6QP63+IZXPeuBzXpky
	Ek7QnCfuTqRC+kZtzOYpqqnNu5GycDDCpszERY81v21XVj3jkIi4E67T+l2cuvWm
	8CAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694769298; x=1694855698; bh=QHZYGeGA/og3u
	ih+23DfIqIfEun0ID9byosPviVYK/0=; b=T6a7R24RCyVmCdpk4AHCUQlyQPFKM
	dsfkwYcjOA6LiPm+PDHoMwYorFlC1e9z0zQjy40DF3r+VdmYFRjHsg8ILyAdNE/n
	tsBwattsaIT9r+VKpiNCeNu1brVN589i98uo9RBeFFyegOSMdOxYPtFTgvwlHUqU
	4auNw8pft2ppqM994WZ5/dr8DIvop3EtChQZkHKcFyG8Iv0bCFTXE/XCVlm94LDV
	2Ym6UikqWMhSzcEafXbXV/sk7u6MQdS/2+B9mReaYErOU9KAh4TXA7/AElA0JDUd
	qmHOMMJGZ1tabh2cLJCQYKIhzcQyYcWdKiT0JlQautw7cA568oZ2wITOw==
X-ME-Sender: <xms:kiAEZYE1_V7Jtu8yuZFmKxa4L0Kete5YuZLvHlPXrFLfGZMtjIz5tQ>
    <xme:kiAEZRXKw2jbG5dhH4esSSj1nR6XOsJnHsMvzQPf3WCSLtuv9wqNtOFOCo_G3DRo3
    rq--K7AmXS0TWBH0j4>
X-ME-Received: <xmr:kiAEZSJBqPvy87ODiUPcXDD1ZJOVB3W6cdQFfR7WNTGcAUdGgob-1TYd0_UdjdKus7Gqig0yNwasbsEgbA6LUllNWkd73RPfckY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejvddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:kiAEZaGzYx2fWI37ceoKaKOanWEYZBSQT_eenURkjKkWe7HZsa3cJA>
    <xmx:kiAEZeXlhYnM0sQ1y7j72EczAP_TQOiVHYRGVD62rXp0LWdipDgQ_w>
    <xmx:kiAEZdM8keDroPUrQWbAku0TwGDfMUl1HBCzKe9k0uHk9dkT-s25vg>
    <xmx:kiAEZXegW6FKa7MxrNTosSxfOYiVo1V88lEtjgql_loKwzKamD3LkA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Sep 2023 05:14:58 -0400 (EDT)
Date: Fri, 15 Sep 2023 04:14:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Towards less magic strings.
Message-ID: <ZQQgkQyF9nK8H_pt@heinlein.vulture-banana.ts.net>
References: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
 <89fe1392f0a35c6c2ed14d222d2d324730dc4b44.camel@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eHp4CbdWOKOt48+K"
Content-Disposition: inline
In-Reply-To: <89fe1392f0a35c6c2ed14d222d2d324730dc4b44.camel@fuzziesquirrel.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--eHp4CbdWOKOt48+K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 10:33:10AM -0400, Brad Bishop wrote:
> On Thu, 2023-09-14 at 01:36 -0500, Patrick Williams wrote:
> >=20
> > ## Service Names
> >=20
> > I think it should be rare that you need a hard-coded service name in
> > your code, since typically you'll want to do some kind of mapper=20
>=20
> I would actually propose the opposite - we should use mapper lookups as
> a last resort and prefer hard-coded service names.  Mapper lookups add
> latency, and require developers to have OpenBMC specific domain
> knowledge to do something that should otherwise be simple and well
> documented.  Mapper indirection also prevents the use of dbus
> activation, which drastically simplifies service dependencies.

I do like dbus activation when we can and do think it would be
beneficial to transition to it where appropriate.  I don't think
anything I've added would get in the way (except possibly that
opinionated statement you quoted here).  You can certainly document
service name(s) in the YAML with the support I've added.

I'm not positive how we get to what you're proposing from where we are at
though.  There are a good number of dbus interfaces that are anticipated
to exist in multiple daemons.  Sensors, inventory, software versions.  I
don't know how "interfaces should live in a single process" meshes with
support for PLDM, Redfish aggregation, and multi-host designs.

Maybe you could have a dbus-activated service for
"xyz.openbmc_project.Sensors", which the providing service for that
in turn has drop-in dependencies installed by all the sensor
providers (ie. sensors.wants.d has files installed by each package).
I'm not sure how a dbus client finds all these services, unless we have
a set of registered daemons to look for, but that seems to be just as
latent as mapper and precludes non-open daemons.

Do you have more thoughts on how we can solve some of these intrinsically
dynamic interfaces?

--=20
Patrick Williams

--eHp4CbdWOKOt48+K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUEIJEACgkQqwNHzC0A
wRnNTQ/7BMIFlWritBoDh/dfm0xF8cbvCVXQmC2xK+muQv3zPa4WelEvrSw2m3tv
vqeOq4sNE2qszoyRhVSc4MCMEARj/sNKPcjljkAWTSqtbIgnTRkvLTP6izMjD2Vx
qP52X99XAc/5MeA9sAOX2k9VcxqkCkS5noDmBAwCLTnzVs4Db4wRUdig0wzYSOJR
8zkv48Asbi1apIS78BeKdd+lXh7O1JngaQQyM1W0Ynig8Bwh/72MVh6yO2GDPMLR
oSPjVLm6yjBnwa/m7YAdk+0Ieqj2iHB4eCpC1SwsIMYSVFE1zlzJeMZ6Oa52ui0d
1I7oD+YqTATBRQvxOF0FA0V8eqBFKHq1Ep1H5mEoUFPyxt9OXxKtT7GiGSCTjsN5
QyODNZW0M4tbyoCmN5R0AoFSesKMhVwz1HgH7EvH8C7XpPPmCeJeWUxM1P9wIpQm
g3ke5r9/C+fwsE9WHdMCklWfF0hwguM2sOT0qRLPtxKknQfG/JzwobmWQgUp6lfW
G3yth7snDldtLXoUgiaxDuuQcm2J4JL9SWM62S5P4VVjqGNkgTi3j42/cxjS/5Ix
Dffierx3ZhD/sC3i/cCjB5suLtvE5J4uwX6NEvHtwTpsrRlK9iSSv6AtcgE/jrnf
gh0SLlUjxqPmCG3WA9scM/SOYDquYwetbPAIyDL5PQWv4TvsqIU=
=pcwu
-----END PGP SIGNATURE-----

--eHp4CbdWOKOt48+K--
