Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B9646440
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 23:49:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSCBh1Rxqz3bhZ
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 09:49:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=iUBlESx/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=rp5qM4ts;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=iUBlESx/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=rp5qM4ts;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSCB23847z30RJ
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 09:48:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 2A1C532004ED
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 17:48:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 07 Dec 2022 17:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670453300; x=1670539700; bh=lLopKn+s7uTqhdnUiNaT6ioHu0NMlCANVFK
	sw6ESHeA=; b=iUBlESx/7J2Hp4D0iTwvM7lO/bZSWHdQ7yZOxW/gtdivoWC98MI
	9wTJCsymq1x+sMc1FEe1LfxYHWYErMLXQ8SItkDNTXn89E+iiyN/lmuYEB4kGnXh
	WVJQolZEZpbQ1xQdbyHqFY6g2VD+BPTuhyuvRSf+s3UwViwiz18jxy7TR3OOf/yC
	nnYXUuICWCib5T3tWUSB88yf6UfosgKgMsJ22Ew4+XXCYDm+thEw4d9/EOHT9cbs
	0jIxovz7yCC118a/tIzMJI7/jxx9BMYJzYwlJOEEkxJUx8ld47mdg8LhkrXv4VYI
	pAlZsyF38aMobUuATrLf0tJySj3yfFPSUJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670453300; x=
	1670539700; bh=lLopKn+s7uTqhdnUiNaT6ioHu0NMlCANVFKsw6ESHeA=; b=r
	p5qM4ts/5aZMpDTZx1kc9b8vdaujDP68Ecc4GnlbiZ9tZmiZF0KPdj0RR+oHS1Hh
	kWPQXPoVviWK4rZ+9nnw45dIx00xIuXeNn+iVwGYvVfb8/35uyJ4bx1cm4QVJ7yg
	Slm2QdBUxm2zQReW/3LfWk1RlxEVLIj416BJ50R/fkKR12T5X0eovqXAIqC1FxBb
	fNHDIReg1rydyRJYSj2Lyw8KYGDWOJvSpXstq+O0rhW7pj3aQO+XWhWP9nAClGfV
	e4ZGv/vQGjkylX/V6RWRXkuAedZgivqzXZQyj98EBlSGwuh3oqKO5e1rXSKnM/ss
	J5nnZ7b2C3K1ymeTW3x3g==
X-ME-Sender: <xms:NBiRY-91gz1ZcsDyU86301zk0GMhl2KQsABsmfFKQxN89SpJjZ0Nsw>
    <xme:NBiRY-sMOI_8HE4UVbZUB9_U8MXvFMxINkEzpRqE0V9DIHjUer0KECLCmIo4MrNIL
    06e1XqmkNzlJMILMeU>
X-ME-Received: <xmr:NBiRY0D6fACNezLh4qjvc5L_dMv8e8ZDwF_SUbYJOJ9kRQzZhK6YQGu6E0wbW3TBvU27bmbPnGeCFFb5-oQilkCAXRLFsVeH140>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddujedmnecujfgurhepfffhvffukfggtggusehgtderredttddvnecu
    hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
    igrdighiiiqeenucggtffrrghtthgvrhhnpeeuhfeggfetheejteetiefhjedttdefkedt
    ffffkedtveelfedvveekffffgffhheenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hfohhrmhgrthdqtghouggvrdhshhdpohhpvghnsghmtgdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
    igrdighiii
X-ME-Proxy: <xmx:NBiRY2d57_U1aHgP9UMf_b6zADc38_mbR3lrBsLESaQDjVmsSdd24w>
    <xmx:NBiRYzP_QFcNNJG_xlxa08iTEBfLZgLakBDAFDcD2WLkpfn8MUdP-w>
    <xmx:NBiRYwkX34m2iSHl8-EV4EhdrHvjjiNd5eqagIyF2JlBL5tZdq2OLg>
    <xmx:NBiRYybS-ojsmuwDuRmdxDraFDwPuS0nZPPCLQUdD7tTAY6xTwGTSg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 7 Dec 2022 17:48:20 -0500 (EST)
Date: Wed, 7 Dec 2022 16:48:18 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Code Formatting and Linting
Message-ID: <Y5EYMohfaXz8lA9t@heinlein.taila677.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EHhnyWA3TrKA7nJZ"
Content-Disposition: inline
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


--EHhnyWA3TrKA7nJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello beings who write code!

I've been working on significantly revamping the `format-code`[1] script
=66rom openbmc-build-scripts, which we rely on for CI, to make it so we
can easily leverage a lot more common formatters and linters.  I've also
made it so that you should be able to more easily run this directly
(outside of Docker) if you have the linters installed natively (along
with some useful options and colorized output).

An example of running the tool against sdbusplus and the `--help` output
can be found at [2].

One big change I'd like to highlight is that I'm moving the linters to
an opt-out model by default instead of an opt-in.  In the past we've had
repositories add magic files like `.shellcheck` to indicate that they'd
like a particular linter to run.  The result is that very few
repositories full leverage the linters we have in place.  Instead, we
will enable the linters by default on repositories, and allow
maintainers to add either a global ".linter-ignore" or tool-specific
".<linter>ignore" file to opt-out.  These ignore files follow the
conventions from `.gitignore` files so that you can select specific
files.

I've already pushed code in Gerrit that makes all repositories pass
using this opt-out model for all the linters that we previously had in
place.  Prior to enabling any new linters, I will also send up changes
that make those linters pass on all the repositories.

Curently we have the following linters enabled:
    - gitlint (commit message)
    - codespell (on commit messages only)
    - clang-format (opt-in via .clang-format; C/C++)
    - eslint (JSON)
    - pycodestyle (opt-in via setup.cfg; Python)
    - shellcheck (opt-in via .shellcheck; bash/sh)

After all the code in [3] is merged, we will have the following linters
enabled (opt-out unless specified):
    - gitlint (commit message)
    - codespell (commit message)
    - beautysh (bash/sh/zsh)
    - black (Python)
    - clang-format (opt-in via .clang-format; C/C++)
    - eslint (JSON)
    - flake8 (Python)
    - isort (Python)
    - markdownlint (Markdown)
    - prettier (JSON/Markdown/YAML)
    - shellcheck (bash/sh)

If you have ideas for languages or linters we commonly use that are not
covered, please feel free to reach out to me and we can probably enable
it pretty easily. =20

For anyone using vscode or neovim, you can also enable all these linters and
formatters right in your editor and get real-time reports[4] or fixes, whic=
h is
really handy (emacs can probably do this too...).  I use neovim and if
anyone wants pointers to my configs, feel free to reach out.

1. https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/for=
mat-code.sh
2. https://gist.github.com/williamspatrick/91b72cb2ed18ae794e91d1f04b78e3d7
3. https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/59230
4. https://gist.github.com/williamspatrick/1916470b304383d8613fdb86451b7e91
--=20
Patrick Williams

--EHhnyWA3TrKA7nJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmORGDAACgkQqwNHzC0A
wRkobg//c/TX0WWVouQkwUcuEBLmG38dYNinEO49uejyLSrjd6RCvr3T1+t/OR2S
/J0Mx62MBGgcFe2DarBO0ZUvz99GRtO9zmsoLvXrmSVTC3hXN+jdYEiW9wayZxCr
U/22pnAlI1hUu46G0e/HQ6on/rZhjMbQunOUyETxGexE0zfw4ZDw1eqJviqVOl8e
TF+3HeQNFYIhjjJG5dxI7oabOOG0lcz9/AIda6dRu+7pgcWMXEdzsDlVxCAjPZ9p
QnS381jUbIN1+ImcnXfkHaCEV8IRakXlhIVUtnNWdxYtjd9d+9KZLGdkWW1BIJ+k
oNe8JUG8wxthiXghN1kstjbOztDXxs4JJ5dRZlUyOvA9Nfy1JHtOn5I7Vl1yMb0e
kjjrLtJHJEn3WYIaZcyRQSyUfbeLZ0gMrva/4ulRbux1n7FJuCIOL3j2rHvPOHL9
SeIUsvIFBrD70zyVXPMX1cmWIOPHcWb/Je3f1lrHpk1maDSy61/9HyyMwgnB45xT
wLYa7Yc0rFRnbmPrqcOpu7LRR5OeFPGOWkmU8/lRyCZKrlE6AuONfs57mp99LeOS
mlUlKxRiHqVK/2GygKE7fr5ZX3TNhvHBDVOVLrSZC1ust33N6mKFTMQh8aIzZ17l
1WpjAojsg3Cjsi4pnMV0FCrcwohrdi2Xlr7o66rIBhkNUrjVYkU=
=cmgd
-----END PGP SIGNATURE-----

--EHhnyWA3TrKA7nJZ--
