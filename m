Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA22445B96
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 22:19:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlc3V6WCGz2yJv
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 08:19:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=jVG6cA3I;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=llBHUyuN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=jVG6cA3I; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=llBHUyuN; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlc2z5y4Zz2xX8
 for <openbmc@lists.ozlabs.org>; Fri,  5 Nov 2021 08:19:21 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A16075C0056;
 Thu,  4 Nov 2021 17:19:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 04 Nov 2021 17:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ML1ubGrfXdP9+8RxD5dDZ5fTX5U
 K6gK+w1ojvBAH+TU=; b=jVG6cA3I3JfHZEyGBik6ZJRS4dWa1ZgXi7geSm7MX/l
 UE74qMr54pIbfWG90msZQF4q+TOT0pujoKw7p24xAP8OOG8A5m5rp95wsuAYk/B7
 IdohWu3ADXFbSIu8o/nOL3MrxZQXLY/fPBt1iDP6xVBza4oXEZfOSGZLQyv5/anP
 /vnTfVxRJfpuJNBv30PJs6eo6080PSJz4YKpMH9GbKXHa82YLvb9vlwu1qymkEJH
 g/O1hnB+Nk70wVFJHNKTrnhw2KohS5YVonnajRaUoSvGM31z20RqBeGWv9P+l1CB
 M4YlSIUQ42Rhs8gfG4Wmwlj8jAftht8G11UtqD03QlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ML1ubG
 rfXdP9+8RxD5dDZ5fTX5UK6gK+w1ojvBAH+TU=; b=llBHUyuNzjVtvtQsdg6mPt
 3m9Vxd1VlV6aPiQoaeMWJ4JTy9DGzanENheog8d4u9mampKra4XLltFTk54h8PaP
 V3OnR3vA/3TMclMQwlYo39vF9rRRcRVs+gHPK86xqXjEEU+B9J1HGARh1MyJ6C83
 rY3xwLwt526SoJ/lR0zqBs00HkYB4mcrvwGeVYGwaae+58LW5fXMkV6ccW2ghkuj
 aEMDsH3Fa5UFIxLpzTGhqN9+qJEbIkX2Eh13dp8FsCjLT7KnEmzZwO7vXK3yqk3R
 6i+oyXo89U6w2XNLcsx2bD4XK4UGuSASb4gigt2yvIpCyOAWE+rOtBiysodIAY1g
 ==
X-ME-Sender: <xms:VE6EYRiCtEn_4mZ53lD_G-hJoAUycjgI7ruAHNcx3UmOGi3YEiUIPQ>
 <xme:VE6EYWAQ05Rd2XDK9LGgj9mcMimTTLDHCbEpnUKb10XgnA_R8RprMTIDDzC3ItojJ
 qogVNSf7tdTIfgeqUI>
X-ME-Received: <xmr:VE6EYRGRdE4SoobamN_bnfBuW7j35qN_v3j9rLPQBO5Mv5-02lLavDdT_xkrfew21x0HEKeFJnBCNuaI32oTRhyBSExSKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeggddugedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepuddufeelueehhfelheejjefgueej
 hefhtdeludefheekudduveekieduudfggeeknecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:VE6EYWR2huCyUevCyR52PvY3nViUZgOs7jlIgGKXo2cl5HXUoD7cOA>
 <xmx:VE6EYewEEoCwKrI4wU5WN9u8w8WmfeJiHxilRvoQnS4L20ofnT56kg>
 <xmx:VE6EYc68jmrffSQGEIvUcaOX_7a_V0jFn_NBhr7gNk3ljGzhBo5kqg>
 <xmx:VU6EYZ9DSLr-nepqvmhMCl8dxDkka6MvnOXusJR8hbgHQ3t3W2jxAg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 17:19:16 -0400 (EDT)
Date: Thu, 4 Nov 2021 16:19:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
Message-ID: <YYROU4ar31l9iibj@heinlein>
References: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
 <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
 <YXBPMNi5yzzEtE/R@heinlein>
 <CACWQX83=F77Rh=oGJWRd9SkhqFoik-duLGJdVpaU2E+SBgWXQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Of5np8+W+8Us0x4f"
Content-Disposition: inline
In-Reply-To: <CACWQX83=F77Rh=oGJWRd9SkhqFoik-duLGJdVpaU2E+SBgWXQQ@mail.gmail.com>
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
 Matt Spinler <mspinler@linux.ibm.com>, CS20 CHMa0 <chma0@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Of5np8+W+8Us0x4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 12:39:05PM -0700, Ed Tanous wrote:
> On Wed, Oct 20, 2021 at 10:18 AM Patrick Williams <patrick@stwcx.xyz> wro=
te:
> >
> > On Wed, Oct 20, 2021 at 10:13:06AM -0500, Matt Spinler wrote:
> > > values, and then explicitly emits the IA signal.   Others can chime i=
n,
> > > but I didn't see it as proper D-Bus behavior to emit propertiesChanged
> > > before InterfacesAdded, since in fact no property is changing after t=
he
> > > interface was added.
> >
> > Correct.  PropertiesChanged signals should not show up before Interface=
sAdded.
>=20
> But they should still show up eventually (after the InterfacesAdded),
> right? =20

I'm not positive what you're asking.  Does it happen or should it be done? =
 What
I tried to describe is what correct behavior would look like.

My understanding is that if you don't have a service name, no signals will =
be
emitted.  I don't recall where I've seen that in code before.

If you have a service name, but the object does not have an object manager =
in
the path, then no InterfacesAdded signals will be emitted.  Many processes =
put
this into the root, so this isn't an issue.

PropertiesChanged and InterfacesAdded are independent from a sd_bus perspec=
tive
(and they belong to two different Interfaces anyhow).  If you call
sd_bus_emit_properties_changed before calling sd_bus_emit_interfaces_added =
or
sd_bus_emit_object_added you will still get signals emitted for the propert=
ies
changed (I confirmed this in the systemd repo).

There is no queueing or deferring of the PropertiesChanged signals until af=
ter
the InterfacesAdded.

To me, it does not make any sense to emit signals for PropertiesChanged pri=
or to
actually informing the world that the interface exists via InterfacesAdded.
You'll end up sending out signals for properties which nobody even knows th=
ey
exist anyhow.

It is _also_ a bad idea to send out InterfacesAdded signals before you have
fully constructed and initialized your object.  This can cause other proces=
ses
to act on the property information they received via the InterfacesAdded si=
gnal
but with half-constructed / invalid property state.

> The patchset here seems to be under the impression that
> PropertyChanged is never emitted when the object is added, which seems
> incorrect, or at the very least is a breaking behavioral change.
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/48231

The PropertyChanged signal is only emitted if the property changes *after* =
the
object was fully formed (by sending out its InterfacesAdded).  The
PropertyChanged signals are not queued up from the time the object is first
added until after InterfacesAdded is emitted, which is what it sort of soun=
ded
like you were implying might happen.

I'm not sure why you are saying it is breaking behavioral change, other tha=
n it
might have use to work this way, but that way it use to work didn't make any
sense from a dbus perspective.  This proposed change in bmcweb seems
conceptually reasonable.

--=20
Patrick Williams

--Of5np8+W+8Us0x4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGETlEACgkQqwNHzC0A
wRmBOhAAlv0dkVZZT+7kL/2gKJ40IAw3OE5S/Kfvir/QYDWpJisLYPPUAqY7Xfkr
WeB+x6WJWT5OEMgxELPv9BWiQ01+2RXYUVLqQxnkwI4SXP6PjyokZN0FdfJUE11T
ql76t1DF7/3yZ1eLT9o3OEBbhNcR3qK2umihOoe/eImTsVaLwUhU5wq6zHN5wCcC
+jLDwIbfqCiuZfK4xaiYNkA474kMJjlMcu716CA7zNkimCrYks2x+qYMIBBWbOa0
3iTabpBT3QW5+HXwCMmPhRv2w3yvOBuCCK2oR1kobe1yy0dLCxSEEyvAdoapq3jR
xaX49/6W2FkVlUSgX1620KrtBvAD/r4Jn8vUdqfCt/AX86pPnezueBS5WJ63ZzNQ
54psuis+eVdw3kxCkp6daeqrlnYzh/aSgzS1/GFMvy221oRXKSuZS8o1tIr3Lppj
h5ZiBx17Tp9tebykhZqaXpN1AMI+ujK5DOXzmrSoiKwEA3krYeMF4ZY4WUKpJuIa
/HZp/esloGuBA2xngMpfO91Gq6WvkTSiLYDV5ZUZz7CCPdh7enIvkilUkWEVSXgE
LZKwZh3x5IGht137sGV+00Tk3gZMmhsKGsqGDYuQ7NrCuIUCVqLXQo7AZ2SV2p7y
H41BDgMCFVbkSXEMxXa1p0/woUOcwKayPrsmbLXhC//Q5u8eYDA=
=6PDU
-----END PGP SIGNATURE-----

--Of5np8+W+8Us0x4f--
