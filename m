Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5552916357E
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 22:52:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MZMD5HlHzDqRX
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 08:52:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=W49lcLZj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=grfT8Jt/; 
 dkim-atps=neutral
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MZLY6yhDzDqVp
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 08:51:33 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 232A3305;
 Tue, 18 Feb 2020 16:51:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 18 Feb 2020 16:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=lK+IHpVN2/TZavaxLvOlYwUyf1I
 HGiv1Hf4AaYJ5fEQ=; b=W49lcLZjmlJBf9X9DLai/z+QQFXm1oYwkibcmrnm0wg
 fuIy8nf+GGAaxECGPdrrnD+9ZTWlV5b9M3xKV5wzTagjeVTbToLDELB30Cyj+JUl
 Jm+eL/fC56lfk/3dmuzyN2xgdKJv3QTw/HsQ0zoo5NLxSXWSVMVqcnSpaWkbNiy4
 etWE/5aTuuUIUHpDru0g7gZrfT8UWPcbue40Kx9tteHmqHWo6pu9Yov49s+0Sx3q
 7ZW4sYA1jVw/VLYvIHm2wWPJRtmOBOiA2OXpP0y3CDNzcP55nRp1Vq6AcS3ZUlB4
 FiaivsdiSec7CshXv+5ygrWp6/pCpLzDAQGTaNY6dFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lK+IHp
 VN2/TZavaxLvOlYwUyf1IHGiv1Hf4AaYJ5fEQ=; b=grfT8Jt/z3ay5sa4/ETwLe
 8K/+0sPqAXv6TLQ2pKSo2PnRC4O6Av1vxZuSZS2zvKSN0tZ8zsAFZ6hsZNTQncbH
 ZkTRhMY9n4ssgCOae4cpmc8+t87pBGcPSaN5SLDJKyv14GjiKN46Sh6tMQRLOuZl
 orcmDPTUgB4tu7r1qtpJIOZshk7ckwX9aFkPIugUwFj5IAaoXN+EoA7tv735X5s8
 bXtPtaxYQpTZIP5PptCZAKBrBXxDTbLShhxwd6Ls3pfaKOdzIxtNkn8kY0l+IToa
 AQXNpxAHv4fHesWjoLYnbJCE4ZDzpgS1uhHiwOKy4pK/W+b97V3/KPj1ifnz9x/w
 ==
X-ME-Sender: <xms:YlxMXu1t0AlzAviFni7PSD-2XlMgMVYM7tdjquPJV5H_ALZYK70thQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeekgdduheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecukfhppeduieefrdduud
 egrddufedvrdefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhf
 rhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:YlxMXm7OVpJx7ccldM5CfmMb7700g5qwLL3oXPp-Ku9bVfMKd7jvvw>
 <xmx:YlxMXsPyVEXg6SOgRQggocZboV_8HfykADtbTzzkrWatwPOF98ntZQ>
 <xmx:YlxMXqLU5X9fGMJ1I3dcApggeAjokA494uwFXOODDGmGqYYLA-KhHA>
 <xmx:YlxMXhE9q-o3V7kbn41HMmdcdCiaiKol_VHn1k7Ue2UzR8e_uGQkCTGMaF4>
Received: from localhost (unknown [163.114.132.3])
 by mail.messagingengine.com (Postfix) with ESMTPA id E6B7F328005A;
 Tue, 18 Feb 2020 16:51:29 -0500 (EST)
Date: Tue, 18 Feb 2020 15:51:28 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
Message-ID: <20200218215128.GF2219@patrickw3-mbp.lan.stwcx.xyz>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Content-Disposition: inline
In-Reply-To: <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 04:01:00PM -0500, Brad Bishop wrote:
>=20
> >>> Please could you help with your thoughts on this ?.. What is the Indu=
stry norm on this ?
> >>=20
> >> FWIW on our (IBM) system designs we usually hook an RTC up to the BMC,=
 and any host software needing a RTC has to get it via some in-band softwar=
e interface.  I think I heard somewhere though that often in other systems =
designs the RTC is connected to the host processors and the BMC doesn=E2=80=
=99t have access to it.
> >=20
> > FB's OCP designs all have the RTC to the Host, so I'm not sure any of
> > this is applicable to us.
>=20
> Are there any down sides to designs like this?  I guess if NTP is not an =
option on the BMC, you are at the mercy of the host firmware if you want co=
rrect time.  If NTP is in use on the BMC does an RTC still do anything for =
you?

There are times that the BMC doesn't know what time it is and reverts
back to 1970.  At least until the network and NTP are up again.  I'm not=20
sure the history at why we arrived at this design, honestly.

--=20
Patrick Williams

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5MXGAACgkQqwNHzC0A
wRn45w/+MsxyKzJjG07X6TIZhvX8j4CKLEab1mnQtSVj3CN+Q3pctJBQDECz1vwK
PTsg3vDaiFPPBMn72IyIoVntXF63lGCpS6t8jDxRduGrEIbsnc3pJRehki7ZApiN
5jAgqivIm/8n7JRnfbecup5WEeW1J6RkzchSH+Tihn0bInyweLbHguQWR+YEdF+r
+cQfkLmoXF7dRPg/Sj+AnSjxaOouDG3GJ1YjRI1+6ZOTcO8eg5v5kuP6LaZuhU24
51AW0JFSH7QiCcbRqOIfwQD8cQL3sn1G8ZCLEEKow4/iteJx9iGahg17tDEHGbm3
Aok9gLMUTwvRj9ckPbxojHYrqoAXllFDkmJK8BoxrJwX3bO8Zwp28qk7JZY1cMhA
baFi4VS+/NNdCcEWtpPrRqBrwItVyBO3C81/lkfBEafZpddvmYthkrnjj6aQWvQM
M/OSZa3Ckl4OFZ/qD/qBdy/C9jGBT0NN5A8OhlKSNAbdCuPlhZqrNdzwRs1aZRmr
S/a1FQIRunOG2DHitgUFToeduOm5mvO4k7vhsIVEZy1rEIG6IG9HumRfGjJahRq9
0ouX5cLxCM966z5C0CIi+qR9s5Ky9Bnj8v8Owha6w2u7+Wrmn/NIUOnvbzpDjMi2
GQHJn9VI/qLdEv8ZOVKJdUOgGUnT6GPn1RJ6KUVTE+t2dpsTRNY=
=IJK5
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--
