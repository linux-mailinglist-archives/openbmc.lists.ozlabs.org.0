Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C9310B3D
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 18:21:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vNv772l0zDqPm
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 02:21:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vNtH2C5DzDqJB
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 02:20:53 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 09:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296121360"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 09:20:50 -0700
Subject: Re: [PATCH dev-5.0 4/4] media: aspeed: clear interrupt status flags
 immediately
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-5-jae.hyun.yoo@linux.intel.com>
 <23d85414-634a-2d2d-857e-2c3d824de7a5@linux.ibm.com>
 <f85d4a1f-c2ff-072b-63c3-08144e4d2e24@linux.intel.com>
 <CACPK8Xe+_+GWkY8UKU9JaDmhv1VWbCe+OGhz1uJsfRCeHh30yQ@mail.gmail.com>
 <CACPK8Xet+EKSkFyParGuFFP+NZBybr7qiF1-EBk=-LkR8MUjwQ@mail.gmail.com>
 <57538b50-691b-4787-0e59-20f7fe8c160b@linux.intel.com>
 <5ebc86a9-0e0d-4de9-9af2-9ea9fe85d5df@www.fastmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <3d498790-c6b1-dc2e-0fb0-0f6ae08125bc@linux.intel.com>
Date: Wed, 1 May 2019 09:20:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <5ebc86a9-0e0d-4de9-9af2-9ea9fe85d5df@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 4/30/2019 6:29 PM, Andrew Jeffery wrote:
> On Wed, 1 May 2019, at 05:30, Jae Hyun Yoo wrote:
>> On 4/29/2019 11:01 PM, Joel Stanley wrote:
>>> On Tue, 30 Apr 2019 at 03:04, Joel Stanley <joel@jms.id.au> wrote:
>>>>
>>>> On Mon, 29 Apr 2019 at 23:38, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>>
>>>>> On 4/29/2019 3:29 PM, Eddie James wrote:
>>>>>>
>>>>>> On 4/25/19 5:20 PM, Jae Hyun Yoo wrote:
>>>>>>> Interrupt status flags should be cleared immediately otherwise
>>>>>>> interrupt handler will be called again and again until the flag
>>>>>>> is cleared, but this driver clears some flags through a 500ms
>>>>>>> delayed work which is a bad idea in interrupt handling, so this
>>>>>>> commit makes the interrupt handler clear the status flags
>>>>>>> immediately.
>>>>>>>
>>>>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>>>>> ---
>>>>>>>     drivers/media/platform/aspeed-video.c | 12 +++++++-----
>>>>>>>     1 file changed, 7 insertions(+), 5 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/platform/aspeed-video.c
>>>>>>> b/drivers/media/platform/aspeed-video.c
>>>>>>> index 77c209a472ca..e218f375b9f5 100644
>>>>>>> --- a/drivers/media/platform/aspeed-video.c
>>>>>>> +++ b/drivers/media/platform/aspeed-video.c
>>>>>>> @@ -546,17 +546,18 @@ static irqreturn_t aspeed_video_irq(int irq,
>>>>>>> void *arg)
>>>>>>>          * re-initialize
>>>>>>>          */
>>>>>>>         if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
>>>>>>> +        aspeed_video_write(video, VE_INTERRUPT_STATUS,
>>>>>>> +                   VE_INTERRUPT_MODE_DETECT_WD);
>>>>>>
>>>>>>
>>>>>> aspeed_video_irq_res_change disables all IRQs and turns off the clocks.
>>>>>> This shouldn't be necessary.
>>>>>
>>>>> In fact, this patch fixes a watch dog reset with printing out a stack
>>>>> trace like below. This happens very rarely but it's critical because it
>>>>> causes a BMC reset. In my experiments, interrupt flags should be cleared
>>>>> even with the aspeed_video_write(video, VE_INTERRUPT_CTRL, 0) in
>>>>> aspeed_video_off(), or we should add
>>>>> apeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff)
>>>>> before the disabling interrupt. I think the way in this patch is better.
>>>>
>>>> In general, a driver should certainly be clearing (acking) the
>>>> interrupt bits in the interrupt handler before returning.
>>>>
>>>> Jae, it would be interesting to know the value of VE_INTERRUPT_STATUS
>>>> in the soft lockup situation.
>>>>
>>>> I took a closer look at this function, and it should probably not
>>>> return IRQ_HANDLED at the bottom, as it may have fallen through all of
>>>> the if statements and not have handled any interrupt. Jae, can you
>>>> take a look at this and send another patch if you think that is
>>>> correct.
>>>
>>> Something like the patch below. It also made me wonder why you don't
>>> return  from the flags = VIDEO_RES_DETECT state?
>>
>> Issue is caused because VE_INTERRUPT_MODE_DETECT_WD or
>> VE_INTERRUPT_MODE_DETECT is cleared by a 500ms delayed work when the
>> handler calls aspeed_video_irq_res_change(). As Eddie said, it disables
>> interrupt through aspeed_video_off() but it doesn't mean that the
>> interrupt bit is cleared at that timing. Actually, the interrupt bit
>> is cleared by aspeed_video_resolution_work() 500ms after it gets the
>> interrupt request so this patch is going to clear the bits immediately.
>>
>>> I don't have a way to test. Is there a simple command I can run on a
>>> BMC to test, or do I need the entire stack?
>>
>> The watch dog reset issue happens when video mode change is occurred. I
>> use Ubuntu GUI mode and set screen saver to blank screen with 1 minute
>> expiration time. And then, open bmcweb page and navigate to Server
>> control -> KVM page. As long as a user stays in this page, KVM video
>> will be off by the screen saver and then it will be awaken by KVM
>> service so this sequence will be repeated infinitely. I usually see the
>> issue at least once if I put my system under this overnight stress test.
>>
>>> --- a/drivers/media/platform/aspeed-video.c
>>> +++ b/drivers/media/platform/aspeed-video.c
>>> @@ -566,8 +566,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>>                            * detection; reset the engine and re-initialize
>>>                            */
>>>                           aspeed_video_irq_res_change(video);
>>> -                       return IRQ_HANDLED;
>>>                   }
>>> +               return IRQ_HANDLED;
>>>           }
>>>
>>>           if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>>> @@ -606,9 +606,13 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>>
>>>                   if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>>>                           aspeed_video_start_frame(video);
>>> +
>>> +               return IRQ_HANDLED;
>>>           }
>>>
>>> -       return IRQ_HANDLED;
>>> +       dev_dbg(video->dev, "unhandled states: %08x\n", sts);
>>> +
>>> +       return IRQ_NONE;
>>>    }
>>>
>>
>> Looks good but we need to consider cases that needs going thru all
>> if statements other than cases call aspeed_video_irq_res_change().
>>
>> I made a new patch like below. It has worked well so far. Will submit
>> v2 after making sufficient test using it.
>>
>>
>> diff --git a/drivers/media/platform/aspeed-video.c
>> b/drivers/media/platform/aspeed-video.c
>> index 77c209a472ca..8096319733ee 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -488,6 +488,7 @@ static void aspeed_video_off(struct aspeed_video *video)
>>
>>    	/* Disable interrupts */
>>    	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
>> +	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>>
>>    	/* Turn off the relevant clocks */
>>    	clk_disable(video->vclk);
>> @@ -539,24 +540,23 @@ static void aspeed_video_irq_res_change(struct
>> aspeed_video *video)
>>    static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>    {
>>    	struct aspeed_video *video = arg;
>> -	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
>> +	u32 irq_received = aspeed_video_read(video, VE_INTERRUPT_STATUS);
>> +	u32 irq_handled = 0;
>>
>>    	/*
>>    	 * Resolution changed or signal was lost; reset the engine and
>>    	 * re-initialize
>>    	 */
>> -	if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
>> +	if (irq_received & VE_INTERRUPT_MODE_DETECT_WD) {
>>    		aspeed_video_irq_res_change(video);
>>    		return IRQ_HANDLED;
>>    	}
>>
>> -	if (sts & VE_INTERRUPT_MODE_DETECT) {
>> +	if (irq_received & VE_INTERRUPT_MODE_DETECT) {
>>    		if (test_bit(VIDEO_RES_DETECT, &video->flags)) {
>>    			aspeed_video_update(video, VE_INTERRUPT_CTRL,
>>    					    VE_INTERRUPT_MODE_DETECT, 0);
>> -			aspeed_video_write(video, VE_INTERRUPT_STATUS,
>> -					   VE_INTERRUPT_MODE_DETECT);
>> -
>> +			irq_handled |= VE_INTERRUPT_MODE_DETECT;
>>    			set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
>>    			wake_up_interruptible_all(&video->wait);
>>    		} else {
>> @@ -569,7 +569,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>    		}
>>    	}
>>
>> -	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>> +	if (irq_received & VE_INTERRUPT_COMP_COMPLETE) {
>>    		struct aspeed_video_buffer *buf;
>>    		u32 frame_size = aspeed_video_read(video,
>>    						   VE_OFFSET_COMP_STREAM);
>> @@ -599,14 +599,15 @@ static irqreturn_t aspeed_video_irq(int irq, void
>> *arg)
>>    				    VE_SEQ_CTRL_TRIG_COMP, 0);
>>    		aspeed_video_update(video, VE_INTERRUPT_CTRL,
>>    				    VE_INTERRUPT_COMP_COMPLETE, 0);
>> -		aspeed_video_write(video, VE_INTERRUPT_STATUS,
>> -				   VE_INTERRUPT_COMP_COMPLETE);
>> -
>> +		irq_handled |= VE_INTERRUPT_COMP_COMPLETE;
>>    		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>>    			aspeed_video_start_frame(video);
>>    	}
>>
>> -	return IRQ_HANDLED;
>> +	if (irq_handled)
>> +		aspeed_video_write(video, VE_INTERRUPT_STATUS, irq_handled);
>> +
>> +	return irq_received == irq_handled ? IRQ_HANDLED : IRQ_NONE;
> 
> I don't think we need two variables? We can clear bits out of sts as we go,
> and then the return condition becomes:
> 
>      return sts ? IRQ_NONE : IRQ_HANDLED;

Yeah, that would be neater. I'll change it in v2 like you suggested.

Thanks,
Jae

>>    }
>>
>>    static void aspeed_video_check_and_set_polarity(struct aspeed_video
>> *video)
>>
