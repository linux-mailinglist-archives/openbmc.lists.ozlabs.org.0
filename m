Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CC5399EC
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 01:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCSdH2mK8z3bln
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 09:08:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=HAcdv6pZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NRP9VSpr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=HAcdv6pZ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NRP9VSpr;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCScn0DMLz2xTb
	for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2022 09:08:23 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 39AF05C0347;
	Tue, 31 May 2022 19:08:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 31 May 2022 19:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1654038497; x=1654124897; bh=uTY0n06bly
	VvB1RR4WRTfv6CZgO/XkRsCYjTfTucEcw=; b=HAcdv6pZeJRPPwy9C1Dix3pohA
	ywDRjJmxyA6My6Ko4b5KbpLMcugSVYVNEPu8/EpY7fTVKjxNvdXn+gt+iku71nXf
	FTmXr0yymqQ3m/3l3QEmzXSZyPkf3Lm21M+XS70EoFzMyczT2zwgYwjz5h8Mb3nB
	BtgMYWmPP7UD9G1m0DoozfmZ5GtP8nkm2qzzMn57H2wypR8jTJXJ37znPRpKafwO
	uTlaqhh0D5GJM8hGBYsq51UkG5p9n/ZLHtMRQMkQjdEnUfsWzbgm37+ta7avRfB5
	38HVbLgTC2YiuOm8fCiGXmWVwOJs9RPB0JJFS59T9I1hpPCmVKzLxF3ekTSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1654038497; x=1654124897; bh=uTY0n06blyVvB1RR4WRTfv6CZgO/
	XkRsCYjTfTucEcw=; b=NRP9VSpr4btLRYLqWzfcDxcYVz7EIuTaSSc0gJSmOcZE
	ewL1Wa/UzHuvDHD4u364IWcc8ptb9KbiUJHCqLUdsNE62iBRBc12ASKCmNdOweQT
	aE+WVJrI0W0hV8QxxaebIBd4AIUnhts4k4t3mym+2lQKIKjZJvB9q+YOzTNFiLmz
	7AIjzFSRNIi22cdlBjiZ6pgx92ngTfTK6uKchaXIDqyp3V2yFM3QCCLQG/Cjb0QO
	UNOqJeKWHs0EhS8stc8JcoM1QlYBfPHgctCcW3ZTj2xjsn+ZJ3SETCynNvtVGuBy
	kc0kg60+mV8xndaMlkbcURe/KQWe/X2lVFbPiZeyDw==
X-ME-Sender: <xms:4J-WYq9YnNJg4-cl9IctAPYcnqvPcM5JtehWOalTemJHQgacYs1UXw>
    <xme:4J-WYqsYie9-sW0DMCzI78AYN0qhyV9mCX_P-AyhybK6GtU_Pp3Urw39zE5_ngwKC
    gziaoVPsJ5UYyyg2jU>
X-ME-Received: <xmr:4J-WYgB7jSgzdThqNRecTjQDnWTEWTscYD8MPwZyRXoLCRDV9BYkSVISd8S5kPFz2JfWdz7x651Cp2qC3TUvrJPqWGdEKg3s39o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeelgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddujedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepjedugeetgfdvgfeuvddufeekjedt
    ieduhffguddugeduvdeuvddvgeejvdfftddunecuffhomhgrihhnpehgihhthhhusgdrtg
    homhdpuggvvhdqvghnvhhirhhonhhmvghnthdrmhgupdhophgvnhgsmhgtrdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
    gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:4J-WYifLogkBHhHX3NUCKsU1uzVZaXhOKq06P2DFdZMkTD7jSqkY5A>
    <xmx:4J-WYvNNDbM5RaHTWKxlqd26apZRoTYyVvdDGrEADx1iM6guHeutKA>
    <xmx:4J-WYskenUfxlcqKoO8O4A-wCR82AI71jdrZSv7zpyPHq8xWoWkxjQ>
    <xmx:4Z-WYl10IwvjL4f4fQSDHufsJJqFzejcErleiQrq4pf--f3VE_XTdw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 May 2022 19:08:16 -0400 (EDT)
Date: Tue, 31 May 2022 18:08:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jonathan Arias <jonathanarias@gmail.com>
Subject: Re: Updated links on dev-environment.md
Message-ID: <Ypaf3wQAL2qxrqf9@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAG3oxEfmZ2OsE=nGWXnD_4opkiKC7dMi7+wzqo_3dqN37aAT8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cBLZa5cYMIUM3/m6"
Content-Disposition: inline
In-Reply-To: <CAG3oxEfmZ2OsE=nGWXnD_4opkiKC7dMi7+wzqo_3dqN37aAT8g@mail.gmail.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--cBLZa5cYMIUM3/m6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 12:56:54PM -0500, Jonathan Arias wrote:

Hello Jonathan,

Trimmed out a bit of your message and cc'd the ML.  It's best to use the
ML for assistance.

> Anyway, I  was following the guide here
> https://github.com/openbmc/docs/blob/master/development/dev-environment.md
> But some of the links for the toolchains are broken, was hoping you knew
> where I could find them?
>=20
> For example,  this toolchain link is broken below.
>=20
> wget
> https://jenkins.openbmc.org/job/latest-master-sdk/label=3Ddocker-builder,=
target=3Dromulus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1=
176jzs-toolchain-nodistro.0.sh
>=20
> I went to https://jenkins.openbmc.org/job/latest-master-sdk/ to look for
> it, but that project is disabled, so no artifacts.

It looks like Andrew disabled this on 2022-04-09.  I'm not sure the
reason why.  Hopefully he can elaborate.

--=20
Patrick Williams

--cBLZa5cYMIUM3/m6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKWn9wACgkQqwNHzC0A
wRnQJg/+PoR1vnlwq0lUhgXH9q2h5YCH4ldo94PmMdFU1OEeG2BwXQHucyNqDtM5
fdWsv4/R+/WJ4UK1glLyGTnKAPuPZALFYjpkOdipVdVvyuSO8oRKcJSyTK+xpKIJ
3T5poRGTPsfjipliFAhFa3Hy3P2BUFLRpfR1nLHfw/Chf5YsYXEKMObaST51nTHe
aw+H2+gLUGh4M2eQIaB0tLlsYnAKeMKbw7nOIHAPQCH0Wgig8bsASEk1yza812vI
AVDZr4Q2NTI6U+ZqpbMXyBPp65i3AqobKTJr6KO/oDdJJUD+0QERycefWXI579e/
8spvVs2fEYbNtJG918QF2HpqvHT/b9xSSfTKXCu0ai2aNjTrx+OZ0OKq8JdM+MFl
BNJQwV8psFYbJnbqUwx4mCcRc/DJB+4xMQdDyU1NT4UykDZltApEQJsN4NHQ3RXp
vh8qRkxpsphz8lonk2QbSrAvV6X306TkQohqkTXKKeh/UwOuGYw0T2JvFGMOxq76
MvBprTvNQfzPDk2TDiU5M46Gps8preI5miGE0vxmTPNNAjOEZv975KSrBz9GI41J
/ZJrkI92/44+j9XaQ5irkLDkR1ph3rdqVzIdUiqhYReUctMCLGH51sikiWHzIkRJ
XS082U+4LnIdXVWUcW8ySDJbHeuvDQ2YtlLTCaObKH8TcXMM/zM=
=MOnf
-----END PGP SIGNATURE-----

--cBLZa5cYMIUM3/m6--
