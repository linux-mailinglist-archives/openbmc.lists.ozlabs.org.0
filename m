Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C452F44BAA4
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 04:33:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpr6p53KJz305K
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 14:33:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpr6V5mzSz2yPT;
 Wed, 10 Nov 2021 14:33:36 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1AA39hMY095864;
 Wed, 10 Nov 2021 11:09:43 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 10 Nov
 2021 11:33:01 +0800
Message-ID: <e8b51641-7b5f-376c-92e1-3d52d0f98f46@aspeedtech.com>
Date: Wed, 10 Nov 2021 11:33:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] media: aspeed: Fix incorrect resolution detected
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20211109095453.12363-1-jammy_huang@aspeedtech.com>
 <ac30786b-dbeb-db77-4fd8-6fe1efbdb929@molgen.mpg.de>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <ac30786b-dbeb-db77-4fd8-6fe1efbdb929@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AA39hMY095864
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

On 2021/11/9 下午 07:22, Paul Menzel wrote:
> Dear Jammy,
>
>
> Am 09.11.21 um 10:54 schrieb Jammy Huang:
>> During the process of os-installation, detected resolution's height
>> could be less than the correct one.
> Can you please elaborate? What OS? What resolution was and what
> resolution should have been detected?
My bad. This is the scenario our QA used to find this problem, but it 
could happen in
any scenario with successive timing-change condition. I will update to 
have a more
elaborate message
>
>> Increase min-required-count of stable signal to fix the problem.
> So you do two changes in the patch? First use the bitfield access
> macros, and then change VE_MODE_DT_HOR_STABLE and VE_MODE_DT_VER_STABLE
> from 6 to 10? Is that the amount of iterations? Why 10 and not 20?
> How much time do four iterations add?
VE_MODE_DT_HOR_STABLE means the min required count in detecting stable
HSYNC signal to set mode detection horizontal signal stable.
VE_MODE_DT_VER_STABLE means the min required count in detecting stable
VSYNC signal to set mode detection vertical signal stable.

How much time these iterations take varies by the input timing.
If VE_MODE_DT_VER_STABLE is 10, it means 10 successive stable vsync required
to make vertical signal stable flag raised. If the current timing is 60 
fps, it will takes
at least 10/60 second.
The suggested min acceptable value for these two are 3 and max is 15.
> Sorry for my ignorance, but if you could make it two patches, that’d be
> great.
Sure, I will make it two patches in next update.
>
>> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>    drivers/media/platform/aspeed-video.c | 13 ++++++++++++-
>>    1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 5da52646b298..625a77ddb479 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -196,6 +196,12 @@
>>    #define  VE_INTERRUPT_VSYNC_DESC	BIT(11)
>>    
>>    #define VE_MODE_DETECT			0x30c
>> +#define  VE_MODE_DT_HOR_TOLER		GENMASK(31, 28)
>> +#define  VE_MODE_DT_VER_TOLER		GENMASK(27, 24)
>> +#define  VE_MODE_DT_HOR_STABLE		GENMASK(23, 20)
>> +#define  VE_MODE_DT_VER_STABLE		GENMASK(19, 16)
>> +#define  VE_MODE_DT_EDG_THROD		GENMASK(15, 8)
>> +
>>    #define VE_MEM_RESTRICT_START		0x310
>>    #define VE_MEM_RESTRICT_END		0x314
>>    
>> @@ -1199,7 +1205,12 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>>    	aspeed_video_write(video, VE_SCALING_FILTER3, 0x00200000);
>>    
>>    	/* Set mode detection defaults */
>> -	aspeed_video_write(video, VE_MODE_DETECT, 0x22666500);
>> +	aspeed_video_write(video, VE_MODE_DETECT,
>> +			   FIELD_PREP(VE_MODE_DT_HOR_TOLER, 2) |
>> +			   FIELD_PREP(VE_MODE_DT_VER_TOLER, 2) |
>> +			   FIELD_PREP(VE_MODE_DT_HOR_STABLE, 10) |
>> +			   FIELD_PREP(VE_MODE_DT_VER_STABLE, 10) |
>> +			   FIELD_PREP(VE_MODE_DT_EDG_THROD, 0x65));
>>    
>>    	aspeed_video_write(video, VE_BCD_CTRL, 0);
>>    }
>>
>
> Kind regards,
>
> Paul

-- 
Best Regards
Jammy

