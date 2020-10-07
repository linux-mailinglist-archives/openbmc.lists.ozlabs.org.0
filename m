Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F4285657
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 03:35:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5cNN4R1SzDqGB
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 12:35:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=PmTJtBsz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZdoOW8Ui; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5cMc5htHzDqBP
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 12:34:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 03067B7A;
 Tue,  6 Oct 2020 21:34:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Oct 2020 21:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=wfg0tuhG50K3cOF3k88qlyCPL6m
 FxC5+irzgxaEMpRE=; b=PmTJtBszat2wX/Bbdy0bCSgnUxAacw5JHByXHFCRSnm
 3+QPgqt5asslRTz11rx2zV+wSv7WJ3TM0Te5MxGFuYTgQSrLVX+uOT7uPEWUDqRG
 8OCoakPJOIe94IIts9DHhpjxbzmiDoTxFbavdJncZDHK1lNJJL72viNej93XJURm
 R0LQOD9brPBFE9fXUL8LR51/v6ha4qTNywB6FHfPBRFnFZIVNDBoVnRJ7BaXRvPm
 f17zjxBXi2InIGkhmLyOkTtHovzNa9YwQ7uyqUsamYTcSXbgNWu6A04I+lDzyTlc
 kwNiK+fUCUFjoKhEUrAh6gyP3QLgdnUWo1GggD+EFfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wfg0tu
 hG50K3cOF3k88qlyCPL6mFxC5+irzgxaEMpRE=; b=ZdoOW8UipHbZduRXqcfTgE
 V3FMvAmt7IvSPdrXxv+e0c7paIL5rlAz4dFNsDDDCsdNFflPAIQLGeCwRowKojgf
 0MXIG9hugyjWiFJ8GYdUdc8PEr3OdgMsIlgf4U6+GpxIYYXoYmAyR22Fl/WOq/Mh
 k0wmFSAmeK52dZorzD90WUMt8H4u1DA4uwN6WZjm67wSGBZWbpe9cdH7PLMmMmXu
 FzMl1WjZ8ZtDQfghjtCTyc9PJ16KrpqwI8bBUYxI2tVl6ww/b9MSXXS1kh1w7eyW
 yvWG6XoN2aLj2DFreZal/CrewusdDyWLQlfvmOwOp5QI13jBjiBmPEwV+18j1sFw
 ==
X-ME-Sender: <xms:OBt9X0RIbFaxIaOsVM6qbOlnoDb5kCZTt-RhwBFCd9cODVena-p4UA>
 <xme:OBt9Xxz5rfPEavKtPED15k9ZNe0we7MPJnL6s1gkzXHx-oWcF6j5jk2xnQuq2wuSj
 WWVMyl24cG5ewKYgyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeehgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudefheel
 feehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:OBt9Xx2REvQ_-7jFQG0LxjQTcOw8Yj6LlXQatEBcL-wLTIXNTVsR3w>
 <xmx:OBt9X4BD58u1WomvEHkEmmygmoCuxd-MLHl1SmTQ9HRIzehaYKGCzg>
 <xmx:OBt9X9iBYA4bghnuOFJZl8_9OjrhkXtJSYAM75Bkv6PKWCm43oF-_A>
 <xmx:OBt9X9LUAyNr0Ocj1c62v6ZH7utq_FP3Kv9o3nX8IPZpPiRxwuB14g>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id C830D3064610;
 Tue,  6 Oct 2020 21:34:47 -0400 (EDT)
Date: Tue, 6 Oct 2020 20:34:46 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Subject: Re: adding sync method in phosphor-time-manager
Message-ID: <20201007013446.GE6152@heinlein>
References: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MNlToX3gM+0wUd02"
Content-Disposition: inline
In-Reply-To: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MNlToX3gM+0wUd02
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 05:38:13PM +0000, Velumani T-ERS,HCLTech wrote:
> Classification:
> Hi Team,
>=20
> We wanted to add another time sync method in phosphor-time-manager to get=
 the time from the host and set it to BMC. To have this option configurable=
 I propose a dbus property in the time interface(given below). Please provi=
de your feedback/comments.
>=20
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openb=
mc_project/Time/Synchronization.interface.yaml
> enumerations:
>     - name: Method
>       description: >
>         Possible methods of time synchronization.
>       values:
>         - name: NTP
>           description: >
>             Sync by using the Network Time Protocol.
>         - name: Manual
>           description: >
>             Sync time manually.
>          - name: HostSync
>           description: >
>             Sync the time from host.
>=20

Hopefully Vishwa can weigh in here.

It is my understanding that the default implementation allows the host
to synchronize the time down already.  There use to be an interface that
determined the "TimeOwner" to specify if the BMC or the Host were in
charge of the time.  That was removed not too long ago.

https://github.com/openbmc/phosphor-dbus-interfaces/commit/70c76a29b898f05e=
28c803808bd57a2b6c3f7a6f

I think you should look through the history on this commit (it
references a discussion related to the mailing list) and check with the
people in that chain as to why it was removed before we add back in
something very similar.

--=20
Patrick Williams

--MNlToX3gM+0wUd02
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl99GzQACgkQqwNHzC0A
wRkv7A//VsQlgd6OEvlTlTqGtO8GYyMq/xMJbgrcZsc9MoBRgW9A6vfIKZkOnnbt
6kxLsCvoevfm46eUvUEyfusGqqZRkskDVs/jdybxT2h6Y3WA3jz9sr3zwAHGcvUq
OFeSgB/en8x3VpAej7rkglpe4VW1bsmRwVisIMnn6iKwqSNlSQUJodTElto2OFer
zhgBcXEPMspaMe2gG0NUnZdSWT2/Wlji9/hUYhfj2O8FEJqOOl5HYWliIXFrnpjA
W4tfsWsJIejzzsAYrILgUPsgFac2OMjaNlXO7r1mcNiG6Ol5fu10aTqqK0idG6/6
uGupopdL+chzdyh5MMPMnN61a1neKZ2aD/MItiFJK5z7j8MwC9DkpSR3+Pf51xMA
8tTo0uWm1VCXGLwImGZx401IyJSlqRV6wzhj0aa65iARPHCBbbbx1+/fvkt6TlIF
yE4nH7kkjJB0ESRKTwY1Dg/mbD7wqf4D+b6YEPyZ9wthBiDbaY4zPoziZQsek1k7
Aiu3ygzprSPS+SU4J7rRK0vE0wTFJ+vf5BQ0nrlvrNI+cTiHOVGHVd6gK0h5sl6x
NgiHiyK/uMY01I6q/CtH3nwpGv91FL/ezhjBmkC9pS9VqqsdSjsSeA0UOgL/uyJQ
jvvI3K+5Q+Dqb+I8RqOAGv7gd08+fiCmUQ/8IO5SefGRND+EBqU=
=TTuC
-----END PGP SIGNATURE-----

--MNlToX3gM+0wUd02--
