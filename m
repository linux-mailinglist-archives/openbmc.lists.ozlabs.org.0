Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1843FEFFC
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 17:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0l2y54vvz2yJd
	for <lists+openbmc@lfdr.de>; Fri,  3 Sep 2021 01:19:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=oJyLNMwh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KM0C7ddF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=oJyLNMwh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KM0C7ddF; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0l2R1C7Zz2yHP
 for <openbmc@lists.ozlabs.org>; Fri,  3 Sep 2021 01:19:10 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 9938532009A5
 for <openbmc@lists.ozlabs.org>; Thu,  2 Sep 2021 11:19:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 02 Sep 2021 11:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=lwaJqc1OeRJ+fVNL/0gRryfJsfE+KZYwKs3ed7+ToyA=; b=oJyLNMwh
 XS+WrZIXa3JSjt+BePZqaLaVOxaJlUkwsLaDzB2elksRLAle91hNq7Puf0qDwihq
 0ZVPOl+zoW/XTErPOpjTSbdIpqEZcGdwvzLVWKDWwK4RlqVCDC68d1jXXuOVe79M
 ROEHO7N1ay2nfukMILjNcWBA5FvOkej5T34p6sMVf0O+2WluMKkcD3CGL7K/jl92
 uRGGHyhw6arrTwycG7qwuJcoT7dyPFU73HnYO/dIhCM6xmPRtJ+AW2WHazk/Msh+
 MK5a7UtMdEJY2oebBcfMWoW0/TDBd+k8WUW4fbH13T7LDCZhliWP9WCmX68u/jIm
 IkZdYv1u3K4z5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=lwaJqc1OeRJ+fVNL/0gRryfJsfE+K
 ZYwKs3ed7+ToyA=; b=KM0C7ddFF6Hwb4AWMutCiCb+nag/7GqLcv++4EuO0lg7L
 QVP1QDLKtLUjmNYhKISkf/aaPhdxj6pPhNmiOsFYTA+K/DWsj+unX85R/Xy5TZno
 qDlrt4AP82kec93ccxxDl4dYNTq6MAI9ZlkE+Vpvqx45RZf5w4h4TRiO5gGURLLb
 9+C5jHjvCZrWfUOBKqiEDrARTg+aGJAZqETC2v+ZHy/2BWZYRHZmJYMOyo5ZXGzE
 lXDR9ogTRo6xOzwnuiOOxgl2Dv5+0+nXwrYt1zvi8UTzwBVYjSbiCDYl+RmvOOUr
 LdqmqCizdqecZ731EvQOp29TDz8V+NhyCD3CjorPw==
X-ME-Sender: <xms:aeswYb7azz9DhRTSp82WnU07w8So1E6B34OjrADMIhJRBD3Qm6_s1A>
 <xme:aeswYQ7zJJ03uPiHLBevW6zkbpzr2VsB4YaRtziCgwxuGsbPb0y-uly_YCtx6F6_n
 rBY8UrJ9ipNmrtAne0>
X-ME-Received: <xmr:aeswYSdpYkdzVdG51-zosgRowxAgwh2vpmsCgsKSOLeZlaCkOZxLQ2aEMCW3uLVefjA44-YbKaRWhzYsAQKtCPCfMW2jqSU3__2ihw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepgfekveevjeevffevhfektefffedtjeel
 heevteetjeduieetvefhieekgfejveehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:aeswYcI7N9aU0oS2RD41WDpfefJlOwLbn04MgxkQffoP0OMaAzWpDg>
 <xmx:aeswYfKBUGSOlNKIh8I-8lowZk4dWo_e3zpYX2vVd4_V7GzZ6cVtQw>
 <xmx:aeswYVxcBTOdJ1sXbnD7zwCYzYVsR2m108PDftKiAgJufvUtNuTQTQ>
 <xmx:auswYak5g3fTFZx0Q09LUS2djCMEupEPjaduXguRXkqmhcCtLT9qDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 2 Sep 2021 11:19:05 -0400 (EDT)
Date: Thu, 2 Sep 2021 10:19:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: `phosphor-loggin` APIs
Message-ID: <YTDrZ9k78VM1GDB8@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nu2mfBlDKXR4AH7o"
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Nu2mfBlDKXR4AH7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I wanted to make sure everyone was aware the that phosphor-logging `lg2` AP=
Is
are now merged.  I've ported a few repositories to use them as samples you =
can
use for reference:
    - phosphor-virtual-sensor
    - phosphor-bmc-code-mgmt
    - dbus-sensors (in review)

I'd certainly appreciate if people want to help do a conversion on any
repository using the original phosphor-logging API.

These were talked about originally here:
    https://lore.kernel.org/openbmc/YQBrbuQFz4JihBAE@heinlein/

If you are doing conversions, you should find that the logging calls are mo=
re
succinct and you should not need additional calls like `string.c_str()` or
`exception.what()`.  The lg2 APIs automatically convert most basic types.  =
If
you are finding you are having to make data manipulation calls in this
conversion process I'd like to know about it so we can make the API easier =
for
everyone.

Catch me on email or Discord with questions.

--=20
Patrick Williams

--Nu2mfBlDKXR4AH7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEw62UACgkQqwNHzC0A
wRmcMg//Z6tGf/ngPx1YlTT/GzsuCUk/vXjBJ3jczTvt+IwO8YjrpQ6OjVmXmCdV
A7kyemxPYXRwix0r5ZC53H3SUoAHGU9qkaHoEJ/Phq7l9owG9kr//I019za3LAIO
CeRI+vOuol8IQeIB7/+JBHDTYmDey53wSq6ovE2SZPjyZijjSvOGfdCnS8kC0rmY
Rc+mD7s1HGOEGT9wu4CvnjsHUlyFdmDiZnldyAIqmqdcgS2qwSdUjKh2HC10OA0c
x8rLNehKo4DAeEjGPc3zig631M0vC7mvDWnqGOWcy/4IYLY8nESJRgYGGx1vaeuN
247zLOeumPdGk1qKpidRvZDmEdP47Lk4YswG/f60KYtRQWbVJ4pmABMagwf3QLeA
8iec/1iPGdaFWos2By7hBA0YOHdhAP3BqLpyHiYtaPnP5CCTwEeQ1acXset1NshN
JvwxEZoZ65ectoknLx1Smn4da/JTb6vq/qy1Od3aWTKEX3EttyhAsfMcBx0QtCy8
X9gAF/eJdREI/HGlLszmK3S/GbbeBLjoBzgH7Kl4wS/B6V6wTrsgxtHYQAnDY9S7
GUL9htjVfgtQOmTJCMa/8Vhk/6JUWqoDak2XzLLl3zgcdF9FGYS65U2PIbX+8fcR
ZpOTj32z3GnhkPOYxk4YigukcrujM5/wzprTX6ueajvslTM6vtY=
=906q
-----END PGP SIGNATURE-----

--Nu2mfBlDKXR4AH7o--
