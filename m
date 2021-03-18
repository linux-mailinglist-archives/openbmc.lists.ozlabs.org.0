Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5916340840
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 15:57:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1VWB5B2Kz3bsQ
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 01:57:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=tzf/pGhB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T0NJ5Ul5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=tzf/pGhB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=T0NJ5Ul5; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1VVv3zckz301y
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 01:57:25 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CCEC75C0125;
 Thu, 18 Mar 2021 10:57:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 18 Mar 2021 10:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+83u/7dAXDJxJTUcPMAH5Aj+TaL
 T8GkJ/0VUbjKymQk=; b=tzf/pGhBsJ96wTahCCAtkdn7P7xUQYhQonj0Bnn845G
 obT8kn11hWkWt8DToEU348eFeWxMI7QrLW6bMUokCWAs4P9cwK+jb2sQS7NOlcJ+
 2Q8KfyAAoyzCS9R3n28ktc0oXH6+O7WtU4oE0XFk1BFNvK01YHJ2xLCIboSJz2of
 YUT8KCeLkdRN/37nLJkTP8PIabTOw9MqW78PlbYoEMyhIgIi85fTFKR1n8hcJ1Pu
 HwSHvnk5Km3s6cLugVEgx2inGsarNHJSCPJF5N5/icQHvmJl7DAlbT8dZdO3A+KO
 GbsJIvWBuPL/I+eiJ2T/dY7ZRw3+hTl3Vje5ONqKj7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+83u/7
 dAXDJxJTUcPMAH5Aj+TaLT8GkJ/0VUbjKymQk=; b=T0NJ5Ul5GBXiuuh6ObGJ5M
 NPU89O/r2IJPR4Q9z9CSx2QNCQ0Nfgv/ux6f72f5j5BtJJu0KQB5seJgdIaWidlj
 ZEP+txT07FxicLEORd6yqnJwb6i+796e5KSaoI2v1tLfM3O3av9IpdVpiAp8VgqL
 eCm/u0FUzcjaRpjgEDHtNHpYanV5sgQPoxBCa1yINrxNIhRiQb49CjsV1jFhDMSI
 5ArfahNWdriRQIt0a/9LsE7/xlONzpObpbdvS6W1kQ8kFY6KbBmva6o9zH5jmz2U
 Ld9TZGWPiCi5G8iJSqSKm2mDaMdWn6ETwbOT97wwzao0Y5qyoT3mQnZ0tec7LW/A
 ==
X-ME-Sender: <xms:UGpTYHyhfXJJSsOP_nExxJaE6ijriZUmSII2XsdH6AKPF6QRlpUP_g>
 <xme:UGpTYCgyYTkSL7fqRuMziloeTHeVFOgtMNGqWbr4Bx6fB-sFpmJJbWSFO_xC6mSsr
 Foa5vvcjLwzpU2Tv9E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:UGpTYKzOHJdBNry948r4ee4lNp7ajLTQKbdits1KNlm9ZCiM1gobNg>
 <xmx:UGpTYNIC5FH03OdUqrjdA3moFGy1r4OTVIeX8Dp_M38zsLbeq_47eg>
 <xmx:UGpTYJRgx3imSm7YM1ht2duF8xALSOBpiow4Xvt0zi8sVfU71oVauA>
 <xmx:UWpTYHRczokUA_ojAEyayV6sD8Scy9EfxZZpGQI6A7zlTeFHpMeIPQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB59B240067;
 Thu, 18 Mar 2021 10:57:20 -0400 (EDT)
Date: Thu, 18 Mar 2021 09:57:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Emit interface added signal
Message-ID: <YFNqT47YVXprhEsM@heinlein>
References: <580c5e6c-5946-eedc-25b0-53315a0831cd@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HjS/r2MjkKBOC9Ck"
Content-Disposition: inline
In-Reply-To: <580c5e6c-5946-eedc-25b0-53315a0831cd@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--HjS/r2MjkKBOC9Ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 04:03:21PM +0530, Ratan Gupta wrote:

> Proposal: Don't emit the interface added signal by the D-bus service if=
=20
> we are restoring the D-Bus objects from file system.
>=20
> Do we see any concern here? or any other way to fix the above issue?

Yes, this is pretty dangerous.  If you do this, mapper will not know
about your objects and they will not show up in queries.  This is
certainly not what you want.  (Mapper will delete your objects from its
cache when the service exits, and not know that you have new ones
because it did not get the signal.)

This isn't just about mapper though.  Anytime you do not emit the
signals, you then require applications to poll your service for
knowledge of your objects.

In general, you should not work around an issue in one application
(bmcweb in this case) by changing your dbus behavior.  This isn't the
first time that I've seen a similar request.

Having said this, there is one option for you.  This is completely valid,
and done by other dbus services we have, and arguably more correct than
what it sounds like you're currently doing.

   - Defer the service name registration until just before entering your
     dbus processing loop.

   - Create your restored dbus objects before this service name
     registration and use the `emitSignal=3Dfalse` argument to prevent
     the signal from being emitted.

This pattern is your way of indicating "these aren't new dynamic
objects, but objects I'm creating at the beginning of my service."
When mapper sees the NameOwnerChanged signal, it will query your service
for objects and add them to its cache.  `bmcweb` won't see the
ObjectManager.InterfacesAdded signals for these static / restored
objects, but it will see them for new / dynamic objects.

--=20
Patrick Williams

--HjS/r2MjkKBOC9Ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmBTak0ACgkQqwNHzC0A
wRkXwA/9E+UALR2/fdgtUERkwODTF+HiRp3R9a/kWX9rU8lSyWvEkSovoNxT66uO
bl3dffhzeeUo8xAfWgbyL4NqLMxFCVPiQVhpPDAx2rvAVPwNS2oewXZRd5HCuxTu
t031Tx+WJPdpX4k8mVq0HPBU2RITzzAUGMjMSJ7Q1odPWobOqmm+bKdmNaGcTPwg
DPY0qFJQEl0Rvmd3kO7QvJN71CdMhBUUeXnDM+z90a3yvuXNQBdNJadGiaLlnMDg
ENuAZUQpz3lRIcIOPcRUGnMc9bahWn6pkIeJXS061td12GnCbEcg8vvRuv4SVNAz
2bhTDLSmrRy+VWHojkPKbofbNrXjuPD/H39xBs9CPHBpL9spYyRXOolEOpg8+cuS
ldV5N4/pLZIEM1LF/hICs4MQaN/EVqEmuxdm8Hd3rW6jzI/NP3SV4z3sNnYaM7zS
EC4nWvoexXTh1lakANtVDdsVLhEHmtilIrCofLeGxzPRLoH+CsN1xd3uYqvRwbQq
QGyeQaB6+lIRw1l20Hl/Ti6YqTotijV9R8c7/5r/4NJl8kj40aCyt/5ZIrBOavls
NztSUt/5hZH1sVENj11s4IAufo31AFGrHFR2wvYKsIePSJHD1NaRcKeyN2ZC0vbX
GbVqNlAf9WEFgnUAlWhey6THzLvvpmTfEoTsJKXxh5f3wPLqI5o=
=uWVH
-----END PGP SIGNATURE-----

--HjS/r2MjkKBOC9Ck--
