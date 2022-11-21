Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0B763272E
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 16:00:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NG9Xz487hz3cLm
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 02:00:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=FeqIyHsE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xGb7b2xX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=FeqIyHsE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xGb7b2xX;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG9XK11LRz3bcw
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 01:59:27 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1AADA5C0185;
	Mon, 21 Nov 2022 09:59:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 21 Nov 2022 09:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1669042764; x=1669129164; bh=zw7TzVhwJt
	ycSqqM0+xfvCW9Euq6ObcD7FPU+5EpkHM=; b=FeqIyHsEvLSBM+PjeF4QlgSy+K
	9+fE8bLWHmxrtGh1+5IdVszFg0FmSa07ruio3Nhj66SohkNXRa9xb6y9PKSXShHv
	RYIYDyj589c00YgpISa6qgFe4EeF1yweHnvF7NrrIdBQ5hhVdLVcaC2aTCxnNGbr
	LmDFako3hRFwRal5oQNeFLwqerQyBJneSkvlWsW1hvyQUU8gmslr9LJYkrX8ozF1
	OdFCU5SsYiJMCrdpsT4F0R0eMb5ITIny4+BBAGEfkgk8fT5ROdPP6CWbpsoLdqcg
	9rFdUV9rEXr6Byd/4Cr1Yti0nubYNHOkKNV7/XVphDijNKzQsPjXwiMTB/NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669042764; x=1669129164; bh=zw7TzVhwJtycSqqM0+xfvCW9Euq6
	ObcD7FPU+5EpkHM=; b=xGb7b2xXa2FKZ5np8Vg5BPWh8dD7n2z8loHzJjNo8g8J
	XVm6VG+J/lgmLiEg61vAcnuxrWJ3Phk4/3xY4FWeqymflWLMuRldX5hbyTB2Kdmg
	8oDUV1/JaQTJzFXHNNNCc8Ra48lGa/kTJFXzE7mL4PsNzk6q2Q5kgbyM4d6L+VnF
	l+Drbv/T8hSvh1B8qGN28/KA2iHpahnVxIpwsdT/t+pKaxM37DVD+Yx4tUgYYCLt
	3pqD5mx7IWinGwB9Ro5EOXPMzjLNFgKrRymlTueUCmecBRGOHaZCJNLQ05Uq7ll5
	OpkGXIMDLsLvwoxhQKCLmSAD9Ltgx/VlVaUab9knIA==
X-ME-Sender: <xms:S5J7Y7V8MA9LqijJ_Sd9HFUNdRNS356Rrkf4K_OFGImvYk8Px9mRTQ>
    <xme:S5J7YznTgTyOM_kTUoYykh6KUI3ZZhJ0ZDifhhq_870vw_IpyTKW7WU4R5ea1is0i
    WB7O3h2qRmjhwWOLJM>
X-ME-Received: <xmr:S5J7Y3Z9-ISsUDtbu3kOe_WelOFVsWhwA-JFKaBN7EKxwbNCqTZczSgPocc9ILPc7F9TvIDLXpIRrN1BO-lvfD0E2Sekc0VqwuY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheeigdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddugedmnecujfgurhepfffhvf
    evuffkfhggtggujgesghdtreertddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    epkeffkeeijeetvdekudetfffhjeejgfeiueegheekgeefgeelleeuvdeggfduuddtnecu
    ffhomhgrihhnpehophgvnhgsmhgtrdhorhhgpdguihhstghorhgurdhgghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehs
    thiftgigrdighiii
X-ME-Proxy: <xmx:S5J7Y2XbMCDA4nvu4VXlWWHn__th9m6ekgyHZWyy2z9eCY8fs6-GCg>
    <xmx:S5J7Y1nsSa2FrSc5QJLqxhDJHoro3zNAc51j4X1QVTOSzSFEUSOgeg>
    <xmx:S5J7Yzc0xMPjqUClXlWMYeaqppUmGgipDEHQ3ATLJda-Z2zU3zqzKQ>
    <xmx:TJJ7Y1sOgAoyiqTyuWMiWO0iS9ygewBMHnSzEsZ_RVxjX9f_-WLeEQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Nov 2022 09:59:23 -0500 (EST)
Date: Mon, 21 Nov 2022 08:59:22 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday October 12
Message-ID: <Y3uSSqWTZRNrPEs5@heinlein.taila677.ts.net>
References: <74f2b64b-9f53-d5a4-b616-510bd75664d5@linux.ibm.com>
 <ed082ceea79c3b3ce2d814195f1c90a79ae166b3.camel@linux.ibm.com>
 <Y3t60rxQ/ctsd184@heinlein.taila677.ts.net>
 <389cde168ce81c86dc256fe2a8ad87d64780cdd7.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ix+4p6k3kHuYZO89"
Content-Disposition: inline
In-Reply-To: <389cde168ce81c86dc256fe2a8ad87d64780cdd7.camel@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, jrey@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ix+4p6k3kHuYZO89
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2022 at 09:31:31AM -0500, James Bottomley wrote:
> On Mon, 2022-11-21 at 07:19 -0600, Patrick Williams wrote:
> > On Fri, Nov 18, 2022 at 08:00:25AM -0500, James Bottomley wrote:

> Right, but if I follow the instructions below, I'm not registering with
> your servers, I'm redirected to the main discord.com site.

"Server" is a bit of a misnomer with Discord.  They call any instance a
"server" but they run all the infrastructure.  "Our server" is the
"Discord instance, hosted by Discord, that has the openbmc community in
it".

> > The only one that requires a verified phone number is "Highest".
> >=20
> > To test out what you are describing I did the following:
> >=20
> > =A0=A0 - Navigated to our invite link under Incognito (to avoid Discord
> > =A0=A0=A0=A0 seeing my normal login):
> > =A0=A0=A0=A0=A0=A0=A0=A0 https://discord.openbmc.org=A0(or)
> > =A0=A0=A0=A0=A0=A0=A0=A0 https://discord.gg/69Km47zH98
> >=20
> > =A0=A0 - Clicked "Register".=A0 Filled out "myemail+burner@gmail.com", a
> > =A0=A0=A0=A0 username, password, and an arbitrary date of birth that is=
 more
> > =A0=A0=A0=A0 than 18 years old.
> >=20
> > =A0=A0 - Dealt with the captchas.
>=20
> Actually, no, this doesn't work either.  It brings me to the same
> account creation screen on discord.com and then demands phone number
> verification again.

> I've no idea why this doesn't work for me.  I suppose it could be
> source IP address (I am on comcast cable and discord.com seems to be
> IPv4 only).

I don't really have any other ideas either.  Maybe it doesn't like the
domain name you've used for the email address?  Did it give you a
captcha?  I assume you're "passing" that.  I suspect there is something
Discord is detecting in your account signup that they are triggering a
"higher probability of being spam" setting, but I don't know what that
would be.

--=20
Patrick Williams

--ix+4p6k3kHuYZO89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmN7kkcACgkQqwNHzC0A
wRmmTA/+JcVeexQpJGwPZnEMOGqK+270CHeOEWhEgL0hHcMYqySG1Kr+b7foSSfK
f9pn6v6IouZ+5+3S4F6P1FqX6x5i+6Ae4PZnVT8jNYvciitX6PNjqXOoLDIOCpcG
eepKTievRxerb/UCFOkLqL4UuVp7QebKwmj42yUB0DpxC5gMl9u0DKN2s7xS5sbN
NQBKVGS+N/lBTZpqwRFrzdmSLiAGhYW+fGKvRuCZ923lx+mlpqbFISU4/Sdy5Oj9
q7shtpwqBPD/OqvGizxTDzAHkxewGa8j5qSUnA73/D66enXIZoJi2CeSukhXQR/W
Cd/yhtEgiIVJqZs4O8vs78eA1A7M0P7n2UFJZ+10zEanxnvkP086IfFiGBxelOqe
Jn4wRb+Uq6A9AKMZQU4wkgjLCEOg4qxC+NvxPQ6GUDcMGER3COwsRuKnUPMsr7ml
TL8PjjWItivxqcKtpAQajY1UmaIKqDQUTX8gKEzOs37fxm7Ai81u/RpRcdNIc+a/
Cx6SuQ0Xxhm+YtFBF3m0gDCEx1w7GrhxiN9FGCz/5NVIxdgw5lfqFvsVuHbtrL1y
D2jpiiv3KKKXWFZxi9o8jP6PRM3EbQqt2RARnNroqyPc+0sI5rpeAZlv0V4CXLsD
WiRyNsZ0M5/UAbz5v1adDDecCDCVTBk5OTHKQe9wDltaLN0PUss=
=3RG0
-----END PGP SIGNATURE-----

--ix+4p6k3kHuYZO89--
