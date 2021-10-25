Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF62543980B
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 16:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdGrC4c8Lz2yPp
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 01:03:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=MsqHVKYy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=H162o6ep;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=MsqHVKYy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=H162o6ep; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdGqq0yPYz2xX2
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 01:02:46 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5A360580533;
 Mon, 25 Oct 2021 10:02:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 25 Oct 2021 10:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=O6Np07LYkZtpx8/b2Te8NTLkiKk
 VX2DZfHpr39ip9Jo=; b=MsqHVKYy1WAnwZ/e+pNN5dj1T2Lq1ngAHAiRd1yBBkt
 t5vPgfG4f7JIkRTGfhmkR4g9tvM27H675x/ftgn6aJTCQ2a39OsUhhUQYkSHYyDd
 bbMAfLAHekPFqPYv+rD4sg5zm0xzu97sQp4F7oXUhpBYoLu8/5lxQl2E58fwhtk/
 xPdURmuLE/oO0om/LB47rpbjjrEx7/F492oGODWQtPgiv8BnxoHCVAbVzRnQTgD/
 M+J5qfQYuoN8hR3+VwMIumcE4I1KGDn0iBzcbFK8Ko2AgiHZNZwNECNMLUjaHgeB
 0UYzP5trnADbf6eYd0+wuIC4cl+AF2z+XZ/+kL39nEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=O6Np07
 LYkZtpx8/b2Te8NTLkiKkVX2DZfHpr39ip9Jo=; b=H162o6epW7+NZUqB1LuU5E
 0j/x+8H/78SJ7bfvRDULdowqpkv3zbdEDzLF2J8z5YhGZWdSJtm68YUtNfsST+i0
 GbgBJs8U6LDXSgT6suua4tAqKQpUMDAv1KoM+mZtp9an0iciVY4wIJFrX9VtsF91
 TwTLfW8zY1Qszaz3ltiDigKqggEry2j3c1RKM75h1lZkTmaSrozrqdh6g+fBsWws
 DIeXnONVG2GGg8tcTX4fs01ODzE5xvRpaGbPuBDnQNgXiM+1Ixh5S+RwPkmJAv6/
 3xVDpfFigtbXWC0zdQu8fKbwEFVzqBfNysHkcJVkjfTkdQ9zhqNW49ypGmnYPNlA
 ==
X-ME-Sender: <xms:A7l2YepV5VZDfrRXe7spLHLIETP_giextEE0CBE24deAQ1j90L__og>
 <xme:A7l2Ycrsg3I7drR1lVNa1ofoF9TRnkwe3Ej-6mr47KBe9BlBYe3-b15CLUy_K2bjH
 X9djIO0DnoMDqXWUHc>
X-ME-Received: <xmr:A7l2YTOmgbY0TfAk6WUEXqEaQWrhSIFZZ_CYmkw1kBUr9kPyhJslZz3Xha7cM58vewbeDPEfthBbYi44ynE68h167Dg8Adsdrwt0yIYaASB05g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:A7l2Yd4BbebMsQfd7QZLHrIzv1MyMurZKecxTNFjw9u69k79Cvy-8A>
 <xmx:A7l2Yd4DA4Uj3BJccmrzciUG2FM6ybKEpWv0N_jwIV7yYnGUOXoqYQ>
 <xmx:A7l2Ydi1UO1yUur97b541jocm2oJk0i6W0CyTstF2NypR5xuiVYtbw>
 <xmx:BLl2YcIJwaJgxwLeGikGlPMLIsEHM0gnjujr08o-BS9-rvBQ5ken7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:02:42 -0400 (EDT)
Date: Mon, 25 Oct 2021 09:02:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXa5AExKg+k0MmHV@heinlein>
References: <YXJ3IPPkoLxqXiD3@hatter.bewilderbeest.net>
 <YXJ88eARBE3vU1aA@kroah.com> <YXLWMyleiTFDDZgm@heinlein>
 <YXPOSZPA41f+EUvM@kroah.com>
 <627101ee-7414-57d1-9952-6e023b8db317@gmail.com>
 <YXZLjTvGevAXcidW@kroah.com> <YXaYmie/CUHnixtX@heinlein>
 <YXap8V/jMM3Ksj7x@smile.fi.intel.com> <YXavBWTNYsufqj8u@heinlein>
 <YXayTeJiQvpRutU0@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Cj4fc/vm/r+op96T"
Content-Disposition: inline
In-Reply-To: <YXayTeJiQvpRutU0@kroah.com>
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
Cc: Zev Weiss <zev@bewilderbeest.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Rajat Jain <rajatja@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Jianxiong Gao <jxgao@google.com>, Dave Jiang <dave.jiang@intel.com>,
 kvm@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Cj4fc/vm/r+op96T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 03:34:05PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 25, 2021 at 08:20:05AM -0500, Patrick Williams wrote:
> > On Mon, Oct 25, 2021 at 03:58:25PM +0300, Andy Shevchenko wrote:
> > > On Mon, Oct 25, 2021 at 06:44:26AM -0500, Patrick Williams wrote:
> > > > On Mon, Oct 25, 2021 at 08:15:41AM +0200, Greg Kroah-Hartman wrote:
> > > > > On Mon, Oct 25, 2021 at 12:38:08AM -0500, Frank Rowand wrote:
> > > > > > On 10/23/21 3:56 AM, Greg Kroah-Hartman wrote:
> > > > =20
> > > > > We have the bind/unbind ability today, from userspace, that can c=
ontrol
> > > > > this.  Why not just have Linux grab the device when it boots, and=
 then
> > > > > when userspace wants to "give the device up", it writes to "unbin=
d" in
> > > > > sysfs, and then when all is done, it writes to the "bind" file an=
d then
> > > > > Linux takes back over.
> > > > >=20
> > > > > Unless for some reason Linux should _not_ grab the device when bo=
oting,
> > > > > then things get messier, as we have seen in this thread.
> > > >=20
> > > > This is probably more typical on a BMC than atypical.  The systems =
often require
> > > > the BMC (running Linux) to be able to reboot independently from the=
 managed host
> > > > (running anything).  In the example Zev gave, the BMC rebooting wou=
ld rip away
> > > > the BIOS chip from the running host.
> > > >=20
> > > > The BMC almost always needs to come up in a "I don't know what coul=
d possibly be
> > > > going on in the system" state and re-discover where the system was =
left off.
> > >=20
> > > Isn't it an architectural issue then?
> >=20
> > I'm not sure what "it" you are referring to here.
> >=20
> > I was trying to explain why starting in "bind" state is not a good idea=
 for a
> > BMC in most of these cases where we want to be able to dynamically add =
a device.
>=20
> I think "it" is "something needs to be the moderator between the two
> operating systems".  What is the external entity that handles the
> switching between the two?

Ah, ok.

Those usually end up being system / device specific.  In the case of the BI=
OS
flash, most designs I've seen use a SPI mux between the BMC and the host
processor or IO hub (PCH on Xeons).  The BMC has a GPIO to control the mux.

As far as state, the BMC on start-up will go through a set of discovery cod=
e to
figure out where it left the system prior to getting reset.  That involves
looking at the power subsystem and usually doing some kind of query to the =
host
to see if it is alive.  These queries are mostly system / host-processor de=
sign
specific.  I've seen anything from an IPMI/IPMB message alert from the BMC =
to
the BIOS to ask "are you alive" to reading host processor state over JTAG to
figure out if the processors are "making progress".

--=20
Patrick Williams

--Cj4fc/vm/r+op96T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF2uP4ACgkQqwNHzC0A
wRn2MQ/+IbWA2k0pqRbmsaz95jJj6QR4JWyOn//T7Ij+0GUqzRAjI79orT7opNkA
sMhniF8v7xDUEGual2v2hEBoxtJxom3R8RgC0sQuxRFhmxdJlXCZZRqw4a42YNZN
3ZspVBl3p7m9E3q9e8oI2yWP3RNJHErMhQJmIsw3osURrtSFCk5xdFkUMEXmzpou
OFIxkcbKtLgi7TJ7/i9c3ubm3CExijLeUqAYr+BZHox727nQfc0ni30+KZYaTjof
qZ6fUj890s6G9u9w1NTW+z8wzYZLhhQlB44WYBL4Ax46713+TmZnhhym5k0aD9Fh
bh6jyfJRI7cuxXInS/uCIAqTipaI3TsNCglHZSSoLJ2E+4pLQXc/eRNRVr6Urmor
Ut+Xv6tm9QEW4MkoTn4EpN1xTkmhczRYI6FRTal7QC0rRgOn6LN+V8UM57cmig7O
L/wX0eUjUT7qLjmv0zReTGpjgvU1KzYr7J5riCZJuuwosvJU10sJfPaRlNR3NJ7x
BPd+5vYifZsODphSc5IQojlCGwnTVrsbqsYWpb42ik+nLpCdfGiFYBvLCkmIfmWa
FD+IMGh+V7Bt+DatdxLmEFTvIzEb4UrNM5+1PM/1UynD3NvJVUDbEKMlszRHKl6u
/L+NyvjwozFI7/57T1YSk0DZPNSl7mazsNuL8UC3BXgixfw86wI=
=z+8H
-----END PGP SIGNATURE-----

--Cj4fc/vm/r+op96T--
