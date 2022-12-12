Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7931D64A8F4
	for <lists+openbmc@lfdr.de>; Mon, 12 Dec 2022 21:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWDVM2xr0z3bh4
	for <lists+openbmc@lfdr.de>; Tue, 13 Dec 2022 07:58:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=M1j4wFj7;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=d/7rn+Dq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=M1j4wFj7;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=d/7rn+Dq;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWDTh2fntz3bWF
	for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2022 07:57:27 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 62C5332008FD
	for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2022 15:57:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 12 Dec 2022 15:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1670878641; x=1670965041; bh=VGPhsPSPFe
	p4hezdtvdx9Lw2XqgaB+7lYZZ/xMrp89A=; b=M1j4wFj7eFG6l2Klo2YEPuHS5b
	eBL7kgbOqgAqNhYgly2RqZYflOW7ze8FjegmCIu/vf5UEtLxxPhzW4s93isfRW1U
	/UQZJd+8LKXDBtSGCB3QiO4Hhsio+Hi+SZ/irWkiLF2w25tXqZ4BykE4kQYwjun5
	Nugf8AfHpkzoHz2hnxvnb9at2JSF+9m6tP9N1FpMERw7RxL5/6ag7vWKG7lmV59x
	/d1691AWHW1sFTmyVaO7PGGamAnXaMA1NJ0mxF22Ml38IsXB4aDgit/XNIfSqst0
	JK7UvIEHNCpzz2knQ+jJ7vdAVOAooBImZbXaefFsAdtZoC+vUpjgAnGCdZqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670878641; x=1670965041; bh=VGPhsPSPFep4hezdtvdx9Lw2Xqga
	B+7lYZZ/xMrp89A=; b=d/7rn+Dq4IYJ2Bm6PIsJnVWi8yxwLChQ1rvfhoQhlVgZ
	qqJI4nDzStwnd229OB/nnHR5bSYwCsSuRGYMCAc4bpDmGZUqsSLh2G3x63trco2A
	Z3opKFS/PU9dEC3O3/WA02Qu0S+XKxdbJwg+R9VV6DqrPn4pfx4n/zcMDF/jUtoL
	qrxRQyv6B92MEErsje0/q5p5RDG6av6jlOfAURmATDjI0boSTBps9zDODdPap9cY
	sdNe8VMkbztF9T9cI11T7b44YyKMm8PfGjBDd9e7Wz7BALLeF2sdwJs1hjW2I+kf
	qTxuaF/0vt6Acde3IHRPMToeGxHAq1dYhezXsSBZ2A==
X-ME-Sender: <xms:sZWXY20KylkIJsdZoC5b2ndsJvnUCjKNF8KBaFPYpCLdgb1fKLvIPA>
    <xme:sZWXY5F61irhpWoALLT0ppWe7QOXayuPo21BstNmDPM3tGXWum-gt_vsy4UwduUyE
    BmUNHekHVe0S-nmbCo>
X-ME-Received: <xmr:sZWXY-7NfKLSpqxlmmePlrC4CDVdpqlULWe_lvzIs7Ta1EgehBE-8xKyzhRBUguS5xUqqbTyOLb4EKJSAf3iExiY830U2VLblm4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
    geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:sZWXY33uctBm0Ez7_6CIRo_4FpkItxRTHcal_yfLpL2enXTHN4jDaw>
    <xmx:sZWXY5Gds4BGFm5VN6z5mvueA5b6uhEaFOJkF74lS3PKeS6ah_YN2w>
    <xmx:sZWXYw_5nKwLev5UHPLdr6ZKgqo3h5b-zHkp5-arz84EJKlslBiDdQ>
    <xmx:sZWXY4wOf_EQkYfSyeJO9mJ8U8pLERWnhu2_A9_ewnZFTPHJGc0yNg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2022 15:57:21 -0500 (EST)
Date: Mon, 12 Dec 2022 14:57:19 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Code Formatting and Linting
Message-ID: <Y5eVrxhQmM+V81n+@heinlein.taila677.ts.net>
References: <Y5EYMohfaXz8lA9t@heinlein.taila677.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oBwgebzLmeKjMV/k"
Content-Disposition: inline
In-Reply-To: <Y5EYMohfaXz8lA9t@heinlein.taila677.ts.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--oBwgebzLmeKjMV/k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 04:48:18PM -0600, Patrick Williams wrote:

> After all the code in [3] is merged, we will have the following linters
> enabled (opt-out unless specified):
>     - gitlint (commit message)
>     - codespell (commit message)
>     - beautysh (bash/sh/zsh)
>     - black (Python)
>     - clang-format (opt-in via .clang-format; C/C++)
>     - eslint (JSON)
>     - flake8 (Python)
>     - isort (Python)
>     - markdownlint (Markdown)
>     - prettier (JSON/Markdown/YAML)
>     - shellcheck (bash/sh)

Everything except for markdownlint is now enabled in CI.  I'm going to
enable markdownlint in an always-passing mode shortly so that
maintainers can start to get signal on the issues and then we'll see how
soon we can enable that one as well.

--=20
Patrick Williams

--oBwgebzLmeKjMV/k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmOXla0ACgkQqwNHzC0A
wRkufQ//ccy9DVoGfBXoP0pTgcuIBiLJ8f1KzCZXp5U/8Zy21axigSJ2xgwA/vUY
rO8vfCsePForzPrHbS812HpNkTnMQM8VfTW1zNXvTLH+0P5l87ofKMJ/fNdMPi/4
BE5U2voAKSeRTLmECQleCxLsWsns4IIKrXopzUnGKhnt5mMQZ2mOEyLvRof7hZoH
M/udnKcz0MsRXmlYpY1+MSa2V25YNQ2nM8+0D+j1nKXC7AB6lyqNjmsHasI0abz+
gIPsBwL1B1KaKhyhy+lZjSQFqqVbNJ5Ql7f7ZFb9naz0yqKoLSU8V/kJNcYN6yCo
GXOgBiQqnhv5DUL3p8lI4BDe/tyMoNPglIL4pLo2JlEbjHOFH+gor5E7I5+x0GmZ
9iws9owohVTK7/9wSrioMPnu4FYKNF/b2aZVVig94JTmWzK4JI4QFrv+LbKOeQ0y
DnUKP9DjSyybx7OZjdVYWtCpoZ2LjxZXheWpl1HuXLIIDHYi20F2pfbgGnx6bNh3
GagsrUeomzpRPevmh7WrmyQxFp0XMO+EQNIcztZLIVT60e6pRBDjrpl4I2sRD+ax
GRRI2UhiEhia4HcdG18CALblc4cbxEHrm2j3+3F2sDwFrKLFXEb87VAjlgk7tBFN
T1SddXgPFdcEszi4ngOPQHJ4H7fmqzBga9oCKA2SprY+zxOWD/I=
=beYR
-----END PGP SIGNATURE-----

--oBwgebzLmeKjMV/k--
