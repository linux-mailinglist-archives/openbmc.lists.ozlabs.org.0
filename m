Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973933E099C
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 22:49:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg3kx3Gc9z3cVp
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 06:49:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=M4ZGowzl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=O4jvd1Lc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=M4ZGowzl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=O4jvd1Lc; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg3kg1XBWz2xKY
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 06:49:15 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A18735C00F8;
 Wed,  4 Aug 2021 16:49:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 04 Aug 2021 16:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=umohwW3T4RKtDtVMiJnVKFW9q6Y
 iCvJqiT4QAn335Rw=; b=M4ZGowzlnqM9yq4VpNh94aLUYSMlyAGJ6+AmFq0UY7h
 l6c1HsRhI/bTu002EJdgqKo7FawMdGxh+XRNZKPKzrwqxyY7nsKXOJlIkS5bLZA4
 d9yLwyYHJFpekQQzIrQooHLvRqibIGuIDMhXpc4ZCBohckJ3lJgF3gOmyRsdnY1d
 h9fa6cHbDW8FXrdiSIn/dpTNDcq7zGtv//r7D/HI9IPFQpcPPd5tCmHzCSLBkE7a
 aerLAzG9NKu4d8S/Fm7k/6j5oDsWIhGNybZMlgCdvQ0B8ERyWslN5GSRjtTUxT5h
 lHghmJ3pUPATBmgx+/rsFCceRbZ4Oc94ADNooooydlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=umohwW
 3T4RKtDtVMiJnVKFW9q6YiCvJqiT4QAn335Rw=; b=O4jvd1Lcz36nc45KBjHql6
 F6XmrYvIilCVYAkVOKe/WBKZ9IP08Qq8bgfKINlRuX9cQhZU57l2kXzDRhg6YxLg
 j8k48iJ2ZHv83qkiAhI/Nz56qZzV3YlfxsPnHsLThADsH1vxYkbAdzYV5lELs7v4
 fj5GcODI8Q8BZKA24sIKBQdv4F69z66laEBBSVHEIQiv0SbCfgrhNsFb8zrLDuzI
 Wb2XcqeGCBIaLit2ifuere0tu8eetv6PthkYDkvlx0RGJgKQAU6eww6/H9uw+yvJ
 JZQV1iGnG9Z8veEXhdjEsKBRkVJetec7r9uoJ4VChQKMifJ6aQDxNSA0QvsTsH8Q
 ==
X-ME-Sender: <xms:R_0KYeuKAGedRCthVEh_IhnJo7Ohu9jJDo8DjYMoHOdY0hg9kQanXA>
 <xme:R_0KYTdkpHr1LF89bMeujb4ilOlR_GHTcemXd2MhWW0DnG-M8YQmyq1Z-MbjwFvee
 QZinZovi9zLq-VeugQ>
X-ME-Received: <xmr:R_0KYZxtHPZaOjNyPNkmzGQBHTDCLp8JoK8ZigZwhGv5VSOF3hndGuEV4yN2bY0sad-wAOKt6UaU3xdFeiwr1cqoJCOUjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieejgddufeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdejleeuveehfffgieekjefhvdfh
 tdelkedvtdfgfeduheeukedtvdettdfgieetnecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:R_0KYZM_SO1kJuYcoAQ3Fj7umOX-ri44Hh2j4ef9zIF_kUxUnsjX6Q>
 <xmx:R_0KYe_nqELzUKNMr9AZhSAP_Mw8XB6Nqg6KzlJBAhPkgvEv71YPlw>
 <xmx:R_0KYRUXhrU_BHwl3392WCbFBCQUtHfvgFNUSlffA18j178L2ME9Zg>
 <xmx:SP0KYUmKYg4CJb-uWnK2fXaTeMUmTs7y07DCkDWlVYSAXrQbjwMJmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Aug 2021 16:49:11 -0400 (EDT)
Date: Wed, 4 Aug 2021 15:49:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
Message-ID: <YQr9RWolIR7witlQ@heinlein>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
 <YQr0E+NP+7QKIrf1@heinlein>
 <1fb3f67c-84d1-a84b-c44f-a9c2774cfd9b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K5GLTasvb6OUsPA+"
Content-Disposition: inline
In-Reply-To: <1fb3f67c-84d1-a84b-c44f-a9c2774cfd9b@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--K5GLTasvb6OUsPA+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 03:39:45PM -0500, Joseph Reynolds wrote:
> On 8/4/21 3:09 PM, Patrick Williams wrote:
> > On Wed, Aug 04, 2021 at 01:47:31PM -0500, Joseph Reynolds wrote:
> >  =20
> >> 4 Surya set up a bugzilla within Intel and will administer it.=C2=A0 D=
emo=E2=80=99d
> >> the database. We briefly examined the database fields and agreed it
> >> looks like a good start.
> >>
> > Once again I'll ask ***WHY***??!?
> >
> > https://lore.kernel.org/openbmc/YNzsE1ipYQR7yfDq@heinlein/
> > https://lore.kernel.org/openbmc/YPiK8xqFPJFZDa1+@heinlein/
> >
> > Can we please create a private Github repository and be done with this =
topic?
>=20
> I don't have any insight into how to resolve this question.
>=20
>  From today's meeting: using bugzilla has advantages over github issues:
> - lets us define the fields we need: fix commitID, CVSS score, etc.

These are pretty minor when you could just add a comment template with this
information.

> - has desirable access controls, specifically acess by the security=20
> respone tram plus we can add access for the problem submitter and the=20
> problem fixer

So does Github.

----

I really don't think that some subset of the community should go off on the=
ir
own bug tracking system.  This is a waste of time to maintain and just furt=
her
segments this "Security Team" off in their own bubble.

--=20
Patrick Williams

--K5GLTasvb6OUsPA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEK/UQACgkQqwNHzC0A
wRnA3Q/8DfsR/LEhm8kWyZb9eA8wZzk8/P4OP5jmDA8t/VRVh8DZ5WIMFPQntE7P
T+8ZAr7xZb4ZU2HSwoFm1MzN1Y5vKVb7MejknwqPgtBklebUiR9yAZaPQI/ggXk2
io9S10/u9BxGZ7Q5iVsc7NXineEhiaRmjyiOusYB5e2Z0oCpWAU/ThU4s90OoI1r
Rz9jK69I2WhSrkApIuLErPKSpNx65LmFq71ZbhkgaaVfg+esIrn2L9RoAc4rAjkA
5L9A6fvxCP/sB20BqgQ8GsAFrLcDN9vFD7l0eUuA2yHyOVBJGaDhdgMhpS4Qzlei
/THymT+28UEmkWLUSryOT0T43D9FQNrlvV6pBqMIZlvXQ9j+O/AQ3i9vi/69DCdx
ldADzWvTl9YGBAZ5PKHnGV15HjGc9huQnMNQWNUDnT3+A2BfolGTOTU1h2Oj6Mab
GTocpxlVzMkgAbtRjPRNFsVG6+2JUQCBA2wGIK8RUr2FsEhjnRrxDzDTqbsRw6Yj
1wUAwNRkjbCnr/+PdNthmMKY/w+RAKfmSLsu/MOflty+kZKn8sda+LA2b82K3RvX
5F9CZ5F6M3wKkH8wqWtAIepjKYGnnKmstPbpI39pY9YdvKuBowLkh1Xy4Rt7bv2o
mSj0I01jFRFnNvWYhLKUqSCAAMc7+ezt5x6Q2teMYAzKzNElcKQ=
=YvzM
-----END PGP SIGNATURE-----

--K5GLTasvb6OUsPA+--
