Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F927F28D
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 21:26:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1mTT23tMzDqVC
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 05:26:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=mFo8tsX3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TsYfho/M; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1mSW6PBXzDqSB
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 05:25:47 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B9E45C0153;
 Wed, 30 Sep 2020 15:25:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 30 Sep 2020 15:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=c67w7xdhnfuIWY2XA+ks+uDX3o5
 e+fJYoaArAWNiZUk=; b=mFo8tsX3JIjyEJ1JuT5rf7Tq6ooAVT2Rik5iedFd2h7
 uQI6RjDam1TiXXfXRArgJLWx3DzmoOGg6c3UonStt4U/8lRJEpJ3K2gcW6MX4IHB
 YKmyrNyjOEbcTXPz2QW+44q59f+RJ2KXaNJADeoXMQA5mwRYg6Zzjkz8GaqDcp/L
 lkEKnSBU9PP2SAH2q5SU7Rgyp0ed0Lfe5OJ/MsgZt8GyMEcNsZljTwYi620QWunB
 c3EiXUTLMGIVuuqJ1aO/Y490bp2JdTwakp1Kh8z9toxqApKtBrDzOQtlcNkS9yjj
 UYHM+LxT5dS6T0SVKuFmDKzVFc0fbQigim+J0f2ELyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=c67w7x
 dhnfuIWY2XA+ks+uDX3o5e+fJYoaArAWNiZUk=; b=TsYfho/MRjW6VqqP8Kl9aO
 Rhej+giwRIuUpEQOUyFf65KDq23dwXZvhOV135jCBfj+OyM5x9ZAcy/Th1ymTFFN
 /CXAqspOJGh7OEBxJX/lqn2IJhoF6KmPes5AtC5uBsafV3Z/Kg0NUKZiUYgaiKMy
 S3Q4G6RvuQoANcmWt7p13aDro6sfi5wBNP+lvQTA7Mlb9+A3j/xdCz/bFYGyeqiD
 ZHQine+o0pHeFcwP+qFvoX7ybEJ7gijKWCKwPGHAtao8kMfjtApVlIYp+Liut6Tq
 MgvuJJJkIYOFmEEcKzqkn88KKxh0L5r0QilVDVYoxz8gHmUoyKuRX0BE03Np8J6Q
 ==
X-ME-Sender: <xms:ttt0X2VqbSP0bY_ZZIcYSc0dq__dlYRJs-H-AffOXguSymi7w6wTLA>
 <xme:ttt0XyknP1bxGMLvSs8KO-i_dEW6ojtw7m0oJqAwLyIaCTY3QbWXU5KQDMfZqCEJm
 er2NSXQi7b9PRRnhRk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedvgddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ttt0X6baPhWIVr-KDhmZLGui9MbkfhN3DUNE1H3k-oiAGQ3G4nVcbw>
 <xmx:ttt0X9WoH07AA6E-BIxe1MaO2scJUZmBfElEkhDe2D6GIv8PLNCeZA>
 <xmx:ttt0XwkFyktase221680m1IxdwDI1xdmETDbCKUnzWNoE6ejc1YVzA>
 <xmx:t9t0X3tmMqOTtD4xnojNIXFNiY1r_qhj9fsCwyCBbRcxfgPTxtR8RA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 60FAC3280065;
 Wed, 30 Sep 2020 15:25:42 -0400 (EDT)
Date: Wed, 30 Sep 2020 14:25:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Oskar Senft <osk@google.com>
Subject: Re: Human readable POST code messages
Message-ID: <20200930192539.GB6152@heinlein>
References: <CY4PR04MB1033438E15ECB1EBE2E1D02CB9330@CY4PR04MB1033.namprd04.prod.outlook.com>
 <CABoTLcQQFTCnyv0xxtHoDNQDYOF3JeBrFah2fFjk1BRG+WB-GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2VcK7Ezgm4IMdfSa"
Content-Disposition: inline
In-Reply-To: <CABoTLcQQFTCnyv0xxtHoDNQDYOF3JeBrFah2fFjk1BRG+WB-GQ@mail.gmail.com>
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
Cc: Brad Chou <bradc@hyvedesignsolutions.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2VcK7Ezgm4IMdfSa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 07:42:47AM -0400, Oskar Senft wrote:
> Hi Brad
>=20
> I had thought about this before. The main issue I found is that the meani=
ng
> of the POST code messages are highly dependent on the particular platform
> (i.e. BIOS) emitting them, i.e. there's no generic mapping that's always
> correct.
>=20
> Having said that, given that there are only a limited number of BIOS
> vendors, it might be possible to generate a few lists and make the BIOS
> vendor a config option to select the right mapping.
>=20
> What's your use case?

I would like to know more about the underlying use-case.  How do you
intend to expose these?  Is this "WithMessage" usable for Redfish and
the WebUI or is it only for internal use by CLI tools?

I think a bigger question is how we handle translation.  I think it is a
bad direction to have individual processes providing "human consumable"
strings because you need to translate them at some point.  We maybe
should look at a message registry design of some sort that can help
facilitate translation.

Putting very little thought behind it, we might want to define some kind
of interface (ex. MessageRegistry) with a method:

    Message(language, interface, property, value) -> string

> On Wed, Sep 30, 2020, 7:23 AM Brad Chou <bradc@hyvedesignsolutions.com>
> wrote:
>=20
> > Hi,
> >
> > Is it possible to implement an interface that decode each post code int=
o a
> > manful string ?
> >
> > For example, if code 0x10 is mapped to =E2=80=9CPower-on initialization=
 of the
> > host processor=E2=80=9D.
> >
> > Then, in the
> > phosphor-dbus-interfaces/xyz/openbmc_project/State/Boot/PostCode.interf=
ace.yaml,
> >
> > We have the GetPostCodes method, that can return the post codes =E2=80=
=9C0x10=E2=80=9D.
> >
> > Can we add another method GetPostCodesWithMessage to return the post co=
de
> > 0x10 and its human readable message =E2=80=9CPower-on initialization of=
 the host
> > processor=E2=80=9D ?
> >
> >
> >
> > Thanks.
> >

--=20
Patrick Williams

--2VcK7Ezgm4IMdfSa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9027EACgkQqwNHzC0A
wRnOOA//buWuUBj8Wz4B5Cd5xAZuL6KX+A6mYFjVONb16MhIz1FUc4JgTrDJTDBp
xSWvBLB7nhPCqm7QkeBOJwZFna+17aUCp1ASwnZ5ZL5TbCijMqBem1850yx2jPWR
uoCYNYeuGJKPYYSDD1C/ho9GX6rFLvYzFjbOFCaULqUCoAcYpAOF5fsUqVgOnC7s
pw4wO4an2+WB3EaMmJTsVgFnRrtrn52ayRPYSd+dAuhujn+/M2FDISf+Af36fhCP
hHvrqV93ke16i8SS2ZaAThBr+w2srkfev3NqsnHyf2GS2vH6xVQsIuf0vLAE4aJl
U3eZFXHznHlcLyZ2bhau6IXkNKG+8/aKOQSi9AUZtQFph2zLYWJwjmZTdQiLHCBB
PWMH2my9QYcN/475LWHAMkcPwHn25ffF0B5MMyodnG8tB14dHzfEUWFBCtSk5SDN
RY9qbxvrKGkmSH5DBrA+rgdRCUwdBLAwqp5PixT22A7URiFHE7de3apY9NITqi17
5Tf2JWZG1xE+X3LWi+1B6RGQqqZLP5Ti/l6gKmq2muTaPcSiKquIW3E+S0l+S5EH
DkuVcCNwpLRa24hpDXFUpUSnnN3lRE8b8vmsTCBplrQdHpGtre6BKm2xUtf2rC9+
5oMY0ptK4lLkDzkaHuOFgxuEaTD4Vv9f3LqvY1DVXk/vKOYmqd8=
=de3u
-----END PGP SIGNATURE-----

--2VcK7Ezgm4IMdfSa--
