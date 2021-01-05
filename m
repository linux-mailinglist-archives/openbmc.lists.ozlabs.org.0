Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7772EB417
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 21:21:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9P5q1ykbzDqdD
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 07:21:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=hTmT9j7Z; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ODnGI4r9; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9P4q5PqHzDqc2
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 07:20:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 013785C0148;
 Tue,  5 Jan 2021 15:20:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 05 Jan 2021 15:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=VnIqMwAN1D+ycawe597T4R93IBK
 c8JpT004Y0LwSCyQ=; b=hTmT9j7ZE49/Xjwg/c9DcythG5Qq6Vl3QdeyP/xfHBh
 ZLWpWnClJdS2LFE7EV7E3LKF6HQ6EgMUInKj+Dz+CEz+AeIAj4QE96hOuzNDjyTZ
 j8vB+9Sqi24lURly7A8YzyQvzVy0AhL8eFYjDUWIKIlyCgDEVoU9AIhzPXac32E6
 5g+wXDLp2zIc72OCJL4wz202aRHilQceFFuLCikO+LauxWHFNNxjRtx0y8LF/ZW3
 hh+oinAzzU33tTbHd4RNeBczuyE0pMDcRKbGs4VbKxK8W/s2KYGg3rOm34Q4T7Ii
 lQRMhvf/V3Winz7kI0UXPIzVSxZh4zssrx+MwqWAGUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VnIqMw
 AN1D+ycawe597T4R93IBKc8JpT004Y0LwSCyQ=; b=ODnGI4r9ZhmNoL2OIIu1+A
 10mumVTLI94KiHRPab4cpX81oHjnqAfgmeER909mY9sGmsmfD9zHtD3F52c9KBAD
 PmrBNm8fcE2L7ni1KHujvE797mbpF7hkZlQnFoNY4BJMlaLV3TGMOZJei3a6b7xK
 gwd/AMZxsdM21PK38E5Bk85HJ/qqLFLTmz7j7yXfIqvsr8INLrSeYZGud+KTi68/
 sUBW8K3O72P0osIIdQqYU2r8u33a1ZsTvtZ2FuJI99u1ezCBnlHGMGV+XUIuQg/Y
 0+y6+xZ3PAWbIIwNfXRCxu3T/iYixjxvVPtxzdm7j0kdLUCHKxEY8THGznkHfRFQ
 ==
X-ME-Sender: <xms:Bcr0X01pRIzXv2mqCKiYIm587Ml_VXCBfP-2_pHOr6fjIXqG-jka1A>
 <xme:Bcr0XxFv2oQVpbk-CV2gHCWirFQ551EOXczxU2v8FdmxQWtbVSb8eI_ImGS1kcZ2J
 Xb8gJPLuQqjCrZyVUI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefjedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefffffvdfgtdeludefleefvdff
 kedvfeefueelveduiedtgeeuvefgtdeiueeuveenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Bcr0X2QR7FoEQySOXCKkJsbruPPHHxJXg9sW-QAVOhfnE5KQd6y21Q>
 <xmx:Bcr0XwA1eC9yBCN6SUfgAuWEBVT6dx12u1MqPUqEBF4C5xMzNHyk1g>
 <xmx:Bcr0X-19d9MJu7ZuDe0O4c5SQrJPVVtGBk-SA8skWdX71cweOYumWQ>
 <xmx:Bcr0X7d3VNhfjqQUICOwBJfqYqGuTZhUbsbD9mRNHlK1bxQcZ7JPZQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id F237E240064;
 Tue,  5 Jan 2021 15:20:20 -0500 (EST)
Date: Tue, 5 Jan 2021 14:20:19 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: hardcoded median function in phosphor-virtual-sensor
Message-ID: <X/TKA7UG5uRqlkaE@heinlein>
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
 <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
 <X/R3XZNHmYpz74mu@heinlein>
 <ce14a5fa-eaeb-8c16-3ab2-7ef231b6c326@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l8oQPbYblJPJ9tYB"
Content-Disposition: inline
In-Reply-To: <ce14a5fa-eaeb-8c16-3ab2-7ef231b6c326@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemkalinux@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--l8oQPbYblJPJ9tYB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2021 at 09:56:34AM -0600, Matt Spinler wrote:
>=20
>=20
> On 1/5/2021 8:27 AM, Patrick Williams wrote:
> > On Mon, Jan 04, 2021 at 04:57:51PM -0600, Matt Spinler wrote:
> >> On 1/4/2021 2:54 PM, Vijay Khemka wrote:
> >>> On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler <mspinler@linux.ibm.com

> > I would expect the 'exprtk' expression from your EM config to be
> > something like "median(Sensor1, Sensor2...)".  You should be able to
> > feed this into the existing virtual-sensor constructors and not have to
> > make the symbol table yourself.
>=20
> Every variable used by exprtk needs to be added to the symbol table=20
> first by the C++.

Isn't that what this code does already?

https://github.com/openbmc/phosphor-virtual-sensor/blob/26edaad467a44ff9b69=
968ac0912aa3e9e3d0a62/virtualSensor.cpp#L132

Maybe I was imprecise when I said "exprtk expression".  I really meant
"transform from EM config to the JSON config format PVS already uses and
reuse the existing code".

> Also, we need a slightly tweaked median of our 3 ambient temp sensors:
> 1) throw out values outside of minInput/maxInput
> 2) if there is an even number, because we threw out one, choose the=20
> higher value, and
>  =A0=A0=A0 don't do the average of the 2=A0 that I believe an actual medi=
an=20
> would use.
> 3) if we threw out all 3 (very unlikely), use NaN as the sensor value.
>=20
> This is easy to do in C++ using std::nth_element, and basically looks=20
> the same in
> exprtk which is why I suggested just using C++ though I don't really=20
> care that much either way,
> but I don't see how we could upstream this as a true median().=A0 In fact=
,=20
> since
> the underlying code would just use=A0 nth_element anyway, I'm not even=20
> sure it would
> be accepted and is probably why there isn't already a median().

I think median would have been accepted but, yes, this isn't a median.

Why do we ever have sensors values outside acceptable real world values?
Can you use the 'clamp' methods to keep your values inside an acceptable
real world value?

> Since I guess it could be argued this isn't a true median, maybe we=20
> shouldn't call it
> a median, which is fine, but we still need it.

Yes, we need to stop trying to reuse well-understood names for something
that is not the well-understood meaning.

--=20
Patrick Williams

--l8oQPbYblJPJ9tYB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/0ygIACgkQqwNHzC0A
wRkeoxAAl8GgxHuAxn9ELRnxSg0rhyoj4Yk4Q9Nb0s9gaa2qj4w9khY8Z6unCXTI
wFG5GIvA2e7JtudtPe1cH/Vk8Ovs7Edps84PlJ3ueAc76d7YSuCPqzdS9x+BSPsb
eSwBcBCbTQlYqXBdshIS+QN2HJ/o4YMYley3IoU/qxbF5pk947zc0xVUhcMomAt6
8iLI2dA1fLfCDUYVcU36Tvx734OzxQ5/dsofxHLSLE7djYakr1juxddCacwdojwd
33KS5hTE06dUBb2pZezKOf8VaW58kHF4IxSP9gpmyo144j1/Tw98lXW4Tih6D5rW
6Rob8/8uezABxL3eg0/6eUmqsFpZNXWnskgDzB6LOMXPvo3oqzbPpcZ9p69CAvIy
MJRVCLXrqLlxuk4X+ILJxrkB/UkGH5GPVDqVdXEswsHDSnqRpiKhtz6ZZP3A9wl/
AtilSozzPyZstwIJPl1Ag+Np8wGP8C/UJ0ru8ps4yFkEvWK/z84UEA14DTcfblWG
E9VpbpZb+ROL3zMzeRIDmNuR/oL2f5D2jF81fRm7+yP55N4kO7hAM4vYKm4KXYYZ
q/icTW7rToHhiWNRCsQftKVdiPpOpvm0c7BgPWSfKN6kqmQZfILe+asAVVgCur7f
BOfws3ank68uBOTcwLAqywElkqnF5vCJI0mxdC+xbzp8f5k/VpQ=
=Zf+u
-----END PGP SIGNATURE-----

--l8oQPbYblJPJ9tYB--
