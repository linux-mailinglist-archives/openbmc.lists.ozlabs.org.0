Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8986D45290A
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 05:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtXng3Bj8z2yMc
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 15:16:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtXnM0HVWz2xBl;
 Tue, 16 Nov 2021 15:16:35 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1AG3pk6Z094719;
 Tue, 16 Nov 2021 11:51:46 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Nov
 2021 12:15:24 +0800
Message-ID: <67e3be3a-7e18-115b-18b7-b3d5419e0992@aspeedtech.com>
Date: Tue, 16 Nov 2021 12:15:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 7/9] media: aspeed: Support aspeed mode to reduce
 compressed data
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20211115074437.28079-1-jammy_huang@aspeedtech.com>
 <20211115074437.28079-8-jammy_huang@aspeedtech.com>
 <YZIYIsURV0Gv1bc6@paasikivi.fi.intel.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <YZIYIsURV0Gv1bc6@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AG3pk6Z094719
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sakari,

OK, I will add a patch which uses data in device table to tell the 
differences between
SoC to the series. Thanks for your advice.

On 2021/11/15 下午 04:19, Sakari Ailus wrote:
> Hi Jammy,
>
> Thanks for the patch. A few comments below...
>
> On Mon, Nov 15, 2021 at 03:44:35PM +0800, Jammy Huang wrote:
>> @@ -969,35 +1045,70 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>   
>>   static void aspeed_video_update_regs(struct aspeed_video *video)
>>   {
>> -	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
>> -		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
>> +	u8 jpeg_hq_quality = clamp((int)video->jpeg_hq_quality - 1, 0,
>> +				   ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1);
>> +	u32 comp_ctrl =	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>> +		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
>> +		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
>> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_LUM, jpeg_hq_quality) |
>> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_CHR, jpeg_hq_quality |
>> +			   0x10);
>>   	u32 ctrl = 0;
>> -	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
>> +	u32 seq_ctrl = 0;
>>   
>> -	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
>> -		 video->frame_rate);
>> -	v4l2_dbg(1, debug, &video->v4l2_dev, "subsample(%s)\n",
>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n", video->frame_rate);
>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
>> +		 format_str[video->format],
>>   		 video->yuv420 ? "420" : "444");
>> -	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
>> -		 video->jpeg_quality);
>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d) hq(%s) hq_quality(%d)\n",
>> +		 video->jpeg_quality, video->hq_mode ? "on" : "off",
>> +		 video->jpeg_hq_quality);
>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression mode(%s)\n",
>> +		 compress_mode_str[video->compression_mode]);
>> +
>> +	if (video->format == VIDEO_FMT_ASPEED)
>> +		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
>> +	else
>> +		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
>>   
>>   	if (video->frame_rate)
>>   		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
>>   
>> +	if (video->format == VIDEO_FMT_STANDARD) {
>> +		comp_ctrl &= ~FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode);
>> +		seq_ctrl |= VE_SEQ_CTRL_JPEG_MODE;
>> +	}
>> +
>>   	if (video->yuv420)
>>   		seq_ctrl |= VE_SEQ_CTRL_YUV420;
>>   
>>   	if (video->jpeg.virt)
>>   		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
>>   
>> +#ifdef CONFIG_MACH_ASPEED_G4
> This would be better done based on the device recognised, not the selected
> compile target. The same goes for the rest of the conditional pre-processor
> bits.
>
>> +	switch (video->compression_mode) {
>> +	case 0:	//DCT only
>> +		comp_ctrl |= VE_COMP_CTRL_VQ_DCT_ONLY;
>> +		break;
>> +	case 1:	//DCT VQ mix 2-color
>> +		comp_ctrl &= ~(VE_COMP_CTRL_VQ_4COLOR | VE_COMP_CTRL_VQ_DCT_ONLY);
>> +		break;
>> +	case 2:	//DCT VQ mix 4-color
>> +		comp_ctrl |= VE_COMP_CTRL_VQ_4COLOR;
>> +		break;
>> +	}
>> +#endif
>> +

-- 
Best Regards
Jammy

