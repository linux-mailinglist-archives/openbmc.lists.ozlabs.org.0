Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007E25C746
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 18:44:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj68L4DqCzDr88
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 02:44:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=A+82Gufz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=nsfkWJhd; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj539361WzDrBc
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 01:54:29 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 89CD55C031D;
 Thu,  3 Sep 2020 11:54:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 03 Sep 2020 11:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=R3A4G4MPmSudjm67/j3Nl2juB8u
 g8CLWstPUQzMmJEE=; b=A+82Gufz2dyoZ5IiFRpIUpSIqEXqYmGs4NNU474MDui
 9SkBzG04TuYFjr1wpHPoiFm9+MdHzV87Z9XchdGarXVgaPejsjvawuJFglTyRVH6
 8MzccZiQN7TIKdS25A9JSzJrGDSm1mG4C4EbhES5xw4L+Q4W/9RL1TaZ7rRIDi5l
 Sx54zk5CDadXuleO7qyAh2fmsFj87ReHc1xE+gkeRaJj918d8UUsAtX1KtGt1Dwr
 zP2kyOsVagq/ZEdJks8AQFln4Ieo6af2PLmTju4zPTID0JMTAXXUztDQx4uHn34a
 PG4K9Mqg/mxthpKhzrAc8UzBFeniKhpMS1avQqseD1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=R3A4G4
 MPmSudjm67/j3Nl2juB8ug8CLWstPUQzMmJEE=; b=nsfkWJhd7AagsSd0xJ1DUq
 cf8CPPsL2M6x8gtKM17xfw1JCNxIL29vaMRUfUbk5enHQQMSaEFH+ocKlKbmOyG9
 Y7J0Kw7coHh5N9QwwKHiqLqSHNEE6GNZqNf0SsAGaOs05e7IpJLlfxbp7WvWbWEi
 07gi8ZH0F0wBmrrliK/vXByOJMozecb3iZcGNkpUZrISONWL5FIXzwkU4fkyeFsW
 0B54Ln2mlnCGIxoYRFIF9mmz2Lpqdzwp4q7AqwRt4fLxmbPw2JiBykdPEQQDvEyJ
 YWHO/6J6DG+XVkm/15rrGJ7pQB4WrAarsLVG2NmS5wSgKYQzutp1Ch9IlnrlDkiA
 ==
X-ME-Sender: <xms:rRFRX6-GJcc2AFZLUFn_gKp1BK70gYi3lw_POeThES11se21q_9q4g>
 <xme:rRFRX6uuRbXM-JcT-X3EjNGGUA4TDwT9Ut8nRXYDe2M7EZz2vAKN_63yQ4ijDg2TN
 kw7GBf-Bmiyc9hEtCs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:rRFRXwBZnRA-hxIeoEjaj8DTijR_LMvoGBncXhSna_6RtaWmypT6cg>
 <xmx:rRFRXydR2MEKS9iP_1_j7_O_zWjkPMxAN7YQQ601eH35tiFUr-XAVg>
 <xmx:rRFRX_NbO8AfmgRASZojrFuIuS30Ps4GmSDjiKnJrrsPqDbW3poBuQ>
 <xmx:rxFRX62pdh5ycnG0cK8G_WXImhIBb6_Dk91SxPnc5i8Ni9Qv_ohhkw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id EFE673060061;
 Thu,  3 Sep 2020 11:54:19 -0400 (EDT)
Date: Thu, 3 Sep 2020 10:54:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Dealing with a sensor which doesn't have valid reading until
 host is powered up
Message-ID: <20200903155415.GD57949@patrickw3-mbp.lan.stwcx.xyz>
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
 <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
 <20200903153819.GC57949@patrickw3-mbp.lan.stwcx.xyz>
 <CACWQX80oTWLjZapkE5Q+4nM1T2B4a6rbM3N4oK2WV3t0L=sPgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Content-Disposition: inline
In-Reply-To: <CACWQX80oTWLjZapkE5Q+4nM1T2B4a6rbM3N4oK2WV3t0L=sPgg@mail.gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>, Alex Qiu <xqiu@google.com>,
 Guenter Roeck <groeck@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Josh Lehan <krellan@google.com>, James Feist <james.feist@linux.intel.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 08:43:16AM -0700, Ed Tanous wrote:
> On Thu, Sep 3, 2020 at 8:38 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> >
> > I might have missed this but what are we going to do about the
> > Sensor.Value in the case when the data isn't yet available?  Is the
> > sensor only going to exist when the data is available?  Do we need to
> > define a specific value to indicate that a Sensor.Value isn't available?
> > Now that we've moved to a `double` for Sensor.Value it seems like we
> > could use NaN.
>=20
> CPUSensor code that does exactly what you describe :)
>=20
> https://github.com/openbmc/dbus-sensors/blob/105a19754f003956def5934612b1=
de86225a4bc1/src/CPUSensor.cpp#L180
>=20
> dbus-sensors has done exactly this basically since its creation.  I
> wonder how we'd get that more formalized in phosphor-dbus-interfaces.
>=20

First step would be a comment here:

https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc=
_project/Sensor/Value.interface.yaml#L23

There isn't currently a way in the YAML to define specific values as
meaningful, other than enums.  Certainly something that could be
improved.  It seems like we also have fixed values like object-path segments
that are in demand.

--=20
Patrick Williams

--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9REaIACgkQqwNHzC0A
wRkQ5w//fLSQ3iF0/flhPeEFuWKWuRXEKB9MR+pVXgKMzDwRVeqd10bwPe+L1w6M
YS52ZWq8+R4n2VPQCeVE9XcDpKtql7XS+TWc+SIQwvBmSDwT/6h1jO5N77Cx6h1r
mKuUp8QheZ8qRs/aDzerwYa5qVTr+m7PZKngLNkWdEdffRl2HeCoN2TAGHLkEAhJ
4Ib4EC+0sycgeEg20UUX0tmYst3TP4BruZUo0gNjOBqWHPylWBL7UDzxV9ZLDL3E
e1u7MOsYAnaE2mjH+VMAGI3WXp+t0SPMJL/pobdst639dY6+kd5ULYeb4la53WqL
dCYF+nj85MNROO2IXulkoqkafArdaXrZEHuAQqCJB//C3m0DPv27z2rhFeX3i8vY
HFIXcowONhzVLzJOXx9l7yPwKNOT0onOEerRqmdBeQDp0RSyEynDXdmIPqZTin2i
vocVK4rC3jlMdQ6s87BJ3gFe/OmpoIK69JbTzdjxOis77rZ3Q6ji22GEvj59KdXe
rmF4sX7PEhOEGNiBaVl8lZiRDu9fZPQz1qecBDmkHmWWmB3hgJpgIz4Yfm7HdEjh
dHW8TUjOjdM+Vahgn2rsOiwsH/RL8C/z6BMQVoo3UNYNdEw0gzA7H3NNbUM5edur
wN+NJBvTxGD/aOLVbZkzDc36ZlipG+7K5dll1ua/W10OLcGGB1s=
=UZIg
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--
