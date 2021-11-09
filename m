Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B29449FC8
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 01:41:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hp8L94sYrz2yy3
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 11:41:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hp8Kp4bFKz2yP6;
 Tue,  9 Nov 2021 11:40:59 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1A90H9Vf049014;
 Tue, 9 Nov 2021 08:17:09 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Nov
 2021 08:40:23 +0800
Message-ID: <326116c0-acd2-ccc2-d803-486df9c1fa3a@aspeedtech.com>
Date: Tue, 9 Nov 2021 08:40:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] media: aspeed: Fix signal status not updated immediately
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20211108061155.14479-1-jammy_huang@aspeedtech.com>
 <cd62eba4-2553-6837-6069-52a209e48b8c@molgen.mpg.de>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <cd62eba4-2553-6837-6069-52a209e48b8c@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1A90H9Vf049014
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Thanks for your help. I will update in the next patch.

On 2021/11/8 下午 03:57, Paul Menzel wrote:
> Dear Jammy,
>
>
> Am 08.11.21 um 07:11 schrieb Jammy Huang:
>
> Maybe for the commit message summary:
>
> media: aspeed: Update signal status immediately to ensure sane hw state
>
>
>> If res-chg, VE_INTERRUPT_MODE_DETECT_WD irq will be raised. But
>> v4l2_input_status wont't be updated to no-signal immediately until
> won’t
>
>> aspeed_video_get_resolution() in aspeed_video_resolution_work().
>>
>> During the period of time, aspeed_video_start_frame() could be called
>> because it doesn't know signal is unstable now. If it goes with
>> aspeed_video_init_regs() of aspeed_video_irq_res_change() simultaneously
>> , it will mess up hw state.
> Please do not start a line with a comma, for example, put the comma on
> the line above.
>
>> To fix this problem, v4l2_input_status will be updated to no-signal
> … status is updated _ (Present tense in commit messages.)
>
>> immediately for VE_INTERRUPT_MODE_DETECT_WD irq.
>>
>> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>    drivers/media/platform/aspeed-video.c | 6 +++---
>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 1ade264a8b69..3facd7ecc1a1 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -762,6 +762,8 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>>    	set_bit(VIDEO_RES_CHANGE, &video->flags);
>>    	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>>    
>> +	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
>> +
>>    	aspeed_video_off(video);
>>    	aspeed_video_on(video);
>>    	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
>> @@ -1889,7 +1891,6 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>>    	struct delayed_work *dwork = to_delayed_work(work);
>>    	struct aspeed_video *video = container_of(dwork, struct aspeed_video,
>>    						  res_work);
>> -	u32 input_status = video->v4l2_input_status;
>>    
>>    	/* Exit early in case no clients remain */
>>    	if (test_bit(VIDEO_STOPPED, &video->flags))
>> @@ -1902,8 +1903,7 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>>    	aspeed_video_get_resolution(video);
>>    
>>    	if (video->detected_timings.width != video->active_timings.width ||
>> -	    video->detected_timings.height != video->active_timings.height ||
>> -	    input_status != video->v4l2_input_status) {
>> +	    video->detected_timings.height != video->active_timings.height) {
>>    		static const struct v4l2_event ev = {
>>    			.type = V4L2_EVENT_SOURCE_CHANGE,
>>    			.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
>>
> Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
>
> Kind regards,
>
> Paul

-- 
Best Regards
Jammy

