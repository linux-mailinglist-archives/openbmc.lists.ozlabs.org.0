Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E22B37D44C
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 22:40:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgRWM19Xhz2xv7
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 06:40:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=e53I/Y+/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AvQn/t0+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=e53I/Y+/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=AvQn/t0+; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgRVz1Lkfz2xZN
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 06:40:10 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 699385C0129;
 Wed, 12 May 2021 16:40:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 12 May 2021 16:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=0zJYn9tiDnHvWH3erlfk+M99kDw
 UXRRJKkhG0iLv6SI=; b=e53I/Y+/wcdxep2VmCR/iS/t2/3rpeZDH/4xuTsUHP5
 aJNBa61epYge1rfx9JFZ6dDEppgQG+52j4rn74O0eV7QzlGFuicsw7Ixtg7h5nmF
 sqpp4G5+toTSL3QruhopFUOLJu2hY5+ZQuWbqm4CMWflmwpiyryfq2ZNPYpX49U2
 IhomvpgL4k0feA89/oh0fi7YjZTi7aIehXfPcFO8dtY/E6bVKs+l+8TUc+sz/lKN
 iaroxBsh7uMLhEogULgNSxIUGWGwHyqUFDI2wVqLz9UaKVEOLKZrTopSa92st0cM
 ZiE7t4aVVE72tXwnxMEXCGokRcs97O1sQ0ijNiwx5vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0zJYn9
 tiDnHvWH3erlfk+M99kDwUXRRJKkhG0iLv6SI=; b=AvQn/t0+yHwQEiUrL7NEIp
 0JF5MPKlTIoi49np/dTvKHXjE99GEy4QaSO2nP8mtqBJ7lGiIANbhRXq4kGJTI/U
 Z9CJXv5pH924nGtg+bG/+WiZ8wM502XUrfDoy3FiwxcPcR0yI8by4Rew+v7mznnU
 hbxjkolpHWAxmwEiiWca6rjwAMfZkojmjwuNOupML8o6t2Xd8GgE9x1JNzidSqcR
 JxciVoEiapzo+UDP6W2aEaHLuw61EmM2KfSaeW9jnwQY0rDDL1C0UeYbahf0SS57
 Alg4FKmYKngOUKUz5Re/8cBDF/A7CX771fWzjhd8r8ywrwQ+DQZVV+x60uoD+JUg
 ==
X-ME-Sender: <xms:JT2cYO4s1tE-o--jePEPlczkfLfg2TQvtUwQtYW35KWJrvZ-4ydWVQ>
 <xme:JT2cYH4R7dsRtSYsj0WIb-ceZPGsDMWJMBuq2UCG_NdNwjUtjZt9yqFynHoeWhM7g
 EZqHDk6p-KmvnB6ZK0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddgudeglecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekjeevffffvdejleeuudegvdei
 hffhuefgfedtfefggeetfeeuteeiveefieegffenucffohhmrghinhepmhgrnhejrdhorh
 hgpdhrvgguhhgrthdrtghomhenucfkphepudeiiedrudejvddruddvuddrjedtnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkh
 esshhtfigtgidrgiihii
X-ME-Proxy: <xmx:JT2cYNf-L_2sePx6haeXVqgGfp0kJFq3qWQ7nZGN2dWTXSZfKzuO8g>
 <xmx:JT2cYLIXfJE-IFeHNfHj26ktKT3FHUZZXu4GwYXH9uDOtgUUOZtodg>
 <xmx:JT2cYCLHe99Z7wePe3-8mAYvEDn6UQyEduea46bjg5LehI_TMAeM7A>
 <xmx:Jj2cYBm2ZtAvoeF_gho-Ma89VVn0mxY5Iq65eYkFfpmXbOdIr52VZQ>
Received: from localhost (mobile-166-172-121-70.mycingular.net
 [166.172.121.70]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 12 May 2021 16:40:05 -0400 (EDT)
Date: Wed, 12 May 2021 15:40:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group - Wednesday May 12 - results
Message-ID: <YJw9I+q6RYpr1UO6@heinlein>
References: <35156c27-e195-c238-1bb9-d20a30db3c63@linux.ibm.com>
 <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OkFuGQuDxPxuCzKG"
Content-Disposition: inline
In-Reply-To: <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
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


--OkFuGQuDxPxuCzKG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 01:18:48PM -0500, Joseph Reynolds wrote:
> On 5/11/21 8:59 PM, Joseph Reynolds wrote:

[ Copying some stuff from the Google Doc. ]

> Security impacts:

> - Can be used to defeat secureboot.
> - Can this function be disabled?=C2=A0 Via kernel config.=C2=A0 Default?
> - Can restrict which images kexec can load?
> - Recommend?=C2=A0 Validate the kernel signature before kexec=E2=80=99ing=
 it.=C2=A0 But that doesn't stop an attacker who uses wget to get a malicio=
us image which they pass to kexec.
> - Why would an attacker want to use kexec?=C2=A0 Opportunity to modify BM=
C code, load device drivers, create trojan horse(?) or back doors.
> - How can we force kexec to perform the same signature validation as uboo=
t?=C2=A0 (each part and the whole: kernel, device tree, file system, =E2=80=
=A6)

Some of this is a concern only because the arm32 support for kexec is
far behind the other architectures.  Can someone investigate what, if
anything, is going on upstream to get arm caught up?

On most other architectures there is a new set of system calls, enabled
by KEXEC_FILE, which moves some of the handling done by the kexec
executable into the kernel and has signature verification done there.
arm32 is one of the few architectures that do not currently support this
KConfig.

See:
- https://man7.org/linux/man-pages/man8/kexec.8.html (kexec-syscall-auto).
- http://people.redhat.com/vgoyal/papers-presentations/linux-plumbers-2013/=
vivek-linux-plumbers-conference-2013-presentation-kexec-secureboot.pdf

--=20
Patrick Williams

--OkFuGQuDxPxuCzKG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCcPSIACgkQqwNHzC0A
wRnFNRAAlFpbEQRO6m5IwhbygQAIcJv2NESwhxjsuosr4OGBxiPTJ1Uon/iEfhu8
gurtaqcO4q/cSZtaQ/K6Mb6E166Enlz4XxH0/jOmEwbiizy/sZ9NoE2LeHCake7Z
vJ31aS5mMLg1BkaHgk7PC7guehfYcWIEaLarsum/8zSJOzD5gpvQbssQkac5q8og
fSQSWTjK+MuYhgVbYDIutppjxNMVwj3hDF2W+NV/ZOkE0GIlFbsLhmD0F4oQY78A
jPMq+u93IxIVpnJgvvEvuPfH7iEhbOkrYLsBFgGtrjS5n2I+OnsJI0QWRtJEy8pV
mTnanXQwIh5dPs8XfA+xOKVwSzNbfid2m4rvX2IsnbkDyrtd69AgajLd4kzU2/v2
RDIIdFsHXVC9j3bq7mvsoMOeAS8Mk1LgddazWh2cxN4M7w9GUas/qkC1e2H+iwC/
4k1D4Iy/2s2EGZGptOnWnePsVQYZtUKM4+ZWUG+R/YDvLc1fleFdWXrISin9vo/g
1bagKcEo8LykuMcUTl19c9Uo1lcn1Z9FELam3JPpowwHtr6dsh2KPMWDeWwzTx2H
gkSFo1OohYjg2dLulcXDo9dmhU99I3z5rkkYZ/yVHl2hPefeHyvQ7FqOZ2/aKvki
8VNfPAVIYqPV/yN2tFQ/arnuDMHurY5rjzOQKfnkb9zdaF192fc=
=Gjyt
-----END PGP SIGNATURE-----

--OkFuGQuDxPxuCzKG--
