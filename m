Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4E5166347
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 17:39:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NgK05JfbzDqZl
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 03:39:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=htGJEloi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=LB1IAboP; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NgJW1K3yzDqGm
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 03:38:35 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5A3486E1D;
 Thu, 20 Feb 2020 11:38:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Feb 2020 11:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=HQfEjCe2V/IVGpSQLRNrI2+ScNQ
 mTeCflFEyjSMUc1c=; b=htGJEloin08lj1frPUie2w/JlRYqkYku5rWigLxdP6+
 nQhdmubSdPkOdxxtfTcY5xomfXRYhx2cV2AlzZ+yCbta8zwwErulQt37lQvPjG3x
 uM5jO7VIYP8i7kU8SGPoVPeHQyG2aOR9eZm5TRCjxrZ8uxdOympjTsy6F1Fi47WI
 CId8bvaeJkWgNfVu6zsaYEkW627R8nORgk/BJJTncX4Cqo3EMMUmSK9jMQNl5tTB
 Sk60+OaYUikj/q6PO/QCLrLA0A3Rng2WPbohLpnuIdYLDC0ZDeJowp1bvOcdPvyk
 e0OZUSXNZ9oxsMwo88GS6wPxwmNImBlJXkv/wk9qpzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HQfEjC
 e2V/IVGpSQLRNrI2+ScNQmTeCflFEyjSMUc1c=; b=LB1IAboPWN3yLg2Nz7cZ2M
 zyHuD535eUyv6usLJKFwfaLN14s3Hd7759Zn7DP1ZsZspi7TOvQBudRWkYUPbMIv
 Y5cV51ytpBHZ46sDpkATdxN2zcvJ6RaBc73R3JoAXGqE4a1kN0HlSfRbiIqz8qSg
 lIIJby9KsOLOvyh1ZmdIsX5hICTa9Tub33+lcQoMNC7e4Ff+5JB5IQDQc2II87Bz
 l046uYYbS6WQsZ0C1OUPHx4tHaKSpeycV26ZZ9d+DhfiDJivCgb4mzk4LLhHYUZa
 +DP43FoxP2vwIxfSumXiz3t0gfkJespo9dAGImR1gWHEL3FIhxgoCa2ssrr05THg
 ==
X-ME-Sender: <xms:B7ZOXmFZE214jIxuSlQRUdb-qN58W-SAU1xnSKIgRkBiXG8GV815TA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepudeifedruddugedrudeftddruddvkeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:B7ZOXpW7YlaKVIWLKuFUqvc1uER0UbSFadMtdgLcKnmnErnSO889QQ>
 <xmx:B7ZOXkdxKFJNYFt3yXkYxplfl8BjQZtCCle7B1zVC4M4tkVWKnXHQA>
 <xmx:B7ZOXoQhVnKQaaS4SxVVkQO5HqqPFDVujSpSYIMUaqno92V--Sro9g>
 <xmx:B7ZOXvWGxOexzei8FHrs8MpoxoCwk3h92eSMpr2j4cVMoMXbSsvMSQ>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 564553060BD1;
 Thu, 20 Feb 2020 11:38:31 -0500 (EST)
Date: Thu, 20 Feb 2020 10:38:30 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei YU <mine260309@gmail.com>
Subject: Re: [sdbusplus] To generate a common header for public information
 of interfaces
Message-ID: <20200220163830.GD41328@patrickw3-mbp.dhcp.thefacebook.com>
References: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
 <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
 <CAARXrtkwsy3t=bz7wHa=oEG-KwE7dBJ0Upkft-RN9XNgiFdSHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline
In-Reply-To: <CAARXrtkwsy3t=bz7wHa=oEG-KwE7dBJ0Upkft-RN9XNgiFdSHA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 10:59:40AM +0800, Lei YU wrote:
> On Wed, Feb 19, 2020 at 4:39 AM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> >
> > On Thu, Feb 13, 2020 at 10:38:37PM +0800, Lei YU wrote:
> > I would say any case where this was done should have been fixed.  There
> > were already functions in sdbusplus to convert<Enum>ToString and
> > convertForMessage(<Enum>).  There are lots of cases where these are
> > being used today[1].  You recently made the interface public as well, so
> > we should begin converting these over.
> >
> > I've also got commits pending, for merge soon, that make the enums be
> > supported as native types, so code should rarely even need to call the
> > "convert" functions anymore.  Another refactoring once that is merged.
>=20
> The idea of my proposal here is not to use "convertXXX" functions,
> instead, it is to provide the constexpr strings that could be used by
> client code.
> E.g. the client code does not need to call any function, but directly use:
>=20
> * xyz::...::server::MyServer::interface, instead of a user-defined string
>   for the interface.
> * xyz::...::MyServer::MyEnum::Enum1, instead of a user-defined string for
>   the enum.

I don't see any reason any code should ever directly utilize the enum
strings.  We generate code already to safely convert them to and from
real C++ enum types.  Why would you want to use string comparison
instead?

Can you elaborate on why we should be enabling this usage pattern?

> Yup, the implementation is actually part of the "client" header, we
> could rename the "common" to "client".
> But preferably, we could combine all the client header into a single
> header, which makes it easier for the client code to use.
> If a client needs to set an enum property to a service, it then does
> not have to include the server header nor the specific client header,
> but include a single header.
> Anyway, this part is done in phosphor-dbus-interface.
>=20
> So we could say that sdbusplus generates part of the "client" header
> instead of "common" header.

Agree, but we don't even need this code now if people were just
including the server header files (and there are many examples of
clients doing exactly this).  If we're not going to create client
headers now, this seems like wasted effort just for some slight syntax
improvement.

We could simply symlink <xyz/openbmc_project/foo/server.hpp> to
<xyz/openbmc_project/foo/client.hpp> and add a `namespace
xyz::openbmc_project::foo::client =3D xyz::openbmc_project:server;` and
get the same syntactic enhancement without nearly as much work.

--=20
Patrick Williams

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5OtgYACgkQqwNHzC0A
wRlktg//cuv8gLkdwUYYL8Jl4M9bSrE5iw1Rivp8BRWwd89r6ka/1FV2xOz8KbJJ
Kck9aGDmK6prI49QiVdzr1eVAdct8W/hIYrh9sSaCSAmDRhYIZH8CtTlONK/41Il
g4ZHhR2NPtaQk54yUVm4ejjmirMGF5IPuon3OHRmtrSMBvRfwUf/Uu/FL/FJX+Nk
PPB0lvunob1l1klAkWH33ZMONuYUw0EZZp032hLS5aisdTZ/V0x0HvW03MC4jcxN
Ca4H3NOSfSvhUkNqrj5Qi9itIFjynkJj3O3YH8B72ow4NOwLYeyIV3RYePdaupXN
pTeLbetIkVIaXRI0LeA5NMBXLPhz2X/fcnY524akl7d9GFdSsXuo1feez+QQeBuN
L4Tw4+mNnqawauosunKOWi31XrG57fn15BIS2NWj62ICvyZi1v4B8aH1i+JiLby0
7oLUCETqmZxv9cem+9hcU/tvGfh5Jnu4fCukRNkELyQSrrvB5+7gL7Hoq6xp0jsT
CXa8GYiwKwpsP4ctbmkIQCNCQhszkKEOwLg6Teti0IXeVvSWUq5hIwfL5A10Hha+
jCj7+JzKFlLvTWK2da4040F/AMGNdaeFy4BUyHYceuQo7q9x+rBD+346vsAQdF9I
TBvL5THx7Va4Cq3Gb6CRSreoIPnE43ROac03PF1cnLIQx3HCWG0=
=p3v1
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
