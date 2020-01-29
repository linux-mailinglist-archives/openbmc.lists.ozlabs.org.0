Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A32714D1C0
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 21:12:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487F5S3814zDqTN
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 07:12:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=e5TMFiC5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=w0Kk2e7S; 
 dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487F4m47HzzDqSv
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 07:11:52 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 0574E4EC;
 Wed, 29 Jan 2020 15:11:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jan 2020 15:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=z63y3KQucGGKRU50qPo3AWSzZmu
 4XRNq1wQn7uzforQ=; b=e5TMFiC5X60BLRTwNZ36dGovPneOFe1Wj8LxLOxb2i1
 e1yfXoAO33qpwEdfyQ8ANwmDcuQBkVzhoWRCdM6/qTg7J1VZEXSilmFNVKbsHTh3
 4R+wL8UeMgh1F+ve36ehKGQRvMaPGUB39HSB/3ydpNwA29LceaUaSEA5OaxCT46E
 0C9PM165e38bA2l/KB9laNDUbmViHoRpR/TmXAF+d4Rsrd/F3imVr4iZidaGVD/h
 nfbkAZoIy64GUAdNuDoyrlL1cQ7VZoB3xol412ASPRmGZOqCx6PmuNfUSaxwYX0p
 Zl+xP6y64BdVy3TY7e92fYzEAnGOoUHEwtIM9fogR6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=z63y3K
 QucGGKRU50qPo3AWSzZmu4XRNq1wQn7uzforQ=; b=w0Kk2e7SF3JBfSFa4LmpEz
 0HhLdPrgsbxjtGvJcWHZmNK+ibY4YRqETl/oaG/SVGef2qoR5ll5EHOsvADj0zyz
 /hbGrgEWr33wS2p4ONedFO+H7lQSLMAgpzzc80Wd444pUf8g1VksXI4YMI69oZOV
 T4vp2PwlVcLcfPP06niLTDJWH4wsWp7f+Fc4NuDceXeCjK25oW+r8PjQ0H93hOe7
 LRjHKSDvdwg8yj4SDUqT9ZJ2pSG/MYl/eQn6IpwkLV+mSRVQPB1E4xAu8LnHi6DV
 NDTh702LEOgzvTiXnDmcwT6041gcHCbS9M1izst8BSNPUijX//0KhkMeKYeV3YOw
 ==
X-ME-Sender: <xms:BecxXs-HzIAjGUvn0zmxCDb6QkLWid6e6fbzvFvbswskdBt2S-SamA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigddufeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduleelrddvtddurdeigedrudefvdenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:BecxXn3PESErOvABDzvamNUIktiNtEAP-pAmli2mETFkZp9X9RucIA>
 <xmx:BecxXvc3fObHdBFt7msIozLcJdBk_7WVkyxDM2Bu7pC4JK18agwbNw>
 <xmx:BecxXhA9ApbUPvh09lgTa82lzuS1qPTEfjdFFKe4CBT_F-BPVFQJNw>
 <xmx:BecxXvLeIG4vYqqd01_yyb9RKYajMfbA-DQ-1qig1zftrRR0nS5G6daopORoCwA2>
Received: from localhost (unknown [199.201.64.132])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3A0D30607B0;
 Wed, 29 Jan 2020 15:11:48 -0500 (EST)
Date: Wed, 29 Jan 2020 11:18:59 -0800
From: Patrick Williams <patrick@stwcx.xyz>
To: Emily Shaffer <emilyshaffer@google.com>
Subject: Re: Test email - ignore
Message-ID: <20200129191857.GB89175@patrickw3-mbp.dhcp.thefacebook.com>
References: <23247186-abaa-4f7d-88fb-38f871c745e8@www.fastmail.com>
 <CAJoAoZkC6qb35i7GUXMdG3ZKvCDkeX6KAQoumFpjRpVZFsahpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline
In-Reply-To: <CAJoAoZkC6qb35i7GUXMdG3ZKvCDkeX6KAQoumFpjRpVZFsahpg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 11:01:47AM -0800, Emily Shaffer wrote:
> I had pretty high latency between sending and my mail showing up on the
> archive earlier this week. I wonder if some queue is overfull somewhere.
>=20

Thanks for the ack.  I seem to be able to get mail to show up on the
list when I use my providers web-client but not SMTP.  Not sure why.

--=20
Patrick Williams

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4x2qEACgkQqwNHzC0A
wRnxMg//Sw5caV6JwIQGZuNn65niPgfV+wMCKD6sxm5RtFP2rGw41WG6uwn6M69L
vcHUaTsfYbL1wIkVM/oKz1xbJ7dl37BQbHWyTv7iqVvya60ZtpvCAjn+OsWJ9h+r
KoZvKyUm03TdrNG/08xjQEs6btXWB1f0J6yAg4btNrZjqRKd74bZFExg+5zpcO/K
djP6PF0kamuS9aox32AfX3TPshmRtHNx17iDHPO8GF2H+YdNgAEtjC7eO4yUmxLe
Y9pNl5pO4a5llBWZUQI+aWxSPpxgizZQ/2BdxkDjtFWfKZ4/caSVEoODLLL8Bc5D
PKnxQDeSAy6Igrp9euJl2gCGN3z5EVX2A8ExfgqBa2ItkhnrYYEp1Sueoq0SNx60
5wbdKSFK0aW9C6UeSovwAXpOTBV6wYIaySXlL9zW+XuyUvd6w+RPWX4ltbpJKkjd
vlZDrCqTb83k+g8K06bfGYMXxtcS/rx6/8r1PrMVkhMvdbT38o+6MMcxLgFguiKv
zktQvVucR8bHE6dZk/mE3ghJyo/vscYeL1Fp7ZzEEGwJRQM3yiVLdCOTvsSB6j5G
a2z6Hf7Lud3FzhyDeDBluBne9M+zFCqLNZZbFKhl0+QadekVOddic0lMfz7TSfxC
B0iUJ/x9fVcVDHkdTLLXi3+VKU+A8Hh0T+SKcyX/LQoMfGKXoIw=
=ZrF7
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
