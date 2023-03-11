Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B04066B57C6
	for <lists+openbmc@lfdr.de>; Sat, 11 Mar 2023 03:16:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYRPB4W5sz3cFr
	for <lists+openbmc@lfdr.de>; Sat, 11 Mar 2023 13:16:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=XUQjfccl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eCM+s3Cj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=XUQjfccl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eCM+s3Cj;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYRNR6ZGBz3c9r
	for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2023 13:15:49 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id A51B8320090B;
	Fri, 10 Mar 2023 21:15:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 10 Mar 2023 21:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1678500944; x=1678587344; bh=mW
	V86Pv3/qZpT6bBGNAWFmATMCD1S0xSwyTubE4Cth4=; b=XUQjfcclcwD3Wyo6O1
	DNWHzekAo8m7oHba+PWc+wLWl7tZEupc6AEMt6aGRzJYYyanReY0L5/6l9rLuLOC
	WbgmRZHckipwEWNjAh1xz8noM7FSYKx76j9JUf8UeUKZXmFIESXQEAq/n81QGs0Q
	uh90Cr9fB3VzrdxFxmxg+XOGysUtEHOdE+HjCGDp4LLvEBqeeg7W9lFZJRVToocz
	I3c4YwBTXhLxvANQnn9Vfgpy3Woeg3Sn7Jbh095Xf1xFbZXlxcbu0tJgb+Lw43ip
	Sd0ErvBJ3M94K8hVNqkLC60BtddRuDDjSn3jBVdJmnSlFLR8LrG7DEM6pUjVCPaW
	v77g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1678500944; x=1678587344; bh=mWV86Pv3/qZpT
	6bBGNAWFmATMCD1S0xSwyTubE4Cth4=; b=eCM+s3CjMApb+ej5pMccK9cPi6vzn
	n3+6VnsZhJpQaIWSZwhGyvI/vNBk/6ZeFLVtP4RntOJioeFBphGI8IbqUNyH51H4
	24tmLfzY96FRdls3ieo369HRyYw1Ulb7XabK86p9ChqRxmDkY9FvLLukjzXiO4fN
	njRytrNsjyuYGS6JCgEsnVBfzI7n56asN3E9WhmTf8F6HlYOdUJOsqK2oIkS372C
	erHI8XGRVYk3vt9I4wsRZf6M+BN9Va7LMVJaOsaVVI9Uw9FdPX9Hqqgvkt3fH+/1
	pUWbOvaOuqXVkv3egOanUfnxd1oDxIJOJzCKH7wn3gybG+k+TQwGAN42g==
X-ME-Sender: <xms:UOQLZKlXE2zim_euIsIk2FQ23-9hFZG_HeKnmuYHHQkgunVqvgXxtg>
    <xme:UOQLZB1FwAplWG-GBreNxlvPh5FIqtTFQc7L3_p7XIEYQvIO_Y2SiB11GHYS1r1Ai
    epGwHHxkaOQUU5jBUg>
X-ME-Received: <xmr:UOQLZIrTESadsmrygxczwDJqbahwoxGTqu7rEi-t_Lqi_JB0UTVl7Q-5AdlN4PzPamP1vXPJkkksdw-8PLruoTi4nt11meCT6co>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduledggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeejjeetleehleeijedutddufffhueeufefhfeelheevgedviefgffehudelheelhfen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:UOQLZOl5wC2P0v8uDO18-VQ1UQ6NGickpuRzzsz17zhztA_M_K7ftA>
    <xmx:UOQLZI0CixV-oV0l5YrOr0N6IsKodL5xnd8OOewEOBbZcPm5lg12dg>
    <xmx:UOQLZFtgXTFXclIrCmhPxKia6XWQ19bF-MN428L4mVndpjIN4CcJOg>
    <xmx:UOQLZN8X7mv8EWIOp_wjeE6LTYY1nD7ZndDFVUFyS7vIkI2PesjqqA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Mar 2023 21:15:43 -0500 (EST)
Date: Fri, 10 Mar 2023 20:15:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Alex Ba <hamid.amirrad2002@gmail.com>
Subject: Re: Openbmc not detecting sd card
Message-ID: <ZAvkTSy5a/y++uyO@heinlein.taila677.ts.net>
References: <CAJU63odeBJaumZ96rH_=5D=adqGCLJO-GiJTmmCZmcuGSTegnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ek3/1UJsZYWk2v/A"
Content-Disposition: inline
In-Reply-To: <CAJU63odeBJaumZ96rH_=5D=adqGCLJO-GiJTmmCZmcuGSTegnw@mail.gmail.com>
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


--ek3/1UJsZYWk2v/A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 02:59:11PM -0500, Alex Ba wrote:
> Hi,
>=20
> I compiled the latest code from the git for evb-ast2500 and loaded the
> image onto the board. The borad has an external micro sd that I am trying
> to access it for storage purposes.

I'm surprised to hear you say you're building the latest from git
because we haven't used 6.0.8 since November.

```
commit cba505a2e686ef67aa8ce0b2f73a200dfddcf85c
Author: Joel Stanley <joel@jms.id.au>
Date:   Mon Nov 28 13:44:39 2022 +1030

    linux-aspeed: Move to v6.0.10 stable release
```

> OpenBmc does not seem to detect it. Below is output of some of the comman=
ds
> that could help with the issue. Can someone please help me with this? Do I
> need to enable something when compiling or do I need to add a driver when
> compiling? Is there any step that i should follow to discover the sd card?
>=20

Someone has been asking similar questions on a github issue.  Maybe it
is you.  If not, please see the discussion at:
    https://github.com/openbmc/openbmc/issues/3906

> Thanks,
>=20
> *root@BMC:~# uname -a*
> Linux BMC 6.0.8-1b16243 #1 Thu Nov 17 03:10:16 UTC 2022 armv6l GNU/Linux
>=20
>=20
> *root@BMC:~# cat /etc/os-release*
> ID=3Dopenbmc-phosphor
> NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
> VERSION=3D"None"
> VERSION_ID=3Dnone
> VERSION_CODENAME=3D"${DISTRO_CODENAME}"
> PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distr=
o)
> None"
> BUILD_ID=3D"20221122151436"
> OPENBMC_TARGET_MACHINE=3D"evb-ast2500"
> EXTENDED_VERSION=3D"None"
>=20
> *root@BMC:~# df -T*
> Filesystem           Type       1K-blocks      Used Available Use% Mounted
> on
> dev                  devtmpfs      489096         0    489096   0% /dev
> tmpfs                tmpfs         506524     12400    494124   2% /run
> /dev/mtdblock4       squashfs       17664     17664         0 100%
> /run/initramfs/ro
> /dev/mtdblock5       jffs2           4096      1256      2840  31%
> /run/initramfs/rw
> cow                  overlay         4096      1256      2840  31% /
> tmpfs                tmpfs         506524         8    506516   0% /dev/s=
hm
> tmpfs                tmpfs         506528         0    506528   0% /tmp
> tmpfs                tmpfs         506524         8    506516   0%
> /var/volatile
>=20
> *root@BMC:~# fdisk -l*
> root@BMC:~#
>=20
> *root@BMC:~# blkid*
> /dev/mtdblock4: TYPE=3D"squashfs"

--=20
Patrick Williams

--ek3/1UJsZYWk2v/A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmQL5EwACgkQqwNHzC0A
wRnxyA/+PrOjcMo7OXH3vPDjiITCN55IXKZRtSPe33iRP8JMmZ9z/bkq6D4V8ApG
yWxw5N27hORT7GRql6Vy9Jvy1vNDxgcHfhValrsJjE0xq5hODMsazImYf+uI1TvF
5xLx8qWcGjfO0vxcCNXSnQc8WdQIN/Ca1CK26CnoRRn+O38si3kopSlQ52vwNwKR
1HyyxmGPa59hBTZ2aABBFkrbK4RGoRoHizizv8H+3oTDW1jxoM6DvtCvSJxE4teZ
duOvxmYF7XhD7c1XcF7LoJwucoS7HxK1mxLjlYdAOaJTobTp/VfcZad5L2Dk7Jt9
MTmzrzmPxJSt9dJZ5nGyMhU2WbWXao4NrWX+9xt50q0M6Y4p+tSTZ/HEvP5HbMkJ
AhJ1iInZCxPDnH1TXUl3b+bh6li1uG8WQhFCA2gSUKLdVWak6CRJttLp+JAeGuo6
Kdiirvkjrt964B+nJwaLw+BOOzuG5MObPktastEorsIAzYHd73b7U7WgccNnETka
xzh5j1pu93FwfGAaILcZsVdVyIB/+SYE5WWXyd/TV1i9mUm+fgZ7ykGJ2WmULZtq
TCk5RFN5ZcHYkR/Pt6bopuve/ESxqqrU0sMFqE9Yypn8oMHO0QL+l/DfYJQmtYZ4
pG311F/r4pA51VuN8rmwkAwnuYZLeP1d4OHUVbL2yras9ckIBfk=
=PKbE
-----END PGP SIGNATURE-----

--ek3/1UJsZYWk2v/A--
