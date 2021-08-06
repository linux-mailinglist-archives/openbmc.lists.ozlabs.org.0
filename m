Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B03E2DDD
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 17:41:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh8pP1gkcz3cd0
	for <lists+openbmc@lfdr.de>; Sat,  7 Aug 2021 01:41:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=dKNxraTc;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nRIcaB1O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=dKNxraTc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=nRIcaB1O; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh8nz73Rfz3bW8
 for <openbmc@lists.ozlabs.org>; Sat,  7 Aug 2021 01:40:55 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 39E615C00D2;
 Fri,  6 Aug 2021 11:40:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 06 Aug 2021 11:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=QC/0Ytrix0pk0hMusiHdhEd0msV
 f/o+vcEe8/Hb/NZc=; b=dKNxraTcWt6qZZZVRzamKxy0zrS63OkdwiGgsNHaho5
 KnAAawkhfoZyUUrLhaEGAgXuXsLwhnTyRvS7vG3KPvehoq+9Q6/HkcmNjOyeTxDt
 Y4M/V8Rs377jiRkH+II049iE4DQgpEzBFH9M4qglRQutArZIik028t5hBj383p3u
 qSYbMP9brf4ncAYvpZLrEqQhc6aRYDTyEkhwaIYeWuZtnoKhf30ByZiv+8Y2O8vD
 tMiq8XeHXBTuT5iIjxUkPomkciSZlTBargFYbvF5IriQEZFIkOyS7tuLsWKaAnKW
 2/ff3HJ+YiSIOqur44gpQuwXrqSiNG9RKTgt9FXX+rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QC/0Yt
 rix0pk0hMusiHdhEd0msVf/o+vcEe8/Hb/NZc=; b=nRIcaB1Ocvy9aytoXpVCy8
 EdUv8uFLvuIr0Wg2qbFuxA8bKDkrnDbpczHsvdmI13wl2qEiethhkUtT6TszzhEW
 GgJ9jGJgVmhd34G+OjxvCKFnUB0YE0WXijwskfOGktIjWmIvM4fvtm029rxeQsbh
 q6upRZVzF5Xhp91Eow8WYpXkSU2dhHLvwRWIpDwO8a+d5Oooh0Pacxe54D9+hx+v
 I6qzBfumIDRazXJohxTfmyD+ndQtbuRoGd2atgytP4j0GhdFvGoV+UdFz+yR0PCi
 WeQ3ZRBj2Q3E3g11Stp6CNPvwZeO0xNkRtXR5AVEmAxajuKxd4dEE9X14u5szGFw
 ==
X-ME-Sender: <xms:AlgNYX4_myCePMClO9G9i6H2gVt9ZAZIZy5bZgR92JJI1tW0GLN3IQ>
 <xme:AlgNYc5YQ3HfOoEbWzV-IgA36VNe16tgrM3UbUkQQM6Asym3wEmv-8ZGey4BYlf8W
 A_KAPIOKzjw_UesdKo>
X-ME-Received: <xmr:AlgNYec7vjQo2XmpcYhiagVxTx_zIQPoDdf78OZhfopmLvZOrwtwWi6Tg196k9VfuqD231gZSfJncM0hbdpLmfzLdVh72w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedugdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeujeeh
 hfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:AlgNYYJ3qC5X9w8-GvLnUukVjfZY4QofySGCOh0_S9Pk0-LCzfcXFg>
 <xmx:AlgNYbJyNV1Ek_i1nBwKMbJkSkUEu-VOOnFAOqKObjX806Aatq2_Uw>
 <xmx:AlgNYRxezE0XywDmo-IieOPYJCwdielYqDQbO_Nm7BeSlKEO2dwX3A>
 <xmx:BFgNYdxOaj3Iv10wWty7fC8jjOeWPy85tXAjTZ2Rt75dxbrqoksgbg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Aug 2021 11:40:50 -0400 (EDT)
Date: Fri, 6 Aug 2021 10:40:49 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: meta-security and DISTRO_FEATURES
Message-ID: <YQ1YAd1SraK9el8x@heinlein>
References: <3403ce92-825e-cbfc-1e53-334765134df5@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A/HO4bMr8z6jdQXO"
Content-Disposition: inline
In-Reply-To: <3403ce92-825e-cbfc-1e53-334765134df5@linux.intel.com>
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


--A/HO4bMr8z6jdQXO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 09:32:45AM -0600, Bills, Jason M wrote:
> Hi All,
>=20
> I am getting a warning about meta-security when building:
> WARNING: You have included the meta-security layer, but 'security' has=20
> not been enabled in your DISTRO_FEATURES. Some bbappend files and=20
> preferred version setting may not take effect. See the meta-security=20
> README for details on enabling security support.
>=20
> I checked in the README and it recommends adding 'DISTRO_FEATURES_append=
=20
> =3D " security"' to a config file to enable all the security features.
>=20
> I did a quick grep on our layers and don't see that added anywhere.=20
> Does anyone know if this is something that we need or want to enable?=20
> If so, should we enable it in a common layer or will each individual=20
> layer decide whether to enable it?

There is this pending commit to handle it at a meta-phosphor level.  I think
we're just waiting on a minor spelling fix in the variable name upstream.

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45322

--=20
Patrick Williams

--A/HO4bMr8z6jdQXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmENV/8ACgkQqwNHzC0A
wRm/Ow/+MooYfT51UdAyIPaYfmHvOGtFi+B0xbJ/2FTMzNaEngMDCBOkhMiudRA3
OTKi8RZQ3CVFlDutPuGP1DycfQP20wmFglpS1fokAc+lh0KbNwyK8sG+gus6muB/
zCtwKr2DUPr+9UGONTEm6N+FqxWvqZHbr6+fARM5nQlm5R89/vHxLMymN8x69lXd
KXcy67TRtFYcxu8bQ0qi0yrYMWjn5AWKXm2hzHXOKsVCY43+cieX/wccDDb8dgbD
tzwhr1sCrm61Vljp9IxG0BRKylkBjB/nS2HKZZ1R3gvky8K0wWKIeOy8MzHGlhDq
EoPkUk2sedU/R7oPdNfGwBZkMJpWc+S4VkzOwtr02KJDvnei2hUvOW6pPUOZuH2X
Qeyu4SYwpqT8oiaRR+Q1y2Egk+fl3CSTynLGEc9AAqUwwOWnEuHTOq88hGSHV7Wr
u4S/09pUI0f3BFfXlK1dzEbFm00wCOS6bPJ1J3maRlyR9Yw+/RXYfDJXtF/vN9Mn
ng+Y5HzYTf0ZaaQxXzJLXo3bxMwIINUzT6BsuF3hBo41DLCRTn/det4vwtaJ+ChG
V/gzvjd5pZOjJ0SxiRv2D1kUvbOwnp/6Lqlr8hgrBiPt2ktHJPa3cTfJXBnsRkE3
pD7ew+YwoUcuQKO6x7V7lTfa9k0bBOKeUPHEQnoRa244D3HM8O8=
=rPuZ
-----END PGP SIGNATURE-----

--A/HO4bMr8z6jdQXO--
