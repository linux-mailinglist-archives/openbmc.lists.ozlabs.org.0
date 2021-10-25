Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65258439523
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 13:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdCmr2NJsz2yJ5
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 22:45:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=BcJEWMFZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OOIHSSc1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=BcJEWMFZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OOIHSSc1; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdCmL06Zgz2xYd
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 22:44:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0EB3F58050F;
 Mon, 25 Oct 2021 07:44:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 07:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=EfgIzkERfPtNkpjXx4W8Onx27YZ
 NsbKCVnU/QEQD69Q=; b=BcJEWMFZ3PUwdGExST+GiwpotZ1Yik8P8Sbb89VLI+m
 0FyIfZ1SdJgt4YliW7xpirACHJP8Hy2Peww2NOYq366ZXylEW1MhFEe0vh2D6aLa
 3cqx4NmLuZBWpTXmYgnO+K3gMRfmp5Ih+UlE68q+ads9OHZWf57OOG9GNXSxOzBz
 qdpicmBt4WkPRi27pdmygDcZ7Ac4ndwm0l6y3YBr5ue2WfuzFxktXoU106ceJmkn
 b0cDwru8U0B1ruG2MflngxkQlc1wNKmmj8fiS6n9e/hhOHzTwxxIpGKtABNZ6mXw
 edBtl4cF/qiBbhhYocD7rquIIBZtzn3TwhFcbbai8lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EfgIzk
 ERfPtNkpjXx4W8Onx27YZNsbKCVnU/QEQD69Q=; b=OOIHSSc1Jf+F3U78+RQ98t
 J46dK/cb14H3BhZf5cFCIU4MWce5qGJxH3xfvZv2vgYX4xYaLLS86Oo307UmACLh
 J7xo8QWiu8HNop2PThloBLzx5r+fBVnGW/NUwdr/S9Yg7yBxU2afXQa2P0uFShDW
 rq3VWVn9lmT6KRhoZjfUO8P4Ct5WLtzltaMtb3k5CKiGL60LG0v/Id/De2rDA8Qm
 bmSZEZ5oRPvjWCigO0oT7SXzK4o0+1m0Qz+5kGj014UBj7hY9h2TCF///CKpTZKw
 OfSFk8yCOrpdxz6C+cigfKZqmLWwk/hj8tUlGswmbXP3KMTwA8XY38ewPuPhr9AA
 ==
X-ME-Sender: <xms:m5h2YWBvVAl1g6WgSD0XeO3XazNYZ8lGdWmtaLqSH7UyOIh0CZoRaA>
 <xme:m5h2YQjIeQlNSsp8h_tkV01cB2O9gSDMvKH-3fDcSOBgc5kerxYSIMPRvHTBP8q7o
 Ia1U_sImG-rnzQCC94>
X-ME-Received: <xmr:m5h2YZmzUcEIy_c0QkL7rsvtVBFq4EQJUUD2gCeQ_TOJYaXaL1mfD3-E3X1OlUzac_X0IELrZPvuhCrXuHU_jqe9YPwHlF0DqpHT4vBboXL1Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:m5h2YUxaFDvx8C_3reBOmqISGv-1Oib7jUlaLvE-AY92trSAb62cQQ>
 <xmx:m5h2YbR-HtPMtZixJls4E3N1XQ7rnbrLR7hxrunBuFGgExLydBmTdg>
 <xmx:m5h2YfZGqLBjZTqksjIAtMZ2g1J27Ty6qnwaMXlpV_qGJEstdZ9EDw>
 <xmx:nph2YQBcK85LGbRqtaoqffl2zhJon1C7hxCRt6EZyKY032df1hhh_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 07:44:27 -0400 (EDT)
Date: Mon, 25 Oct 2021 06:44:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXaYmie/CUHnixtX@heinlein>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <20211022020032.26980-5-zev@bewilderbeest.net>
 <YXJeYCFJ5DnBB63R@kroah.com>
 <YXJ3IPPkoLxqXiD3@hatter.bewilderbeest.net>
 <YXJ88eARBE3vU1aA@kroah.com> <YXLWMyleiTFDDZgm@heinlein>
 <YXPOSZPA41f+EUvM@kroah.com>
 <627101ee-7414-57d1-9952-6e023b8db317@gmail.com>
 <YXZLjTvGevAXcidW@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WMSkWp2LRUvE4R2V"
Content-Disposition: inline
In-Reply-To: <YXZLjTvGevAXcidW@kroah.com>
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


--WMSkWp2LRUvE4R2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 08:15:41AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 25, 2021 at 12:38:08AM -0500, Frank Rowand wrote:
> > On 10/23/21 3:56 AM, Greg Kroah-Hartman wrote:
=20
> We have the bind/unbind ability today, from userspace, that can control
> this.  Why not just have Linux grab the device when it boots, and then
> when userspace wants to "give the device up", it writes to "unbind" in
> sysfs, and then when all is done, it writes to the "bind" file and then
> Linux takes back over.
>=20
> Unless for some reason Linux should _not_ grab the device when booting,
> then things get messier, as we have seen in this thread.

This is probably more typical on a BMC than atypical.  The systems often re=
quire
the BMC (running Linux) to be able to reboot independently from the managed=
 host
(running anything).  In the example Zev gave, the BMC rebooting would rip a=
way
the BIOS chip from the running host.

The BMC almost always needs to come up in a "I don't know what could possib=
ly be
going on in the system" state and re-discover where the system was left off.

--=20
Patrick Williams

--WMSkWp2LRUvE4R2V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF2mJgACgkQqwNHzC0A
wRmJPBAAoNL9YeFVlTkyknrYGSwY85ZsAwF7xpzpe7Nbgmp3MqcreyEnyh8esoB/
+6A0VSL9H0GmJw9y42l73Z/xpCB3rUhL2n/wxkJrjPVegvBMhmo+e90yCQWdAJUV
Ymjp9IbYdKZ7P221L6NeHKUf/Abf0sSgTf15heDzPV7kArCqLy+NmIcETU+evWc/
aP0ViL7mm16HWarwIUsANMc6wGRdpKfpd0rFjhqbQODpH9Y5L/QlltN/wTOf9C1L
nI8UZREc4/T4Nvo07a6idJ4/VjyV54Bk7DfOo1HWGBrUkb9oNzWj2LNNKIb8feYD
+bPu1m7fy/9xI/FQ7PdH1+pg4b1WtTUXQmis5Ilz6oShB8Fi1W7Ci4jHAtaotQ0t
7ZJzCK4uQK8YwU8K8SXFpZPKpYFyZb5k/tUn5CApqup3khzanNxdhCU5pc/kQWU5
70OujLBbi1BLzA9s23hpBU/DXmy4uR/neWC8pwVExGQHp2gEzjA5A1dWTKiBJpjE
2Rv4w6fHyq/deLS0SaQfb3MTiNvIBqu3sNseAhDC5zafIlUntCEDjxdGzTJZSiIR
GHIcXTP7/Zm4RrdYBkP1NQU8W6Ya8HOfETvH/e4Ml8WLhfoyO2UL+weD9ICR8HAV
MqSnKA06xb3wl48+ITunDfcbxeB3KoH8NJb+rZQIX/qAQCp6Liw=
=Gvsf
-----END PGP SIGNATURE-----

--WMSkWp2LRUvE4R2V--
