Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CD635FC65
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 22:12:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLDCl0z77z3bVH
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 06:12:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=rzjsPF1h;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rw5s7/vP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=rzjsPF1h; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rw5s7/vP; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLDCR5bsHz2xfT
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 06:12:02 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C2FC5C00A2
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 16:11:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 14 Apr 2021 16:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm1; bh=TtlOtqls8wP2N3kakYgVIWrRF/JQN/7khZAh4R+Lppo=; b=rzjsPF1h
 vspQSSachf9Mn1DdQ9n1CaZFCW0Viuf2kct0dzheziLmqCJ5kQRBOiGIOL+wIM2u
 s0Vj4/T6ZrmD7cD1OXHojfVzhMyRSrtBix/a4YOp6b7NZ1tCUiqW+65WuyH6nmnW
 2JTbivXvnQgqad+W4r7gTqVQfvIfBcV3u/URqYLJSATx+2kANoli3uYCFqphyTrV
 CByMD3WR0OQ+M2illj1uBiVWJ0Elr7Su33Jd1GwGXnhED0U+ZIjBeBuFJ9wxLmaa
 D7iSQ3X8mUApD9hFqGC66KdITRTw93lXedwL2rqMy3higPGz9BcnC/BPivntqWFm
 4r/nwIgAFGNuxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=TtlOtqls8wP2N3kakYgVIWrRF/JQN
 /7khZAh4R+Lppo=; b=rw5s7/vPVIzky/yWN+KF4AUoZEWj4bAq5QOZHThUue1Zm
 Sr9hjrkewsmG4qstiyECJYaKxjIEx5rSUWlh9UXX++qfMkkThi7olS1TPj6SC8wE
 aal99laVfW2fBlewi7E+T9/2X6FLwzjOqI/i3HTr/wuT1ctRp7rjes4FStCl/V5u
 S5pAws4+fCfcs3B2iEpKntbDkQj/Uel+bheCa1I53o5SHNp3LbqpQF806AV7AYjF
 r1lihyTqywVmltJbB86j1nuqkroUtKZeCpKRZy8j9ry54xKvz2dID51EFQo8LYSJ
 mRFdYhWmU5adLOUArfHDFB2cDdgbzPR3Gr7vMyDsg==
X-ME-Sender: <xms:jkx3YA-jD5HvMpeY3-dQgaoie4U4F2ukYFPs_bdEauZRhk6Pi_0Y6Q>
 <xme:jkx3YEvlswQ5b3CGWV9mvC0EyiGztaSXkbm5K36BNJ67Rxjsfpgi2KWhVl8GXsGJw
 WYiOpssKNiBILIJMDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeluddgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfggtggusehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpefhhefhuedvleevvefhgeegheetffet
 uddtvdehfefhleefudetgfeuieejueffleenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiidpghhithhhuhgsrdgtohhmpdgtphhprhgvfhgvrhgvnhgtvgdr
 tghomhenucfkphepuddtjedrledvrdehkedrhedvnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:jkx3YINTgY6k1-EXAak1E8kv41alC4l4NAN_swBQUFhwuxcCYoyPHw>
 <xmx:jkx3YBghkKfMgP-yTo3pXOs_q7TQe6sLCCLuKcZZoj3Ztblgg0-DPg>
 <xmx:jkx3YC58V6_a3jugVmpsLjIkg4iFr3U5NEFQfVFWqOLzpBTCkM08KA>
 <xmx:jkx3YJdT8xbW9KJhtR-RH0hOgBiiD3PM8HrxTgl13NTHmDjxeoLs8Q>
Received: from localhost (mobile-107-92-58-52.mycingular.net [107.92.58.52])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF8F51080063
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 16:11:57 -0400 (EDT)
Date: Wed, 14 Apr 2021 15:11:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Time for C++20.
Message-ID: <YHdMjAsKKA+BKW8X@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Guy4OtvMycTF0Fb+"
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


--Guy4OtvMycTF0Fb+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

Per [1], as a project we've generally committed to using the latest C++
standard.  C++20 was released in early Sept. 2020 and already had pretty
decent compiler support at the time it was released.  We're currently
using GCC10 and according to [2] it has support for nearly every C++20
feature I could see us regularly wanting to use(*).  It seems like it
is a reasonable time for us to move on to it.

* - Except I recall seeing some mention of std::source_location being
    useful to fix some of the issues with phosphor-logging, but that
    won't be available until GCC11.

In general the C++ standard is backwards compatible.  This shouldn't
have any impact if you are writing C++17-only code.  What it allows us
to do is to start using features out of C++20 like the spaceship
operator and ranges.

I've put up some commits to start this process.  So far the only hiccup
I've ran into is that you need Meson 0.57.0 or higher in order for it to
recognize the 'cpp_std=3Dc++20' option.  I am adding code to our unit-test
framework to ensure you have this specified in your `meson.build` if you
are requesting C++20.

    - https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/=
42252
        * Adds some checking to ensure you've specified a meson_version
          in your meson.build that can handle C++20.

    - https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/42255
        * Update C++ style doc from C++17 to C++20.

    - https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/42256
        * Update sdbusplus to use C++20.

Please let me know if you have any concerns with this upgrade; I'll be
surprised if this not a fairly low-contention move.

1. https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md=
#code-should-be-written-with-modern-practices
2. https://en.cppreference.com/w/cpp/20
--=20
Patrick Williams

--Guy4OtvMycTF0Fb+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmB3TIoACgkQqwNHzC0A
wRkHZQ/9GZKRE1pPNiykyAligoPKXmZB/0N4Ou4bMHwPQEcFp4zBgFRxtPCCKx6i
I/TWhHqolYVg789f5QfYXm6Acn6w8SaOqUmmTfk16BfQ1BFYrF5YH1Q+gpvjfti9
BrdOaCaIdA3piI1FOJ/LJiMS2zWMP4xlAQXG+9LYHrxCgUzs7JoBZrVOP5+Dc6Wz
rkB2IgAPAjTG2I8rpCWqCqbt1uXM341IGtXn//xombjipdI01X37OBDU3zcAF2CU
olP5OqJA+wZ76Vtj3dTK0iuFbaJo9S1an8s11Sg0xLPgI62orWl0HBBBDzHqvwG3
Tps0J1r+/RU0QhJlXDN8tFf7CDgXWFdcEfMsY3rnyLSA9ZqtzWCLij+h/s8kTULQ
JYAedGrdTQSi7mwszYztav1O4FiqYk/NyM/qlNi2V9dnTBN5zGpu7rO0O7v1+9WB
4YdN9qGTUsVmhX4XsrGqLPHymcdrAMnApZ2tXK/hQ9bdJgEdyo3AYuSl3ySrTiLR
fafRtnlmT6tkW3Xsv+XESy7ppO2VYIa6sjkQc66r91puz9PpR+aTvJuS2gHxaAi6
tsx70hTBFRSZUPSSDXqhJjo6SQMSdg5Zfd2DOxa/ANpDXNUMpjpnlsX6j7dkAhN/
6mm9Edm8mLWvWYaeiBIfDHzEJLNOC8NB2LsDqYfuGhyHqqd25yQ=
=TS+U
-----END PGP SIGNATURE-----

--Guy4OtvMycTF0Fb+--
