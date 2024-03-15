Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4477087D0F0
	for <lists+openbmc@lfdr.de>; Fri, 15 Mar 2024 17:09:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GpBy39j6;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pmOH0irL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tx8My5V2kz3vYp
	for <lists+openbmc@lfdr.de>; Sat, 16 Mar 2024 03:09:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GpBy39j6;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pmOH0irL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tx8MJ4X52z3dX6
	for <openbmc@lists.ozlabs.org>; Sat, 16 Mar 2024 03:09:15 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 372E05C006E
	for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2024 12:09:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 15 Mar 2024 12:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1710518951; x=1710605351; bh=5rO7qV/sqwRqoL98s/nYjhMph81E4G32
	pubCuAeTyiw=; b=GpBy39j61lYaM+dTtOk+1Rp7LxoIjfDIiwtngZ1iNGU9iXGb
	0d6TxSe+CQZN3r5lC2VbzGeT4m/DFNYwHfwCyfXHckh3G/a/SSXs36UYgrBO5yIz
	fZqRwVxL969vjpJ/XWgJvCXVAS0QTQBcU9Q3TJIYiMvqjOHPgr2Fm4XWXIsikD3o
	xYUt8Fvoi+ABQHi+EJVNa/BkNjppL3mFryMTwJBVfsFUTMWbMO8NSlx8sP6y70kP
	5PmxOPS59dTw/drcPEi9Lvoy2lTc5Mv6T55OQ6GOwY53iDD8X0EN0PyIYy0jkq4H
	dvSEtleah+Wirtj4SfZEKDqZFifycclyR6Xtpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1710518951; x=1710605351; bh=5rO7qV/sqwRqoL98s/nYjhMph81E4G32pub
	CuAeTyiw=; b=pmOH0irLOpHvLrc52/Q+OZTl+2E7F0PyZbprE+5HXQJvWdn0LrT
	03qqOLuZIHenLUa2/weWRmsE9iO2S74KN/ZOmPLevT1v9RFIWKYu9/JQZUBGbuUG
	l9LruIPGfqOiXF9Is2vuAUJZNEKXgUTm6eFyv8qR75dneIP4ULiOnTO33+IOB5oJ
	PF9EL6JnnXTMLiJ7IQXEWKP6EgyDab1WOHgW52yw7V9GbIN1K6rBAyt8+6DRbyGg
	2JS1I99FKYJXhLhy/ld5dWApuRWoOkBRspP1/JVxFmJMyivqx18hRQnth0z+3Rtr
	J8iLpPqagqPlEbdkk6zDj3dm8mJvUmYScmQ==
X-ME-Sender: <xms:pnL0Zea29f-r-d1hsEwtjXq9e1Uor8t6O5fzLLDi6LpXqDpBP25wfA>
    <xme:pnL0ZRag7xXpFbA3Vxka1Nsw-oVmf05jW4rfrFhmErwM2hM46zRjoyhL89_BB8rYn
    C_BsBczX_2EFlB6QTc>
X-ME-Received: <xmr:pnL0ZY9Fg0CyUQHudhDgKDXeFtLD1kPHVp8Ap3lpLZX8yZPOsZGKVWsFQIvSZbv3YqmMimUerwXJod5VVaqdrLFt_aBeMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeelgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfggtggusehgtderredttddvnecu
    hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
    igrdighiiiqeenucggtffrrghtthgvrhhnpeekjeffheehfeehkeefjeelfeefuefhfeeu
    leduleeiiedvudfhhfeufedutdekvdenucffohhmrghinhephihotghtohhprhhojhgvtg
    htrdhorhhgpdhophgvnhgsmhgtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:pnL0ZQqEGs9039y9ZaM5BAgLxTz_uesoybzv7gnulMv0hDgan84rWA>
    <xmx:pnL0ZZr4ZqJR_EBKOmn4qI7u8kjGEnz1YulJpHEL-4lVtqkS9J5kDg>
    <xmx:pnL0ZeTREOQMwMD82KyoMX90ssqzVNpu0zHY0bPx14XvQ3aX2gNXRA>
    <xmx:pnL0ZZrHieDuSOTSR7qI_Ssof1q0REaD0R3uDcBlDtJzIFVpIQkPNQ>
    <xmx:p3L0ZYTlF-DSovGE9iQZavsUM2sAednJXNR4Q6GYrZRCqZQ2DnRsNA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2024 12:09:10 -0400 (EDT)
Date: Fri, 15 Mar 2024 11:09:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: notice: meta-poky removal
Message-ID: <ZfRypYIR-hz1hGwz@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B/rgjIhOrOJ5REy5"
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


--B/rgjIhOrOJ5REy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

TL;DR:=20

A commit is going to require a change to your downstream `bblayers.conf.sam=
ple`
and local bblayer.conf files in your existing build trees.

----

In testing an image for our machines based on a recent openbmc commit,
we discovered that when we SSH in there is a warning message displayed.
In tracking it down, I found it came from this upstream commit:

    https://git.yoctoproject.org/poky/commit/?id=3Da226865c8683398b5f58628b=
a2ec5aee1ee6c19d

When we first started the project, we based OpenBMC on "poky" but since
then, the purpose of Poky has diminished and upstream has moved more and
more back into OpenEmbedded-Core.  At this point there is absolutely
nothing we use from `meta-poky`.

With this in mind, and to fix the `motd` warning, I've pushed up a
commit to Gerrit that will completely eliminate meta-poky from use in
our tree:

    https://gerrit.openbmc.org/c/openbmc/openbmc/+/70072

As you see, the primary changes here are to remove all of the
`##OEROOT##/meta-poky` lines from our bblayers.conf.sample files for the
upstreamed machines.  Since these files are named ".sample", bitbake will
use them as a template when you first create your build directory, which
means all of your local build trees have `conf/bblayers.conf` that will
also need to be updated to remove the reference to `meta-poky`.

(Or if you are not comfortable manually adjusting these files you can
always delete your build tree and rebuild.)

The openbmc/openbmc commit will also remove `meta-poky` and
`meta-skeleton` symlinks from our root directory.  I see no usage of
`meta-skeleton` and with this change `meta-poky` is also removed, so
these are just to keep our root clean.  As a side effect, any downstream
`bblayer.conf.sample` files will also need to be updated accordingly.

--=20
Patrick Williams

--B/rgjIhOrOJ5REy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmX0cqMACgkQqwNHzC0A
wRkkRxAAi8YxLsiWPfShxVPosKvGVRBoBBebw8HlZ2OLi4SdYqjP6UCSbeUDHU4x
DOXL+UreTeV12drqQWBzP9hXEg0jHQ0fJz9ztD/97s4ttN8w59v4doMz/56U0fXq
bS/YrZ+uL10n5ZbAKr09rqWLltmS+chrxoWdzF8CqPAfkqhNepS90+ef9B4eJJms
EAAdzMl7FfGyBFyd6Xbc+Ckk/TGeCWN+yQcznmLSEDhyBFG5OuRXCEGSt5S7kB1b
W6QtVTLgNHdrkVZ5yKgOsTDwt/sOrQp7O4NhSlc/6PFJaTQcBkSnx25CONRTwMC0
tLnvaVA8jRhTnyaQYqbYrcP3VliBvvWwdsU/n1QugS4F8K+n/YAhvvs8l072Itw/
o4JLWVAvIdY15rrggrBrGN+NZk7mGURTodYqAjAFETLnhNGm5C9VCqNrJGHIHAdN
iCFovSJy3+SggP1NXlruxkzFxHhTyrvewN4roxMQamt9huGJmJR96PWe3Ljy2nXt
tFlidiknpbN1acCV2aT15WxG7qAbKxwIB4A/PTr9bb6prvfECnOqm3eZIMmofA0i
1HqkYr07Vkyt2gnKoCoT2ssTkZ4OOpaXw/9VsCL8TGwgr+6uJJr4tbrNYnyJr548
wxZyxGih9zrUy7xjq1nHo6HxKrcZ4z+3ew0akHdRIrl1c/Lqfqg=
=eqUq
-----END PGP SIGNATURE-----

--B/rgjIhOrOJ5REy5--
