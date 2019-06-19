Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE14AF52
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 03:07:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T6Hy6NDzzDqVm
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 11:07:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cB7Gn5Vv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="V6tCTmVP"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T6HB6bCdzDqJB
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 11:07:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 55E8A223CE;
 Tue, 18 Jun 2019 21:07:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 18 Jun 2019 21:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=2Cx/sq5yWlE7+ampNjw6mJsHwx8YiA6
 jsFSI1WXCT0g=; b=cB7Gn5Vv9CxBmr81nQZRU5XuRtpQUhubCuvWyVTw08aF7T0
 MMx1Pc5h5XcU/08lXbAcKYMmA1IgJNR85Xh7kdaZlg3ZzJw1hnBEZtKSumxxZ91r
 4VNWEwE0AMaa2JWmp5Vc7QQXnbS+JrDkFwM4daosoI+76eA8Zhz336m0OJdJ2kfj
 l8WCguM77UUQDnHsOBwr/G72FoNiCFyJOXcEOurVxXR0udQLuAwiUbLWFQRMP/Zz
 5wmzsHclML7dB7XWuIuwgr6s1R4awrjQ9DY8Zhvj7KptSBizIxXkhTS4+ksfrrbV
 kvbkOwQJrCc5HR/SQ6dh98esKi80paVlBQUFJXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2Cx/sq
 5yWlE7+ampNjw6mJsHwx8YiA6jsFSI1WXCT0g=; b=V6tCTmVPYeMrt40YYhTLM4
 BZzjuFU+kLPpaPUIJJEvlotov19h1NrvI2eAAXgGyCefRZWgjJuyOQpT1fqz6yMS
 gmP7LielZW6Pxl0iwN2SbJmqOHO+VDv/fHB4JyeH+XV8hb0fua3HO4geyz5SlsGb
 QxkSdjeLv75kCIP2M0aJm0QF73l8zKDWl3LPHJZwGT04OhDIygl6lDJxc5uIhN4f
 56SkE/6dYmBUNoD4Sx/+gAPyWdO/Opz/kEMQ6HeVwsQdqjxAPKB3LOahKIryvP/P
 xSXtof61OLk4fqFoS8l72YHQLW7JxcfLK12um+K9ZJPvF6iVqajtXKA3psA54RmA
 ==
X-ME-Sender: <xms:s4oJXeCWPVMDs814_xoEJVqzvlqqj2kmp1LROpQWqtCCoNyNllIUQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddugdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:s4oJXbMGY8QbIcIva3rmzk--R1IMDjeyhGu7kWCufD6IDza7OdNIoQ>
 <xmx:s4oJXdaPVjC_jQZY1uLTu3lOJOa_mVusz_yT8fQVK62RBEtfZvHW0Q>
 <xmx:s4oJXTOOJNmqNJAosLoKUMrUQ_LWnT0rbHzgfCNRxpEQuAL3eEdFxA>
 <xmx:tIoJXcFEcx4qQcL-LcD0HOMEgFuAGZnhHWtqJvi-Sj-RmfGYarkcsA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7C54FE00A2; Tue, 18 Jun 2019 21:06:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-666-gb2312fa-fmstable-20190614v4
Mime-Version: 1.0
Message-Id: <9ad21e28-4b2c-4352-92b9-52ffa5c58351@www.fastmail.com>
In-Reply-To: <CADKL2t4Pv_kVOfrFoDdT_FHabQkB2id3CJnqXLrzJzjViYPnnA@mail.gmail.com>
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
 <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
 <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
 <CALLMt=om6w-0um4vBKoosxVHjL2egHd-Fs=0aT3zE6LJHXedyw@mail.gmail.com>
 <CACPK8XdZWGJ8d32N1D8Np2Ja8DOPZ4BqB9wJ4GyFOJ5PCmO5gg@mail.gmail.com>
 <CADKL2t7a41=uwFQaB8UyLOJUNm65rq4hgxCK1zdURCZ6reXZ0A@mail.gmail.com>
 <1fc9bc66-6bbc-4b13-9ebc-e8fc2b0d5129@www.fastmail.com>
 <CADKL2t4Pv_kVOfrFoDdT_FHabQkB2id3CJnqXLrzJzjViYPnnA@mail.gmail.com>
Date: Wed, 19 Jun 2019 10:36:50 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Benjamin Fair" <benjaminfair@google.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 19 Jun 2019, at 10:16, Benjamin Fair wrote:
> On Sun, Jun 16, 2019 at 8:30 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > > >
> > > >
> > > >
> > > > Once we get the u-boot issue sorted out, I propose the following changes:
> > > >
> > > >  - drop qemu from CI. 'qemu' is actually testing on a generic arm
> > > > machine. A few of us at IBM have a side project that has resulted in a
> > > > high quality Qemu support for the aspeed boards, so if you would like
> > > > to test in qemu I recommend grabbing palmetto or romulus and doing
> > > > that. So consider this dropping the generic qemu image and instead
> > > > focusing on the aspeed one.
> > >
> > > +1
> > >
> > > Many things are already broken on QEMU, including phosphor-ipmi-host.
> > > It's not a useful platform to test with.
> > >
> >
> > Is that a general statement about QEMU, or are you talking about the generic
> > qemu image as Joel was?
> 
> That's specifically an issue with the generic QEMU image. It's because
> the generic image doesn't include u-boot, which is a dependency of
> phosphor-ipmi-host (transitively through clear-once).
> 

I've hit that before, and it's not an intuitive problem. I'm all for ditching the
generic qemu machine. Back when I wrote the original aspeed support for
qemu I was looking at integrating the machine configuration into the openbmc
tree, but it was a little awkward at the time. It would be good if someone could
pick that up, as upstream have rearranged how they invoke qemu and it should
be more flexible now.

Andrew
