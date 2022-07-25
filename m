Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC54C580274
	for <lists+openbmc@lfdr.de>; Mon, 25 Jul 2022 18:08:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls4hy4v6yz3c3L
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 02:08:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ttM48RBa;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yPhctgDt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ttM48RBa;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yPhctgDt;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls4hT0lYpz2yJQ
	for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 02:08:07 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7F6E65C0194
	for <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2022 12:08:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 25 Jul 2022 12:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1658765282; x=1658851682; bh=7WuK8pBqmEh/SwHS2GHXzWjTaJj3P0Iy+de
	kz2tbK9M=; b=ttM48RBaJIusu6931w8ipFpYe6Z489mwQWBIXP/LZgiNdIFz6aH
	9x5yWGzjZhXXsjZrnE0x9FgxbiUjoxc4rbZlgoB7YmVdZwDkRCQR9LTb5gtzbtaF
	x0G1sxrRBhaop0xTT9F8c/1/ea1R2DjYG7fr7lqEYdJEsT8W9aYU45fxH3VnDLGO
	1IYuS05w5Nm2EBdMAWHbM+xpErkyIX1HMrnPp9cWSndAtRlFYh6u/IaLTk6DKs0Q
	vmRUBRD6aVe6MDWv57IU3ueuY1F/Yx1kTL9gomhRkuJack/iTJq5/G/cHGtTu9mU
	FPM9pxj8BAQDzeogZONszCvLhpNUUEcCiqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658765282; x=
	1658851682; bh=7WuK8pBqmEh/SwHS2GHXzWjTaJj3P0Iy+dekz2tbK9M=; b=y
	PhctgDtKQ2KRBHtLyvpZ4+QyoVBNADC6dUE3ucWBVM0tfouxwxAbtUo0mtaIxxjH
	4r2qKFkhAHLvpEZqAWkzHP7mW4m94sLSuhkE//tYQggfezt8OaOyGSa+eaR+MGeY
	m2HDuWcxLiOAogKz3A0e4hU9HJrm8B2AUw0TPWsc64EAMXWOkRqgm/8CDlTSmLiR
	KJKpvBHQzUNe9bMTCTr9j/xwguMYfMI9/tj9NKPSOGubaWfuXowo1KuNq42Z1mIv
	U+2Z98T8KDQBIkhN+Hu3zafsPozaHGZJphT0uTOl36YJbpePyHRmETW1T6oB3rbp
	Iyga188ptRJl6XbGHfIvg==
X-ME-Sender: <xms:4r_eYl_w0AHIH8HM19mRMQ1mvuCen0u-ssS8t5Yw9ShOU9-tfRbirA>
    <xme:4r_eYpvOdb8plYIq5zxErMSng6rfxARzP_hDIZon83GJvSGBcI6jPHihh9jDz4UwA
    jqsWZfghpBtT7CqyfU>
X-ME-Received: <xmr:4r_eYjCSDDV88yewfxPzOUciVR0HqbSHj_8hfAZ0SWvgUzBnst46CiCr2cWQeq2c6O3x8vTvgPYH2a3jAAP-cxfZ5mRr58eQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtkedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepudetleegudfgueeiieefudevfeekffei
    fedvteffveehgfdtffegieefvdfhhffhnecuffhomhgrihhnpegthhhrohhmihhumhdroh
    hrghdpghhoohhglhgvshhouhhrtggvrdgtohhmpdgtohhnfhhighdrmhgunecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
    htfigtgidrgiihii
X-ME-Proxy: <xmx:4r_eYpfK1IqCCHZkXHYsL8EyloV7FrvzoF5OeZiqbaJVNAdDbM4mAA>
    <xmx:4r_eYqOwFTyyH8fWlAioq9qDMsB7u42JuLRQUF0JXZcNr2VYgpCjWA>
    <xmx:4r_eYrlDGcP4YeOEbD5AYM4OidoFpLYmsH7CNCJBwOKrmP-8CUnDhQ>
    <xmx:4r_eYtYZrWoHQHNPGJKcqV6TbY_9eB6ygfOrfw67TOuUbQsPn-m5VA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2022 12:08:02 -0400 (EDT)
Date: Mon, 25 Jul 2022 11:08:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: CI: Automated reviewers
Message-ID: <Yt6/4Qw1BChrXXu9@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W9yvHdcQjDBsgYo6"
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


--W9yvHdcQjDBsgYo6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

TL;DR: You should now see Jenkins automatically adding reviewers to your
commits based on the files you touched!  We also have a new way to sign
up for automatic notifications on pending changes.

---

Gerrit use to automatically add reviewers to commits based on
information present in the OWNERS files in each repository.  About a
month ago, we did an upgrade to Gerrit and this plugin stopped
working[1].  I recently added support to one of our Jenkins scripts to
re-enable this support (outside of the Gerrit plugin).

# How does it work?

In the openbmc-build-scripts is a new `tools/owners` script, which can
compare the files touched by a git commit against the information in the
repository's OWNERS file(s).  This generates a list of 'owners' and
'reviewers' for each commit.  Jenkins calls back to Gerrit in the
`userid-validation` phase to add these reviewers.

# Why did we write our own tool?

Two reasons:

- Writing, building, and (especially) testing a Gerrit plugin is hard
  the people around this project, but modifying a Python script is
  significantly easier.

- We've enhanced the OWNERS file format with our own 'reviewers' field,
  which allows people who are not maintainers to indicate that they'd
  like to be informed of changes to a repository and/or set of files
  within a repository.

# What should I do about it?

Typically nothing.  Jenkins will automatically add appropriate
reviewers, so you don't have to anymore.  You're more than welcome to add
_additional_ reviewers as you see fit.

Now that we have automation that honors both 'owners' and 'reviewers', I
would encourage us to add more 'reviewers' to our OWNERS files.  In the
past, 'reviewers' was "for human consumption only" and often not
followed.  Now, it is fully supported within the tool.

Signing up to review some or all of the repository is a great way to:
   - Be informed of changes to code you care about.
   - Help the project by relieving review burden on the maintainers and
     speed up the review process overall.
   - Show interest in a repository and learn what the maintainers tend to l=
ook
     out for so that you can become a maintainer.

If you are interested in this, submit a change to the OWNERS file for a
repository you are interested in by adding yourself to the 'reviewers'
list.  If you want to only subscribe to a subset of the repository you
need to create an appropriate 'matchers' entry to identify the files you
want to monitor[2].

We generally have a pretty significant shortage of both reviewers and
maintainers.  Reviewing commits is an easy way to get more involved in
the project with low effort and commitment.

1. https://bugs.chromium.org/p/gerrit/issues/detail?id=3D16069
2. https://gerrit.googlesource.com/plugins/owners/+/refs/heads/master/confi=
g.md

--=20
Patrick Williams

--W9yvHdcQjDBsgYo6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLev98ACgkQqwNHzC0A
wRmLzQ/9FJ6R2muG1lKE8eEP6EFpH4AkiWznoYZLvzQALsp1xBBeinaGVoem3HHH
XOFnQBei69penN5qzbTVvjwD7B+9tOd3JBi35O+qoZEEr20Or94g+zL4euUKzALQ
JL3Zv8gPUTgPUWq27xbq31E6VXyzBasSRC4fHP6x7R/s696UQzJmfxRV+9bpgkZG
jhF3Lj2nu+eQpJkUDuOJ1KSJhZvcXdZxVExygJxwgraDk6CPSF0L3AUYCbQjZ8j6
EdUloluiCwhiyc0aBbUb0VxCgf03FuDJh2PVoUU8cxOdIMWymEP8ABNSSKms0ofD
lwaURzwzSmg6cxKDG+xTw7m3R2PY7QBCFEGvBjh5nLPImJhbb1TIbGlVcm3+luPB
GIRSX1BlEeXAO3HpWLwkE/dIGarp0y1BRhaJbjCLR5ob2fMpGdw7aFoUGQ+2U/B4
5ibsnP+oAlGsiJJOGCd8C81QYbgymwTE7qP/9rZbLPkc67DlBHZouzillkb0CiSt
gWMxfZkwVt1bVFDaj/KNvxePH2Glq8+rwD65mL2GW6zCk/uXwZ2DpdjdhGGdIc5b
RMt5tfHIP7zfwgusgluFYIz++Ewi/Mog0w1ukuDpmD5L130MHqJ3H8Vx7pf/jQox
ZyRzXuEmd/HD//sMrIx/Gh5M/vgnuUi7v4R3xJkBLdC/Frow9Dk=
=+JAy
-----END PGP SIGNATURE-----

--W9yvHdcQjDBsgYo6--
