Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB69AEEED
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 05:05:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tRGd0yy9zDqRB
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 13:05:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="eGJ9o7w7"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tRFl4h6qzDqLn
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 13:04:26 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id c35so14572372qtk.3
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 20:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F9mbguTRjI4euMhSvHoGy+nQ6wfOvA7fe9zrFY6SuKI=;
 b=eGJ9o7w7nH9lyXTEA4TlFLt9eP+P6kSprYMYwYZMoVlu1peXhMxDYt8VXz2jIRP8p4
 tKo4VkAtqjwqkGDoqhQfIvK4ekslIZmflV8qszyBnAe9VU6pNabd/b+arpASvdeg5j3T
 TWvxAGCDAlESF7fWCtjK4iGWJDQ9buyFjZORg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F9mbguTRjI4euMhSvHoGy+nQ6wfOvA7fe9zrFY6SuKI=;
 b=tLREkj8XZZEkNb/bVlHbq9WAjA8qIei8JVN+iSNEeBxiDexuUoIyHqgPxu8tVHZTJZ
 jKlsLsOJEyiJe39UH9VwsmAhRu0m61k+qme1hiOzrWVD0xQKBuWfpc/r6l8o3nLTVqRw
 bdAFyw6Ao+lY0gZjU5xrLbqy67q73P5Zlho+e6jtdR65jsiWoXlpqAsU6bvAU4JYGVC3
 A6dmrrbIFA0YOgfsUfzm2YCwoUKOurTLcczH/ydQOc3q/sMAhnDW5SWZY5Buw3ouggIt
 YWfD/04b2vPxDnOxz0i4Tjoq2CLa5m9mfWG66NZ9Et56EabKXMA/5V1tPrxOi9GT3ZiT
 E5Sw==
X-Gm-Message-State: APjAAAXNvS/YbzyiWMWapgoqPIYws5cQdwQ0EI7d3pibRV+fqF/xTWPK
 ZmIutQKVpZ8rBbR/jv98SnJcH1MmmA/fl+6TSfc=
X-Google-Smtp-Source: APXvYqy18Uu9G5rjFPfoYyS+vaz77iYiyeEt+F/SHgsSLyCWRyi5AiNNsdUcnyjHbwf0AlTFsDwZOSOinS8H3lZMKJQ=
X-Received: by 2002:ac8:3365:: with SMTP id u34mr40452634qta.284.1556593462562; 
 Mon, 29 Apr 2019 20:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-5-jae.hyun.yoo@linux.intel.com>
 <23d85414-634a-2d2d-857e-2c3d824de7a5@linux.ibm.com>
 <f85d4a1f-c2ff-072b-63c3-08144e4d2e24@linux.intel.com>
In-Reply-To: <f85d4a1f-c2ff-072b-63c3-08144e4d2e24@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Apr 2019 03:04:10 +0000
Message-ID: <CACPK8Xe+_+GWkY8UKU9JaDmhv1VWbCe+OGhz1uJsfRCeHh30yQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 4/4] media: aspeed: clear interrupt status flags
 immediately
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 29 Apr 2019 at 23:38, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> On 4/29/2019 3:29 PM, Eddie James wrote:
> >
> > On 4/25/19 5:20 PM, Jae Hyun Yoo wrote:
> >> Interrupt status flags should be cleared immediately otherwise
> >> interrupt handler will be called again and again until the flag
> >> is cleared, but this driver clears some flags through a 500ms
> >> delayed work which is a bad idea in interrupt handling, so this
> >> commit makes the interrupt handler clear the status flags
> >> immediately.
> >>
> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >> ---
> >>   drivers/media/platform/aspeed-video.c | 12 +++++++-----
> >>   1 file changed, 7 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/aspeed-video.c
> >> b/drivers/media/platform/aspeed-video.c
> >> index 77c209a472ca..e218f375b9f5 100644
> >> --- a/drivers/media/platform/aspeed-video.c
> >> +++ b/drivers/media/platform/aspeed-video.c
> >> @@ -546,17 +546,18 @@ static irqreturn_t aspeed_video_irq(int irq,
> >> void *arg)
> >>        * re-initialize
> >>        */
> >>       if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
> >> +        aspeed_video_write(video, VE_INTERRUPT_STATUS,
> >> +                   VE_INTERRUPT_MODE_DETECT_WD);
> >
> >
> > aspeed_video_irq_res_change disables all IRQs and turns off the clocks.
> > This shouldn't be necessary.
>
> In fact, this patch fixes a watch dog reset with printing out a stack
> trace like below. This happens very rarely but it's critical because it
> causes a BMC reset. In my experiments, interrupt flags should be cleared
> even with the aspeed_video_write(video, VE_INTERRUPT_CTRL, 0) in
> aspeed_video_off(), or we should add
> apeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff)
> before the disabling interrupt. I think the way in this patch is better.

In general, a driver should certainly be clearing (acking) the
interrupt bits in the interrupt handler before returning.

Jae, it would be interesting to know the value of VE_INTERRUPT_STATUS
in the soft lockup situation.

I took a closer look at this function, and it should probably not
return IRQ_HANDLED at the bottom, as it may have fallen through all of
the if statements and not have handled any interrupt. Jae, can you
take a look at this and send another patch if you think that is
correct.

Cheers,

Joel

>
> After applying this patch, I've not seen the watch dog reset yet for
> over a week.
>
> Thanks,
>
> Jae
>
> [ 2174.199114] sched: RT throttling activated
> [ 2200.009118] watchdog: BUG: soft lockup - CPU#0 stuck for 22s!
> [irq/23-aspeed-v:609]
> [ 2200.016802] CPU: 0 PID: 609 Comm: irq/23-aspeed-v Not tainted
> 5.0.7-e124b50aeacb66baa42541ebc6c3544350f75a79 #1
> [ 2200.026884] Hardware name: Generic DT based system
> [ 2200.031705] PC is at irq_finalize_oneshot.part.0+0x6c/0x11c
> [ 2200.037284] LR is at unmask_irq.part.4+0x30/0x44
> [ 2200.041902] pc : [<8014c550>]    lr : [<8014ecb4>]    psr: a0000013
> [ 2200.048159] sp : 9e56bef0  ip : 00000000  fp : 9e56bf0c
> [ 2200.053377] r10: 80a07008  r9 : 00000000  r8 : 8014c6b0
> [ 2200.058595] r7 : 00000001  r6 : 00000001  r5 : 9d11ed90  r4 : 9d11ed80
> [ 2200.065112] r3 : 02400200  r2 : 9d11ed80  r1 : 00000080  r0 : 9d002940
> [ 2200.071630] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> Segment none
> [ 2200.078754] Control: 00c5387d  Table: 9d98c008  DAC: 00000051
> [ 2200.084496] CPU: 0 PID: 609 Comm: irq/23-aspeed-v Not tainted
> 5.0.7-e124b50aeacb66baa42541ebc6c3544350f75a79 #1
> [ 2200.094567] Hardware name: Generic DT based system
> [ 2200.099352] Backtrace:
> [ 2200.101844] [<80107cdc>] (dump_backtrace) from [<80107f10>]
> (show_stack+0x20/0x24)
> [ 2200.109415]  r7:00000000 r6:9e56a000 r5:80a070d8 r4:80a1ba08
> [ 2200.115092] [<80107ef0>] (show_stack) from [<80691844>]
> (dump_stack+0x20/0x28)
> [ 2200.122320] [<80691824>] (dump_stack) from [<80103dd8>]
> (show_regs+0x1c/0x20)
> [ 2200.129467] [<80103dbc>] (show_regs) from [<8017a940>]
> (watchdog_timer_fn+0x1c4/0x21c)
> [ 2200.137393] [<8017a77c>] (watchdog_timer_fn) from [<80159ce0>]
> (__hrtimer_run_queues.constprop.3+0x14c/0x280)
> [ 2200.147306]  r10:8017a77c r9:80a18cb0 r8:00000006 r7:20000193
> r6:80a18b80 r5:80a18bc0
> [ 2200.155121]  r4:80a1ba40
> [ 2200.157667] [<80159b94>] (__hrtimer_run_queues.constprop.3) from
> [<8015aac0>] (hrtimer_interrupt+0xf4/0x258)
> [ 2200.167491]  r10:80a18d00 r9:80a18cb0 r8:ffffffff r7:7fffffff
> r6:00000003 r5:20000193
> [ 2200.175305]  r4:80a18b80
> [ 2200.177867] [<8015a9cc>] (hrtimer_interrupt) from [<8050d51c>]
> (fttmr010_timer_interrupt+0x20/0x28)
> [ 2200.186915]  r10:9e56bdf8 r9:00000000 r8:9d013600 r7:00000011
> r6:9d01fd80 r5:80a4af84
> [ 2200.194727]  r4:9d001b80
> [ 2200.197292] [<8050d4fc>] (fttmr010_timer_interrupt) from [<8014be68>]
> (__handle_irq_event_percpu+0x48/0x1c4)
> [ 2200.207125] [<8014be20>] (__handle_irq_event_percpu) from
> [<8014c01c>] (handle_irq_event_percpu+0x38/0x90)
> [ 2200.216778]  r10:80a07008 r9:9e56a000 r8:9d013600 r7:00000000
> r6:9d01fd80 r5:80a4af84
> [ 2200.224594]  r4:80a07008
> [ 2200.227139] [<8014bfe4>] (handle_irq_event_percpu) from [<8014c0ac>]
> (handle_irq_event+0x38/0x4c)
> [ 2200.236003]  r6:00000001 r5:80a4af84 r4:9d01fd80
> [ 2200.240623] [<8014c074>] (handle_irq_event) from [<8014fa84>]
> (handle_edge_irq+0xb0/0x1cc)
> [ 2200.248881]  r5:80a4af84 r4:9d01fd80
> [ 2200.252462] [<8014f9d4>] (handle_edge_irq) from [<8014b6a4>]
> (generic_handle_irq+0x30/0x44)
> [ 2200.260805]  r5:80a4af84 r4:00000011
> [ 2200.264387] [<8014b674>] (generic_handle_irq) from [<8014b710>]
> (__handle_domain_irq+0x58/0xb8)
> [ 2200.273091] [<8014b6b8>] (__handle_domain_irq) from [<80102164>]
> (avic_handle_irq+0x68/0x70)
> [ 2200.281525]  r9:9e56a000 r8:8014c6b0 r7:9e56bed4 r6:ffffffff
> r5:9e56bea0 r4:9d002940
> [ 2200.289267] [<801020fc>] (avic_handle_irq) from [<801019ec>]
> (__irq_svc+0x6c/0x90)
> [ 2200.296824] Exception stack(0x9e56bea0 to 0x9e56bee8)
> [ 2200.301879] bea0: 9d002940 00000080 9d11ed80 02400200 9d11ed80
> 9d11ed90 00000001 00000001
> [ 2200.310060] bec0: 8014c6b0 00000000 80a07008 9e56bf0c 00000000
> 9e56bef0 8014ecb4 8014c550
> [ 2200.318222] bee0: a0000013 ffffffff
> [ 2200.321708]  r5:a0000013 r4:8014c550
> [ 2200.325290] [<8014c4e4>] (irq_finalize_oneshot.part.0) from
> [<8014c72c>] (irq_thread_fn+0x7c/0x88)
> [ 2200.334238]  r5:9d11ed80 r4:9e539540
> [ 2200.337821] [<8014c6b0>] (irq_thread_fn) from [<8014c974>]
> (irq_thread+0x104/0x1e0)
> [ 2200.345473]  r7:00000001 r6:9d11ed80 r5:ffffe000 r4:9e539540
> [ 2200.351153] [<8014c870>] (irq_thread) from [<80133490>]
> (kthread+0x14c/0x164)
> [ 2200.358287]  r10:9d0a3c00 r9:8014c870 r8:9e539540 r7:9e56a000
> r6:00000000 r5:9e542060
> [ 2200.366104]  r4:9e539b00
> [ 2200.368650] [<80133344>] (kthread) from [<801010e8>]
> (ret_from_fork+0x14/0x2c)
> [ 2200.375865] Exception stack(0x9e56bfb0 to 0x9e56bff8)
> [ 2200.380911] bfa0:                                     00000000
> 00000000 00000000 00000000
> [ 2200.389079] bfc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [ 2200.397248] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [ 2200.403863]  r10:00000000 r9:00000000 r8:00000000 r7:00000000
> r6:00000000 r5:80133344
> [ 2200.411681]  r4:9e542060
> [ 2228.009114] watchdog: BUG: soft lockup - CPU#0 stuck for 22s!
> [irq/23-aspeed-v:609]
> [ 2228.016798] CPU: 0 PID: 609 Comm: irq/23-aspeed-v Tainted: G
>     L    5.0.7-e124b50aeacb66baa42541ebc6c3544350f75a79 #1
> [ 2228.028268] Hardware name: Generic DT based system
> [ 2228.033085] PC is at irq_finalize_oneshot.part.0+0x6c/0x11c
> [ 2228.038670] LR is at unmask_irq.part.4+0x30/0x44
> [ 2228.043288] pc : [<8014c550>]    lr : [<8014ecb4>]    psr: a0000013
> [ 2228.049545] sp : 9e56bef0  ip : 00000000  fp : 9e56bf0c
> [ 2228.054762] r10: 80a07008  r9 : 00000000  r8 : 8014c6b0
> [ 2228.059980] r7 : 00000001  r6 : 00000001  r5 : 9d11ed90  r4 : 9d11ed80
> [ 2228.066498] r3 : 02400200  r2 : 9d11ed80  r1 : 00000080  r0 : 9d002940
> [ 2228.073014] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> Segment none
> [ 2228.080137] Control: 00c5387d  Table: 9d98c008  DAC: 00000051
> [ 2228.085881] CPU: 0 PID: 609 Comm: irq/23-aspeed-v Tainted: G
>     L    5.0.7-e124b50aeacb66baa42541ebc6c3544350f75a79 #1
> [ 2228.097338] Hardware name: Generic DT based system
> [ 2228.102123] Backtrace:
> [ 2228.104609] [<80107cdc>] (dump_backtrace) from [<80107f10>]
> (show_stack+0x20/0x24)
> [ 2228.112176]  r7:00000000 r6:9e56a000 r5:80a070d8 r4:80a1ba08
> [ 2228.117852] [<80107ef0>] (show_stack) from [<80691844>]
> (dump_stack+0x20/0x28)
> [ 2228.125080] [<80691824>] (dump_stack) from [<80103dd8>]
> (show_regs+0x1c/0x20)
> [ 2228.132234] [<80103dbc>] (show_regs) from [<8017a940>]
> (watchdog_timer_fn+0x1c4/0x21c)
> [ 2228.140164] [<8017a77c>] (watchdog_timer_fn) from [<80159ce0>]
> (__hrtimer_run_queues.constprop.3+0x14c/0x280)
> [ 2228.150078]  r10:8017a77c r9:80a18cb0 r8:00000006 r7:20000193
> r6:80a18b80 r5:80a18bc0
> [ 2228.157891]  r4:80a1ba40
> [ 2228.160438] [<80159b94>] (__hrtimer_run_queues.constprop.3) from
> [<8015aac0>] (hrtimer_interrupt+0xf4/0x258)
> [ 2228.170262]  r10:80a18d00 r9:80a18cb0 r8:ffffffff r7:7fffffff
> r6:00000003 r5:20000193
> [ 2228.178077]  r4:80a18b80
> [ 2228.180637] [<8015a9cc>] (hrtimer_interrupt) from [<8050d51c>]
> (fttmr010_timer_interrupt+0x20/0x28)
> [ 2228.189674]  r10:9e56bdf8 r9:00000000 r8:9d013600 r7:00000011
> r6:9d01fd80 r5:80a4af84
> [ 2228.197491]  r4:9d001b80
> [ 2228.200052] [<8050d4fc>] (fttmr010_timer_interrupt) from [<8014be68>]
> (__handle_irq_event_percpu+0x48/0x1c4)
> [ 2228.209884] [<8014be20>] (__handle_irq_event_percpu) from
> [<8014c01c>] (handle_irq_event_percpu+0x38/0x90)
> [ 2228.219530]  r10:80a07008 r9:9e56a000 r8:9d013600 r7:00000000
> r6:9d01fd80 r5:80a4af84
> [ 2228.227348]  r4:80a07008
> [ 2228.229892] [<8014bfe4>] (handle_irq_event_percpu) from [<8014c0ac>]
> (handle_irq_event+0x38/0x4c)
> [ 2228.238758]  r6:00000001 r5:80a4af84 r4:9d01fd80
> [ 2228.243388] [<8014c074>] (handle_irq_event) from [<8014fa84>]
> (handle_edge_irq+0xb0/0x1cc)
> [ 2228.251643]  r5:80a4af84 r4:9d01fd80
> [ 2228.255224] [<8014f9d4>] (handle_edge_irq) from [<8014b6a4>]
> (generic_handle_irq+0x30/0x44)
> [ 2228.263558]  r5:80a4af84 r4:00000011
> [ 2228.267142] [<8014b674>] (generic_handle_irq) from [<8014b710>]
> (__handle_domain_irq+0x58/0xb8)
> [ 2228.275844] [<8014b6b8>] (__handle_domain_irq) from [<80102164>]
> (avic_handle_irq+0x68/0x70)
> [ 2228.284279]  r9:9e56a000 r8:8014c6b0 r7:9e56bed4 r6:ffffffff
> r5:9e56bea0 r4:9d002940
> [ 2228.292019] [<801020fc>] (avic_handle_irq) from [<801019ec>]
> (__irq_svc+0x6c/0x90)
> [ 2228.299577] Exception stack(0x9e56bea0 to 0x9e56bee8)
> [ 2228.304630] bea0: 9d002940 00000080 9d11ed80 02400200 9d11ed80
> 9d11ed90 00000001 00000001
> [ 2228.312803] bec0: 8014c6b0 00000000 80a07008 9e56bf0c 00000000
> 9e56bef0 8014ecb4 8014c550
> [ 2228.320967] bee0: a0000013 ffffffff
> [ 2228.324451]  r5:a0000013 r4:8014c550
> [ 2228.328038] [<8014c4e4>] (irq_finalize_oneshot.part.0) from
> [<8014c72c>] (irq_thread_fn+0x7c/0x88)
> [ 2228.336983]  r5:9d11ed80 r4:9e539540
> [ 2228.340566] [<8014c6b0>] (irq_thread_fn) from [<8014c974>]
> (irq_thread+0x104/0x1e0)
> [ 2228.348219]  r7:00000001 r6:9d11ed80 r5:ffffe000 r4:9e539540
> [ 2228.353898] [<8014c870>] (irq_thread) from [<80133490>]
> (kthread+0x14c/0x164)
> [ 2228.361031]  r10:9d0a3c00 r9:8014c870 r8:9e539540 r7:9e56a000
> r6:00000000 r5:9e542060
> [ 2228.368848]  r4:9e539b00
> [ 2228.371394] [<80133344>] (kthread) from [<801010e8>]
> (ret_from_fork+0x14/0x2c)
> [ 2228.378609] Exception stack(0x9e56bfb0 to 0x9e56bff8)
> [ 2228.383656] bfa0:                                     00000000
> 00000000 00000000 00000000
> [ 2228.391833] bfc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [ 2228.400004] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [ 2228.406617]  r10:00000000 r9:00000000 r8:00000000 r7:00000000
> r6:00000000 r5:80133344
> [ 2228.414436]  r4:9e542060
>
> >
> >
> > The rest looks fine.
> >
> > Thanks,
> >
> > Eddie
> >
> >
> >>           aspeed_video_irq_res_change(video);
> >>           return IRQ_HANDLED;
> >>       }
> >>       if (sts & VE_INTERRUPT_MODE_DETECT) {
> >> +        aspeed_video_write(video, VE_INTERRUPT_STATUS,
> >> +                   VE_INTERRUPT_MODE_DETECT);
> >>           if (test_bit(VIDEO_RES_DETECT, &video->flags)) {
> >>               aspeed_video_update(video, VE_INTERRUPT_CTRL,
> >>                           VE_INTERRUPT_MODE_DETECT, 0);
> >> -            aspeed_video_write(video, VE_INTERRUPT_STATUS,
> >> -                       VE_INTERRUPT_MODE_DETECT);
> >> -
> >>               set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
> >>               wake_up_interruptible_all(&video->wait);
> >>           } else {
> >> @@ -574,6 +575,9 @@ static irqreturn_t aspeed_video_irq(int irq, void
> >> *arg)
> >>           u32 frame_size = aspeed_video_read(video,
> >>                              VE_OFFSET_COMP_STREAM);
> >> +        aspeed_video_write(video, VE_INTERRUPT_STATUS,
> >> +                   VE_INTERRUPT_COMP_COMPLETE);
> >> +
> >>           spin_lock(&video->lock);
> >>           clear_bit(VIDEO_FRAME_INPRG, &video->flags);
> >>           buf = list_first_entry_or_null(&video->buffers,
> >> @@ -599,8 +603,6 @@ static irqreturn_t aspeed_video_irq(int irq, void
> >> *arg)
> >>                       VE_SEQ_CTRL_TRIG_COMP, 0);
> >>           aspeed_video_update(video, VE_INTERRUPT_CTRL,
> >>                       VE_INTERRUPT_COMP_COMPLETE, 0);
> >> -        aspeed_video_write(video, VE_INTERRUPT_STATUS,
> >> -                   VE_INTERRUPT_COMP_COMPLETE);
> >>           if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
> >>               aspeed_video_start_frame(video);
> >
