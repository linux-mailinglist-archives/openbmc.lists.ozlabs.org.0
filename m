Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EC728E4ED
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 18:56:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBJVG5YxnzDqlr
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 03:56:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=ySx4a6Le; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=fpqrJTiL; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBJTS15ZGzDqkb
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 03:56:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 90D785C01AD;
 Wed, 14 Oct 2020 12:56:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 14 Oct 2020 12:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=kIF1oJOS6NLUiZfOfzZhnOf8rnm
 01eh749PaMZphGlA=; b=ySx4a6LeFqff2E8jb4ZFBdcjqdFUoqeyRKoY4t9Oc6r
 t+O/svTTeRxK4Uq4QkuuEm+cvsjn6+Lq/MtsNDeUiLR6jJdkSQ/HXhqKTwQUItBq
 j+jQHZl4Ns+RLBXIx++3U3ikSXSr4DfcaO7/2s4P8R3iylFnUXGN9aBtrbfJ5Xck
 GprVV2SwA7Q/XRjwPWqIUWR84NmiACHWTKDv7ISzevy7Hdg65OVNJNwwfsDTSja4
 bVxeyERjxQZNQf+RmStfdcDvdH6XNG5IbpGj0jTzK/JEn5/u8Ro1w5XnISdUCmiz
 Bg9h0t7/10dsK1Tn5LhwWqMQV76XvFwB0Wg8loJRbIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kIF1oJ
 OS6NLUiZfOfzZhnOf8rnm01eh749PaMZphGlA=; b=fpqrJTiL1qj1T2xIqD8MlZ
 GyOvAnLBR8pQYa3QUhH9Rtm7G9EybW8y4QKxEPv58VDk0HH3Si2dl0R774QGbiv9
 9z+aU6aVEGJ9H45i7pP/toapCIuPByZl8kjK7EPCvX1zng8W6rQV2bDXM/v5ximi
 xhLHZ/xU7aBa+oU18wBDH055CBNOcSJ+8i+yhvxfWT1XONnH6yVSR+QCax03p8CZ
 +8JD0MJR4Z2mZqVQB8AN059DNhcg8E9I80juDwTByEZCReeVP9PHKG6U0vwf+DP3
 h18JneQjK5KbLN/94DX6eujG6N3/b72Z+IBEyynJO2v032NEGcyHrxyatLEen8VQ
 ==
X-ME-Sender: <xms:pS2HX3S0aWlwZCIOk9KsCcS72W9yjSb5l7w6lk87LqGZ03kZ7YJXiQ>
 <xme:pS2HX4wpCBXMp3Q-wK0pJlVWF9RpE1oLck9gTEsdn8STp-G3CIRd4cuZLPSTSMJ1M
 rBuu5JnTJeUbEqA6Jo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedugddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:pS2HX83QPfYfznqV08uRsI3z14rRDM4-I8VrwJw2TY1JyhfwNhVHCA>
 <xmx:pS2HX3CByenc1jFHZcxFpFqFdGMGVMlDbIUpmfqD2OvWyivlKAfXJw>
 <xmx:pS2HXwiBmkT0HdN95nSx2Edllu0dIR3c0HA3U5I6-4jVdAUmUjjaxQ>
 <xmx:pi2HX8ZK5ar5sz0Jdq23eifRy0fdEV4OHWx7sK8N0sFrOu6PDkK9iQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F5043280064;
 Wed, 14 Oct 2020 12:56:04 -0400 (EDT)
Date: Wed, 14 Oct 2020 11:56:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?utf-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBUaGUgbGF0ZXN0IGNv?=
 =?utf-8?Q?de_of_openbmc-maste?= =?utf-8?Q?r?= failed to compile, please take
 a look, thank you.
Message-ID: <20201014165603.GA3521409@heinlein>
References: <HK0PR04MB28839DFD113446F4DE202799FE040@HK0PR04MB2883.apcprd04.prod.outlook.com>
 <581621fd-2e12-40fe-9a79-1d1575c7920b@www.fastmail.com>
 <HK0PR04MB2883978E91A7D175DCEB831FFE040@HK0PR04MB2883.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <HK0PR04MB2883978E91A7D175DCEB831FFE040@HK0PR04MB2883.apcprd04.prod.outlook.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, "uperic@163.com" <uperic@163.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 09:45:01AM +0000, =E5=91=A8 =E8=BF=9C=E6=B8=85 wrot=
e:
> Hi,
>=20
>    I modified the RAM space to 13G, and I tried the same error. And I hav=
e always used 8G RAM space to compile.

> > virtual memory exhausted: Cannot allocate memory

Are you trying to build on a 32-bit platform?  The message here of
'virtual memory exhausted' to me would be an indication not that you've
ran out of RAM but that the address space is totally filled up.

--=20
Patrick Williams

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+HLaIACgkQqwNHzC0A
wRlyTg//URyKriCDSn1xJ5r6gV3hvhCgNVDMmtFt5pPj303fwc9DScwvU77PBFDu
Nuy7cjQ4hYCgMwe+yXwoZ2GvkWqZ3PkUlklzoucwJAx/iZbaes2H7g5VRel352s3
Edn3lNvFT5rxIzGS+g6CkSOct9qxPR45ALYSlsjCoOGhKZ6uqjz/QgV2r1B/pWHU
Eo1ymvN10a44RStlvfdtF5Q0MiMmyB9Sxfixc1ew6Z3Uh30o79hw5m4LKFdeDXrx
WqyJCnd8cs6CRb/TDAGa4tUYuFmRAAPcl42SUbLqgx0l2kDf6LGyZ/5pYBfAIMl0
xLjwVGBBIz/5Y9x2/oEWZDw/fQDG2k8PrTRV6JeR9AvE3NEIq2ZTk9pBIVOkxqqg
LCfN3VPnM6OXr7qTmpf7+QILeo16D0kRkzTp3FTtcfyZMe+oKYn9TNh0E9vkV3Hf
nC0wld82pBsusG+I+mazqTvN/+CsbiStVojnhcxvuRqra8JvHVnVLilmgBpSqK1B
0xp3MxVPYeWRZmbs/LDDRmK+8hUbnApI9KhM8dYGVoXGb8Uwpgs7VV7wX0CAjjUR
XBNE+s1PYjD0leCu0WyxLMGrGZDazMHAVyNr7K8sxkuBHC4VeIQbtslYwnh1KtGJ
KYhlbxvQRpe9BS/UQ6VZDsjErdzli4NSwjDxwYWQsdjdCwjBUGU=
=ChZP
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
