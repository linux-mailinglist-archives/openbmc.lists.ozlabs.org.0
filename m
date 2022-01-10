Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B5489B37
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 15:25:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXbhY3Xkwz2ypK
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 01:25:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=aDzEUroJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OksHdZki;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=aDzEUroJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OksHdZki; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXbh439gqz2yJR
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 01:25:08 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 86AB73200368;
 Mon, 10 Jan 2022 09:25:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 10 Jan 2022 09:25:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=njI7Qv+cO20aa/ZZDr/u9OcvftR
 zQQ7mWiFzCcmjdwQ=; b=aDzEUroJRV4/g2snADrUxl0gjiPp86ukvL5V8KObLif
 dNg2SaXRkypmX/dhn8OQWeNj7iYrvFyCOMWx+nBbJzU2VK7dE8hboVwTvSkpHNVj
 SLAQ6Wb8H/mq4nsPw2UWpkNXFeGrp2ppHKgDUHaDoGED56StKrGZZlPsecxDtNfE
 0PGuaE6C3EStQQKdjOEcM3E3fJ3Axg5T5aPbXlXQxCP7ttk9vXwrt0r6XwXPpS33
 Dao/a2IM9+46PlSIH83vc2swCg0y27SOn2B5K0miWZ7qZQvjnaLWvEsBWmFiwAYy
 P3AUkrfUfwq+wFjswKEYGrUnhbKUpke/CO0AN3NmKCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=njI7Qv
 +cO20aa/ZZDr/u9OcvftRzQQ7mWiFzCcmjdwQ=; b=OksHdZkilUXJebspJuS6Cc
 HgfJSDTHnPyBp82gksha0CmJqM8/SjwiMqVoeXGKcSHnacDFVRnyLHDB/WxBZ4xE
 fxhbxfycMsFTeAhAa9aAeSatGA7EYsspljuBXjs6TXHXAke+aTBA7HgXtNjPpuwk
 ZUtIyyq4QqZQCa0JpcZiB1s0ujWGPlyKuPjNHgrNNLiNF29tcmB2suptCx60UoNT
 cfoqiN7n20vfLLCDt0DWpxZtaM6wPunIo5VmiL66ooBIepfXfORa1W+Fa5s4FYxa
 3aqZ7qGwMGTJjbgK3NLbycWA1TupcL2uHJ9gqGLA+3CEw6bIc5NkTBaj1+Almc2A
 ==
X-ME-Sender: <xms:vkHcYdn7gzkZHi55Q6ws6YLOtdhOqRyHYqWIk9U_yGlp6VFSW_C3uA>
 <xme:vkHcYY1NebNqgewT1Q8rJfGaUmDDaJw3heoWKG93gwxCaInXdhQOtzxNWdsZLceFt
 bO62bFzxCSDd95SwM4>
X-ME-Received: <xmr:vkHcYToLryEKIBY3hfRdKsWnZ_S8heflcsyqiZ43-0RluQXR-3zaWncBikVa_OvKOanTsypNXBU5OGt6GNe8E3pMyOKCjLAJB0CTCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepleduueeiuedutdetleeuveehtdei
 hffgudffieejiefgffeileejiedugffggedvnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpohhpvghnsghmtgdqphhrohhjvggtthdrgiihiidpmhgvmhgsvghrshhhihhpqdgr
 nhguqdhvohhtihhnghdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:vkHcYdlP-YV3WS1C23oahnoA9oUq8Gsdr4Wn0NHM28S63ZTFrR261Q>
 <xmx:vkHcYb25Mw-rvp8ImWZbqhhoVMbQ_u9gF5xAL9vChlF9zaeBpzsJag>
 <xmx:vkHcYct_CJOaxSJibiIVJXQgqmqiKUah78hLqGW4w9amMc6oAnqYug>
 <xmx:v0HcYY-VON2NayICrPzvvInmg3nZ1BgwSes1hcFvEwXRdko8vEBLQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jan 2022 09:25:02 -0500 (EST)
Date: Mon, 10 Jan 2022 08:25:01 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Upcoming TOF elections
Message-ID: <YdxBvR4ZbFn7WDJp@heinlein>
References: <YdiCUiwh1iD4ycr8@heinlein>
 <70ab9923-a976-46b0-8ec3-bbdd689c50a8@www.fastmail.com>
 <eacc4cdf-467e-4f98-8254-a530c1145203@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mU60Q/8uoNjs/L01"
Content-Disposition: inline
In-Reply-To: <eacc4cdf-467e-4f98-8254-a530c1145203@www.fastmail.com>
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


--mU60Q/8uoNjs/L01
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 12:11:49PM +1030, Andrew Jeffery wrote:
>=20
>=20
> On Mon, 10 Jan 2022, at 12:09, Andrew Jeffery wrote:
> > On Sat, 8 Jan 2022, at 04:41, Patrick Williams wrote:
> > ...
> >> The most important data that people will want to see is the list of in=
dividuals
> >> who qualify for voting in the upcoming election.  The current draft (f=
or
> >> approval with issue #9) is found here[4].
> > ...
> >> 4. https://github.com/williamspatrick/openbmc-tof-elections/blob/main/=
2022H1/rollcall.json
> >
> > How are the following terms derived?
> >
> > * highly-productive
> > * active
> > * emertius (sic? emeritus?)

It is quite probable that I've messed up spelling somewhere.  I'll get to t=
he
bottom of where.  (Should be emeritus)

> >
> >  I didn't see mention of these terms in the tof-voters patches.
> >
> > Maybe I didn't read the associated documentation closely enough?
>=20
> Ah, as soon as I send that I see [1]. Still, it defines 'Normal' and 'Hig=
hly-Productive' but not 'active' and 'emertius'.
>=20
> [1] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/50202/1/tof/membe=
rship-and-voting.md

It not in that change, but in the original part of the document:
    https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md

> Membership is determined using data from the previous 6 months of develop=
ment
> contributions.  Using this data, the TOF will publish a list of Active Me=
mbers
> of the two tiers.  An individual who was an Active Member of a tier in the
> preceding 6 months, but does not qualify in the most recent 6 months, wil=
l be
> listed as an Member Emeritus for 6 months.  Both Active and Emertius memb=
ers
> are eligible for elections.

So more specifically there are the following states:
    - Non-Member
    - Emeritus Member
    - Active Member - Normal Status
    - Active Member - Highly Productive Status

Non-members are individuals who did not contribute enough points in either =
of
the last two 6 month periods.  Emeritus members contributed enough in the
previous 6 month period to qualify, but not the current 6 month period.=20
Active members contributed enough in the 6 month period to qualify for
elections.  Depending on the amount of their contributions they are either
"normal" or "highly productive".

In the roll-call JSON I used the following:
    - Non-Members are left out.
    - Emeritus should be "emeritus"
    - Active Member - Normal Status is simply "active"
    - Active and Highly Productive is "highly-productive"

--=20
Patrick Williams

--mU60Q/8uoNjs/L01
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHcQbsACgkQqwNHzC0A
wRlUXw//Ywt/HOaNaCV3lPcRC3x1rGL8XFigKA3sJkMPBb/FX19y8up0gr4wa4b+
uPzndCfkEdCHmrswuH9afZOGIKQ+Th3I2GRiXNrnWykH6zS+s7BM1Ic5iTWC/uDr
kuCBtrJ7TD6dkIP9GzRobfbPx8Qpwhc+g9Di7f0+CdLz5KuJrcNDczc2uAqiuXia
fTWiHKJkF1r6dbDlkiZecakI3l5EyEaAgPXfcA+QhWyh72tM4FBnBuJ7XiW8M6C+
vHILjXO+u9x04uZDcnA7nmGYisnb+ji34HeIGhhrbHhB2f6ERJdAVyW9x6BGBY5q
14nV9ga89yA8C4p+QZhOcFfM9U9mwPmI/bPs4pyyLwFeAeBSbQmmhu5QEYpZ4sAu
CX0uQOxscsUCk0bR2u9FABb/22KnjTU1xpYLFucp2foYPOYh0asW/xRsem3ImqAB
zSOuMg1gSSFMpRPpw+h9iqGjPNx6NkC/0bLS4d0rCLD1huwBhOjIKeclwYbEVC2g
7qdgPWFhuAtnq2ihVopTfQpjfWCAP5/qg55IIUmk7H98bbsdhXtoF1/PWrE5juIa
heVy1f+vwquMJnkNkm2qLK14o0+s7d4huCCa/cPg0WiU056oJOzBisW6WZTal8x4
HMBNilkFXlmuy3aV/SfuUKqFbKGAhXPW+YY4dtW4jilDeXsnwIs=
=aHK/
-----END PGP SIGNATURE-----

--mU60Q/8uoNjs/L01--
