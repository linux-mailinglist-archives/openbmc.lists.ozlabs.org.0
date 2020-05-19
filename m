Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BCB1D8D2E
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 03:38:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qz6S131pzDqkw
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 11:38:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ZeOdKLTw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Kqd8QoTd; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qz5Y4x2GzDqjg
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 11:37:20 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A91845C016A
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 21:37:17 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 18 May 2020 21:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=2aojVqGuorsXLR3cxQsI8/UI+1ih5Ry
 O8TCO1uuV08A=; b=ZeOdKLTwLFQAgokD/o2J5a4neS3IkCbWFlGACG5fAL9UieH
 ksarkcbWq3YXKEoapHjUDs4QaCLhD2SAt3r80p80qAfEwl8+6aDIb95IVz76HOiL
 S39fx81gnwLHpunt5qToWUZF7Q/Cs6TYeBSedBOFjfeymKs8jQoL7mvXWLVq1h7l
 M1NmaDZlXUZIXoCHQ3Wer3lKYnQ5xM5EkghWXxK3cVZzrAQRbMnEVq4dmRIskA6J
 RYCCYQrVycRlfdGjptditPw8Fz+Etcvt7m9z/PFtHRbnfUj9mdK+s+8gly6OQHYO
 gHExIr22M5zk//7ALYhLp/iSsb3DL6J5guDUh4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2aojVq
 GuorsXLR3cxQsI8/UI+1ih5RyO8TCO1uuV08A=; b=Kqd8QoTdAuTkJWgbbPf4fd
 tO+bRjAHzat0fHKnkqhvmyqhSI6Z9VowNv6qA6wQWkxE3CfQtidZPK5f12q4a2vk
 Fddx86QFkMoBXz+0IgXEqS+7zYv/8bI/kiMkjF2NhgIC/kT+K5DuSp6WCQeg2dAe
 Wuv3Ds8JlAqFPNJTC/CuMKodk3vSSvZZ52noGrcBGjef5WYTOeJXT2Gjie8i8tkP
 XIVPwcujsirrM8gQA+Ka/jlRug8yQ1A+8rICtYFvTX5285HCBz68TyFKTwoDaR3/
 AShSbobY3sSgeOdWAkK4E6T+6D7MU7KpfRR+I7CGHD1QZ/iDwhCh+Z7wJsS5J3lQ
 ==
X-ME-Sender: <xms:TTjDXs3tbxyYr_xZjmsiLVKCooxJZ2y5kRVAJCgyDCgMJKL-8yv2AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtiedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpefofg
 ggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughrvgifucflvghf
 fhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpe
 egheehiefggffgkeethfegfeefueegtdegfeelkeevkeelvedvjeehtddtjeegueenucff
 ohhmrghinhepghhithhhuhgsrdgtohhmpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighi
 iinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghn
 ughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:TTjDXnGKQPKYl2TTvbUHLtki26-SMa_MVYK46Osb4Q1Mcrv2vhx9VA>
 <xmx:TTjDXk7QaLfBVnhCjKw02Ckw2iFRA2d8Gh-ERVcsndP0ui4wmaEi1A>
 <xmx:TTjDXl0xkjORkssSBLK3ueHAhIY7-ZtsYo_9-FKKQ1FUKJwIBJxXyw>
 <xmx:TTjDXvF0L28ohHWLIWAz8_Q3lq2Yndq8ZY6anQgYtXchc6BleUNIOA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1CDBEE00F8; Mon, 18 May 2020 21:37:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-464-g810d66a-fmstable-20200518v1
Mime-Version: 1.0
Message-Id: <3d6db63b-f670-4e01-94c3-425f93d89708@www.fastmail.com>
In-Reply-To: <20200514135723.GE1166713@heinlein>
References: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
 <20200514135723.GE1166713@heinlein>
Date: Tue, 19 May 2020 11:06:43 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: An IPMI Request Visualization Tool
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 14 May 2020, at 23:27, Patrick Williams wrote:
> On Wed, May 13, 2020 at 03:38:47PM -0700, Sui Chen wrote:
> > We're working on a GUI tool that allows the user to capture and visualize
> > BMC IPMI requests.
> > 
> > The tool accepts 2 kinds of inputs:
> >  1) Load a DBus traffic dump file generated by dbus-monitor on the BMC
> >  2) Capture IPMI requests on the BMC -- the tool connects to the BMC
> > console by launching a program of the the user's choice (example: ssh or
> > telnet), then starts "dbus-monitor" on the BMC and checks its outputs for DBus
> > calls on the IPMI daemon and then draws the IPMI requests on the canvas
> > accordingly.
>  
> > A screenshot is attached to illustrate what it does:
> > [image: scrnshot_compressed.png]
> 
> Neat.  I wonder if we can use this to analyse dbus messages with high
> amounts of latency (especially once that are infrequently latent) in
> order to better target which processes we should move towards async
> calls.

For what it's worth I have a script for parsing D-Bus pcaps:

https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts/dbus-pcap

It's helped me tracked down unexpected latencies and other weird
behaviours in the past.

I've just pushed a change adding a README to introduce the capabilities
and provide examples of usage and output:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/32583

Cheers,

Andrew
