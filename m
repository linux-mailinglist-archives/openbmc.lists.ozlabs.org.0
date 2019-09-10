Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3951AF37D
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 01:56:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Shkx3KQbzF1SZ
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 09:56:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QTopEIOa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ej9oJHII"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Shk74NqMzDrdY
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 09:55:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 875727A8;
 Tue, 10 Sep 2019 19:55:38 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 10 Sep 2019 19:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=xLmtw61tq4sQfqpEbEy7kZkUjAHfP5P
 MYqBu621BxMk=; b=QTopEIOa4o/61z5WnleANCW05e2/KOua4vxcVn0Qgj2f7x3
 g7NlUmh66JGYtveqg1CqCGUpy6Ojzn98pruBfRTQFQV4EgQKYXf44CjdHJxwFgF2
 G8u+Fsu+57erVGkesgG+6azAW5A28qHevhAWruc97uXkkwTZeZyduXFtl7MOvI2b
 PJ8S/6sFWuiLxiUqEZ4u1nqFPGnz/1i1873p+FV14hHQSLmqqIDPceptwUyfMV1z
 2ADuaQuJyfrVtnqmxedy8kuaVASOn0ILb/71pePHbtOCPBswec7gQsDV066p0awE
 gPagcYqJj7v4UxSPVKdqFuT7UQXOVEb9SAe07hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xLmtw6
 1tq4sQfqpEbEy7kZkUjAHfP5PMYqBu621BxMk=; b=Ej9oJHIISNruRj2bobAVxQ
 FNhliKmIQDIMHShxt9owns0zObVBCTri6IZ+BCgW3kmcNXfzDb03ND1iWGg77Zo7
 Ah5EqopghwiFgdkt0BDQbtZtX0uOvKQFL9vXf93gPJrajr1A3FtTESR6pWD1i0bt
 VD9sUigKOqQyolMPFu/woejrUjUY0s/JMUpyOJwykvxpKP5xrBB5RE6BdNchHbff
 qxDEEtTxGb138xGO0dA2xsE8JpL+U0n7yVWgssXEwYgLjcnkPgvgkiiXiuDIDqhW
 VqHMPbjKY419cqX/+32V3nGHfMc21O11xD7cyzTHgxJqsOwIqA6eViVnukIKmGow
 ==
X-ME-Sender: <xms:-Td4XW5ySFsFWDoXig8RClhf6M7_6bPwBA99z6_Ka6APVZRaflgOuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtddugddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:-Td4XVrVWwkdy0wOmnFGaciTDaE6kAXfYS86mI4Trm-oAD2F8qsOUQ>
 <xmx:-Td4XTgCxBTfLOOtUspy0rykZuwLk_0m9WetZtKzFR2pOQsNanVB7g>
 <xmx:-Td4XdsoJ5ZwZV-xd5PIpPMgzIEksxTjzzr6aFd49K47fUES7P3eEw>
 <xmx:-jd4XatWNOe-8vSR-ymOOPlg0n3Lzf2ILs3CGh8l4ZJko5jQfJ_cDQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 020D1E00B0; Tue, 10 Sep 2019 19:55:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-189-g37dc846-fmstable-20190910v1
Mime-Version: 1.0
Message-Id: <546dbbbd-b38f-47cd-8e56-3f82ce383efb@www.fastmail.com>
In-Reply-To: <OF296529E4.5B358202-ON00258471.007740E2-00258471.00779A97@notes.na.collabserv.com>
References: <69859184.bebd.16d1b45f5b3.Coremail.ouyangxuan10@163.com>
 <OF296529E4.5B358202-ON00258471.007740E2-00258471.00779A97@notes.na.collabserv.com>
Date: Wed, 11 Sep 2019 09:26:09 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Milton Miller II" <miltonm@us.ibm.com>, www <ouyangxuan10@163.com>
Subject: Re: how to use spi flash BIOS/Host firmware??
Content-Type: text/plain
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



On Wed, 11 Sep 2019, at 07:16, Milton Miller II wrote:
> On September 10, 2019, Byron <ouyangxuan10@163.com> wrote:
> 
> >Dear all,
> >
> >    I want to ask a question about how to spi driver flash host/bios
> >firmware? I don't want use mtd mode flash it, because the mtd mode
> >need read spi-id when BMC load spi driver, may be it is risky, it
> >need switch the  system spi to BMC when the host running, It may
> >break host startup. Do we have other solutions to solve this problem?
> >
> 
> Indeed, we did have some initial hand-off issues especially as the 
> Linux kernel spi nor layer matured.  Over time the assumptions that 
> the bios had that the chip would be set to 4-byte addressing by 
> default were not met by the kernel driver which switched to using 
> 4-byte specific read and write commands.
> 
> You probably have a few options:
> 
> If you host is read-only, you can allocate a block of dram 
> and point the lpc window to the dram.  The aspeed lpc 
> controller drivers has ioctl calls for this.
> 
> If you host is directly connected to the chip and you are 
> using the spi mode mux, then you would need to handshake 
> with your bios.
> 
> If your host is using lpc to the aspeed chip and programming 
> the controller directly, you probably have given full overtake 
> of your bmc to the host.

This is the case for ASPEED BMCs, so be conscious of threat models.

> 
> In Openpower systems, we have implemented a protocol to map 
> sections of the SPI rom into memory, and use IPMI messages 
> to page in and out windows from this access window in memory 
> to the backing SPI chip. We also have a method.

That sentence looks incomplete :)

Anyway, yes, in OpenPOWER platform designs the BMC owns the flash
and we provide an abstract means for the host to access flash data such
that the BMC always remains in control. If you have questions on what
we've done there, don't hesitate to ask me.

Any other mechanisms will require an explicit handshake as Milton
mentions and there may be some corner cases in the event of ungraceful
shutdowns of the host.

Andrew
