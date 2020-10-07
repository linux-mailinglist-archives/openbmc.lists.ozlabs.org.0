Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6A28568B
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 04:01:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5cyp4NTNzDqGh
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 13:01:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=gc3HLM3s; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=LVzgcW4j; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5cy839ZszDqCc
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 13:01:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3AF24A1B;
 Tue,  6 Oct 2020 22:01:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Oct 2020 22:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=XGoewdv4KKtjMEWAYX9w9zZIVyS
 ZiEwMFfJGQvcOtvA=; b=gc3HLM3sfKU6JfgOQRPJIC5ZdPlkZtc6fsbHQqSTPet
 qE5QyN7OtS+w4kwAiD4MqLUumw3yADTOCj8eq+TAhIdtYksAQ21ZJHOepA5QFGCF
 nvngGv5eo8ub7FeVF/izLpqCk30BPdqsIpfAo7pdd8ocJm4aQXWYLOLnf7Wb4l4+
 KJMW5Ms7oLvV+N30bWb16beR978T0+6fZG1YS0yUUzDVQUj0Vj8Nn7TCA9TtEgMY
 mojDWk2s0FzkHBBJBdvuCt/F6oGfYIlgeNbLrA8KBZbCEXNepZf5GqbUAfifyEvr
 hM2UCxqbDNP+XWJQjoAthbO/97Q/a9y5EINZBGAgJMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XGoewd
 v4KKtjMEWAYX9w9zZIVySZiEwMFfJGQvcOtvA=; b=LVzgcW4jTxJ5FekvalbBxe
 HF/pUGRvNVSfCFCSqInqTxA1sc/IwT0ijO2ZjL1OMxBFrKcYl8VYrGGKXrDwogg2
 kzAIqFFc5960avf7tNB1xZsx3s0vo/k+E9jZQTEyFW3Zi8LEAMnbQVng1uCa/Zsg
 +g+yrgMQ2f6rT9sOpobn3lunMD3HMsFX7BJze90+zi1huZfO/bBDpFkuxQGyim6T
 lwyxGP7iKPnV7IKmM60yTlfxnSAXepN4AiFizhLItR2Dhy88OLV6XaEYwLTAsJLs
 b2h6NA7fh38iqtR97SSHQm2Os8pP5VBOF39uPWnH0O9AWmXoh/p7onkQV3OTwl7g
 ==
X-ME-Sender: <xms:bCF9XxnEjRab1sCGonKO8PGO-MbsheQ4MAH_m28HKatpkTZa19EF-w>
 <xme:bCF9X80QjbXgZW9qX90VzCjAttm19aImpE4yyC0ghnxP8umX_nlZhLEmrXfKImEf7
 EZaFGm11OqZsi-S42o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeehgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekudeutdefiefhheefheefvdejueej
 ieektdetheelvdfhleehkeegvdeiveekhfenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:bCF9X3qthESQxVRoCftnpvDWVAtsO0dpSxLc8ss9dhP1gttYHpJw8g>
 <xmx:bCF9XxnltF0BHALDdxN02WKAeuVbwhUx3C7jcO2tuXkjY5OINWo5XQ>
 <xmx:bCF9X_3FKYl48H8XzSILqotKApF0scb7S-T4SuKIQBeXvB1M36G_0w>
 <xmx:bCF9X0iwAzVBWvRxl6qlpSGjzfqm5jYV1xuzbyg6xdCQwxxt3clvcw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id C33983280059;
 Tue,  6 Oct 2020 22:01:15 -0400 (EDT)
Date: Tue, 6 Oct 2020 21:01:14 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>
Subject: Re: Injecting public key into openbmc image for CI integration
Message-ID: <20201007020114.GI6152@heinlein>
References: <FDDD3DE1-6228-4BFE-BAA2-96CC549D2CEB@hpe.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ekVaZR3ysCuYLl6k"
Content-Disposition: inline
In-Reply-To: <FDDD3DE1-6228-4BFE-BAA2-96CC549D2CEB@hpe.com>
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


--ekVaZR3ysCuYLl6k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 05:45:07PM +0000, Verdun, Jean-Marie wrote:
Hi JM,

> I looked into openbmc and it doesn=E2=80=99t seem that there is any stand=
ard recipes to create a test user and inject into the account a public key.=
 Does I am wrong ? I wrote a very basic recipe to make it happens, and was =
wondering if it could be relevant to upstream it ?

Yocto already has the 'extrausers' bbclass, which is typically inherited
by an image in order to add additional users.  What you are asking for
is slightly more than that because you also want an SSH pubkey, but it
doesn't seem to support that out of the box (it appears as if
EXTRA_USERS_PARAMS is a variable containing a shell-snippet, but the
bbclass explicitly prohibits arbitrary commands).  I think you could add
a new package to add your SSH key though.

What I would suggest you do is:

    - Create a bbclass that:
        1. leverages EXTRA_USERS_PARAMS to add your test user.
        2. adds a package to the image RDEPENDS to include your test ssh ke=
ys.

    - Submit said bbclass upstream here.

    - When you build your test images, append to conf/local.conf an
      INHERIT +=3D "your-test-key.bbclass".

This will give others a pattern to follow for other networks /
configurations (by upstreaming it) and allow you to build special images
for test that include what you want and mostly leverage existing Yocto
hooks.

--=20
Patrick Williams

--ekVaZR3ysCuYLl6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl99IWkACgkQqwNHzC0A
wRkFgw//Ufqunwi/j/fuLM+eqGjLzIqDX3gO9eHBSPPsKSYjZnzP+1LlzS6xbbK0
MfxsyNhhG4js5XX3RjVRy+gcz93RsSgzFqvu8/uLWRcBwlOd03w79xkO8j+q6kgv
s8nO8OEe0wOZVecH5zOHvctNb5xKcgoSoOCu4w38y6a2c7C+rF6dDLkne1wKoN++
hBbzSNehrMIuJZzpBH/RhuYCt8rCQgkyvPmOyxkp/ImtxRBehZ8qndFDOSkPFPnj
T67Z6xb5BCE88BA2pwx4kxMxsTFFWXiTbpq6pP+cDp/VWbJGVVsFIzCnFuO+8/Vr
gwtpOqNfLK0y0F4uBeyWeTFizsnnubYZtQXmtEqpei/hy73VXycDt/WNnqtoIfp4
xh4TX4VdKaV5pQ8eREsNJOFM/NIIlF+351+QtXdwrwG+P2CDxECLnoT/03t6p/UH
TgwxnlFKBUSwuyGbjDdKUESS6SVAvF0dq7rTM9en0GDzkHi0B5HwV9KBADKJIRmf
dE+HAYOXofA1B1/xCeRdnPWHaliMBwneul9bQcg6HWh+Y7bB1q+nUPyTmn9wJKD5
1RmnLLltcyJk1LNK5QvxsLC0uyym43KzXz/vO12zcpLzh8lxa1l+psiDb9Ir8oE4
s2HNjMmfWXUFvz6tXCnVUBmc56UUjzowAuppiXD7T2pweO4uU0w=
=GW/W
-----END PGP SIGNATURE-----

--ekVaZR3ysCuYLl6k--
