Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C14AEBA5
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 09:00:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jtskk1xmfz3bVB
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 19:00:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtskQ144jz2ybD;
 Wed,  9 Feb 2022 19:00:27 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2197pbHw068866;
 Wed, 9 Feb 2022 15:51:37 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 9 Feb
 2022 15:59:49 +0800
Message-ID: <e498b84e-c8b1-f2ad-4364-f871491fb507@aspeedtech.com>
Date: Wed, 9 Feb 2022 15:59:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1] media: aspeed: Fix incorrect color
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220209024312.2218-1-jammy_huang@aspeedtech.com>
 <554448a9-bc65-7c0b-9878-fb2c0fe9bfe4@molgen.mpg.de>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <554448a9-bc65-7c0b-9878-fb2c0fe9bfe4@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2197pbHw068866
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

Thanks for your review and suggestion.

On 2022/2/9 下午 02:23, Paul Menzel wrote:

> Dear Jammy,
>
>
> Am 09.02.22 um 03:43 schrieb Jammy Huang:
>> Current settings for rgb-2-yuv is BT.601(studio swing), but JFIF
>> uses BT.601(full swing).
> Could you please describe the problem in a little more detail? On an
> attached monitor to the BMC (which one) what incorrect colors are seen?
Aspeed video 's input is gfx' output which is ARGB format. To generate 
jpg, video
engine will transform ARGB into YUV first. Previously, aspeed video's 
default
settings is studio swing (16~235), but jpg is full swing (0~255) as you 
can see in
'Conversion to and from RGB' of https://www.w3.org/Graphics/JPEG/jfif3.pdf.

This will lead to incorrect color. For example, a RGB color on gfx, 
blue(0, 0, 255) will
become (16, 16, 235) after we see the output jpg of aspeed video.
> Maybe use:
>
>> media: aspeed: Use full swing for JFIF to fix incorrect color
Thanks, I will update a more suitable subject for this patch.
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>    drivers/media/platform/aspeed-video.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index eb9c17ac0e14..08b63b8297f0 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -1089,7 +1089,7 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>>    	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
>>    		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>>    		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
>> -	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR;
>> +	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR | VE_CTRL_YUV;
> Excuse my ignorance, but reading [1][2] YUV can be represented by studio
> and full swing. How is the register/bit described in the datasheet, and
> can the macro name be improved?
VR008[7:6] will decide the data format for video capture:
00: CCIR601 studio swing compliant YUV format
01: CCIR601 full swing compliant YUV format
10: RGB format
11: Gray color mode

I will update this part as well.
>
>>    	u32 seq_ctrl = video->jpeg_mode;
>>    
>>    	if (video->frame_rate)
>
> Kind regards,
>
> Paul
>
>
> [1]: https://mymusing.co/bt601-yuv-to-rgb-conversion-color/
> [2]: https://www.hisour.com/yuv-color-system-25916/

-- 
Best Regards
Jammy

