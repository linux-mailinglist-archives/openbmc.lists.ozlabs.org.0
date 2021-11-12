Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A344EB3B
	for <lists+openbmc@lfdr.de>; Fri, 12 Nov 2021 17:17:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HrNzK2vFpz3bP4
	for <lists+openbmc@lfdr.de>; Sat, 13 Nov 2021 03:17:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GXMeN0rc;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ktCc78V4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=GXMeN0rc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ktCc78V4; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HrNys2ryQz2ymt
 for <openbmc@lists.ozlabs.org>; Sat, 13 Nov 2021 03:17:24 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A9EBC5C19AB
 for <openbmc@lists.ozlabs.org>; Fri, 12 Nov 2021 11:17:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 12 Nov 2021 11:17:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=epVX3inosyXGqqJdH05TXg28JQ1k1m3dgx9+HhPqegA=; b=GXMeN0rc
 pryXPXa0QEnfvnZpJlNBlhOnFe3cIL1P26noWiUf7Dg7yTvJDzpKZ2883VZE9FXG
 eHo+Y1/kK7iFKyV8B+2FA+vByCEUCu03P0yMs7yUpXtpGQHdEOmWWxymsUe7EyNC
 rBaQMVmbdRz1Q3GIqXgTj5XI3XHqaDt6FPzko07dWE9QMV4LcrQZzjabZMF9tiZF
 bdN8QQnChYc5ysrMEXnujz7QZCxxaArltvQcjOReIwP9soP4AMbCuqWMKYOOSOwt
 VTVkFVcTnB5KhocQsF/guMLxe5NLKjGcXN2KVLxOcXdBJQGaQrzg2BoANbs6iiIN
 eeEtmZKEIhX23Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=epVX3inosyXGqqJdH05TXg28JQ1k1
 m3dgx9+HhPqegA=; b=ktCc78V49dc5Lg7fOvLvxokpIMDjD/o+R8p38pSeEiphq
 3NSE2bk/p+9qy20mMEtL7dQb8B6nM8aTOU/+tWpSVneXXvJvGld0X6ZwIStXtrHy
 AjGdSlJOEmrZvhIkqGh+z6vxezd9mpNICFCp8NI1o1Eb77+rOuc2BGCRvVDwnjAo
 ZamoF1v/W6BqJciQz/FiNxWbbPZ+kWHHGiFRrhrDjaY1qPDPlokgTbvrcg1Og7Gu
 lfJSAlZqzDBcyL2b8/uwSGzHu7MxbtrFWXJiesy+94OQ1j9sxoVq/d7ZT9L6b6b+
 fAEY13cEyUBrlzODDw2+z6/zlC38RSPa/urK6v+0w==
X-ME-Sender: <xms:j5OOYeqU7u8nFVFGPW5gQXEnYy2huCC3KHLy0DXf9VR6rRIjxOBsyw>
 <xme:j5OOYcq_Df6BNJcFIvapV1i1rAZBEJiPOtS2uuzNor020JnkPmJnN02vKQopDQvbS
 CRkiD9FRoRmzx-xsf8>
X-ME-Received: <xmr:j5OOYTN9wndPXZ_AL1HyZEcTRHbHL7JLpoU0sQASZhFEQr5T7DydzPieneZxtEqUDtVfxxX_1gTPLQiJ1Z9RB63bG1loPEQK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdefgdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfggtggusehgtderredttddvnecu
 hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
 igrdighiiiqeenucggtffrrghtthgvrhhnpeeftdffvefggeelleehteelkefgheduhfej
 feeggeeifedutdehvdethfehveehvdenucffohhmrghinhepohhpvghnsghmtgdqphhroh
 hjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:j5OOYd6MMqSkb03V_yncJ_bCNmTfKCUCyHUOaW1KkAq6MIher6FlSw>
 <xmx:j5OOYd4yAfGZoM_c3ypnjydgIOw-d090eYQA4ivc-3W3gM7BgrKWyA>
 <xmx:j5OOYdi4xJrA-7kBvIhK0qlSs0kEgnWfDVkWoAluyzStsToREjnQiA>
 <xmx:j5OOYeVh2udhaBVq_azNgOQ8D6EyDRl8FULLbiQi0geEHUeMpBTgvg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 12 Nov 2021 11:17:19 -0500 (EST)
Date: Fri, 12 Nov 2021 10:17:17 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Unix-mode newlines
Message-ID: <YY6TjcddpoYGmEK2@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IHkZ/X5RFqsXTNmC"
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


--IHkZ/X5RFqsXTNmC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Generally we've had a preference for Unix-style newlines (\n) and not DOS-s=
tyle
newlines (\r\n), but it has never been documented.  I've recently found
a small number of files that are either DOS-style or mixed-styles and I've =
been
fixing them as I've ran into them.

I recently discovered that clang-format has options that allow us to force
Unix-style newlines.  I've pushed up a commit to docs that makes two change=
s to
our C++ style guidelines:

    1) Document expectation of using Unix-style newlines.
    2) Update .clang-format to enforce Unix-style newlines.

See https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/48770 .

I'll leave this commit open until early next week and then merge it if I do=
n't
hear any concerns.

--=20
Patrick Williams

--IHkZ/X5RFqsXTNmC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGOk4sACgkQqwNHzC0A
wRk/Vg//UlSOHcvCOqn9J6nqT/lZnGKdFF+/vqnyP9J5Bg8dqmGyKUPB2xgkj9Aj
K1ZIqyUCukqUXRDSRMyohJm21IalbPTnPrqTYEA/nn2rO/HSsgGkPcIz1fOHck/h
kkmbTGhRtY8IUJUP1dgghfzZkAkbOddW/bF2u/NNA3R2uDjqVobkBK8gGOq6EY67
0cleTRwtJ8WbvspvXX3Bzob3NtqJvY5hHsVWzufsm5LzWH/2AkhjYSF66kLDcMnG
1W3xDI/OTBfhvSU7NAiRNYZe7M3Ve5CxB1rPv47sQOkaZ3CjB0GGKYvNJNvv57vu
3O1wItO6iIcIQldyiGQXvnytL20LpFV3dO02aSvyfqcJ2hb4W2Dg+i6hYmNl1m6B
JWONQkQ4nK6PiirNhEa0aFaMHDpMZOfh/Elcx4RGP9ZJh2qVu/ydNaDN6KDVlTbQ
jXFt9z3CPTmVk6XLoMTs3TQ56ZbpGlcEKNOAtVlwHmxEa7rEtaSuqrc/c5dH+Gay
wFr0JC9sm2Dga8cBPAUff0adXjd1bgK8D2PhUE1TOdbDS1ZUnT2Cu+EPKgZwAM8A
0OBM0jelh9Laz08kgScdLlwekN2Ew0XOX78E5wC+/ma/1KvjyLF6pADO3722+2Rt
dhPid/S7PL2H/smukwwOl6NdRnr9j9W5P50AX65gGBV3rwREc2E=
=/2O1
-----END PGP SIGNATURE-----

--IHkZ/X5RFqsXTNmC--
