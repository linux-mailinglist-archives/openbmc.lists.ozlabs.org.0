Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E21D885B
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 21:42:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QqD76CztzDqVH
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 05:42:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=t1r8mFUG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=P10+01zn; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QqCG472VzDqjN
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 05:41:45 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 2A05FAE9;
 Mon, 18 May 2020 15:41:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 18 May 2020 15:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=vpUp+TRq5TwVJOQYDOz0SIXdiEC
 nlBZrCBTmTEWC4nk=; b=t1r8mFUGZFl+o3BuPxQhDQzuQFQKM9sGnkfcieg3Awl
 j0wTAAicH0U4rv0HeBXx7VL15Vr19Q0p/u1m32Fvw6TOn6I/djvqu0Bf6i7gLFZ+
 QX4Ad8aWxFWhoWS++xof3jM3hLMy4xIu81oBrE4RDRCoqM4LGgKnMH98kyomBSD4
 efvk6B/0XimUEWM/jrF77H0krC64+euuULfnQ3IYhkoGwOLyytoGwoq5TElohGfP
 OY4CqN4OkSw0JWSNPCmJGd//rrFsjb8Ef+R3w/1RtBPOZnczqUmVFWIekEB0xIRZ
 Z5HAH4TSS5klGCLtDn6AoHrt31k9gvoC+0pxTb5RzDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vpUp+T
 Rq5TwVJOQYDOz0SIXdiECnlBZrCBTmTEWC4nk=; b=P10+01znsw2v8J8yphM7kK
 tv1togN60TgsRugdPD7tvxFaVK9JvTeaMozioILvozJzXudD6S0+IC0ICKXREsz8
 wXeTW2o5Hi5r5QbAx/r3PWO6sdhLzp9hz6Lh15XINa/x+k9DmsiQcs3uuMzQv//2
 dwIio3k8RKdhKIHz7OSRRdbxFxJ69/4dyfOiz0jn/kgM/s/ZTuxLLXvsd/P3LUbZ
 Q4Z5opsinrSAbdGd6zoXpfddPsGs9DeadkxW/JQafBBoOfldMu2KoieKwf2g5GRR
 CRUTBrF+4yvuJwC4RvTULZjgzBL8gG+3ft856mSFfZZ+Wcbr71gMut9jENPEVBKA
 ==
X-ME-Sender: <xms:9OTCXjaX75tPGILJJl_jTzNZpJwTSGW-519TYkYAvoSm6qLIKQUJkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddthedgudefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeu
 jeehhfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtg
 dqphhrohhjvggtthdrgiihiienucfkphepuddtjedruddtjedrudekledrvddtudenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
 hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:9OTCXiYCnCitU_8oH-GmeLHfMAvzz7gWgdR_5-GAWbxJ0C2o8gFUsA>
 <xmx:9OTCXl9mw1o7rI2c5i9qx0A3ILKKTLNolWj6qxSHOoXK2Xnf1qUQXA>
 <xmx:9OTCXppcozk1JEQuTSIttIG_R0B2q8sytz93oaeQmnp4HVazJWabeg>
 <xmx:9OTCXsETtHqMwo9nMBqzUL7Qqtkp4rSilDbiURi5sE_MHatEKCK1KA>
Received: from localhost (mobile-107-107-189-201.mycingular.net
 [107.107.189.201])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8C3A3280065;
 Mon, 18 May 2020 15:41:39 -0400 (EDT)
Date: Mon, 18 May 2020 14:41:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot-v2016.07] libfdt: Make it compatible with newer dtc
Message-ID: <20200518194138.GJ1166713@heinlein>
References: <20200512212755.621891-1-patrick@stwcx.xyz>
 <20200512213135.GI10214@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rwgQ89ZNnFUwFHTC"
Content-Disposition: inline
In-Reply-To: <20200512213135.GI10214@heinlein>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--rwgQ89ZNnFUwFHTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joel,

Any feedback on this?

On Tue, May 12, 2020 at 04:31:35PM -0500, Patrick Williams wrote:
> On Tue, May 12, 2020 at 04:27:55PM -0500, Patrick Williams wrote:
> > From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
> >=20
> > DTC does not use an underscore for the LIBFDT_H and
> > LIBFDT_ENV_H variables, this causes an error since
> > u-boot does.
> >=20
> > Remove the underscore from these variables to allow u-boot
> > to compile along with dtc.
> >=20
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
> > Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> > ---
>=20
> Hi Joel,
>=20
> This patch is a port from facebook/openbmc to fix some failures we're
> seeing building u-boot in some cases.  I originally tried to submit it
> as a Yocto patch [1] and Andrew Jeffery suggested I send it to your
> branch instead.
>=20
> 1. https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/31833

--=20
Patrick Williams

--rwgQ89ZNnFUwFHTC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7C5PAACgkQqwNHzC0A
wRlOQw//WmFFAJy5ERi7C/oC6Jr+8U7W9fYjMg/OmAJwYToOAr9eVmAictvtdaBZ
+PVVkIBMiGcZM4M3Vjn6JFWNscI3TPfIi3WZ1zhn+iIjy2d1AVpYcR+pM6/5Ll3a
TfFFXlSxTy0AgLCCAV8f0wOIQzvIw6tYOXUUYiDGiZqFhm/Gucr2OKtuEu+OdLm4
kFVjgmSxjhwr/dYpO+2Pe1p3wyjTXyRCWxEKr+ao87gy2XOSNMoMdssWpYrId08K
6nmXEuELULQReiLTe7CbgP9rNolLTeoaRUaSaALhiu3K5CPtSTcR0C+4RKruBGlG
baDFEN/QQGpyKKCfowDnb50p1ddy9oZX78FQ+Hb4tCuO5ixHNl+nTlJs6ujSLpCN
W6XqGB+MPFqjBwQSXhbenGzyqMWaTN4v+u2SBxS+p1GO5msl5ykkjmCJp/3PJiuc
fvWwHMbFAbNcEoYjzUM3z1lJfSVc/1C4UhnM11hqsRMH95iq7vUwo8UYKjZRtMmR
JpNY0fyiNXNIxY5CUVUk7/3kdU85SX2Od1esIn7yxfIx38nyr495d3bGag4NCpHn
akxtgfu6hMpfVA1HFRProNxYmmygZwAYIi3AW0ih5UvMbAg765I/WFAPey1yb7Kl
dEP2UE9jWoVx9XXZFSdyG5W/jiNpckqAtcMAIrLLskmH4Vzs6Qg=
=9k2a
-----END PGP SIGNATURE-----

--rwgQ89ZNnFUwFHTC--
