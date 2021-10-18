Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54B4313F2
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 12:00:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXsn86STbz2yn9
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 21:00:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXsmv0lRnz2xZL;
 Mon, 18 Oct 2021 20:59:58 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aef76.dynamic.kabel-deutschland.de
 [95.90.239.118])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7009761E5FE33;
 Mon, 18 Oct 2021 11:59:55 +0200 (CEST)
Subject: Re: [PATCH v2 3/7] media: aspeed: add more debug log message
To: Jammy Huang <jammy_huang@aspeedtech.com>
References: <20211018092207.13336-1-jammy_huang@aspeedtech.com>
 <20211018092207.13336-4-jammy_huang@aspeedtech.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <8212f2f5-d661-b598-1490-0ad5266ff2ca@molgen.mpg.de>
Date: Mon, 18 Oct 2021 11:59:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018092207.13336-4-jammy_huang@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jammy:


Am 18.10.21 um 11:22 schrieb Jammy Huang:

Nit (summary/suject:: message*s*

Could you add an excerpt of the new log messages please?


Kind regards,

Paul


> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed-video.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 642ca96c8c52..24ca07f40f14 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -461,12 +461,17 @@ static void aspeed_video_write(struct aspeed_video *video, u32 reg, u32 val)
>   
>   static void update_perf(struct aspeed_video_perf *p)
>   {
> +	struct aspeed_video *v = container_of(p, struct aspeed_video,
> +					      perf);
> +
>   	p->duration =
>   		ktime_to_ms(ktime_sub(ktime_get(),  p->last_sample));
>   	p->totaltime += p->duration;
>   
>   	p->duration_max = max(p->duration, p->duration_max);
>   	p->duration_min = min(p->duration, p->duration_min);
> +	v4l2_dbg(2, debug, &v->v4l2_dev, "time consumed: %d ms\n",
> +		 p->duration);
>   }
>   
>   static int aspeed_video_start_frame(struct aspeed_video *video)
> @@ -593,6 +598,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   	struct aspeed_video *video = arg;
>   	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
>   
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "irq sts=%#x %s%s%s%s\n", sts,
> +		 sts & VE_INTERRUPT_MODE_DETECT_WD ? ", unlock" : "",
> +		 sts & VE_INTERRUPT_MODE_DETECT ? ", lock" : "",
> +		 sts & VE_INTERRUPT_CAPTURE_COMPLETE ? ", capture-done" : "",
> +		 sts & VE_INTERRUPT_COMP_COMPLETE ? ", comp-done" : "");
> +
>   	/*
>   	 * Resolution changed or signal was lost; reset the engine and
>   	 * re-initialize
> @@ -910,6 +921,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   
>   	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
>   	if (size < DIRECT_FETCH_THRESHOLD) {
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Sync Mode\n");
>   		aspeed_video_write(video, VE_TGS_0,
>   				   FIELD_PREP(VE_TGS_FIRST,
>   					      video->frame_left - 1) |
> @@ -921,6 +933,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   					      video->frame_bottom + 1));
>   		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
>   	} else {
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
>   		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>   	}
>   
> @@ -937,6 +950,10 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   		if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
>   			goto err_mem;
>   
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "src buf0 addr(%#x) size(%d)\n",
> +			 video->srcs[0].dma, video->srcs[0].size);
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "src buf1 addr(%#x) size(%d)\n",
> +			 video->srcs[1].dma, video->srcs[1].size);
>   		aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
>   		aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
>   	}
> @@ -1201,6 +1218,9 @@ static int aspeed_video_set_dv_timings(struct file *file, void *fh,
>   
>   	timings->type = V4L2_DV_BT_656_1120;
>   
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "set new timings(%dx%d)\n",
> +		 timings->bt.width, timings->bt.height);
> +
>   	return 0;
>   }
>   
> @@ -1383,6 +1403,7 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>   			.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
>   		};
>   
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "fire source change event\n");
>   		v4l2_event_queue(&video->vdev, &ev);
>   	} else if (test_bit(VIDEO_STREAMING, &video->flags)) {
>   		/* No resolution change so just restart streaming */
> @@ -1718,6 +1739,7 @@ static int aspeed_video_init(struct aspeed_video *video)
>   		dev_err(dev, "Unable to request IRQ %d\n", irq);
>   		return rc;
>   	}
> +	dev_info(video->dev, "irq %d\n", irq);
>   
>   	video->eclk = devm_clk_get(dev, "eclk");
>   	if (IS_ERR(video->eclk)) {
> @@ -1754,6 +1776,8 @@ static int aspeed_video_init(struct aspeed_video *video)
>   		rc = -ENOMEM;
>   		goto err_release_reserved_mem;
>   	}
> +	dev_info(video->dev, "alloc mem size(%d) at %#x for jpeg header\n",
> +		 VE_JPEG_HEADER_SIZE, video->jpeg.dma);
>   
>   	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
>   
> 
