Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49D3E8607
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 00:23:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GknY257Sxz30M6
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 08:23:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=q/GOZvvT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=J5YrKgJ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=q/GOZvvT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=J5YrKgJ0; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GknXX0vmHz2yRK
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 08:23:22 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 488585C00E7
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 18:23:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 10 Aug 2021 18:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=f+JyImExpPRWrO0yZy4oMp7AgBi
 RvH7dCe6jeC51Y2Y=; b=q/GOZvvTAmS+B56rbpXn0TMeKsN1nwASpw/h87h6ViU
 OOsucJ7nBWBpoASBC6rfD3ZPxNw1Qi7dXezNed6F/dnWTF12uyrRa6TltHz79Pfh
 c6GJLq7WaE4VM/FpSDCBIjl4wh8IX/dDUklMhgYfdceozYqTXBNcpm6DLT8PPBMA
 +YZQNAP6FLgfRx5ezhjdtH0FLT/NyZzZNL7XmqVnLqhl6VrGqrQKaLbF8cctp//n
 oNRQQc81Oek4P2N/nRbpn9b9YaHY4mPc/F1sXCDeqe0BQSJb4er50xKihgDGGXDq
 sr84mG/QDbXC5t/Kul5YwaSFTlNT4JEFnzLSrsyDwdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=f+JyIm
 ExpPRWrO0yZy4oMp7AgBiRvH7dCe6jeC51Y2Y=; b=J5YrKgJ0QzGqdk97+QvXRW
 X/MNPndXfWJSP+hxUV4vkjDCUNonI/Pnj8YKwJYEr1y8WppmNs9vTOPOSf6V+FcM
 YBZhIBGzgG39PYUYcfyiC21TeXjudNiqIxjQz1qtgV3+jBicgCJnYvPpmx66UfJb
 LuzWSZKT/ONzuO+24KBuRXgPcMGiRso7fJPs0KYy/BunojGNF/uHdeL1c+TTlfAb
 572v89UzO2q1oM+VNdCCbjliz8+lPyAAaDXgwDOu/hYBofqg/dXDuXtpYThW5UEw
 14KrLi1jz8LpbUYIRrikwHBQojb27gkgvaP8tst7AkRmd2IZfKxbgwHVWpkNJvcA
 ==
X-ME-Sender: <xms:VfwSYbUX_AJKCQtc87cOLdcBrfGS80-YqXkMayyUwXJBckRpJvuKUw>
 <xme:VfwSYTnSdNsvWjinWPj3pcsd4ltYNSzVV4i0oSsQKcFGe8k4v_akIWH1QdHjC5euH
 VB3t71hw4Hpbk9e3as>
X-ME-Received: <xmr:VfwSYXYQiZcWEFjp-fsAoGeWvr0NW3COHiJtbCH_fvnEOU7JgVpqawkgvLWE8mYpBUq8xBbvZxBhPhMzeMX6HK0R0lBL1pw2Oc7F3tq7NGGxkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkedtgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeujeeh
 hfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:VfwSYWVy0W8nHpHTydOpNqi7sffIK6Lg1yzuWSKFgVh8l84BayPMaQ>
 <xmx:VfwSYVk3VBDYL151nFXfXdkatSGbXymNkuAl444IDKLbBL758fQVhA>
 <xmx:VfwSYTcjiFL0hbio3EidN-Pv9GtIm6IC5nednv5ufJaTUtBkU-2Ugg>
 <xmx:VvwSYTSzoRFTz11pbKvPm1pLfAtrYprQGZuTuJMDPRJpeSmrno9oPA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 18:23:17 -0400 (EDT)
Date: Tue, 10 Aug 2021 17:23:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Yocto override syntax change.
Message-ID: <YRL8U4+7i23utzRl@heinlein>
References: <YQ1FD5q8KbhbXVBK@heinlein>
 <YQ8tJueJyk+fXr39@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1g7uLraVukopFwik"
Content-Disposition: inline
In-Reply-To: <YQ8tJueJyk+fXr39@heinlein>
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


--1g7uLraVukopFwik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have the meta-layer fixes for aspeed, evb, phosphor, and facebook
merged now and I think a few other companies have either merged their fixes=
 or
are close.

There are a few open commits in this seqeuence, but it should serve as a go=
od
base for further testing.  You may cherry-pick your commit onto this one for
local testing, but please don't push updates to it to Gerrit.

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45767

It looks like we need some minor fixes to meta-openpower/meta-ibm in order =
to
get the bulk of the CI systems passing.  We also need someone to do
meta-nuvoton, which I don't think has been started, for a few others.

Feel free to add me to review on your meta changes (and add that
'override-syntax' topic) and I'll give them a quick review.

--=20
Patrick Williams

--1g7uLraVukopFwik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmES/FEACgkQqwNHzC0A
wRnNbw/+LZ7nzUBNGfjTMbleFlBPwlZo+m2ZLKKtu2kDATYj7LcosQ08kSm+3fik
K4QMYcd7rfS96/JK3XXCOv26uLxY7OSxRl05GggrPmHrZfd3pR2WCl5mid/djl8e
F6QkhyiqOywRCJMeePvV6DMnjGVoi3BDzw49ja+A8jsPq5HgjvJAI4zqBBEUxwB1
sMcKm8tufZEmqT0WuIKsSZcb0xQwQ21R70CQ8m4gmou0n1h8qkeeM/4QQwVIs6WV
UeF9PlD8QqAwI3yDU1UQoBKXyuSg8WF3d25U04ClpeI7nCTpKp1dUPUs9faGFb51
+o0GE7UgtryD1qlQ79jJDxq66bKc+U92d15R6tq13O8Hg0wjQ2j4FZiQvHKsxaUj
1HpWE+WsB4yG5u/efNp9iq7Cqq6FrrmcNkIsWYX1/MXUAxc7T6dH5NF/69QckQRV
2wPlVexFAh0nXqIJ94QrbTgaQO9veMdAm671+dzLXIy3p9zHDb+sIxN8ogin3Vp1
ZQFpt2rRKc+eKmo+ZDhfgFI/UoKIGY/vU6VG2PA6yOaBq0h7ZRjVFW3bdE98vleX
rJzcUFzyz0z2OSaXj7SN3mSBLUjPa7Bb7J1O/TDHLcFvgquuytgrwYKa7reiGM6C
5Y48ZOb8bbj3g906S9FGC4nCSmcsmh6OsBcxWdbcUIJRvqpbgQo=
=rdKT
-----END PGP SIGNATURE-----

--1g7uLraVukopFwik--
