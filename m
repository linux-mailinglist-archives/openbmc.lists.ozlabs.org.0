Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B135C520
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 13:29:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJmjX0YF7z3c0c
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 21:29:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=RYzud3hI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DstnqBpy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=RYzud3hI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=DstnqBpy; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJmjD4sQhz302l
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 21:29:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C7265C012F;
 Mon, 12 Apr 2021 07:29:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 12 Apr 2021 07:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Q3VLUBd3IvsJHWAINb6dW+vMc0m
 feS9fg+ZsQjzZuNg=; b=RYzud3hIyBgxUsg1OJMAFZFQXYM6zVWb2JmLDyx3Ph4
 UjlTS/eClgvCzFgNJ6iOzaeUcgySeshihAsl9iCBFKxMa1XYG7Tah46Kq9vY5HU5
 5rSannH6j4hwLPTUdZuIup9AyO1m0TXPo5Ya21Mr6w74AWDgCzICT1kMYJZDss4v
 FoMF8wBotWde1Rif9o0mFsEPxCC29Vh09phhGfB4ntNLWB4373IX6TvW4mCkaQqB
 xTbKi6r8NHHM6u5R2REj6o/+l+ZW81Atx9PahZGFyAhi30Mt9z19/GnOmFnvFEEQ
 Sr+uBiEMAhmpm2zkS87gYeXPuUf9As6PVFHw1Pid/GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Q3VLUB
 d3IvsJHWAINb6dW+vMc0mfeS9fg+ZsQjzZuNg=; b=DstnqBpyjULE/hLoI1HVmU
 H4pGBMrw6Ijq/yrJtTA/IaubyMXWBuHLqwOF8ca/kn4YTDtiwgnL4H75dfBP0SEE
 iGuwrt7aQtXJYHPB56gsghQE0gWsZOzSGmWN1A/tzIkpL4iVmaD2XEvjstBihqtR
 RJ7x70RHGzOKGig+LMKtELqu73iRIil7PC4TFeSNLBdGpVqAnxhJOind0k2VLBQ9
 L4cm2qKJXn/ArYi5eG21pRInkmHmOAgqWE59gGBg0AI6Z8BuRAZ/jwax/voAagvT
 AEGPrpewGbLHh+P4F5ScOJdJUWNK08d4+W6D+47NuxjZnrHb5ylowgRvIBa10Neg
 ==
X-ME-Sender: <xms:Cy90YKekZtW4JAC62ZP8g0VwjsF1mqBKcsqvkYxNqMm0LbTzatKfrA>
 <xme:Cy90YENBjPjrBoaX_SU1ToKcPZxME2etYoXUAyhstZ8nLRPByhtUY5_2ojkEGMmmW
 7L12CmW9XSpaPt62AA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekjedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Cy90YLhTfhEYdv8lx6P-IaOzArpPg6cCe0od7vOxn0xMkGaEGM-hRA>
 <xmx:Cy90YH9hhPTZlHSR95oPzJkKgPRRu9uB4jUzR_cJuYqyqZASJDJQXQ>
 <xmx:Cy90YGthTUtx_UXyBpElQRWG52hIyUefYyJaO38_RPNpc0HsnyU9-g>
 <xmx:DC90YP4QvQqA4YrQMIZnOrFccgd6BssD0AwRGOSXY-uIzoTP5M69EQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 43FE324005A;
 Mon, 12 Apr 2021 07:29:15 -0400 (EDT)
Date: Mon, 12 Apr 2021 06:29:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "yugang.chen" <yugang.chen@linux.intel.com>
Subject: Re: apply for a new repo "openbmc/node-data-sync"
Message-ID: <YHQvCSTmDrZ6DVD8@heinlein>
References: <cab2988f-76b8-6a30-5fa9-0ee8030af7f0@linux.intel.com>
 <AF9887DB-F6CB-4CE0-90B1-17FEA2497013@fuzziesquirrel.com>
 <bd64513a-76f6-7617-9942-ced892b2c500@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zjKBvRE/ikQw0jYv"
Content-Disposition: inline
In-Reply-To: <bd64513a-76f6-7617-9942-ced892b2c500@linux.intel.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, chunhui.jia@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--zjKBvRE/ikQw0jYv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 02:38:38PM +0800, yugang.chen wrote:
> thanks, Brad.
>=20
> + openbmc@lists.ozlabs.org .
>=20
> Dear All,
>=20
> I'm Intel BMC engineer, we have a module is used to sync sensor data betw=
een BMC nodes in one Chassis system. In our Modular system, there are 2 nod=
es or 4 nodes, one node works as Primary node, the other nodes work as seco=
ndary nodes.
>=20
> 1. Some sensors are only visible for primary BMC, but secondary nodes nee=
d the sensors for Fan control.
>=20
> 2. Some sensor are in secondary nodes, they are needed to show them on pr=
imary node.
>=20
> So, we need a new repo to sync the sensor data between primary node and s=
econdary nodes, could you create a repo "openbmc/node-data-sync"? thanks.

Do you have a design on how this would be accomplished?  I'm curious
what your proposal ends up looking like at a dbus-level.  We should make
sure this is documented at a high level and also aligns with how we are
handling multi-host scenarios already in our dbus layout.

How are the two BMC devices connected?  How do you ensure you can safely
/ securely accept the data between the two BMCs?  If done poorly this
could open up a large security attack surface.

I suspect your software design is somewhat driven by a particular hardware
design as well, so we need to make sure it is clear the scoping of your
solution and should probably even communicate that in the name.  For
instance, if your data transport is IPMB over i2c and you don't plan on
this being a general daemon that could be expanded to a network
connection, we shouldn't name it so generally.

--=20
Patrick Williams

--zjKBvRE/ikQw0jYv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmB0LwcACgkQqwNHzC0A
wRl/xBAAp72iuXjBS//XVXZD4Aokfs48CMPdujUYgGG1SP3Ni0shu+VNA7C9u+m9
ssqPJR4Brvr0mUh/gtTAaOljPW2EmdRLL2M7XBgYdUZIzdcHfaR0akilpYER5aFo
7JdAK7+9bslfr+ac+KPaCJV/tBYUy0Aa3Io6HY1ycoQf+cz80dWDGKzMZcLRuErb
OnBVPyVhVqEp3VkO+INRfpApvapfvBl26CQFAN1u6w4Cc4BGm/Oc1RCIcIKyxTm/
mX44+3QOoXeGUKn5/4jXMO6jTSt40WAI1iLAOn0L3/iQY1kmYQ/VnjskvQ1n8pyT
P1vzfVjAZx+qo4PbnlVzKMlei1uWcntWU++taOlMIxpKP+gVZIlmcFtlh96KbnA8
mrVAXiaEs2O4++nYXQ2+LwIjF9bdN0o6nJwotf+jPJyFaJbhHiLaWN3q3nLy4+lU
0fSYhgq+xYgFemUV+wuY9JRUEgPuG6jMhfVLkyJ+XYUgzMdnJq1CKMWuZ/h8WKp1
Fn8xtzrHpoeUcLIg1/976x8LguV8BTFA/bga1dY2XvOAXld669ydnwsYbe1bNF7w
N5/8xur1s3++xB0RiVr3CD0joQ+4ml/28+IjAoWzBXL+ssqjJ0NSb+VZe8EoIvyJ
4A015DB1F2C7UX98cTZhOiWDAkrgFyhu6gqAJ0155/WxDZVUlEc=
=3kK4
-----END PGP SIGNATURE-----

--zjKBvRE/ikQw0jYv--
