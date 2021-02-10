Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B8316651
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 13:15:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbJcV2WF9zDvXp
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 23:15:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=tGcE4xjB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=PFAYbxjz; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbJXY6BTczDsk6
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 23:11:56 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BAC585C009B;
 Wed, 10 Feb 2021 07:11:51 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 10 Feb 2021 07:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=gzvE8
 LC2qPewFJt+nmmijzIzWU8fj7Wku984BOMLjdw=; b=tGcE4xjBORukLXnqi604i
 5iMwn3uPscNgmQhKTBTNb4fe1fGbP3WezV3nO967lVjRaN+bTf+1zl85u0MO6/yI
 VmLb1sCANqOMnYPKXh2BdJT5Qwj+KiEHN1UV6DYXHxA7LriGxSrW3BWBN+hYBUt9
 dcfEVIHYJMW8M2ldWqzDRHMoK8aaHgDlpDk9Hprm8OJVX6n9aYKLLHcI2RsSWMEY
 yv6iYxWzhhth/j0QRVWJh8c3mZ2GVryMkdKdpXEviMUFK30A53pc3LYDK1I/O0r+
 EGp7uD3a3unE1g//CYxdS5JzOCeztO5AlJ794hVHhUIk65ox+8HoopaMSqQdtjgT
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=gzvE8LC2qPewFJt+nmmijzIzWU8fj7Wku984BOMLj
 dw=; b=PFAYbxjzf9Bj8StuHLVKGkWOtNeYxBGxxJb2uKjKsQjuFMhVuIReAS4Iz
 h5gHNW5K7LL/JR9gLVhSBFYbXVMH2e3Q8fHsLcQdmu0mIGoiozQZ8WssSjjP6Gy5
 2UjtxvuKt4QnZ5MyD80QFvQsAqnw3JLjILAJSf/Axc3ZtLSJHi6u/XjKyVLo3Blx
 RtxR0gzIgFSZl7kKyp7vqAp/A+eb+GWDoSRi2hra3EvCxJPvrj5kwRKZYfu8Nd3C
 6qtfdAajwKOKFumpCv8A+PWUyhQb2cf9lQ//mEpNWD+nBAhwzPrNDlbxgfnhXJvX
 Pe3+HLNfN3A257yOFi1lzdyiyqy3g==
X-ME-Sender: <xms:hs0jYGRYC6pbJfquWiVa4Kck036Ew-vpZu9FYtR5UVTSrVdiJUmsQg>
 <xme:hs0jYLyWZBR6N2t3wwhDyMfYSJbaHzX0P7Ses0IvwhNg1gtpnL4hFKMBt1BAv7PUC
 tjzJ6yne_E4TMCq9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnheptdeuvedvueettdfhtddthfefudeifeeijeeuheffteeuheevkedvhfev
 teejjeefnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:hs0jYD1u8QLaomgKE2XoH6jwCujvMJ5l38ogPBG3HyzXcGxs_rqGWg>
 <xmx:hs0jYCAq9vTGNHmDf7t8aVSEqTkVzsyKL_VP8i8E7WE8Oc4xbl6lQA>
 <xmx:hs0jYPhzbEgCooE6lz5uaf9L7YBIBaSEU2hpdD1IoGlqDYs2CTfU5A>
 <xmx:h80jYPI1tU5VPIbuPzjPZkaOTjTX9jZGDY_iM9HdPsvofM9XYLRXTg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8C04CA0005E; Wed, 10 Feb 2021 07:11:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <f9f26747-a3cf-4613-a9ec-f94e5f044663@beta.fastmail.com>
In-Reply-To: <d531c46e-033f-6cd3-83e2-d331d87c7310@linux.intel.com>
References: <8fc3b7be-42bc-fc28-6bbd-c5d8de95feaf@linux.intel.com>
 <CAH2-KxDCorEjGSneVsSDWx7AXFvQZ8fJ1zaqf1zOJfndbW9eNA@mail.gmail.com>
 <d531c46e-033f-6cd3-83e2-d331d87c7310@linux.intel.com>
Date: Wed, 10 Feb 2021 22:41:29 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>,
 "Ed Tanous" <edtanous@google.com>
Subject: Re: ObjectMapper - quantity limitations?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Wed, 10 Feb 2021, at 02:06, Ambrozewicz, Adrian wrote:
> W dniu 1/27/2021 o=C2=A018:14, Ed Tanous pisze:
> > On Wed, Jan 27, 2021 at 9:04 AM Ambrozewicz, Adrian
> > <adrian.ambrozewicz@linux.intel.com> wrote:
> >>
> >> Hello,
> >>
> >> I'm doing some performance measurements of OpenBMC telemetry subsys=
tem.
> >> I'm using my custom app, which spawns valid D-Bus Sensors, I config=
ure
> >> TelemetryService to monitor them and EventService to push MetricRep=
orts
> >> to external server.
> >=20
> > Which sensor code are you using?
> >=20
> My homebrew app, which I run like so fake-sensors -c=20
> "/xyz/openbmc_project/inventory/system/board/AC_Baseboard" --loglevel =
1=20
> --sensors {sensors_cnt} --interval {interval_ms} :)
> It's just for tests.
>=20
> >>
> >> I observe certain limitation on my system. Each sensor is mapped as=
 two
> >> objects in ObjectMapper hierarchy. It seems that I am able to corre=
ctly
> >> create up to 1500 sensors. When I go above this limit part of the
> >> sensors are not represented in ObjectMapper tree.
> >=20
> > When I wrote it originally, there were no arbitrary limits on how ma=
ny
> > objects the mapper could cache or return, but considering how big yo=
ur
> > responses will be, I'm guessing you're hitting the dbus per-message
> > limit.  You don't mention if you're seeing any errors in the
> > journalctl log from either the broker or object manager.  That might=

> > give you more clues.
> >=20
>=20
> I've come back to the topic and I observe two kind of behaviors:
> - mapperx crash (pretty rare)
> - error "Error getting associations from ...".
>=20
> The former still requires debugging, but for the latter I have simple=20=

> explanation - only one application spawns thousands of sensors and is=20=

> bombarding ObjectMapper with InterfaceAdded signals, while receiving=20=

> 'Get' on Associations interface (and possibly other calls). I've=20
> introduced a workaround - up to 3 retries of do_associations() on=20
> ETIMEDOUT, which allowed mapperx to correctly consume 2000 sensors.
>=20
> However, performance could be better. On AST2600 listing of 2000 senso=
rs=20
> by ObjectMapper takes 130s, 60s for 1000. Furthermore - it's just loca=
l=20
> workaround for bigger problem - D-Bus scalability in embedded system.
>=20
> It looks like sooner or later we need to figure out more lightweight I=
PC=20
> for telemetry.

I posted a bit about this on another performance-related thread[1]: I've=
 put together a process-shared-memory shared library that could make the=
se exchanges quite light-weight with less of the usual awkwardness of sh=
ared memory. It's still young and needs further work, but might be inter=
esting all the same:

https://github.com/amboar/shmapper#libshmap

[1] https://lore.kernel.org/openbmc/09f8bed7-e19e-4ce9-850f-ae870ae89937=
@www.fastmail.com/

Andrew
