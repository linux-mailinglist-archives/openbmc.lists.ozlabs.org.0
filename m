Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A32497743
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 03:31:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhv9g70Fbz3bYh
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 13:31:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jhv9P2r5Fz2xYQ;
 Mon, 24 Jan 2022 13:30:47 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20O2MTxZ016108;
 Mon, 24 Jan 2022 10:22:29 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 Jan
 2022 10:29:45 +0800
Message-ID: <b8707885-c10c-ca19-3f2c-f19f567e1f92@aspeedtech.com>
Date: Mon, 24 Jan 2022 10:29:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/4] media: aspeed: Fix timing polarity incorrect
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, <eajames@linux.ibm.com>,
 <mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
References: <20211222082139.26933-1-jammy_huang@aspeedtech.com>
 <20211222082139.26933-5-jammy_huang@aspeedtech.com>
 <418fc1b2-ddbe-24e3-82cc-aa8ce74f4507@xs4all.nl>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <418fc1b2-ddbe-24e3-82cc-aa8ce74f4507@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20O2MTxZ016108
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


On 2022/1/21 下午 03:30, Hans Verkuil wrote:
> On 12/22/21 09:21, Jammy Huang wrote:
>> This is a workaround for sync polarity unstable.
>> Sync value get by VR09C counts from sync's rising edge, which means
>> sync's polarity is negative if sync value is bigger than total/2.
> Do you have an example of such a format, or is this mostly theoretical?
>
> Either provide the example or make a note that it is theoretical.

OK, I will update an example in next patch. Let me explain first.

This is a must-be result. Please refer to the graph below as I sent in 
3/4 of this
series. For negative sync, sync width equals to back porch + data enable 
+ front porch.
Thus, sync would be bigger than 90% of total in most cases.

                   +-------------------+
                   |    v i d e o      |
       +--+  +-----+                   +-----+  +---+
          |  |                               |  |
          +--+                               +--+
        vsync+-------------------------------+
    frame_top+-----+
frame_bottom+-------------------------+


Following registers are what I got for 1920x1200@60.

1e700090: 07ee206f 04c9001a c4d3efff 04cc001f

1e7000a0: 0000081f 00000000 00000000 00000000

vertical total = 0x4D3 (VR098[27:16]) = 1235
vertical sync = 0x4CC (VR09C[27:16]) = 1228

>
> Regards,
>
> 	Hans
>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   v2:
>>    - Use 'total/2' rather than 'total<<1'
>>    - Update comment
>> ---
>>   drivers/media/platform/aspeed-video.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 7c50567f5ab0..c3e3343d91e1 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -989,6 +989,16 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>   
>>   		video->frame_bottom = FIELD_GET(VE_SRC_TB_EDGE_DET_BOT, src_tb_edge);
>>   		video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP, src_tb_edge);
>> +
>> +		/*
>> +		 * This is a workaround for polarity detection when the sync
>> +		 * value is larger than half.
>> +		 */
>> +		if (vsync > (vtotal / 2))
>> +			det->polarities &= ~V4L2_DV_VSYNC_POS_POL;
>> +		else
>> +			det->polarities |= V4L2_DV_VSYNC_POS_POL;
>> +
>>   		if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
>>   			det->vbackporch = video->frame_top - vsync;
>>   			det->vfrontporch = vtotal - video->frame_bottom;
>> @@ -1003,6 +1013,16 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>   
>>   		video->frame_right = FIELD_GET(VE_SRC_LR_EDGE_DET_RT, src_lr_edge);
>>   		video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT, src_lr_edge);
>> +
>> +		/*
>> +		 * This is a workaround for polarity detection when the sync
>> +		 * value is larger than half.
>> +		 */
>> +		if (hsync > (htotal / 2))
>> +			det->polarities &= ~V4L2_DV_HSYNC_POS_POL;
>> +		else
>> +			det->polarities |= V4L2_DV_HSYNC_POS_POL;
>> +
>>   		if (det->polarities & V4L2_DV_HSYNC_POS_POL) {
>>   			det->hbackporch = video->frame_left - hsync;
>>   			det->hfrontporch = htotal - video->frame_right;

-- 
Best Regards
Jammy

