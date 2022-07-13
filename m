Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EAA573550
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 13:25:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjZzy6L2Wz3c4L
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 21:25:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=HwXzXKKj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HjpVfW5+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=HwXzXKKj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HjpVfW5+;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjZzR55LJz3c2W
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 21:25:05 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id ACF105C01B9;
	Wed, 13 Jul 2022 07:24:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 13 Jul 2022 07:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657711498; x=1657797898; bh=nJEOdYr6ZZ
	yi+ubPuyg89qmIqgFxeTcywr1xsDT9Rkw=; b=HwXzXKKjaZBq9cQ+ek8VBdG5lI
	QYQeE9ZuvMaNrIn3SvrNm6mVeQj2yHDGLGNxKTmfxMBfH4gDZCjiS9VZk0f5zy/6
	3D7HFhV5yKOdp/VkfhdHvFvXDRNtqJkZlHAAtY0NPPuhPSlKL9uwcoyyggAnEw3y
	j8zQl8vwqyzK+LaGuWKW8+mNqrp5DSxOJqSnNyAg4h1Obfv5A5VgLf0dUKHj9fZJ
	F1sQl6Vyu6peWLAvQF6PmMghhpkoTMQE7R1ZjPGi01ZFfl0dwNDlmrbv76MmNXO1
	phQ2CxrnsHZ8yx1bfJJIFmA8fEWlNq8xmJXuZ6sW+EJPS7RbUbM/FI9PO2zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657711498; x=1657797898; bh=nJEOdYr6ZZyi+ubPuyg89qmIqgFx
	eTcywr1xsDT9Rkw=; b=HjpVfW5+OaMqKuYkRmbi7oPf4K9LmqIlKspti2j2CSFa
	pnPz4LA6TEGwORG0g6767rhjHfqI+qHE5UOHJ+GBPfSR4kwoQom9DfVeEAaHeEa2
	jYzxRi3TzPamMy8kkqjOIhlBxXka2IdcELawKIxgoa9PpmleaaHVU1LbdVpPOtYT
	ueLeaHP0BjSF1dCkHI0E1LHoIFHfefsDqH4+li2OvKQ7IdMGftvHnhSkj+NHDWtV
	qIxu3q7u1x65ZdwMPEUrAngcMfoN2DVYO0EG3KyXCsRAdqPYbVX+pVBa6TZ636ag
	A72jNWSVsAc5qUCuLHWbcTGiPC4Lv0aVBSfUpXVLrg==
X-ME-Sender: <xms:iqvOYpRcZSmzI3ZokpmaT-7KJuUhrZ_Zvhs7hhKuUTts31LSnZJIrQ>
    <xme:iqvOYix_u6m-i6VYa1fFBuZpCkWvFxr8kHKRqQtf9gXVDj9sw3WCR-QmD7ifuFgSO
    m5lZ36eqhUQ1yl9wrM>
X-ME-Received: <xmr:iqvOYu0FBxV3q4BmbCVPDpEDZkJIkOYzEfDZk360W5Zclu6mPjF1Xtry8NfeVgW1xon4R1X4eWQvU2iAwXwybrArOOutjYdf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:iqvOYhDgr4Seq8cFYFGpCAzXuufMPcGS0nmBW4AnuGjiRnuJKwgaPw>
    <xmx:iqvOYiiLNC2FQQyBddMLFFDPKKpmhlcJv8dUPw8xB6oOypWoKVkyzA>
    <xmx:iqvOYlrMK-7YAJ1nYhgojQTXQfV5vxU5URUubjw37jUgVQhj9DnbrA>
    <xmx:iqvOYlvVxidaWJKFlH3TU5kP1ZYNuOUawujBYtwwHntQ16dnfiCuSw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 07:24:58 -0400 (EDT)
Date: Wed, 13 Jul 2022 06:24:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <edtanous@google.com>
Subject: Re: DBus ObjectManager Interface usages within the project
Message-ID: <Ys6riEnZm5SP8v76@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ChTB4/r4nBVNIPLe"
Content-Disposition: inline
In-Reply-To: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ChTB4/r4nBVNIPLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 11:48:31AM -0700, Ed Tanous wrote:
> We've had a couple cases in the project where patches have needed to be
> slowed down because of inconsistencies in our use of object manager, so
> IMO, the time has come to make our usage of ObjectManager consistent,
> documented, and drop support for the (not upstream) daemons that don't
> follow the rules.  As part of this, we will port forward all the upstream
> daemons to be consistent, and do our best to avoid bugs, but this email is
> intended to inform those that have non-upstream daemons about the change =
so
> they can resolve their implementations.

There isn't much in the dbus spec that puts requirements on where the
object manager is, but that certainly doesn't mean we can't add our own
design requirements on top of it.  Thanks for starting this.

> The basics:
> ObjectManager DBus interface will now be required for any daemon
> implementing a Sensor.Value interface or Inventory.Item interface.
>=20
> Daemons producing sensors will be required to place their ObjectManager at
> /xyz/openbmc_project/sensors
> Daemons producing inventory items will be required to place their
> ObjectManager at /xyz/openbmc_project/inventory.
>=20
> Both of these interfaces will be required to be published before claiming=
 a
> well known name on dbus, to allow for the possibility of caching
> implementations at some point in future.

This means we can end up having N object managers in a single daemon if
it is hosting multiple namespaces?  Why not just host it at
/xyz/openbmc_project?

> This was discussed pretty heavily on discord in the #development topic, a=
nd
> some of the nitty gritty details on why this is needed is available there,
> as well as I'm happy to discuss here.  This is one of those nasty
> spaghetti-code things that we've lived with for a while;  Hopefully if we
> can get this behind us, we can get some good real world performance
> improvements.

I see the background being discussed when I read through the history on
#development, but I don't see the rationale on why this was chosen.  I see =
one
comment that placing the OM at / is "wrong" but I don't see any justificati=
on.
Why is ".../sensors" right but "/" or "/xyz/openbmc_project" is not?

We had a good chunk of this discussion about 6 months back in
phosphor-virtual-sensors where some Redfish code was broken against that
daemon because it _was_ using "/xyz/openbmc_project/sensors" and there
was a patch to move it to "/" which ended up getting merged.
Fundamentally, I think it boiled down to neither being in opposition to
the standard and there was a bunch of code that already implied "/" so
it was the simplest way forward to achieve compatibility.

>=20
> Thoughts?

I do think that moving the OM lower in the hierarchy is probably better
because it allows us to have parts of the hierarchy which do not emit
signals, where having it on "/" does not.  I'm just trying to understand
(and hopefully document more) the rationale on why this choice was made.

--=20
Patrick Williams

--ChTB4/r4nBVNIPLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLOq4YACgkQqwNHzC0A
wRnd7w/+NfgIP3/sKlYRc7flzmYoyZ9JapPBoJT+7SR/kG/g3+ZGU5DznAR8/oBn
a4s9gugZEVFJm+DYcz0hkWYzNRtee8pYO/EYgW3lm4mwol+e390sROMiLeJ5oHRy
wyJssOIqtSJLjR1fPQDe12bYDXF2taArQI/YYeOZtNCK2w24rcEVYFPwuV518d/R
hJ2zuFSSuJwZwrZfyt5RS/G/1/0U3lCi9WiMGbMoEsUltoYAEkC2D8xH1iBKTjVG
WlPt6xQ0hjyX0p8JNgLouTLyux8ny/LlN6hztYkJqufpCWLtyQpofbkD5qYRDlhH
mZRhF4o5EhCdwK6SpAxSrL+Z0IgajJOE7CUECAV8vWjHNOF19Ggvk9WUUc/uL3j4
E/I0/hs/nk6d8CAcdJ304WvfSfawSuMaP1O2iUHjc8aqxSaTv1gGeD1fuNpQ4siC
zLh5kmHuaNmSjCUaUb2NtbGgQxhZCw8bVlT9qxZnYZl6zl4Hau4PqaKD/WaYg/Cx
1x9xtnqrEELELwxjiHbka4FwJY4XYhTKc4bENE+1YuDdRp950YXiR8gRJaDOa4hf
dT8zOgakxsafz+udjxpQXpfP8vYgRk0kdVQ8XyE3tlHKrYyeu+5vI8elIFoBjDKr
BfBVSHj5XiE6QYnQg9w8Jn3nGfHhNkQmulxxgEtGNL1/Daqq1ok=
=9fc3
-----END PGP SIGNATURE-----

--ChTB4/r4nBVNIPLe--
