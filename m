Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FBFF1A
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 19:50:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tpw13PvnzDqMS
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 03:50:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tpvD13MCzDqLx
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 03:49:42 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 10:49:39 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 30 Apr 2019 10:49:39 -0700
Subject: Re: [PATCH dev-5.0 3/4] media: aspeed: remove checking of
 VE_INTERRUPT_CAPTURE_COMPLETE
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-4-jae.hyun.yoo@linux.intel.com>
 <1ffe0e08-c7fd-4ba1-9ac7-bb17c1ae0b7b@www.fastmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d997ff31-68f0-41ae-58c2-87ac744f326d@linux.intel.com>
Date: Tue, 30 Apr 2019 10:49:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1ffe0e08-c7fd-4ba1-9ac7-bb17c1ae0b7b@www.fastmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On 4/29/2019 10:50 PM, Andrew Jeffery wrote:
> 
> 
> On Fri, 26 Apr 2019, at 07:50, Jae Hyun Yoo wrote:
>> VE_INTERRUPT_CAPTURE_COMPLETE and VE_INTERRUPT_COMP_COMPLETE are
>> not set at the same time but the current interrupt handling
>> mechanism of this driver doesn't clear the interrupt flag until
>> both two are set, and this behavior causes unnecessary interrupt
>> handler calls. In fact, this driver provides JPEG format only so
>> taking care of the VE_INTERRUPT_COMP_COMPLETE is enough for getting
>> compressed image frame so this commit gets rid of the
>> VE_INTERRUPT_CAPTURE_COMPLETE checking logic to simplfy the logic.
> 
> Typo: s/simplfy/simplify/

Will fix it.

> 
> It wouldn't have been too difficult to just split the IRQ handling and maintain
> some state to track whether we've completed both pieces. That wouldn't
> have hobbled supporting non-JPEG captures in the future, but at the same
> time it's not like it's hard to add back and someone would have to patch the
> driver to make non-JPEG modes work anyway.

Yes, I agree with you. The CAPTURE_COMPLETE event could be easily added
back when non-JPEG support is implemented in the future so for now that
event will be blocked for better performance and stability. If this
driver supports multiple formats, CAPTURE_COMPLETE and COMP_COMPLETE
should be selectively enabled in accordance with the format setting
to avoid unnecessary interrupt handling.

> I don't really have a dog in the race though, so I'm fine with the patch as it
> stands.

Thanks for your review!

Jae

> 
> Andrew
> 
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   drivers/media/platform/aspeed-video.c | 12 ++++--------
>>   1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c
>> b/drivers/media/platform/aspeed-video.c
>> index 429f676f9dea..77c209a472ca 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -463,8 +463,7 @@ static int aspeed_video_start_frame(struct
>> aspeed_video *video)
>>   	aspeed_video_write(video, VE_COMP_ADDR, addr);
>>   
>>   	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>> -			    VE_INTERRUPT_COMP_COMPLETE |
>> -			    VE_INTERRUPT_CAPTURE_COMPLETE);
>> +			    VE_INTERRUPT_COMP_COMPLETE);
>>   
>>   	aspeed_video_update(video, VE_SEQ_CTRL, 0,
>>   			    VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP);
>> @@ -570,8 +569,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>   		}
>>   	}
>>   
>> -	if ((sts & VE_INTERRUPT_COMP_COMPLETE) &&
>> -	    (sts & VE_INTERRUPT_CAPTURE_COMPLETE)) {
>> +	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>>   		struct aspeed_video_buffer *buf;
>>   		u32 frame_size = aspeed_video_read(video,
>>   						   VE_OFFSET_COMP_STREAM);
>> @@ -600,11 +598,9 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>   				    VE_SEQ_CTRL_FORCE_IDLE |
>>   				    VE_SEQ_CTRL_TRIG_COMP, 0);
>>   		aspeed_video_update(video, VE_INTERRUPT_CTRL,
>> -				    VE_INTERRUPT_COMP_COMPLETE |
>> -				    VE_INTERRUPT_CAPTURE_COMPLETE, 0);
>> +				    VE_INTERRUPT_COMP_COMPLETE, 0);
>>   		aspeed_video_write(video, VE_INTERRUPT_STATUS,
>> -				   VE_INTERRUPT_COMP_COMPLETE |
>> -				   VE_INTERRUPT_CAPTURE_COMPLETE);
>> +				   VE_INTERRUPT_COMP_COMPLETE);
>>   
>>   		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>>   			aspeed_video_start_frame(video);
>> -- 
>> 2.21.0
>>
>>
