Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC2290C70
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 21:49:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCcCs1XYHzDqNt
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 06:48:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=pM5iiqYA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=d9SnCCM3; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCcBM0szwzDqY3
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2020 06:47:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A3F83DD5;
 Fri, 16 Oct 2020 15:47:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 16 Oct 2020 15:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=60CBkCDJMq4yzKeZrkgktupYwbn
 yc3IFnvfxqYjVIYg=; b=pM5iiqYAJFE/0VQ8GChKYZS+u2puO0u4VMWMWgEVPEW
 XWmoVVGoDS8DjjpMnFOliqE0nI0lTQcmQGL5aQnnKW10K1OYcPZ+8cT41SkgvcP5
 s4YRVSvEeodY7erG0Jk/4x2fFXyDfZbpQIObZazgow8qog7kAJjuQtIPf/NIY7iN
 grTSiEkaJZwakdwbuFID96+GNTGcvIuYdk/0pviJGmMXuImIO8sBz6Je3sB+XLEa
 A+8jVmRDNcttNu1aL+C9uhT1oKQwVrOOFp44YW2hTAZB9I87DJt22m6K8AuPfDWJ
 ZzEcGYz+DyoWWyT4CCRKXoPE5KSsc5J+75JIRlORWpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=60CBkC
 DJMq4yzKeZrkgktupYwbnyc3IFnvfxqYjVIYg=; b=d9SnCCM3LutdxkitbHuFhn
 jouj08JrQnLeTzU6i6md2D/3MlggmFqPUIS/Dh2J3FSLRaDOHYh3i7mjIBBrKkS3
 h3GaQkRPtQXNxKF69IRXaz9mujmmKdyk7qW2z0QEFIyDPY4P4YZiU+A99CERprC6
 VlJDsC0VhE+C5VLwdmsmUWTbtCbW18gRXzikcTPaSJzA3X3yPmEQeqTiS3wmmHcF
 fur9zyJ7fiwUSAoxLkeq1XkMvegUE224dH00Vz0nlwtWE1P3s689mamvrft4qnR/
 9zpn1gK52pBdMPHcf8lDLfJ1xnvJZusFOGLGvos4zJ4ZLDiIKhJ62hq4bPdtTpVQ
 ==
X-ME-Sender: <xms:1fiJX1F2YYcHh6LR9GQCrK1KjuX5bvfQ-nHbb7QzPpWiICbUjT67HA>
 <xme:1fiJX6VCbs3xRzohbqalCSY11jLnIEEgS1bwTG82AdsbNOP2b_rwX-P8-LnfcXM0G
 YBly7sV4CALzXVUSMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieehgddugedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:1fiJX3L2TgUOcpbS-8R0KrwSSvq8iT4sOQZ98rs-MdO3wxX-V7eRAA>
 <xmx:1fiJX7HGBIbZzTRxav6ZEsCuZrA7oSvMZxQpe1RnmOJhGRneGazMEA>
 <xmx:1fiJX7Vj-z9ICzEi_iPzpVZWXynikr9pBCP1HOEEsN3ZtB14PESN3w>
 <xmx:1viJXyBFOIOitNQAEOrloi39-JLVokocLqeZnS8BORPDrThUXoMsbg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64A91328005D;
 Fri, 16 Oct 2020 15:47:33 -0400 (EDT)
Date: Fri, 16 Oct 2020 14:47:30 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: James Hatt <james.hatt@sanmina.com>
Subject: Re: I need to build an OpenBMC image for a Portwell Neptune card ...
Message-ID: <20201016194730.GA3614@heinlein>
References: <CAABA6JmNH=AfzCE4aE_NuYCv126fCXOcexSq6O1C8+DdT6K1Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <CAABA6JmNH=AfzCE4aE_NuYCv126fCXOcexSq6O1C8+DdT6K1Jg@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 08:00:14AM -0500, James Hatt wrote:
> Dear OpenBMC,
> I=E2=80=99ve been handed the *opportunity* of building OpenBMC for the Po=
rtwell
> Neptune circuit card. Of course, Portwell is no help whatever.
>=20
> I am new to OpenBMC. I=E2=80=99ve built Yocto Petalinux machines before. =
So I have
> a little knowledge of Yocto. I=E2=80=99ve lots of experience with Linux a=
nd
> embedded systems.
>=20
> Where would I start?
>=20
> BTW, I was able to clone the OpenBMC repository and build the phosphor
> target without error. When I attempt to build meta-portwell/meta-neptune,=
 I
> get errors early with bitbake. Since the Portwell literature boasts of
> Facebook OpenBMC, I tried their branch and that failed to build also.
>=20
> Help!
> ---jjh
>=20
> *James Hatt |* *Sr. Software Developer*

Hi James,

I'm probably the best to respond to this even though I know almost
nothing about Portwell/Neptune.

Facebook OpenBMC is not a branch / fork of the Linux Foundation OpenBMC.
They are entirely different code bases with almost no commonality.
Facebook OpenBMC started first, but the community has coalesced around
the LF-OpenBMC.

It sounds like the Neptune port to facebook/openbmc was a project done
by some engineers at Facebook with little involvement from Portwell.
You'll see the initial commit was from a Facebook engineer and there has
not been any further contributions beyond minor cleanups to keep it
compiling by Facebook.  This work was done ~3 years ago and is not a
fully formed product.

The openbmc/openbmc meta-portwell was also done by a Facebook engineer
about 2 years ago.  The content seems to be just the bare essentials to
get a basic kernel and openbmc/openbmc image booting on the BMC.  There
is really no support code beyond that.

I think it would be good to understand what it is you're trying to
accomplish with the device.  I could do some small amount of work to get
either facebook/openbmc or openbmc/openbmc compiling for you.  If you'd
like to get this integrated into a real project we should probably
discuss what the needs are, but I likely you'll need to handle a
significant part of the contribution there.

--=20
Patrick Williams

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+J+NAACgkQqwNHzC0A
wRlAYxAAne/GBZRVsatDF6dG00issuFtSbRJOuR8Vr8hfpQYiaKdGh8sEWO6L/3s
rgCQKNx3ktQd/dbYVEX695EYUYah3I7oLh8c1gbCPhAWV3/zxlCh5YGhN1FD9Liu
wemZ/EN1LFbfVsdBWYlOqHVOIhm4jHCIws/QG+CPm8ja3ZPzos/Kzq+GedPcVF2B
O7AdgazzB6Ubr3DptoAyRw674cuyXOK+f+7b2dSccELufIKt8N9IV6zUv/k6NSC7
1EljlReRaluSsAyrajAGyDZMBypJUck1D7V2sDUnCM5dIyCCqoxYTwXHVEjw8VmR
VYoCsvrIr11rA3Xp1WSvFMYHr1EaADud7Q/1sOixkXPqkVX+pXJuFSw1q0Zk6jtF
sMcGwUoWBWrt3bLliJv2gYKsyVCU4w1cSWqtQAiAxf5BoXujSKP3NTH5fYwepos+
f7Hd0BzC1G3w6xiMw7qL7M8PmV/NWxhj5gsZv6vjNI3FNkFUjnU5YQpLZ7Nv8Wd2
TpkxU7bGyxrAPE+sTkwOPXUWBupsfHFgt5uHMwLLsf+Gb8A0xbT5B7oebp9B6+Pj
TrND8f4GCt2V+5hkVF1bjI4pjQVWeCx0e73BRX7SMONxH8K4OWRATeHn407B5wWm
1EnoU7uKlYq2p/K/1RnHPiwXxkdAgjgXs/hgJwjDNAwRQ4fS8U4=
=huSZ
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
