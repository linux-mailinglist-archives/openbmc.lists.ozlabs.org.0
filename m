Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B170C85729
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 02:11:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463pgS3cxpzDqxV
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 10:11:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UDkYMtZQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="vEfYW+kI"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463pfb4j9jzDqvy
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 10:10:14 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B392722053;
 Wed,  7 Aug 2019 20:10:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 07 Aug 2019 20:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=xQzph
 JAoOC95FJzE/fa2UhMD1LNYBbG5cFOhUsQLjgA=; b=UDkYMtZQdHQLRI5qjmLav
 RtIL5X5/83uZQIyacpiChqpMcAVJvGX44wRFAS+YOSuL12ec0jB0rh9RpgzHoeyC
 xZ88q0Ti5azQ3aH2VF+Gj2hDg3+XZ3Xo+6QvomYaiSXXbfhdD/AoUeskJWl/x0PT
 7OVk8e/aHmyjurM9KP6S8lyOyt1NgmKGlOQibobi8xIgzfXN/kf6tr1YuRpI+PwF
 /RWzoye/2pyJ0XE+Upn20ahQZHdjH1kXi9kGBMMTLXu01mpv1szu+wifwAmATSGx
 1Cv/1+QzzYyThbu6r1uXdvAaDWMAyylcjdEYZoV0WC12ykkVsuPiUFR4tY33VWXr
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=xQzphJAoOC95FJzE/fa2UhMD1LNYBbG5cFOhUsQLj
 gA=; b=vEfYW+kIsqjR921bv8hsyi04E2kDH7qFgJ81MaGNRNczL5XN+lAOk2pCk
 7poE2uv7tZMhnMtWVkersSXV9vNcQByiqQGY11Y2k+Xe38lqwHmkiks0mmlFcsP4
 F5UQ3L3NMUSXSCJzCoMB/IOx1/XsPJ2lei4GmnCOv/0xfBQ2IFxhUwmdoWjExhnN
 KrjJYrfD14XDtwJo7pYd5xXhNwCQEV6DzMbwT2mtPLvZazXnXNVBqH27FjtCqCDJ
 m3o0GULt0pJSZC3tlfL5IZwQ+2qYjhZB/jaFXvNFpqJ1cdqFUfQKh5XcjLIxl9wk
 +XeB0rtppUwlZZAdULKOI18glFPKg==
X-ME-Sender: <xms:YWhLXZAUfb37tOFzShWjsp5vZP3HPo4m-jbvBjQffV4pp0C1xVHvvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddugedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmpdhophgvnhgsmhgtrdhorhhgpdgslhhithhhvghr
 shhpohhtrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrd
 hiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:YWhLXX_o5_5d-5B1Ci6tdT1X1_7P-FtjQwgoIvUWXrlGGegn3fLS-w>
 <xmx:YWhLXaBbci__6oqilF_PXaigTABjTx-aiiJueQxcrZe_gCIT2Gg_Kg>
 <xmx:YWhLXRsauz_HtSe4I-SeYMnEOSv0ff6eEeEkHtgKYl0evRYAfUHvMg>
 <xmx:YmhLXXTn0ZJhGqtWjxU2vKBeLw1q5ONuZgams8oikTmKsDwEv-Sr2g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CF041E00A2; Wed,  7 Aug 2019 20:10:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-808-g930a1a1-fmstable-20190805v2
Mime-Version: 1.0
Message-Id: <396fed2a-f2d6-42ea-855b-4a36d4b38868@www.fastmail.com>
In-Reply-To: <932AC0A3-C535-4C66-B28B-350ECABBDA5E@fb.com>
References: <932AC0A3-C535-4C66-B28B-350ECABBDA5E@fb.com>
Date: Thu, 08 Aug 2019 09:40:35 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Wilfred Smith" <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Unit Tests, Documentation and Mocks (oh my!)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wilfred,

On Thu, 8 Aug 2019, at 05:16, Wilfred Smith wrote:
> Please pardon my ignorance, but I=E2=80=99ve searched and come up empt=
y-handed.=20
> A URL would be greatly appreciated.
>=20
> Where are the unit tests,

Unit tests sit in the application repositories alongside the code. OpenB=
MC
has historically been poor on unit testing, though this is improving.

We do also have an integration test suite:

https://github.com/openbmc/openbmc-test-automation

> the interface documentation (particularly for=20
> the driver and D-Bus components)

DBus code is auto-generated by sdbusplus[1] from interface descriptions =
in
e.g. [2]. The intent is that the interface definition and its documentat=
ion live
together there.

[1] https://github.com/openbmc/sdbusplus
[2] https://github.com/openbmc/phosphor-dbus-interfaces

> and the mock classes for verifying=20
> that stuff works as expected?
>=20
> Also, should I presume that this code base is not intended to support=20=

> multi-core BMC=E2=80=99s (e.g. Pilot4).

Where is this question coming from? Multi-core support is largely a matt=
er
for u-boot and the early stages of the kernel, nothing above those two
components cares how many cores we have (save for resource exhaustion).

>=20
> I=E2=80=99m sure Ed or Andrew will respond with =E2=80=9CYou doofus, i=
t=E2=80=99s all at =20
> unit-test.openbmc.org and we have a dashboard for our code quality=20
> metrics on blitherspot.com=E2=80=9D in 3=E2=80=A62=E2=80=A61=E2=80=A6

It would be ideal if we had some dashboards, but we don't currently (at
least as far as I'm aware). It would be great if someone could work on i=
t :)

Hope that helps,

Andrew
