Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DA84456A9
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 16:57:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlSvm304nz2yn2
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 02:57:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Fri, 05 Nov 2021 02:57:23 AEDT
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlSvR6lDCz2y8P;
 Fri,  5 Nov 2021 02:57:23 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="218927945"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="218927945"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 08:54:14 -0700
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="468512031"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.209.121.122])
 ([10.209.121.122])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 08:54:14 -0700
Message-ID: <883dd517-7996-8c44-8cea-1c8838b367b6@linux.intel.com>
Date: Thu, 4 Nov 2021 08:54:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH] media: aspeed: use reset to replace clk off/on
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com,
 mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20211103054316.25272-1-jammy_huang@aspeedtech.com>
Content-Language: en-US
In-Reply-To: <20211103054316.25272-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

On 11/2/2021 10:43 PM, Jammy Huang wrote:
> reset should be more proper than clk off/on to bring HW back to good
> state.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed-video.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index fea5e4d0927e..10d182139809 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -23,6 +23,7 @@
>   #include <linux/workqueue.h>
>   #include <linux/debugfs.h>
>   #include <linux/ktime.h>
> +#include <linux/reset.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-dev.h>
>   #include <media/v4l2-device.h>
> @@ -220,6 +221,7 @@ struct aspeed_video {
>   	void __iomem *base;
>   	struct clk *eclk;
>   	struct clk *vclk;
> +	struct reset_control *reset;
>   
>   	struct device *dev;
>   	struct v4l2_ctrl_handler ctrl_handler;
> @@ -554,6 +556,13 @@ static void aspeed_video_on(struct aspeed_video *video)
>   	set_bit(VIDEO_CLOCKS_ON, &video->flags);
>   }
>   
> +static void aspeed_video_reset(struct aspeed_video *v)
> +{
> +	reset_control_assert(v->reset);
> +	udelay(100);
> +	reset_control_deassert(v->reset);
> +}
> +
>   static void aspeed_video_bufs_done(struct aspeed_video *video,
>   				   enum vb2_buffer_state state)
>   {
> @@ -574,7 +583,9 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>   	set_bit(VIDEO_RES_CHANGE, &video->flags);
>   	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>   
> -	aspeed_video_off(video);
> +	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
> +	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
> +	aspeed_video_reset(video);
>   	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
>   
>   	schedule_delayed_work(&video->res_work, delay);
> @@ -1507,8 +1518,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
>   		 * Need to force stop any DMA and try and get HW into a good
>   		 * state for future calls to start streaming again.
>   		 */
> -		aspeed_video_off(video);
> -		aspeed_video_on(video);
> +		aspeed_video_reset(video);

You can find the ECLK configuration in 'clk-aspeed.c' or in
'clk-ast2600.c' that it's coupled with the video engine reset (SCU04[6]
for AST2500 / SCU040[6] for AST2600). It means that if we call 
clk_disable() and clk_enable() through aspeed_video_off() and
aspeed_video_on(), the video engine reset will be implicitly asserted
and de-asserted by the clock driver so the reset mechanism is already in
the existing code.

Thanks,
Jae

>   		aspeed_video_init_regs(video);
>   
> @@ -1715,6 +1725,12 @@ static int aspeed_video_init(struct aspeed_video *video)
>   		return rc;
>   	}
>   
> +	video->reset = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(video->reset)) {
> +		dev_err(dev, "Unable to get reset\n");
> +		return PTR_ERR(video->reset);
> +	}
> +
>   	video->eclk = devm_clk_get(dev, "eclk");
>   	if (IS_ERR(video->eclk)) {
>   		dev_err(dev, "Unable to get ECLK\n");
> 
