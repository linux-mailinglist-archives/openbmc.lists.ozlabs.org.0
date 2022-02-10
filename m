Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF14B01CB
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 02:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvJS737Dtz3Wtt
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 12:04:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvJRq3scXz2xtb;
 Thu, 10 Feb 2022 12:04:21 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 21A0tKwB069583;
 Thu, 10 Feb 2022 08:55:20 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Feb
 2022 09:03:31 +0800
Message-ID: <fcad21a9-c7f6-4dd9-7fa8-8a6e6f3853f2@aspeedtech.com>
Date: Thu, 10 Feb 2022 09:03:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] media: aspeed: Use full swing as JFIF to fix incorrect
 color
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220209084225.4456-1-jammy_huang@aspeedtech.com>
 <f790f9aa-fcb7-d163-9c1c-9eb107d4b1bd@molgen.mpg.de>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <f790f9aa-fcb7-d163-9c1c-9eb107d4b1bd@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 21A0tKwB069583
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

OK, I will update a new patch per your suggestion.

Thanks for your help.

On 2022/2/9 下午 05:06, Paul Menzel wrote:
> Dear Jammy,
>
>
> Am 09.02.22 um 09:42 schrieb Jammy Huang:
>> Current settings for video capture rgb-2-yuv is BT.601(studio swing),
>> but JFIF uses BT.601(full swing) to deocde. This mismatch will lead
>> to incorrect color. For example, input RGB value, (0, 0, 255), will
>> become (16, 16, 235) after jpg decoded.
>>
>> Add an enum, aspeed_video_capture_format, to define VR008[7:6]
>> capture format and correct default settings for video capture to fix
>> the problem.
> Maybe quote the datasheet:
>
> VR008[7:6] will decide the data format for video capture:
> 00: CCIR601 studio swing compliant YUV format
> 01: CCIR601 full swing compliant YUV format
> 10: RGB format
> 11: Gray color mode
>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>> v2:
>>    - update subject from 'media: aspeed: Fix-incorrect-color' to
>>      'media: aspeed: Use full swing as JFIF to fix incorrect'
>>    - update commit message
>>    - add enum, aspeed_video_capture_format, to define VR008[7:6]
>> ---
>>    drivers/media/platform/aspeed-video.c | 14 +++++++++++---
>>    1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index eb9c17ac0e14..5bcf60b4628b 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -86,8 +86,6 @@
>>    #define  VE_CTRL_SOURCE			BIT(2)
>>    #define  VE_CTRL_INT_DE			BIT(4)
>>    #define  VE_CTRL_DIRECT_FETCH		BIT(5)
>> -#define  VE_CTRL_YUV			BIT(6)
>> -#define  VE_CTRL_RGB			BIT(7)
>>    #define  VE_CTRL_CAPTURE_FMT		GENMASK(7, 6)
>>    #define  VE_CTRL_AUTO_OR_CURSOR		BIT(8)
>>    #define  VE_CTRL_CLK_INVERSE		BIT(11)
>> @@ -202,6 +200,15 @@ enum {
>>    	VIDEO_CLOCKS_ON,
>>    };
>>    
>> +// for VE_CTRL_CAPTURE_FMT
>> +enum aspeed_video_capture_format {
>> +	VIDEO_CAP_FMT_YUV_STUDIO = 0,
> Maybe also append `_SWING`?
>
>> +	VIDEO_CAP_FMT_YUV_FULL,
>> +	VIDEO_CAP_FMT_RGB,
>> +	VIDEO_CAP_FMT_GRAY,
>> +	VIDEO_CAP_FMT_MAX
>> +};
>> +
>>    struct aspeed_video_addr {
>>    	unsigned int size;
>>    	dma_addr_t dma;
>> @@ -1089,7 +1096,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>>    	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
>>    		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>>    		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
>> -	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR;
>> +	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR |
>> +		FIELD_PREP(VE_CTRL_CAPTURE_FMT, VIDEO_CAP_FMT_YUV_FULL);
>>    	u32 seq_ctrl = video->jpeg_mode;
>>    
>>    	if (video->frame_rate)
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
>
> Kind regards,
>
> Paul

-- 
Best Regards
Jammy

