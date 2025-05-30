Return-Path: <openbmc+bounces-108-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 315D7AC9018
	for <lists+openbmc@lfdr.de>; Fri, 30 May 2025 15:26:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b83sd5TnLz2xHv;
	Fri, 30 May 2025 23:26:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748611573;
	cv=none; b=gaK3D9OY/H49Y+gaBgDfcm5fJWP1WaJUlrHQoKAMdTYQDDX/Gxy40aiS5m6DgFdzY4Vxt7VPj1nMbpKUNn506kMKdJSfa1QdPoNhc191YjS/+RTKPTHQvfr3ll57PoFX9KaPuZVXz/JmXJPcb0W6BwXSZIig/XQ4kUl5YkpWGolizJ0ZjbsA1l0Xr+VAKu5b4TNxF4Bv7hnu2aPJyURza/IgbvEBL6B5yjxhL2Uqb3L2Qf8D/rbs6NUhCfoyk04DOFfBcQTSujnJgdjypnm575G9zsGekfdT2LiukCiDodDRbgs2qBM+pRyzB829fjZYG56A7PW76SIJO0csfaDEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748611573; c=relaxed/relaxed;
	bh=+uJ1AXheX/NmP3+qYSRnCX+DH7eTPCC9/8u5gpnguPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCclj8M7PW0Kv0y6XRGov1lN8svGN+YZkKA9I/kGXY6DIAy5/az+KnHv5dH5SnjMl8bH7hE14OgRfssYlva8ZczHgMtO8XyIPXDMRBxOHiIIaaO4Bw8rFLsy0/cqc7EXbiXsI90+DPU6goNqqVp6ChfPEd2UtuVAkIw6kuAANQhG3vyY7CyMYpZisoCK9sL0qheSYmqP7dYHwMMOChtbv0rgwS16/gf/7Jeijt1v6DIf6i3YYa85G3SiCPJvndKTcitx+IhiqVRDJ1GW2bgBVtKQ7BgRKbEYpdTt4d0OD2gCRVmFIUSPnDbOHu0ke6dPnh6eRcrbTc5HJVzTZPhHZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Kp59rzIb; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=FdKf60HZ; dkim-atps=neutral; spf=pass (client-ip=202.12.124.151; helo=fout-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Kp59rzIb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=FdKf60HZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.151; helo=fout-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 499 seconds by postgrey-1.37 at boromir; Fri, 30 May 2025 23:26:08 AEST
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b83sX6cCcz2x9N
	for <openbmc@lists.ozlabs.org>; Fri, 30 May 2025 23:26:08 +1000 (AEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 1DFB81140131;
	Fri, 30 May 2025 09:17:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 30 May 2025 09:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748611065; x=1748697465; bh=+uJ1AXheX/
	NmP3+qYSRnCX+DH7eTPCC9/8u5gpnguPI=; b=Kp59rzIbK1z/4Wba03XCp9Fr7m
	lSdomNgvuTrIEpdHGcTM3AZyHnM0puqZJo0CqQACRnW4Ih8elEeWWUoLLh+oTmz2
	DVmc5+g1dOjp+qdx5JM5Z6M2JZlhXqi1Lyr67fqd9OKBFoSLJSqv2ss3bWPtyJK3
	30GF8FCv+eqKloVYZULfYKUjwa7T9vfjUNzVPfCpg6+MBitZxHIcVaEKgQaaLGMd
	HeQSasIS1nHeHqh3k3J8pQkHurSDoWQKFiHSA2UK06qH5lcU2Srwf+1293Rqa+Bj
	5k9fhgffEqjFtBnoh766kgF2dCA28eR8S7JpQ7u5oHk3X4FJfzfvsedbiQMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748611065; x=1748697465; bh=+uJ1AXheX/NmP3+qYSRnCX+DH7eTPCC9/8u
	5gpnguPI=; b=FdKf60HZSxjCj/MGFArPUK5jDTK7RSOwKVue1ncse8snKDqC2fB
	pB+jjd/5yIYEZ4gzkPbA1CKe2v6ZjB2G8S8sO++NJbSwKL/6+6Sh5tMmJWknn+AD
	KHLzK4IQy9B0ZJj3ZH/Ve+BGaUnV4BM+MWeq+FSZVyx0XEoC1djfmklSOCWbubIT
	jY8JpEGCuxt+Hekg4rZ11Kar7Sm/kbFNsqvjq09LTzMTfQ9KglQQRZatmjTwRmVb
	i8ewwEJuOovJhRNyHkiflFNQd3efv18K4ZzySXoGJoHbWZ0OhbfukNo2cYvp0Ozd
	3l3flbi3+vYK6B71GN36sejaYPN+vOlKFvQ==
X-ME-Sender: <xms:-a85aHRBOQPL20P9zYXLUdU8k8wP7ob1McD3H3y6PERKaC8btLpJwg>
    <xme:-a85aIwyFQdyGA-Cj9-Pp-aaavqKE0DJDVl8uhcgHgYxWUG8XxFXZGM7hm0ga-dv-
    LBRU1Bu_3eA0L8d1Nk>
X-ME-Received: <xmr:-a85aM2l4AdYQtloLfV-Z-4XDccY5XQtIRKMO1MKyKxYrpRxV52PmzJr0wM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvledutdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
    necujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomheprfgrth
    hrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecu
    ggftrfgrthhtvghrnhepledvtdfgffdvgfdvhffhgfejtdettdduvefgjeehffelveejtd
    fgfffguddvkefhnecuffhomhgrihhnpeifihhkihhpvgguihgrrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
    htfigtgidrgiihiidpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprghmihhthhgrshhhsehmvghtrgdrtghomhdprhgtphhtthhopehophgvnh
    gsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopeifrghnghhkuhhi
    hihinhhgrdifkhihsegrlhhisggrsggrqdhinhgtrdgtohhmpdhrtghpthhtohepiihhih
    hkuhhirdhrvghnsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:-a85aHAyfBPE9sMh_JhtpAAtGCkBf9DDLUuQqBtexp91wvQxM7u6CQ>
    <xmx:-a85aAjetbxmZ_GXiUYAOX9kPw82d3bvl4fKH-kwNbMvleuVQBIzAQ>
    <xmx:-a85aLpVMd-eIpDs1Nf18bI8IGfynT1t9eOGqaYXVCTT8YErdOrbLg>
    <xmx:-a85aLgtHCGg_1EmTnhX0Qlu6fKaZVDWEzag0i8pxBl14mwACTWiGw>
    <xmx:-a85aND6DiOnCtQLKq06oWZuy-0G3Y-lS0hJ9af9-vx3HhGHt02sjub4>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 May 2025 09:17:45 -0400 (EDT)
Date: Fri, 30 May 2025 09:17:44 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Amithash Prasad <amithash@meta.com>
Cc: LF/OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
	"wangkuiying.wky@alibaba-inc.com" <wangkuiying.wky@alibaba-inc.com>,
	"zhikui.ren@intel.com" <zhikui.ren@intel.com>
Subject: Re: [RFC] Special handlers for post-codes
Message-ID: <aDmv-MAXX2QFsLlp@heinlein>
References: <SJ2PR15MB5801C8B07E960251A53DDF98AB61A@SJ2PR15MB5801.namprd15.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="OBrZzNgMCk3T7Com"
Content-Disposition: inline
In-Reply-To: <SJ2PR15MB5801C8B07E960251A53DDF98AB61A@SJ2PR15MB5801.namprd15.prod.outlook.com>
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--OBrZzNgMCk3T7Com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 02:02:20AM +0000, Amithash Prasad wrote:
> Hello,
>=20
> There are many occasions when a post code from a server actually means so=
mething is wrong =E2=80=94 especially crucial if a boot failure occurs befo=
re the part of the system firmware capable of sending a SEL to the BMC is l=
oaded. To support this, I am proposing enhancing phosphor-post-code-mfg to =
support configurable special handling of post codes.

Thanks, this looks like interesting work.  I know some processors that
have magic postcodes that mean things like memory training has failed.

How do you anticipate these configurations are managed?  I see 3
options:

    1. People add them to their meta-layer for a particular machine
       and/or processor.

    2. The configuration files are part of phosphor-post-code-manager
       (and enabled via CompatibleHardware matching from entity-manager?).

    3. The configuration is part of the entity-manager config instead.

My initial impression is that we have two different kinds of configs:

    - Configuration that is entirely processor dependent; any system
      using a particular processor version will have the same postcode
      handling.

    - Configuration that is vendor / BIOS / machine specific.

For configuration that is processor dependent, install option (1) does
not seem like a good direction, since it means we're going to be
duplicating this work.  I would lean towards option (2) here, but you
probably need a method to load multiple configs: "processor.json" and
"system.json".

I don't think this needs to be solved immediately but "which processor
type is installed in a socket" is not necessarily fixed.  For example,
AMD socket SP5[1] supports both "Genoa" and "Bergamo" processor variants,
which could require different post code handling.  There is little
reason why a system with an SP5 socket couldn't have a BMC that should
be able to handle both Genoa and Bergamo chips.

>=20
> Example configuration:
> [
>   {

Please add a name and/or description field.

>     "primary": [123],
>     "secondary": [234, 123],

This is a bit awkward to me; you should probably look at what
entity-manager does.  People tend to think of postcodes as hex and not
decimal.  I don't think we should do conversion to decimal just to make
it JSON-native; optimize for humans and (especially) reviewers.

>     "targets": ["my_special.service"]

Why do we need to be able to trigger custom systemd services?  This
isn't clear.  To me, this starts to cause the configs to be system
specific, which is far less ideal.

I'd rather see some well-defined "actions" like "catastrophic failure
that requires a server reboot".

You should also consider how multi-host systems, like yosemite4, might
be handled here.  We will have multiple instances of phosphor-post-code-man=
ager
running, one for each host.  If you do have systemd targets, they have
to be templated.

>   },
>   {
>     "primary": [999],
>     "targets": ["power_failure.service"],
>     "event": {
>       "name": "xyz.openbmc_project.State.Power.PowerRailFault",
>       "arguments": {
>           "POWER_RAIL": "MyDevice",
>           "FAILURE_DATA": ""
>       }
>     }
>   }
> ]
>=20

I'd like to see a jsonschema validation of whatever the config ends up
being.  We do that in at least entity-manager and sdbusplus if you need
examples (EM uses JSON for the schema, sdbusplus uses YAML).

> I would love to get feedback before I continue down this path.
>=20
>=20
> Thanks,
>=20
> Amithash

[1]: https://en.wikipedia.org/wiki/Socket_SP5

--=20
Patrick Williams

--OBrZzNgMCk3T7Com
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmg5r/YACgkQqwNHzC0A
wRkDzQ/9ETIVyoOa4UUJL8qIDLasATvpCCq8llQvpNeQsxrCYAENvD3ihla5I8p7
e73lMnHHD27SWNP53gJUJ5+7OkfkToPmol6HRxES667DKc0pCxqIE2WrtUXT1Bbu
EAH8sYF6OGAmPExq2ogLWaYiljMaOJrTdDDydXWoElzZ/F78aVYQINZveoazI0El
QC4QGfMutTZIuYgflgOOFck4Ft9l91FF1cVH9+cdDLnJ1cSEUJC63ybknNKpipYJ
0r7JX4fe+hTnmtIN6mG13NNmhdR2M8r7RgRUfR/y9ibPticwrzUgp3k1ZkHUgm/D
k4lHsLUbwt0kDd4mfHtc5QXziRlRVYGhm0Mke05432qRjOSc5FDBj3wMVybggHtc
RDOSghFlAWIhB7oyP2e2L2dE9GELWeI82xWyCuc7Sme7V95qxRFc8UgVd8NFR2OL
mJE5O1nzki6xg4xXVVwZbB7JplSOzz5P5D4lXAz7eLdBbkY6t6GT6hbWawS+RcCq
uOsHlFr1l4XH8BXo0A3B4Uh3CrByZOKxh+s0hz+3BJg4kSmYplSM69XOqKAJpU2I
Qf5JU1DZvYnaKkkGPbGVhGAJy/OO4omUznOAAMQR4haZ6cdwhUoeYlTRMD89AGFW
LE+ob0TqQOGG4tXfl0JiDV7+FmM9Po2zFuPV2TORJadu288Svi8=
=q+tC
-----END PGP SIGNATURE-----

--OBrZzNgMCk3T7Com--

