Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F05735E2
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 13:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjbhY3TXQz3c4L
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 21:57:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=QrZe6CuV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=y7ccFOH7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=QrZe6CuV;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=y7ccFOH7;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljbh84WlBz2ypV
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 21:56:56 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 923E95C01B0;
	Wed, 13 Jul 2022 07:56:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 13 Jul 2022 07:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657713414; x=1657799814; bh=/FspJ8KDgC
	CdNUzV4x/AIkt5HG3fFePeIgOti7XhFe8=; b=QrZe6CuVsTrWT6Y1xeDoJXuDsm
	VN/qbnFRqMrjshL5IGr7Nbm8T3VHv99kJ+dJAjf7kll2iAGLothou5up4xmNNH57
	YPrWZp8WMlMiyOwV9sv9lm6+KjCJ/ssOuL5RflGFDVMBQXb9if9uCQ8brMv0PSEl
	1SnAh0rIjDK0DLn2x+Fm0KzTaO5HAyqTSW3PMiwlqWMNI92gB9jC/P+YbIOYccSl
	e8im/9Ur1y7Y6z815VIRxQXkmrv1EbYhyUWiM86y0Y5iSIkYtC6O4WOofahBbrtU
	3yDbZTTQ3+ZRVQ27zFDTXJ6PSX4p+BpQf8f56cd0JGz8OJzYeyANmYQ0jWdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657713414; x=1657799814; bh=/FspJ8KDgCCdNUzV4x/AIkt5HG3f
	FePeIgOti7XhFe8=; b=y7ccFOH7OYJLf2QEiZYw8CEcOSESb0jlFKvFYUfeaYLT
	570+gDtPv8Q1uzdYkPtNbYhIRrz5krWg+2DTNwOCXXQf4xlq/rPIYTcCOwwfkzIA
	9DFXLkz0WZAVCtnhMSC5P04MIg6ANdO54l6AEIPcGMX3F0T23zai5IN6RTT+x1zu
	GamRK8JDdyRDaWQTaKtdOHvhIFKfTgKUQKKAtu0pXX0iS1khDtrxbBrh69W8/i4m
	r67D9UAyd+AakSsMgbnc54M4BPqi0cJwzUzJkcK7gtLapwIwJy90x7As6GZOAfA4
	qIhheSoostGNZ1wtQnrJndjBuQPwroM2yFx6+7uyog==
X-ME-Sender: <xms:BrPOYh2t9aBBDp9bgeLAs49JlS7AnckKDii-fgdtLUhoBUJET8uGsA>
    <xme:BrPOYoHf1EaxP3yYbKzxD2GRqqnkEyI1LNdl4IASEeuGR5UEFU5FXddBnwMiEZb_P
    B-1ucwf3KvYQ0BR4rE>
X-ME-Received: <xmr:BrPOYh5ovUnbzzhiPqSVVTptbZw2CQ4_3NxgDPA7qUphyOjBWEtmoIwdnu-l0ZlUkmGk2KZRdDnnvtlIYuF6_XEEEkoe_4d8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpefhgedutedttdeijeegteekteef
    hfduheegfeeifeevudeviedtgeefkedugffhheenucffohhmrghinhepghhithhhuhgsrd
    gtohhmpdhmvghtrgdqlhgrhigvrhdqghhuihguvghlihhnvghsrdhmugenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
    iftgigrdighiii
X-ME-Proxy: <xmx:BrPOYu20u9WEOjla19SLGntknYaQ4F_usj-XFhR_RYoSipgWs2e-AQ>
    <xmx:BrPOYkG7ODJ4xiFqvIxcAf4S0zPSKe7P52onFZ13Xh15DmoRvBhLaQ>
    <xmx:BrPOYv-8NtkUg8TfZ0a95ue7BTZb2QSIN1nIGLT8_IaTCfgBi6JiGg>
    <xmx:BrPOYvMquPv8ikT23Hux-yDF6LlEovhj7gWdzxfGvKX8PSlcC8syyQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 07:56:53 -0400 (EDT)
Date: Wed, 13 Jul 2022 06:56:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brandon Kim <brandonkim@google.com>
Subject: Re: Request to add "meta-google/recipes-google/console/glome_git.bb"
 to auto bump
Message-ID: <Ys6zBXR+8AP3wjYG@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CALGRKGMTT4Rb-VzxBh-2zQKXkDHH7Cye1YzqyHxJZp-09A=ggA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ugGxSbvdNEV/zWwl"
Content-Disposition: inline
In-Reply-To: <CALGRKGMTT4Rb-VzxBh-2zQKXkDHH7Cye1YzqyHxJZp-09A=ggA@mail.gmail.com>
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ugGxSbvdNEV/zWwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 11:42:58AM -0700, Brandon Kim wrote:
> Hello,
>=20
> Following the instructions in
> https://github.com/openbmc/docs/blob/master/meta-layer-guidelines.md#dont=
-use-srcrevautorev-in-a-recipe
> we'd like to request "glome_git.bb
> <https://github.com/openbmc/openbmc/blob/master/meta-google/recipes-googl=
e/console/glome_git.bb>"
> to be added to the autobump list if possible (or let us know if the
> instruction is outdated - or if there is concern for adding a meta-google
> recipe to the autobump list). It points to a public github repo under
> google: https://github.com/google/glome

This instruction is correct still.  You should never use AUTOREV in a
recipe.  It makes it so that builds are not reproducible and at a
minimum breaks the release process.  When we make a release we'd have
to make an additional commit to pin all the AUTOREVs, which we don't
currently do.  If you look through the entire tree, including all the
Yocto meta-layers, you shouldn't see any examples of using this in a
formal meta-layer(*).

I don't think we should add glome to the autobump list.  This list
currently only contains recipes under the openbmc org.  Honestly, glome
shouldn't even exist in meta-google[1].  There has been some discussion
about what does "well-maintained open source projects" mean, but lately
we've been interpreting this guideline to mean "nothing outside the
openbmc org".  The expectation is that if you really are pointing at a
"well-maintained open source project" you should have no trouble getting
it put into meta-openembedded instead.  This saves us the trouble of
having any debate about what is / is not "well-maintained".

My recommendation would be to move glome to a Yocto/OE meta-layer and
deal with them for updates because that is what we've been suggesting
for anything not in the openbmc org lately.

(*) I do see one in one of _our_ meta-layers and this needs to get
    fixed... one of the problems of opening up machine metas to almost
    any company who asks with little review oversight.

1. https://github.com/openbmc/docs/blob/master/meta-layer-guidelines.md#met=
a-layer-recipes-should-only-point-to-well-maintained-open-source-projects

--=20
Patrick Williams

--ugGxSbvdNEV/zWwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLOswMACgkQqwNHzC0A
wRlzSxAAg3O8jM0T4rN93k5OBhFKnPn8UybezdX0u+tXobuAa/ByNpxjZgc0UvhP
4RXSmozux6kTpyt+7WzOkuqw+GSU+TJxfv53iC2ggRyhwypwGARiHVhXmkH/XXtB
xVqWE0fiUTRAuiCEU6y2Wp+wrynr2gJCuIBT0EA2vMzdEODmEOqnxr5ls9IEG8O8
FlrWOgiMOag5bvbx29vLbuvNHq+EE/+gj9JX/x8I2K+/faL59PDgJBEkw1dpPegJ
mAP/YyKUWA5jX2AIlmwpMa0h7z+aeT0qg8c5duFD9giYDB/YPq0E0apzHQes9+HN
vx4QGibCTzeWYPNKh/3pS7fUADn9LAmG+o0k9sLtN9+xKhBcbbeGJuMpiXzxB9kz
eRMhgmL58Eowd5TRsqpOgc2mbVeS0JIkOZYXRP4drRJvm/jKOkyYRrkXRzwdpRUO
g0lC0leTggXjrmK2CN1dxdfWj7zcCIz4rODMXgTS+wbT/5J5vCTzp1ebJ/BXUvOa
7IWIsazn2EQCHGdfW3AUlfQdQY3FKvaJH5doy8W3uB0THmZOxScYFptO5/OZ7Nqm
/7leizD2JdgGOW/3hDXvr/fx/18C/sNDdO9Ula0ONBIwISlC7HgL1Tu95bfJzTBC
zXpr/ItAQoE1rWgRSIBYYEtdMeRS7VB1ZwWo5oyVlZoMqnNTats=
=LeNI
-----END PGP SIGNATURE-----

--ugGxSbvdNEV/zWwl--
