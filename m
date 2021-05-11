Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC9537A9EA
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 16:52:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffgrj4Kt1z2ym4
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 00:52:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Wa94Gha1;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qSykomVN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Wa94Gha1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=qSykomVN; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfgrL3sGWz2yX2
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 00:52:33 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B90451339;
 Tue, 11 May 2021 10:52:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 11 May 2021 10:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=bS2tV8aOzQX//lIjc34jNzL/fc3
 hhcTbTBryqdSbH/g=; b=Wa94Gha16n//GZS4ZuijkTfNhnL2rZW7/Far8ppHOC1
 /h1qpDNC7mgkYl85PkHbajbbaCzFnlyd5qeygxfrGVbHIwZlh4ofl463QtBEZLjo
 Y74V1JlzWkyik1DxXMn/SpVFuez7eXL5sfe/WMLohgR9rfnorLOSxC7XoCy783p4
 Wy8RPD6CYV+h8dylbqc3kt9bCLdzMMtpeXZYCcYNP61xDKhvwULHuwIUuLFB92Dp
 31kyg1GZ3puBR+2lGelyiMxL+QR9pfly4iW/fgrwOkrXvyFpoPil2YaulbqqiyR8
 nLT7SCRx61pj2rZZHG+v30dfgXBs3/4i4F0+jrYAw2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bS2tV8
 aOzQX//lIjc34jNzL/fc3hhcTbTBryqdSbH/g=; b=qSykomVN6laRkb7aOHlEm4
 9MqomphNoaGfeIO+wHht2yLfc/rYLQWd/uuf3wyNXG1+BRWY+IwR89rYhq4RTD3Q
 yaq09fT9/3y0aFYBjj8REhJZt2zXY0iQQDv2U8tYG+mPicPyEtNHqIYu3SgO6lbj
 6lFiEcLCOsi2D4H+V+JOQW1P1WCF4eWLSG5mmTtRJTcqs3r+Mbc2v0o5o8MfWNSa
 +HV7Zisj+uLx+gWd/TB3l0bqiZov+SDAX0nAzd+xXu4RqATyKI8OudjzM+T4i1E+
 5i+KSb/cno0tcWh99v/eHBf+9sPSQgFxnezDWYS+YgBb6NU/HFBkbNpQMV+ZjJCQ
 ==
X-ME-Sender: <xms:LJqaYMHssKWepaJM_RBEwE0hEL4aLYQ_KRQCZlNAOUnjNPAX2NR5eA>
 <xme:LJqaYFVQ7GhDXRjbHChRiIr0Hi5KZWWB3UCJlo20DGy2sHVIKgkB8F1E7cIydThLf
 sMQBwoGmAZRv5FAGPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdefjeetuedtfeelfeeiieevveek
 geeuvedtveefiedvhfeiueeugffhkeelvdfhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:LJqaYGLqhrigacHbRYGSVqEESesMi37eIxrytFlxrNlPWm0P0EX0pw>
 <xmx:LJqaYOFDQRv_5HX3X4YgNopVWkq4T9WhUZUs48aixVfYwL0gG5NPNA>
 <xmx:LJqaYCXRdSvvH0AV4gwlNESqUuYYnxDeqSg8jXFjOGTxM8Tsb_4kQA>
 <xmx:LZqaYNBYaCN4cAB1uRILeV_p6Out0QnjsCrRU1gphM06LpTaShR2lQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 10:52:28 -0400 (EDT)
Date: Tue, 11 May 2021 09:52:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: Re: Mapping standard D-Bus sensors to ProcessorMetrics (and other
 specific schemas)
Message-ID: <YJqaKhKlZ7BZCGA9@heinlein>
References: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
 <YHBDIZqvHI0THFh3@heinlein>
 <3d5f8ede-3506-afac-d5bd-4bc7f3331cbc@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EORo3WvOojA/vU8w"
Content-Disposition: inline
In-Reply-To: <3d5f8ede-3506-afac-d5bd-4bc7f3331cbc@linux.intel.com>
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


--EORo3WvOojA/vU8w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 01:52:51PM +0200, Ambrozewicz, Adrian wrote:
> W dniu 4/9/2021 o=A014:05, Patrick Williams pisze:
> > On Wed, Apr 07, 2021 at 02:24:55PM +0200, Ambrozewicz, Adrian wrote:
> >=20
> > I suspect this would be the more difficult direction to go down.  There
> > is already enough code that looks for sensors at specific paths that
> > you'd have to track down and fix up.  Also, there has been some concern
> > by some maintainers in other cases about having information in the paths
> > have meaning and prefering to reduce the reliance on that.
> >=20
>=20
> Please see message from Ed, as he's supposedly proposing to follow that=
=20
> path. I don't have strong opinions on one or the other approach.

I suspect you are not signing up to change all the existing code.  I'll
look at Ed's reply though.

> I've read the design, however one thing is not clear for me. My current=
=20
> understanding was that for each association there would need to exist=20
> some D-bus object at given path somewhere. Would i need my CPU inventory=
=20
> service to also expose separate objects for each core for my association=
=20
> to be 'legal', or could we represent some virtual hierarchy with no=20
> actual D-Bus object in the system?

Yes.  You would need an inventory object for each entity you want to
attach sensors or metrics to.  This doesn't seem like it should really
be an issue.  Other people have been working on adding CPU Cores already
and there is the xyz.openbmc_project.Inventory.Item.CpuCore defined.

> >> I've done some PoC implementation of ProcessorMetrics, which relies on
> >> new D-Bus interface with 'Mapping' property (eg. 'TemperatureCelsius' =
or
> >> 'CoreMetrics/12/UnhaltedCycles'). ProcessorMetrics node implementation
> >> queries D-Bus for all sensors associated with given CPU and populates
> >> properties if proper mapping was found.
> >=20
> > I'm not really grasping what the contents of this mapping property are.
> > Generally we want to stay away from free-form strings having programatic
> > uses.  Maybe if you can define these mappings as enumerations?
> >=20
> > What is the additional information you need besides the assocation from
> > a sensor to its inventory item?
>=20
> In given example I would like my sensor to be source of information for=
=20
> property defined by ProcessorMetrics schema. In the example I've used=20
> property associated with given Core, thus CoreMetrics/12/UnhaltedCycles=
=20
> maps directly to ProcessorMetrics sub-property. Enumerations could be=20
> not enough as we have multiple informations to represent:
> - association with given processor (done by ProcessorMetrics)
> - association with given core (could that be handled by your proposed=20
> design?)
> - linking to given property
>=20
> Would the enumeration be used for the last element, while leaving=20
> hierarchy problem to Associations?

"UnhaltedCycles" is not a sensor, just to be clear.  IPMI might have
called these kinds of things sensors but we do not.  Sensors for us
measure physical properties.  This is just a property (or maybe a
"metric") but it doesn't belong in the sensors namespace or modeled with
a Sensor.Value.

I don't know why the "linking to a given property" would be a dbus
representation.  Metric service should know which properties from dbus
map to some metric entity, right?  For a one-user piece of information,
I don't see a good reason to put this on dbus.

--=20
Patrick Williams

--EORo3WvOojA/vU8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCamigACgkQqwNHzC0A
wRlxCg/+M8BMjtK8FDfX9UEdLoUt2ejI6Wtj7shxlK7CV6wqIaN0eVCYsuZ4MIb2
BDjVrODxdr7YjTHERylrB4XLJUEVlp/etekHz0b34ceHFz75swHa5P7CP7Baf9Cv
5auZiRt6IVYA3QNmED4m2/4JzswsvLEHu24/66Z6BN22qVRcnjxnq2/Ij37lZXLb
KrDv3p3mjRrFyUbHLuA7JVoofHUwsr6Uz7BrAM15x7ZVWICMg4oP8nCWop+018Eg
hv0dkbo+GgExYVHRN51kUbnZCSGoM3h8w9b4VZMyWI6R0yaPJAmxetN8uwdNLwXe
fEtwjEKJVLkt+tHQWkou+0yUpwkL23f5HSrlKOVqLRQlE2oF5erE8NTuFvNJIVB7
CBTS48rayp0ZyFtsnu6HOyoIU26TMSYZGIjBZybHUiSuGGqektNuhlQ91aLwYHew
c+uuAeqBB/SPe6FrOTAp5v1gvFUXkUbG4a8eO5ahbOIeU0R0tzXkc2ny6zgqeqOl
BYK5qqvV98ofD/wKaVbFgA7bZcHIBqJ5/cZNx9T0BaibVMyR3icPeh9ELCZBnpfD
Gy/yLq8CJA/rQlUARffyCVAKq1Hbylg4u6jWSIuVZN0uN3DJVZzFPbVznCf+mbLn
FgrBEEuw1rt//TWbSjaRatUdX0WOOSyKxBiRKPR2wXgovCiO/6A=
=hl4m
-----END PGP SIGNATURE-----

--EORo3WvOojA/vU8w--
