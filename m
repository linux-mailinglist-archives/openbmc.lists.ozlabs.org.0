Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D90439765
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 15:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdFvD1zTxz2yNG
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 00:20:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=bJolnp7Y;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=PQwv4wzc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=bJolnp7Y; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=PQwv4wzc; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdFtk5STbz2xY6
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 00:20:13 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 08F7D580571;
 Mon, 25 Oct 2021 09:20:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 09:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=rOeGD7a5iJXgcSU4RpNH06SfRz+
 WF+JeakPDiY4K90A=; b=bJolnp7Yx+sgYjFOKpPJosObmpUcAyzXPZ1t4JciNVY
 MGGBIfg+urDV3ZCWgvrOBdD21CQNLVhh+jUqI1ZrLbJJKzTK6dSoQ23Exgg9b+Cz
 catmuS2kyUohmH8xYN7wvYgWypKkcmoa6/tj9zq+16iM458HK8HorsCH5vMZGbGz
 Ek1XePVkrPuTqco19E5coWOwiX6dCOZklZJfpNZ2U/Z0XrimFn6rDQUgl1p7/7kH
 pUVw7m1NVMTutufkRhpVxxbYqvhHqm/Lb5leXteCQpf6YIN2sIliVl93s6BHnvmr
 5DcwmtVuGI1/tLq5FlIkiTHbzP8mHYfjZqXvAUrsAig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rOeGD7
 a5iJXgcSU4RpNH06SfRz+WF+JeakPDiY4K90A=; b=PQwv4wzc3KEsYUqSwJ5i+z
 fJmk+/sOcY6wxVUONUkZadm2RDMRJ/Lzk/2yRCUbtPZ1h3FfnE6Xr23glUp388kA
 66CDqXfUlO081TsYIQO23jbkrOkc5nD+wPhjLXMXjB0+wiUU1sf8daBdE1SW+LED
 By1qyli5NfsJHHufdpBH75BY7Wc9f+vmmPAgXJu/j9kpGlNGmyzIL2Baj2/vhp2u
 mYfrykIcVgaf6o7/OttF/RcCcUM571DXXxOn3hycR4v4keWol/YLxT9x5MYBHpWV
 ztCn8JEjNnkSDWFqxcnYAaj9+RhAt7ROJQMIwAsNC2wCJtCtJUv0BgQk+9WyQJ2w
 ==
X-ME-Sender: <xms:B692YR0llEZfy1yegofu_pgtZZJXy6iMgyhQpFK1FKGpcWE4Ld610w>
 <xme:B692YYH3HcsPdYqYE6Wb_n63NMr-W2TpNi4kr7wEb5y7CIlRGi65Zx4-cajYbxuYO
 XdUuoIKVTDWevUbH6c>
X-ME-Received: <xmr:B692YR6gbGiKkX6meUUTmBdsuJqqWzZMYh1zgK1Zfejb7KLyIqmH2rQuVrM9Zprv_KTExvFaqvHxCHB2vZpmZR5wdBhaJdZh4UgO4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:B692Ye2MpvI22-5aWaCKFI_8Rvn_zwr96zqsHtg5L3DNqfZPmEk5Dg>
 <xmx:B692YUGzRqBeWnGZ96imokrERBcpmt6AUiGyATj4ZGoBGQFO3M4WZg>
 <xmx:B692Yf9U-eEE-lRdD-iWEK1VjyhWtnLXqmZYzQS6NOK-fpyofzqsGw>
 <xmx:Ca92Yfm7oaJIWz7IwedIKsPhL5j6wjObj9oqD6sW7ETHnvFEjhNqRw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 09:20:06 -0400 (EDT)
Date: Mon, 25 Oct 2021 08:20:05 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXavBWTNYsufqj8u@heinlein>
References: <20211022020032.26980-5-zev@bewilderbeest.net>
 <YXJeYCFJ5DnBB63R@kroah.com>
 <YXJ3IPPkoLxqXiD3@hatter.bewilderbeest.net>
 <YXJ88eARBE3vU1aA@kroah.com> <YXLWMyleiTFDDZgm@heinlein>
 <YXPOSZPA41f+EUvM@kroah.com>
 <627101ee-7414-57d1-9952-6e023b8db317@gmail.com>
 <YXZLjTvGevAXcidW@kroah.com> <YXaYmie/CUHnixtX@heinlein>
 <YXap8V/jMM3Ksj7x@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="190gZ0lVdnV/mRoG"
Content-Disposition: inline
In-Reply-To: <YXap8V/jMM3Ksj7x@smile.fi.intel.com>
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
 Thomas Gleixner <tglx@linutronix.de>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--190gZ0lVdnV/mRoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 03:58:25PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 25, 2021 at 06:44:26AM -0500, Patrick Williams wrote:
> > On Mon, Oct 25, 2021 at 08:15:41AM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Oct 25, 2021 at 12:38:08AM -0500, Frank Rowand wrote:
> > > > On 10/23/21 3:56 AM, Greg Kroah-Hartman wrote:
> > =20
> > > We have the bind/unbind ability today, from userspace, that can contr=
ol
> > > this.  Why not just have Linux grab the device when it boots, and then
> > > when userspace wants to "give the device up", it writes to "unbind" in
> > > sysfs, and then when all is done, it writes to the "bind" file and th=
en
> > > Linux takes back over.
> > >=20
> > > Unless for some reason Linux should _not_ grab the device when bootin=
g,
> > > then things get messier, as we have seen in this thread.
> >=20
> > This is probably more typical on a BMC than atypical.  The systems ofte=
n require
> > the BMC (running Linux) to be able to reboot independently from the man=
aged host
> > (running anything).  In the example Zev gave, the BMC rebooting would r=
ip away
> > the BIOS chip from the running host.
> >=20
> > The BMC almost always needs to come up in a "I don't know what could po=
ssibly be
> > going on in the system" state and re-discover where the system was left=
 off.
>=20
> Isn't it an architectural issue then?

I'm not sure what "it" you are referring to here.

I was trying to explain why starting in "bind" state is not a good idea for=
 a
BMC in most of these cases where we want to be able to dynamically add a de=
vice.


--=20
Patrick Williams

--190gZ0lVdnV/mRoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF2rwMACgkQqwNHzC0A
wRk9Jw//e7gf0atu+Jk54NpG8wRJo875a0T6uIfxMH3+j8JgwRu5aEeH4Z4V02pk
s2Zwvy4l6o0lIcgLCAWYQfpmV5E6vNBSn1ymXNW0RpY7ZhheqKKi2FFDuJwxgIgE
j+IZUGzSXYD5Ttwf/FPG98BX7/cdlJGsvoMpjrQoegPC8e6CYVnOpkGF0rjZJSid
DXopkEnAhkRURQlh46yH1j83UZOFxDfOY3KP7XLcc4aPYBYm+y76WbZQON8aNdZG
o1uOYbSKxaZ+z6ZDyPWD1GA46ZrpYpEUeTypmW9a1g9d6ot45oK6I9lp+qRGwWoy
4spswa4MMv6BqcYnw/iXLpFQOi8h/7XO49yuF/O6Bu3b9xOvvfduxGWMervBarbs
q+SDU1k6U23uLlp40hmTzmFxdnH4YlB1/vLdP5aIsaVsWzyzYIh1AP3aIHmPFpwI
DRPQ3WZu792khszBv/SNDkGuO3SJpgXYT+eakB1TofbkBaPtbjK88wmfs5rh1kyW
QUrQUpQIuUDmhzyb8ELGFWb4/cWHYiKKyKV6+ynKXhzdXLGUQxslR1uM687DJxcI
gmhK+d2uLQh+UHRDyZqH28oUmfpc0V5TukpV2PkBi0Nm9K6X6baYNsnAOwLAB5ya
5F81+hR5s1AQFaGPxqQzTSsbh33SjZyXG/5kMtLr2xnaHAToxrQ=
=r9se
-----END PGP SIGNATURE-----

--190gZ0lVdnV/mRoG--
