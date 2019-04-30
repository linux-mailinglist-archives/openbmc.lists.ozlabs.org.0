Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050FF032
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 08:04:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tWFH4mVRzDqMg
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 16:04:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="AIhq4buk"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tWBg2zG1zDqRG
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 16:02:03 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id c1so7476508qkk.4
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 23:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LY17JZfMQfniYS12+VqFsaExnC7S0x3aMWiY3ZuKM+M=;
 b=AIhq4bukfZfB7Zif2rNRrcy7gv6Fg+5zK4hzsCXKXHHIflr3+DFeLeaufOMNpejnjZ
 8PfHX7nsEhrY4HkAKGvDkFo1s+NERNd/qsL5fgjuPiWypr+vatUQstMTFqBzcW6oxuQQ
 fEqEeR3Pv6ALXDR97uG1rOszs4Gz14+t1RXpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LY17JZfMQfniYS12+VqFsaExnC7S0x3aMWiY3ZuKM+M=;
 b=sfO7jXmtdHcqu2LEFzkxo/honzuAgXs9OhsE/hU9wqcbmg60IaHsnAGJjqRKxzDOyG
 n72KuHVvVvxFkWJFKpEzo8RPC8WcLvQLPojvXkSs5mAiIRe+yUV2oKXa6OgmPFnLtcJm
 dcMQ3CJSrEyYBXMscrA7eF8u4083FDu2+jHRBAdTSsJRTaSfPiZteQGUv/haRvpTTw1B
 tcDriGm/B113ItDvWoNu6hIyGNhxzjH/N6n8TJBEaLytznQ5WoOATCDCW8ajrP05vFHn
 Q0tmDBguO1ggKrstj4x/i5zl3opRfNIaUxz2HWewmyxeVY5GEu062iFOE2Yi02HwHBl8
 yAwg==
X-Gm-Message-State: APjAAAU+IECsn4JAVMDHyCFUouWo0ZIuon8JknTljOhAqEBUCNT32Mtu
 9wQErFvR0pwhSAMyEQIexEw9XZGVp2qaibWlHkk=
X-Google-Smtp-Source: APXvYqxY0PdpAtlyPE7LeE9T/l2ThKA8dwmxkpK/XMOFT/a0bDytXBtx5CgPx9c15fkyk29L185eTzMrXvYBq7KY+AQ=
X-Received: by 2002:ae9:f00e:: with SMTP id l14mr23886697qkg.127.1556604119400; 
 Mon, 29 Apr 2019 23:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-5-jae.hyun.yoo@linux.intel.com>
 <23d85414-634a-2d2d-857e-2c3d824de7a5@linux.ibm.com>
 <f85d4a1f-c2ff-072b-63c3-08144e4d2e24@linux.intel.com>
 <CACPK8Xe+_+GWkY8UKU9JaDmhv1VWbCe+OGhz1uJsfRCeHh30yQ@mail.gmail.com>
In-Reply-To: <CACPK8Xe+_+GWkY8UKU9JaDmhv1VWbCe+OGhz1uJsfRCeHh30yQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Apr 2019 06:01:47 +0000
Message-ID: <CACPK8Xet+EKSkFyParGuFFP+NZBybr7qiF1-EBk=-LkR8MUjwQ@mail.gmail.com>
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

On Tue, 30 Apr 2019 at 03:04, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 29 Apr 2019 at 23:38, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >
> > On 4/29/2019 3:29 PM, Eddie James wrote:
> > >
> > > On 4/25/19 5:20 PM, Jae Hyun Yoo wrote:
> > >> Interrupt status flags should be cleared immediately otherwise
> > >> interrupt handler will be called again and again until the flag
> > >> is cleared, but this driver clears some flags through a 500ms
> > >> delayed work which is a bad idea in interrupt handling, so this
> > >> commit makes the interrupt handler clear the status flags
> > >> immediately.
> > >>
> > >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > >> ---
> > >>   drivers/media/platform/aspeed-video.c | 12 +++++++-----
> > >>   1 file changed, 7 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/drivers/media/platform/aspeed-video.c
> > >> b/drivers/media/platform/aspeed-video.c
> > >> index 77c209a472ca..e218f375b9f5 100644
> > >> --- a/drivers/media/platform/aspeed-video.c
> > >> +++ b/drivers/media/platform/aspeed-video.c
> > >> @@ -546,17 +546,18 @@ static irqreturn_t aspeed_video_irq(int irq,
> > >> void *arg)
> > >>        * re-initialize
> > >>        */
> > >>       if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
> > >> +        aspeed_video_write(video, VE_INTERRUPT_STATUS,
> > >> +                   VE_INTERRUPT_MODE_DETECT_WD);
> > >
> > >
> > > aspeed_video_irq_res_change disables all IRQs and turns off the clocks.
> > > This shouldn't be necessary.
> >
> > In fact, this patch fixes a watch dog reset with printing out a stack
> > trace like below. This happens very rarely but it's critical because it
> > causes a BMC reset. In my experiments, interrupt flags should be cleared
> > even with the aspeed_video_write(video, VE_INTERRUPT_CTRL, 0) in
> > aspeed_video_off(), or we should add
> > apeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff)
> > before the disabling interrupt. I think the way in this patch is better.
>
> In general, a driver should certainly be clearing (acking) the
> interrupt bits in the interrupt handler before returning.
>
> Jae, it would be interesting to know the value of VE_INTERRUPT_STATUS
> in the soft lockup situation.
>
> I took a closer look at this function, and it should probably not
> return IRQ_HANDLED at the bottom, as it may have fallen through all of
> the if statements and not have handled any interrupt. Jae, can you
> take a look at this and send another patch if you think that is
> correct.

Something like the patch below. It also made me wonder why you don't
return  from the flags = VIDEO_RES_DETECT state?

I don't have a way to test. Is there a simple command I can run on a
BMC to test, or do I need the entire stack?

--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -566,8 +566,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
                         * detection; reset the engine and re-initialize
                         */
                        aspeed_video_irq_res_change(video);
-                       return IRQ_HANDLED;
                }
+               return IRQ_HANDLED;
        }

        if (sts & VE_INTERRUPT_COMP_COMPLETE) {
@@ -606,9 +606,13 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)

                if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
                        aspeed_video_start_frame(video);
+
+               return IRQ_HANDLED;
        }

-       return IRQ_HANDLED;
+       dev_dbg(video->dev, "unhandled states: %08x\n", sts);
+
+       return IRQ_NONE;
 }
