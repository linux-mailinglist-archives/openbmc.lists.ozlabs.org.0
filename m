Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C2152222
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 22:56:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Bz6x4ncszDqLg
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 08:56:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=OIfK9WUj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=raspUDLa; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Bz6D1bd7zDqLC
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 08:56:03 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9B45D97C6;
 Tue,  4 Feb 2020 16:55:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 04 Feb 2020 16:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=oIDu2C+Z95dEcEgBubC4W51W25W
 BdVdVBRs1dTwuyiQ=; b=OIfK9WUjsktQXxJL29whi1bODs9sptzbALsD9JboOJi
 GOHVma0rYgSslmC2Ff7aenw5moKjcbilQBzZPPgMkVAt0Y95cUEVDZ2663SHqSF1
 VaIijELWpmUEhvzkLjmn+TZrcwcOiwcBK6MgV9oWvxMmj0FOnUcSNi66krmYguIF
 x2SwybDJ44l/HwD8vkf4fRVy9qxM4BqZydtUA+/e7yZ9QDj0cZVKX7a1Ut9iUeLf
 4KEHgWjaiXGuHftA0JYXUqPA8LjiRc5XJZXgz8CQBweGtcbw+vmj3Ldj644Ghqaf
 yXl8BnSoVAqffNnjM/ivz3NgBAtRkjH1RMmAfOwHwUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=oIDu2C
 +Z95dEcEgBubC4W51W25WBdVdVBRs1dTwuyiQ=; b=raspUDLaae4S6BqDOqHZ5s
 LN8DfHLWDHRin27lIM6WTEm1Iw/1ZGuJ4icGrJszlafwTcNqCKvZIevvvYHRgpXa
 6qK3QZHMEXcuc3/r3xoKNItO5qhc20RU+3n0Rdc/sGlM+bSwKScNTle83/kNYcRq
 15X2lPbrb7HXkfgxPkE8ZrZ+lM2G/Psl9Lh/vRDsbCZaTIU8s4gG7Z1k/VE3ZKV9
 +4qMG/+3Nj4kcY335kb1pudPFxWO9pU1l7wSFSAjNMBeM/izna2c4OusamreHC6D
 NqTOcxaFugYYEmo/TX54kEIMcThpOWBimOOQ3bz/DASm6y5D4bhHm8x1NJD7HpKA
 ==
X-ME-Sender: <xms:bug5XjepBonpDy5xklsbXbvH6DwNPJEodWX1fl2hiGkxQJnNFgcahA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgeelgdduhedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdig
 hiiinecukfhppeduieefrdduudegrddufedtrdduvdeknecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiih
 ii
X-ME-Proxy: <xmx:bug5Xg3H7P41nyQGUWolAgorkVOSDc2RpVdBq1mBlVNxZRfQ-p_Arw>
 <xmx:bug5Xj59_VvpcJENbViYz64Xpot5pAVKVIONW8KxYIueNfXxN1kb5A>
 <xmx:bug5Xvf0wrKWxYbONhlZ5IkdDjkMl4Pl-ACGqkTKUkSo6FQW5x_yNA>
 <xmx:b-g5Xo6qQJ9JcBWNZT3Im_JOBVAXyCglWdr-1RRQxgNLd2WqRn9JNrAcNk4>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2BC96328005E;
 Tue,  4 Feb 2020 16:55:58 -0500 (EST)
Date: Tue, 4 Feb 2020 15:55:56 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: Using a struct[enum] as an sdbusplus D-Bus method arg?
Message-ID: <20200204215556.GA20653@patrickw3-mbp.dhcp.thefacebook.com>
References: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
 <20200109162238.GD1233@patrickw3-mbp.dhcp.thefacebook.com>
 <0de28bd0-95a7-11f6-f2bd-9806508ec5cd@linux.ibm.com>
 <20200109190343.GF1233@patrickw3-mbp.dhcp.thefacebook.com>
 <b018b37e-10e8-55bf-b48e-fd2c71c47160@linux.ibm.com>
 <20200114174117.GA3512@patrickw3-mbp.dhcp.thefacebook.com>
 <20200129030741.GB96533@patrickw3-mbp.dhcp.thefacebook.com>
 <cdd36154-8ce9-1f40-d910-f05a5cc6dc4a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <cdd36154-8ce9-1f40-d910-f05a5cc6dc4a@linux.ibm.com>
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


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 09:08:28AM -0600, Matt Spinler wrote:
> Thanks!
> I tried to build a flash (wspoon) image, and in the server.hpp generated =
for
> my interface,
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/2=
6544,
> it had:
>=20
> #include <std/vector<std/message/tuple<FFDCFormat, uint8_t, uint8_t,
> sdbusplus.hpp>

Latest version of the changes should fix this #include issue now, Matt.

--=20
Patrick Williams

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl456GoACgkQqwNHzC0A
wRlTOA//QJaBLboHsh3fJxt/n1nqUc/C/wVBbPVgVmFM3GeddLCR8LylopCzpR2y
K5ZHtjZUgQ7MN5StulF33ulBz5j6Z7H0IoxyVy4unqBFAPSe7TIF/RIGchlq+96s
9M7kfzc04IzRDUyLotSPupM27wPoIWlVL60QOmjwYBaYF2MuzX3ZWSCIaemOfndc
/dpBOKUU7AXaNEg8xzeSe2dohKd+qP0NIBLkiLcFz6it1G8qY/I9XShS5PfhAsX1
rx9Mh+Vr1vDpHahMHdVsdv0m6M0IRvR5EOf8Up6n6j9lM/XA3TJONhQFaKYcr3ly
4zbgcxH+M7x2UFIKXVFL+XL9PvCemaL2cQSg3cIr6vTTSlsWYaGj2jQs5hiLlj69
5SD+/Q1aRXlDnjh+4Ic70TCaou4TpZWc7W4WITPa3hGXr6RdWaLVPMH17o3DG+Y8
MgqWobIzbuC7cq/QLtr60j/CVgbCIvMAThi6oby+kK7zRnA9amnPZOVPMKjKZLJ+
EXu7sIW5rI3kOqmhIMaUs7786ei8xbJ0G6HOcHHpOmHL+uCWedA+9/mdtEmKPXSu
zMmVE//rxRLYbUmknE0D0c7/YZcHlj8X1kRyqQVO2JpTgKy5NYYWRE3g28ltSSsd
OcVbi3N3HZAM2lD8cld79d6Cvnt1VPSWfe/P42TV7tIs/dFBapk=
=nBNr
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
