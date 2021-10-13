Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E242B302
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 04:59:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTcgw06Y9z2yQy
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 13:59:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=puqwZLH8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=V8nshAbY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=puqwZLH8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=V8nshAbY; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTcgS4DGrz2yK4
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 13:59:00 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C4065C0112
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 22:58:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 12 Oct 2021 22:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=x1W+k6ZJf8iOGefGHDROE0xFpyV
 Rh4AP60QLJB4J+CY=; b=puqwZLH8BKYyPj+kHGpSKCc8UyDd+uy1JNus9HpyVRi
 zeFyfcWMpw8UTrcmZ8l+hkMCElWMi6u7uZ4CqsHnhjSZb/qMBJQwdctJzyNL6EP9
 1FfgXaJEfhpX0Yh05RbBcZMAVsxlygcR7B20GPIE4GBip9I19AvCI7P7DPLoTyWU
 2atHC2c0RmAjl8A27AkeciqSUff72VSy+89GE3Z7pAGo1NWVLXN6hIUqQgXngm8g
 LbtouDKOdW88w6zJxOF8DTwJRJ2X8nDyulrbkRahYa+UVIMt53XWMStsd1dTYIsH
 sk3XSygicRbncxR1EWJ4PuHI9H52CiEj41siKFLVzRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=x1W+k6
 ZJf8iOGefGHDROE0xFpyVRh4AP60QLJB4J+CY=; b=V8nshAbYlnTzaPH3jQbHMW
 pgpk17bXPuBxvI3Tj/bneqtuTTxGF6EgqryILSNUs4q1uFva+A/M4LEbbQP45AoE
 Ch4RStubCsdbjGK+aannvL1xhjyBXs6q32SlYoew/RJ6U82WaWK1QOiUBhHArjEz
 UrS40QCLgJArB5IeP9Nll+QzOKFnycFxsTkpIiUEkSqKoBtvZD/sNEdURC6SCl9D
 THV5StcCwZzh0wc2eNGYEMe2A4tUGIlQFmR9idYx7yvxfflXfIlXXK/5Edxwa2el
 JeS4Rry/hbGoe/ma9QMU++wrytzUInuGAKQm/F1tVV9IqMDVpSibHBKurjZittrQ
 ==
X-ME-Sender: <xms:cUtmYQF0X4OiSYx6ZR0rUzACdZAHNf6c44dqMWaIFWKZS5TfbJmjIg>
 <xme:cUtmYZVmv8gQhS8-7wq_hSTdshXojytBsFX3PIeUfSTaiXaY7QuKpG6Ij5dRdcD7Z
 HaI2_lxCDyWXeS5lr8>
X-ME-Received: <xmr:cUtmYaLjZC7i-MaOD1GS4BfYWEjkiKphrly2s9qA-2U4wiDccLGodHpjJ_if8avZXY3kcrz_-BDzLzy_oKuu15vim2qZfjFG4XyFnYnGTxhBfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtledgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepuddufeelueehhfelheejjefgueej
 hefhtdeludefheekudduveekieduudfggeeknecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:cUtmYSHks_-1V_7Vwc5krRPRGe8pJhUCl55AgFc1-m1ENMrC0SLVwg>
 <xmx:cUtmYWWMPacHMshBFN68R_zV6JNcwk8eUZBMMuyV4NBLQakyatt9vg>
 <xmx:cUtmYVMhWgVrRiR4x4zxnzTosA-t9P71WdJ6dt2qlGQuXECb9e5WCw>
 <xmx:cUtmYRD3r49fun_NEP12miIzFaIMv4kVDqrCDWvEQBpZPdo2ohQbwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 22:58:56 -0400 (EDT)
Date: Tue, 12 Oct 2021 21:58:55 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Yocto override syntax change.
Message-ID: <YWZLby0dAuvSpOp/@heinlein>
References: <YQ1FD5q8KbhbXVBK@heinlein>
 <YRUW7cazmCjW8VpP@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/DQHHiVONHdPHbvP"
Content-Disposition: inline
In-Reply-To: <YRUW7cazmCjW8VpP@heinlein>
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


--/DQHHiVONHdPHbvP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

As previously communicated, the following list of machines are unbuildable =
and
have been for 2 months now.  The deadline for someone to fix them has elaps=
ed
and so I've now staged commits that will delete the following machines:

    - centriq2400-req
    - evb-zx3-pm3
    - hr630
    - hr855xg2
    - lanyang
    - neptune
    - olympus
    - stardragon4800-rep2
    - thor
    - x11spi

I will keep these commits open until October 18th and unless there is oppos=
ition
to any of these commits will merge them after that.  The commits can be fou=
nd
with the 'unbuildable-machine' hashtag in Gerrit:

https://gerrit.openbmc-project.xyz/q/hashtag:%2522unbuildable-machine%2522+=
status:open

Any machine not on the above list appears to have already been cleaned up.

On Thu, Aug 12, 2021 at 07:41:17AM -0500, Patrick Williams wrote:
> On Fri, Aug 06, 2021 at 09:19:59AM -0500, Patrick Williams wrote:
>=20
> > TL;DR: There is a required change to all meta-layers by Wednesday Augus=
t 11,
> > 2021 at 1PM UTC.  Any meta-layer not changed by that time may no longer=
 compile.
>=20
> This change is now merged into our branch.  All of our machines listed in=
 CI
> are able to build successfully.  Many other machines have not yet been up=
dated.
>=20
> The following machines have had little to no effort since this email went=
 out
> and do not even launch bitbake correctly anymore:
>=20
>     - centriq2400-rep
>     - dl360poc
>     - e3c246d4i
>     - ethanolx
>     - evb-zx3-pm3
>     - f0b
>     - fp5280g2
>     - g220a
>     - hr630
>     - hr855xg2
>     - kudo
>     - lanyang
>     - mtjade
>     - neptune
>     - nicole
>     - olympus
>     - olympus-nuvoton
>     - on6263m5
>     - quanta-q71l
>     - s2600wf
>     - stardragon4800-rep2
>     - thor
>     - x11spi
>=20
> Any machine not updated by October 15, 2021, I will assume is unused and
> unsupported and will create commits for removal.
>=20
> --=20
> Patrick Williams

--=20
Patrick Williams

--/DQHHiVONHdPHbvP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFmS20ACgkQqwNHzC0A
wRmPwQ/9G1/SZlafAKeWm0PhHTf68xIFtfimfGIaQjElvdEoHjNOc9/5m985byBC
j2u/qwXMgfkgn7N0sulJN3UCaE1GxZ+Gj3TTOVkeOonBZ9nAk4lR2oxGlQGUdzxV
uxDPO4rxZCEzQxMyF4wziKbNiLW7o9nPzl6weOqMx7bHjlJ+AaIEm2liw67bXzzS
jEZY5OT+busM7BKUgkgWLjDo0WOG8cqBEs8casWAGCt7NhaJdQidfRJTNXsrKXaj
Tpkoekoc8fWuFgsEQn1O/UJ0apyzs9c88nT8l/4nkINGmZswutstcl1xPoSFstFz
wKxgkQqaPqdfI66AnHqwtyRhBFhK966mzHCvgrCqRKw8MoLLuxFaoa/Un9S/CGwX
Jfh8pTxT98eZ5bdI/5rvPwxoFCLStVsFHWTW0xe4IaFN9pTURMpDnIGhf1WU9hia
6G+1700zAgpdyOsyjpswhAhzREK8uBgT6CPrgP49V+GTDXcbUJ3+2ekbH/r8YEZj
FvoDsTfoOFAT39eYygglH3a5r1wvLYHJZtO7ZIEvYHm9L8q7Q1EvylH9FG3izx50
hE1a1jeTThsIII+Em62EV+/g9FAJhGwoK0BcQDSx7rXfpMfksey/vyG552oJ20dp
sU2deamCR88CVyWsY5yvpdCcI04ck8G7tZmn9hSHxbIKz2wi5jU=
=udzT
-----END PGP SIGNATURE-----

--/DQHHiVONHdPHbvP--
