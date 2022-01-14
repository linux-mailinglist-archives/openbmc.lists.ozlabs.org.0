Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F29F48F004
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 19:41:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb9BC2Kldz30LS
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 05:41:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=xCXrmdGi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Jj5RqRor;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=xCXrmdGi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Jj5RqRor; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb99j2HMrz307j
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 05:41:12 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CD395C00CD;
 Fri, 14 Jan 2022 13:41:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 14 Jan 2022 13:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=gBQDNg9rOvUBGMQsVqIo7rQNgOE
 chDoomnp64Bs8Tn8=; b=xCXrmdGiJrG0+lVG6zPklCi2/yDB1xvhN/3XLsh6YLx
 +T+rhBwTB57GqnZT6ha6XwzjZOtf97mIDrwGgsleV0SC2kuvQlehoRcokgM5LKqB
 plJKv5ydtVQloBfVXNUCTVl9Wd9bcUZqrQj6e79Xyi6SwYs9ph4GWxBnx4Tgezqe
 DTHseTbyzV6cVy2vsyrI056skBO6LPaBfVqYDKGYxDGFHDQaNWk+J44MFc9e0tq0
 bh0j6qu7KnDUYU+qIQFoLn7t5nHmLWyTDTguj/ADOKmhCuHqy9LntXgaGqMtG7qD
 gx/QoIxYdHRS3B9tpiOB7gba3Oj1i07LdmLiEvXYH2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gBQDNg
 9rOvUBGMQsVqIo7rQNgOEchDoomnp64Bs8Tn8=; b=Jj5RqRorYRyee7I4Po4uuK
 hBrhvclSNUByqhIhcxRGqFWaqF2xQXiqsaBgv8xW/3mCRExfyqYZwg6LedirlSHL
 Q9nrhcmXfjMSVZV3ZbFjUhw9lLxBZ4ZkU9p3RSReQz3VBsFzqG/0Pd/w4hUh77oc
 0QBv9LkFtySSh1fc3OyHPbEQwrj3/FgCGMzYIP9N17gb5IaEKV3yUvmQb7cBJNCM
 mlYh0PQYnVQbS70xRVZ+haTVDZ2+1ML1FHJhukwR28lLFMjgE1qqqpJUbOhYICpB
 zq7XXgH4BqBwKAJJ/92I+egqf1qnt7Y4pQh1PMjUHZDkIk19d+BSqGXfB8M2KeEQ
 ==
X-ME-Sender: <xms:wsPhYQ6e-oGN_kfql9HqyM3_VxjvUG60b5Rrc2XIEN829eNdCCcYww>
 <xme:wsPhYR78k6LSlhP15nuXpWSuSFWC3Lcdc0iTdPVBKH0fWD-wRj62DSPiU3mkAp6lW
 LsASKXOpgUGdq79xNM>
X-ME-Received: <xmr:wsPhYfekjZT8jCeDwDrfqcfpdOU7kwMC_IaoQs5Y4edw7aqrBieTiHyfAXHOwbSn7xoxSpyNuikW0xF4g4HGZT6Lxw4jDump>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:wsPhYVKTHA3ljak5c3700eeUhpQPPsQ426JV35UV_1SLBdBHymhzKQ>
 <xmx:wsPhYUIqYmkyCdeDP_MZehfk1jpAXi4OVdunalCTkjesSmdt8LFFSA>
 <xmx:wsPhYWzmgcI4NMJ7PLmuG67ddvK8ZLLJ7nfxpyoOHW5U5QASwgmdaQ>
 <xmx:w8PhYezJt4jWrGBjXTws-c5BO-gAnrtgtnNAXvJDouit_CMrSqsq-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 13:41:06 -0500 (EST)
Date: Fri, 14 Jan 2022 12:41:05 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: Sanitycheck problem
Message-ID: <YeHDwS7/D9JY4XXw@heinlein>
References: <BEA6AAA9-904A-40D7-B114-A9229B38F0DE@gmail.com>
 <YeCqx/CTU7pRDVyj@heinlein>
 <47171FDF-05E4-4501-A499-137A09D2FCCB@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e1GwPkg7l2Oycou2"
Content-Disposition: inline
In-Reply-To: <47171FDF-05E4-4501-A499-137A09D2FCCB@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--e1GwPkg7l2Oycou2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 05:24:00PM -0700, Mike Jones wrote:
> This is the error:
>=20
> root@ubuntu:~/share/design/code/openbmc/build/ast2600-default/tmp/work/ar=
mv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e891=
9-r0/git# <mailto:root@ubuntu:~/share/design/code/openbmc/build/ast2600-def=
ault/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitA=
UTOINC+26601e8919-r0/git#> meson build
> The Meson build system
> Version: 0.58.1
> Source dir: /home/openbmc/share/design/code/openbmc/build/ast2600-default=
/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOI=
NC+26601e8919-r0/git
> Build dir: /home/openbmc/share/design/code/openbmc/build/ast2600-default/=
tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOIN=
C+26601e8919-r0/git/build
> Build type: native build
> Project name: dbus-sensors
> Project version: 0.1
> =20
> meson.build:1:0: ERROR: Could not invoke sanity test executable: [Errno 8=
] Exec format error: '/home/openbmc/share/design/code/openbmc/build/ast2600=
-default/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+=
gitAUTOINC+26601e8919-r0/git/build/meson-private/sanitycheckcpp.exe'.
> =20
> A full log can be found at /home/openbmc/share/design/code/openbmc/build/=
ast2600-default/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-senso=
rs/0.1+gitAUTOINC+26601e8919-rroot@ubuntu:~root@ubrootroot@ubuntu:~/share/d=
esign/code/openbmc/build/ast2600-default/tmp/work/armv7ahf-vfpv4d16-openbmc=
-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e8919-r0/git#
>=20
> The path to sanitycheckcpp.exe is there, but fails, as if it must run on =
a different architecture.

I'm not sure what is going on and I don't really use devtool very often.  T=
he
"Build type: native build" is where things are going wrong though.  You've =
tried
to get bitbake to set you up a cross-compile environment (targeting ARM) and
yet meson thinks you're building a native (targeting x86 likely).  Usually
bitbake has some special environment settings or a cross-env file for Meson=
, so
however you're invoking meson might be missing that.

Is it actually necessary to call meson anyhow?  Hasn't the 'configure' step
already ran when devtool sets up the environment?  `meson build` says "set =
up
a new meson directory named build".  Did you intend something like
`ninja -C build`?

--=20
Patrick Williams

--e1GwPkg7l2Oycou2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHhw78ACgkQqwNHzC0A
wRkbQg/8Dvl+0C2qyPtapy3gdn3MtNxqC2RR9Ca9s2lM+l22siMIlAcC4rNrGQ81
itIa2TZKjb8/+bvTfV2lF7cJVL98eWwUYrEExEZ+ccfcDXFNFxPxKlR0dWMZ/QnY
ktQiAQj1R3Nuuau3XMYZvQLJeLx44HMP44/Q1MBNDBck4kvi8+KFUHfBoRsfY+kq
sECUSnapcMBusPb42KnqalbO0ya4gzRVJluquaNW8qsrSHRZa1j5HXbvGMWwuAHK
GcyyDOS3IDWCF7W+co2TUAk2dOlYZ/jei9AOuEmmXrsW1poRgKo/eGCFT8YKmIJM
IwEqmYAqeC+PkblxhyDQMJHNxhHO28J1iVZAId3uQTngjbPE0ObmGQIjcEpLRGY1
2HrWoQPy0Tc2Ne9ac1eMzMLUaC4otBrF4/ORVNznKMBR/s69iONUY2RZUPlcwvI2
KVUO2J+ZzoHe49AZCd4Z3pPRzdnjIa/eZhphTqOBk+frAtmjN5OO/8WID2VraIdj
HOlWlhdVIx12lQj8sJvt2UvYz3Ti2x0HLod5tvu1zGaNZf5kHWWDs4mtVGxjmCgu
zFYZ1AlnNpDbDxSFq4Kz0delIcGdgjYM+5NJ3H2keGVjwIfwMZsuaj3G8cfxisA+
5uwE3tZZ3CHRrAyhkJDLy9op+yzeMIECK8PMJ+L1wk2X5Fc5K+g=
=RPir
-----END PGP SIGNATURE-----

--e1GwPkg7l2Oycou2--
