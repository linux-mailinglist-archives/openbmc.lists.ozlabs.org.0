Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D0119EB1F
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 14:11:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wCFv1G6XzDqbC
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 22:11:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ontMfYGO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=N2NutX0r; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wCDv2VtszDqcx
 for <openbmc@lists.ozlabs.org>; Sun,  5 Apr 2020 22:10:53 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C90248B2;
 Sun,  5 Apr 2020 08:10:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 05 Apr 2020 08:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=xbvHg
 Js5DKova4I2uISIuzkAxJ4+e06pk8TYTAyOjG0=; b=ontMfYGO+Gcp9AwR2NkoK
 +/eWCxsmJFAGAmSruLCgsgIsqjR/N8ouqdIFEe6QkK3d0p3rm//erXVt2xMcWBlP
 iK8W9KvpdBoUA15DlhNRVRo4NaOZRWGByRxPrmHO6dVsShDl/PfA0P5csb/+n3OI
 m3wSw8nbNpRnc33WicY0wB1OzwgrZ5R0ZpPlXgAX/fNXtrHLWlIGAaAweVJfUKtA
 14HgK5X5qn2I9KgQBjDqxMnj8efkMY3WaYusRJht02aY4OA2ylX0j5NoQKrMy75b
 /LYEZyETHcfqap9aqnfXvYuJwOMuS6ZjMVrXfv/7GER/Gm9kWNtr2+PPUc9p9PVn
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=xbvHgJs5DKova4I2uISIuzkAxJ4+e06pk8TYTAyOj
 G0=; b=N2NutX0ryFZSKR5d0Df9Vy9Dsf7hmTwB2ErA4JxyAf4EvZtuj7iWyz0yq
 jNK9JgxDhW6CYtJhJoTXZS82s+KQEOsFtdlRz7mVGnkfVvHoyjSWTnbYSEggwDf/
 /VkaKvFiq/cvJ0M7YiktLGFxYQmw3DfZDFiUbH7q/Jtbc0RYGu0h1Y1ODkYaVLWJ
 sihXqi3P/cUcPECKp3Riku+hZbqJg5sIRjKJEtNVYEQilMJt6heZXsdFa/UfZR8P
 W5bdsU8SYYYFHfNjNe/wfjlS3s8G5iYvA2d4Xsu4fW416Zh5bGmyxu0SP10HLOWP
 hTXOL/ZRlNrwVMJcrDlk8uMPpjreQ==
X-ME-Sender: <xms:yMqJXiu-qosUccMojvWK0YD1xaes46MCj8GtrQ1HGc8v0e8ppPnnXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddugdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:yMqJXg3ml0mjkTzesD01ahzW8KwRJXluXrp9qsKlLm3NT_HoXV00mQ>
 <xmx:yMqJXmTfV_jI90NN0L3PLK9zariYPE7IsaPjqx-ZAtRfhx6Es-iKXw>
 <xmx:yMqJXstzhpTBm4P6K038Y3v_9Jn5AB4h-kUlRwN1KbcjaTGEVLFmCg>
 <xmx:ycqJXgjwVAABLKt8nsXqlHIKzNDtUjLw38gTkIUqES2CKLJWXK-J6A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 998BEE00B1; Sun,  5 Apr 2020 08:10:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1082-g13d7805-fmstable-20200403v1
Mime-Version: 1.0
Message-Id: <451f5f0e-a1ba-4016-b044-e55b966f64ea@www.fastmail.com>
In-Reply-To: <73161AF5-F6B6-40C6-AE70-5FCF5A530B82@fb.com>
References: <73161AF5-F6B6-40C6-AE70-5FCF5A530B82@fb.com>
Date: Sun, 05 Apr 2020 21:40:57 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: objc console new design
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



On Sat, 4 Apr 2020, at 08:09, Vijay Khemka wrote:
> =20
> Hi Andrew,
>=20
> How is server launched as per new design code. With latest update,=20
> console server is not launching in our platform. I saw config option=20=

> =E2=80=9COBMC_CONSOLE_HOST_TTY ?=3D "ttyVUART0" =E2=80=9C has been rem=
oved from bb file=20
> and also there is no triggering point in obmc-console-ssh socket and=20=

> service like earlier Wants=3Dobmc-console@{OBMC_CONSOLE_HOST_TTY}.serv=
ice=20
> <mailto:Wants=3Dobmc-console@%7bOBMC_CONSOLE_HOST_TTY%7d.service>.
>=20
>=20
> I see udev rules added in latest patch for launching server which need=
s=20
> config definition of udev, do we need this for launching, please advis=
e.

Yes, obmc-console now ships a udev rules file that launches obmc-console=
-server
via an `ENV{SYSTEMD_WANTS}` directive:

https://github.com/openbmc/obmc-console/commit/fdf1a7102f800711daadfc389=
5fc8feeffa73c0e#diff-416dba8b88aad2291d9c314cfa7a75f1

I saw on IRC you need to launch obmc-console-server for UARTs other than=
 the
VUARTS - please send a patch to the rules file in obmc-console adding th=
e
UARTs you need. As noted in the commit message systemd will only attempt=

to start obmc-console-server for the UARTs that have configuration files=
 installed
on the system, so we can in theory support adding rules for each UART wi=
thout
negative effects.

Hope that helps,

Andrew
