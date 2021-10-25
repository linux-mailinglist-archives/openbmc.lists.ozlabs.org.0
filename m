Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E94390BF
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 10:00:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hd6nh2gWvz2xSH
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 19:00:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LctUGcKF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=LctUGcKF; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hd6nF3XxKz2xZ3;
 Mon, 25 Oct 2021 19:00:00 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 533A060E73;
 Mon, 25 Oct 2021 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635148796;
 bh=5e8CcLFm1qDgS/wgwYnzmqOSm5RsBKavM3oNKnOtT1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LctUGcKFb4E7hJXm4uZO0kJVfqj7pg1E0L0HJFjP4GgWfxNA2uVNLz2UQqV7y5xaW
 kcnWNWsckid3QYHrvqtYh/iwS28o6I8N9URO+ufxhHwqSMpZO4I22mG/fKbTnTXzLM
 yLqjyh3Lph1ELsr/MlziMspjLg0F9p/P9QPgvU7k=
Date: Mon, 25 Oct 2021 09:59:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v2] media: aspeed: add debugfs
Message-ID: <YXZj+m/fdYyPsIIK@kroah.com>
References: <20210929090024.8499-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929090024.8499-1-jammy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021 at 05:00:25PM +0800, Jammy Huang wrote:
> To show video real-time information as below:
> 
> Caputre:
>   Signal              : Unlock
>   Width               : 1920
>   Height              : 1080
>   FRC                 : 30
> 
> Performance:
>   Frame#              : 0
>   Frame Duration      :
>     Now               : 0
>     Min               : 0
>     Max               : 0
>   FPS(ms)             : 0
> 
> Change-Id: I483740c4df6db07a9261c18440472a0356512bb7
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed-video.c | 101 ++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 8b3939b8052d..c5c413844441 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -21,6 +21,8 @@
>  #include <linux/videodev2.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
> +#include <linux/debugfs.h>
> +#include <linux/ktime.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
> @@ -203,6 +205,14 @@ struct aspeed_video_buffer {
>  	struct list_head link;
>  };
>  
> +struct aspeed_video_perf {
> +	ktime_t last_sample;
> +	u32 totaltime;
> +	u32 duration;
> +	u32 duration_min;
> +	u32 duration_max;
> +};
> +
>  #define to_aspeed_video_buffer(x) \
>  	container_of((x), struct aspeed_video_buffer, vb)
>  
> @@ -241,6 +251,8 @@ struct aspeed_video {
>  	unsigned int frame_left;
>  	unsigned int frame_right;
>  	unsigned int frame_top;
> +
> +	struct aspeed_video_perf perf;
>  };
>  
>  #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
> @@ -444,6 +456,16 @@ static void aspeed_video_write(struct aspeed_video *video, u32 reg, u32 val)
>  		readl(video->base + reg));
>  }
>  
> +static void update_perf(struct aspeed_video_perf *p)
> +{
> +	p->duration =
> +		ktime_to_ms(ktime_sub(ktime_get(),  p->last_sample));
> +	p->totaltime += p->duration;
> +
> +	p->duration_max = max(p->duration, p->duration_max);
> +	p->duration_min = min(p->duration, p->duration_min);
> +}
> +
>  static int aspeed_video_start_frame(struct aspeed_video *video)
>  {
>  	dma_addr_t addr;
> @@ -482,6 +504,8 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>  	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>  			    VE_INTERRUPT_COMP_COMPLETE);
>  
> +	video->perf.last_sample = ktime_get();
> +
>  	aspeed_video_update(video, VE_SEQ_CTRL, 0,
>  			    VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP);
>  
> @@ -600,6 +624,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  		u32 frame_size = aspeed_video_read(video,
>  						   VE_JPEG_COMP_SIZE_READ_BACK);
>  
> +		update_perf(&video->perf);
> +
>  		spin_lock(&video->lock);
>  		clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>  		buf = list_first_entry_or_null(&video->buffers,
> @@ -760,6 +786,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>  	det->width = MIN_WIDTH;
>  	det->height = MIN_HEIGHT;
>  	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
> +	memset(&video->perf, 0, sizeof(video->perf));
>  
>  	do {
>  		if (tries) {
> @@ -1450,6 +1477,8 @@ static int aspeed_video_start_streaming(struct vb2_queue *q,
>  	struct aspeed_video *video = vb2_get_drv_priv(q);
>  
>  	video->sequence = 0;
> +	video->perf.duration_max = 0;
> +	video->perf.duration_min = 0xffffffff;
>  
>  	rc = aspeed_video_start_frame(video);
>  	if (rc) {
> @@ -1517,6 +1546,72 @@ static const struct vb2_ops aspeed_video_vb2_ops = {
>  	.buf_queue =  aspeed_video_buf_queue,
>  };
>  
> +#ifdef CONFIG_DEBUG_FS
> +static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
> +{
> +	struct aspeed_video *v = s->private;
> +
> +	seq_puts(s, "\n");
> +
> +	seq_printf(s, "  %-20s:\t%s\n", "Signal",
> +		   v->v4l2_input_status ? "Unlock" : "Lock");
> +	seq_printf(s, "  %-20s:\t%d\n", "Width", v->pix_fmt.width);
> +	seq_printf(s, "  %-20s:\t%d\n", "Height", v->pix_fmt.height);
> +	seq_printf(s, "  %-20s:\t%d\n", "FRC", v->frame_rate);
> +
> +	seq_puts(s, "\n");
> +
> +	seq_puts(s, "Performance:\n");
> +	seq_printf(s, "  %-20s:\t%d\n", "Frame#", v->sequence);
> +	seq_printf(s, "  %-20s:\n", "Frame Duration");
> +	seq_printf(s, "    %-18s:\t%d\n", "Now", v->perf.duration);
> +	seq_printf(s, "    %-18s:\t%d\n", "Min", v->perf.duration_min);
> +	seq_printf(s, "    %-18s:\t%d\n", "Max", v->perf.duration_max);
> +	seq_printf(s, "  %-20s:\t%d\n", "FPS(ms)", 1000/(v->perf.totaltime/v->sequence));
> +
> +
> +	return 0;
> +}
> +
> +int aspeed_video_proc_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, aspeed_video_debugfs_show, inode->i_private);
> +}
> +
> +static struct file_operations aspeed_video_debugfs_ops = {
> +	.owner   = THIS_MODULE,
> +	.open    = aspeed_video_proc_open,
> +	.read    = seq_read,
> +	.llseek  = seq_lseek,
> +	.release = single_release,
> +};
> +
> +static struct dentry *debugfs_entry;
> +
> +static void aspeed_video_debugfs_remove(struct aspeed_video *video)
> +{
> +	debugfs_remove_recursive(debugfs_entry);
> +	debugfs_entry = NULL;
> +}
> +
> +static int aspeed_video_debugfs_create(struct aspeed_video *video)
> +{
> +	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
> +						   video,
> +						   &aspeed_video_debugfs_ops);
> +	if (!debugfs_entry)
> +		aspeed_video_debugfs_remove(video);

This check will never happen, why are you making it?

There's no need to care if debugfs works or not, just create the file
and move on.  This function should not return anything.

> +
> +	return debugfs_entry == NULL ? -EIO : 0;
> +}
> +#else
> +static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
> +static int aspeed_video_debugfs_create(struct aspeed_video *video)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_DEBUG_FS */
> +
>  static int aspeed_video_setup_video(struct aspeed_video *video)
>  {
>  	const u64 mask = ~(BIT(V4L2_JPEG_CHROMA_SUBSAMPLING_444) |
> @@ -1708,6 +1803,10 @@ static int aspeed_video_probe(struct platform_device *pdev)
>  		return rc;
>  	}
>  
> +	rc = aspeed_video_debugfs_create(video);
> +	if (rc)
> +		dev_err(video->dev, "debugfs create failed\n");

As proof of this, you don't care if this doesn't work, you just print
out a message that was already printed out :(

thanks,

greg k-h
