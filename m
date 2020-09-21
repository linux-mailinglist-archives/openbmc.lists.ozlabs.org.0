Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3D272B5F
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 18:14:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw8fC12SRzDqr6
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 02:14:43 +1000 (AEST)
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
 header.s=fm3 header.b=Gmq8Mven; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Lflh0CZC; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw7WQ0DFZzDqm6
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 01:23:45 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id CFCE05C0238;
 Mon, 21 Sep 2020 11:23:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 21 Sep 2020 11:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=SWYQpuzyDDAljjhyMQQpwWOL1oC
 1jlFZEYmw5FJTznU=; b=Gmq8Mvenz9wHPt6+teoG1GPb/HJJIoe8/j8wTt/UmWY
 NfZuq+MlDTEL4LBdR1Vz9E6v1QeJxp5duvkS2tS+WkmR14PxaA4IV4F0K33f4mg1
 iFmreMsUsXx78EFRSQ48wiA5yDTnEj14CiEthZhpsUZUzor8r0NQXZde38ZO9bGm
 vz8xNIwMiKvW1wxGghPIHkSyhfpKfm0fXfoBhi/wGmXzO6vutDipqBPA10JwgffR
 aMBND7scy8KqLUkosReceniDVd1SoYNh1jPV99rkFbrv8xejbn0dsvMiac0YWMo/
 lUDNS3BgMp4cUeUoYg3mz5iPkpYJuFAAH8S8Bb25Aaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SWYQpu
 zyDDAljjhyMQQpwWOL1oC1jlFZEYmw5FJTznU=; b=Lflh0CZCaqGqaNOGQb6Wd6
 Uvfm17QQPW+RjJryD+jRxOiEohSSFthgnOUcuM1PFT5ujtvTTuOF+BTA/Q3lJPeq
 6TjnWk1TYYbWYIcGboyhiQjqVni2KUQGXAwRU5JxnvP1kBJdYMEOyd29WEZjvTOD
 KY7vFgw7PdEoDJYBglX4v/DAJAeScOBNB7yCmk8AblPUoeO8w3taY4jfonagvf+V
 /tj92f5nPC0uyG4Kt74/S6bJ7gHJRymPnFvWcmmS+pXn/jmfC9uk00fI00b45wP/
 eB7L3TRJT7ixMW9vtx5WW8RSU77lQGbfJdVLzGjvzomW72xo74FccCweDrvzMx6w
 ==
X-ME-Sender: <xms:e8VoX_Ni_wTg0xmvfQujMwrDoOlFMGKdz9J0JUeP_fpBhqswfvu3kg>
 <xme:e8VoX5-Pnc1z9Jpd8q3GHD4ij0XvOXh_UsyzsrCYhSRMfd52I6xC_to_JO-QTsPIj
 9I8dISHVc3TEuT_8B0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudefheel
 feehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecukfhppedutdejrdelvddrheekrddvvdeknecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:e8VoX-RYE1sFEZ9LjOnbujiB3fmyha1cHHVfM1plb1O0O4MD1rwEvw>
 <xmx:e8VoXzsdLRhrMcSIhSQTMrtOsD8V7xkJ4b1ai_rZUtdvAueuUiJklw>
 <xmx:e8VoX3c4ICybgxPbEiZT7K-gaZyPVtJoNkXqq8PZyGUkroV-KUssDA>
 <xmx:fMVoX3ku9V40vVGK3dn0nURqr_LP5RPVhHXJ_AXdEApe7hPi9IE1Uw>
Received: from localhost (mobile-107-92-58-228.mycingular.net [107.92.58.228])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7834306467E;
 Mon, 21 Sep 2020 11:23:38 -0400 (EDT)
Date: Mon, 21 Sep 2020 10:23:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jayashree D <jayashree-d@hcl.com>
Subject: Re: Read Firmware Versions
Message-ID: <20200921152337.GJ6152@heinlein>
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9Q2l3mYpK16UQ/iv"
Content-Disposition: inline
In-Reply-To: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9Q2l3mYpK16UQ/iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 02:12:55PM +0000, Jayashree D wrote:
> We are working on a platform which has multi host and each host have firm=
ware versions such as CPLD, ME, BIOS, Bridge IC and VR.
> We have to display it in dbus objects.
> Can you please provide your comments on which dbus objects it will be sui=
table to store all firmware versions.
>=20
> Also in phosphor-dbus-interfaces, I am seeing "System.interface.yaml" in =
/xyz/openbmc_project/Inventory/Item/.
> Whether it will be suitable to store all the firmware versions (/xyz/open=
bmc_project/Inventory/Item/System/HostN).

All software versions should be modelled per [1].  The sub-section [2]
tells how to associate an inventory object to a software version (to
show which BIOS version a specific host card is running for example).

I don't think 'Inventory.Item.System' is intended to represent a single
host in a multi-host system; 'System' would represent the entire
chassis.  You may want to use 'Chassis' or 'Board' to model a
sub-assembly.


1. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/open=
bmc_project/Software
2. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/open=
bmc_project/Software#find-all-software-versions-on-a-managed-element

--=20
Patrick Williams

--9Q2l3mYpK16UQ/iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9oxXcACgkQqwNHzC0A
wRnAjw/9FuY0t0rKlq45e3M4NWjLlnkQgCjpNry+IDoO/tfjzs5cKYf4/b9KzxAs
DXJY0Ic1CC6MazyBBGNaoYccMgsQ/Zs0KDvuxZmtexrd/BwQ/NGirgOQ58rUUWeh
3eQmSJQtxlBgOxiyhQa0l3YZJSD1fnqHL+VjzuSv7w86wHZB9eSFNLMPmkTFrf4X
bjWbM0yh2Bu3DSo4W7JVe9NtuaXMFpkYN1fJgRVt6MalcdnVGTMPqrfFZgh7ac9u
9csTMcG1b6dnkUBbUlJN6d2SU1BESaraWNgbIpAFjsyiA4fJ+kMG+V9dTyCwlmf3
KXuVxlynoHgePefegzS5DYJ4uuULvI4adKe2em3g9tr1ahTqe5n6uF3laRuMX0oo
e4AhruuU3AkEzehf8jI2/zwfwx2RJR3UZ9RQs1bL9v1Cd2XDINppGHcjha/mHZoI
UajAaQb/utvN+8Acjxh1UawLWpWU2aUqeGJPuao8uzxEcsQ5ny2fVgMDrcUknf3K
rNJB9mPQPK/uOED4PZigxcZW/NIxqtt4bik8nxnGsamFZJEZP0gQ72ecjXN1JQSS
qDy9yuOS1dLRiDuRV+aGHkSgnap0dE20khoUz726BW99PfRtbtS5sG+AD4qmJdn5
IA8c/jRovR0WoIPMZTESAsExqjleZgHu6tmnvw/fehIxvSQlW9A=
=YrHQ
-----END PGP SIGNATURE-----

--9Q2l3mYpK16UQ/iv--
