Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B150D478BFC
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 14:09:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFq8D4mDgz3cBq
	for <lists+openbmc@lfdr.de>; Sat, 18 Dec 2021 00:09:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=iHQGw4iF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BOJ8BhzR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=iHQGw4iF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BOJ8BhzR; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFq7l1sgSz2xtC
 for <openbmc@lists.ozlabs.org>; Sat, 18 Dec 2021 00:09:22 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 731B55C016D;
 Fri, 17 Dec 2021 08:09:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 17 Dec 2021 08:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+f+SfVMxrQBxtCQxRVbXakdkbD/
 aiJwk7ldMtS3A1W4=; b=iHQGw4iFJzKXmZWj5HToA5tXeX4CTgGjNf/ko5z8utn
 2nMM6NItwD15ic/Qc6HnmkouWpiQkkdy1VD4F0NpEuqagXJc2YPL1h/F41yUoy2u
 0RvCLPKNedZvZ+NVnvZNEiaXKUb4Yyc3QUITby98g6gYsK/hkVG9ynv256XCDX/I
 DS563xaXUOFMCne8bhaVjZn3vtN4XI4o5agxwy1LosBeqYCYAN9/p8mBSy+kDe/l
 XKsr6VAre9/uHKTjbZn5yboKqs0YefChbiaxx75hJchC313WEh3g8WAl4rM7o9Do
 PDeco1xRFs4SVL+S9edd28CqpXvhWbRyIvcxlVhFUaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+f+SfV
 MxrQBxtCQxRVbXakdkbD/aiJwk7ldMtS3A1W4=; b=BOJ8BhzRDYu5N/+fPZA8XS
 oXzJGq50csAv8HvQQi9K3xfrEawUKMB9S5oIgqRHSk6Qg7mY8i64IhUweD2jlejw
 wpT7RTMVGoN9tx2vlemsRU5fYCxNVkytxqGePbItXab5mGOJISdFvbuFwhPQo95J
 jL19+KQGkbBRw6s6bk6mQ3iueXD69hLnP9jOzTtebPhHi15fa7/3Pska+akQXf9q
 HMPFQguuqeyKRKMmtpNVSkd3vat6bV7M+SNOqSxc14umLxkVsnGwqj8MicNLVP7J
 tLeLQEfuisJ5mXqb96Rsh4tyS0PwdNS30x2p62o5GsHvUKoSsQP1OWZyERQ8g1aw
 ==
X-ME-Sender: <xms:_Yu8YTFQHZAloYuXeu-61487EHsYBmHy0g5DMOqtwgKXOw-56bZi6A>
 <xme:_Yu8YQVHqWX4vGO_8cVJIuJrGZAA0Zg7zxEL6jnKHJmm10RSHEv7UfbwnYF8lRYIZ
 X3-lJZYXz0meUfMAZA>
X-ME-Received: <xmr:_Yu8YVIT3iTTUQZjAP7_8FdkY0nCoarx6UkXoPYW6FpZZ1IjIebf1WhYk48CdI2kIJ1TUdPhWYSUPnqk9rzMeZWqcuytzAId>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 egheehfeffgeekveehtdfhgfduhfegfefgtdehhfektdelffevkefgueffhedtieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
 hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:_Yu8YRFSZWipZeRW2GQr-ZDWxRPxfRkksUhnZZQxF0WGkLMo4Z9q3g>
 <xmx:_Yu8YZX7zhyAL-r_gNn5QluIsDk3S5oVtR-S68-cyPxiBmDNw3kFjA>
 <xmx:_Yu8YcOYa953orhEP18ruN5S16wNRpxheuDWWAzu2sNpmuHp_Nub6Q>
 <xmx:_ou8YWgGROnu2rQoKSpXIvvBG-oc6WNXBh15cjMWb7y1jrw2XO_S4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:09:17 -0500 (EST)
Date: Fri, 17 Dec 2021 07:09:16 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Landon <cld795@163.com>
Subject: Re: OpenBMC appear SQUASHFS error problem
Message-ID: <YbyL/AVWd0MCEJdb@heinlein>
References: <687802ca.772b.17d5ad02872.Coremail.cld795@163.com>
 <20211126215734.GH22508@home.paul.comp>
 <459566ca.670c.17d6b13a847.Coremail.cld795@163.com>
 <18a75e7d223e2c054e93e9a83a6c0ba474125518.camel@yadro.com>
 <6fc4e62.472c.17d7a6a0885.Coremail.cld795@163.com>
 <2f6c7248.c41.17d9291a38e.Coremail.cld795@163.com>
 <8e645b4.344b.17d93d37f8d.Coremail.cld795@163.com>
 <fabdbd3d04e3db2cef14346bc5b7e3fe71101c40.camel@yadro.com>
 <12f6e3dd.234a.17dbc1c17dd.Coremail.cld795@163.com>
 <473d9b80.264c.17dbc330d1d.Coremail.cld795@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c6T/2CS5qdHWI4Sn"
Content-Disposition: inline
In-Reply-To: <473d9b80.264c.17dbc330d1d.Coremail.cld795@163.com>
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
Cc: "fercerpav@gmail.com" <fercerpav@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "a.kartashev@yadro.com" <a.kartashev@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--c6T/2CS5qdHWI4Sn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 11:46:42AM +0800, Landon wrote:
> The error appear sometimes,  It doesn't always come up.
> Do you know what the problem is ?
>=20
> [   28.829750] proc: Bad value for 'hidepid'
> [   29.253033] SQUASHFS error: xz decompression failed, data probably cor=
rupt
> [   29.260761] SQUASHFS error: squashfs_read_data failed to read block 0x=
1b3f8cc

The data in the SquashFS volume is corrupted.  By "the error appears someti=
mes"
do you mean that:

1. Sometimes you build an image and it is garbage but other times you build=
 an
   image and it works fine?

2. Some machines can be flashed with an image and they work, but other mach=
ines
   can be flashed with an image and they fail?

3. The same machine can be flashed with an image and sometimes it works and
   sometimes it doesn't?

4. A machine can be flashed once and then some reboots work fine and some
   reboots do not?

#1 would likely be a problem with your flash layout where the squashfs is
getting corrupted by an earlier part of the image being too big.

#2-4 would likely be some hardware and/or SPI configuration issue.

I would likely try slowing down the SPI bus speeds and/or turning of QSPI if
you have that enabled to get something stable and then work from there.  If=
 this
is a new board it is possible you have some SI issues on the SPI line
(reflections, bad capacitance, incorrect level shifter IC for SPI speeds, e=
tc.).

--=20
Patrick Williams

--c6T/2CS5qdHWI4Sn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmG8i/wACgkQqwNHzC0A
wRkIKQ/8CMnl0Q9q1yVkXIJG4ha+z57yIWBHXAG+oP2VeMwKt8IhPpOjMiqBCA0Z
dsDkm4uMJbiV1UyZavuwGxIDLRZGasVHQ5tXotcsP4Bbr1M09G2GjDc1D2D+9m7G
TmImLt0SKI+0E6zmyXquvyVeRKXHmnz3W8JGNZLF2UKinACT2iZiuo1LVKxYsD9D
/Mxpd8Sc14wlCf/y06p8VCBPzNM/QSfq/DSiu5rZTTIzSNkTM/YsjECbbQL//c+j
Q3NkfcxRZLDkFj+lKtyUuE2ZPtmGFm9GYzsAa42QX5XoxobQUGMnLyIuBokRt+hy
0q7ADGdDGppF02lMZM962iNQnsVT0H9lzgYQMwgtr7wJT4HqFVqu+YFIJEHSBa2q
IiMijwICQDSaLx0hcQJgRg0xP03ZpdF9pPJMD3owVOMrMGUHpWRB/0O6AHYt1BNM
EjnbLSRBpd7Xzk3OMGOynkAcfRwiWoP/c63DYZZWiUMoa7lbLARlsXR+l+XEhnmP
x0YWHfb6HdGL+DKtwv6fmpKlKEBr78dS9ItAel3xIrP2DiZKp/gMJ5ok3NMxN7Jj
Wr49pAU+tWXBD95eFZwNxAm8eLqiCBbe9aFkaHQFaKw0xRyxduVuZVy4YEOywkKK
j4eif5U5eB0qj1YobwGLK+V1HgUs3Zkt1yV8PZuMmGjCvEeLI34=
=W/pM
-----END PGP SIGNATURE-----

--c6T/2CS5qdHWI4Sn--
