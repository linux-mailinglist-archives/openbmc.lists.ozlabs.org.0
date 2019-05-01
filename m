Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB5103AE
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 03:30:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v16Q5JC4zDqMr
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 11:30:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qcsjouHe"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lE25xJU1"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v15X6mJ5zDqMr
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 11:29:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A6D065B9;
 Tue, 30 Apr 2019 21:29:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 30 Apr 2019 21:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=BMj7AFQv15m7pXKkdDynkkCPrnA3Xmz
 +XaMUEYuzSE0=; b=qcsjouHe+/2Dtej5UQJC4x9QKTSqas91dpZ+POkP3+NNSmA
 lJq8wvhJdDcm7XU+buV6wKbvIL0VdnYoU+LGGSj9scL2MIMbqrOqnrvi+71EikvC
 ZoqEzgmiDIcXEhHlRwmqhV9jd+Rfdw8MqHOe2UNjVCu5RedxVw6yBiyzG4O2UBij
 q2j3JNp+9Rxa8fNkQQcqIfiozzgg6D/1YMbUEKD7NVvJmj28rWs1U7/B5FLslnvW
 +HLmVqXdYAUG9KWlvsmXRKk8kHGknHjHrjqQeAdeFqJe/ry9oL3zJ720o1KMrrEU
 Gw0jF5G5apCQJEqIx/on0w5q3TyZo2GaZHo5vNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BMj7AF
 Qv15m7pXKkdDynkkCPrnA3Xmz+XaMUEYuzSE0=; b=lE25xJU1hXthcgeNwyKBtg
 +QS3wtM3c/Cp0FIEBFTpI1ttsYdwyKduU6u2FAVQOQD926JRQSFQAKjYnwK+1oMm
 e/zJR82IhNMNGABG1vvWJyDGm9N1Vr4sWZX7M99TrZSuyljYCDr745YecHm2yWaq
 5cKYhfw4u+yelIgb6dT0aVe/Qh+k/T3/wCzc3PiuyQR4VQirjzuAbTU+dBvgycEd
 dBUl093VhWAQlN6h+8LwNMVCOTqOmJkNTeieWgyKoLs5w5N1C6ydqCeyWqB7ZxVV
 TxA2Z4LjkBDErTp+6mAAmzNUrQtXRVsPSJ4LQsPwfg3zHJcWIqKZn3joIJi0qnhA
 ==
X-ME-Sender: <xms:a_bIXAPZBjeBGIiNEK4_3R4MSXvh4BrSfS5xic8gh-1zi5YgdMuaNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieeigdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:a_bIXN5n82EpRERoV5JhKHlPEq74P9A29H0hb5Cve--e9Xq3wGM_ew>
 <xmx:a_bIXMbJY2pSXA7xX5j_ajeG4XpoD82EsJmpU5wr0bwnLDdKngJDrw>
 <xmx:a_bIXNFbZV-8_ZLw6CV5UDR5FuGi1j-24_8_D3cmIK6-3WaRr-YLsQ>
 <xmx:bPbIXDT0PkvTO0JmxLyckTeVmTkj8rGCqILCgaHukUBKe2_XB_jK-Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 285D07C199; Tue, 30 Apr 2019 21:29:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <5ebc86a9-0e0d-4de9-9af2-9ea9fe85d5df@www.fastmail.com>
In-Reply-To: <57538b50-691b-4787-0e59-20f7fe8c160b@linux.intel.com>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-5-jae.hyun.yoo@linux.intel.com>
 <23d85414-634a-2d2d-857e-2c3d824de7a5@linux.ibm.com>
 <f85d4a1f-c2ff-072b-63c3-08144e4d2e24@linux.intel.com>
 <CACPK8Xe+_+GWkY8UKU9JaDmhv1VWbCe+OGhz1uJsfRCeHh30yQ@mail.gmail.com>
 <CACPK8Xet+EKSkFyParGuFFP+NZBybr7qiF1-EBk=-LkR8MUjwQ@mail.gmail.com>
 <57538b50-691b-4787-0e59-20f7fe8c160b@linux.intel.com>
Date: Tue, 30 Apr 2019 21:29:14 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_4/4]_media:_aspeed:_clear_interrupt_status_?=
 =?UTF-8?Q?flags_immediately?=
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 1 May 2019, at 05:30, Jae Hyun Yoo wrote:
> On 4/29/2019 11:01 PM, Joel Stanley wrote:
> > On Tue, 30 Apr 2019 at 03:04, Joel Stanley <joel@jms.id.au> wrote:
> >>
> >> On Mon, 29 Apr 2019 at 23:38, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >>>
> >>> On 4/29/2019 3:29 PM, Eddie James wrote:
> >>>>
> >>>> On 4/25/19 5:20 PM, Jae Hyun Yoo wrote:
> >>>>> Interrupt status flags should be cleared immediately otherwise
> >>>>> interrupt handler will be called again and again until the flag
> >>>>> is cleared, but this driver clears some flags through a 500ms
> >>>>> delayed work which is a bad idea in interrupt handling, so this
> >>>>> commit makes the interrupt handler clear the status flags
> >>>>> immediately.
> >>>>>
> >>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >>>>> ---
> >>>>>    drivers/media/platform/aspeed-video.c | 12 +++++++-----
> >>>>>    1 file changed, 7 insertions(+), 5 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/platform/aspeed-video.c
> >>>>> b/drivers/media/platform/aspeed-video.c
> >>>>> index 77c209a472ca..e218f375b9f5 100644
> >>>>> --- a/drivers/media/platform/aspeed-video.c
> >>>>> +++ b/drivers/media/platform/aspeed-video.c
> >>>>> @@ -546,17 +546,18 @@ static irqreturn_t aspeed_video_irq(int irq,
> >>>>> void *arg)
> >>>>>         * re-initialize
> >>>>>         */
> >>>>>        if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
> >>>>> +        aspeed_video_write(video, VE_INTERRUPT_STATUS,
> >>>>> +                   VE_INTERRUPT_MODE_DETECT_WD);
> >>>>
> >>>>
> >>>> aspeed_video_irq_res_change disables all IRQs and turns off the clocks.
> >>>> This shouldn't be necessary.
> >>>
> >>> In fact, this patch fixes a watch dog reset with printing out a stack
> >>> trace like below. This happens very rarely but it's critical because it
> >>> causes a BMC reset. In my experiments, interrupt flags should be cleared
> >>> even with the aspeed_video_write(video, VE_INTERRUPT_CTRL, 0) in
> >>> aspeed_video_off(), or we should add
> >>> apeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff)
> >>> before the disabling interrupt. I think the way in this patch is better.
> >>
> >> In general, a driver should certainly be clearing (acking) the
> >> interrupt bits in the interrupt handler before returning.
> >>
> >> Jae, it would be interesting to know the value of VE_INTERRUPT_STATUS
> >> in the soft lockup situation.
> >>
> >> I took a closer look at this function, and it should probably not
> >> return IRQ_HANDLED at the bottom, as it may have fallen through all of
> >> the if statements and not have handled any interrupt. Jae, can you
> >> take a look at this and send another patch if you think that is
> >> correct.
> > 
> > Something like the patch below. It also made me wonder why you don't
> > return  from the flags = VIDEO_RES_DETECT state?
> 
> Issue is caused because VE_INTERRUPT_MODE_DETECT_WD or
> VE_INTERRUPT_MODE_DETECT is cleared by a 500ms delayed work when the
> handler calls aspeed_video_irq_res_change(). As Eddie said, it disables
> interrupt through aspeed_video_off() but it doesn't mean that the
> interrupt bit is cleared at that timing. Actually, the interrupt bit
> is cleared by aspeed_video_resolution_work() 500ms after it gets the
> interrupt request so this patch is going to clear the bits immediately.
> 
> > I don't have a way to test. Is there a simple command I can run on a
> > BMC to test, or do I need the entire stack?
> 
> The watch dog reset issue happens when video mode change is occurred. I
> use Ubuntu GUI mode and set screen saver to blank screen with 1 minute
> expiration time. And then, open bmcweb page and navigate to Server
> control -> KVM page. As long as a user stays in this page, KVM video
> will be off by the screen saver and then it will be awaken by KVM
> service so this sequence will be repeated infinitely. I usually see the
> issue at least once if I put my system under this overnight stress test.
> 
> > --- a/drivers/media/platform/aspeed-video.c
> > +++ b/drivers/media/platform/aspeed-video.c
> > @@ -566,8 +566,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
> >                           * detection; reset the engine and re-initialize
> >                           */
> >                          aspeed_video_irq_res_change(video);
> > -                       return IRQ_HANDLED;
> >                  }
> > +               return IRQ_HANDLED;
> >          }
> > 
> >          if (sts & VE_INTERRUPT_COMP_COMPLETE) {
> > @@ -606,9 +606,13 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
> > 
> >                  if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
> >                          aspeed_video_start_frame(video);
> > +
> > +               return IRQ_HANDLED;
> >          }
> > 
> > -       return IRQ_HANDLED;
> > +       dev_dbg(video->dev, "unhandled states: %08x\n", sts);
> > +
> > +       return IRQ_NONE;
> >   }
> > 
> 
> Looks good but we need to consider cases that needs going thru all
> if statements other than cases call aspeed_video_irq_res_change().
> 
> I made a new patch like below. It has worked well so far. Will submit
> v2 after making sufficient test using it.
> 
> 
> diff --git a/drivers/media/platform/aspeed-video.c 
> b/drivers/media/platform/aspeed-video.c
> index 77c209a472ca..8096319733ee 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -488,6 +488,7 @@ static void aspeed_video_off(struct aspeed_video *video)
> 
>   	/* Disable interrupts */
>   	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
> +	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
> 
>   	/* Turn off the relevant clocks */
>   	clk_disable(video->vclk);
> @@ -539,24 +540,23 @@ static void aspeed_video_irq_res_change(struct 
> aspeed_video *video)
>   static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   {
>   	struct aspeed_video *video = arg;
> -	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
> +	u32 irq_received = aspeed_video_read(video, VE_INTERRUPT_STATUS);
> +	u32 irq_handled = 0;
> 
>   	/*
>   	 * Resolution changed or signal was lost; reset the engine and
>   	 * re-initialize
>   	 */
> -	if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
> +	if (irq_received & VE_INTERRUPT_MODE_DETECT_WD) {
>   		aspeed_video_irq_res_change(video);
>   		return IRQ_HANDLED;
>   	}
> 
> -	if (sts & VE_INTERRUPT_MODE_DETECT) {
> +	if (irq_received & VE_INTERRUPT_MODE_DETECT) {
>   		if (test_bit(VIDEO_RES_DETECT, &video->flags)) {
>   			aspeed_video_update(video, VE_INTERRUPT_CTRL,
>   					    VE_INTERRUPT_MODE_DETECT, 0);
> -			aspeed_video_write(video, VE_INTERRUPT_STATUS,
> -					   VE_INTERRUPT_MODE_DETECT);
> -
> +			irq_handled |= VE_INTERRUPT_MODE_DETECT;
>   			set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
>   			wake_up_interruptible_all(&video->wait);
>   		} else {
> @@ -569,7 +569,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   		}
>   	}
> 
> -	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
> +	if (irq_received & VE_INTERRUPT_COMP_COMPLETE) {
>   		struct aspeed_video_buffer *buf;
>   		u32 frame_size = aspeed_video_read(video,
>   						   VE_OFFSET_COMP_STREAM);
> @@ -599,14 +599,15 @@ static irqreturn_t aspeed_video_irq(int irq, void 
> *arg)
>   				    VE_SEQ_CTRL_TRIG_COMP, 0);
>   		aspeed_video_update(video, VE_INTERRUPT_CTRL,
>   				    VE_INTERRUPT_COMP_COMPLETE, 0);
> -		aspeed_video_write(video, VE_INTERRUPT_STATUS,
> -				   VE_INTERRUPT_COMP_COMPLETE);
> -
> +		irq_handled |= VE_INTERRUPT_COMP_COMPLETE;
>   		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>   			aspeed_video_start_frame(video);
>   	}
> 
> -	return IRQ_HANDLED;
> +	if (irq_handled)
> +		aspeed_video_write(video, VE_INTERRUPT_STATUS, irq_handled);
> +
> +	return irq_received == irq_handled ? IRQ_HANDLED : IRQ_NONE;

I don't think we need two variables? We can clear bits out of sts as we go,
and then the return condition becomes:

    return sts ? IRQ_NONE : IRQ_HANDLED;

>   }
> 
>   static void aspeed_video_check_and_set_polarity(struct aspeed_video 
> *video)
>
