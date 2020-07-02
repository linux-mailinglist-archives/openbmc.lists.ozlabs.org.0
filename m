Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC36D212EED
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 23:34:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yWZc12DszDr6l
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 07:34:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=ZxOEdrU7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=BcpSehaI; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yWYW58MBzDr6f
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jul 2020 07:33:34 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 813885C0114;
 Thu,  2 Jul 2020 17:33:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 02 Jul 2020 17:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Zr95OTFnvA8FPbtTxUwVUxR+wjX
 e0K9xpEqjTdhMAfw=; b=ZxOEdrU7hPCS+TcRiteW6AjiNjGEeO0TgbTDDTqhlE0
 Re/0qnt/of4XgKBkNSLDmLXvqy8IhsBoGPpX3IyprKrVfonuDMajD9/BoV1LpkfS
 93jG3GtD+fXoWjfSX70XIfLDW9//qznRjxniORoup8PPtrqGY2BHrr1atOY0Xh9g
 BkRdU5FbqLbTrjb3iWgyB2tc9zC7KfWPcXfQLcSHd/iKyvi1V8TKWGzHqCS16jlq
 k2KaVQwLpt5O6czm6VvogpBBPh2uiEno2tka9b25qizExolylCGgFgSHOi8vCSZD
 +wuZYloHAYvSdw+W7iHu9jUrSV0Eqt+HM/xijS4in1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Zr95OT
 FnvA8FPbtTxUwVUxR+wjXe0K9xpEqjTdhMAfw=; b=BcpSehaIOIW3Mx+w778iWf
 hixuDUqrs7LJtUveEAmsKmeEpixrsSh2MfkGvjjapNj67fUfZEsetezY7OiqOByx
 feGLt340KyCdddP84unItarX75jURs1oxgbsd0VztG7AQnO7WOsbt0SoJ0ZV/IGC
 bkqBsRGD1dfSd98yE/7jnu0cIu0dul6ENdyp3tBub5qq0yvbojWj+B8Bch5isiD4
 LGxWMAU/EPigDs7kZWkN5aP6EA94E54IIoqVH9ipmnkY8A7iM5gI/Wa4GWU1+eoF
 8CsHgK/A7JPfxwNiGD3LySKJncUI8/NKsA/mctFvLt7BinRxAIN3/IKBskbEy6Ew
 ==
X-ME-Sender: <xms:qVL-XnABk-SUwhui_LcMgLjRN1CT7a1StnhdOuDuY8CNQsrDukKHuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeggdduheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:qlL-XthYGCFZLySFN-8vGny5nyxoLUpw9BmhOnEj9u6x8-S7Rpr2lQ>
 <xmx:qlL-Xik8sCUXPllhMM1LIVwfrVXTVnr0Z5YxkPuop1W7qBERJaYpLA>
 <xmx:qlL-XpzfxaoIagITgEoTygfmKsuwPFywHF8wp2_6Hwnl_KG8Vy7qog>
 <xmx:qlL-XjcqWBYO3qMseD7vmmmeZQm1mH6dE_qpLabg9HbR0GCs877Naw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE5553060062;
 Thu,  2 Jul 2020 17:33:29 -0400 (EDT)
Date: Thu, 2 Jul 2020 16:33:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Weird build dependency issue causing missing symbols
Message-ID: <20200702213328.GD3922@heinlein>
References: <c99c6e23-a2b4-01de-7cb9-ab035dcf8e01@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Content-Disposition: inline
In-Reply-To: <c99c6e23-a2b4-01de-7cb9-ab035dcf8e01@linux.intel.com>
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


--jCrbxBqMcLqd4mOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 12:58:43PM -0700, Bills, Jason M wrote:
> We have narrowed this down to being caused by two separate issues:
> 1. When phosphor-dbus-interfaces is rebuilt it will sometimes change the=
=20
> order of the PropertiesVariant in server.hpp.

This sounds like a bug in sdbus++.  We should be sorting the variant
parameters or issuing them in array order.  I'll look into it.

> 2. When the order of PropertiesVariant changes on a rebuild, the recipes=
=20
> that already have an old copy of server.hpp are not triggered to rebuild=
=20
> and are left with the old copy of server.hpp.

This isn't surprising if what is triggering the rebuild is not a Yocto
variable change (or git revision).  Yocto doesn't cache the contents of
the packages, but caches the variables that went into a build step.  A
hash of the variables are used to look up the potential 'sstate-cache'
files so that it can skip build steps.

If you think a variable or a git-revision should have changed with what
you were doing, then maybe it is something else.

--=20
Patrick Williams

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7+UqYACgkQqwNHzC0A
wRmh8A/+MIwg5e2o0E3N3OyrBBF3TRP2MXKip/Ak0FM8yj6fIUEoMFnji0JbawId
/hXRTxkSBM03p79ze0RIJql/CHcTRBwgY6ATU8ER/jz1bqWe3eY7vTRjMo3w0rsd
hNrniZ4XqBdkYrZBNBpACN2E34PXUi1OHE3GYo/inuPm38zlWe1XvOqh3JjLjT43
PTGvm/O31CxqWvY9TyNSKWM3t2RXkXxZSjmlmb4nGcpGbo7G8rZfI42KDiu02MhZ
uOlcc2zUpmDEFs69/B6ulXY18xVfv8cbMOW1NTGnanLdvQ8Roi2gavjOnml/hjsv
HzkRykSeKHtrVtjdB5sA7StWgZV9Ou+Y7DABFmnW/8AaRVBau1eXoF8W8ZNkGkyL
MXkeMKP29AB6e5sET+DI+iqx+yQpT6obhjNSl3rU3sdfA3EmYwQHiIohjRsiOVie
o7Y+XKs8Z/Iu7VQHoRaa5xIiC2ICNB8T07FVhRXxo4YQinOpCXSCX0XO52Ig0JiY
EfG5hBzSr5IPMcVv2VKXfS/OfMhb+Y6wgN8FXNS0dwFVgoL4SIYVx1Hia05wXZPq
xW/FcLazak8KwPbEQ0zHbk2Rx+a+e281LTlmUL8YPrFbmoJx5nWhjr8Cl5PmpB2s
ViYM8VQQgZKKHGilXDzz94iFIAYuU8pGnGUtCBIF2Lsl2YCotGU=
=VezQ
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--
