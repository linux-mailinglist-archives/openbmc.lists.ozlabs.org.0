Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8D259AC4
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:54:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgtT001VSzDqR2
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:54:12 +1000 (AEST)
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
 header.s=fm2 header.b=G5mCkWeU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=U1WJ43tO; 
 dkim-atps=neutral
X-Greylist: delayed 590 seconds by postgrey-1.36 at bilbo;
 Wed, 02 Sep 2020 02:51:36 AEST
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgtQ06N0dzDq7j
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:51:36 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C9C45C00EF;
 Tue,  1 Sep 2020 12:41:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 01 Sep 2020 12:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=tt35H3vkV9roNTq4q/cd9bFJ0Re
 mF5KTghRgN2s6vrU=; b=G5mCkWeUlY8N2K6w98fouIeOm7cqz2jmFjNPjgs9v+0
 YJaOJiF7BCJ7fXexDMy7fr67FR7VLUc5rscdGWsA7hLMh5nBoF+/7FooHbgkvSX5
 eI2Vw2zWiPlV8HyrfWV/NgnaGLo3qJngwzeVY68xhZUMs5LmnKo8eHuiajzOPthb
 HegN/xWGK/Q2t+seK0OVhQJrB/7FuprKPsiRreqsUpkbdYan4bmmFgcxtR58bfkY
 +SrW9SFg3tuFIvZL+GwEM+E5znE1ZBMnqGmCUt377uHRl2atx6MWS0zt+82Tlre4
 nl5Ng0CiEya/g8kt7Kyv2CiI645hH29VN/9jOBdMXMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tt35H3
 vkV9roNTq4q/cd9bFJ0RemF5KTghRgN2s6vrU=; b=U1WJ43tOtARnMlt5sx5vLt
 /K0e0gmAQ5W0XyBIxJ+BOoanIrF8WJyRpIfnjWfQfBSXsSKkfK8HOx/aVW7l9U+2
 2tiKoCPxz1kSEkjdenGx6EM4G+HB8MfoZPY8aC1/eaxE27BFjC3SHfFNnrDyQraN
 CFA3AVDKfmi16VizOnqBN5+uj2Pn1Ji1SJmkcbGdDQc7w3rEtp3mBfRR4fsYdTrl
 /+r86yuhmIA9oEvroiD5n3Px/hljDyH6dV4//7UjaTzAFk1CLZ1bJVoen5uO61ix
 CRHq/UAI7vvs9Dn8hH5yKOoJXkG/Ba4hroATfkd4emqsQoiwdqzA1m/ipbEucUKA
 ==
X-ME-Sender: <xms:xHlOXzoBm25NXhed8UlyCI5v0Jhw2WgY6-0wH22rjUBVDXk7YYV3og>
 <xme:xHlOX9q9hxC2bmDTISJ9YTT5hCrceV4p4sdvC2D8Mxt4U_efHlNv1bCSz9UGJ_pJ1
 E4VXHMsa0pPk856yWc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepuddtjedrledvrdehjedrfe
 ehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:xHlOXwMKtgaDEmeK29SvcK50wzb8-8vSGUYuhZByxemyQQcCXc4-nA>
 <xmx:xHlOX25hKIJxbZSvoaFgcQcdqiaAux96UBlymc03UqpWzPOU3c8a_Q>
 <xmx:xHlOXy4UZiSjJwlPOcbsyWiLvtWQY1DSuwDFhqevUv4GrdLGPf8bNw>
 <xmx:xXlOX3hEa2VPNg5tD-Jw8fxw3YPDkoQbrUkSnwsizYaDfYzfM7VCpw>
Received: from localhost (mobile-107-92-57-35.mycingular.net [107.92.57.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFB84306005E;
 Tue,  1 Sep 2020 12:41:39 -0400 (EDT)
Date: Tue, 1 Sep 2020 11:41:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Wang, Kuiying" <kuiying.wang@intel.com>
Subject: Re: Need update CI build config for new repo smbios-mdr.
Message-ID: <20200901164139.GV3532@heinlein>
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200901162333.GT3532@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xVUAO+xN0VJlKSe3"
Content-Disposition: inline
In-Reply-To: <20200901162333.GT3532@heinlein>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--xVUAO+xN0VJlKSe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Also, a few minor comments on your proposed dependencies.

On Tue, Sep 01, 2020 at 11:23:33AM -0500, Patrick Williams wrote:
> On Mon, Aug 31, 2020 at 01:45:17AM +0000, Wang, Kuiying wrote:
> >  DEPENDS +=3D " \
> >      autoconf-archive-native \

Your repository appears to be cmake-based, so I don't think there is any
reason for you to have autoconf-archive as a dependency.

> >      sdbusplus-native \

This alias is only provided for convenience but should not be used any
longer.  Please use '${PYTHONPN}-sdbus++-native' instead if you really
have a dependency on using the sdbus++ tool within your repository.
There should be fairly few cases where you actually have this dependency
though, so if you're not calling `sdbus++` in your own build process,
don't add it.

`git grep sdbusplus-native` shows only a recipe added on Aug 3rd, which
is incorrect.

> >      phosphor-dbus-interfaces-native \

This no longer exists.  I suspect you don't need this either.  There is
a fairly rare case when you might now need
'phosphor-dbus-interfaces-yaml' but I suspect this repository isn't one.
Probably your existing dependency on 'phosphor-dbus-interfaces' is all
you need.

`git grep interfaces-native` shows no hits.
`git grep interfaces-yaml` shows only a hit on an sdk package group.

--=20
Patrick Williams

--xVUAO+xN0VJlKSe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9OecEACgkQqwNHzC0A
wRmQ4w/+OP3VSbY8MNjIElmQdDNCgLKNUf4MOv0DL5jESczFelWUqJmaav3A053+
DJRjt2CWUbD8ZQXAZILjw0v4jaIe1Us13zM5hkyIocEQZ7z/853HGFdbWRM1ISik
pFFzphT11dkBLJ5nWOdtYYGbnno+ZC2EmsSCLPRR8DH8t0Wdwq+sadrGEXZ0vqVG
SLd7xXabrf5MuuYLnipGxP9OkWtei+gfe1j9GwW4QVwNwNXf0EAls0F+LLYSJreg
z5UFY4BayouSa67azRacCg0qwRxKsdNyUlyEgY7YCPZ4S/TRt90x5wgTd19MGbXv
a795GDaoBFe0nFHCyAezKio5+Rbx9NT8o6xkoe6F3L7hCwd05aYhzfzOF3aphJD/
egliVi7qsWw/AM7i+RtDSZW6lmXZcJ/5IV3bHmnrrqCSKqvJNFx3CHzm1y5MXsEM
gHOLv1pV+LxWv6bwZUs+d0G40wDaY/Quj7SP1bIAabkqHyxWMxVOw1hvcDa35MpR
pTcfiHEEbeSJQV9TkzHgVIO2Pg66u8JpyQjYU7LktiSUTHUjo0PlEQV3Er/YPp5l
VMJrJYrdVACktyj6RO+hJqjNFofARDiH3CLr756TF+YhT694J6/nJASbtXUCK86V
XrE68JANzA0gZNz0FnJtRXlkiuP9D6LWbeMtfUOcFnWP2G7f3iI=
=Y3Sx
-----END PGP SIGNATURE-----

--xVUAO+xN0VJlKSe3--
