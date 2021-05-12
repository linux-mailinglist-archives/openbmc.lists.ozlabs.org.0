Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8237D44D
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 22:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgRYR385fz301t
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 06:42:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=EdgJ7U1A;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I/oC7Wp/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=EdgJ7U1A; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=I/oC7Wp/; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgRY80hBBz2xYk
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 06:42:04 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 147785C0056;
 Wed, 12 May 2021 16:42:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 12 May 2021 16:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=MkLSd5IoS9hC1syBQbL7a/R7f+J
 gW7WWGjptHatwhvQ=; b=EdgJ7U1A2scAPvfW3ZnpiHymh4W5j8AE8JABihmt9rG
 jnxYX4wZNztwcqZMU3CzyLWvmmMOxTohyp8eweTeaUWs48NRsZQtzlz/H7zPOQ0q
 r0zcNfrkFNgnVgPMQoJor5o6yhAIly+BTm6XiAQIpkqDizxyST62fVyOKF3XqIs9
 fj66rTekTFLuwJ21d1GufLg2fXbzb0zmqeLChFhODIC2gdYlI9mBPpzgK+JWqN1C
 umckea79Nf/dWSYePqBKdptBsHdiXknD4peSSFB0/mqIEgMG3eedFlPhJu9lnDrT
 hlqv1AlVNBlf85NEFax384igof4AOGoFrI912F1dYIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MkLSd5
 IoS9hC1syBQbL7a/R7f+JgW7WWGjptHatwhvQ=; b=I/oC7Wp/ZphVDZW9z4cf+Y
 DKsy5XbTKfh8gfMHFQZHDljDCx6A13abzwJuMDxB8Y8/427I/zSF5IqVAZRrxhbC
 SjPA7hXKRv4c2/IbUqqwtM2uCJt+ng9wS8m2wlXkW/cHNXQfm0osWRIHSVsxhyJM
 eDYbYKAo2msQ20PGvE987pawyYtOkq79I1iRGNgaM2j8abw3xGL5Bw11/pfxeSBm
 1wzRKMIQVLT74jDvZJO9OnHIvWXOnKWPhSnWZlx7odeJxjg23IskC0+i/LYXO+nv
 hJqUUXGQILEUkinrFLKoQTDqVt+CDxzmrIMfznFUKi6yTlITgG2L8YZfPRBYqAPw
 ==
X-ME-Sender: <xms:mT2cYJAmcP2PXlH4sZf0FLPoHsRDrKgJnhQlkT7W6Sh-he4An76zlA>
 <xme:mT2cYHjnG2A45wA_NRz2ouwoIG4TAWGVg69-OW3DmqKwg-AjugBBxEMSggZNs_4lS
 --af3HWH2X1yBCHrgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddgudeglecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepff
 fhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
 lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
 hnpeegheehfeffgeekveehtdfhgfduhfegfefgtdehhfektdelffevkefgueffhedtieen
 ucfkphepudeiiedrudejvddruddvuddrjedtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:mT2cYEm212d4ZmEaUpnAhuWFh-mY9MRDRbbnk-jgr9xnnxjIJ_PAvw>
 <xmx:mT2cYDyfzaKbbaRySpNhM-p-V7SlF5lLAB5T7uEJvmKaYCDkAJGfXg>
 <xmx:mT2cYOR4MB5PZX1ktOEZT-axQ19kUjEqlhiMwIR6jU0R-qigL_-tVA>
 <xmx:mj2cYFOReCQ0Q6-zL2_wQPk9R8dK69xempoK0nSl0vDEpRCjgDsdeg>
Received: from localhost (mobile-166-172-121-70.mycingular.net
 [166.172.121.70]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 12 May 2021 16:42:01 -0400 (EDT)
Date: Wed, 12 May 2021 15:42:00 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: sainath grandhi <saiallforums@gmail.com>
Subject: Re: Advice on delaying de-asserting PCIe reset
Message-ID: <YJw9mEZPJ9FQQr/r@heinlein>
References: <CABqzqi4XL3B6Nv1XqgqvzkXhe25HkUN53+8MEfMY9Acn0Oy43w@mail.gmail.com>
 <YJr7SJrJ0wm/h+nR@heinlein>
 <CABqzqi775bJs9qvzQ8QM85Z10Nqc0XOy_W10Ek3UxaT9bHfqbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UNyMqdKfWBx57yBN"
Content-Disposition: inline
In-Reply-To: <CABqzqi775bJs9qvzQ8QM85Z10Nqc0XOy_W10Ek3UxaT9bHfqbg@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--UNyMqdKfWBx57yBN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 06:36:28AM -0700, sainath grandhi wrote:
> On Tue, May 11, 2021 at 2:46 PM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> >
> > On Tue, May 11, 2021 at 12:50:34PM -0700, sainath grandhi wrote:
> > > We are potentially facing a scenario where de-asserting the PCIe
> > > PERST# should wait until an endpoint in the PCI hierarchy is ready.
> > > Since the endpoint of interest is an FPGA, it takes "some" time to
> > > come out of reset, boot etc. to be ready and participate in Link
> > > training followed by config space requests from Linux.
> >
> > I've worked on devices like this but they are a violation of the PCIe
> > spec.  You have something like 10ms or 100ms by PCIe standards for your
> > device to come out of reset.
> >
> > The cases where I've dealt with this we hacked the BIOS to just delay
> > after the PERST# but before probing.
> Got it.
> When you say BIOS, do you refer to u-boot?

No, this is just my confusion and invalid assumption on what you're
trying to do.

I assumed you were trying to deal with a custom PCIe device attached to
your host processors and trying to sequence the power and PERST# via the
BMC, not that you were attaching this device directly to the BMC.

> >
> > > So we are checking for options on how we can delay de-asserting PERST#
> > > in the Linux PCIe controller driver, if possible in a standard way.
> > >
> > > A simple approach would be to add some time delay or wait for a signal
> > > (via some pin) from the endpoint in the PCIe controller driver before
> > > de-asserting PERST#.
> > > But that would make the change specific to our use-case in an
> > > otherwise generic board controller driver. And maintaining that logic
> > > can become cumbersome.
> > >
> > > How does Linux in general support such PCI endpoints to work fine?
> > > Any advice on how to approach this scenario is appreciated.
> >
> > Are you asking about Linux on the BMC or Linux on the managed host?
> > I'm trying to figure out how your questions are related to OpenBMC.
> >
> I am asking about Linux on BMC.

I don't think many people have PCIe devices attached to the BMC and
especially not custom PCIe devices like what you're describing.

> > One possibility, if you're talking about a PCIe device attached to
> > the managed host, would be to separate the power sequencing of the PCIe
> > card from the host processors.  You can bring up power to the PCIe card
> > independent from the host processors to give it time to come up and
> > be ready to listen to PERST#.  That is another option if you can't
> > modify the BIOS.
> >
> > --
> > Patrick Williams

--=20
Patrick Williams

--UNyMqdKfWBx57yBN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCcPZgACgkQqwNHzC0A
wRl9OQ//Vyz9GgZ/ONzf4oi2icmK8VtVmwe1bPlBPrKFZI/GqkAxerLrBnan2Sit
h++nXqao5IpqmMXa0kiZtLZDljooteOXwsyqRmxDUxbjSYyZluBPa0W3dCGw07DL
iIrQ7hYEIsdcG94UYM+wXWkcmmJwHMnTU6HxmTZcumNQc2XBW4twDkYgaACiAyt3
gdEOOAa8nzjO+920PhKOM5Ed2+ZdkiP46jkhNEDpL6qMNQH4UsyAmfsc7Rk91Nz2
Lrj1FkVXs7/VgYoSe4H22YEBMKgJUpFHqJAvXuAWbp7mxbD0nDMRQuXCgZmL7vHA
Kzllm5XDVFfR67nin/JI739aYlmXTdKPPJS2YzkcIn/fTMrzo/RV8YYx2XQwmeQl
Lk8UpKCtL08q1bmaRgycS/CrYuC0Yubnw0y+hkLGOvm4lAUJw8ikeIpm8rAMRwLj
ZJAIF/yxBEVSvePp2jvmW/HvoVlxJNGeg/QABqmyzzBVK3Bxn6m4MPIQ11klAMyl
y0Udjp+7a/mNb8I+8WzbVj3gBwwFVbet3TlKJVHlc0omOsWU2kkpdJFp4DIoXue4
zw/9lkMKZDXnG3foWJjJQbbfk6dwUZIyUgui+6zv8Uimi8WlYdZUx2vjMogDEHlc
p3Hy7hGTb2Kf52pFYwW0TAQCxezlG8rzAlx75l7RAD8BAgohuvQ=
=OXC+
-----END PGP SIGNATURE-----

--UNyMqdKfWBx57yBN--
