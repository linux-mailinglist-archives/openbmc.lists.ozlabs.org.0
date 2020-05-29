Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F71E8641
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 20:07:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YXbw2K2CzDqgq
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 04:07:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=grJpGFuy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KJGJVITc; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YXb559jhzDqgq
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 04:07:13 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D99C5C0093;
 Fri, 29 May 2020 14:07:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 29 May 2020 14:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jZuKwPr/UdSm1A4qw0gRB7TIq/t
 0DGL2CU+Gp2Fhhlg=; b=grJpGFuyKMDfm2tnkKwY/7m2oOrWRBC/Sg6cPw21B0C
 FKVxchq8U+OUx1SIcX7kPEqMoNYRdHBrDLZRszTkVPynrbUCKhj4zxWV+FRTi/Zo
 TO4LcyQznMiNA6RkakbGMVyjw3tVk/gAsG9HOw86N+bwvdLVdOQvMmeDPRGXWwtk
 jnPLksW1+oqYgid+RtL8egEbeptF/mSchjQHaHFdfsbnMMRHsVE3K2k6T9TkwlQH
 wMINMhw9JWwJ+pa54mRaj4gutGCktZhm1VFQ5Sta2SjSZF5FWu5Dtw64/hK8sBM3
 CaBIyFX5H++ms0iJ0F7OoZzyXJ1uIxlw/CPnnZH44hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jZuKwP
 r/UdSm1A4qw0gRB7TIq/t0DGL2CU+Gp2Fhhlg=; b=KJGJVITcpL9ubRZZtWgUqr
 D7QaCnZ/MWh2KZhSD2ME/3lrr2SCGUJgR6zCjpVW74eQ5hoN9fYWMYWUZg1Uu0D+
 R48aUsbZLYnKtob7gGtgQ9LRwf3gMErqT19ZLDkyD2szcVZ91lSAnxiZVVPK8Szg
 aE1lznqWBgSTLH2puAOgmYlwyiTIdf/HjR0XWDNkHyJY5oDC9vnukTZdHhpzqGIc
 m2lTKJ+qtMsIJxKRx/eB2oaVGSw9nx3HhBJx7hq0EW55YLJUTXtCUQe52d1xTonL
 axK7yzldAqbBR9tUoGs7rzqQEbf6hoNBeuraOI5DJKPSxdKGybD/DVtnkLxg+wKA
 ==
X-ME-Sender: <xms:Tk_RXpY-ZsIQ3CMEY7smlce56ZPxtIIx0gb5u_Nm7zOCuy7jXpFC6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvkedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepuddtjedrledvrdeivddrudejjeenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Tk_RXgaGAbA3q2LWb9L89-cwg3z3yetfTTIKf-J16YadRLQY1LR8YA>
 <xmx:Tk_RXr_M9wfJZekPydKREZwWv23ngi3ouA9u6_l4isoiO5O3sSIKBQ>
 <xmx:Tk_RXnozba0EmqHQFMMJ-tN7Cr_A1OlT3g9oUtzqyXfkz3TF9WvrOw>
 <xmx:T0_RXld12G88GJvvb1Eq_83yzV21hXiqqrnPs8g47BTOqqgHRyHVKw>
Received: from localhost (mobile-107-92-62-177.mycingular.net [107.92.62.177])
 by mail.messagingengine.com (Postfix) with ESMTPA id 827883280063;
 Fri, 29 May 2020 14:07:10 -0400 (EDT)
Date: Fri, 29 May 2020 13:07:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: Sd_bus_call - ELOOP Issue
Message-ID: <20200529180709.GH17541@heinlein>
References: <CAA7TbcvAOF-ThzEyZMkMr4T4XwBxXmCoO0MOL-WmywpFQuKpQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="svZFHVx8/dhPCe52"
Content-Disposition: inline
In-Reply-To: <CAA7TbcvAOF-ThzEyZMkMr4T4XwBxXmCoO0MOL-WmywpFQuKpQQ@mail.gmail.com>
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
Cc: anoo@us.ibm.com, vernon.mauery@linux.intel.com, openbmc@lists.ozlabs.org,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--svZFHVx8/dhPCe52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 09:29:48PM +0530, Kumar Thangavel wrote:

>        6. As per our understanding, current  sd_bus_call not supported for
> connection with the same bus/clients. (sender  and receiver are same
>            application name ). Please confirm.
>=20
>             Log :
>             yosemitev2 ipmid[370]: sd_bus_call function called..
>             yosemitev2 ipmid[370]: sd_bus_call function ELOOP .
>             yosemitev2 ipmid[370]:  unique name =3D :1.71
>             yosemitev2 ipmid[370]:  incoming sender =3D :1.71
>             yosemitev2 ipmid[370]: executeCallback called. catch block
>             yosemitev2 ipmid[370]: EXCEPTION=3Dsd_bus_call:
> System.Error.ELOOP: Too many levels of symbolic links

Yes, it appears that systemd has some code to specifically return ELOOP
in this case:

https://github.com/systemd/systemd/blob/master/src/libsystemd/sd-bus/sd-bus=
=2Ec#L2236

>=20
>        So,  Could you please confirm sd_bus_call does not support the same
> bus/clients with in the same process.
>=20
>        Also, Please let us know if any alternate method to  call the
> execute dbus method with the same bus/connection.

My suggestion would be to see if one of the functions in ipmid-new.cpp,
such as executeIpmiCommand, can be exposed to providers for these kind
of recursive callbacks.

Maintainers of phosphor-host-ipmid have opinions here?
--=20
Patrick Williams

--svZFHVx8/dhPCe52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7RT0sACgkQqwNHzC0A
wRm5cQ/+J2kEBbJX+0PUMbrDLCyoFwyv1YC/xRqDpubY21WdwkZiLb7QhVxnHpA7
jaX/kiPys6iop97KbmGplwMLgSuYHU0TOxyCnhod56PqZsx2+gUNTDFbjzYF4A/G
0SMA+lY6x+L0jRKUvsgOb538lqtsKFPKRwI9x22ckzAVq2Y+dtogk+hzwFqvz4S6
PrpVEVjlrmFEt/F6onysKsRPCMBdGfrWyUjYkYWKE5GvuMDSbf2u1l0VRNINeuwB
pwb+hBx3f+BqiSZb4P+hL2vuLwMr6CgcHFqV9ld2BXCkTZSP92UNCtRCmCIj0r+f
A3CDo/VFk1DYvu+GWAs7ws5IUW6u5iAPdLotlr+P+ortFJoNDxHmm7nFHpsbrPpa
pfzsD9Cwev86CWp0Rn/zlpZatJj9XKC37LxynX2vPXQIoGO8npz7EqgSOphiPahQ
NTBngm8YbTvw9o3z37p7OFmi3zpDcOAzG/+KM4foVpsO0m7o0nJ51EYca+MCiuZd
aqURUdMRgfvvc7NAKfrLGIgyOdgu7vWtl+bFeaBc1DnkERiRItOub3LwGfGH+erG
lTMuekyy7bRVqXo13OVqkxQ2OXc2kdDEL12BNPl03woRi9jbriHWZHQDLD2kzsKp
PvrrOQHC/d6+SsIPWaNT0iXASDY5lZ/78+dkuVpz47rqY+wAC5c=
=+tzk
-----END PGP SIGNATURE-----

--svZFHVx8/dhPCe52--
