Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5B750F00A
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 06:54:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnV152Bpwz3bXn
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 14:54:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=KkPV+aDT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eKaPBga+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=KkPV+aDT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=eKaPBga+; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnV0b4fQNz2xn8
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 14:54:22 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 47CA7320094B;
 Tue, 26 Apr 2022 00:54:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 26 Apr 2022 00:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1650948857; x=1651035257; bh=O7MMZhJoPx
 nZt5wlIVx2ZasYUutJFOyaOb4m4EPzLMs=; b=KkPV+aDT4t8jzGzXWb2oy19FAG
 Rgn2c+NGGuJz3cVLby6GCsNgixyp/a2H995ritHw2oPz3u+zE1lOwdmU8FOfQVvQ
 2yaTrzT35S38s7BkvEe1n5W0/2sQNWPQOxJEKG3pyRvYHYz3sY4Twtofh/BtlS/S
 2w2UmBWEZNqpRT6F/hDuIS8bx5CT6QEx5fC0c7na5xNiVDs/pQ2ghKl42/K3oKnS
 FjQWDeMuHgEppNAT1DkS/AFwhzPPvyxjrcl2EhEWrGa3fQXhj7GWdpHdOJB8kHh8
 fjZ8mbuDP1uDiNr4Vd2p4sQVa5RHvBbHAxMYvyiljY9u06UrqS31Bad/SYJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650948857; x=
 1651035257; bh=O7MMZhJoPxnZt5wlIVx2ZasYUutJFOyaOb4m4EPzLMs=; b=e
 KaPBga+eEW0Oa+NXTn5xiKNh4ZBqgFyq/+7WFLIPNzGyql+lpgWMLBSt8xYz12Yh
 NH97e4WE77XGoTbzQ0A0m3ado7ePk4c5CJb18C/e42gLccwNupadpBMDTDx6mC79
 qgZcpruLOuDqHcZFQ+ZPl2Ux+jOf+TwsHYgP2VzZ0CL98Vszp9asH3VxzS1npyPy
 ibuTnf9sLVZp7ZlYRVjOMVpXbfGQWys1LmMqcn6ee491r6dXyh8M7wPxanw4Hd/T
 hcRn3ntgCakuABCoC/YyAwPdqPijs1OwNegtewBQI8IKMIpxFiJ+InhEmVCrY2fp
 NV66Yeh6+fYRhHY/7GmjA==
X-ME-Sender: <xms:-XpnYgjnQz2rhZA1Zo2x78tpSAzuHOetZjOyAASbwOb8kF-QP7h8iA>
 <xme:-XpnYpCq0ErPn23cTyPCXJJs8v0Ed8CA8l_qD0HKxGS3VbS7zbqdcz2lOIdfBylTx
 qCRd55VyTq6BqSo7nw>
X-ME-Received: <xmr:-XpnYoFXNmgIpd8hzw5x9BzgLN6TSBaZgNSIcg9Iq8mGR8gSiEn2QSkW1rwYVjFi-NKtZoOJVPBJ2L8i2T_AHwtANhOC0Iai2xM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepjefgtdelledvfedtgeegffefueef
 veegjeekleegueejveevueefiefgiedvjeejnecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:-XpnYhSUkP8ycC0ZnJo0CYxa6EHtT2GhcPs1ck62KQW_DwvnvCMfiw>
 <xmx:-XpnYtzITMwvrDhmv1Lok_Loy9u74YWhDulbj_V7mT0Nn7EC9TM_2w>
 <xmx:-XpnYv7J3WywXOMzzG4beSJejJi5Bu9jkEmfvGSMj6G_Y1Y-F6V3UA>
 <xmx:-XpnYo-VPW_NJ3qCZJOXEkZFmTJBaP73QQReuD-lEGLHt3WCcMvSWw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 00:54:17 -0400 (EDT)
Date: Mon, 25 Apr 2022 23:54:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>
Subject: Re: Linux Kernel JTAG Support
Message-ID: <Ymd69z3STz4jpZnV@heinlein.stwcx.org.github.beta.tailscale.net>
References: <MW4PR21MB1922FDDD3AC06B9A32F82894B0F89@MW4PR21MB1922.namprd21.prod.outlook.com>
 <0d010b3e-d2d1-bd50-478e-6ef1682ab02a@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g06sjOYGNeQyLA+O"
Content-Disposition: inline
In-Reply-To: <0d010b3e-d2d1-bd50-478e-6ef1682ab02a@linux.microsoft.com>
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
Cc: ernesto.corona@intel.com,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Derek Mantey <derekma@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--g06sjOYGNeQyLA+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 05:52:36PM -0700, Dhananjay Phadke wrote:
>=20
> v29 looks to be the last upstream post by Intel -
> https://lore.kernel.org/all/20200413222920.4722-1-ernesto.corona@intel.co=
m/T/#u
>=20
> v31 coming soon?
> https://lore.kernel.org/all/DM6PR11MB399360880403A83FFECD597D8B769@DM6PR1=
1MB3993.namprd11.prod.outlook.com/

These emails appear to be from 2020 and 2021 (over a year ago)
respectively.  Maybe someone from Intel can speak to where the changes
are currently.


--=20
Patrick Williams

--g06sjOYGNeQyLA+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJnevUACgkQqwNHzC0A
wRkt+Q/+MMNKnki482pjteLTM3vgybdIjgTi9DR3slL1gnSDOru3ZspyNGLaV4o7
nHn/tAReQIMVWCE5U0YWdxGUEiMlLE6aanQgWIURpaQoa2LiHEubW3i5CZ0Dig4x
pmeKaPtKkoDzYqG4sxOfRpeg6FUoJZBjzDWT//RBAGWf5qhFZhICPF/THib9y/g/
QnlvDpcDqs8mgxvd2QHf+mfOcetDxMbuG9SpLdXvwTSSijGXO8dnsX2x8k8275FB
UJOqSFuSBq6yQPbXFzQ80dRqGiVaiIrKIuRbUW3nudO9I69a1qoKDXv3aKBPqn/V
HKBZA72GPKlhMTVy32VlynZBHyFu7oFAuPC+pvXf7bX74BXrO+kgNnJaYWzthC3b
7Gwpk+gGfUNt/OeksRg9dkAvwxkIfXN9j0kWFXe1Y3l0s1WhmnSIjCDpsrYF9NuK
8jE1woe4DLlc/rD6rn8oNJSgOI6H30K5Uu8A/GBit3Kib5phyrAQlk15oZdSaNK7
K87/0o9cHrIosssAXWbweldmNJyYR6KrSXYn/7+MJWfUDm1sW0Vu/xN+fprvDUcb
2pWVbvTuC7ztkLvBdZkBcVSgG/UwieNIkaDSFfGefa5oT/DhuDhJBcWXYaVgQJ48
hbmeXdEeIqmkXzcu5JVCn6ubtYsbbL1BW4IsHmKqTIJKSHQoOrI=
=5L30
-----END PGP SIGNATURE-----

--g06sjOYGNeQyLA+O--
