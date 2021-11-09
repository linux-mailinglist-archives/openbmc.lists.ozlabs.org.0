Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4E044B228
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 18:48:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpb754dVBz2yR8
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 04:48:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=RYlb+YD1;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=U3HieIqv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=RYlb+YD1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=U3HieIqv; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpb6d2zZkz2xXW
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 04:47:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1090A5C00FE;
 Tue,  9 Nov 2021 12:47:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Nov 2021 12:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+u3yrGsEuvzhUUWBBZ+qPyt/YXA
 +PK/bhcjPj0f/wfA=; b=RYlb+YD1z8KUu43jlcafVkvT/zA+jr+pQ6Yhaqyliv0
 O2KMM31IdmTeq1LcVoMRwn1wpsi6v1EmIiczImli4KZIg9qOqWgS5d2b22kyCQSl
 Gys8M8pGL4ixl/b9InoCBvTbpGrWtjmGjIJ9EPEOkns6mWJSjQhl5jaTWQWhdRSg
 6z+TdNEXQJC1vx7py8PPX80E3SXQ4PH2NjeZX5zmBaMymk/xvv/4oUm9+tZv9Gir
 pQGG9G3UzLr52RuRJF23iXZZa1hoVhnrXBl4K0YW9kW6oJm2kJG1/5Y2FYzspLpy
 s2yBx7lhGJVzCm1Tl6ZQO2jptX5kcqfsrpGofm0WilQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+u3yrG
 sEuvzhUUWBBZ+qPyt/YXA+PK/bhcjPj0f/wfA=; b=U3HieIqv9af4Z3cp6/+tus
 JjY2Hf6FEI7EcYaRRnCChxASiDWxMBbbHw/37JK0hzb/Mr3PaR3dGsk+exQBpNrn
 sLKG9PIFU81tR3vfXr8Cq/WEVxy12CfUziQrcaCwLP4r5icT+F2WZFD0Su5jZFuw
 ID417flcwfdUz1G108tS/ivoAj3s301Tx7+lrEJnIf+H5vx/9ygDsI29ZseJXRya
 feLeUlc5/k0VcCHAQr3PnFhRQ2ChqPrj3rfPIi8TnDvgV9x3+o9KT/pWK2H+pSSd
 TLiriOHbtlCeLdYyLLZGAusfdfN9munfXrnPRTwa0wKezBdXC8V/+ooSIfXm9P3A
 ==
X-ME-Sender: <xms:Q7SKYRzCSHL7Uc59Aqhl3v08m7Dq5agb3tZIg-SHC9SfqzNVMguPYQ>
 <xme:Q7SKYRTqJYmyHKMJb8pZnsT2aOqFFT93Qfj6J6tBWbosUpHavXd00-TTI9iavpK0n
 KRXaORD_CBO9Gg4d_k>
X-ME-Received: <xmr:Q7SKYbX6Qo-0Z_xJbu5mMwRMznhCjHwVjfLTSUemIeFXCmvuAj3qY2woYOdX3ChEoKc1qWA5IUtoHZGQM74cHanuN-xrmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeggddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Q7SKYTjJgoZILce-Ilq2gVBAjNdA-j12K_7_LpQHtEdehZPs6XfPNg>
 <xmx:Q7SKYTDBWxLqeopK0R8cQAIUOk6v_rXsYKk9Gu8n6cZ97wX6Z6SWYA>
 <xmx:Q7SKYcL9yHkeLQrwQPN-wn2_84www43hyQX98hbs4xB8E5mJwkgz0A>
 <xmx:RLSKYWrZzuBkAgdPRuVeghyJ4Y1icp4mYYsXi84WV8boji5hWS5jwQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Nov 2021 12:47:47 -0500 (EST)
Date: Tue, 9 Nov 2021 11:47:46 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: tandehui <dehuitan1988@hotmail.com>
Subject: Re: ARM aarch64 confuse
Message-ID: <YYq0QvdarGn3TG5/@heinlein>
References: <ME3PR01MB808110CCBC2434149E0265F8C9929@ME3PR01MB8081.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pEFuI1ciu3SQw+Av"
Content-Disposition: inline
In-Reply-To: <ME3PR01MB808110CCBC2434149E0265F8C9929@ME3PR01MB8081.ausprd01.prod.outlook.com>
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


--pEFuI1ciu3SQw+Av
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 03:53:20PM +0800, tandehui wrote:
=20
> So does OpenBMC support 64-bit processors? If yes, what special=20
> attention should be paid to it?

I believe the latest Nuvoton chips are already aarch64.  In theory, our code
should be fairly 32/64-bit agnostic.  There have been a few bugs where the =
code
made 32-bit assumptions, especially around serializing data to/from files.
There could certainly be more.

> I am running openbmc on a ARM aarch64 cpu. I'm experiencing=20
> some webui-related issues that seem to be related to 64-bit processors.

The webui executes on browser (it is all javascript) and shouldn't care what
kind of processor is exposing the REST/Redfish APIs.  Can you elaborate on =
what
kind of problems you are seeing?  It is certainly possible that there are b=
ugs
in the Redfish APIs themselves (see above), but it is hard to know without =
some
more details on what you mean by "some webui-related issues"...

--=20
Patrick Williams

--pEFuI1ciu3SQw+Av
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGKtEAACgkQqwNHzC0A
wRmJGxAAoBH9mBPZDeatUHox5UOtZDent99r8K4Uao6dE6p7ydkYZFxyIISdQSJ/
sZ0bXX7vpIsEgmha5aWE9H8DWHO/hrljZr8gERKg5UJTifM8AwVVvkl1+XVD/6Us
0fLWWn4495m8CVBbPsBkHTVkPZEQA3NGiy2FKrBd2K+92vqLaVTKM0On3atZXi41
cx0yFZP8wxhK36rpOfDxabYuTjwHuinVPOJd55LC98nItje7fT3ZI3ebZjtl4fhu
IGPQz1mQ4m5KpJML/Kg9NDmnfm61Jowj6QI6rPn34WFZg0F0e9+aT+LGf36gidJe
31zvBrgnhIXS/h/Fo6Uv3mACVMFXiVhMZLS4fpVGdyUKVmFuXw5X+C9mh0V38oBp
rKcFX+eZHatKoU2zRtU6wW9CPQvYrhIx3REkttxnAiHKdat4wIidO+kQZv9HZpBl
R5RPYQhTvqg/rkL2xgy14intlpY25yY2HkYqD6Mvz8jJr/v3Bh6DuCVwM51IVCII
J+si1Btpp4mIJUDihYyyb8pyNhJ81ha/WGCMsjvMywoYTQbOwJaNl6EQOmEn2taB
TEf8HAYHZkbFVV+vjCxV3LNB8wFujz/AbuE30VfWSI62GsU+tTl6MGPhV6RsVRDx
/5u2Q7ugRVi2rhfG0DOMiZZvCGftBumDNmi2tBnaZ5icE3+lct8=
=xNkC
-----END PGP SIGNATURE-----

--pEFuI1ciu3SQw+Av--
