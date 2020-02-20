Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F188C16623E
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 17:21:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nfws45vczDqWp
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 03:21:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=LWEyhJTU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UXWTAZ6m; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Nfw143vZzDqGc
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 03:20:48 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 651FF73AE;
 Thu, 20 Feb 2020 11:20:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 20 Feb 2020 11:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=9tSjI9deMCLWS9upyMgejvA/UEe
 ZrDCijsB8mvZo52g=; b=LWEyhJTUnRRRQxBzJFjdYgoLLMRU98cW6LkN+yNEifc
 GfaD/QYyeMDxUPGoY3Brxem/I5e6kD9jkteTYeVUky2AXAtEiwPdQDa90KSAIXdB
 7h5uHQVpbWd1sfEE1Ua6vTih9sU1kP+JSuPdK0GbYvEbnVvQlilUmCAzZ4VDvXk2
 I6pH1yKqGxsNa/zZVPf3NE7LkYrSEm/k2dfJkOO6IKq7jff/BnyCpp6u4lzzclxg
 Q8FWWjCz+OEQF5NlewV2wUHA+o55TR5Q87rao+tFrmPitDz85VkByxTbzMdWaz+F
 hXRFRQcszdAeG32k9+7cIKW+KaJAwxbLR5vkW404xXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9tSjI9
 deMCLWS9upyMgejvA/UEeZrDCijsB8mvZo52g=; b=UXWTAZ6mWzSjjfrrD6t5EG
 gaFdGNSo2YxTTy35jhSf/Hau1OX9sPMccdq0dJuLYehwIG9UQRJ7zYNxEUxLBSTJ
 eHSsiMWx6oFSrm0mnxQanSGlTamRDF2wDyLRXQ3Zenu5ypiXhzjAyAIuzDxnatHK
 gyGvptVpavhRx3iKxn/Y2DYLHj3vkyNwOU3i7M4VzKbRlUU4Y3mwUv3ZrX8Sr6AJ
 JTbPvQZas3TFNUmSEdFBPtG3zBKLWy4W6Vc4DHEnoN7cwGYZGBj4Yncqzd4MqX2+
 oHFnLIwSHFuQWtfOO5hNhzD0VkrLN3M2az/2m67YeT4Ud2FR/0G1LQyiFiaURqng
 ==
X-ME-Sender: <xms:27FOXrvV2tFiJAHG0tzqcPWLQmSmPNvGO5t-3nUzyTHJMrw0AQDn8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhepfihikhhiphgvughirgdrohhrghenucfkphep
 udeifedruddugedrudeftddruddvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:27FOXmYjYxKlezBsP500m-YAbKqi_P6nkZYEi1bgnHzVWGb1BO4TnQ>
 <xmx:27FOXlHgNto7lUX2BlwKxTnQE8sQ4dhj05szgGiyjqG186e68V9TVA>
 <xmx:27FOXgvftP1kLsUNDvPhuMKjx9Ll1FILpv6beahTh-VyC5FTSQ766g>
 <xmx:3LFOXnvm6tm8-GDZE7itMG5l51u6sgVfCLyCybtp17x7mujauBb6Fg>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 49CAE3280064;
 Thu, 20 Feb 2020 11:20:43 -0500 (EST)
Date: Thu, 20 Feb 2020 10:20:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: =?utf-8?B?5bi45pmT5piO?= <xiaoqian1641@163.com>
Subject: Re: Why the journal log records IPv6(::ffff:127.0.0.1) not
 IPv4(127.0.0.1)
Message-ID: <20200220162041.GA41328@patrickw3-mbp.dhcp.thefacebook.com>
References: <630491b9.b0a5.16eb1614767.Coremail.xiaoqian1641@163.com>
 <37d82a1c.6ab1.17061b3f429.Coremail.xiaoqian1641@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <37d82a1c.6ab1.17061b3f429.Coremail.xiaoqian1641@163.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 04:25:48PM +0800, =E5=B8=B8=E6=99=93=E6=98=8E wrote:
> Hi, Team,
>=20
>=20
> I enabled the "/xyz/openbmc_project/logging/rest_api_logs" and add the pa=
tch code as followed,  the journal log does not record IPv4(10.0.2.2) but I=
Pv6(::ffff:10.0.2.2) .

That IPv6 address is the same as the IPv4 address, just in IPv6 format.

https://en.wikipedia.org/wiki/IPv6_address#Transition_from_IPv4

Generally, applications that support IPv6 don't [need to] know if they are
being connected to by an IPv4 or IPv6 end-point.  This is how the Linux
networking stack handles IPv6.  When the application indicates it
supports IPv6, the network stack will give it IPv6-formatted addresses
even for IPv4 connections.  This is what you're seeing here.

--=20
Patrick Williams

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5OsdcACgkQqwNHzC0A
wRkG/A/+PmZLqo7+VUrpq+RqY+xvWmZAdU4D3CUgdElsX6OdwXPvpXRu1WgKwOZF
MZl5jVGkCFeQ9PJ14TzOVfssgjpPtgj1wTOukYpG28FA89M39BpZMyw0qUXmC/Zg
UpYO5GCRYNiKwcx9ARp6J86gW4TOWLLGdjBtaKoBFwhAIAqz/H1oelEVC3IZbS09
yr0N1tfzANoxh18IV2e+BSxwF2rDIrKKn+4m5reVShirNctRjP500K0vW7IJRHf7
JO/gP8eHICnMpOgj0jV7K29bauUvCXzdAiJt5motj74YaIBLs2eGbNSaXn9o9Ero
ugcEyBVGtrS+ymCMmP+bZcOY5sl6OrZ64autSLUMtM6m+VUxyu9/VDF7q+3Zf72Y
d4CegrQBsZyCXW8roch/ucW5UwsK7++0tR+4Ld8N4gHA/lBPwr2H8VGEkIYMhjgu
tMr2R5KBvOSJq3MKeaksdlSt0u/qWIadbIkHc5BMy+OkXmDIE9ptNDLHjODmeCM1
Yv5l09UCMXq0J6iwYYOhtpKoak4zsOlANNr2Ssb/wtPPL1iGEbzTIfJ0dhwqffr/
IGK+uNSxc+ENqxy6AWYZ7bJJ7g+XLe9AvuSdglCB7HcJk34PFamwP5NvefjBS3Bt
CA1Wvre+p9QCK9AFr29ROJ996a9oFBR5kIfgZZvnTtGanDTFxyA=
=XOA9
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
