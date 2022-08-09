Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F20658DCDD
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 19:11:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2KNd3Bl3z3bhF
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 03:11:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=kSbbBi94;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=EBrHqkiy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=kSbbBi94;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=EBrHqkiy;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2KN52Zrmz305M
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 03:11:00 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 991495C0056;
	Tue,  9 Aug 2022 13:10:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 09 Aug 2022 13:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660065055; x=1660151455; bh=Oo6TR5B9AS
	Y2YSnpLNAQ6b8D+3HMAiTL/SZ5YWx/Vmo=; b=kSbbBi94ae20PxuYNBK/y+XVdF
	xYpKZsiH6p2ZjGwQGt0bI3k0WCUHBFqR9pLAb9uL/Ib7jjstvpGPTPXUUrkKLuKu
	MV9WxCufPPletpUKsMwHge/mavS/Ks8bhTi6W3oqux/wllO48kvxZswBAW9Rg99V
	DM0Q6bfNhNQXkCViCYX1bGiiyNf0VUZC37EJbw+KbEwhPqKOSQSNPPUsiQ8n3DRe
	qQbiQMMzfcnIAhXiCy+8YMh4qX66DxEJKO4pXp9Xq2klGDOHctpvHsnIpI9Wtr/i
	l2CQIjSfm6PnJX//vJCX8XgHmnCe632uSKG0AoIrH7J3qa7p99aW46mh+HfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660065055; x=1660151455; bh=Oo6TR5B9ASY2YSnpLNAQ6b8D+3HM
	AiTL/SZ5YWx/Vmo=; b=EBrHqkiyMWEuS2T5zPUK9tRsromHLtpjoZT5wZOzlSal
	E1rVE/aCON5AXCBhbHaMSuPyFG2UjEbjST8/KAZJtGhgT+WQAjMK8H7+a+IuXLbJ
	/Br8OsQ6noD5moNkRfgSriuia4P7nI4a+vHpdHIkwTvRQG6cUZsMGnNR3JwsVOYm
	qZPecxuf3KClbLjAxn9sSvDCvfcx3MTIY9+HGtgyg8pVJSf7Jh2e5rQIiQaoYtZX
	wEzqYEo/CY1OxNv20T/lvH0IiVhcY1qctkTspv1DuWEMr0yE/jrz4a/COgKz+WoA
	d8lhp0vLBfwmC3gPahEohnAyKSO/gDCddlW44Eczaw==
X-ME-Sender: <xms:H5XyYirTzrOXgeR-fynsEQCWW4AxX-GIoysIGbV1361dElGmJA83MA>
    <xme:H5XyYgrBdb-9zyhfHSnjVUgzDu_0y3i1aw8mQJ6pej6rNh6sRozbg5qR4rYmhGp_P
    uVyxGKiUcerkGoYcgo>
X-ME-Received: <xmr:H5XyYnOFKumwwHMEb0xurmaYTeHO9wWQP1VimHk5KFE0ThL_Xs9k8guHpbeOabGFqL1KOHbx_72qp3vRk9rYjAB7sDp1AVUx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegtddgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtroer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepteevuefgveettedtfeevudef
    heehteefkeeugfdugfdtfedvudefveevtefhhfffnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:H5XyYh6Q539XDOsIb-QCyqUuO8etyT42qTefqkb9uC-5mmPABopJ-w>
    <xmx:H5XyYh4V_5wfhcPtAxHu6Oiw40LWJTRZq4JNJJ9xT9wKH2V6Ou0JTw>
    <xmx:H5XyYhiOIwKSJ9fS05sINzYVdyBvhF7HVDZVZQZwaZxPhne01tLCsg>
    <xmx:H5XyYui9SVZVN8VEaCKiJvmRXyowyVjSha9Q7My30y3kJhiGATqqQg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Aug 2022 13:10:55 -0400 (EDT)
Date: Tue, 9 Aug 2022 12:10:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Patton, Schuyler" <spatton@ti.com>
Subject: Re: Question on build initial release and getting a root file system
 for initial testing
Message-ID: <YvKVHXqwiVuiYuUG@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e30ac7a9b1dd40788f52cb36ed5e0a7f@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P5/+OJ5xlf3GOlv3"
Content-Disposition: inline
In-Reply-To: <e30ac7a9b1dd40788f52cb36ed5e0a7f@ti.com>
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


--P5/+OJ5xlf3GOlv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2022 at 04:37:04PM +0000, Patton, Schuyler wrote:
> Hi,
>=20
> I am looking for any recommendations someone might have on how to just bu=
ild an initial root file system of openbmc on a platform new to openbmc. We=
 have added machine name and our build is failing at trying to build fit im=
ages but believe everything has been built
>=20
> Is there a recipe that will assemble just a tar file or ext4 image that h=
as all the bmc applications installed? I can add the kernel and modules ind=
ependently if necessary.

Usually the pieces will end up in tmp/deploy/image/<machine>.
`obmc-phosphor-image-<machine>.*` are likely the rootfs pieces you're
looking for.  If everything has been built right you'll probably also
see initramfs, kernel, DTS, and u-boot blobs.

For the rootfs you'll likely see a squashfs-xz file, which is derived
=66rom this:

```
classes/image_types_phosphor.bbclass:IMAGE_BASETYPE ?=3D "squashfs-xz"
```

--=20
Patrick Williams

--P5/+OJ5xlf3GOlv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLylRwACgkQqwNHzC0A
wRn82g//ZSTjM91fYVAsWaNOpiI3QSDHX1bvecy/NpgApQebLQQRnxYT2srKJvN2
eGnjkrKG0hL2oQ1rvd8q0Dm8lgQ3mz5pJw9xxCqOnOxtVrbCSyyzxj1Pz5F6kWuB
IgxkHXtHcS/obLMbx66q+O/PJGMhgwSMvFVynbQ3yPaiEQx/h3HWAT+Z1/grJUns
keDV6Y1QTle4+LgZoNHhZgA+6Q5hPmcfB0l37fhtMdanG/DvLlyxWc5m7XyRzmTo
5SV17UmB34+Nk9oJs7YfY07Rx8MppZBT/VzI0/p1py2m3Vnr4AT9Jfmb/zxh4uaY
nwF4AEGR2c7+/P3PA7zMlhI2e7ynV/oAHXT87tnM4gxxPixIg0WqOG3wczyq9R0d
8NGHIf8Yu4xPJLJ1VcE0GbXPn0CV16xfcWUyGkhY2T0xRtZtrkjjHnKHwkc6AvAS
hAwYWjWJ+1EbmoVULvgSyv4AVO46MrIv83/UJDpSO0MPFQIkr0XfUvy4xyb3U5hD
nzefrjOAhAvKulRctZ/kfo6ILNK44m5hh63L6cWN1FHgXdYsQ7MtGVOivU49lop3
FCjzhm4JaQYK+3OCFtKBi6RmySKq8IBF2GQ2vdXCgdAlP7A3WBa7+aMLptLIOAFU
LU4qkKSzeB686rfJcRATJPqpL0sR2vomdGJVz2zMdqr97n2RvFM=
=9cyz
-----END PGP SIGNATURE-----

--P5/+OJ5xlf3GOlv3--
