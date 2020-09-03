Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 740B025C63D
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 18:11:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj5Qd4RMwzDrBv
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 02:11:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=MQn2IOQF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=dAm96hBA; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj4bP6bPWzDr3G
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 01:33:53 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 797315C02D6;
 Thu,  3 Sep 2020 11:33:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 03 Sep 2020 11:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=O0lPgva/Lu06yhbuOVlj5JP5sjo
 snyV+g3E/h6ft8YQ=; b=MQn2IOQFklGPM1blZrA2KLgQC76NZdRDMg/6cnGUfgB
 WSkewLJa5c6QZeAgTdUYsvpqyVQIPJJBjkgWIq9XCBfRbXcqpbHswx/5CYQqOR3I
 Ps8x9fDsks5LzHiYjC89SqMvSigUC1Mwg+yQgFSWtsLxq2ThcKTla7fmTMf0E8Ub
 SaKg2qKJQfOdNI1RhlZETv34Q3o7Lfx3ve6evmns7N1ZwIVk1PE2iGTzSw3E2NVf
 lG/8bZycXL9RhSUFcuCsPiHhvoOZRpvLe21bNWBooWTFrUlZCYtJPJA2pMsvBus9
 kmf/zPOYtOlVWs07Eui4DU/Lhp0ah/xa1Ud7+tWPjBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=O0lPgv
 a/Lu06yhbuOVlj5JP5sjosnyV+g3E/h6ft8YQ=; b=dAm96hBAvkAQfUOKGQcC9p
 sE4OP5LR96G9AK1pNr2OSqhzMl9uilzedRNEVQC12OMR8gZRk+k7Cee+Pu+HpS70
 IpvtXak2Cad5vw8KaPIviHzFhgYrMa44JE4Ngamqb+99dXNHxvQEAeVhQt1mz4p+
 vNoAoTFUBdRbxdY6filWDRkHh3ZrpNcdDLtK/bakzwDp92c9x5s0kZNL04qPJSPx
 5Ce8HEmdoLcdNQgNY6OwzVcBX4oH6KVBjYjdPIV45DvMkzZnn/XVlo9SuzgQHb3O
 9Njwdp0MndZltrUVh+TAzuZleNub/Pvjhco6q6mt6T46CwGc5qUnB17eyyt9Yqgg
 ==
X-ME-Sender: <xms:2gxRX2M8u3YqOi4gqcwbi7FerObhjuSTpUDDlcE7D79XYl_gtvkR1w>
 <xme:2gxRX0_EM5Oe3TlJ9aoDvl3kMvudDkxiYnXRJYtnYi2uCNlT2C4V9f0KBrhCcdhGw
 N6IzZH0tOtd6ihijjI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:2gxRX9TnnaGm2iS5B5-EuHz1nWo_Un57fob68QbUPe5azk8MkVPIsw>
 <xmx:2gxRX2uZ14KZpsAbEM9ZlmMj4ZhJV2L--8o0TFLw_mJDArztv3M3Qg>
 <xmx:2gxRX-c4it77MGauswrq-Vv1U4rBOilFwNQs5X7YjRHkK7GHzWFuZg>
 <xmx:2wxRXyFH4oJU6RwZC7JSodD29COfsbyQK6rgawwOW3kgF8OqOoIjyQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39CF53060057;
 Thu,  3 Sep 2020 11:33:45 -0400 (EDT)
Date: Thu, 3 Sep 2020 10:33:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>
Subject: Re: When building OpenBMC . . . ?
Message-ID: <20200903153340.GB57949@patrickw3-mbp.lan.stwcx.xyz>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
 <2249bb47512947dab406345cfee1206d@SCL-EXCHMB-13.phoenix.com>
 <20200902191019.GY3532@heinlein>
 <5455ced096a74069b08230ad9a46a945@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <5455ced096a74069b08230ad9a46a945@SCL-EXCHMB-13.phoenix.com>
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>, Ed Tanous <ed@tanous.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 07:50:07PM +0000, Patrick Voelker wrote:
> My understanding of PACKAGECONFIG is that it's a way to provide build opt=
ions for individual packages.  In this case, what PACKAGECONFIG option woul=
d we be contributing?

Yes, PACKAGECONFIG is for build options for indivdiual packages.
Similar to FEATURES which affect multiple packages.  In this case we'd
be defining a new package-feature to rsyslog "don't install this file".

Sounds like the `-f` proposed elsewhere in the stream is reasonable.

> Is there a way now for me to force bitbake to ignore (or not use) rsyslog=
*.bbappend in meta-tiogapass from another layer?

I don't think so.  Layers have priority (order with which they are
applied) but I don't know of any way to mask a bbappend from one layer.

> The two appends that are conflicting are:
> meta-facebook/meta-tiogapass/recipes-extended/rsyslog/rsyslog_%.bbappend
> meta-intel/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
>=20
> Can I choose one over the other instead of having them build upon eachoth=
er?

I strongly suggest you don't do this.  meta-facebook and meta-intel
are two different machine metas.  There are going to be conflicts
between them because we've done a poor job of making sure that all the
machine metas uses VARIABLE_machine append syntax everywhere (which
ensures the variable is only applied for a particular machine).  That
isn't to say we shouldn't fix those things, but in the short-term you're
likely to run into a lot of issues.

To step back, what is it you're trying to accomplish by including both
machine metas into a single build?  If there is content in meta-intel
that is not machine specific, the direction seems to be that we should
move this to meta-phosphor.  (Brad started a discussion about this on
the ML about 2 weeks ago.)

--=20
Patrick Williams

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9RDNQACgkQqwNHzC0A
wRkjxg//THfjDj7hkfn4p3XbffH+NyfiAvk3HoQZVpvBg08/LbU8ik265uXoz/9m
PpvEFKA+FGrOOWC4qKOlPpMdFsHr93MG7dxGdudbZqkgc/9BgScXis5l18nfJGYA
sIyJCrLY3NhbwrYi5f7wW3DRNr13zOmxJgI9hXHIaWzAjodC6qv6BiW2mPsoOsL2
4VeOUlzlRxYlU0C/Mg1qmPCaotLgEy34pUEIpRT1XsbUIW3/Owh8ckCoNYlyUCTi
JXBXAPobEybl29QL8ZwPgBKMt1guNbmHZ9jTIElTGAMMLKO9aenG2nNIa+LzL7DR
hWEbujMG0GBIb8qz3A1pbXeJrOZAmzVMRSfZrpF4m5ShdyO9PBn7HQLUWRHF6smR
4TKXRCsCW/cBvz5ZN3DLRwpUAKs9ORENSw0DbC4U3ENNeVkm77El1IlzfYMjLaBu
lX5dAntcUsUu5lSFoGMKl2g11Q7QAfltnzqCPJdyEAfm01TypAq00EWO9Wq3W9ae
EqjMiYpzRYWQan3RlOZaIUYvZLrYOh8E+b79oewLb/PGoOng3InA8d/MSxI/GVd5
vWgOXiRrfPMaffWew0uilh83sHsc7PLEWKKEPD9e6uZysuVrDgR7lQGtRr75bWpA
IwoU+wE1VMFlnUjdOtaQ9yGSjNlG4TOK0qlpaylbUvkS0rq9QrA=
=Cq/W
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
