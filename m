Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA94163308
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 21:26:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MXRx6dB6zDqVZ
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 07:26:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=JHgEvunn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=kmq1bhbp; 
 dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MXR05mByzDqVc
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 07:25:15 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id EB7B25A8;
 Tue, 18 Feb 2020 15:25:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 18 Feb 2020 15:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=wyU4OL2QIpqPctpphzbwwplvBbd
 3iThLTX2rT0LbBzY=; b=JHgEvunnhxwlfxadJDQd4KGBBy0W05Gpw1P7z8fKchr
 cqxuBvcMFL9Q9GLD+m5hm2WioG4enns/vNZxkZ0Bbf/AZ0objjVLXzBKuwzCzits
 /3VSez077NeII2Mr3M6daootIJs8yRZdeD5qlnO7c1ZZLesq+0AcS7lMOT4xLvbq
 ihmXopq9T8peF0RnvcIzKugRlXNmGS6dAKqvpJw9ch92xiFObQ73tfWfZmSFODL0
 Ui5IVIxpdS4FtN0BGTlhasLEhhIydcjJnw3/y26B9BNc9OOQ4sHmvdWZtztgeCMC
 +0shN0Be2VMo/AQaO67qVgT4Bdu47/Na56/wLOkPaZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wyU4OL
 2QIpqPctpphzbwwplvBbd3iThLTX2rT0LbBzY=; b=kmq1bhbp6EvgoY+xmvlSDH
 nMiNzv2KRz6zwN23yYmyntBXhqP3K+IhSj2JaxGKS02KfKOSzGGh2Z1kAV1Evrmi
 HZjwAnwAnA3s+9mYDiLvsdVDF0Md/+Rfspu8zghtch5Shf2kwroUj6mYqxbL00Si
 gj8FBvn3qztBmXeV/dS2y74MKpE4/orXqKDOz0Ui/i3dLZVPsJsqr0LrCtL8ykpD
 L8oQlqh983dV4rXP0euJCmr9wMAtVX0Sdhzv8D3szEFUaFlyhX4nHByqL8acpNyx
 KF/bWDPDHcvCx1UQ1+ABQNOpkXv+cQGnBzafWsOusfpazS5yWQZOy2k5aC2simYA
 ==
X-ME-Sender: <xms:JEhMXtA0WPhGU-5UkWBet-sX_qypYLsoLscRnwAX3uWc7_AgYpy_Tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeekgddufeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:JEhMXmZ4vYK2UJrMtfYyFT0lcj52U-wLbmecXvX2GYCg0ACnNOKdSw>
 <xmx:JEhMXiwzRiinVs-Em2w8xqoYsFWuyJ3PmAYJ5SzmZdMJYziaS_iJ9Q>
 <xmx:JEhMXpePbFyek7BrL9bmGjci9rFI1A8C3yA-3PZtmBGHckvAxJcLHA>
 <xmx:JUhMXqOW8Apu6Fm-OOw8TG-zI95aEFG_ThkH-EVrt4LXMISrCCBxCd53REo>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 781A33280059;
 Tue, 18 Feb 2020 15:25:08 -0500 (EST)
Date: Tue, 18 Feb 2020 14:25:07 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
Message-ID: <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
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


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 09:40:53AM -0500, Brad Bishop wrote:
>=20
>=20
> > On Feb 18, 2020, at 7:56 AM, Vishwanatha Subbanna <vishwa@linux.vnet.ib=
m.com> wrote:
> > However, if the user changes the setting when the Host is booting, time=
manager puts them in deferred state. Meaning, timemanager does not take the=
 settings into effect until the Host is powered off.
>=20
> Can you elaborate on why it does this?
>=20
> >=20
> > So, if someone wants to move from [Manual] to [NTP] or vice-versa, when=
 the Host is [On], they need to [power-off] the Host and power it back on.
>=20
> This seems less than ideal?  Would you agree?
>=20
> >=20
> > This design was chosen because we wanted to give priority to Host.
>=20
> What does it mean to give priority to the Host?  Are you trying to hide t=
ime changes in the time from the host?  Why?
>=20
> > Some of us are asking me if we can make a change to take the setting ch=
anges in effect immediately, not caring the state of the Host.
>=20
> Without additional background this is what seems intuitive to me.
>=20

Most of these design points came from considering how it might be best
for a cloud provider, like Rackspace, we were originally designing some
of this code for.

If I'm leasing the host processor from you, I don't necessarily trust
your time infrastructure and might want to use my own.  A compromised
time infrastructure can be used to get you to use expired SSL
certificates, for example.

With this in mind came all of these design points of "the host has
priority", "you may not change modes out from underneath a running host",
etc.

> >=20
> > Please could you help with your thoughts on this ?.. What is the Indust=
ry norm on this ?
>=20
> FWIW on our (IBM) system designs we usually hook an RTC up to the BMC, an=
d any host software needing a RTC has to get it via some in-band software i=
nterface.  I think I heard somewhere though that often in other systems des=
igns the RTC is connected to the host processors and the BMC doesn=E2=80=99=
t have access to it.

FB's OCP designs all have the RTC to the Host, so I'm not sure any of
this is applicable to us.

--=20
Patrick Williams

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5MSCEACgkQqwNHzC0A
wRlrwg//f78AtPxF1RcCDu9nYzI3dwRmLsp385Th4Pmy+JEZ/SjT0ga68kLyhvln
KT06NwO81mYoUIh7Hv53fOI6GVE5OfYrLA0bj2DXa+lTsueXFp5fiGtkkMTmTloZ
P4yBvOnHBv7CSWeBOAqQDvG/SBFjwCgyaCI8w1mcHhqlAYnO+fiZzuFUBYegOsym
K6VToUtkKcLq2buo087titsvvkFzBSJhxgTwJeVU9M+XKum0eE7jTqC7yxftrI0n
R9rjbxxtxI8SFd+8qXyU+Bp/+BhKnT6aW3iCyMSYm16z9grXfSwiPknwB+wF9ja/
CLbsVciYBt3FRKUNXTaQbQXp+UTWU0K5Cruke781FlU7n3jI0uCSIWTPeeZg9cHl
BNgOhY2f/JxBWMv7fsxSqoK1HNWWIVKXp1riF75hZfcahKdmP+BX5FG5j4HZuHyX
eTji+8ZaJu0gqNLmJxsPUdslHduwTzry4lZjlXA9yHBZa61YD5Mf88LDYkPfCkLE
MGs48agfMQLBubZomtvn9UHmr7wDRxEexMZgAr8UbcHMBtM/cOxB5scvC68H44By
24hnTg7N2eS8GFJSXz2hJjSOVqvown+BygCQidpXRpvH0hg/g9sWD0QJMseiwiIr
IHIz/Qa5Zcdyhb1SKzLFiGIMCCWFzRj8z4fIUM59jPN+6NlEQAA=
=Smwl
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
