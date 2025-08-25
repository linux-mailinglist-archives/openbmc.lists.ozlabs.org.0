Return-Path: <openbmc+bounces-510-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AA1B34FCB
	for <lists+openbmc@lfdr.de>; Tue, 26 Aug 2025 01:51:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9ndC5NBdz3cm7;
	Tue, 26 Aug 2025 09:51:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756131563;
	cv=none; b=EgMe8jrir/dunaN7+IjhBOVUQWZhpHSD0Tm3WH7zGDvsgtF0Ctw9rBzH9MAMNLyGazpdv9Dpr4Lu58OCHo5TtmbjfQAepnb82jyAD8UOlE0LxuSANViOML6JhrcQzPlAWGeRkIqjwqJeussk0VENTCApNfqda06Q5jXQxocghx5dfEUQt+RiADZrUvmbWnwwpgQq3u29yxbXRQDcn9I0m4+YlcMfrzkTeeA8dV8Uxc6NMvijMBD6qn8AB2aTU+rh8S5o2nbEO8U7ra1HrFot5IYdXy1vdX7vC8KWb+APMxQ4OL81vH2S1+2I7BcAaojJlN4DSJGkk9idTrsO3QxM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756131563; c=relaxed/relaxed;
	bh=oQqVQRqYdgNweY6XodykhXVA88vzrM2WNBhEzWOALkI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=TL3ToHwftnZIpOTz6w3TaARnksrEsKYOGqWLi1N4iemTVQJFcZ6ZgGBbm7jODyEvpQGyNLBCrrmw57CjEZYRbJyKkdIWPn1AaTajEajSxJs9yZaGFmLg9YW3eDqlFUxBwxhJA+j40CdI2CS7FxmHgqaQU/yYwKBoi3LrAEDpzDAokjmdliSbDQNp5FkUo42Uv+Ya2B7WL8kIgYLZusKwEqEargZgkWxc7bO0Sb3J3P/hngI0x6ABY4KYgRix+xD61YyUiA9HV7Jkt2zlzgD6Tali2qxSSq9d9GEEadSnCIDOat4VbzWs8dEvheGfXRqwoD9W9/pYJo/BWptQk/tAdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I6X70Mzk; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=hverkuil+cisco@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I6X70Mzk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=hverkuil+cisco@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9Xwp3DQlz3cjm;
	Tue, 26 Aug 2025 00:19:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D44E7601F6;
	Mon, 25 Aug 2025 14:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5AFC113D0;
	Mon, 25 Aug 2025 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131556;
	bh=pKnzrmU2im87vPYyT9k12MpOMguymJTGkL2f1FNL7sg=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=I6X70Mzk68dV74OLkQLI7EOv+MkAHb8W7Qzih4xxEwqbyJYuPGLeiZcV1HHTC8Qrv
	 LOFFEO6/Da+cZbXzWGsDamho+Hkc6fCQMj6pg+D4Zxagg1Eu8paKvEnPeXWxL1rgjP
	 41cqHVFs6Tl9SjxaI/ZmPXtryD1XxcNDkpoq+q/hIoMN1LwHp3B10QqRcCknFClo6C
	 1wjbQmcZO6bdWBX04t35TErbPHsSevhDFV3c7ZDZr/QyqotWQX9ziwd28gfTzo5bkQ
	 lAP0cP2FOUTFOT7AqUfTsrAlCgVYTYRFQeNOIplvy+5YJOtXRwYPU79TDS8Rk8Z69E
	 r1Mmnx7RLVdTw==
Message-ID: <495e8ffa-c826-45ff-a3fa-ec6e406f6b2c@kernel.org>
Date: Mon, 25 Aug 2025 16:19:12 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 1/1] media: aspeed: Allow to capture from SoC display
 (GFX)
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com,
 mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250603064500.94048-1-jammy_huang@aspeedtech.com>
 <20250603064500.94048-2-jammy_huang@aspeedtech.com>
Content-Language: en-US, nl
In-Reply-To: <20250603064500.94048-2-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jammy,

Apologies for the long delay. It looks good, except for a few missing checks
when changing inputs, see below.

On 03/06/2025 08:45, Jammy Huang wrote:
> ASPEED BMC IC has 2 different display engines. Please find AST2600's
> datasheet to get detailed information.
> 
> 1. VGA on PCIe
> 2. SoC Display (GFX)
> 
> By default, video engine (VE) will capture video from VGA. This patch
> adds an option to capture video from GFX with standard ioctl,
> vidioc_s_input.
> 
> An enum, aspeed_video_input, is added for this purpose.
> enum aspeed_video_input {
> 	VIDEO_INPUT_VGA = 0,
> 	VIDEO_INPUT_GFX,
> 	VIDEO_INPUT_MAX
> };
> 
> To test this feature, you will need to enable GFX first. Please refer to
> ASPEED's SDK_User_Guide, 6.3.x Soc Display driver, for more information.
> In your application, you will need to use v4l2 ioctl, VIDIOC_S_INPUT, as
> below to select before start streaming.
> 
> int rc;
> struct v4l2_input input;
> 
> input.index = VIDEO_INPUT_GFX;
> rc = ioctl(fd, VIDIOC_S_INPUT, &input);
> if (rc < 0)
> {
> 	...
> }
> 
> Link: https://github.com/AspeedTech-BMC/openbmc/releases
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed/aspeed-video.c | 189 ++++++++++++++++---
>  include/uapi/linux/aspeed-video.h            |   7 +
>  2 files changed, 168 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index 54cae0da9aca..97392ceed083 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -4,6 +4,7 @@
>  
>  #include <linux/atomic.h>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -25,6 +26,8 @@
>  #include <linux/workqueue.h>
>  #include <linux/debugfs.h>
>  #include <linux/ktime.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
> @@ -203,6 +206,25 @@
>  #define VE_MEM_RESTRICT_START		0x310
>  #define VE_MEM_RESTRICT_END		0x314
>  
> +/* SCU's registers */
> +#define SCU_MISC_CTRL			0xC0
> +#define  SCU_DPLL_SOURCE		BIT(20)
> +
> +/* GFX's registers */
> +#define GFX_CTRL			0x60
> +#define  GFX_CTRL_ENABLE		BIT(0)
> +#define  GFX_CTRL_FMT			GENMASK(9, 7)
> +
> +#define GFX_H_DISPLAY			0x70
> +#define  GFX_H_DISPLAY_DE		GENMASK(28, 16)
> +#define  GFX_H_DISPLAY_TOTAL		GENMASK(12, 0)
> +
> +#define GFX_V_DISPLAY			0x78
> +#define  GFX_V_DISPLAY_DE		GENMASK(27, 16)
> +#define  GFX_V_DISPLAY_TOTAL		GENMASK(11, 0)
> +
> +#define GFX_DISPLAY_ADDR		0x80
> +
>  /*
>   * VIDEO_MODE_DETECT_DONE:	a flag raised if signal lock
>   * VIDEO_RES_CHANGE:		a flag raised if res_change work on-going
> @@ -262,6 +284,7 @@ struct aspeed_video_perf {
>  /*
>   * struct aspeed_video - driver data
>   *
> + * version:		holds the version of aspeed SoC
>   * res_work:		holds the delayed_work for res-detection if unlock
>   * buffers:		holds the list of buffer queued from user
>   * flags:		holds the state of video
> @@ -273,6 +296,7 @@ struct aspeed_video_perf {
>   * yuv420:		a flag raised if JPEG subsampling is 420
>   * format:		holds the video format
>   * hq_mode:		a flag raised if HQ is enabled. Only for VIDEO_FMT_ASPEED
> + * input:		holds the video input
>   * frame_rate:		holds the frame_rate
>   * jpeg_quality:	holds jpeq's quality (0~11)
>   * jpeg_hq_quality:	holds hq's quality (1~12) only if hq_mode enabled
> @@ -298,6 +322,9 @@ struct aspeed_video {
>  	struct video_device vdev;
>  	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
>  
> +	struct regmap *scu;
> +	struct regmap *gfx;
> +	u32 version;
>  	u32 jpeg_mode;
>  	u32 comp_size_read;
>  
> @@ -316,6 +343,7 @@ struct aspeed_video {
>  	bool yuv420;
>  	enum aspeed_video_format format;
>  	bool hq_mode;
> +	enum aspeed_video_input input;
>  	unsigned int frame_rate;
>  	unsigned int jpeg_quality;
>  	unsigned int jpeg_hq_quality;
> @@ -331,21 +359,25 @@ struct aspeed_video {
>  #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
>  
>  struct aspeed_video_config {
> +	u32 version;
>  	u32 jpeg_mode;
>  	u32 comp_size_read;
>  };
>  
>  static const struct aspeed_video_config ast2400_config = {
> +	.version = 4,
>  	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
>  	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
>  };
>  
>  static const struct aspeed_video_config ast2500_config = {
> +	.version = 5,
>  	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
>  	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
>  };
>  
>  static const struct aspeed_video_config ast2600_config = {
> +	.version = 6,
>  	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
>  	.comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
>  };
> @@ -485,6 +517,7 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
>  
>  static const char * const format_str[] = {"Standard JPEG",
>  	"Aspeed JPEG"};
> +static const char * const input_str[] = {"HOST VGA", "BMC GFX"};
>  
>  static unsigned int debug;
>  
> @@ -609,6 +642,14 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>  		aspeed_video_free_buf(video, &video->bcd);
>  	}
>  
> +	if (video->input == VIDEO_INPUT_GFX) {
> +		u32 val;
> +
> +		// update input buffer address as gfx's
> +		regmap_read(video->gfx, GFX_DISPLAY_ADDR, &val);
> +		aspeed_video_write(video, VE_TGS_0, val);
> +	}
> +
>  	spin_lock_irqsave(&video->lock, flags);
>  	buf = list_first_entry_or_null(&video->buffers,
>  				       struct aspeed_video_buffer, link);
> @@ -1026,9 +1067,23 @@ static void aspeed_video_get_timings(struct aspeed_video *v,
>  	}
>  }
>  
> +static void aspeed_video_get_resolution_gfx(struct aspeed_video *video,
> +					    struct v4l2_bt_timings *det)
> +{
> +	u32 h_val, v_val;
> +
> +	regmap_read(video->gfx, GFX_H_DISPLAY, &h_val);
> +	regmap_read(video->gfx, GFX_V_DISPLAY, &v_val);
> +
> +	det->width = FIELD_GET(GFX_H_DISPLAY_DE, h_val) + 1;
> +	det->height = FIELD_GET(GFX_V_DISPLAY_DE, v_val) + 1;
> +	video->v4l2_input_status = 0;
> +}
> +
>  #define res_check(v) test_and_clear_bit(VIDEO_MODE_DETECT_DONE, &(v)->flags)
>  
> -static void aspeed_video_get_resolution(struct aspeed_video *video)
> +static void aspeed_video_get_resolution_vga(struct aspeed_video *video,
> +					    struct v4l2_bt_timings *det)
>  {
>  	bool invalid_resolution = true;
>  	int rc;
> @@ -1036,7 +1091,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>  	u32 mds;
>  	u32 src_lr_edge;
>  	u32 src_tb_edge;
> -	struct v4l2_bt_timings *det = &video->detected_timings;
>  
>  	det->width = MIN_WIDTH;
>  	det->height = MIN_HEIGHT;
> @@ -1113,14 +1167,20 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>  
>  	aspeed_video_get_timings(video, det);
>  
> -	/*
> -	 * Enable mode-detect watchdog, resolution-change watchdog and
> -	 * automatic compression after frame capture.
> -	 */
> +	/* Enable mode-detect watchdog, resolution-change watchdog */
>  	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>  			    VE_INTERRUPT_MODE_DETECT_WD);
> -	aspeed_video_update(video, VE_SEQ_CTRL, 0,
> -			    VE_SEQ_CTRL_AUTO_COMP | VE_SEQ_CTRL_EN_WATCHDOG);
> +	aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_EN_WATCHDOG);
> +}
> +
> +static void aspeed_video_get_resolution(struct aspeed_video *video)
> +{
> +	struct v4l2_bt_timings *det = &video->detected_timings;
> +
> +	if (video->input == VIDEO_INPUT_GFX)
> +		aspeed_video_get_resolution_gfx(video, det);
> +	else
> +		aspeed_video_get_resolution_vga(video, det);
>  
>  	v4l2_dbg(1, debug, &video->v4l2_dev, "Got resolution: %dx%d\n",
>  		 det->width, det->height);
> @@ -1156,7 +1216,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>  	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
>  
>  	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
> -	if (size < DIRECT_FETCH_THRESHOLD) {
> +	if (video->input == VIDEO_INPUT_VGA && size < DIRECT_FETCH_THRESHOLD) {
>  		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Sync Mode\n");
>  		aspeed_video_write(video, VE_TGS_0,
>  				   FIELD_PREP(VE_TGS_FIRST,
> @@ -1171,10 +1231,20 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>  				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
>  				    VE_CTRL_INT_DE);
>  	} else {
> +		u32 ctrl, val, bpp;
> +
>  		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
> +		ctrl = VE_CTRL_DIRECT_FETCH;
> +		if (video->input == VIDEO_INPUT_GFX) {
> +			regmap_read(video->gfx, GFX_CTRL, &val);
> +			bpp = FIELD_GET(GFX_CTRL_FMT, val) ? 32 : 16;
> +			if (bpp == 16)
> +				ctrl |= VE_CTRL_INT_DE;
> +			aspeed_video_write(video, VE_TGS_1, act->width * (bpp >> 3));
> +		}
>  		aspeed_video_update(video, VE_CTRL,
>  				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
> -				    VE_CTRL_DIRECT_FETCH);
> +				    ctrl);
>  	}
>  
>  	size *= 4;
> @@ -1207,6 +1277,22 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>  		aspeed_video_free_buf(video, &video->srcs[0]);
>  }
>  
> +/*
> + * Update relative parameters when timing changed.
> + *
> + * @video: the struct of aspeed_video
> + * @timings: the new timings
> + */
> +static void aspeed_video_update_timings(struct aspeed_video *video, struct v4l2_bt_timings *timings)
> +{
> +	video->active_timings = *timings;
> +	aspeed_video_set_resolution(video);
> +
> +	video->pix_fmt.width = timings->width;
> +	video->pix_fmt.height = timings->height;
> +	video->pix_fmt.sizeimage = video->max_compressed_size;
> +}
> +
>  static void aspeed_video_update_regs(struct aspeed_video *video)
>  {
>  	u8 jpeg_hq_quality = clamp((int)video->jpeg_hq_quality - 1, 0,
> @@ -1219,6 +1305,8 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
>  	u32 ctrl = 0;
>  	u32 seq_ctrl = 0;
>  
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "input(%s)\n",
> +		 input_str[video->input]);
>  	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
>  		 video->frame_rate);
>  	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
> @@ -1234,6 +1322,9 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
>  	else
>  		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
>  
> +	if (video->input == VIDEO_INPUT_VGA)
> +		ctrl |= VE_CTRL_AUTO_OR_CURSOR;
> +
>  	if (video->frame_rate)
>  		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
>  
> @@ -1252,7 +1343,9 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
>  	aspeed_video_update(video, VE_SEQ_CTRL,
>  			    video->jpeg_mode | VE_SEQ_CTRL_YUV420,
>  			    seq_ctrl);
> -	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
> +	aspeed_video_update(video, VE_CTRL,
> +			    VE_CTRL_FRC | VE_CTRL_AUTO_OR_CURSOR |
> +			    VE_CTRL_SOURCE, ctrl);
>  	aspeed_video_update(video, VE_COMP_CTRL,
>  			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
>  			    VE_COMP_CTRL_EN_HQ | VE_COMP_CTRL_HQ_DCT_LUM |
> @@ -1280,6 +1373,7 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>  	aspeed_video_write(video, VE_JPEG_ADDR, video->jpeg.dma);
>  
>  	/* Set control registers */
> +	aspeed_video_write(video, VE_SEQ_CTRL, VE_SEQ_CTRL_AUTO_COMP);
>  	aspeed_video_write(video, VE_CTRL, ctrl);
>  	aspeed_video_write(video, VE_COMP_CTRL, VE_COMP_CTRL_RSVD);
>  
> @@ -1311,12 +1405,7 @@ static void aspeed_video_start(struct aspeed_video *video)
>  	aspeed_video_get_resolution(video);
>  
>  	/* Set timings since the device is being opened for the first time */
> -	video->active_timings = video->detected_timings;
> -	aspeed_video_set_resolution(video);
> -
> -	video->pix_fmt.width = video->active_timings.width;
> -	video->pix_fmt.height = video->active_timings.height;
> -	video->pix_fmt.sizeimage = video->max_compressed_size;
> +	aspeed_video_update_timings(video, &video->detected_timings);
>  }
>  
>  static void aspeed_video_stop(struct aspeed_video *video)
> @@ -1401,10 +1490,10 @@ static int aspeed_video_enum_input(struct file *file, void *fh,
>  {
>  	struct aspeed_video *video = video_drvdata(file);
>  
> -	if (inp->index)
> +	if (inp->index >= VIDEO_INPUT_MAX)
>  		return -EINVAL;
>  
> -	strscpy(inp->name, "Host VGA capture", sizeof(inp->name));
> +	sprintf(inp->name, "%s capture", input_str[inp->index]);
>  	inp->type = V4L2_INPUT_TYPE_CAMERA;
>  	inp->capabilities = V4L2_IN_CAP_DV_TIMINGS;
>  	inp->status = video->v4l2_input_status;
> @@ -1414,16 +1503,47 @@ static int aspeed_video_enum_input(struct file *file, void *fh,
>  
>  static int aspeed_video_get_input(struct file *file, void *fh, unsigned int *i)
>  {
> -	*i = 0;
> +	struct aspeed_video *video = video_drvdata(file);
> +
> +	*i = video->input;
>  
>  	return 0;
>  }
>  
>  static int aspeed_video_set_input(struct file *file, void *fh, unsigned int i)
>  {
> -	if (i)
> +	struct aspeed_video *video = video_drvdata(file);
> +
> +	if (i >= VIDEO_INPUT_MAX)
>  		return -EINVAL;
>  
> +	if (IS_ERR(video->scu)) {
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "%s: scu isn't ready for input-control\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (IS_ERR(video->gfx) && i == VIDEO_INPUT_GFX) {
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "%s: gfx isn't ready for GFX input\n", __func__);
> +		return -EINVAL;
> +	}

This need extra checks: one to just return 0 if the new input is the same as the old one:

	if (video->input == i)
		return 0;

followed by a check to see if we're streaming:

	if (vb2_is_busy(&video->queue))
		return -EBUSY;

Changing the input will also update the format, which is not allowed while streaming.

Regards,

	Hans

> +
> +	video->input = i;
> +
> +	if (video->version == 6) {
> +		/* modify dpll source per current input */
> +		if (video->input == VIDEO_INPUT_VGA)
> +			regmap_update_bits(video->scu, SCU_MISC_CTRL, SCU_DPLL_SOURCE, 0);
> +		else
> +			regmap_update_bits(video->scu, SCU_MISC_CTRL, SCU_DPLL_SOURCE, SCU_DPLL_SOURCE);
> +	}
> +
> +	aspeed_video_update_regs(video);
> +
> +	/* update signal status */
> +	aspeed_video_get_resolution(video);
> +	if (!video->v4l2_input_status)
> +		aspeed_video_update_timings(video, &video->detected_timings);
> +
>  	return 0;
>  }
>  
> @@ -1527,13 +1647,7 @@ static int aspeed_video_set_dv_timings(struct file *file, void *fh,
>  	if (vb2_is_busy(&video->queue))
>  		return -EBUSY;
>  
> -	video->active_timings = timings->bt;
> -
> -	aspeed_video_set_resolution(video);
> -
> -	video->pix_fmt.width = timings->bt.width;
> -	video->pix_fmt.height = timings->bt.height;
> -	video->pix_fmt.sizeimage = video->max_compressed_size;
> +	aspeed_video_update_timings(video, &timings->bt);
>  
>  	timings->type = V4L2_DV_BT_656_1120;
>  
> @@ -1909,6 +2023,7 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
>  	val08 = aspeed_video_read(v, VE_CTRL);
>  	if (FIELD_GET(VE_CTRL_DIRECT_FETCH, val08)) {
>  		seq_printf(s, "  %-20s:\tDirect fetch\n", "Mode");
> +		seq_printf(s, "  %-20s:\t%s\n", "Input", input_str[v->input]);
>  		seq_printf(s, "  %-20s:\t%s\n", "VGA bpp mode",
>  			   FIELD_GET(VE_CTRL_INT_DE, val08) ? "16" : "32");
>  	} else {
> @@ -2068,12 +2183,29 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>  	return 0;
>  }
>  
> +/*
> + * Get regmap without checking res, such as clk/reset, that could lead to
> + * conflict.
> + */
> +static struct regmap *aspeed_regmap_lookup(struct device_node *np, const char *property)
> +{
> +	struct device_node *syscon_np __free(device_node) = of_parse_phandle(np, property, 0);
> +
> +	if (!syscon_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	return device_node_to_regmap(syscon_np);
> +}
> +
>  static int aspeed_video_init(struct aspeed_video *video)
>  {
>  	int irq;
>  	int rc;
>  	struct device *dev = video->dev;
>  
> +	video->scu = aspeed_regmap_lookup(dev->of_node, "aspeed,scu");
> +	video->gfx = aspeed_regmap_lookup(dev->of_node, "aspeed,gfx");
> +
>  	irq = irq_of_parse_and_map(dev->of_node, 0);
>  	if (!irq) {
>  		dev_err(dev, "Unable to find IRQ\n");
> @@ -2165,6 +2297,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
>  	if (!config)
>  		return -ENODEV;
>  
> +	video->version = config->version;
>  	video->jpeg_mode = config->jpeg_mode;
>  	video->comp_size_read = config->comp_size_read;
>  
> diff --git a/include/uapi/linux/aspeed-video.h b/include/uapi/linux/aspeed-video.h
> index 6586a65548c4..15168e8c931e 100644
> --- a/include/uapi/linux/aspeed-video.h
> +++ b/include/uapi/linux/aspeed-video.h
> @@ -8,6 +8,13 @@
>  
>  #include <linux/v4l2-controls.h>
>  
> +/* aspeed video's input types */
> +enum aspeed_video_input {
> +	VIDEO_INPUT_VGA = 0,
> +	VIDEO_INPUT_GFX,
> +	VIDEO_INPUT_MAX
> +};
> +
>  #define V4L2_CID_ASPEED_HQ_MODE			(V4L2_CID_USER_ASPEED_BASE  + 1)
>  #define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(V4L2_CID_USER_ASPEED_BASE  + 2)
>  


