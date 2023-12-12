Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A7D80F99A
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 22:43:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LS/NxI52;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Jx0rHSGb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqXDV4Htcz30gL
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 08:43:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LS/NxI52;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Jx0rHSGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqXCy2DP8z2xm3
	for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 08:43:10 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 2F64132000EB;
	Tue, 12 Dec 2023 16:43:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 12 Dec 2023 16:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1702417387; x=1702503787; bh=8s5k3SSnnf
	BfNSpHLWEB45lt6WVoAK29OwxDu4cV2Jk=; b=LS/NxI52qrLGj2QnI6Sowcv40r
	0bpVsSuzMuw+1nYMtTQeVUI71AyI69RYd2elBTwZ+uoGZ1WGtZciTvTGnvcljdpv
	MfEE9m4ozcDuw2ypEciAUrp2FW12roab+ZrgIVU4FIh+7HJnLU/revm4Q24yM20g
	xbxax2sqpGB/oaw7icc4VfoIRVqY8Qll00gRmL/qLTZZn2Tyv382dWTfJiDX7CA8
	7ThQj85xYCu3dPETWniT9yZbqH7Bg/x/EEfTswEFvMZWdHRouLKMfJDpwXlFGwak
	Ry/WQsboG+iLFre7sFdsTnnbFJjzN+yXa1aOhkPwkMuk/Jb+SneR2LC9wHog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702417387; x=1702503787; bh=8s5k3SSnnfBfNSpHLWEB45lt6WVo
	AK29OwxDu4cV2Jk=; b=Jx0rHSGb3vCTrqj2di7010nJZbbVtJcgd7JOgyLhK8Lq
	qtzf8MnVYz4fudc1HycY9o4V3Chc3W0WpjOxcF2YP0eUBPNNIZ6Zk0ZGNX/71NjU
	ZiAEHfMCr7s0T+0mvJZvZ6dIVZArxuUwkeYbzg1EfxwAiHk5IZdB1Zztfx9Nx9Ug
	qlF8g6wD+GDXMKnadg6nMyV2bR4XOc+tQvhfbucteTYp20tH9mfk8hBj9/uZaa2r
	bKDJH7fIveovP2iutcLlu7ypv+9XhGPREzuviurcjzeZAqnlTh3itHxs9XYapvGf
	v0b1y5Go4mZHjeELoBL9+lbG3SZ1YoSg8m6YLupJVQ==
X-ME-Sender: <xms:69N4ZZ_E2sVuTxa6IX8QK8o4TyLLo17iawEapDpM5sHqtO9nSuA4vA>
    <xme:69N4ZdutVjd0n-F4ZH8a5YNinQCucR0qP7PYv7QbhUJ-4EZh4nNbXdjUltqqzgnys
    3c6P0BXAxZ4M2J0He0>
X-ME-Received: <xmr:69N4ZXAgX5cwHlAQS3H_OY13b-p0udB-RwvXucS7p-u_o8lxhbkQnysTvjQgcvjBd6NfxQkgwxvZCR_uM6hWBve89z8qEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelgedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepjeejteelheelieejuddtudff
    hfeuueefhfefleehveegvdeigfffheduleehlefhnecuffhomhgrihhnpehgihhthhhusg
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:69N4ZdfbyDbWZgZIXBN6xQtAqwLDc3ib08Wqv2lqnariHRPRLTH5wg>
    <xmx:69N4ZeOIgCFMiPQ5d-Tsc5BqaxAWpPWPyJnQKkNmfql_3gQ9Vpn6sg>
    <xmx:69N4ZfnW4Eq2z9EIJnHv9B3C3VBauwf5cN6pZaD-FjLsJNhpUG6M4g>
    <xmx:69N4ZXavMKled5YLC6KmHUiRHrkduAWIDQORqAHRZEs74FXSfw8UvQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Dec 2023 16:43:07 -0500 (EST)
Date: Tue, 12 Dec 2023 15:43:06 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH linux dev-6.5 v4 0/2] LTC4286 and LTC4287 driver support
Message-ID: <ZXjT6lVuXZUqhfIQ@heinlein.vulture-banana.ts.net>
References: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
 <CACPK8Xc4NM_F4tBrZZe08r1=RYoe72=DbZNWSaK3E1_i18zjYQ@mail.gmail.com>
 <CACPK8Xfb7pG6sTcx3_A8sPAgiC08A6Q8je0R+7c=eUYxuS601w@mail.gmail.com>
 <SG2PR04MB5543CB6774F6A5CC80501D94A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <CACPK8XdGnc44AMtOWoz22BNw-JRG3sF+e9W8wQSt=1FajzvsRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eSYD4A2imDicO4A/"
Content-Disposition: inline
In-Reply-To: <CACPK8XdGnc44AMtOWoz22BNw-JRG3sF+e9W8wQSt=1FajzvsRw@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--eSYD4A2imDicO4A/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Joel,

On Tue, Dec 12, 2023 at 12:42:18PM +1030, Joel Stanley wrote:
> I have some
> new rules for getting the patches merged into openbmc:

Can you please update this wiki with what your current expectations are
then because these are not obviously reflected:

https://github.com/openbmc/linux/wiki/DevelopmentProcess

> 1. Do not send them for backporting to the dev-6.6 branch until they
> have been reviewed upstream. This means you have Reviewed-by or
> Acked-by tags on at least a majority of the patches in a series before
> you send them to the openbmc list.

> 2. Find reviewers for your upstream patches. Get other Facebook
> employees, get other openbmc contributors to review your patches. A
> good way to encourage others to review your patches is to first review
> thiers.

The submitters here are not Facebook employees (nit: there is also no such
thing as the company changed names 2 years ago now), but they are doing
work partially on behalf of Meta as their company is partnering with us to
develop new systems.

In this case, I don't think review has been an issue since Guenter
applied v7 to his tree.

> 3. When you do send the patches for backporting, include a
> justification in the cover letter for why they should be backported.
> For example: "These patches are merged upstream" or "the changes under
> active review, but we wish to have them in the openbmc tree because it
> has been ongoing for more than two weeks".

It would be nice for the wiki to give clear unbiased criteria here.
Currently it says:

   Patches for pre-upstream inclusion ... should be at least of a level
   approximately ready to submit upstream.

This implies, by my reading, that any commit sent upstream can in
parallel be sent to our 'dev-*' branches, since that is a stronger
criteria than you've listed.

Anyone can carry patches in their own downstream trees, so it isn't
obvious to me when it is deemed beneficial and not a burden to also
request a backport to the openbmc/linux branches.  I get the impression
that our backports requests are more on the burden end of the spectrum.

> Your latest upstream patchset produces a large number of warnings when
> I applied it to the 6.7-rc1 tree. This shows you are not compiling
> your changes before submitting.
>=20
> Please engage with me and the other developers on this issue so we can
> help each other get the changes up to scratch and merged.
>=20
> Cheers,
>=20
> Joel

--=20
Patrick Williams

--eSYD4A2imDicO4A/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmV40+gACgkQqwNHzC0A
wRl75w//Z/TprWE1xzYC5OTjUV6XfMCKsMAkildO3sl9D1o6C3Gpu91I7Z0owyF2
U6d5DJUWJKcs/7BS6WQIMCuTMWYbHu/LHVDDgP2PAMmyFnvw34LIt3/ML0H50uWJ
kvD5ZqadPPYKV5UYlgPHIDFrMSsn9WvM29DeSrFEL5BhJRw0TZdnkjnL4dUR7uD/
9nyJdpD5qIyRtVOiuhziooLRNMiedrjWSBM/pAfAiInT5KVwDpFGB+kkCrCGUT6g
R6NmsOOFo4mLEDF2gf3BmWgXCbrGUlq8yg7Hz8enorNxtxhg0QbvtqGPrct1TRq+
7xmAkjgpvQtBPCgxGUEUMPna26/11N6pbH/h6IGYI4CjTGZLBog7Vcei8jGyN9pd
m2R6pC/tOgc2wXqkxpG6m9YDKzrJaPkBoUGnHcOLQJ+0+sSJXZQwzXfqiiP78yWb
08XjmNV/QJO8mTSdqSiB0sdkLibYbWTKe3tCGjtH9DumioUWELlX+Lc9XdpGSAsE
0JgQR9pI9ntkYldmaazf0ejJC7RXVM8+DpbjI2YjUr64L+Y9oIDPAIV1gwyZ3Nlg
ATo9IeoSCLTlDZfcswCR7wJGEWE7+0S/MPDOeAMGMem8djnPnOG6R72Cmn5vFXov
EQDvYzaY12DuF50vmumbmUyHTVf6xhFB4riw5hHn921KVrFNzkI=
=eLaq
-----END PGP SIGNATURE-----

--eSYD4A2imDicO4A/--
