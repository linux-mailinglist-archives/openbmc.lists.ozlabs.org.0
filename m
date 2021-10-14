Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C042D2E7
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 08:48:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVKjW6QCZz301j
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 17:48:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVKjD55Dgz2yJV;
 Thu, 14 Oct 2021 17:48:00 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5ae921.dynamic.kabel-deutschland.de
 [95.90.233.33])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id F077461E64760;
 Thu, 14 Oct 2021 08:47:56 +0200 (CEST)
Subject: Re: [PATCH 4/6] media: aspeed: Support aspeed mode to reduce
 compressed data
To: Jammy Huang <jammy_huang@aspeedtech.com>
References: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
 <20211014034819.2283-5-jammy_huang@aspeedtech.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <ddb1e6dc-6b4f-4f67-9122-dae3dab1ae65@molgen.mpg.de>
Date: Thu, 14 Oct 2021 08:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211014034819.2283-5-jammy_huang@aspeedtech.com>
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

Dear Jammy,


Am 14.10.21 um 05:48 schrieb Jammy Huang:
> aspeed support differential jpeg format which only compress the parts

support*s*

> which are changed. In this way, it reduces both the amount of data to be
> transferred by network and those to be decoded on the client side.

Please mention the datasheet name and revision and section, where this 
functionality is described.

Which chips support it?

> 4 new ctrls are added:
> *Aspeed JPEG Format: to control aspeed's partial jpeg on/off
> *Aspeed Compression Mode: to control aspeed's compression mode
> *Aspeed HQ Mode: to control aspeed's HQ mode on/off
> *Aspeed HQ Quality: to control the quality of aspeed's HQ mode

Please add a space after the bullet points.

Excuse my ignorance, how can these options be controlled?

> Aspeed JPEG Format requires an additional buffer, called bcd, to store
> the information that which macro block in the new frame is different

s/that which/which/

> from the old one.
> 
> To have bcd correctly working, we need to swap the buffers for src0/1 to
> make src1 refer to previous frame and src0 to the coming new frame.

How did you test it? What do the clients need to support?

Did you test, how much bandwidth is saved? Some numbers would be nice.

> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed-video.c | 210 +++++++++++++++++++++++---
>   1 file changed, 193 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 3b5a3935325d..6b887fcaab7c 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -31,6 +31,11 @@
>   #include <media/v4l2-ioctl.h>
>   #include <media/videobuf2-dma-contig.h>
>   
> +#define ASPEED_CID_CUSTOM_BASE			(V4L2_CID_USER_BASE | 0xf000)
> +#define V4L2_CID_ASPEED_FORMAT			(ASPEED_CID_CUSTOM_BASE  + 1)
> +#define V4L2_CID_ASPEED_COMPRESSION_MODE	(ASPEED_CID_CUSTOM_BASE  + 2)
> +#define V4L2_CID_ASPEED_HQ_MODE			(ASPEED_CID_CUSTOM_BASE  + 3)
> +#define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(ASPEED_CID_CUSTOM_BASE  + 4)
>   
>   #define LOG_REG		BIT(4)
>   #define LOG_DEBUG	BIT(3)
> @@ -67,6 +72,7 @@
>   
>   #define VE_MAX_SRC_BUFFER_SIZE		0x8ca000 /* 1920 * 1200, 32bpp */
>   #define VE_JPEG_HEADER_SIZE		0x006000 /* 512 * 12 * 4 */
> +#define VE_BCD_BUFF_SIZE		0x100000
>   
>   #define VE_PROTECTION_KEY		0x000
>   #define  VE_PROTECTION_KEY_UNLOCK	0x1a038aa8
> @@ -120,6 +126,13 @@
>   #define VE_SCALING_FILTER2		0x020
>   #define VE_SCALING_FILTER3		0x024
>   
> +#define VE_BCD_CTRL			0x02C
> +#define  VE_BCD_CTRL_EN_BCD		BIT(0)
> +#define  VE_BCD_CTRL_EN_ABCD		BIT(1)
> +#define  VE_BCD_CTRL_EN_CB		BIT(2)
> +#define  VE_BCD_CTRL_THR		GENMASK(23, 16)
> +#define  VE_BCD_CTRL_ABCD_THR		GENMASK(31, 24)
> +
>   #define VE_CAP_WINDOW			0x030
>   #define VE_COMP_WINDOW			0x034
>   #define VE_COMP_PROC_OFFSET		0x038
> @@ -128,6 +141,7 @@
>   #define VE_SRC0_ADDR			0x044
>   #define VE_SRC_SCANLINE_OFFSET		0x048
>   #define VE_SRC1_ADDR			0x04c
> +#define VE_BCD_ADDR			0x050
>   #define VE_COMP_ADDR			0x054
>   
>   #define VE_STREAM_BUF_SIZE		0x058
> @@ -148,6 +162,8 @@
>   #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
>   #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
>   
> +#define VE_CB_ADDR			0x06C
> +
>   #define VE_OFFSET_COMP_STREAM		0x078
>   
>   #define VE_JPEG_COMP_SIZE_READ_BACK	0x084
> @@ -255,10 +271,15 @@ struct aspeed_video {
>   	unsigned int max_compressed_size;
>   	struct aspeed_video_addr srcs[2];
>   	struct aspeed_video_addr jpeg;
> +	struct aspeed_video_addr bcd;
>   
>   	bool yuv420;
> +	bool partial_jpeg;
> +	bool hq_mode;
>   	unsigned int frame_rate;
>   	unsigned int jpeg_quality;
> +	unsigned int jpeg_hq_quality;
> +	unsigned int compression_mode;
>   
>   	unsigned int frame_bottom;
>   	unsigned int frame_left;
> @@ -270,6 +291,13 @@ struct aspeed_video {
>   
>   #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
>   
> +static bool aspeed_video_alloc_buf(struct aspeed_video *video,
> +				   struct aspeed_video_addr *addr,
> +				   unsigned int size);
> +
> +static void aspeed_video_free_buf(struct aspeed_video *video,
> +				  struct aspeed_video_addr *addr);
> +
>   static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
>   	0xe0ffd8ff, 0x464a1000, 0x01004649, 0x60000101, 0x00006000, 0x0f00feff,
>   	0x00002d05, 0x00000000, 0x00000000, 0x00dbff00
> @@ -499,6 +527,20 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>   		return -EBUSY;
>   	}
>   
> +	if (video->partial_jpeg && !video->bcd.size) {
> +		if (!aspeed_video_alloc_buf(video, &video->bcd,
> +					    VE_BCD_BUFF_SIZE)) {
> +			dev_err(video->dev, "Failed to allocate BCD buffer\n");
> +			dev_err(video->dev, "don't start frame\n");

Why not use only one line?

> +			return -ENOMEM;
> +		}
> +		aspeed_video_write(video, VE_BCD_ADDR, video->bcd.dma);
> +		dprintk(LOG_INFO, "bcd addr(%#x) size(%d)\n",
> +			video->bcd.dma, video->bcd.size);

Sounds more like debug information to me.

> +	} else if (!video->partial_jpeg && video->bcd.size) {
> +		aspeed_video_free_buf(video, &video->bcd);
> +	}
> +
>   	spin_lock_irqsave(&video->lock, flags);
>   	buf = list_first_entry_or_null(&video->buffers,
>   				       struct aspeed_video_buffer, link);
> @@ -642,6 +684,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   
>   	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>   		struct aspeed_video_buffer *buf;
> +		bool empty = true;
>   		u32 frame_size = aspeed_video_read(video,
>   						   VE_JPEG_COMP_SIZE_READ_BACK);
>   
> @@ -655,13 +698,23 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   		if (buf) {
>   			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, frame_size);
>   
> -			if (!list_is_last(&buf->link, &video->buffers)) {
> +			/*
> +			 * partial_jpeg requires continuous update.
> +			 * On the contrary, standard jpeg can keep last buffer
> +			 * to always have the latest result.
> +			 */
> +			if (!video->partial_jpeg &&
> +			    list_is_last(&buf->link, &video->buffers)) {
> +				empty = false;
> +				dprintk(LOG_NOTICE, "skip to keep last frame updated\n");

Also debug information?

> +			} else {
>   				buf->vb.vb2_buf.timestamp = ktime_get_ns();
>   				buf->vb.sequence = video->sequence++;
>   				buf->vb.field = V4L2_FIELD_NONE;
>   				vb2_buffer_done(&buf->vb.vb2_buf,
>   						VB2_BUF_STATE_DONE);
>   				list_del(&buf->link);
> +				empty = list_empty(&video->buffers);
>   			}
>   		}
>   		spin_unlock(&video->lock);
> @@ -675,7 +728,18 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   		aspeed_video_write(video, VE_INTERRUPT_STATUS,
>   				   VE_INTERRUPT_COMP_COMPLETE);
>   		sts &= ~VE_INTERRUPT_COMP_COMPLETE;
> -		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
> +
> +		// swap src buffer if partial_jpeg

Use C89 style comments consistently?

> +		if (video->partial_jpeg) {
> +			u32 src0, src1;
> +
> +			src0 = aspeed_video_read(video, VE_SRC0_ADDR);
> +			src1 = aspeed_video_read(video, VE_SRC1_ADDR);
> +			aspeed_video_write(video, VE_SRC0_ADDR, src1);
> +			aspeed_video_write(video, VE_SRC1_ADDR, src0);
> +		}
> +
> +		if (test_bit(VIDEO_STREAMING, &video->flags) && !empty)
>   			aspeed_video_start_frame(video);
>   	}
>   
> @@ -938,10 +1002,14 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   				   FIELD_PREP(VE_TGS_FIRST, video->frame_top) |
>   				   FIELD_PREP(VE_TGS_LAST,
>   					      video->frame_bottom + 1));
> -		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
> +		aspeed_video_update(video, VE_CTRL,
> +				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
> +				    VE_CTRL_INT_DE);
>   	} else {
>   		dprintk(LOG_INFO, "Capture: Direct Mode\n");
> -		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
> +		aspeed_video_update(video, VE_CTRL,
> +				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
> +				    VE_CTRL_DIRECT_FETCH);
>   	}
>   
>   	size *= 4;
> @@ -976,34 +1044,68 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   
>   static void aspeed_video_update_regs(struct aspeed_video *video)
>   {
> -	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
> +	static const char * const compress_mode_str[] = {"DCT Only",
> +		"DCT VQ mix 2-color", "DCT VQ mix 4-color"};
> +	u32 comp_ctrl =	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
> +		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
> +		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_LUM, video->jpeg_hq_quality) |
> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_CHR, video->jpeg_hq_quality |
> +			   0x10);
>   	u32 ctrl = 0;
> -	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
> +	u32 seq_ctrl = 0;
>   
>   	dprintk(LOG_INFO, "framerate(%d)\n", video->frame_rate);
> -	dprintk(LOG_INFO, "subsample(%s)\n",
> +	dprintk(LOG_INFO, "jpeg format(%s) subsample(%s)\n",
> +		video->partial_jpeg ? "partial" : "standard",
>   		video->yuv420 ? "420" : "444");
> -	dprintk(LOG_INFO, "compression quality(%d)\n",
> -		video->jpeg_quality);
> +	dprintk(LOG_INFO, "compression quality(%d) hq(%s) hq_quality(%d)\n",
> +		video->jpeg_quality, video->hq_mode ? "on" : "off",
> +		video->jpeg_hq_quality);
> +	dprintk(LOG_INFO, "compression mode(%s)\n",
> +		compress_mode_str[video->compression_mode]);
> +
> +	if (video->partial_jpeg)
> +		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
> +	else
> +		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
>   
>   	if (video->frame_rate)
>   		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
>   
> +	if (!video->partial_jpeg) {
> +		comp_ctrl &= ~FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode);
> +		seq_ctrl |= VE_SEQ_CTRL_JPEG_MODE;
> +	}
> +
>   	if (video->yuv420)
>   		seq_ctrl |= VE_SEQ_CTRL_YUV420;
>   
>   	if (video->jpeg.virt)
>   		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
>   
> +	switch (video->compression_mode) {
> +	case 0:	//DCT only

Please add a space after `//`.

> +		comp_ctrl |= VE_COMP_CTRL_VQ_DCT_ONLY;
> +		break;
> +	case 1:	//DCT VQ mix 2-color
> +		comp_ctrl &= ~(VE_COMP_CTRL_VQ_4COLOR | VE_COMP_CTRL_VQ_DCT_ONLY);
> +		break;
> +	case 2:	//DCT VQ mix 4-color
> +		comp_ctrl |= VE_COMP_CTRL_VQ_4COLOR;
> +		break;
> +	}
> +
>   	/* Set control registers */
>   	aspeed_video_update(video, VE_SEQ_CTRL,
>   			    VE_SEQ_CTRL_JPEG_MODE | VE_SEQ_CTRL_YUV420,
>   			    seq_ctrl);
>   	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
>   	aspeed_video_update(video, VE_COMP_CTRL,
> -			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
> +			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
> +			    VE_COMP_CTRL_EN_HQ | VE_COMP_CTRL_HQ_DCT_LUM |
> +			    VE_COMP_CTRL_HQ_DCT_CHR | VE_COMP_CTRL_VQ_4COLOR |
> +			    VE_COMP_CTRL_VQ_DCT_ONLY,
>   			    comp_ctrl);
>   }
>   
> @@ -1035,6 +1137,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>   
>   	/* Set mode detection defaults */
>   	aspeed_video_write(video, VE_MODE_DETECT, 0x22666500);
> +
> +	aspeed_video_write(video, VE_BCD_CTRL, 0);
>   }
>   
>   static void aspeed_video_start(struct aspeed_video *video)
> @@ -1070,6 +1174,9 @@ static void aspeed_video_stop(struct aspeed_video *video)
>   	if (video->srcs[1].size)
>   		aspeed_video_free_buf(video, &video->srcs[1]);
>   
> +	if (video->bcd.size)
> +		aspeed_video_free_buf(video, &video->bcd);
> +
>   	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
>   	video->flags = 0;
>   }
> @@ -1372,6 +1479,26 @@ static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
>   		if (test_bit(VIDEO_STREAMING, &video->flags))
>   			aspeed_video_update_regs(video);
>   		break;
> +	case V4L2_CID_ASPEED_FORMAT:
> +		video->partial_jpeg = ctrl->val;
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
> +		break;
> +	case V4L2_CID_ASPEED_COMPRESSION_MODE:
> +		video->compression_mode = ctrl->val;
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
> +		break;
> +	case V4L2_CID_ASPEED_HQ_MODE:
> +		video->hq_mode = ctrl->val;
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
> +		break;
> +	case V4L2_CID_ASPEED_HQ_JPEG_QUALITY:
> +		video->jpeg_hq_quality = ctrl->val;
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
> +		break;
>   	default:
>   		return -EINVAL;
>   	}
> @@ -1383,6 +1510,50 @@ static const struct v4l2_ctrl_ops aspeed_video_ctrl_ops = {
>   	.s_ctrl = aspeed_video_set_ctrl,
>   };
>   
> +static const struct v4l2_ctrl_config aspeed_ctrl_format = {
> +	.ops = &aspeed_video_ctrl_ops,
> +	.id = V4L2_CID_ASPEED_FORMAT,
> +	.name = "Aspeed JPEG Format",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.min = false,
> +	.max = true,
> +	.step = 1,
> +	.def = false,
> +};
> +
> +static const struct v4l2_ctrl_config aspeed_ctrl_compression_mode = {
> +	.ops = &aspeed_video_ctrl_ops,
> +	.id = V4L2_CID_ASPEED_COMPRESSION_MODE,
> +	.name = "Aspeed Compression Mode",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 0,
> +	.max = 2,
> +	.step = 1,
> +	.def = 0,
> +};
> +
> +static const struct v4l2_ctrl_config aspeed_ctrl_HQ_mode = {
> +	.ops = &aspeed_video_ctrl_ops,
> +	.id = V4L2_CID_ASPEED_HQ_MODE,
> +	.name = "Aspeed HQ Mode",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.min = false,
> +	.max = true,
> +	.step = 1,
> +	.def = false,
> +};
> +
> +static const struct v4l2_ctrl_config aspeed_ctrl_HQ_jpeg_quality = {
> +	.ops = &aspeed_video_ctrl_ops,
> +	.id = V4L2_CID_ASPEED_HQ_JPEG_QUALITY,
> +	.name = "Aspeed HQ Quality",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 0,
> +	.max = ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1,
> +	.step = 1,
> +	.def = 0,
> +};
> +
>   static void aspeed_video_resolution_work(struct work_struct *work)
>   {
>   	struct delayed_work *dwork = to_delayed_work(work);
> @@ -1660,6 +1831,7 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>   	struct v4l2_device *v4l2_dev = &video->v4l2_dev;
>   	struct vb2_queue *vbq = &video->queue;
>   	struct video_device *vdev = &video->vdev;
> +	struct v4l2_ctrl_handler *hdl = &video->ctrl_handler;
>   	int rc;
>   
>   	video->pix_fmt.pixelformat = V4L2_PIX_FMT_JPEG;
> @@ -1674,22 +1846,26 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>   		return rc;
>   	}
>   
> -	v4l2_ctrl_handler_init(&video->ctrl_handler, 2);
> -	v4l2_ctrl_new_std(&video->ctrl_handler, &aspeed_video_ctrl_ops,
> +	v4l2_ctrl_handler_init(hdl, 6);
> +	v4l2_ctrl_new_std(hdl, &aspeed_video_ctrl_ops,
>   			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 0,
>   			  ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1, 1, 0);
> -	v4l2_ctrl_new_std_menu(&video->ctrl_handler, &aspeed_video_ctrl_ops,
> +	v4l2_ctrl_new_std_menu(hdl, &aspeed_video_ctrl_ops,
>   			       V4L2_CID_JPEG_CHROMA_SUBSAMPLING,
>   			       V4L2_JPEG_CHROMA_SUBSAMPLING_420, mask,
>   			       V4L2_JPEG_CHROMA_SUBSAMPLING_444);
> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_format, NULL);
> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_compression_mode, NULL);
> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_mode, NULL);
> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_jpeg_quality, NULL);
>   
> -	rc = video->ctrl_handler.error;
> +	rc = hdl->error;
>   	if (rc) {
>   		dev_err(video->dev, "Failed to init controls: %d\n", rc);
>   		goto err_ctrl_init;
>   	}
>   
> -	v4l2_dev->ctrl_handler = &video->ctrl_handler;
> +	v4l2_dev->ctrl_handler = hdl;
>   
>   	vbq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>   	vbq->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
> 


Kind regards,

Paul
