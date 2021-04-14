Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8C35EA04
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 02:32:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKk1r1ml8z30Ls
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 10:32:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=HbYw7hON;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rHiavBpy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=HbYw7hON; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rHiavBpy; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKk1W0Zh7z2yyK;
 Wed, 14 Apr 2021 10:31:42 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8F9AB580666;
 Tue, 13 Apr 2021 20:31:37 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 13 Apr 2021 20:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=knUE4eA4OJPF+HeLNfyGSHUwlIZ5VVc
 yXxGwT1wC3mg=; b=HbYw7hONcS2tHP0GCTKx/rYFKmy6+Sd8TH68re77bRFrgzx
 QfAEqd7AD81GTnpwPRTHX98f7jeTYe0eIJrVMD7TH3Ec6Gt15D3MejL0meVGrwHS
 J5NfluxWOHookNX0PJoE6SkGMYt5rPCJ/gQX5daohJXLfcwOVgJ3S0XrgMD3BpJR
 J/KSQK33bz/jrNS1sUH+Beav2jyJ94ajcCVDblqlzdIgjt5uaeDAduPXTJcqavWu
 5ZWrRj3Jg1z1hCoanX2OMsAcGREhn+umQZF6L017nZowqg/gq/E70GTZD2uGK+rL
 3R5nU9r7z+YX5ukYQt3oI/7NiZrlPuGorVs42ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=knUE4e
 A4OJPF+HeLNfyGSHUwlIZ5VVcyXxGwT1wC3mg=; b=rHiavBpyRcIE+PMbzfzvJx
 Cr0oPNN4/2GPWA08i2c3zxaa0bCXP6OpOt0z9DxTj3u7rX9bODvYxWjKt9AMh9oq
 at3vN/9FuHI/5WPEOKa0OsHxcVXceSH7iIFcKTVpRmz/ojIULPbaVKHczk2sWa1D
 24AjCtbKYoNJcRg2+JeTL2jRymF/6ytOVskQ7FqMAHT2q+YTtwiO5zxOGe4ohDAm
 uvED+R76YyBdT354ty/u8x0Ab/7YTrQqQyWx/hw6XS2C2LDLtBex30XxQe0GjcCM
 IhpOXK3epVnXqDeCFLLPJo4IKrr655YhdgYQdW1/byEQ7Fs5Z8LbDtYpNa99jNNw
 ==
X-ME-Sender: <xms:5zd2YEf91elAHYYF4a6xWKfQAzs7g9rGGYewbD2w0AF8U7yJZ-SyoQ>
 <xme:5zd2YGO9FCnHPZFcDcYLZI4wtuK_1OstqatjI7Qh0DkBR-GKFZc3_9Su08_u9ZRVX
 gMgo74vCRxb9gNtJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeltddgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudevjeegleejteffgfdvudetgfdvjedujeefgfekheeitedtgedvtdei
 keevjeeinecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:6Dd2YFjtn4geL8pbKnmdAxFVCoANBYEZVkahiXm_FtHrWW0aY8vmeQ>
 <xmx:6Dd2YJ-KWD3CTYBpBOPTc1wpT8VvPQ16wE_vhPkC_b-a3QTwR38AGw>
 <xmx:6Dd2YAukFZRXWD8XhWMtnEMZsuSwPC8CgxTCiwg3fr-9HN6LBY6b6w>
 <xmx:6Td2YLmq1Q30OW6nlYM7YkKRtyM73qX1nztS54cbHVRn2JqlSrb0bw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D411AA0048E; Tue, 13 Apr 2021 20:31:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <37e75b07-a5c6-422f-84b3-54f2bea0b917@www.fastmail.com>
In-Reply-To: <CAK8P3a1VFKuewt65RUK6hFAhZYSFFVUX7_nuJLoZW2WoPXGVTw@mail.gmail.com>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-16-andrew@aj.id.au>
 <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com>
 <ba63f830-4758-49aa-a63e-f204a8eec1b4@www.fastmail.com>
 <CAK8P3a3RXr5CR7DJgD9rEkN8owpPxXRgzRnPB_5LuQcHkzc4LA@mail.gmail.com>
 <e2d7268b-bdaf-45bf-bb21-a5b9f7e985a4@www.fastmail.com>
 <CAK8P3a1VFKuewt65RUK6hFAhZYSFFVUX7_nuJLoZW2WoPXGVTw@mail.gmail.com>
Date: Wed, 14 Apr 2021 10:00:20 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Arnd Bergmann" <arnd@kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_16/21]_ipmi:_kcs=5Fbmc:_Add_a_"raw"_character_de?=
 =?UTF-8?Q?vice_interface?=
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 13 Apr 2021, at 17:52, Arnd Bergmann wrote:
> On Tue, Apr 13, 2021 at 1:45 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Mon, 12 Apr 2021, at 18:18, Arnd Bergmann wrote:
> > > On Mon, Apr 12, 2021 at 3:33 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > On Fri, 9 Apr 2021, at 17:25, Arnd Bergmann wrote:
> > > > > On Fri, Mar 19, 2021 at 7:31 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > > >
> > > > > > The existing IPMI chardev encodes IPMI behaviours as the name suggests.
> > > > > > However, KCS devices are useful beyond IPMI (or keyboards), as they
> > > > > > provide a means to generate IRQs and exchange arbitrary data between a
> > > > > > BMC and its host system.
> > > > >
> > > > > I only noticed the series after Joel asked about the DT changes on the arm
> > > > > side. One question though:
> > > > >
> > > > > How does this related to the drivers/input/serio/ framework that also talks
> > > > > to the keyboard controller for things that are not keyboards?
> > > >
> > > > I've taken a brief look and I feel they're somewhat closely related.
> > > >
> > > > It's plausible that we could wrangle the code so the Aspeed and Nuvoton
> > > > KCS drivers move under drivers/input/serio. If you squint, the i8042
> > > > serio device driver has similarities with what the Aspeed and Nuvoton
> > > > device drivers are providing to the KCS IPMI stack.
> > >
> > > After looking some more into it, I finally understood that the two are
> > > rather complementary. While the  drivers/char/ipmi/kcs_bmc.c
> > > is the other (bmc) end of drivers/char/ipmi/ipmi_kcs_sm.c, it seems
> > > that the proposed kcs_bmc_cdev_raw.c interface would be
> > > what corresponds to the other side of
> > > drivers/input/serio/i8042.c+userio.c.
> >
> > Right. I guess the question is should we be splitting kernel subsystems
> > along host/bmc lines? Doesn't feel intuitive, it's all Linux, but maybe
> > we can consolidate in the future if it makes sense?
> 
> We actually have a number of subsystems with somewhat overlapping
> functionality. I brought up serio, because it has an abstraction for multiple
> things that communicate over the keyboard controller and I thought
> the problem you were trying to solve was also related to the keyboard
> controller.
> It is also one of multiple abstractions that allow you to connect a device
> to a uart (along with serdev and tty_ldisc, probably at least one more that
> you can nest above or below these).
> 
> Consolidating the kcs_bmc.c interface into something that already
> exists would obviously be best, but it's not clear which of these that
> should be, that depends on the fundamental properties of the hardware
> interface.
> 
> > > Then again, these are also on
> > > separate ports (0x60 for the keyboard controller, 0xca2 for the BMC
> > > KCS), so they would never actually talk to one another.
> >
> > Well, sort of I guess. On Power systems we don't use the keyboard
> > controller for IPMI or keyboards, so we're just kinda exploiting the
> > hardware for our own purposes.
> 
> Can you describe in an abstract form what the hardware interface
> can do here and what you want from it? I wonder if it could be
> part of a higher-level interface such as drivers/mailbox/ instead.

It gives us interrupts each way between the host and BMC when we send 
some (small amount of) data/metadata. Mailbox is possibly a fit for 
this? We're (ab)using the keyboard controllers to implement a vendor 
MCTP binding over LPC[1] and also a simple protocol for the (Power) 
host to trigger BMC debug data capture in the event of issues with 
other (more complex) in-band communication stacks. The MCTP binding is 
what requires access to STR.

It's feasible that we could implement the debug capture protocol with 
the serio_raw interface now that I think about it (as it only makes use 
of data and not status). What's unclear to me right now is what impact 
that has on the Aspeed/Nuvoton KCS drivers we have in the IPMI 
subsystem. If we can do something sensible to service both serio and 
IPMI with the one driver implementation then I can put together a PoC 
for the debug data stuff using serio_raw.

Regarding the MCTP binding, Jeremy Kerr is working in an in-kernel, 
socket-based implementation of MCTP. Eventually this will allow us to 
bury the KCS details in the MCTP subsystem, which removes some of the 
motivation for the raw interface here.

Andrew

[1] https://github.com/openbmc/libmctp/blob/master/docs/bindings/vendor-ibm-astlpc.md
