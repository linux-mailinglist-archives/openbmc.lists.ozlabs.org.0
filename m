Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326B4567BC
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 02:58:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwKZ60Glcz3bj9
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 12:58:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwKYq6JBjz2xr3;
 Fri, 19 Nov 2021 12:57:49 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1AJ1Vfjj078015;
 Fri, 19 Nov 2021 09:31:41 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Nov
 2021 09:55:28 +0800
Message-ID: <2c0cc308-16d4-69e4-f81f-597ceb9824f5@aspeedtech.com>
Date: Fri, 19 Nov 2021 09:55:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v5 03/10] media: aspeed: add more debug log messages
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <20211118074030.685-4-jammy_huang@aspeedtech.com>
 <YZY/sfRs+/bH3Was@paasikivi.fi.intel.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <YZY/sfRs+/bH3Was@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AJ1Vfjj078015
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

On 2021/11/18 下午 07:57, Sakari Ailus wrote:
> Hi Jammy,
>
> On Thu, Nov 18, 2021 at 03:40:24PM +0800, Jammy Huang wrote:
>> The new messages are listed as below:
>> 1. jpeg header and capture buffer information
>> 2. information for each irq
>> 3. current capture mode, sync or direct-fetch
>> 4. time consumed for each frame
>> 5. input timing changed information
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>> v5:
>>    - no update
>> v4:
>>    - modify log level
>> v3:
>>    - update commit message
>> v2:
>>    - new
>> ---
>>   drivers/media/platform/aspeed-video.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 6af57467b6d4..e8dd0a7ebfc7 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -461,12 +461,17 @@ static void aspeed_video_write(struct aspeed_video *video, u32 reg, u32 val)
>>   
>>   static void update_perf(struct aspeed_video_perf *p)
>>   {
>> +	struct aspeed_video *v = container_of(p, struct aspeed_video,
>> +					      perf);
>> +
>>   	p->duration =
>>   		ktime_to_ms(ktime_sub(ktime_get(),  p->last_sample));
>>   	p->totaltime += p->duration;
>>   
>>   	p->duration_max = max(p->duration, p->duration_max);
>>   	p->duration_min = min(p->duration, p->duration_min);
>> +	v4l2_dbg(2, debug, &v->v4l2_dev, "time consumed: %d ms\n",
>> +		 p->duration);
>>   }
>>   
>>   static int aspeed_video_start_frame(struct aspeed_video *video)
>> @@ -597,6 +602,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>   	struct aspeed_video *video = arg;
>>   	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
>>   
>> +	v4l2_dbg(2, debug, &video->v4l2_dev, "irq sts=%#x %s%s%s%s\n", sts,
>> +		 sts & VE_INTERRUPT_MODE_DETECT_WD ? ", unlock" : "",
>> +		 sts & VE_INTERRUPT_MODE_DETECT ? ", lock" : "",
>> +		 sts & VE_INTERRUPT_CAPTURE_COMPLETE ? ", capture-done" : "",
>> +		 sts & VE_INTERRUPT_COMP_COMPLETE ? ", comp-done" : "");
>> +
>>   	/*
>>   	 * Resolution changed or signal was lost; reset the engine and
>>   	 * re-initialize
>> @@ -910,6 +921,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>   
>>   	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
>>   	if (size < DIRECT_FETCH_THRESHOLD) {
>> +		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Sync Mode\n");
>>   		aspeed_video_write(video, VE_TGS_0,
>>   				   FIELD_PREP(VE_TGS_FIRST,
>>   					      video->frame_left - 1) |
>> @@ -921,6 +933,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>   					      video->frame_bottom + 1));
>>   		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
>>   	} else {
>> +		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
>>   		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>>   	}
>>   
>> @@ -937,6 +950,10 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>   		if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
>>   			goto err_mem;
>>   
>> +		v4l2_dbg(1, debug, &video->v4l2_dev, "src buf0 addr(%#x) size(%d)\n",
>> +			 video->srcs[0].dma, video->srcs[0].size);
>> +		v4l2_dbg(1, debug, &video->v4l2_dev, "src buf1 addr(%#x) size(%d)\n",
>> +			 video->srcs[1].dma, video->srcs[1].size);
>>   		aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
>>   		aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
>>   	}
>> @@ -1201,6 +1218,9 @@ static int aspeed_video_set_dv_timings(struct file *file, void *fh,
>>   
>>   	timings->type = V4L2_DV_BT_656_1120;
>>   
>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "set new timings(%dx%d)\n",
>> +		 timings->bt.width, timings->bt.height);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -1383,6 +1403,7 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>>   			.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
>>   		};
>>   
>> +		v4l2_dbg(1, debug, &video->v4l2_dev, "fire source change event\n");
>>   		v4l2_event_queue(&video->vdev, &ev);
>>   	} else if (test_bit(VIDEO_STREAMING, &video->flags)) {
>>   		/* No resolution change so just restart streaming */
>> @@ -1715,6 +1736,7 @@ static int aspeed_video_init(struct aspeed_video *video)
>>   		dev_err(dev, "Unable to request IRQ %d\n", irq);
>>   		return rc;
>>   	}
>> +	dev_info(video->dev, "irq %d\n", irq);
>>   
>>   	video->eclk = devm_clk_get(dev, "eclk");
>>   	if (IS_ERR(video->eclk)) {
>> @@ -1751,6 +1773,8 @@ static int aspeed_video_init(struct aspeed_video *video)
>>   		rc = -ENOMEM;
>>   		goto err_release_reserved_mem;
>>   	}
>> +	dev_info(video->dev, "alloc mem size(%d) at %#x for jpeg header\n",
>> +		 VE_JPEG_HEADER_SIZE, video->jpeg.dma);
>>   
>>   	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
>>   
> You're using both v4l2_*() and dev_*() functions for printing messages.
> They come with different prefixes, and it'd be better to stick with either,
> not both.
Sure, I agree with you. Why I still have dev_*() here is v4l2_dev isn't 
ready yet before
v4l2_device_register(). I think it could better to keep dev_*() in dev's 
probe().

-- 
Best Regards
Jammy

