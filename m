Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C434B475072
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 02:19:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDHTM5p28z2xZm
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 12:19:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NgMScKCA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=mchehab@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NgMScKCA; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD2170HWMz2xv8;
 Wed, 15 Dec 2021 02:12:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3CF6B81A56;
 Tue, 14 Dec 2021 15:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6601EC34605;
 Tue, 14 Dec 2021 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639494741;
 bh=Yy4WSR11rEbUUj8oSHYb5/v6Hcw0PnPE3YztZN+362Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NgMScKCA9mwR3E1bfQKuF/vcwttLrXydOhYQcxc1Ou2PrOHikaBZIzt8i5wGKA6sn
 layap6mjhielEd8nNBZqtHaVAtVc0oz0xvW58G+ppZ9jjA7Mz3bwCUYMy+eKMyGdq8
 s3RwQwlBtDlkKbZb3wsciWhqQzrRT77eInxJdCpPPe1V6WeFPyNjfAy1h67cZmUTWD
 j1Ss7xPv1uQ2D4bYwPI6D99sbiYApXa8GJG+yEvSP+y7gVjp2gl13vkbIjBLWMpSnA
 8WR11kAqZhNcZIdCW567Vy0EkJKy0ONjNNJMMrA4PM0LVVeQFu++x0Q5/byE0Bsci8
 TnWhqZYPUQOBw==
Date: Tue, 14 Dec 2021 16:12:16 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH] media: aspeed: Use runtime configuration
Message-ID: <20211214161216.607df557@coco.lan>
In-Reply-To: <20211207015544.1755-1-jammy_huang@aspeedtech.com>
References: <20211207015544.1755-1-jammy_huang@aspeedtech.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 15 Dec 2021 12:18:24 +1100
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
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

A different version of this patch was already applied. If it still makes
change, please rebase this one on the top of the media upstream and
re-send.

Thanks,
Mauro

Em Tue, 7 Dec 2021 09:55:44 +0800
Jammy Huang <jammy_huang@aspeedtech.com> escreveu:

> The aspeed video IP has some differences between SoC families. Currently
> the driver decides which registers to use at compile time, which means
> a single kernel can not be used between platforms.
> 
> Switch to using runtime configuration of the registers that vary between
> SoC families.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed-video.c | 71 ++++++++++++++++++++-------
>  1 file changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index d2335d669fb3..ba8ee82b38c3 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -75,11 +75,8 @@
>  #define  VE_SEQ_CTRL_CAP_BUSY		BIT(16)
>  #define  VE_SEQ_CTRL_COMP_BUSY		BIT(18)
>  
> -#ifdef CONFIG_MACH_ASPEED_G4
> -#define  VE_SEQ_CTRL_JPEG_MODE		BIT(8)	/* AST2400 */
> -#else
> -#define  VE_SEQ_CTRL_JPEG_MODE		BIT(13)	/* AST2500/2600 */
> -#endif
> +#define AST2500_VE_SEQ_CTRL_JPEG_MODE	BIT(13)
> +#define AST2400_VE_SEQ_CTRL_JPEG_MODE	BIT(8)
>  
>  #define VE_CTRL				0x008
>  #define  VE_CTRL_HSYNC_POL		BIT(0)
> @@ -136,9 +133,8 @@
>  #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
>  #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
>  
> -#define VE_OFFSET_COMP_STREAM		0x078
> -
> -#define VE_JPEG_COMP_SIZE_READ_BACK	0x084
> +#define AST2400_VE_COMP_SIZE_READ_BACK	0x078
> +#define AST2600_VE_COMP_SIZE_READ_BACK	0x084
>  
>  #define VE_SRC_LR_EDGE_DET		0x090
>  #define  VE_SRC_LR_EDGE_DET_LEFT	GENMASK(11, 0)
> @@ -233,6 +229,8 @@ struct aspeed_video {
>  	struct video_device vdev;
>  	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
>  
> +	struct aspeed_video_config config;
> +
>  	wait_queue_head_t wait;
>  	spinlock_t lock;		/* buffer list lock */
>  	struct delayed_work res_work;
> @@ -258,6 +256,30 @@ struct aspeed_video {
>  
>  #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
>  
> +struct aspeed_video_config {
> +	u32 version;
> +	u32 jpeg_mode;
> +	u32 comp_size_read;
> +};
> +
> +static const struct aspeed_video_config ast2400_config = {
> +	.version = 4,
> +	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
> +	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
> +};
> +
> +static const struct aspeed_video_config ast2500_config = {
> +	.version = 5,
> +	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
> +	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
> +};
> +
> +static const struct aspeed_video_config ast2600_config = {
> +	.version = 6,
> +	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
> +	.comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
> +};
> +
>  static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
>  	0xe0ffd8ff, 0x464a1000, 0x01004649, 0x60000101, 0x00006000, 0x0f00feff,
>  	0x00002d05, 0x00000000, 0x00000000, 0x00dbff00
> @@ -640,7 +662,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>  		struct aspeed_video_buffer *buf;
>  		u32 frame_size = aspeed_video_read(video,
> -						   VE_JPEG_COMP_SIZE_READ_BACK);
> +						   video->config.comp_size_read);
>  
>  		update_perf(&video->perf);
>  
> @@ -973,7 +995,7 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
>  		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>  		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
>  	u32 ctrl = 0;
> -	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
> +	u32 seq_ctrl = video->config.jpeg_mode;
>  
>  	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
>  		 video->frame_rate);
> @@ -993,7 +1015,7 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
>  
>  	/* Set control registers */
>  	aspeed_video_update(video, VE_SEQ_CTRL,
> -			    VE_SEQ_CTRL_JPEG_MODE | VE_SEQ_CTRL_YUV420,
> +			    video->config.jpeg_mode | VE_SEQ_CTRL_YUV420,
>  			    seq_ctrl);
>  	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
>  	aspeed_video_update(video, VE_COMP_CTRL,
> @@ -1790,8 +1812,18 @@ static int aspeed_video_init(struct aspeed_video *video)
>  	return rc;
>  }
>  
> +static const struct of_device_id aspeed_video_of_match[] = {
> +	{ .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
> +	{ .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
> +	{ .compatible = "aspeed,ast2600-video-engine", .data = &ast2600_config },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
> +
>  static int aspeed_video_probe(struct platform_device *pdev)
>  {
> +	const struct aspeed_video_config *config;
> +	const struct of_device_id *match;
>  	int rc;
>  	struct resource *res;
>  	struct aspeed_video *video =
> @@ -1815,6 +1847,13 @@ static int aspeed_video_probe(struct platform_device *pdev)
>  	if (IS_ERR(video->base))
>  		return PTR_ERR(video->base);
>  
> +	match = of_match_node(aspeed_video_of_match, pdev->dev.of_node);
> +	if (!match)
> +		return -EINVAL;
> +
> +	config = match->data;
> +	video->config = *config;
> +
>  	rc = aspeed_video_init(video);
>  	if (rc)
>  		return rc;
> @@ -1828,6 +1867,8 @@ static int aspeed_video_probe(struct platform_device *pdev)
>  
>  	aspeed_video_debugfs_create(video);
>  
> +	dev_info(video->dev, "compatible for g%d\n", config->version);
> +
>  	return 0;
>  }
>  
> @@ -1860,14 +1901,6 @@ static int aspeed_video_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id aspeed_video_of_match[] = {
> -	{ .compatible = "aspeed,ast2400-video-engine" },
> -	{ .compatible = "aspeed,ast2500-video-engine" },
> -	{ .compatible = "aspeed,ast2600-video-engine" },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
> -
>  static struct platform_driver aspeed_video_driver = {
>  	.driver = {
>  		.name = DEVICE_NAME,



Thanks,
Mauro
