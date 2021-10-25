Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96680439AE7
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 17:54:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdKKD43sMz2xy3
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 02:54:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=uIEKyAdu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ezLem8TP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=uIEKyAdu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ezLem8TP; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdKJk5jYGz2xDZ
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 02:54:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2AFED580565;
 Mon, 25 Oct 2021 11:54:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=7Lt0k6A2AQYTvM69ey9mLazpSHP
 whVPhfDQe2pFO0n8=; b=uIEKyAdugpjJCTJJB3D18APBAQv66TGIg9cS2eIkPOl
 Vj9Nr8TyKEz/W5Av7vkFU7LaOKqWltfZCoBwGB8F9Heba/tAcT4qxrngHy0SGTjf
 D0zOA0/sFuzEvXlcJzPqgSypzGHuSOOoWWXIxo43R+DGO3vADojj1J/jNP0m3Y/w
 a7VDivJmM0pjR+L2wBREXDY4zT4nBskt6unfB5lBpicLr+viN1tXFLP+L3k4tb9w
 2li4uS+L4Kqg+tGAwAe/tiRfztTAlqKpOQbl0+mNVgkR/KH7+meYMrJyjn/4MOtY
 c2nUYLy6pwAK2cmWyFsBklolFrDiPVHCjBCuV75oJGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7Lt0k6
 A2AQYTvM69ey9mLazpSHPwhVPhfDQe2pFO0n8=; b=ezLem8TPwEbDCt5ng2Xr/0
 dmUsypkC5C34MDkGAzg6JqbVKWmoQyYWAgd+T4RScIi2bXt1N19dlx4Sd81Q2aGr
 ++8ltY6ilo6QZSoKV9pHVP6Jq97G9R4+IxcnVGhuCAPACeUseLz8it6XgmLu4Gjk
 O6xmlYl7GwPMmQf0M/oraqRcI2j6DBn/jGcWzYhLyJqjGcIxGO0KSAAqd44p+9fO
 fbaGqmyx7EHJa90bIun41mOpYJRwGJH0h3sCbkN4bRH2fGRetDHc1yvTdmt9qK+R
 +1T7O41wIp9Yv8SJdTcYIuueD2YnEfdqG5QiC+LQoNuFHICRWQFVhfZRLC55rfPw
 ==
X-ME-Sender: <xms:L9N2YUdZoc0rilMIpO1zGrBp7s2cVY0sjegSK1tTEqxzR527YnC6EA>
 <xme:L9N2YWPpUqv8V4RHkPyfV9pBe1QRQCyZ9V0lZg8JjtHvh2TxXgoquQlkVgjr4DyDP
 E2MHd7xt-jjQ_9Tovc>
X-ME-Received: <xmr:L9N2YVipoGj-TpshW2OlKqzsXX3G3ykDSUESUQrXz9KS1UwtUE6I5jUfHMykWdcCEZ1ETGRMwZszRdF1mRptx3uQOvrIFDlLT2uvtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:L9N2YZ-WkJYYSvoGRwmsT_6SPbiVf54pcrDuZ8_Q68-82Kit0JSTxw>
 <xmx:L9N2YQvAuvsmC00aBxXrwp_GYY1jVEna8xMqB5JV4n2HFqAQheQ8Ow>
 <xmx:L9N2YQFDGAwX1xqqm_78qJ0gyMqC6X7sQUPNgA7zdCIk-YwA8RDyIQ>
 <xmx:MdN2YdtGbwICmM5LUx98Jfs2-Lp5COgjISeC2vqKoby7uurvRn0KaA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:54:22 -0400 (EDT)
Date: Mon, 25 Oct 2021 10:54:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
Message-ID: <YXbTLYzHadphE5ZN@heinlein>
References: <YXLWMyleiTFDDZgm@heinlein> <YXPOSZPA41f+EUvM@kroah.com>
 <627101ee-7414-57d1-9952-6e023b8db317@gmail.com>
 <YXZLjTvGevAXcidW@kroah.com> <YXaYmie/CUHnixtX@heinlein>
 <YXap8V/jMM3Ksj7x@smile.fi.intel.com> <YXavBWTNYsufqj8u@heinlein>
 <YXayTeJiQvpRutU0@kroah.com> <YXa5AExKg+k0MmHV@heinlein>
 <YXa6t/ifxZGGSCNj@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IBKYz2UKeI4sOQXI"
Content-Disposition: inline
In-Reply-To: <YXa6t/ifxZGGSCNj@kroah.com>
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


--IBKYz2UKeI4sOQXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 04:09:59PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 25, 2021 at 09:02:40AM -0500, Patrick Williams wrote:
> > On Mon, Oct 25, 2021 at 03:34:05PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Oct 25, 2021 at 08:20:05AM -0500, Patrick Williams wrote:
> > > I think "it" is "something needs to be the moderator between the two
> > > operating systems".  What is the external entity that handles the
> > > switching between the two?
> >=20
> > Ah, ok.
> >=20
> > Those usually end up being system / device specific.  In the case of th=
e BIOS
> > flash, most designs I've seen use a SPI mux between the BMC and the host
> > processor or IO hub (PCH on Xeons).  The BMC has a GPIO to control the =
mux.
> >=20
> > As far as state, the BMC on start-up will go through a set of discovery=
 code to
> > figure out where it left the system prior to getting reset.  That invol=
ves
> > looking at the power subsystem and usually doing some kind of query to =
the host
> > to see if it is alive.  These queries are mostly system / host-processo=
r design
> > specific.  I've seen anything from an IPMI/IPMB message alert from the =
BMC to
> > the BIOS to ask "are you alive" to reading host processor state over JT=
AG to
> > figure out if the processors are "making progress".
>=20
> But which processor is "in control" here over the hardware? =20

The BMC.  It owns the GPIO that controls the SPI mux. =20

But, the BMC is responsible for doing all operations in a way that doesn't =
mess
up the running host processor(s).  Pulling away the SPI flash containing the
BIOS code at an incorrect time might do that.

> What method
> is used to pass the device from one CPU to another from a logical point
> of view? =20

The state of the server as a whole is determined and maintained by the BMC.=
  I'm
simplifying here a bit but the operation "turn on the host processors" impl=
ies
"the host processors will access the BIOS" so the BMC must ensure "SPI mux =
is
switched towards the host" before "turn on the host processors".

> Sounds like it is another driver that needs to handle all of
> this, so why not have that be the one that adds/removes the devices
> under control here?

If what you're describing is moving all of the state control logic into the
kernel, I don't think that is feasible.  For some systems it would mean mov=
ing
yet another entire IPMI stack into the kernel tree.  On others it might be
somewhat simpler, but it is still a good amount of code.  We could probably
write up more details on the scope of this.

If what you're describing is a small driver, similar to the board support
drivers that were used before the device tree, that instantiates subordinate
devices it doesn't seem like an unreasonable alternative to DT overlays to =
me
(for whatever my limited kernel contribution experience counts for).

--=20
Patrick Williams

--IBKYz2UKeI4sOQXI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF20ysACgkQqwNHzC0A
wRllog//fo/4DsHCATlBG2JbJ+kty/4DMaxw9s4LPzxMRjzAcpUNlU4aZU0MCE8I
OscYTGpzhNhtddtAWjgJpLWLIokDJfdQ+K/fj/c/gV6lFgBzdRB8V3i4WKCnxb+s
1GZpKmb+f5AKRLz83jRe9bx8X4lBafvlt1Riwmz4wywVqrzKcB9wJDQHmM90hsCI
XgJ82cdNBTYzw+tYl534zZiAU4qn6kq1+5oVi5qeCGMylF9dcZhnWdtyxSWNagSk
FbcmxLztkVEuzxI0GWoJsUc8fKL/bJPCwIJzIs+/+mdwd5iINh3TFZ0Ik3SM/6+V
3GvaXafAyTrSFHwbd7BFdljgrnvteE81XLd8X+VHP3GZ/T2yFNRY381KuXMmC0ti
X11xR+nNYVRtTrqZmmUPQ/FyQ2z6A30SzSdMav2y15SAVyoYY6KxU4/k+amxACzS
n06PV7i+2LLGwl83I1vqzdLS7dTdXj0dyyP/EzxG1OSS65FnJ1F6GItJq4BAcDQL
VhMVCegClPqjHUaKQsNRZLW6c0lfZJeVJG8Cl82TLPXb7eSAMT7OS0BG4pCnX+6L
csbREZYtI3j9QSzEkeM14dAS322I3iiQPpubwSwHMn8OOG4mFj9K3paoEQXsG0yF
C2bUFdioZUpiLRvmwFhkrOUOOavOjxRit7hIsDOSvCrUue4rKl8=
=VXwf
-----END PGP SIGNATURE-----

--IBKYz2UKeI4sOQXI--
