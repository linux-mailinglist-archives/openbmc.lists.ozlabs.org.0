Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA15775D4
	for <lists+openbmc@lfdr.de>; Sun, 17 Jul 2022 12:59:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lm2D23Gncz3c2H
	for <lists+openbmc@lfdr.de>; Sun, 17 Jul 2022 20:59:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=bO7hoVpP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TqwB6Bua;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=bO7hoVpP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TqwB6Bua;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lm2CX3Njvz3bhQ
	for <openbmc@lists.ozlabs.org>; Sun, 17 Jul 2022 20:59:02 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 8FBBC32008FF;
	Sun, 17 Jul 2022 06:58:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 17 Jul 2022 06:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1658055538; x=1658141938; bh=bNKBZ8XAKf
	2scsDv6foL5uP9Oh5rMpZVu6tlEQPz1AE=; b=bO7hoVpPadWcYVe+ol11wzwjr/
	3z1GIN175Lv76YEwzsCz2qnSe1S7Zbz7PPepEyKWBt5hx11At0iKtGiQUi+EBZ83
	1/K5aXSacdYujGnzoaeluyfZFslAOQoqq7h4Kr8jDhC/xaSNzwVbye0RNg5PNujs
	D4vLepvFbyU7qCNGov1YkskJ+HjP5WRctt6CMNw36UWeZRtmaG1BZpv6nSth67cL
	In6zYXQ9rTINF0petiCCGHHxjGKsVfzvs2nOaLiqrGlud5qJ2ImbllkJP02PefC5
	p5OsWZsHRxP9G6lUqe0as2Fhtkp2K8s8RnuXeN8Syop9l2xdrr1jMNuyn3SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658055538; x=1658141938; bh=bNKBZ8XAKf2scsDv6foL5uP9Oh5r
	MpZVu6tlEQPz1AE=; b=TqwB6Bua+UTZ3J778F0WaxeIWPIzsRRo13aEoz55pxyR
	LjezHF9VMWGXJURuVlgSmXy5K7sv0aHhKZ6uGxzxFuhqq43cpwHZ9snikiJw1deq
	vMHf4aF7YadsKy+YuiKkdy0BI/mXkhBVOObqAn/XD4tC2hmWLt1KJBtcrVhrOtRE
	fiX3nWtv7RCfuEaDDzjmk8TwFKRv/MAawVbXoNXEVr7wAqYx6T3MI8wfl6jrWJ5n
	QD96pykzXbkg1bKS9xheQmwI0tUrXz0xbnKA74lVWY7jSbjxgz0ad8NlcHX05ICk
	wCKJxPUdCgNIX4+VqI18Xxe00w03LtEttBsLYFfQwg==
X-ME-Sender: <xms:cevTYo5ajjXmEbd5leOAVJVuQJ67hgBSY-V0_uqJ3RCMc3odqDo0Lw>
    <xme:cevTYp4-1pmM1AvjjS_P1c4vlsRYtHJPqmOIeDfUzt2OsZKZhFsfItwUkinKCnObp
    dzGoQJZd19ad0h7SBc>
X-ME-Received: <xmr:cevTYnf1grHlOdwgNw1U6p0Ngi9s5wwcp2Fb1NaYwLyG5vNiW1df0wqqxiVaxnvIxWolY4PAc8oWh8WRg32TNfolYHO0Byjc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekiedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:cevTYtLZ4v0etZFn21n79BNsNSHltjGq-3ulhEnthiMUgTOQInto0Q>
    <xmx:cevTYsIuJQ9RxB6E8L-8l1363Piq1ys7c8qwtsCS7CEivbSEnErB9Q>
    <xmx:cevTYuzQlbJ7q3R7CoTvjexPpLQDCoa1rqYOqgixoGsQ4iFZ0pOdYg>
    <xmx:cuvTYmyq1sOvl298L7yPoU_aCNyp93La-gmeVTr_OUvnpwrFHD-Oew>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Jul 2022 06:58:57 -0400 (EDT)
Date: Sun, 17 Jul 2022 05:58:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Arvind Nandanahosur Ramesh <arvindna@microsoft.com>
Subject: Re: Extending phosphor-gpio-monitor to expose gpio objects on dbus
Message-ID: <YtPrcDzaxXiM6vYJ@heinlein.stwcx.org.github.beta.tailscale.net>
References: <MN2PR21MB118426E5D86B645A1ADF887AC8889@MN2PR21MB1184.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sMfqW52yTKsAKjQh"
Content-Disposition: inline
In-Reply-To: <MN2PR21MB118426E5D86B645A1ADF887AC8889@MN2PR21MB1184.namprd21.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--sMfqW52yTKsAKjQh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 09:52:57PM +0000, Arvind Nandanahosur Ramesh wrote:
> Hi Everyone,

Hello Arvind,

> We have been toying with the idea of extending the phosphor-gpio-monitor =
to expose the the gpio objects it manages on dbus in addition to its curren=
t functionality of executing a specified systemd target. This additional fu=
nctionality can be enabled by an additional parameter in the phosphor-multi=
-gpio-monitor.json file. Before going down the path of implementing this an=
d upstreaming the changes, I wanted to get a sense on if this is a good or =
a bad idea. Essentially this would be useful for other services to query th=
e current GPIO value of input signals over dbus or react to changes in its =
value. What did you all think ?

I'd say about every 6 months someone proposes a change to
phosphor-dbus-interface with the addition of a "Generic GPIO interface"
and it has always been rejected.  This has gotten to be so regular that
I should probably try to track them down in a list so the discussions
there can be easily referred to.

The two primary issues with a generic GPIO interface are:

1. Performance

GPIOs can change state quite rapidly and there are hundreds of them.
This is likely to be a problem on dbus.

2. Inadequate abstraction

Generally we do not expose low-level hardware entities directly on dbus,
because it doesn't provide any abstraction.  You're going to end up with
hard-coded names that tie some hardware GPIO name into various
applications elsewhere the software stack, which isn't great for
maintainability.  We've always suggested figuring out the software
construct that those GPIOs represent and make an adequate dbus
representation of that higher level construct.

--=20
Patrick Williams

--sMfqW52yTKsAKjQh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLT620ACgkQqwNHzC0A
wRn5qw/5AbtEcHRILz9P86QBQhCJAjbdOkSMVgUT5YScwP9LsnnXaTOP4cRTxlcp
w/a9Sk1dgfLvZy8qNUVLC7REP/9MaVS8kgFEgvBDRx7HHT+b7AYbOb1LJVB6u6Nr
P3mGfTQpVYfFWMoQFfM4nEtrf1SWZntG4sJGEt9nziJ+kFhHepX4Csak0yDc/YNY
xubY6NP82CKgwsZEkgR75Gu+edpXkPESFdy6mhWhgTNr+NPOlxzNwELMVVUymUrd
chfOzn1nZpNN3Qc49BwrygZZr7C1Ju/TaufVQYdOFp1iFoF7E2Ua/PjaCSi5W6MY
leEjuEZ0A9tA+JuPBv72qwFz/qi1Kf7YXAn3uqZprodToONJ/LGShnFzfbXUPmvN
wwa0fM9nQ2zEs1tmeaoFiL9cJW4kwb3wKb8ru9ALy2r1ei0iANdqoeVGhBAdLLAP
Kaussq2nt+zqIvUUIuxDsDkW2CTc98QMR5ZApk6TR+s9NRtdRE72qh0dsqnPz6dm
Gu1XK288WAETZRaVTwdAnh6QlwjBnsAO8XvEJK8+TrCghwXWvMb3OICPuwsZFSi9
HgibN8L9cttkX/js70tLkJjHG8INxV2cSIGhg6CptiRpcnqJsMsNlvbdklo7xpNw
uQHDXIGlt6Gzh9k4vS7UwjGGSQDhrPlmeTpDhORq7v9E0cEUCI4=
=90Pq
-----END PGP SIGNATURE-----

--sMfqW52yTKsAKjQh--
