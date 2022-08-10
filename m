Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D1F58F251
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 20:27:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2z2B3HSMz3bd5
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 04:27:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=gkJkWimD;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eMd8N/87;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=gkJkWimD;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eMd8N/87;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2z1h67QFz2xX6
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 04:27:19 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id BB1E05C01E8;
	Wed, 10 Aug 2022 14:27:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 10 Aug 2022 14:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660156035; x=1660242435; bh=dCgYMz9FJb
	OYVGm/5mkAaIqL0kKm3DMBjWbAzLHKHNQ=; b=gkJkWimD6IXtXgyf6O6QodtxAs
	VS+ODwsjCG2xCpAye4N56IxgvvF7MCDPjTmo0eRpgY0fvUnBjEqeoEimbHxqHnD2
	hkppqODV1+c/xjLKI4IwIZhhHrpVUGqrQIeyHGoAI6Tv3bWHNShG9n21iHiEakVI
	wWZqrLC/PnlQIMeJyDs+uDoZkLmWhd4vKbLC0JtTHGOrc4MgyG5BD9s7rloYKKBR
	URmwVnZZuBhUWM6z7GoK4NZ4CQRgKPvE76mVCOk1e6nOt2q8dQYzxbmqT2F32Qno
	Hb+Ci+4duAAw3retPMOpS690xwhzwyyCBClcXIMwayb6iiSiEKNMgLRkeJng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660156035; x=1660242435; bh=dCgYMz9FJbOYVGm/5mkAaIqL0kKm
	3DMBjWbAzLHKHNQ=; b=eMd8N/871mVvdZ9l6S5Mz/CQ91CYRjz4AmRpNrOhuHlS
	d0YkKtWArCM02o/Hs4wsPWxVoRkW4sxfdZQOsFNTqYZt4og1nyFkp/b/JgHDERgZ
	5pRB5AECfqPYY6NifCz+i3whrSLQqUFvYNLeitC36tHo6OX65BX6xTSPCLdc7Zrt
	MwKroF6OcU5yZblLtvxI42DRIpd8nnLkjOMT3Pc7/t8Db12Wsa5p3mtUtrLmyI7u
	V7Vz24k+1nhhaDDBd6z1CLUWpmKV3v/kO4xbI5mcFvogX/zp1Oqx4skqY63jc6gz
	xvipqGijga1ODduwz7nKuEvMKhXP+ftBUeBlA5PJzg==
X-ME-Sender: <xms:gvjzYqXyfYzcZ-VkLFoeuymK9M2W3t0XqDR_58zQEwotcyOE3rbRDw>
    <xme:gvjzYmmqsgfnejEom3IkCaVexd9V9tNuWP_9FpLMEfiPJ4VXIB98aGqWz1pqwM4kb
    Jn9hKB44Ru1zD3d9Sw>
X-ME-Received: <xmr:gvjzYuY8WerXsEDXJmBvz5-jVZTwtBbZAdhflO5JpGLsMTh6h859_yZkhD6QZ7SzCbpE0RchYSZIq3oAhvDKMDLJ43QECRjH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepteetiefgfeegtefftdetueel
    tdduveegleegkedvkeegudekudefhffhtedtuddtnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:g_jzYhX-oNHVEaGytNlHKO8chNc46yatOn5QsGfl3vwviHTN38fhCg>
    <xmx:g_jzYknRcpNJpzsf3EGvpjCCZB11J2j0r-ciZlAYQ2H0bZVRIXGjxA>
    <xmx:g_jzYmdOHa50H8OFBe5nratu13nNrf49fy1aOh4mhPi5P44-7d2P6g>
    <xmx:g_jzYrvQ3nHNKHFk9kTeSC6QFXnn-MGWxo0R7zDYlmConrrbMOFM_g>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 14:27:14 -0400 (EDT)
Date: Wed, 10 Aug 2022 13:27:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Roy Zhang <roy.zhang@hj-micro.com>
Subject: Re: OpenBMC compile failed =?utf-8?Q?issue?=
 =?utf-8?B?77yIdXJnZW5jee+8iQ==?=
Message-ID: <YvP4f0jXDrwV+Ht7@heinlein.stwcx.org.github.beta.tailscale.net>
References: <ADAAFwAXFL5UmdT63XVClKq8.1.1660035570459.Hmail.roy.zhang@hj-micro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y/6CBLICKyI0LZig"
Content-Disposition: inline
In-Reply-To: <ADAAFwAXFL5UmdT63XVClKq8.1.1660035570459.Hmail.roy.zhang@hj-micro.com>
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


--y/6CBLICKyI0LZig
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2022 at 04:59:30PM +0800, Roy Zhang wrote:
> Hello=EF=BC=8C
>=20
>=20
> when i compile the  openbmc image for "evb-ast2600", it compiled failed a=
s below error :

> Detail compile log as below:
> bmc@docker:/home/openbmc/build/evb-ast2600$ cat /home/openbmc/build/evb-a=
st2600/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/glib-2.0/1_2.72.3-r=
0/build/meson-logs/meson-log.txt
=2E..
> ../glib-2.72.3/meson.build:1:0: ERROR: Executables created by c compiler =
arm-openbmc-linux-gnueabi-gcc -march=3Darmv7-a -mfpu=3Dvfpv4-d16 -mfloat-ab=
i=3Dhard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wform=
at-security -Werror=3Dformat-security --sysroot=3D/home/openbmc/build/evb-a=
st2600/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/glib-2.0/1_2.72.3-r=
0/recipe-sysroot are not runnable.

> | NOTE: Executing meson -Dgtk_doc=3Dfalse -Ddtrace=3Dfalse -Dfam=3Dfalse =
-Dsystemtap=3Dfalse -Db_lto=3Dtrue -Dlibmount=3Denabled -Dman=3Dfalse -Dsel=
inux=3Ddisabled -Dinstalled_tests=3Dfalse --cross-file=3D/home/openbmc/meta=
/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux --cross-file=3D/=
home/openbmc/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc=
 --cross-file=3D/home/openbmc/meta/recipes-core/glib-2.0/glib-2.0/meson.cro=
ss.d/common...
> | qemu-arm: Unable to reserve 0xffff0000 bytes of virtual address space a=
t 0x1000 (Success) for use as guest address space (check your virtual memor=
y ulimit setting, min_mmap_addr or reserve less using -R option)

We certainly regularly build systemd in CI.  I think there'd be a pretty
big uproar if master were completely broken, so I highly suspect this is
something with your environment.

It looks like you're building inside Docker on an x86_64 machine, but
somehow qemu-arm is being invoked?  Do you have any idea where this
qemu-arm is coming from?

Can you fully describe the environment you've set up for doing this
build?  If you're running inside a virtual machine or container
it might be that you've not allocated enough memory to the container,
which can cause it to report non-obvious compile failures.

--=20
Patrick Williams

--y/6CBLICKyI0LZig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLz+H0ACgkQqwNHzC0A
wRnDNhAAgnlCic1G+zmAFscyI2HTw/M8jdCYsjUqu6xHJn0GZOx5iEjdd42oezkc
0Ck2YDqchNfStbjgRMVyXTGjsMora0AKydjiujxp+TV8tdvJG1+KUT+GDr5/Yfkt
SdSWhrAwI7wu+AFVWo6rPNn+Cs61biEo+K/Kd6svuhihdhx0WPwLk658RqVE8OxL
om4Q/m5Kh3lkNc4OrfblGiRV+UH7eMZLvv0wYfn27rKzl4NxgP0hmTaYZXCz7BR9
AdVe5OmGlwNmIjKThiJMczHGwYXFG3lLuaf6ces4G4DxTkY0XvG/ZTgiy6tH7XWz
PRTmNZjZaOMEMkDzFBzFvEbnPye+UGPyRFZd5BwJY5CALwEIyw3CeQggQ8gwf1DE
aBT/DU3s/s1sQ8+mmifN8i1iHUqL7b05aEUEbKqcK2/pZDcSHxEfaLdHO22tTCxJ
DTIqmnyY775V5fILm2YfoZJ86KsW9fFsMpnFCdqSWURewcoGp5BqUEbWhmBdzvDj
un7aedn/spqBdzYV0HY164ENsdkrz4tPneFzg5VzJCuCDSlxGrwy4SP6BW8saQEy
VNwdrs+RNt6zp8gcOVsdVdw6FxWknBR/Sghc+0PjVAx/lgGjPERnJl9V+MSsmzcS
C1EbMq91Lgqux/+yBwwReQuqfVdjuumFS7Bl4kW8hCrKdKqSADM=
=EakG
-----END PGP SIGNATURE-----

--y/6CBLICKyI0LZig--
