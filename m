Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945844FC97
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 01:36:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hsqxy0TjSz2xvs
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 11:36:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=naSStiP/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=EvxFmVa4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=naSStiP/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=EvxFmVa4; 
 dkim-atps=neutral
X-Greylist: delayed 524 seconds by postgrey-1.36 at boromir;
 Mon, 15 Nov 2021 11:36:08 AEDT
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HsqxN65XZz2xD3;
 Mon, 15 Nov 2021 11:36:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 584C42B0124F;
 Sun, 14 Nov 2021 19:27:19 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Sun, 14 Nov 2021 19:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=mkjJ4Y/pteRNeSPhoh6wdSUlB0Vt8cF
 uTD9VcATUOEs=; b=naSStiP/3c2eGHVTWTXAvdPaFC55Ueu//Ntac+HOsU5xGn7
 El9G3ESUPI777by+gnfb8fecgcmUTOOchltcJElbL1din5HFGDl+RVVMuBby13FJ
 dtkx6ARt2bGaGNsIa/YQl+nxxiRTC9sA5QCdYOBjdb4xon8YektHed7ujFrEqk6B
 kwlgSvAX5U6yvjVw+UYEI5ylsuKVKqSleWP1CyZFPVFBLKANGMvDm6UJzW9pEWYp
 iGvv2iM8YlgUIoLu51kuYyiiLv3ZvakyrvOs/BxWctSHL+YxZsCU6zVuPctdDlmt
 rNMRI7/khFwInWIL4JbCv/DTJvHJQ7jlveIGoFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mkjJ4Y
 /pteRNeSPhoh6wdSUlB0Vt8cFuTD9VcATUOEs=; b=EvxFmVa4SJYIdwcnZlg9dw
 RP0/MfGG0yRCJvFZ0TKe8F+9oIwpnLyJBA0+ruSooXxCM9UY7KOaBR0SRF2A+gtX
 aHuhcAvb5kCe5eSI5aoCHopOs5r3E5fSxnJD/P4qK09+d6en86fsir/yNWhoQ1mg
 /f+AdBQlBmUb3L6vJtqVGSJubNwMUr3KBvHOEyZlcKiFN/cc0hd0einMaalxqDPO
 Xnmswu06Wg1xjOOaQLnE0tzqNwy6VO7lA3REQXIB6heOrkzL2z4DQwnLLUjBwG9C
 OP7SiUE3f2XUGfVLVQJevs1APm/Xe7tSPWGkRbDPeswiHBXLfEcgY+rTPRwo+tUA
 ==
X-ME-Sender: <xms:ZqmRYWDOSjvoQzZvep4vHsK9UG7Cqb52_ZTugtnlYmxA0mCdzsL3Kw>
 <xme:ZqmRYQg7ujw72pPXe0-BYE_PFJiH4Uu1DcIzMA56a677xgYJag-S0tfmwojLk7NZf
 L4t_YnLaPNS8jxjhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdekgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ZqmRYZmqFH9wEhnHlYt34MAhNsKiB4MtOqnZa_LShsYg6tKcouOh_Q>
 <xmx:ZqmRYUyFAeVrB2K48z1O19MVjnlrubpZ2mZFEqUo-IYAWgRd4YPkOw>
 <xmx:ZqmRYbTNu-VSVVor1wfjPuSAtVqh6eWpjA7Bf1pUmq0K7VpYz-mEuQ>
 <xmx:ZqmRYQI1QRL2kqX8CjJdDTJzAw5BLHiBzMrfAEN_Ryaeg5wJnjntSS-Ufng>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 00E63AC0DD1; Sun, 14 Nov 2021 19:27:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <65620ec1-94fb-48f7-a8f8-8e9f409b0fc8@www.fastmail.com>
In-Reply-To: <20211113002948.GE14774@packtop>
References: <20211112202931.2379145-1-anoo@linux.ibm.com>
 <20211113002948.GE14774@packtop>
Date: Mon, 15 Nov 2021 10:56:33 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zweiss@equinix.com>, "Adriana Kobylak" <anoo@linux.ibm.com>
Subject: Re: [PATCH] ARM: configs: aspeed: Add support for USB flash drives
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
Cc: George Liu <liuxiwei1013@gmail.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 13 Nov 2021, at 10:59, Zev Weiss wrote:
> On Fri, Nov 12, 2021 at 12:29:31PM PST, Adriana Kobylak wrote:
>>From: Adriana Kobylak <anoo@us.ibm.com>
>>
>>Add support to detect USB flash drives and create the /dev/sd* devices.
>>Also add support for vfat to support USB drives formatted as FAT32.
>>This support will be used to enable firmware updates via USB flash
>>drives where the firmware image is stored in the USB drive and it's
>>plugged into the BMC USB port.
>>
>
> Hmm, how common is it for BMCs to have a USB port?  Perhaps it's more so
> than I realize, but at least in my (admittedly somewhat limited)
> experience I've yet to encounter one that does, so I'm wondering how
> appropriate these options are for the aspeed-g5 defconfig if they might
> just end up as a bunch of code that's never executed on most BMCs.

The intent with the Aspeed defconfigs was to enable options that 
provide a broad coverage of features used by e.g. upstream OpenBMC 
systems. This aids kernel maintenance for OpenBMC. The platform 
configuration in OpenBMC should provide a kernel config that only 
enables options relevant to that specific platform. With this in mind I 
think it's fine that USB support is enabled in the defconfigs.

Andrew
