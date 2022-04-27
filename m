Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C9E51220B
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 21:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpSpW4zCrz3bcK
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 05:04:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=eBrF1FQu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=iPsZveus;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=eBrF1FQu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=iPsZveus; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpSp673Q9z2xCB
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 05:03:42 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id F16615C0215;
 Wed, 27 Apr 2022 15:03:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 27 Apr 2022 15:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1651086220; x=1651172620; bh=YFQam2zdjL
 XqJ0350WMrkiBOnNLbpvEzEUaobEUt/ng=; b=eBrF1FQuF11JHgJEHesdSOwkLV
 qc/QAFcix11D0KdMOfg9Nc5kGw6lu8YykvWzDkN1VmijEVmT9lvaKb5ePo/jiifz
 q/QghK3XHohr0YjU0USnj66fNCpJTBkRtHmnP4zofzBK+AfgE09cf3EzrhfLT1e7
 gaqh/NzlkDQkPZ9lau/XyYv4aCoRcHYgYjh1W+wpEHLllzVWWpr2O2joama0HZeF
 rRvc+yfJwcXuN2QeT383tZ34C3FAHM2Xj6XB8z+t1sl+rG+De3VULclQno2oVC/I
 //4Wi5IRrdFsFBeu5Sr4QFTKWpxFcetjZ9JlCQeNsDc2aICvtDMUVop0klAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651086220; x=
 1651172620; bh=YFQam2zdjLXqJ0350WMrkiBOnNLbpvEzEUaobEUt/ng=; b=i
 PsZveusmF5TYVKQquw21X+NA/f666DFgajDt1sxCOyK/mPQql9kQeP7ell69ANJ2
 qrQgL2iklhlBcEdxJYiT0chmluUsuQPcYn4oElzL5dgFMWoJESBQCiLNmBP2BuCk
 +q9sEM1hZn/OsV9/671AEOXTbY//qSJ6aqNy7eNipdPk7aakORM8LdGeHemPzw4X
 KUuhIVGreEN5aYCzWsZnLNJDTDOjFdUT+Zvjcen7QR6AgXmgIMFi9JW4mLAy2NsW
 IYDW3oYQ7aSn43h4kkBdkQyrmQH++77Ps4IS4z4DdD0g8Lsuhd7njPLA1lNQ1Bzm
 5tR12asEVaBv2DUYpYS8g==
X-ME-Sender: <xms:jJNpYpH7hpSQdECuuJ17LqobiQQOzKMkef2n1_FKfWrXVIqWtaNJIQ>
 <xme:jJNpYuV-H3OsGHBT8KI85by3kJyhPGzrZ0WEwAnV7sqiYAlwihlhm9C_vu5hiiPZA
 6VcviWQ9WfUflEuWpg>
X-ME-Received: <xmr:jJNpYrId59gUFl2lDsVbyEG9hTfP10TMi3XU0hV-SIvRQk1beLTa9vSIVAu3hjj3kwwspPAUl4mkyDtbEi48FL_x7WgzXBD6mCE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtjeejgfdugefhtedvudfghfej
 feejfefhffeffeelgeduveejleelffefvdffleenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:jJNpYvH8EABm3WjSBgbt3bklT09cqD1uLcFO9Nu0LOn3vCIvqnz49w>
 <xmx:jJNpYvX867ISyeiNXM8PE3K-4cAzvDvpHW3i_yqkuw8Am5sUauqtnw>
 <xmx:jJNpYqNugVzpqHMF8zH2kudGdf8gq1GmjqTNTQ2SeUJ-c-F33Yz4kQ>
 <xmx:jJNpYgd_Q4I-NKgTeTJuZBJ57QY9wsuVa0Y2pxbtlR0P7Ql39A2PVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 15:03:40 -0400 (EDT)
Date: Wed, 27 Apr 2022 14:03:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday April 27 - results
Message-ID: <YmmTi6Lkrw3HvTkV@heinlein.stwcx.org.github.beta.tailscale.net>
References: <0b3f41c1-476b-bd94-3351-69faf93b2e82@linux.ibm.com>
 <8f2429cb-bf11-44c8-cbef-9425dfa93481@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="txphU3D7ngsKLQOF"
Content-Disposition: inline
In-Reply-To: <8f2429cb-bf11-44c8-cbef-9425dfa93481@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--txphU3D7ngsKLQOF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 01:07:49PM -0500, Joseph Reynolds wrote:
> On 4/27/22 7:31 AM, Joseph Reynolds wrote:

> 3 Nirav Shah - Alternate idea: Use D-Bus session buses (vs the system bus=
).
>=20
> Note that all OpenBMC applications use the D-Bus system bus, which only=
=20
> the root user is allowed to access.
>=20
> Nirav presented an idea to change some applications to use a session bus=
=20
> (and away from the system bus).=A0 Doing so allows BMC applications to ru=
n=20
> as non-root and makes it easier for different applications to=20
> communicate via D-bus APIs.
>=20
> We believe this work is relatively independent of SELinux policy=20
> configuration.

In my opinion, architectural changes like this fall pretty far outside
of "Security" and need pretty wide consensus.  It's fine if you want to
use the Security Workgroup to refine the idea but I want to be clear
that acceptance by the Security Workgroup isn't sufficient to move
forward.

--=20
Patrick Williams

--txphU3D7ngsKLQOF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJpk4sACgkQqwNHzC0A
wRnGRg/+MGugUXaxCS31543QMYFm0wsgpSikuP0pB7a4WPr5ugiJrdUnmlErKeQu
BrwrfEibArXRXUVorXsY9I0CY4uNWTEz01k0VXZCdF1on7kVlNl8eNZMAk/50KXu
vrmXI4QV4KNBobO6/5yR9wuj2zGjk1dwfMl6jGaHEDGYwiPwUJR3rVJ2YGB0/SXH
/cJT/AQOj5+RVofL3C6HCZzrVjwpZCN/52z+dCMOkQtyVjXon9EP+Jd6u38a7VPr
ax+4376EfQU15DqaNGMcWgFHJouzUKsOvl+X3pRjd65pN6B8WHI6Qn/QjBo4Q1mZ
FZtU8VWlacSzAl3YoEbtk4Yg/bR7q2+JcKtU2aAd4Gwqow5JLdQV4bGVxR4f8zIk
0b4iM4IUupxpL5lfauuayrx01efuBg04ogTgOJG8r/i8VMaF/3iZzkd86xGMcW3X
x5p+KTEU90esnqTqjLoV7dJvuIkMczVYCFicrtF2EOydG5U/LbKE1sMtyuq/6I1L
mJ+fakLYEIHgX/0PZh8uPNB8pinMB99++0dymlhqo/qm+eSGr8PqZ7q7Bs8OPDLu
sVHi76UY93QdVfiWguojJUFtOCmxLmo/eMuf6e0pY5XkG4g5O7P2r+Zaw8ZFNnOT
8BBE3yUn68jZgwrBqdo6Yl3WQerV2hm+IJVytokip2tInfeJ0K8=
=XVOZ
-----END PGP SIGNATURE-----

--txphU3D7ngsKLQOF--
