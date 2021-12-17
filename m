Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DEE478C12
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 14:15:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFqGl09Qnz3cRH
	for <lists+openbmc@lfdr.de>; Sat, 18 Dec 2021 00:15:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=d83FwioP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DcMPFUHr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=d83FwioP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DcMPFUHr; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFqGL1hxzz3cJm
 for <openbmc@lists.ozlabs.org>; Sat, 18 Dec 2021 00:15:06 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3160E5C01E9;
 Fri, 17 Dec 2021 08:15:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 17 Dec 2021 08:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=/kgFWLHVLt91O60Ne7OyMDm5rtb
 qno/Cj4+itO/tEas=; b=d83FwioPSHDvbWhXZiJ+zy4H1iBEpc7WIF+M+wYzyTH
 Hj8XtwoVsdP5BDBZWqkAbCa29a5CBYQuuIgAceCXXPAWCVVhy0UtH+dYzKEbbelM
 9+nNrgagWWG4OT/cGqVY26/yFHKEpOj0q/iN7VIIQNRr9k95TMAEel+HTX8bkIyg
 tHD8z5xw2mol5FawvXzXTCM9cz2soXPRsvHPuIG+nUQH8hetWS8Z4NG9rhdTj5PV
 jYUDi2MKYZJoBGFB3AW8fv+ZLPTxXjTgYdBvfq3v3P9s18/GKlfjoTwRq7IbtFgv
 zL1TqwFCBJqFHeQDWIobYiN1KSnaCFuYFJFyY/N0DGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/kgFWL
 HVLt91O60Ne7OyMDm5rtbqno/Cj4+itO/tEas=; b=DcMPFUHr79y4qYfhXIFWim
 R+FN2GfUoaPfwAgjxf25sLmuRkWUaqN5N9JKfbBla2bMlOAzTvxVhE/7FvPL04SB
 vc7bBl2Y8amur4MYKtUrO4xeDEclsG5BlDPCjlt7nV/1CRuaH37rV+ufR0doisS/
 Y7GCw5RpNmc6BsiwjOVU6T4upuVK0eAkU81DywUIqRpGUntZisjd3yexmsA7st/Q
 KgNsvU3ZLVUNzmtA8am1tccYSYD7o0XiYmgvDvGggXKjApOt6D1KcbiyJAe7tlTF
 /oEcRJpUtdtfSkxNFJvFN1CwW2NUl/Y1zmDmmOVzicsGIpue5l2RgmMGsjDyuyww
 ==
X-ME-Sender: <xms:Vo28YTd3ZsqM9vhLyP57uUquwybdosQt1ufQoOZoBEGz2iK-lL-gGQ>
 <xme:Vo28YZNIZh028XCHn4LVTZlYQve6wiQBBNC_YB86RwZXBHcZTViOmPSggUPmLPfSU
 uPpHsA7gzHJo5ELzyA>
X-ME-Received: <xmr:Vo28YchQpcI4zzkTP58_duZzkkyxo2tFvu3Q5sOrykZb6d6x2JUnd2sCQ9OphBQPLU6cTJmZK6LkWv3lBXz_Z0tMPQzZ2Pav>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeujeeh
 hfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Vo28YU-BOpRZVygM11ng6UF2Z8S1z3XA8B8e3OiFuiSj3c80yLoxkw>
 <xmx:Vo28YfvMLaBIuit---nR3ED3rrcPTmfZZG1STX5khXBwVvOZARmzTg>
 <xmx:Vo28YTFl9HtkRorYaMCVd5lizNV-7xbo06lVkF1mCpAlDXcB_bp6ag>
 <xmx:WI28YTgYTIGGMiyjxlZyQ2gKS9NU4jwh0VjBzwUS_UuY4QcDjSI6Nw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:15:02 -0500 (EST)
Date: Fri, 17 Dec 2021 07:15:01 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: FRU Device type one byte or Two byte Validation
Message-ID: <YbyNVR/1YYGWypKc@heinlein>
References: <CAA7Tbcuhk3tY-XBw2C6xtV9MEsp-Ba2GW8PZpVqj2YQNcrHb6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LfF6evh941Cy3aji"
Content-Disposition: inline
In-Reply-To: <CAA7Tbcuhk3tY-XBw2C6xtV9MEsp-Ba2GW8PZpVqj2YQNcrHb6Q@mail.gmail.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, vernon.mauery@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Amithash Prasad <amithash@fb.com>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--LfF6evh941Cy3aji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 02:48:30PM +0530, Kumar Thangavel wrote:
>        We would like to validate our NIC FRU device type as 8 bit (one
> byte) or 16 bit(two byte).

For anyone interested, there appears to be a proposed design on this issue =
at:
    https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49477

--=20
Patrick Williams

--LfF6evh941Cy3aji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmG8jVUACgkQqwNHzC0A
wRk+vxAAqBx1ue13o23wR8JUjiMZaUxqrZp6pCkhcJFze7lnveQ83/qi+sLUYYRc
tUoHhucomISQh6kYXcX0r1I3bhG4+cvw5KttbgNDogMn9ddgJXO4Yt6WW7v+bKE6
HhKhDkXQ9JNAJDc8pLmk2ozHhsGPCSaTp7Ljme8mUZtsv0lD7CGD9L45LCI2IC4X
8F5vqNVCJC5Fb5Qd2QLLHEy4aMfSHSkz5DIaXiNkfi0GPrqE/+XN6dFD2GGutHmq
pWUP7tPHBTE0DrS1b9U2cL4/fKSQGzjr2qW9Jug9zIGy/zRzNuIi2+ta+50mijoS
TDVBxGB/AXz5hC/61iaKCwjdMOUlyIjr0Qv4ZvQ2gwLJPbdVEsoDhNu3Bg6uqV0+
T7c/tMGZ4oHFYIO7Yf5ZxnE9/JBQZYsfe+wzYig8UUXIVdWyLKkSEB/p6UwZ+k1p
FiXUpG6fQ3r0cvPUFfCzAZC/kYNJFzQLuTEANN86FREiFF//2yHa4srD+QAsi30z
H5hgwI7EOHYAJJvLzwCwnaWDYctYnvW4jzYDZzxWYrziXW0oVaZ38SwW3hPnK59b
0B5LLcsNVocK8P4WzSDILzFu5MJepdXE71Mg0cszxW8SKLyPV8Zjw/2vVto2sUiq
Dz+Yj5c+x1YQFAbZ/ni37T7rhQsVGXljo5kheMuQEvkIH/7SB+8=
=84Wd
-----END PGP SIGNATURE-----

--LfF6evh941Cy3aji--
