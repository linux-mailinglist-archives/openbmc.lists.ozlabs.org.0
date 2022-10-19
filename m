Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C4660435F
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 13:35:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MspZf60ZDz3c3W
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 22:35:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=PxGMW8w3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SCTAIhdT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=PxGMW8w3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SCTAIhdT;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MspZ03NxZz3bjB
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 22:35:19 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 9EC7C5C017C;
	Wed, 19 Oct 2022 07:35:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 19 Oct 2022 07:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666179315; x=1666265715; bh=IhOSBOnJMs
	cF7iWrJESoolXZUSYVXRWheZ4lmGUa+zg=; b=PxGMW8w35F+cU/58NDwPz/41A+
	AXZDlJTOfO76cuH4vc9uuLFWjGKGkhEKmC+EknZtlOD4Vpz13InkgLjFRNB2fAx/
	ppikyJ9rWZ66oRRWe0Y7Hu2qY7aU2RFDk4EWjquKWwlF2JansQ7W9XC5MLHmJKE+
	0UkArX64Ss3tAEDS5hIokKRJDFFoU6jh1jeUsKBKWkWftLceYic3dsPDMZGpvTuZ
	/GM74eTMznENysLq8JWpe+UGjwXT3DE17Xa2ry6LRPWDN61Xthkgv/M6RfcxuZGo
	GtgKjfVWxDcvN3CapZr+uP41bBi4PDCbcQ8XwnGR7WgAGGYijj4J8Ujn82Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666179315; x=1666265715; bh=IhOSBOnJMscF7iWrJESoolXZUSYV
	XRWheZ4lmGUa+zg=; b=SCTAIhdTUmk2dErQwPF1Biz0VrVUADZZ3pJi1Ud18tlO
	cDRup0vY9VrxeweQmb6AACjTXx0sZKOAXCNziOV3cPwnSpRTL7MDkW6UIB1Swt9e
	HE7JeUQySCsSHnNyrbaS4EhkaOj0MLaWqLFpkwcJ7j1HpOXKZtx63sGnJp3nhi8f
	QUTrztRgTC7z9JBMlYkr3mCh7dlmby6kpEC5s8E2Te0tcTV567+5ckCNwwyXgSto
	jsWBgN/pETRUiIjbFF4KVKEGY+4B4hWovTiA/qIs6Dz1YjdFaTmYmfZKznf7oC7J
	nt2VByJoAKq69k68mWjJ0jsydaek5ofGLAOIS04P6w==
X-ME-Sender: <xms:8-BPY494OU8Xr79CQgQZ6XhUUcbP7NSX16VGHbUp_hQWlppJA7YYLw>
    <xme:8-BPYwvrkssfpVl3skx4mMtsvnhJ4qgczECviXqP5qoxqzrp26pWn4-TgvleD4N53
    Uq0qtvP8yxOl5fH9LY>
X-ME-Received: <xmr:8-BPY-BNPtzA_ucZ5PKw7NjU5rRQqFAjz5G1hVdluE4sXn2pupS5Z-hFVo66ma5sE-EYueKOm1-s5kNezGlVhY_Oo1braWir>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpefgvedvvdfgjeegffdvledvteehleektdfhheejleeitddvgeetleefudehudehfeen
    ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdig
    hiii
X-ME-Proxy: <xmx:8-BPY4fU4Q-hVZ9AOo-zvtUu4_Uvtv9CwYG3skZ2AYoLYzN6AWrtxw>
    <xmx:8-BPY9OL0OL9RA9TX59kLHHDyPCaD7IZIc60an2vFsgIPsYjCXavRQ>
    <xmx:8-BPYym31VFmjsDMs53Tn_rNSTYUG0Hrj-bbmdnJfQOI1CHfa0UbXw>
    <xmx:8-BPY_VGE6CtKefWB-a0TNAEbCRyXkb9uRRkbDTadbWX08jkbKnWjQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 07:35:14 -0400 (EDT)
Date: Wed, 19 Oct 2022 06:35:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Blocking call in phosphor-networkd
Message-ID: <Y0/g8WAT3hItd3fk@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UF_XeQivcVozvjMjWbc4J68E+PJSbyVRFdScoyfKh9oEQ@mail.gmail.com>
 <Y0+Cc2sp3mHZ0Z85@heinlein.stwcx.org.github.beta.tailscale.net>
 <CAGm54UFVdbM3cVRPk3qxeu0G-qp9n-ij5-JH8RFFBQ5oq2M7LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l+nut98CKlIk0473"
Content-Disposition: inline
In-Reply-To: <CAGm54UFVdbM3cVRPk3qxeu0G-qp9n-ij5-JH8RFFBQ5oq2M7LQ@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--l+nut98CKlIk0473
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 03:09:47PM +0800, Lei Yu wrote:
> On Wed, Oct 19, 2022 at 12:52 PM Patrick Williams <patrick@stwcx.xyz> wro=
te:
> > On Wed, Oct 19, 2022 at 11:40:17AM +0800, Lei Yu wrote:
> >
> > > How about changing the code to read the `/etc/hostname` file directly?
> > > It is much faster than making DBus call to `systemd-hostnamed`.
> >
> > Absolutely not.
> >
> > The value of `/etc/hostname` is considered to be the "static hostname",
> > which is configured by default in the 'base-files' package to be the
> > value of ${MACHINE}:
> >
> > poky/meta/recipes-core/base-files/base-files_3.0.14.bb:hostname =3D "${=
MACHINE}"
> > poky/meta/recipes-core/base-files/base-files_3.0.14.bb:         echo ${=
hostname} > ${D}${sysconfdir}/hostname
> >
> > The value from the dbus call is the "transient hostname" which is
> > typically assigned by the DHCP server and is much much more likely to be
> > something that resolves properly on your network.  Since all the
> > machines of the same type will have the same static hostname (due to it
> > being derived from MACHINE) you are almost certain that this name is
> > useless for any purpose.
> >
>=20
> According to https://www.freedesktop.org/software/systemd/man/hostname.ht=
ml:
>=20
> ```
> Otherwise, a transient hostname may be set during runtime, for example
> based on information in a DHCP lease, see
> systemd-hostnamed.service(8). Both NetworkManager and
> systemd-networkd.service(8) allow this. Note that
> systemd-hostnamed.service(8) gives higher priority to the static
> hostname, so the transient hostname will only be used if the static
> hostname is not configured.
> ```
>=20
> systemd-networkd will use the static hostname anyway even DHCP gives a
> transient hostname.
> So I do not think it makes any difference.

Agreed, this is all true.  I think this points to a bug in our hostname
implementation within phosphor-networkd implementation.  We probably
shouldn't make it worse though by using the `/etc/hostname` directly.

What I mean by bug is to me the desired behavior would be as follows:

   - Out of the box, openbmc should use the DHCP-assigned hostname to
     set the transient hostname.

   - If a user sets the Hostname, this should become the static hostname
     and override any transient.

   - If a user sets the Hostname to an empty string, the static hostname
     should be cleared.

What is happening today is:

   - Out of the box, the hostname is set to MACHINE.

   - DHCP-assigned hostnames are effectively ignored.

--=20
Patrick Williams

--l+nut98CKlIk0473
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNP4O8ACgkQqwNHzC0A
wRnkkA/+KfLLqpZ027QnGmUmzkwOHxEuqI94s/GSR3WkJU810SuSiMBuSkKiBP+6
fYVtr+nsUbY+dX0Q/BHr6RO/csSp/ZHlN4NoWk7UYb8TxS49bcLjO4NE4Gbm/lGT
E0m+whXBkQDIaW1z9j3OHzZT9mqOctKOOofydLqsJSui41Vo0IuXPJB3D0+rpEBx
39k6nnQ7NW3yI1a/C8LQEJnPl5N7XLrr5zcU1PUD0z3eeRQZLjyCYh97AQDzN+6L
KZDjbXbPhvjMqDWT5PE3V16GEHZ2ReY31TSjzgE2ti5UCNKDPVwp0ik6/gBtIT2W
Pq3JbM2iFnLlWfVl/K2VPSuuGiu2Crne8n0ZhU5Uf5QDyKNIq4XoCw9XNEq2FnGE
v+hkl/lkNxtjTocRV0lqAGV2x8efurKsT8gXTA489+nH/lXX/VGl6DkPhJk4doIE
nztiPLDSWYpBl8HY6wb35fog8wjQxVFkjPCDIVAI2LAippQ9DRpXvW6uEUyjLuHc
8t3dk+FvwGtB3SwNn384yVbzBbdC9tfgjx8gk3oy8gpjtTPvqkG8bkQM2tmkSUJU
GABsZ0cwBvyubL6NmV1snqDXTZKxg4x9zQz8LsQAMHdpfpwUVbkYm4QdqYO2wcjx
wBPdfxJXj9lbHh2nFNeEuy8Wwhvl4Rb8CLcJMGpsG4ASpWbYFfI=
=e6ea
-----END PGP SIGNATURE-----

--l+nut98CKlIk0473--
