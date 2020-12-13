Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BE02D9139
	for <lists+openbmc@lfdr.de>; Mon, 14 Dec 2020 00:46:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvLlP6CQzzDqMF
	for <lists+openbmc@lfdr.de>; Mon, 14 Dec 2020 10:46:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=UbSlnCLD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Kq28aFtv; 
 dkim-atps=neutral
X-Greylist: delayed 400 seconds by postgrey-1.36 at bilbo;
 Mon, 14 Dec 2020 10:45:51 AEDT
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvLkR1ztrzDqJC
 for <openbmc@lists.ozlabs.org>; Mon, 14 Dec 2020 10:45:50 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 884EF5802F6;
 Sun, 13 Dec 2020 18:39:05 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 13 Dec 2020 18:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=4lHOpViz9Uk605e41Hrs+5fXfKYstr/
 VFbQwhb8nXrg=; b=UbSlnCLDhANCg855IwkVcVmwuahAyDXV27svY2ihosz96I6
 gK5fkE6GfHwOqm5splI79tFW5n23NQyUGo7w+TdYNp3QoG+hrta31NSTnzo+m6EO
 NTfrQQNZQfHbrygy42U9ERoeAF1G/WX4lu9NZsLdIgDKkxcyPfddRV5TOkhYB3ms
 8UhWBmMW2i7j/hxF25ge6NN8CBPXWe3HGpR5+9kVd+42Zo0VkKAHTOzoe3VNjRKZ
 6fA+Yb9n0IdYp9VLwdKc3t2m8nL0wHBBDXT9UBFhAcHXofkGTH/vGdujuxtx8N+A
 PcJz82QE2mo1XdmxR63mV0lSq71nnzViQ9ju51A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4lHOpV
 iz9Uk605e41Hrs+5fXfKYstr/VFbQwhb8nXrg=; b=Kq28aFtvvATd6Vay+s70mN
 PGLpfc6Oq636taHkqOI8AZnP4LvAibjukn9GHz6eBEkSrEkr8bp2Lt1BU+9lyEG2
 tnw0VsuY0YShAmV27Tt8HdCK2QKArm9ziIZV+HSi61bSmsjB6PM0QNiw0otIZflq
 8YscBHKOjfFqZ2zLrvkX3CHnLFMvSyL/O0TIEBmmcyoTwEKSrKfzytGVlsHqdeZT
 I/kcNRqeKGxNroNpGca8jIDqcm8RyTab4+cRijHigtU+Alj3/R8ioav36d+fTykT
 ggByfpBhofiG8x4A84DttPURq2cVOsd1+D8ofY35y5Xq3hW8ik6b5M1qU8ZHF0gA
 ==
X-ME-Sender: <xms:GKbWXwbCHGIlrGcBhT6zGN_cUN0KbRyR_Vlerw2O3SweMTkSTxNPUw>
 <xme:GKbWX7YcDvb2VIfFhQvBhjkSl2Ne83GmwDXDQT13szmb-nfq1De9p4S7uITWCNj6-
 ty4LBfNOcttvsZ4IQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekiedgudejiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedv
 hefhveeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:GKbWX68V9rQifaf9__a2OrS4urq6q3qm_fUecZO5uHB0w-56aHsieg>
 <xmx:GKbWX6rheSh73kaIFem1PCH1O2U2L5m3CkS6_RNYAh2dh21BwxJ_XA>
 <xmx:GKbWX7qVn20PT3qolmXenLjjQlMMbrpjPXcopomhZ9c0yiDkMYwioQ>
 <xmx:GabWX4gKXz2uVtLJJo1eG4_fHgkdLwppxEZfQ3SiR6cw0OEa7t6cCw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1EB68E00B2; Sun, 13 Dec 2020 18:39:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <5eec9b11-c0b7-4b77-8c03-ec2c7d52d828@www.fastmail.com>
In-Reply-To: <CAHp75VcMuHiUFgSas26DA-Bh1gGA_G5FT+9cetK=En9Q_oMZtg@mail.gmail.com>
References: <20201210065013.29348-1-troy_lee@aspeedtech.com>
 <CAHp75VcMuHiUFgSas26DA-Bh1gGA_G5FT+9cetK=En9Q_oMZtg@mail.gmail.com>
Date: Mon, 14 Dec 2020 10:08:42 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "Troy Lee" <troy_lee@aspeedtech.com>
Subject: Re: [PATCH] gpio: aspeed: Lock GPIO pin used as IRQ
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
Cc: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Troy Lee <leetroy@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 11 Dec 2020, at 00:44, Andy Shevchenko wrote:
> On Thu, Dec 10, 2020 at 9:36 AM Troy Lee <troy_lee@aspeedtech.com> wrote:
> >
> > GPIO pins can be used as IRQ indicators. When they do,
> > those pins should be flaged with locks to avoid kernel
> 
> flagged
> 
> > warning message.
> 
> ...
> 
> > @@ -651,6 +651,13 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
> 
> > +       rc = gpiochip_lock_as_irq(&gpio->chip, d->hwirq);
> > +       if (rc) {
> > +               dev_err(gpio->chip.parent, "unable to lock GPIO %lu as IRQ\n",
> > +                       d->hwirq);
> > +               return rc;
> > +       }
> 
> It's a copy'n'paste of generic code. Why do you need it in an unusual
> place, i.e. ->irq_set_type() IIUC?
> Can you elaborate about an issue, because this seems to be a hack?

Yep - Troy please provide more information. What was the warning you saw? How
were the GPIOs allocated on the system that triggered the warning? What did you
do to trigger the warning?

Andrew
