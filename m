Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 766B7607F93
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 22:15:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvG1K2XNyz3dsv
	for <lists+openbmc@lfdr.de>; Sat, 22 Oct 2022 07:15:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=iW4dDUAK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lWsEUB+f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=iW4dDUAK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lWsEUB+f;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvG0g5266z3bj0
	for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2022 07:14:58 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2ADCF5C0156;
	Fri, 21 Oct 2022 16:14:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 21 Oct 2022 16:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666383294; x=1666469694; bh=N8/slTz0bQ
	udjc6pyAf8P3k8zW7DRQZzoebKDjpBMIg=; b=iW4dDUAK2oUFtPRVddQJrqAtK6
	WdFrsM0B+0jKGvrZfuhBXUKxELi4k+Rg8ONxG+2lbN4UYDsjWRGwOsZx6iDqpdHA
	Ut1WguVsK6MRxh2tpea8dkUNG4bUqhF7mExxnQwgB304gF269IAIYem3GboU9nNT
	YlKzjzV0v38BKPAi9hilFq0+zY+qvNIXlGLoMZsDWMkHYRRqNKjn3F4i1AuJSf1g
	s3JN6Klwx6ej37mtnd2sdnODerwuN9+oIo32bgREtUIHBgyOTGG2VrKU5FXXWAaR
	jiH53TsZEh0zwrTwE8evE9plMEOaMNj8qTqVgbG86IQD/wbvzEYJYz9DD1og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666383294; x=1666469694; bh=N8/slTz0bQudjc6pyAf8P3k8zW7D
	RQZzoebKDjpBMIg=; b=lWsEUB+fXC10nRQscgPeQpDbQRGf7Er3wcb09K+KrUH0
	55Y69olxaUpXboT+6QqM527iuhV61TJRhnwrtK/jTaQRQJJr5gfd2xjCpF24/U8j
	KIDUT6A8BVFoy9hNIDpaoW14exzU+HzR1BZm431x/Dc6fKGxM/0y/s0qeU4VNwc4
	fwuVmGXilmmfKd8tyZ0/RCV7x0is+aJ7u1EQIoVnb1MLtQ4u4orcQRTfn4ua5gTk
	8teletYSo5AcREueK5Av64D2jIz3wdcV2KScQHmicovY7xFCuxvm+P54tR1UTni3
	d7IBZ1y+AvNtbT73ywncLTMxKwlzH2uh/ZZeDn1EZQ==
X-ME-Sender: <xms:vf1SY2uftExCQpaIJAKdwPOOz4rRbyAqHQm8x8BWzH9Wdd6w9Gm_eA>
    <xme:vf1SY7cevPi3aN7nzTx6yB2Mz5awNtNc--vjv_g1idf3SRk_aUVXAO3YZqJATwcoY
    6-CgcW0gFjGTpaCxMs>
X-ME-Received: <xmr:vf1SYxzWxeX0aTq168-xE65amnlpRqz7cgJxVXDyfkLyg2RFRRJIBWKUIdKGF_7qNYMap83AFE6HyHhLFbsQH3aao_UcJ9IL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:vf1SYxO-TII2uNhwotEG0Rh7Ehekrez1HxR6-kV-T3Nk9SexhsWrRg>
    <xmx:vf1SY2_EOV0rz4nw-5OucffWaRKm5-M64QOr9q2QG_CxMxlPX2QfPQ>
    <xmx:vf1SY5X5TnG52hZBazT84iD5xcp3uvABV2nVFrXH-VAAjQv5cWfDVA>
    <xmx:vv1SY7Ea1fyWZ-mYoIjWxPQmw9xcgdKXbUtXES0k5NHwq0mjJX80Yw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 16:14:53 -0400 (EDT)
Date: Fri, 21 Oct 2022 15:14:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Adding support for custom SEL records
Message-ID: <Y1L9vCFMvm8alJMC@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dLte16n6qN5uqrDV"
Content-Disposition: inline
In-Reply-To: <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--dLte16n6qN5uqrDV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 09:50:47AM -0600, Bills, Jason M wrote:

> Intel had a requirement to support storing at least 4000 log entries.=20
> At the time, we were able to get about 400 entries on D-Bus before D-Bus=
=20
> performance became unusable.
>=20
> That was before dbus-broker, so it could perhaps be better today.

I was surprised that there would be much performance impact to dbus as a
whole because there should not be any impact to the bus because one
process decided to host a bunch of objects.  I can understand _that_
process becoming slower if there are algorithmic problems with it.

I did an experiment on an AST2600 system where I modified phosphor-logging
to support 20k log entries and then created 10k of them.

```
$ cat meta-facebook/recipes-phosphor/logging/phosphor-logging_%.bbappend
FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"

EXTRA_OEMESON +=3D "-Derror_cap=3D20000"
```

What I've found can be summarized as follows:

   - Overall there is no impact to the dbus by creating a large number
     of log entries.  Interactions with other daemons happen just fine
     with no performance impact.

   - Creating 10k log entries does take a while.  Most of this time is
     observed (via top) in jffs2 but there is also some peaky objmgr
     activity.  There might be some improvements to be had there, but I
     don't think anyone is intending to create 10k events in the span of
     a minute.

   - Dumping all the events from phosphor-logging is slow when there are
     10k of them.  It took 8-11s.  I didn't have `strace` installed, but
     it seemed like much of this was coming from `busctl` processing the
     result and not from the bus transfer itself, but more investigation
     would be required.

   - Deleting all 10k of the events timed out at a dbus level, but still
     succeeded.  Almost all of the time was spent in jffs2.

I'm not suggesting there aren't optimizations we can do to
phosphor-logging, but it doesn't seem like dbus itself is a direct
concern.

```
    # busctl call xyz.openbmc_project.Logging \
            /xyz/openbmc_project/logging \
            xyz.openbmc_project.Collection.DeleteAll \
            DeleteAll

    # time busctl call xyz.openbmc_project.Logging \
            /xyz/openbmc_project/logging \
            org.freedesktop.DBus.ObjectManager \
            GetManagedObjects > /dev/null

    real    0m0.017s
    user    0m0.015s
    sys    0m0.001s

    # time busctl tree xyz.openbmc_project.VirtualSensor > /dev/null

    real    0m0.025s
    user    0m0.019s
    sys    0m0.001s   =20

    ### Create 10000 log entries.
    # for i in $(seq 0 10000) ; do busctl call \
        xyz.openbmc_project.Logging /xyz/openbmc_project/logging \
        xyz.openbmc_project.Logging.Create Create ssa{ss} \
        "Hello.$i" \
        "xyz.openbmc_project.Logging.Entry.Level.Warning" 0 ;
      done

    # time busctl call xyz.openbmc_project.Logging \
            /xyz/openbmc_project/logging \
            org.freedesktop.DBus.ObjectManager \
            GetManagedObjects > /dev/null

    real    0m11.722s
    user    0m9.130s
    sys    0m0.071s

    # time busctl tree xyz.openbmc_project.VirtualSensor > /dev/null

    real    0m0.024s
    user    0m0.019s
    sys    0m0.001s
```

--=20
Patrick Williams

--dLte16n6qN5uqrDV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNS/bkACgkQqwNHzC0A
wRmcPg/+JrMoWfsnDBIti4va99eAgQMe/VyCd1NKuWXq+M0gqzH8jwoz5OZoK64c
Jh59DW9ZiL0LgLf7rmD10HtEIuocO5Ud9MiIKOVfu3Fgo7Nd5xjoKJQCXRbY6Mc4
lFHq8fy2wfjDGUGuXjLUySRiEpJMSJqEfqSGwHkOgxcx00MaYFANB+yIeQsneDgy
Mc/OKZPBaXMzErucnNngjOtiPZ1veUDntJ2kikWfFyForkIpPpPkZyJQD4/WJIYZ
ZrtdvtHBZB7sFg8QTnqumKya0046+hZfr1WoBaWKwhlzZWKflN1w7a5Zy0m/HXp7
gb7uHaT6lxatFoIMphrK8izRHtBTs77oTkU574gdOxZIZjhAQcww3NDKcZg9VT1/
CVWuXzBrljy6jrANGz3TX/NWuW1D3yemyR8bBBGxkcAKIUSJpBDDTJuBQ1RxUNPO
Oft6S9vtuebkkx3vKioSQjfM6TfAHcv0AT4ipa4ZW8I3k1SF8QTEzJUue+GVeGV0
ZdjgskgTGTji6Qw1grx+NrS5LA0MUr/tfgpRU6PMmNcZeBiV0E8z4NSm3IIPXkF0
1+myjKyJiLqU3VYGSY8lDMTMaqu13mXycbSnsVCyEIRxWMPyeRfeIYkdLMzqwfBe
hAMQ1hF0l5GL0PulzVKK9sb37kLEwzhGKvuBjRwWqaAysnHjSHY=
=ceMG
-----END PGP SIGNATURE-----

--dLte16n6qN5uqrDV--
