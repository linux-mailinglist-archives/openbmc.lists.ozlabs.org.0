Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB95AE913
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 15:07:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMQfK68V8z30M8
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 23:07:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=fzBE5EGI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fyFhcTET;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=fzBE5EGI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fyFhcTET;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMQdp0S6wz2xG8
	for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2022 23:07:09 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 9242B5C00B5;
	Tue,  6 Sep 2022 09:07:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 06 Sep 2022 09:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662469624; x=1662556024; bh=zLrm2OyhHm
	OP4allUC2rmXePUpo6L2YR9/p5Rhuziqw=; b=fzBE5EGIAoSqteWRi+3JrSTYM4
	871UVppb1D2i4/BxWMDdRD367HGxaidL2GMZ5qe0WfbXmm3vYwi8WzLO+ERaPa5q
	onHqX4a6m0iG+/lMC46WeB/N8dQ9pB8SnkgHiZAKsrP/402TqJCf5VB5i41xa/o4
	PZwJ6Fzhf1VucjfPEKLtFTVJ2Vp0wfuFQkYXJbvpzv1Jjh2uTzqepfPBOmyLjQZe
	9nNRiVuqqB7rOXfohdxjtDVifzSMrfKYTcCCoJstnN9iRsvZa0lpcWghf0G8PBOP
	o7k1IvE0O8YGKjx8NDXjkrKPBbJxV+dKjpJ63TTiYi1UtLmUN0Jg4siLj2xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662469624; x=1662556024; bh=zLrm2OyhHmOP4allUC2rmXePUpo6
	L2YR9/p5Rhuziqw=; b=fyFhcTET52uCIby2QzcWgyZoBQaEebantfLgCVJOMxMb
	9Xf46IWcycVPOvAb9KOz5LqPqVH63WCS4fjMzAgRrtkR428c+3PI7ueLi9la6RDa
	JLwRE++cnb2tibf1ZnTSVRx1vu62mCCKtBviTYLCq0t2MNo5eecYzyExt4tqT++p
	gTHXGc7koEK/gptFljq43/XvATo7MpUQHY0/7OWHJpuJ8fli+2dCPjl3xtnEkup3
	2tFEvegjLVwLdsAGW7DoXjmYkjcgyBxxrLzEG+/iVbcaWXatPPkBwWbs3JwZjck3
	MaVe/nxhAloWiQkoonUzIY8BRvK4NFWJ6BOlH9HaYg==
X-ME-Sender: <xms:-EUXY8DAtbjg7OOy2hiyyzbX5pYoC4QLrNWekZgoPAomvmobw8dbeg>
    <xme:-EUXY-ithWlUrkKtU5ksGhXsJSAAceXjFDbmnn35izwBIJCjR4rwSutiy-zjvnn91
    1mK6CqysCwcdt2fyrY>
X-ME-Received: <xmr:-EUXY_nTaYFlIu7KeVzJXokz8KsB-CzHhpK_PqqsMqoKGE9OKwi031SQSexNpUZuRKbel4FzSm9MliermVuhSNpPmzYUEeQ9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtjeejgfdugefhtedvudfghfej
    feejfefhffeffeelgeduveejleelffefvdffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:-EUXYyxj8MoEuy6mUv2zBGyVwzW3a5Aw0fR5YLVxtglKQcp-7SdhSA>
    <xmx:-EUXYxSGRzImwdlczlk0a4hOKFTn1d9vQJwRN287sIhCSvILDXLYtw>
    <xmx:-EUXY9aqQB7tGwHtUabSyDV2qnEa9ULhFZTrUpO1ovX7B76kq_8YJw>
    <xmx:-EUXYy4XltvS3S-u-HG0RB3_Q4QyKI8YwdbZ8Oo8Mpk2GLniA6l_wQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Sep 2022 09:07:02 -0400 (EDT)
Date: Tue, 6 Sep 2022 08:07:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Message-ID: <YxdF9cXGRhOjbVu/@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
 <5723faf6-66c3-1793-699d-ffbf61bf3268@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JGXE0TYz+k2zu7QD"
Content-Disposition: inline
In-Reply-To: <5723faf6-66c3-1793-699d-ffbf61bf3268@linux.ibm.com>
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


--JGXE0TYz+k2zu7QD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Overall, I don't have strong opinions if someone wants to implement the
Keylime agent as an option for attestation if they think their customers
will find value in it.  I do think we should be careful about any
wording that suggests it is the preferred way because at this time I'm
not convinced it is an appropriate solution for the majority of users.

I'm not expecting IBM to implement attestation over Redfish but I
suspect that will be far more applicable in a general sense.

I could be wrong on Keylime.  My initial reaction is that it is going to
be difficult to get a broad install base on the Verifier side.

On Mon, Sep 05, 2022 at 01:56:39PM -0500, Joseph Reynolds wrote:
> On 9/1/22 6:25 AM, Patrick Williams wrote:
> > On Wed, Aug 31, 2022 at 01:09:10PM -0500, Joseph Reynolds wrote:
> >
> >> DISCUSSION: Create two separate designs for:
> >>      Enable Keylime Agent.=A0 Direction is for the keylime agent to op=
en
> >>      the BMC network port (using systemd, sort of like how SSH works).
> >>      The intention is to engage with Redfish for how to configure the
> >>      Keylime Agent: certificates, start/stop the application, etc.
> > I guess you said someone is working on a design for this.  The Keylime
> > website seems light on details to me, but I'm having trouble
> > conceptualizing how it is applicable to the BMC.  It seems more like it
> > is geared towards a self-selecting cluster of services (which reject
> > peers they don't trust).  Keylime does have the unfortunate aspect of b=
eing
> > written entirely in Python, which makes it very difficult for us to sup=
port
> > on any of the NOR-based systems (all of them except IBM's latest).
>=20
> Yes, an IBM group is working this design.=A0 The design we discussed in=
=20
> the security working group meeting has two parts, which I barely=20
> comprehend.=A0 The parts are:
> 1. Code running on the BMC will "extend measurements" to a trusted=20
> platform module (TPM).=A0 Two separate pieces of code are in U-Boot and i=
n=20
> the Kernel.=A0 The "measurements" are the readonly code image being loade=
d=20
> and run.
> 2. Code running on the BMC (the Keylime "Agent") will query the TPM and=
=20
> offer the results to whoever asks.

This is very concerning to me.  There is no authentication?

Blindly advertising to the world which versions of firmware you are
running so an attacker knows exactly which vulnerabilities you are
likely to have doesn't sound appealing.

> In my limited comprehension, the end-to-end flow is:
> 1. The BMC boots up and extends measurements into its TPM.
> 2. the BMC admin configures the BMC's Keylime Agent.=A0 That is, starts=
=20
> the "Keylime Agent service", and provisions certificates, etc.
> 3. A network agent (a "Keylime Verifier") contacts the BMC's Keylime=20
> Agent and asks for the measurements.=A0 The Agent that queries the TPM an=
d=20
> provides the measurements.
>=20
> Redfish has specs for getting server TPM measurements, but does not have=
=20
> any specs for getting BMC TPM measurements.
> Because of this, the group doing the work is proposing for the BMC's=20
> Keylime Agent service to open a separate port, and to not use Redfish to=
=20
> get the actual measurements.=A0=20

The way this is worded feels a bit like a stretch argument.  If Redfish
already has a schema for getting the measurements for a managed entity,
wouldn't it be trivial to extend this schema for the management entity?

> In support of this view: there are Keylime=20
> verifiers already available to use this new port, but there are no=20
> Keylime verifiers to use Redfish.
>=20
> It should be clear from the paragraphs above that the intended use case=
=20
> is for a client server model, not a network of peers.=A0 The Keylime=20
> Verifier client running on the BMC's management network contacts the=20
> Keylime Agent running on the BMC.=A0 The mutual-TLS method is used for=20
> authentication.

Alright.  Maybe there is authentication?

mTLS presents a bit of a chicken-and-egg issue, doesn't it?

    1. I don't want to install device-level certificates on a device I
       haven't attested.

    2. I can't attest a device until I install device-level
       certificates on it in order to support mTLS.

You've briefly mentioned "BMC admin" above, which sounds like something
manual a human does.  This doesn't work at any kind of scale, so we need
to consider how automation would perform this activity, especially in
light of the fact that it doesn't trust the device it is configuring
yet.

> Keylime is written in Python.=A0 I think the the idea was to either port=
=20
> that version, or to use the new implementation in Rust.=A0 We did not=20
> discuss any difficulties in image size increase due to Python or in=20
> getting the Rust language environment ported to bitbake.
>=20
> Joseph
>=20
> > Are we also planning on providing attestation information over Redfish?
> >
>=20

--=20
Patrick Williams

--JGXE0TYz+k2zu7QD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMXRfMACgkQqwNHzC0A
wRnQHw/+O8yCvIrpc3rxoYxa4S/g4DD3H4BNJiXoaghiA+zs/E9bYc6jrDJce6Ex
Dp0dda6lPh7b/F3Ou7PNaQCQt3dCNd+gxkyFOXfvRKtRyf0HaH3X+Z7sSKD7c0Qp
0HI+P8dRQ2uGKBGKwp+ojHeX2V1UQsr/FL4lbEZDZe8CS6n9pMao2qX8ZfuPbFGy
WXhMii5atb44s2kaQbp8rvyXdA3IzHJej4+ePszX9CFiDnL9fC/G0PUbykZhazbV
Spql+plwiFZJX/EdWMfTwChj/UtJMmjDyLkIXOcrS+HHfo5NYSSGeUGm/AxutIH1
3PgCApMsKINpbu00/cr4VElHIay1BDLRPTkHdGkmqTCDMCzh55hfMQzcxH0dDZ2V
hUE7jzh572e29cFSZF5XQ7cY4S2w23ETtmUbXjv/Ojhn3hjVcT7no39pvaNaF9io
ay9FKRxOqI16VrF+puADPsDwjuRrSGK0kEIyfI3z7vHNIbo+gEvHT0P0BucRvZjK
RYe2obloVf4uGStcksG6RVMo4wspdDg1RA4YK1fsa41G30wkep0f2q1iKsOaL5lQ
ozJ3iVmqXWbVW85ktXJpPtN00IYTzxRWhO0x0FN79j4BKEtw+TMfzzgKLXjWVLtN
Z0dyI7XLxykdipBX22ZlGlDeBycFuwkjKxW0Bjv+TyBAWLtgnrM=
=Bg4g
-----END PGP SIGNATURE-----

--JGXE0TYz+k2zu7QD--
