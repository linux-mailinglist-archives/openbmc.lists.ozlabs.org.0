Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6745AF5AA
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 22:17:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMcBC5SQ3z3bc8
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 06:17:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=lMb+hoPJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=URSGRGaI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=lMb+hoPJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=URSGRGaI;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMc9h6SGmz2xn5
	for <openbmc@lists.ozlabs.org>; Wed,  7 Sep 2022 06:16:55 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 19D675C0105;
	Tue,  6 Sep 2022 16:16:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 06 Sep 2022 16:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662495410; x=1662581810; bh=Cqw8qFnSZi
	zYQVIDrvDC4k229veTAXJaS0do6DjiSjA=; b=lMb+hoPJO9HdmzJcBB+hLAW/IG
	T1BvfDLjO2kZTb6gQg0xESy8EeIASjjLDSUwFeZVZJfgPRdtOmbojGh9BycPMcFQ
	vwG4GYty0m5gKzW31NcysKY7u8Se6agEcro7GOuUJ6N1vIs6viUjaA9uhYoq94MJ
	2rHzGv4/LIYXatbWC/pmii9dilKUTFqj5BNdKnx6XiXBiN8Eb2hH0hAVyQcjosiO
	IAed++NfM3uMwo7cSF08/tTxcqE1usBqZKk00Vhx+38sJGJnf9OY4Ku5YEpeqv6o
	eWgacJfN1Yn44ykrayh6t44ub3GMejAknqs1RNXW1kVR5IABHmLBvB2BSyrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662495410; x=1662581810; bh=Cqw8qFnSZizYQVIDrvDC4k229veT
	AXJaS0do6DjiSjA=; b=URSGRGaIObz0hLvp2AvRBJXMQfXbFo3y261cYNr724wT
	wN3JIDXWp/Rwm9zKn+aFEPz+M027+pk8ovdwegv5HeaBxe835NvAqXsclTm3iRa4
	eQiAKQguP74FyYhxQSScpM9COJtZFUIgh+LIhEeeQkBK3F037PYJzqPI36Ju75lS
	uajlRQGKSKShe0vgLelWV9BbqEWSXwZ1GmeAlTcCt9EfxafKcAi3ijzK1nWth8NO
	1FMukNEMaAGMM6SoeAvbOUXCT8kMkQF24mnNPCug/kAhk+1+0iuYN/r2D6n8EnQZ
	aCZ/DsqfcEwgsqFpgtzk2tQqZPOo4WKg9hmvtRBS0Q==
X-ME-Sender: <xms:saoXY1eov8q-NNhZPjA3sgCovl1oBtxUMO307Y4K1lH7JM_5EkRGIw>
    <xme:saoXYzPzAm9E1pr9I3Dy8eFkquFIheGBXZzf3NK6Ifv1WrEpZARJz3jROoQVkE_Zh
    UxEPiDqVAwhtadZkM8>
X-ME-Received: <xmr:saoXY-i2JU9NCiXyhvv508-Mmh8mDRsIhpCMjVEv3x8PWdAOBHgZUsf9PkQOLBLZ2-xckon1gNpLWzwmGcZypDEVwejN56oA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgedthfehgeeljeeigfevhfdu
    kedtjeejhfeuheeigeevvddtgfekiefhjedtleelnecuffhomhgrihhnpehophgvnhgsmh
    gtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:saoXY--8JqhyUYe4Dh-MhmnF4fs92FSfVNok-cHYlzv3yd7IYk_jDQ>
    <xmx:saoXYxvw1BDWNx5KLp9xnXnpOmG2CQHFmFKgNvOqiv4zqUFkk_Jg4g>
    <xmx:saoXY9EZLb6J_Nr5B39L0B6TUOgryDIuOdWC7-Z0VJBZnvBHs_1WMA>
    <xmx:sqoXY_3IS1C1xGdPBlnI1uMuTWTiLm4U2Cm14yRWun5JlcwxbkBiJw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Sep 2022 16:16:49 -0400 (EDT)
Date: Tue, 6 Sep 2022 15:16:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Message-ID: <YxeqsBYrDMFEVIF4@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCXBocd0Uz0u1D7@heinlein.stwcx.org.github.beta.tailscale.net>
 <3ffc663e-82d9-1ba8-9a47-9b5876ab2dc7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1aKXMd00iPOm/Okn"
Content-Disposition: inline
In-Reply-To: <3ffc663e-82d9-1ba8-9a47-9b5876ab2dc7@linux.ibm.com>
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


--1aKXMd00iPOm/Okn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 05, 2022 at 01:59:56PM -0500, Joseph Reynolds wrote:
> On 9/1/22 6:27 AM, Patrick Williams wrote:
> > On Wed, Aug 31, 2022 at 01:09:10PM -0500, Joseph Reynolds wrote:
> >
> >> 2=A0 Proposal for dynamic changes to Redfish authorization rules
> >> https://gerrit.openbmc.org/c/openbmc/docs/+/56401
> >> <https://gerrit.openbmc.org/c/openbmc/docs/+/56401>
> >>
> >> No discussion.
> > Does "no discussion" mean?
> >     - This topic was not covered.
> >     - Nobody present seemed to have an opinion.
> >     - Everyone present was onboard with it as-is.
> >
> > I'm trying to gauge where consensus is at.
>=20
> I use "no discussion" when the topic was introduces and described, but=20
> nobody expressed any interest or asked any questions.=A0 I think someone=
=20
> asked for the review link, which was already in the agenda. <-- Is there=
=20
> a better way I could say this in the meeting minutes?
> When an agenda item is skipped or omitted from the meeting, I'll put=20
> something like "the following topics were not covered" with the reason wh=
y.

Thank you for the clarification.

I assumed it was either 2 or 3 from my list above.  Sounds like you are
using "no discussion" to mean 2.

--=20
Patrick Williams

--1aKXMd00iPOm/Okn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMXqq4ACgkQqwNHzC0A
wRkB+g/+NYhieWI/HW3b3aWUdXRT4u+HvZXZ7nFPhY/EAYWVU0BzeTazVWC3PtP2
IrHjAeaFQF4QTPcO5ClnqUCPYiG/EXH8ITuUgIJpR3T1i8Fv/Ic5gUloPQ2jLL4f
X+ISlYyNzrvLEDXAMJdBdOJDevdEwKozGi6U4Bsc6W5nYTSbI3ZQxrWglLWqqbdk
3zWef8XG96FAkl7Eqr+NAFzHG1lMH5l5R27g62lGeGd2xvsDC/80TeQw4Yk/ISLf
UkxQ/kQ9/Du/pp1LJF90A0idPmKa5I4rRYBJMWoLrINjf8DwfAjH5Yv7tjDzCevk
5kVgzlU1EB0OBkxH461wo9hFaj8d66secbXVft3hdgkLbOTUq3A3vwAygnJmelR/
2Yw5dKg6CtCqhMq9QMNVYI9zHnwZR54SWb/wrEK1moMDjVq3Sv6pwwkTGDqASjXG
xreobQutjJyjJENzzpvpN9ORMz4hoGT94s92BNxQ3udtOGGHvH7Ion8J3O+ShB8f
F1aivqyRHEBp1f6l+b59R9x+DU67fRiT4eMmd4DKmVnthRJWV4uPPTA6yhVZdlHz
exiD2Tb308/s7DPc41R7OG7WZYmen3O3oBeJA8qQrA4f1qLJ+77Njc1I63YhsAIQ
8l4NngPNdwT3LnzrJviQjuPfqFZw4hE0oXXRjt79rN9BVoEhZuU=
=Nl3v
-----END PGP SIGNATURE-----

--1aKXMd00iPOm/Okn--
