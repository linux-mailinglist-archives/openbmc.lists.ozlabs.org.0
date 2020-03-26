Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5241936E5
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 04:26:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nr4d4wpgzDqZm
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 14:26:41 +1100 (AEDT)
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
 header.s=fm2 header.b=yYnEjH1I; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=zYhRkFlF; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nr344x3YzDqYS
 for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2020 14:25:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 26443426;
 Wed, 25 Mar 2020 23:25:15 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 25 Mar 2020 23:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=FFN3M
 3jdw/C2Nv3DquawG1jslxGmnNK4C56sPRsQWZQ=; b=yYnEjH1I6S3Uz8k6nWYvg
 eU1N5MD2lkeAeH6Gi9yuXwzhG/gwmAz0W5MNUETlPoUzqMUMHtCwXz8Yd9Ju0d1s
 5XxwxsbVLII32RbtCfTBWEK+K7mEX/GK53PRBiKca6QG4Pk+4IehqNd4ExSl0e+t
 xVCIoxjn3ctSe3jxmNIYEsalybeRCnb/n6qnidkZ/tf5Zm4gWF17ZF5vhF3hXpoy
 ay0b0EAFrve0CixtPA6v3Oqyn6SQbMgmxtwx8saOQJp+iCWClKx+o8ugg7f+sgMP
 qK8uM0oQ3viBbRp2IibCIH8nrZB+oWaBYHPQJ4Bmt2+HJXHFUHnF2LXFJ1sH0D0+
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=FFN3M3jdw/C2Nv3DquawG1jslxGmnNK4C56sPRsQW
 ZQ=; b=zYhRkFlFBwxN3lEodmfXQA+S4vUh+sV34IM7CHOfgOkM63/97+32t5lKr
 sJseqwc654AIupHEovxUtTjEps1wuvRkj9TU6PmVwO37cOPGPU845Ur/G7Xe948t
 J5Q6gA/Z/GWsH8wytnSwLDStapKYbdJw1pibNgSnqOZ2R2zEbHQkhOqEI64dAgo0
 rk7BM8+2fsJO8H12xN/UtaFD2OmEEjHvPtjA3xhm4escpva8sEfQqQcbnf/1LX/c
 yvPEg6rKqBxdHuDimYsiz8wuVEwaXeT0uiTO1oOpKvDlM2WOoCWjI6VJjKbPBINK
 VPpoYX2f2GTJDbZnFxk00CO3bw5oQ==
X-ME-Sender: <xms:miB8Xk-GZ36CFDu3G0OpQdKlkemYl6Gaz2q2_1THydXdq41PHj7eGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehhedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfies
 rghjrdhiugdrrghu
X-ME-Proxy: <xmx:miB8Xh89cN50leChYHkusxJRLV-KzstBtKkRaPp1t5k0_1JHSjWEVg>
 <xmx:miB8XsovlOvwXz6hnZ_N73g794FFFHebl4qRV6HLpfg_SAGvnT_eog>
 <xmx:miB8XkLxBm1pw6F2p18HZpKJjfObc1-J-_pgfLAmO7_xosFr8IzuxQ>
 <xmx:miB8XjAPubBCOfkdpkqktPvCP7si4lQ2KCavCaGWDap2_FQuG83ueQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 27F15E00BA; Wed, 25 Mar 2020 23:25:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1021-g152deaf-fmstable-20200319v1
Mime-Version: 1.0
Message-Id: <14202a31-3668-414d-a5b5-09542504087e@www.fastmail.com>
In-Reply-To: <073c959d-d554-4cc8-21f4-c94777a42313@linux.intel.com>
References: <073c959d-d554-4cc8-21f4-c94777a42313@linux.intel.com>
Date: Thu, 26 Mar 2020 13:55:23 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Wiktor_Go=C5=82gowski?= <wiktor.golgowski@linux.intel.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: MCTP control messages handling in libmctp
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
Cc: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Just reply as a note to say this is resolved.

On Sat, 21 Mar 2020, at 04:51, Wiktor Go=C5=82gowski wrote:
> Hi all,=20
>=20
>=20
>=20
> I am currently working on a base implementation for handling control
>=20
> command requests in libmctp (relevant change here: [1]).  As I am not
>=20
> sure which solution would be the best here, I would like to put a
>=20
> quick summary of the different approaches that could be used for
>=20
> further discussion on Monday PMCI WG meeting:
>=20
>=20
>=20
> 1. External handling (as Andrew proposes)
>=20
> All control messages are handled in the layer calling into
>=20
> libmctp. The daemon is in control of how messages are handled.

After further thought the approach I was suggesting isn't viable,
mainly due to transport-specific commands. It would require violating
abstractions or abusing the routing table to push the messages back
down the stack (the latter being racy).

>=20
>=20
>=20
> 2. Separate handlers (what [1] introduces)
>=20
> There are separate callbacks for regular messages, control messages an=
d
>=20
> transport-specific control messages. The main reason for this behavior=

>=20
> is that I expect transport-specific commands to be executed in the
>=20
> context of the specific binding (serial, VDM, SMBus). I also hope that=

>=20
> the daemon could be at least partially binding-agnostic.

This is the route we'll go. It's optional to install a control message h=
andler
into the context, so a daemon could receive all control messages by defa=
ult
by just doing nothing.

>=20
>=20
>=20
> 3. Handling is split between the caller and the library
>=20
> We could identify control command requests that libmctp (or its
>=20
> specific binding) is able to fulfill independently from the daemon
>=20
> (for example Get EID) and leave the implementation of the rest to the
>=20
> actual caller.

We can achieve this with the suggestion in 2. if the installed callback
is structured correctly.

Thanks for posting the summary Wiktor.

Andrew
