Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id C89678D3684
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2024 14:37:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=XSsWPfZ8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=PoMX/Yj6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq7xx3BLlz79pf
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2024 22:30:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=XSsWPfZ8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=PoMX/Yj6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.150; helo=fout7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq7xH6tWFz79NQ
	for <openbmc@lists.ozlabs.org>; Wed, 29 May 2024 22:29:38 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 1C2AC1380171;
	Wed, 29 May 2024 08:29:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 29 May 2024 08:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716985775; x=1717072175; bh=0aLfj9VZhQ
	y0fAOB3lemjAiWQFR/Zx/Oph1tQpjlz4k=; b=XSsWPfZ8dmeW0y+N+FJRYqwjzP
	5xzhYA6/t4sU8qpeV3oBbnGx4lWSaeqP9N8OIdSxdcyu0/hZ+53IVK4G+OY3Bxn7
	a5ithUnpKUou0tZC/r74Zr/CNnF9bvzqxQ8KSxsilHl+aCHxBZ23cCurwQALrQof
	H5kOCcu8nMS1OVOXFWfjh/1+vqxDUcKBHddVbeSbVlGgYKjiRgEfu03matr5Dnpe
	Lrh2y5SCe1EkrlPdOFqHkflnB3atcjHcR0CKi8Tqwppb7JVxtNPICXaW3uPq28/B
	NcvuGbnhuHYTNRrt5sKFcyK5ijw9vxnSQJt9Y6RMDipxhTRmgWfi3xgyshuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716985775; x=1717072175; bh=0aLfj9VZhQy0fAOB3lemjAiWQFR/
	Zx/Oph1tQpjlz4k=; b=PoMX/Yj6U6SCtWHNLS6SZ5qknPCoQA7M88+x4190ol6b
	I1RGHLpeYANjHWT9zZa2IeHlO5ynGANtHMLp/JEQ13UDxsyx1OxOpe8qn0AcLWKC
	T0tX6LHkTr41dCLmvPjwydaKVRI7VR0RwNKS7Rd8NA9GxxwVxY1EX4uDVy5Bejqx
	E7v0lrlVOrsE+wB1RviccPZMj/XZdnvhSE/K+HvVfkNfMPB6pIQVF6RG84paAzKk
	hZgB7WFlKFDKagAmgy+Gpv76JLTBsjtwztzRvfL9R/y6fdW74zm49L9WHswnIKVQ
	VaLtuwUH6DJlLzzskyedGOUF5BvZ6jyJUtOF89ek5g==
X-ME-Sender: <xms:rh9XZhza1oiisgpujJYyfiMjPi6zGfdvp7CjR6ZlON_RAR3sboNL5A>
    <xme:rh9XZhQiNu2zoXH-qSWM3-qBmL5Ihd_AzS2LgfIBXg-qUbGv3Iy2BYE4h68AiWzCD
    hxACgGGU-Jx1X-1eSA>
X-ME-Received: <xmr:rh9XZrXSelyJBKA4yTZFhJowUTE0bbhiyd5gz2dX0ayqD4-Um931XXvCy6EshS1PXwEFtCevMOAYLuqRhNARHn8q7A1R6pob3xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekuddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredt
    tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehueeuueekffeggfeuheefheef
    gfejvdeigfegueeviedutdfhvddvtdevgfffheenucffohhmrghinhepohhpvghnsghmtg
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:rh9XZjjBWTN54qieV0w-UVhLqYrgccfvYzgkPILDQAz2FKCGzeaTJg>
    <xmx:rh9XZjBZs2x1iQJblgsGEZe9PTmYKVO2xA_4n147eiX-CXXQjQpZrw>
    <xmx:rh9XZsK1pMONDf_qwImFBMm4KZZrO9lnj-aQEwESPCpYOmKHn0wkrQ>
    <xmx:rh9XZiBB44WHDp04SS4-7K0wh_nx98n0bFDfMnWAWhC_MC-pdhYbww>
    <xmx:rx9XZmNcPtjpgmWcbVAThXQ9d9kDZXTx1-evVU5-sxfL-c2qFE_FCau2>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 May 2024 08:29:34 -0400 (EDT)
Date: Wed, 29 May 2024 07:29:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: [External] /var/log as persistent
Message-ID: <ZlcfrFHcxsUGiBng@heinlein.vulture-banana.ts.net>
References: <ZlYU4X1sXIou-C6L@heinlein.vulture-banana.ts.net>
 <CAGm54UG-KQ2HZosGQRwwjmGq4GUZcbfs5csAj2i4+AfXd8E7yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ANPnTx+oFtZonJQS"
Content-Disposition: inline
In-Reply-To: <CAGm54UG-KQ2HZosGQRwwjmGq4GUZcbfs5csAj2i4+AfXd8E7yg@mail.gmail.com>
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


--ANPnTx+oFtZonJQS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:49:15AM +0800, Lei Yu wrote:
> On Wed, May 29, 2024 at 1:41=E2=80=AFAM Patrick Williams <patrick@stwcx.x=
yz> wrote:
> >
> > Hello,
> >
> > It was pointed out that I did not do a good job of broadcasting a change
> > I made back in March, so I am sending this out for awareness now.
> >
> > https://gerrit.openbmc.org/c/openbmc/openbmc/+/69959
> >
> > A default setting from bitbake (to VOLATILE_LOG_DIR) was causing some
> > platforms to not be able to persist `/var/log` and instead it was
> > mounted as a temporary directory.  This meant that even if you
> > explicitly configured journald to use `/var/log` (instead of the
> > `/run/log` it uses by default) you would not get persistent journalling.
> > It also meant that applications like `obmc-console` log files were not
> > persistent and would be lost in a BMC reboot.
> >
>=20
> 1. VOLATILE_LOG_DIR is defaulted to `yes` in poky/meta/conf/bitbake.conf
> 2. With static layout, the above config makes the `/var/log` a
> volatile dir linked to `/var/volatile/log`, where `/var/volatile` is a
> tmpfs.
>=20
> Be noted that it's the default for OpenBMC machines with static flash lay=
outs.
> So the journal log and obmc-console were volatile **by default**.

I was still surprised that the journal was being persisted for you with
this change.  I'm looking now in more detail at the journald.conf because
there are only a few platforms that explicitly set `Storage=3Dpersistent`.

The primary reason I made this change was because setting the journal
config had **no effect**, which is, I think very unintuitive.

It seems that the default journal config is `Storage=3Dauto` which means
that it will be volatile only if `/var/log/journal` exists.  This might
be why you are now seeing it persist.

> Users should not expect the above logs to be persistent, and if they
> do, they could config `VOLATILE_LOG_DIR` to `no`, which is done in
> `mtjade` and `mtmitchell` layer.

Conversely we could have machines that want it to be non-persistent to
set VOLATILE_LOG_DIR, right?  It isn't obvious why one default is
"better" than another.

My impression is that VOLATILE_LOG_DIR is default partially because
syslog is also the default.  As I said, with VOLATILE_LOG_DIR,
`Storage=3Dpersistent` has no affect.

If the only discussion here is really about the systemd-journal, we can
add a PACKAGECONFIG that chooses between `Storage=3Dvolatile` and
`Storage=3Dpersistent`.  It seems we already have 3 different meta-layers
with a custom journald-config to trigger this, so we might as well
consolidate those.

> The change `https://gerrit.openbmc.org/c/openbmc/openbmc/+/69959`
> makes `VOLATILE_LOG_DIR` to `yes` by default in `meta-phosphor` layer,
> which effectively affects all OpenBMC builds.
>=20
> > I had asked a few machine owners and most of them either had it set to
> > explicitly unset `VOLATILE_LOG_DIR` in their meta-layer or through some
> > downstream changes had overwritten it.  So, I made this the default.
> >
> > I thought this only affected:
> >    - machines that explicitly set `Storage=3Dpersistent` in the journald
> >      config.
> >    - everyone's obmc-console logs.
> >
> > Based on the report from a downstream user, it seems like there might be
> > more effects?  I'm not sure at this point, but advertising it wider.
>=20
> As above information, OpenBMC users were expecting "volatile" logs
> before, and we should keep it default.
> So I would suggest we revert the change to keep the consistency about
> the default volatile log dir.

Were they "expecting"?  This is where I did ask a few of the machine
owners who have upstream systems in production.  All of them told me
they overwrite this already.

I highly suspect that any commercial system is going to want
persistence.  I can understand what you have referred to with rsyslog
for cloud systems.  I think this is one of those cases where whatever
the default is, it won't satisfy everyone.  (We would be considered a
"cloud" style system but don't want to rely exclusively on rsyslog
because you then don't get visibility to debug network issues.)

> And for the reasons why I prefer the volatile log directory:
> * In most OpenBMC machine builds we see 32/64/128 SPI flashes are
> used, so the `rwfs` is limited and the frequent "writes" to the SPI
> flash costs the lifespan.

Are you seeing lifetime issues with SPI-NOR?  Aren't they rated for at
least 1 million erase cycles?  Even with the static layout, where all
writes are going to the same location, that should give you 32 years of
use at 1 erase per second (assuming only 4MiB of rwfs space).

> * To collect the logs, we could either use rsyslog or the host-logger
> (which were "already there") to send the logs to remote servers. So
> there is no strong requirement to make the logs persistent.

Are you really wanting obmc-console to *not* persist?  Do you think most
people want this?  This is a bit surprising to me because obmc-console
already has configuration limiting the size of the log files and it has
a rotate functionality; the amount of space (and erase cycles) used by it
is probably low.

--=20
Patrick Williams

--ANPnTx+oFtZonJQS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZXH6sACgkQqwNHzC0A
wRk86A/+NcdxbVma7r3GLAsD+OzgjTgytV1hvprWQFAgv7QiWEdyl874OQcXzpDa
OC6/FXGTP2wXyQD4FwfaviG7pxhjdelNXFXVHSwDF+ohH4BzGGA6FjTqiNc5Wmf0
nWcELetG3tfQREi5bQulog/SR/jMMVRluKv9oc5o4tQJ5HAi3F1WxSWrwTGV+83X
czYjfYmjIkTiX1htUWgb7BjMp/uAElBzGLwEwInNsKqs2R/BUsCc33SCt4SU2YAA
I2hmSY3XY87zCi58QsNwiIaQviqCqHguNxEDZ/soBztyTOFfWi/JTEdZvrzVdb6C
0k6ov/Z3ZjAsebnJZOa1fIFZ5qC5ZDbA0KR20mMtCbzbUUB/gQ6Dk3X2V9fjywZS
CUqBwmrqn1QkBVBtlNXAp82bh06hSxG6J/QhEqqV9AytVt1QlaniKZkUT0QS6NO/
xEpSuypMjWy4OVo6Vp40HPvmM0yF/RAXBUkvfVWZk2LHYvXw9ydTN16+sH7GdZZI
TflTqh6jYZW+Ly+LhYtB3h+4/V0Gi0C5HneJCdI+coNyjCuaul7Wz5rsmjKDgpFe
unfPmuv9+yqnCHOyc4UkPiHmFnzalmNVjlRx5Wdja3/95u8871nWivYDJZlzR1RQ
PEap/0Z73khYls1T6qC7QzpIAmAA8CMIs8VpvVjykB8r2wW+FUA=
=tu47
-----END PGP SIGNATURE-----

--ANPnTx+oFtZonJQS--
