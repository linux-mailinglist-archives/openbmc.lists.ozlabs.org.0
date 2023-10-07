Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB637BC334
	for <lists+openbmc@lfdr.de>; Sat,  7 Oct 2023 02:02:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=L193nu1z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nfe7g0Vq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2QTp5jyhz3dmy
	for <lists+openbmc@lfdr.de>; Sat,  7 Oct 2023 11:02:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=L193nu1z;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nfe7g0Vq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2QT51Mc6z3dDT
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 11:02:00 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 174433200BC2;
	Fri,  6 Oct 2023 20:01:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 06 Oct 2023 20:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1696636915; x=1696723315; bh=vc
	Jhvt7X+hb7yl3bxAZnRLlDV0NJxdZrJcV89WJK+uA=; b=L193nu1zfrM2+cFAEc
	jXy6KssDwBBwEGqgxThESsc4PCr3ajfGRrz7gE7X7nbnYvFx0xizuqBcgHh+pXUp
	mJRhf0nqztV6g24FJs+ucb1OLuyp2+UjfojDcuoYQpXurNnjKL9oLm7oXj4Fgwoq
	ERsAQqVuJsf9r4Hdr1QIFAntypVRkzw/ucsbhUPVmOzd7iixNYRe77NA+oek7BHA
	DrIqJyBDUt2UX0RqH7bcZOyBtk5uoRtamG9j+OrZVbhb7wDfa3GGLLLVtd+iNSHX
	S/3H3oNEm3a39R38FEXkY6G6xd/Z6eLLRGPzDjAagkSYcVye3kYRqpMgqUWs7pDO
	aySw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696636915; x=1696723315; bh=vcJhvt7X+hb7y
	l3bxAZnRLlDV0NJxdZrJcV89WJK+uA=; b=nfe7g0Vq4cO4aPoolVFBMFgg5cofh
	6rkewhWCGLRCG+JImOC05JpF/ZEyoMTYdmbO64L/VeOBhBatzHaH3TS+MC0Qwzm3
	d1Wl5GdETZn/NfhREJk+7hcMycMu5rVchMItnilUt+S/nJpxkar4DQxuMOyTCHuL
	v2/PmvIwWo7KknN9fEQ7ZduWOpEvHebg3oKqB/3/NaDXDn0Lp2Rk19u0LjiQXeM0
	b8Efn7x+Nqn5+JvtMn2TbWa6VNSuwNNRqEc41lC9LR7vRK7zCeWqoxceamGiZGar
	I5kMzMXViywJAK2sskOuMwmkzC5rUgu0xpeunPHdstRmCxmGV3H/o97+A==
X-ME-Sender: <xms:858gZU5NI_L1aefZu2CX3tcH0aunyiDLgOkt2ceZDODGp5kkLCRMlA>
    <xme:858gZV4aWgDC0iJ6xkfsc5hqrJMxyvu0AtG8obWiyDymUCuzG8tUQeRrEWbIOWqf5
    WA97hl77vR3ZnRU-Xg>
X-ME-Received: <xmr:858gZTcGFuRQUJk6cj4FpgjzLb-Mtt6u8yMChvAegy5Yf6ViS_vWg62IZzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeejgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeeiveeuudefvdegteelkeekhfej
    gfeiieelhfdtgedvheekffekuddvhfffhfehnecuffhomhgrihhnpehophgvnhgsmhgtrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:858gZZJ7jZjwV-E9rPJhBzSeFVIfqUXLzX1-4fLUrtGakbn9Wm_nfA>
    <xmx:858gZYKNHtQkqY6xaQ7gQ-8UPo7K2wziWYmUtlMZoemRJNTPjSmd0Q>
    <xmx:858gZayo43RhH-Bn5MYPLbuFlgb0Jb39v77SMWO5S0Wl3ud83q4jxA>
    <xmx:858gZSwT80sFiJNZ97KZAQ5zlP3jTtN9GxlruFXPDd-Ynr7bKEE8Eg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 20:01:55 -0400 (EDT)
Date: Fri, 6 Oct 2023 19:01:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: webui by default in openbmc images
Message-ID: <ZSCf8TmHugWS9dKs@heinlein.vulture-banana.ts.net>
References: <CALLMt=pST5nX76byef6S4rsskMRD3xvF5gAVqhr2eRefcRa-qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xttd7smYSf27kSed"
Content-Disposition: inline
In-Reply-To: <CALLMt=pST5nX76byef6S4rsskMRD3xvF5gAVqhr2eRefcRa-qA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Xttd7smYSf27kSed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 11:56:50AM -0500, Andrew Geissler wrote:
> Greetings,
>=20
> I was adding a new system recently and wanted to add the webui into
> it. Doing a quick search[1]
> showed a lot of people adding it in via a RDEPENDS on some other
> unrelated feature.
>=20
> It felt like something that deserved its own openbmc feature and
> should be in our images by default.
> The following commit does just that:
>   https://gerrit.openbmc.org/c/openbmc/openbmc/+/66675
>=20

The way this was attempted in the above commit does exempt webui-vue from=
=20
the image by default but it still ends up as a build-time dependency.
This prevents the images from being built in a disconnected mode, which
is one of the primary reasons that people have previously not wanted it
in by default.

I've given this another attempt.

- Enable webui-vue by default everywhere:
    - https://gerrit.openbmc.org/c/openbmc/openbmc/+/66954
- Add a DISTRO_FEATURE that allows people to opt-out:
    - https://gerrit.openbmc.org/c/openbmc/openbmc/+/66950/1
- Opt-out meta-facebook and meta-google:
    - https://gerrit.openbmc.org/c/openbmc/openbmc/+/66951/1
    - https://gerrit.openbmc.org/c/openbmc/openbmc/+/66952/1
- A bunch of clean ups:
    - https://gerrit.openbmc.org/c/openbmc/openbmc/+/66955/1
    - https://gerrit.openbmc.org/c/openbmc/openbmc/+/66956/1
    - https://gerrit.openbmc.org/c/openbmc/openbmc/+/66957/1
    - https://gerrit.openbmc.org/c/openbmc/openbmc/+/66958/1

If I've missed anyone that really wants to opt-out of webui, you can
either let me know or make a trivial change to mimic the two
(meta-facebook and meta-google) I've referenced above.

--=20
Patrick Williams

--Xttd7smYSf27kSed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUgn+8ACgkQqwNHzC0A
wRnq3RAAmyeiMHGZ0K+xDVP0GuOlIUMKchZRrvdhTB7oS3E0I5ob4D4utm7qpD6B
thzCI681uH5XkuMjjGDOrSekbLWGCbm/zVzIemirptXXQ8Tfr1jO28sPDlfHfKI2
Awan00Fh44flUFrybEa0RyAZF/S/X8j6eJZOpYVu6ZExWzVrKZsmb+zP2WmLafyp
F4hcWFgUXJdjzXpZ2zu3wd6X97JFnshg38C0T2EzM09noaxSZiZ0S/bbNsGDmxhs
sGTR4A8+ZJFojYNMymQnhAZfE/8Z5hptlAzxUnCx6YSXdJX9t7SC+EjVzT8cGh4R
XF9ok6N+W3uktl5aRKpSerRQ4vpZkGKcmAC89rCScccZwMRwHhO5tTckN3Sp9Qlw
OPeLsPnI8G7XoYrEP+UcnUusrQkViU3sonknAIi0aFn5CZfR6v4JyMYWD8Szxncw
S7Vhei0FVGtcxYtgb+2P6DKQI2mA9pyX80QIhRHQRnGRr1gAxpJfX2d+MLZbHzFu
GoCNnpRfW//yOnYb7aGA3xx4q79Gz1ra9NoIwv7g5Sildy9VLs/DDavFgDC0Tc4L
eOTTCN9RxqVhct0WIysdYIjotuduVCV3whx6Fa3NJ8lnUnLnW7ZfmjWDKowJVDlN
kBvfmJHa/YPFqA/9z6qxkTP47+2L1hnMlLWoD1swh1DTAg0oRQY=
=ttbc
-----END PGP SIGNATURE-----

--Xttd7smYSf27kSed--
