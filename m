Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C2337B0F9
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 23:47:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffs2f5X5Wz3019
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 07:47:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ymjrZiAo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=h/ybEfGd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ymjrZiAo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=h/ybEfGd; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ffs2N53npz2y6B
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 07:46:52 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B6FB5C010D;
 Tue, 11 May 2021 17:46:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 11 May 2021 17:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=FWQYseWI87kGpJDkQvidGUQU60E
 fQgspWjsC45lGggQ=; b=ymjrZiAoztzqVJ/m7FgB/zulg/N4GZ+0HQDMo23itzJ
 CynwC+q3WFvqGIbfOMzu88hNkZHvehG5ejqYdfWTI6dCfxbnZvYVp0tIZREPdNcQ
 X/erc1bB7viznz2B3zZUDsI4WGSCzCq3SbGQUvj9XKFiJzUTRg8uJ1HeQt2YSpEy
 5YlbspMzkgCD/O4MFCKZEARpJSTrogbfQ0kzyQ8Jsm02f2j3C4ZUPXp9Hh9zajd9
 Kzhl684Y34WALxMUQapZk0gecBFDz64SAEV6TEiMSpcDkb6FNAUUX9HonIJfctvw
 V4PvszUHZamQ4DlGDIkNB+7GWJycQwUbbW6I5LUwoZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FWQYse
 WI87kGpJDkQvidGUQU60EfQgspWjsC45lGggQ=; b=h/ybEfGdivWJnUYFTutyrE
 9mocmcihkTRgA5lf4xiVHWVqc6Kg0+jGbu14SynYdQ0CFcyjyz4k6Llab6hpwO33
 NMf3S3iuRSdmBdBXr+G6WNUb71/7UzP9YAaJ3kXhEqFhIOoEJq1fdemCZCobNI9A
 4y6ANtI5p0VrpbSzEtyzt5K3haiT6RfgcylwTNHxxzxaoNyiCB0IrM9spW8bM8eD
 rTLQaAxtiMp/6hQ214BiNDboHAPSdvpcx3WW+Z+zdnvQvBe0y5kmmvFwvWSGnbDo
 t/lxW7TL3qpt1wiWijx2ugJEozhSWGtZaNePvA0msjm9n2rBT329+SVkhLzB99mg
 ==
X-ME-Sender: <xms:SfuaYDQgFlYRvCeVwJI0OMwOIPxHin5HQsXyzvWmZDW6_aOIssLPVg>
 <xme:SfuaYEyKQJilYIhY62Z6JJMYT7rLT7fzxg_fmoNFyt-RX8Rw1cBu3aZq58alkCtPW
 48EJ-88w7Xf3ZySRVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehuddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeduieeirddujedvrdduvddurddvhedunecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:SfuaYI2CKy1OhPKJf_FryikhVc-DP1-eIpF-WXAN5LD-8N7vV4Iq7Q>
 <xmx:SfuaYDCwsDcGlbOasFvQlDXZ1FiO_mbaXADZSOIRVZrjN4joiqFqQQ>
 <xmx:SfuaYMjoCb3-9a0ndTy4qNilr4QE7EDJHLa-24VTxB8H8mGe0IbLRQ>
 <xmx:SvuaYKc691YHJhf8CEZSl4LWwgwEg7cmnZIGPaNqUZFc1KWcAeDiuA>
Received: from localhost (mobile-166-172-121-251.mycingular.net
 [166.172.121.251]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 17:46:49 -0400 (EDT)
Date: Tue, 11 May 2021 16:46:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: sainath grandhi <saiallforums@gmail.com>
Subject: Re: Advice on delaying de-asserting PCIe reset
Message-ID: <YJr7SJrJ0wm/h+nR@heinlein>
References: <CABqzqi4XL3B6Nv1XqgqvzkXhe25HkUN53+8MEfMY9Acn0Oy43w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="41+yObvIrGDv3q1Q"
Content-Disposition: inline
In-Reply-To: <CABqzqi4XL3B6Nv1XqgqvzkXhe25HkUN53+8MEfMY9Acn0Oy43w@mail.gmail.com>
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


--41+yObvIrGDv3q1Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 12:50:34PM -0700, sainath grandhi wrote:
> We are potentially facing a scenario where de-asserting the PCIe
> PERST# should wait until an endpoint in the PCI hierarchy is ready.
> Since the endpoint of interest is an FPGA, it takes "some" time to
> come out of reset, boot etc. to be ready and participate in Link
> training followed by config space requests from Linux.

I've worked on devices like this but they are a violation of the PCIe
spec.  You have something like 10ms or 100ms by PCIe standards for your
device to come out of reset.

The cases where I've dealt with this we hacked the BIOS to just delay
after the PERST# but before probing.

> So we are checking for options on how we can delay de-asserting PERST#
> in the Linux PCIe controller driver, if possible in a standard way.
>=20
> A simple approach would be to add some time delay or wait for a signal
> (via some pin) from the endpoint in the PCIe controller driver before
> de-asserting PERST#.
> But that would make the change specific to our use-case in an
> otherwise generic board controller driver. And maintaining that logic
> can become cumbersome.
>=20
> How does Linux in general support such PCI endpoints to work fine?
> Any advice on how to approach this scenario is appreciated.

Are you asking about Linux on the BMC or Linux on the managed host?
I'm trying to figure out how your questions are related to OpenBMC.

One possibility, if you're talking about a PCIe device attached to
the managed host, would be to separate the power sequencing of the PCIe
card from the host processors.  You can bring up power to the PCIe card
independent from the host processors to give it time to come up and
be ready to listen to PERST#.  That is another option if you can't
modify the BIOS.

--=20
Patrick Williams

--41+yObvIrGDv3q1Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCa+0gACgkQqwNHzC0A
wRlyvQ/9EtFWGsxR8MJMfMrBTpzVLjVzMJ+X/UhDCN6ruR47mVuxxTZIKpK20l51
SV6YLeAASTE7svuD0EqbLhjI1lZYDzPQmIK8zWlNQ6aRSL5annWlEJpn1PlOmtu+
izj/OM1MHmUUFmMIwQb1E8JHnYLbx3z3k9gUIIdNQ9u7qt0c75JHjRWD/xLWA4Nv
WRFI7nqBuV6XXf58giLW8KCLHH3UQMAhkDI3JXim3cbhw5t2iypRlAHNUPq31wvX
ECJQRSbQ8AlNuN78NUHMDjVmiEr9aRtqh84lBq6vSi6fenhzvWKF9SpA7TUH2jCU
XQI7kyhV3EbrnDXh48JDD/4Fl3et7TOD5YDZqAf2LlYamxfnCkx8E4AZkOVLB5KD
NdP5ZQJUWI4PhAr+kvh4c9OJeamL3AlshH5hjLLdX63P4rLI/6EVIN2v79Wh3dKp
CyQKEZGXHUtKLQEw6I7rXUNIXxpt7f/G5hRC9cv0aNnquaqGWceNaSh3qTWiMspR
i286H7nNan/GZm/7t+BIGhlhVtZ9ZlBvhTW4la9b1Lmgs8GYlpUzZWkNTorBi1tL
EgJaib9Yn2I4ZoQBXs7pjrJETcsQcjqH5tMkHXMpntbQq9nRHyXjUq0w70KXbg8v
A0WJ8MJzWe87DRCByBvYg8LXAyfcRiN7wYLxFyKOiSWcUGlxGiA=
=fIrW
-----END PGP SIGNATURE-----

--41+yObvIrGDv3q1Q--
