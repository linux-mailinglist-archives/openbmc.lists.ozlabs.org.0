Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374104379C0
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 17:18:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbSft6b6qz3c9w
	for <lists+openbmc@lfdr.de>; Sat, 23 Oct 2021 02:18:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=qm/JHEjU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ODoNLg6b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=qm/JHEjU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ODoNLg6b; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbSfP1jBTz3bj5
 for <openbmc@lists.ozlabs.org>; Sat, 23 Oct 2021 02:18:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 66D0C580F92;
 Fri, 22 Oct 2021 11:18:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 22 Oct 2021 11:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=46YpM5jZKwd3mcnLxsPVqOmlYwf
 lxCO4p2fiY1KoOPc=; b=qm/JHEjUR81ScgvglY9ndyrWS6meTUz02OeqaWeuwnV
 OkvwFVjW753vqgVHwr+I7OhJFw1cJfhfxlXXHEZA1I3RqDQ4tWjSZ/KlP3IYrvL0
 DhrpBbN43xHgOaLUMJZJ0KuzMu+1fEEfTEsxbTqF7FaeyDyhTZQykIWjrUNSNGsi
 uT4eqrJqDCpp6eFFpZLfBgwDAjZP5dfZhc0bJjgFC6dd8iUWmiYnKoe7178zU2qu
 AG+l8dA1GcdlOAML1P8inXgr9ERXBCkHQGZ/6xCBd0shOkTY/7UQgld470E2Sthm
 ui0lZ6XpYyrGFwS10FcCiQc9TKhxRpuKtn146Sp7MUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=46YpM5
 jZKwd3mcnLxsPVqOmlYwflxCO4p2fiY1KoOPc=; b=ODoNLg6b9DxvKZ9suUSYH6
 ibbkhO6J/bGRvsG2yv16q0+2KVopWvljS4+tT9yMqnb9aC2M7FVOqVuzMwi6DV4w
 TYC4Gp/ORsQGrXg/Bx35p7J+SvPOBT/84L/GRvNabaIRP+cr3IDLB7HOV+R5SdTA
 mSgcSov7Yc5r/dPNI3VIWe/I7caf2GraW1ukuxXF0alogK1ev4t4rZbDVbWNJEOA
 frUsW+rLtY4rrheFi195Oav+vi68tM+LU2KSKKkjAbAZfd/PUKEdxNGtruwzZPRn
 /HnDPeB/bWdUU1AS31twbQCi1oqH1TQwhdUVCuPuJt3zeuqZRSWsc1MslNArO6bQ
 ==
X-ME-Sender: <xms:NdZyYRpgEAo76-yfnDAaM3pmvgYYvRy5uQZRPPwY7hxaAdC1BfhxFw>
 <xme:NdZyYTpjPmsAr-sXeGewqzvH3VcwRoQ-JkWIOUfyqVqW1OhExH8m6UUhyWwt93IXY
 zZFW4t_5T5tY6_joMs>
X-ME-Received: <xmr:NdZyYeOzjnNtXiGBb9iTlhifuZm69WxhizsDdtS7DK7kB1X74WcFtrRTV2kgVgXa6tNAJ1C9qLzSAYfy9X6ZGBv--bzWSHZ5w6OAAumuAgBo7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvkedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtroertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeeikedvjeejheetgeeggeefgeff
 teeugfegtddvudeggfeugfefjedvuedvveevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:NdZyYc71h11aRVJBMGfw2EO0jp91Y2LEb_hdTyTUPjoScQgPUwAZHA>
 <xmx:NdZyYQ6B5nPy8TxGZY_MeQw4V0VyxFBsCDKZHYicXG6WSJGUG2ZCoQ>
 <xmx:NdZyYUgj5g6TZgOd_k22lZJCcLgfLGG_GyhOP924D2D0nfpbD18H_g>
 <xmx:NtZyYTJ4p4_qR52E2TPgLiaZIzg_pp3dv1yxYjVH1RdCC9E6t3S5IQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Oct 2021 11:18:12 -0400 (EDT)
Date: Fri, 22 Oct 2021 10:18:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXLWMyleiTFDDZgm@heinlein>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <20211022020032.26980-5-zev@bewilderbeest.net>
 <YXJeYCFJ5DnBB63R@kroah.com>
 <YXJ3IPPkoLxqXiD3@hatter.bewilderbeest.net>
 <YXJ88eARBE3vU1aA@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="70daKchr0JYsGAyF"
Content-Disposition: inline
In-Reply-To: <YXJ88eARBE3vU1aA@kroah.com>
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


--70daKchr0JYsGAyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Fri, Oct 22, 2021 at 10:57:21AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 22, 2021 at 01:32:32AM -0700, Zev Weiss wrote:
> > On Thu, Oct 21, 2021 at 11:46:56PM PDT, Greg Kroah-Hartman wrote:
> > > On Thu, Oct 21, 2021 at 07:00:31PM -0700, Zev Weiss wrote:

> > So we want the kernel to be aware of the device's existence (so that we
> > *can* bind a driver to it when needed), but we don't want it touching t=
he
> > device unless we really ask for it.
> >=20
> > Does that help clarify the motivation for wanting this functionality?
>=20
> Sure, then just do this type of thing in the driver itself.  Do not have
> any matching "ids" for this hardware it so that the bus will never call
> the probe function for this hardware _until_ a manual write happens to
> the driver's "bind" sysfs file.

It sounds like you're suggesting a change to one particular driver to satis=
fy
this one particular case (and maybe I'm just not understanding your suggest=
ion).
For a BMC, this is a pretty regular situation and not just as one-off as Ze=
v's
example.

Another good example is where a system can have optional riser cards with a
whole tree of devices that might be on that riser card (and there might be
different variants of a riser card that could go in the same slot).  Usually
there is an EEPROM of some sort at a well-known address that can be parsed =
to
identify which kind of riser card it is and then the appropriate sub-device=
s can
be enumerated.  That EEPROM parsing is something that is currently done in
userspace due to the complexity and often vendor-specific nature of it.

Many of these devices require quite a bit more configuration information th=
an
can be passed along a `bind` call.  I believe it has been suggested previou=
sly
that this riser-card scenario could also be solved with dynamic loading of =
DT
snippets, but that support seems simple pretty far from being merged.

--=20
Patrick Williams

--70daKchr0JYsGAyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFy1jEACgkQqwNHzC0A
wRkFhg/9HGu2uiFP02YyeOYntJIcOruf1o1SzGDkH/cH9bsS/NmFUA76UFa42pJp
O1Dkn1yXtjNdENw9UL7RU3kmCWHaEP2nBxP3F+3Gt/9uYZIxArNWBQUGMjELC+dn
6wfQXoRPwPX+/Tzug7WAgwqsWP9KvdIzvIYf1GfKSlZGXxa2uuwJb4QFTLirrmiK
zFn78+EB+4qSZEl3KucpA4UahfCobnPcz7a51DP2XSn70Qq2kTZfxn3Pjd4tYtAg
N0YqDe32NnYHX1jAh/g/QXLv4BCOHh4x8IDWBaekoZ9dSg9CctAjct8L7+HxbdV6
HWFwlDFm2GvLtv71WyKGqxRaeFfp2+BSZaedQXLM/1t3xY8lD3HOG0yFUxCweXZ9
yFXrlql9NQ+KkoML3LbO+NUrzk3Iz3cJxSQ7s0G6/N57fI/dUsHVihJfABroBPhF
xNFYGEsADyvcLFygWXCG3Z/hNa5RgJOhSxrijXTTimUmJg0/TZePrLGJQ6Iikehp
D+5v6DOh/Itq/CaXhjpwitloV1yxQGnEM+72cIb7pjkjTqsuKXQwy8Gq4XQzXHLX
YV9NM7xESn7QUuuED4KprEEKYMVu5vIFDNhgifBXd48GTEr1Ga8BbFDVfoUcPuya
oQ707lRUwbiNx344LTJqBm/cotib5i5rIaMQAIAZtUecxdzQ9tk=
=/Hnz
-----END PGP SIGNATURE-----

--70daKchr0JYsGAyF--
