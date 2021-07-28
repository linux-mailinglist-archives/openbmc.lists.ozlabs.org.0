Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C033D87D8
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 08:25:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZNvS6SF0z30GG
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 16:25:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=i8uKxObj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IZ6obNLt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=i8uKxObj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=IZ6obNLt; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZNv66zYHz300b
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jul 2021 16:25:22 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0BA855C013E;
 Wed, 28 Jul 2021 02:25:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 28 Jul 2021 02:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=+01I+XBSZfuwy9ZAGL988jRcxro
 /HLPgmFme4734QqI=; b=i8uKxObjEnj3XXV5q4HPclqmdTjvvILMq812rWV9oqk
 3h6eDIcLCTxzpcFfhCeugj0gl0ayKYi6xTtMpYLuY5LZXz4sndz4382dmxWqWW+G
 YFCcs6UA35ALIzdFn5gCjsrGwKj1MzDrSP38tM/JupIdy3UJg2syWLgrAQsSxjUs
 sr7d0ECGMc3lcGQwDvVI0w66zMI003kaM1bdutFABUEQWoXBvClIehbqMRDaPLJu
 G8rd5154U7UsyhEA/qnwSXr6yWYrrJ/T5dcvvVZFyR1LZplu5p3eK+g5q813gC6c
 9K+k5CWTW4Bphwu4aCUxyak6zsfSVf5e4LWuZMtV/eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+01I+X
 BSZfuwy9ZAGL988jRcxro/HLPgmFme4734QqI=; b=IZ6obNLtPEQFckWc0v8KlL
 SCq1dQQQ/PehTZ4zZmbNp2TeUa+Y0rKG6MXMlXCq+QBr2Fnw9KoFxAT3waUiz9aZ
 uZnyt3aokhrgcoOsFXzp3G0qAGSbx8ZCAUyrMRFxK073/Eqbw04LJUrwNndKg7v/
 l3QqvPz3v2FYT3d4ykSq4zN/mVsRJcKcNiNqGgZycXxdj/Vqs+ys3e7bPOWwby+i
 JYFKP78+baNyFO6ftNEZwlSAxpdx4hmrnNQ/x8nJuhWgv2z6Rr/4CWFTOSlKXigk
 MQL4IK1sp7PuOmLtH4adJvmbLdpRfT7Lj3QNMzsxvkiV5g26ecFN1MJ3c+4lY3hQ
 ==
X-ME-Sender: <xms:T_gAYTiJxxciFAbdus6EFN4r9ifNqqP2HVOAoZWXfQQp-BeJOQwLzg>
 <xme:T_gAYQDZ07wS6kvyMh437jinCqyKLtH8_KtWimRgQBmLc5s56wkFQjC_5z9YPV3i4
 ykqQZ71xrK8k0hCdfc>
X-ME-Received: <xmr:T_gAYTG9ib7kGtH51amBj269xO1XxFsIXkH_CrNRNt5L3JXuXHsXRWzK3i3REYhGMzkLTIIuijMFQqCbclhI7W4ptcZBg0HWeABDu3ZtPL7X2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeekgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:T_gAYQQArwyjc5Ps1mVKabApG4b2Ii84rFGOp6Z44Z0OuvQEenQ1QA>
 <xmx:T_gAYQxeeljo0qkpeZa9VOG0Px6UDSdnNPmwWYhJMxRx3d9sebhCpA>
 <xmx:T_gAYW5vjzi91V8o08gfoX-M_iScCd87sp8_q0JpuZis_zaBYZLkTw>
 <xmx:UPgAYWbvpAvSy982qcSARjEtsZ-tM41ovwR9tY1OTnUgZsYd9QFZuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 02:25:19 -0400 (EDT)
Date: Wed, 28 Jul 2021 01:25:17 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: `phosphor-logging` APIs (RFC)
Message-ID: <YQD4TWus75QQjH3U@heinlein>
References: <YQBrbuQFz4JihBAE@heinlein>
 <41a334dd-56c4-44d0-b8f4-7ecdf5bfa5de@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kTDBvpcOD7qrp4oi"
Content-Disposition: inline
In-Reply-To: <41a334dd-56c4-44d0-b8f4-7ecdf5bfa5de@www.fastmail.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kTDBvpcOD7qrp4oi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 03:22:43PM +0930, Andrew Jeffery wrote:
> On Wed, 28 Jul 2021, at 05:54, Patrick Williams wrote:
 >     - Source location data is invalid (issue openbmc/openbmc#2207).
>=20
> I think you wanted openbmc/openbmc#2297 there, but yes!

Indeed, that's the issue I meant to refer to.  Seems I mentioned it correct=
ly in
the commit.

> >     - Useful data is missing from `journalctl` resulting in people work=
ing
> >       around it by generating strings with `fmt` et.al.
>=20
> Sounds promising! Reading the proposal it seems like you're appending=20
> certain bits of structured data to the message. I think it would be=20
> nice if the data could be interpolated into arbitrary positions and not=
=20
> just appended (note, I'm not asking for interpolation of arbitrary=20
> variables here unlike what can be achieved with raw use of fmt, only=20
> those captured via the structured logging).

Can you give me a concrete example of what you mean by this?  I'm not
understanding.

> Andrew

--=20
Patrick Williams

--kTDBvpcOD7qrp4oi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEA+EsACgkQqwNHzC0A
wRkeXw/+PGLCPeVhMzp5ZYFEIAxxY/gM50RN575+BtnJsf9i0Uplv0ggwiuJm7Go
dPAQQltkFvSOsTsYGWcInJHemcn7ILLt+xDsmTOcZajWtkQOUG0FiGCFj4kshkST
Xlb26RysujZCtGCQ1yhHrsfPul09q1oFLiALhrmZD1nYXhlj5Ve0SfvSRLQuw3mx
nAl7DEjdbLtjAY/uXQ2QTXunuirNdTZs9MIZYeUH7mANAwiLbB/ZWKz+OF0gLayk
vrzLvYf+Vzxhq1vhq4x+ESYepWJ+UEdCSVjckt7II2G1SA1pMIhx6zunEXZl9sqP
AmOeFdHE7i8PFpYNjW6xvmtcaqEcDbDjpc6nvassl/GEuAq7u0Oaw4axgJCnhMes
KMD62De3U4u+PBTile2xpdXxf90NyR6bK5fcvHBCrH43trvaFSzOt+OxxJ7ybZyH
MpzdnOH6wZeP5jPrvOVUI1qGxlq3zgoS6sRVHcQxxW2GkU/H0CeAKf+wIDsfQft+
jIwvU9NETvWTAjBV4oTG47dE0qcf24raoRrUVzD1SDP+H5Q2h4A3sCypSx3CjcmZ
qI20TNcUnms2sBCoMrlIzU6tRXjT9wwpxRrEp3GFOGpEZdtep9eoJLUGpv90ALGC
sikiGQfO3bokHgSdkCpt94jLpzPYARtR8td5BxZ/72S9QrsclvQ=
=awPf
-----END PGP SIGNATURE-----

--kTDBvpcOD7qrp4oi--
