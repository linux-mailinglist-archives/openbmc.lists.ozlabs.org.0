Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2FB44513D
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 10:36:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlJRg2S3gz2yHC
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 20:36:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=izQZ6K6/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=kAR//C+M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=izQZ6K6/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kAR//C+M; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlJRF5tslz2xWt
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 20:35:53 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D697D5C0189;
 Thu,  4 Nov 2021 05:35:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 04 Nov 2021 05:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ZRcXIy86o/grExussoPo3dK/31N
 VAM3c7wAqQpNZV0A=; b=izQZ6K6/XTPOVHSj/uy3xk+bqAadeNe9BNaWu+I05BJ
 umkClinJRe36HUfS9Ecxl6GD4ZTQoGYQlLqCUFSWvQgrEN2rUA5/XQ4rzopQSMei
 2d8Nf4RnzC+u+4aGKa+NwAZfODqsG2nXz49fwyzKd2iizFSUgvBImLksnkjfbs1O
 ERI1VbM1xy0OTALDcPbcCLr1IudMz1oBtwbzpDpNfAZuK8S9W2ZO5aJdu5J+3uYa
 LJBAAOqTOnBCAOpkGJejjpW2ONmyzks1Eh2xwtur+c16kR3XFHSx2yvEzGSINF8S
 YRNNoBZN85hsuWZg5fj6hpf4Kv2+oWfbCw8Cnl2VdLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZRcXIy
 86o/grExussoPo3dK/31NVAM3c7wAqQpNZV0A=; b=kAR//C+MWKvXFc9+eEESmK
 H7DLLNpnDwap1HKaex9djlLy04p7qepYVu3xx9pajYvmiWybJE8aqHe3lsCQ/xoL
 UKZytI3e8tSJQaWbsQ6By2btyeWershIVBN4LlLu03vDORseN0ciHfk6FqUPd3/l
 2LhHMByMno9h8jiCG3eHvim9G3X4ENbGEB2DFojTHxv3QNVRPB4s4S6/lAvvQho9
 uDrxX0E85LSaDk2XAoWH5esIb+IqQhd7N70Q2EkCf49UwW7M65kSBKzYt13fRj4Q
 D7ZtlL1a/3EyGiLoJkJaTr1k2oudCDmMTzUqtXKcszT+uWd0sA1GemZCI3ZkkNtQ
 ==
X-ME-Sender: <xms:dqmDYThJkqJ4XldnwtepExqMnk23pvlDkeL-pvPtpv_LzIBdKpgncw>
 <xme:dqmDYQCZp_1MreXEXKgseDNrtSQUxFY71INTMUta1ipfN8d7S7xTeycSjZQ26q_79
 d8OQL5FmRP3rwCyTHU>
X-ME-Received: <xmr:dqmDYTF9MpeWhQY3HC1GNFLnmmjca40OXSF7Jg8FylDXis_cP7rebu3Pov6nLHRqgfBFPJ_thlGGg2QZzM-kLIUizZWtnxlc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeggddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 ekudeutdefiefhheefheefvdejueejieektdetheelvdfhleehkeegvdeiveekhfenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
 hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:dqmDYQTACOn9GUSD3XnbVpNRR3CFRfFCigQOOHVuDwB3fvoizdvTYg>
 <xmx:dqmDYQweMc1h_OF4wsdkOKRhXGavm-7fLUMBDgNm1quD30pGqancaw>
 <xmx:dqmDYW4v3xozZrKnnfBSznxCN2H0Xs0BMFimjaILk9GSkUj0WZDOhQ>
 <xmx:dqmDYWavpYjMq4TW-fOlQmFtEKMp52ZVytRxF0SUq0zcTT-H-NRqaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 05:35:50 -0400 (EDT)
Date: Thu, 4 Nov 2021 04:35:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Kun Zhao <zkxz@hotmail.com>
Subject: Re: phosphor-logging Create API with Resolution
Message-ID: <YYOpdFQkG+hymMPk@heinlein>
References: <MW4PR14MB48034DC5EC5E1B30FCF58CE8DC8C9@MW4PR14MB4803.namprd14.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SYeWoM1tdSWlsGiF"
Content-Disposition: inline
In-Reply-To: <MW4PR14MB48034DC5EC5E1B30FCF58CE8DC8C9@MW4PR14MB4803.namprd14.prod.outlook.com>
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


--SYeWoM1tdSWlsGiF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 03, 2021 at 11:53:17PM +0000, Kun Zhao wrote:
> Hi Team,
>=20
> We have a requirement to provide the value of Resolution property at the =
time of log creation with phosphor-logging Create API. But current Create()=
 API doesn=E2=80=99t support Resolution as a parameter, we have to do two s=
teps (create entry, set-property of Resolution of this entry) for it.
> Any suggestions? Modify Create() API or add a new CreateWithResolution() =
API?

I suspect we're going to have other use-cases come up going forward where o=
ther
people want to fill in other properties, so having CreateWithNNN APIs sounds
like it'll start having clutter.

Can we enhance the handling of the AdditionalData field to take fully-quali=
fied
property names and place those in the appropriate property at create time,
rather than placing them in AdditionalData?  What I mean by this is that if=
 you
pass a key of "xyz.openbmc_project.Logging.Entry.Resolution" it will place =
the
value in the ...Entry.Resolution property at creation.  Any non-FQPN will s=
tay
in AdditionalData.

--=20
Patrick Williams

--SYeWoM1tdSWlsGiF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGDqXQACgkQqwNHzC0A
wRlK1w/+MeEQL2thUZU9IZt0+IVv4n74i43sIL25iyXrsCdLWC88TNz+mjXYomiu
TpFhL6pKiuNDaegef9t2BM1QYo8QIzWIr9ppOhX9c2j3RI9gV//Wz8XjXkfJ5Xoc
eU8oNjLh5hw2/GljMIC24XDJ9NZCyqKyuAkUp9RXA+WrpzfKzZIQBRKmTubWlMpK
D6KLgRNsijgLrf16qMml2UyOqevZiLrGdSlyJ+tf62moAjhoq2elrlgjQm0tXsWV
bBc60ScpX8UHQsLcohVJCiO3ELhkR5ZDSkRy27jrxZCyDrnBpw0jYCubpLQL7Aa2
vJmm8aO8aUecBPuZxLKkEcGfXHa8/pLIf7BEnqiSYcJS+rn93bfUn2stn8OY0yZk
06tPTd0f0Pb9Z+5h05keS3u7ToMVDeyj7rMMxV2yeFNVAeNCvIZCKERrbxQtgKol
biEP13K2BgCMoHtA8MPy7bafjTr6lSA12kOJLYs64Xck0tOza1OiUYc9sk+9yKFP
C/h57F3PE+ggAiKHnzhEmBJLcCGE78O2R5OR7dOWSavqo3g9zwmg6OrXcmTvYDTu
HWcZIWyUxoqExbkwR2zOxriBV5+bHd82+RLhFtAiOzstndEM803QolnpPAYxUt4p
TVmVcJRVhysavwtlz9q4iCnItm1PthVz4AfVHpRwLTBPZ29K0kk=
=e1+M
-----END PGP SIGNATURE-----

--SYeWoM1tdSWlsGiF--
