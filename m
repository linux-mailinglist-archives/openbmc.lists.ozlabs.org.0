Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 056059B7325
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 04:50:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xf94J1Z7fz3bxR
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 14:50:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730346605;
	cv=none; b=OcsAk0HhI/hBSOw4oR1BYWtEJYmkaxLKf8zvuIB4CM+H7coPdOImBb/MV386E2hqt7+5mLQPLxbttP96EdZVe1nhYMgAueKNyqhH1OwxDz4HftlZhPAC7Rn5ZFNzrqw1n7GbX4LsQNxmQ6xrrOqxoV4ZJGHgLUyPj6q2uRR8nMjYIGd+NC/V9SpeplrX3MIHGCwr+qkxW/Nu9QFBbgousv/FcKvHqT9HR058sVfd1RHPO6L2JWVAYGa4YK6/J6/ljA50CAFOHc0ee2lB3AT5+OoOZYralj2oP9FUPIKVsTlhAolg73Ljcw+kPYNvEcXwDcaewpZ/kDPI4qHCcXpbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730346605; c=relaxed/relaxed;
	bh=FzCEW2dt+DPTa1C2C/CFflfXjYh43RgcMvsGrhFr6To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7b2WZlZMK0B89+ucQl8XQtfebT4BSliZ+BJ1Vgd9xCHGgbbBPfhwspKLDZCcMB3Ld2oy600+msxvnEXzZ1OmYiqMmqNZt005KSKe2kPUfg2eskjxqvcCx3Hf4HHpMm08/OQ8/z1VFKonvYuBQA5zx+rgE9xm7c4zDoK9T5VV0UVGn58y9t8bvHx8CgY8o9y7J3XaYP+K5hxeqBWw9sc/XKVkDI0USXN2t8IMzT30Rn5fejG80UsCPMP5rOhPogpbJph5Fb6CvRTbVSGP/Earn0X4zLKvg67sg2NTZoX8B6aK5aVG6YH6dKLNAn27GWC/0so6ULkQ/9YMy9X4fsF4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=UO8qE8TM; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GC5AWKym; dkim-atps=neutral; spf=pass (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=UO8qE8TM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GC5AWKym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xf94C5SFNz2yPS
	for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 14:50:03 +1100 (AEDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A14B11140176;
	Wed, 30 Oct 2024 23:50:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 30 Oct 2024 23:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730346600; x=1730433000; bh=FzCEW2dt+D
	PTa1C2C/CFflfXjYh43RgcMvsGrhFr6To=; b=UO8qE8TM2ImjmPzRp7UwMplJ2N
	gxR4JYQm1gF3+SCmvCH2c0Yc1TZsKnLLbyKDn9T+RscvG5CBG49KaqAKlRnJULWo
	h1ORS0LcaMmTA80uxGUytuXR9Q+JyEN4doqv6hn7mYCwA2xlPrNo6ieKGYc257Jt
	PZBFvUd7s9due7xmIo7L2BEObzUCs3iXEdOWw/s3iJALSyfSzG4KR9AS5WL684Ll
	2r9sbcoxArcQ/LskIN0G3h3FkcCa+9YXLKUGq6JMdbWlNUBN1eUcjIjD+QqptdNe
	mYJbY4AQ4ERkbW0vxKD7OWRbNq3SnOodW6M1IL/sjl97Q/03w3VS+UcWsmAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730346600; x=1730433000; bh=FzCEW2dt+DPTa1C2C/CFflfXjYh43RgcMvs
	GrhFr6To=; b=GC5AWKymOqt8BerhmAwNuC7t4oREzan32QVo9pPSDYUZAmlX4X+
	fDVtwIHoGuymtL+XjkR6OmLA3kIm6/jkyD0cUszaPCSxPKqOreUUyvJN+9+ivWnN
	cya2n8M7QgDiSBZzWkcSlBEAwmfEDlaIb9l+J3AalzDc8DqcXFVY3oAzIkdpgjp/
	2l6gfhx+Sxjf8nBexcdji1vjo4C3T7UJaUGCVeRpwTNsAC3if7kZNWh3W1TNVEAw
	ni6ZYXs7XcmbhARTbaUEhpe5tpaK57SlaF+PDlsQE5nIMXIZOB7Jid/sbYE/2G3W
	XSbl5cm+zHGO/0Z61Bdg4Viu1oQ7Blb8iSA==
X-ME-Sender: <xms:Z_4iZ56FTONybrobGeuMztFkr1JiNEzit1CCDhtOvYFBsFvBOOmlSQ>
    <xme:Z_4iZ270PgEG1UEv3J5wuNk0ceyn3Z3UPjBEucoS9rQbWtQBdFOCN_osWY223AjAk
    _1r_b7f_6hZfWsJZ1E>
X-ME-Received: <xmr:Z_4iZwc_McgLd3zs-NkVky4DiwLtQ4kWZLNbZIohr5SB9w_7CDptoOvYWyk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekgedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlud
    ejmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefr
    rghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqe
    enucggtffrrghtthgvrhhnpeduveejfedugfelfeeiuefgvdekjefhiedvgfdtffdthfff
    fedugfetieetfeejteenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpgh
    hithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtohepvd
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephihulhgvihdrshhhsegshihtvggu
    rghntggvrdgtohhmpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsg
    hsrdhorhhg
X-ME-Proxy: <xmx:Z_4iZyKM7-wTEX0h18mV9AYydDlmvrX8gvPe2U3CJy4QMCeakGPy7A>
    <xmx:aP4iZ9L6gAFaTfuvOtHrgWtbAy3B1E94VF8aiJpIoUA8nNQ7AJuMOg>
    <xmx:aP4iZ7wTwlvQp6nMxkPTLV8Jxk6L4yXA9v4YUIf0cesdseCtHC-6LA>
    <xmx:aP4iZ5LgShs9pfxylo51vqrvfUSO6IMB7hrCq-kwXAv7LjoRjc4toQ>
    <xmx:aP4iZ0XQjbjAtsK9ptOTgvfAPKgfDbbvAMaUgto0iIhPALJqBF7yftrd>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Oct 2024 23:49:59 -0400 (EDT)
Date: Wed, 30 Oct 2024 23:49:58 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: mapper: should it add "default interfaces" and is it valid to
 implement no interfaces on an object?
Message-ID: <ZyL-ZiXm1c-vozbh@heinlein.vulture-banana.ts.net>
References: <CAGm54UE4SXfY30oUrr9vVa+=j_Ra971A7ZcBMyMN2TgTaXN8+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xn8f18dcGjEndv/W"
Content-Disposition: inline
In-Reply-To: <CAGm54UE4SXfY30oUrr9vVa+=j_Ra971A7ZcBMyMN2TgTaXN8+w@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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


--xn8f18dcGjEndv/W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 03:00:01PM +0800, Lei Yu wrote:

Based on the info from Matt, answering these questions.

> So here are the questions:
> 1. How to explain the above behavior of "D-Bus calls on default
> interfaces", especially for 2 & 3?

#2 seems like a bug in mapper?  When I run this on a sample from systemd
I get good results:

```
$ busctl --user call org.freedesktop.systemd1 /org/freedesktop/systemd1/uni=
t org.freedesktop.DBus.Properties GetAll s org.freedesktop.DBus.Properties
a{sv} 0
```

> 2. Should mapper add "default interfaces" for all the objects and
> their parents? If yes, it adds extra interfaces that are not
> implemented; If no, it misses some interfaces that an object really
> implements.

I don't know that it is adding "default interfaces" really.  This code
you linked to seems to be "assume these default interfaces will exist
because they are a requirement of dbus".  The code appears to be an
optimization to be able to advertise the path (and contained objects)
before the bus introspection is complete.

So, I think this is valid, isn't it?

> 3. Is it valid for a D-Bus service to implement no interfaces on an objec=
t?

It appears that "no interfaces" isn't a thing.  "no interfaces other
than the 3" is a thing.

I'm not finding explicitly in the dbus specification[1] where Peer,
Introspectable, and Properties are required (except that it is perhaps
implied by the discussion about the Message Bus itself).  sd-bus appears
to always add these though (you can find multiple references in the
code)[2].

Interestingly, another application I have running (Spotify) does *not*
always have these 3 interfaces.  They're obviously using a different
dbus library than sd-bus:

```
$ busctl --user introspect org.mpris.MediaPlayer2.spotify /org/ayatana/Noti=
ficationItem
NAME TYPE SIGNATURE RESULT/VALUE FLAGS
$ busctl --user introspect org.mpris.MediaPlayer2.spotify /org/ayatana/Noti=
ficationItem/spotify_client
NAME                                TYPE      SIGNATURE RESULT/VALUE       =
                      FLAGS
org.freedesktop.DBus.Introspectable interface -         -                  =
                      -
=2E..
```

So, the "assumption" that mapper has is perhaps only valid for sd-bus
and not for other dbus libraries.

[1]: https://dbus.freedesktop.org/doc/dbus-specification.html
[2]: https://github.com/systemd/systemd/blob/6e492ae98abd9500a4310653dec0c3=
fced66c7da/src/libsystemd/sd-bus/bus-objects.c#L2472

--=20
Patrick Williams

--xn8f18dcGjEndv/W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmci/mUACgkQqwNHzC0A
wRljjxAAoPhhKbDgNRleTiztrSSIeTHKsCgad2KbHV9B//jX58+DqXoyy2PzJDhQ
Xw1uo2q4uN4g56hjdXscn+ZA03aZctGKu8lt/g1zafN+3vDSQO9vKLJku5JgA6Iy
rBsyjNCigCvOIiT5+R1AVL4T3sYOYZj74UXek2hWy+i581TxkF8xNbcpGGg50Wvo
BpaFXpQHlkKCzVh7tfowG7hZo5EdeMgb+xxUmCJu7cFeFYvLfrfdPpGUmlsCtxbM
H/Gn1xKZPrIh3gb0mNhjZzz4lS14le5eerUgpDa8sC2WkYLNLoEZVyk5ElXcG36l
kS0LBmkc14bNSxzKNml/pjqKLhcapU1WhbNdlyTyUcy7GNGvPeNzc9Fpj1aMGK7T
/r8AML2lps3sKSKM53nk1Gy4pRx87+v/H2a5kKaPwK5wZCpziOz1K94BFW3ZrbCA
13a9cx8cEbYTLZrptjgSrHL8FctoRq/Hj9Ad+Oq5PC+sP0NovoMZmhn0LH4QPtQ9
ySddc4CPEOPMkxkgVNm+/6RILNefh9UAvBTR5BQiXvs64qwrPDh30CYS3qpUJdmh
7VEXtPv/RsUhmWc8nZO38k4o5n4oTMSRxHLJlhfZHbhuy0nEDg4MRYBFpKha/6Vi
FI69r6Eo0YXDUAuazTeHZwFnXaAhuXQU7UePkI3auLaKtTJxU4A=
=1xCR
-----END PGP SIGNATURE-----

--xn8f18dcGjEndv/W--
