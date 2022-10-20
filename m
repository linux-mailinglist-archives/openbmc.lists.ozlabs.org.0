Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7B605876
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 09:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtK156wf1z3cfN
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 18:27:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtK0h0SVRz2yxc;
	Thu, 20 Oct 2022 18:26:41 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 29K72xkV072568;
	Thu, 20 Oct 2022 15:02:59 +0800 (GMT-8)
	(envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 20 Oct
 2022 15:25:26 +0800
Message-ID: <14a96f82-0f36-e981-b6e1-31d662eded33@aspeedtech.com>
Date: Thu, 20 Oct 2022 15:25:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v9 3/4] media: aspeed: Support aspeed mode to reduce
 compressed data
Content-Language: en-US
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, <eajames@linux.ibm.com>,
        <mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
        <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <ezequiel@vanguardiasur.com.ar>,
        <stanimir.varbanov@linaro.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@linux.intel.com>, <ribalda@chromium.org>
References: <20220921025112.13150-1-jammy_huang@aspeedtech.com>
 <20220921025112.13150-4-jammy_huang@aspeedtech.com>
 <e4bc14ec62f08b7e96441e909337d00a41221a1d.camel@collabora.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <e4bc14ec62f08b7e96441e909337d00a41221a1d.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 29K72xkV072568
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

Hi Nocolas,


On 2022/10/18 下午 11:20, Nicolas Dufresne wrote:
> Hi,
>
> Le mercredi 21 septembre 2022 à 10:51 +0800, Jammy Huang a écrit :
>> aspeed supports differential jpeg format which only compress the parts
>> which are changed. In this way, it reduces both the amount of data to be
>> transferred by network and those to be decoded on the client side.
>>
>> 2 new ctrls are added:
>> * Aspeed HQ Mode: to control aspeed's high quality(2-pass) compression mode
>>    This only works with yuv444 subsampling.
>> * Aspeed HQ Quality: to control the quality of aspeed's HQ mode
>>    only useful if Aspeed HQ mode is enabled
>>
>> Aspeed JPEG Format requires an additional buffer, called bcd, to store
>> the information about which macro block in the new frame is different
>> from the previous one.
>>
>> To have bcd correctly working, we need to swap the buffers for src0/1 to
>> make src1 refer to previous frame and src0 to the coming new frame.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   drivers/media/platform/aspeed/aspeed-video.c | 281 +++++++++++++++----
>>   include/uapi/linux/aspeed-video.h            |  15 +
>>   2 files changed, 245 insertions(+), 51 deletions(-)
>>   create mode 100644 include/uapi/linux/aspeed-video.h
>>
>> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
>> index 20f795ccc11b..739288026418 100644
>> --- a/drivers/media/platform/aspeed/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed/aspeed-video.c
>> @@ -33,6 +33,7 @@
>>   #include <media/v4l2-event.h>
>>   #include <media/v4l2-ioctl.h>
>>   #include <media/videobuf2-dma-contig.h>
>> +#include <uapi/linux/aspeed-video.h>
>>   
>>   #define ASPEED_VIDEO_V4L2_MIN_BUF_REQ 3
>>   
>> @@ -59,6 +60,7 @@
>>   
>>   #define VE_MAX_SRC_BUFFER_SIZE		0x8ca000 /* 1920 * 1200, 32bpp */
>>   #define VE_JPEG_HEADER_SIZE		0x006000 /* 512 * 12 * 4 */
>> +#define VE_BCD_BUFF_SIZE		0x9000 /* (1920/8) * (1200/8) */
>>   
>>   #define VE_PROTECTION_KEY		0x000
>>   #define  VE_PROTECTION_KEY_UNLOCK	0x1a038aa8
>> @@ -107,6 +109,13 @@
>>   #define VE_SCALING_FILTER2		0x020
>>   #define VE_SCALING_FILTER3		0x024
>>   
>> +#define VE_BCD_CTRL			0x02C
>> +#define  VE_BCD_CTRL_EN_BCD		BIT(0)
>> +#define  VE_BCD_CTRL_EN_ABCD		BIT(1)
>> +#define  VE_BCD_CTRL_EN_CB		BIT(2)
>> +#define  VE_BCD_CTRL_THR		GENMASK(23, 16)
>> +#define  VE_BCD_CTRL_ABCD_THR		GENMASK(31, 24)
>> +
>>   #define VE_CAP_WINDOW			0x030
>>   #define VE_COMP_WINDOW			0x034
>>   #define VE_COMP_PROC_OFFSET		0x038
>> @@ -115,6 +124,7 @@
>>   #define VE_SRC0_ADDR			0x044
>>   #define VE_SRC_SCANLINE_OFFSET		0x048
>>   #define VE_SRC1_ADDR			0x04c
>> +#define VE_BCD_ADDR			0x050
>>   #define VE_COMP_ADDR			0x054
>>   
>>   #define VE_STREAM_BUF_SIZE		0x058
>> @@ -135,6 +145,8 @@
>>   #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
>>   #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
>>   
>> +#define VE_CB_ADDR			0x06C
>> +
>>   #define AST2400_VE_COMP_SIZE_READ_BACK	0x078
>>   #define AST2600_VE_COMP_SIZE_READ_BACK	0x084
>>   
>> @@ -211,6 +223,12 @@ enum {
>>   	VIDEO_CLOCKS_ON,
>>   };
>>   
>> +enum aspeed_video_format {
>> +	VIDEO_FMT_STANDARD = 0,
>> +	VIDEO_FMT_ASPEED,
>> +	VIDEO_FMT_MAX = VIDEO_FMT_ASPEED
>> +};
>> +
>>   // for VE_CTRL_CAPTURE_FMT
>>   enum aspeed_video_capture_format {
>>   	VIDEO_CAP_FMT_YUV_STUDIO_SWING = 0,
>> @@ -245,16 +263,20 @@ struct aspeed_video_perf {
>>   /*
>>    * struct aspeed_video - driver data
>>    *
>> - * res_work:           holds the delayed_work for res-detection if unlock
>> - * buffers:            holds the list of buffer queued from user
>> + * res_work:		holds the delayed_work for res-detection if unlock
>> + * buffers:		holds the list of buffer queued from user
>>    * flags:		holds the state of video
>>    * sequence:		holds the last number of frame completed
>>    * max_compressed_size:	holds max compressed stream's size
>>    * srcs:		holds the buffer information for srcs
>>    * jpeg:		holds the buffer information for jpeg header
>> + * bcd:			holds the buffer information for bcd work
>>    * yuv420:		a flag raised if JPEG subsampling is 420
>> + * format:		holds the video format
>> + * hq_mode:		a flag raised if HQ is enabled. Only for VIDEO_FMT_ASPEED
>>    * frame_rate:		holds the frame_rate
>>    * jpeg_quality:	holds jpeq's quality (0~11)
>> + * jpeg_hq_quality:	holds hq's quality (1~12) only if hq_mode enabled
>>    * frame_bottom:	end position of video data in vertical direction
>>    * frame_left:		start position of video data in horizontal direction
>>    * frame_right:		end position of video data in horizontal direction
>> @@ -290,10 +312,14 @@ struct aspeed_video {
>>   	unsigned int max_compressed_size;
>>   	struct aspeed_video_addr srcs[2];
>>   	struct aspeed_video_addr jpeg;
>> +	struct aspeed_video_addr bcd;
>>   
>>   	bool yuv420;
>> +	enum aspeed_video_format format;
>> +	bool hq_mode;
>>   	unsigned int frame_rate;
>>   	unsigned int jpeg_quality;
>> +	unsigned int jpeg_hq_quality;
>>   
>>   	unsigned int frame_bottom;
>>   	unsigned int frame_left;
>> @@ -458,8 +484,20 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
>>   	},
>>   };
>>   
>> +static const char * const compress_scheme_str[] = {"DCT Only",
>> +	"DCT VQ mix 2-color", "DCT VQ mix 4-color"};
>> +static const char * const format_str[] = {"Standard JPEG",
>> +	"Aspeed JPEG"};
>> +
>>   static unsigned int debug;
>>   
>> +static bool aspeed_video_alloc_buf(struct aspeed_video *video,
>> +				   struct aspeed_video_addr *addr,
>> +				   unsigned int size);
>> +
>> +static void aspeed_video_free_buf(struct aspeed_video *video,
>> +				  struct aspeed_video_addr *addr);
>> +
>>   static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
>>   {
>>   	int i;
>> @@ -547,6 +585,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>>   	unsigned long flags;
>>   	struct aspeed_video_buffer *buf;
>>   	u32 seq_ctrl = aspeed_video_read(video, VE_SEQ_CTRL);
>> +	bool bcd_buf_need = (video->format != VIDEO_FMT_STANDARD);
>>   
>>   	if (video->v4l2_input_status) {
>>   		v4l2_warn(&video->v4l2_dev, "No signal; don't start frame\n");
>> @@ -559,6 +598,20 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>>   		return -EBUSY;
>>   	}
>>   
>> +	if (bcd_buf_need && !video->bcd.size) {
>> +		if (!aspeed_video_alloc_buf(video, &video->bcd,
>> +					    VE_BCD_BUFF_SIZE)) {
>> +			dev_err(video->dev, "Failed to allocate BCD buffer\n");
>> +			dev_err(video->dev, "don't start frame\n");
>> +			return -ENOMEM;
>> +		}
>> +		aspeed_video_write(video, VE_BCD_ADDR, video->bcd.dma);
>> +		v4l2_dbg(1, debug, &video->v4l2_dev, "bcd addr(%#x) size(%d)\n",
>> +			 video->bcd.dma, video->bcd.size);
>> +	} else if (!bcd_buf_need && video->bcd.size) {
>> +		aspeed_video_free_buf(video, &video->bcd);
>> +	}
>> +
>>   	spin_lock_irqsave(&video->lock, flags);
>>   	buf = list_first_entry_or_null(&video->buffers,
>>   				       struct aspeed_video_buffer, link);
>> @@ -657,6 +710,24 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>>   	schedule_delayed_work(&video->res_work, delay);
>>   }
>>   
>> +static void aspeed_video_swap_src_buf(struct aspeed_video *v)
>> +{
>> +	if (v->format == VIDEO_FMT_STANDARD)
>> +		return;
>> +
>> +	/* Reset bcd buffer to have a full frame update every 8 frames.  */
>> +	if (IS_ALIGNED(v->sequence, 8))
>> +		memset((u8 *)v->bcd.virt, 0x00, VE_BCD_BUFF_SIZE);
>> +
>> +	if (v->sequence & 0x01) {
>> +		aspeed_video_write(v, VE_SRC0_ADDR, v->srcs[1].dma);
>> +		aspeed_video_write(v, VE_SRC1_ADDR, v->srcs[0].dma);
>> +	} else {
>> +		aspeed_video_write(v, VE_SRC0_ADDR, v->srcs[0].dma);
>> +		aspeed_video_write(v, VE_SRC1_ADDR, v->srcs[1].dma);
>> +	}
>> +}
>> +
>>   static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>   {
>>   	struct aspeed_video *video = arg;
>> @@ -705,6 +776,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>   
>>   	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>>   		struct aspeed_video_buffer *buf;
>> +		bool empty = true;
>>   		u32 frame_size = aspeed_video_read(video,
>>   						   video->comp_size_read);
>>   
>> @@ -718,13 +790,23 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>   		if (buf) {
>>   			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, frame_size);
>>   
>> -			if (!list_is_last(&buf->link, &video->buffers)) {
>> +			/*
>> +			 * aspeed_jpeg requires continuous update.
>> +			 * On the contrary, standard jpeg can keep last buffer
>> +			 * to always have the latest result.
>> +			 */
>> +			if (video->format == VIDEO_FMT_STANDARD &&
>> +			    list_is_last(&buf->link, &video->buffers)) {
>> +				empty = false;
>> +				v4l2_warn(&video->v4l2_dev, "skip to keep last frame updated\n");
>> +			} else {
>>   				buf->vb.vb2_buf.timestamp = ktime_get_ns();
>>   				buf->vb.sequence = video->sequence++;
>>   				buf->vb.field = V4L2_FIELD_NONE;
>>   				vb2_buffer_done(&buf->vb.vb2_buf,
>>   						VB2_BUF_STATE_DONE);
>>   				list_del(&buf->link);
>> +				empty = list_empty(&video->buffers);
>>   			}
>>   		}
>>   		spin_unlock(&video->lock);
>> @@ -738,7 +820,10 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>   		aspeed_video_write(video, VE_INTERRUPT_STATUS,
>>   				   VE_INTERRUPT_COMP_COMPLETE);
>>   		sts &= ~VE_INTERRUPT_COMP_COMPLETE;
>> -		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>> +
>> +		aspeed_video_swap_src_buf(video);
>> +
>> +		if (test_bit(VIDEO_STREAMING, &video->flags) && !empty)
>>   			aspeed_video_start_frame(video);
>>   	}
>>   
>> @@ -1085,10 +1170,14 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>   				   FIELD_PREP(VE_TGS_FIRST, video->frame_top) |
>>   				   FIELD_PREP(VE_TGS_LAST,
>>   					      video->frame_bottom + 1));
>> -		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
>> +		aspeed_video_update(video, VE_CTRL,
>> +				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
>> +				    VE_CTRL_INT_DE);
>>   	} else {
>>   		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
>> -		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>> +		aspeed_video_update(video, VE_CTRL,
>> +				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
>> +				    VE_CTRL_DIRECT_FETCH);
>>   	}
>>   
>>   	size *= 4;
>> @@ -1121,21 +1210,66 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>   		aspeed_video_free_buf(video, &video->srcs[0]);
>>   }
>>   
>> -static void aspeed_video_init_regs(struct aspeed_video *video)
>> +static void aspeed_video_update_regs(struct aspeed_video *video)
>>   {
>> -	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
>> -		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
>> -	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR |
>> -		FIELD_PREP(VE_CTRL_CAPTURE_FMT, VIDEO_CAP_FMT_YUV_FULL_SWING);
>> -	u32 seq_ctrl = video->jpeg_mode;
>> +	u8 jpeg_hq_quality = clamp((int)video->jpeg_hq_quality - 1, 0,
>> +				   ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1);
>> +	u32 comp_ctrl =	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>> +		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
>> +		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
>> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_LUM, jpeg_hq_quality) |
>> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_CHR, jpeg_hq_quality | 0x10);
>> +	u32 ctrl = 0;
>> +	u32 seq_ctrl = 0;
>> +
>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
>> +		 video->frame_rate);
>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
>> +		 format_str[video->format],
>> +		 video->yuv420 ? "420" : "444");
>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
>> +		 video->jpeg_quality);
>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "hq_mode(%s) hq_quality(%d)\n",
>> +		 video->hq_mode ? "on" : "off", video->jpeg_hq_quality);
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
>> +		seq_ctrl |= video->jpeg_mode;
>> +	}
>> +
>>   	if (video->yuv420)
>>   		seq_ctrl |= VE_SEQ_CTRL_YUV420;
>>   
>> +	if (video->jpeg.virt)
>> +		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
>> +
>> +
>> +	/* Set control registers */
>> +	aspeed_video_update(video, VE_SEQ_CTRL,
>> +			    video->jpeg_mode | VE_SEQ_CTRL_YUV420,
>> +			    seq_ctrl);
>> +	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
>> +	aspeed_video_update(video, VE_COMP_CTRL,
>> +			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
>> +			    VE_COMP_CTRL_EN_HQ | VE_COMP_CTRL_HQ_DCT_LUM |
>> +			    VE_COMP_CTRL_HQ_DCT_CHR | VE_COMP_CTRL_VQ_4COLOR |
>> +			    VE_COMP_CTRL_VQ_DCT_ONLY,
>> +			    comp_ctrl);
>> +}
>> +
>> +static void aspeed_video_init_regs(struct aspeed_video *video)
>> +{
>> +	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR |
>> +		FIELD_PREP(VE_CTRL_CAPTURE_FMT, VIDEO_CAP_FMT_YUV_FULL_SWING);
>> +
>>   	/* Unlock VE registers */
>>   	aspeed_video_write(video, VE_PROTECTION_KEY, VE_PROTECTION_KEY_UNLOCK);
>>   
>> @@ -1150,9 +1284,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>>   	aspeed_video_write(video, VE_JPEG_ADDR, video->jpeg.dma);
>>   
>>   	/* Set control registers */
>> -	aspeed_video_write(video, VE_SEQ_CTRL, seq_ctrl);
>>   	aspeed_video_write(video, VE_CTRL, ctrl);
>> -	aspeed_video_write(video, VE_COMP_CTRL, comp_ctrl);
>> +	aspeed_video_write(video, VE_COMP_CTRL, VE_COMP_CTRL_RSVD);
>>   
>>   	/* Don't downscale */
>>   	aspeed_video_write(video, VE_SCALING_FACTOR, 0x10001000);
>> @@ -1168,6 +1301,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>>   			   FIELD_PREP(VE_MODE_DT_HOR_STABLE, 6) |
>>   			   FIELD_PREP(VE_MODE_DT_VER_STABLE, 6) |
>>   			   FIELD_PREP(VE_MODE_DT_EDG_THROD, 0x65));
>> +
>> +	aspeed_video_write(video, VE_BCD_CTRL, 0);
>>   }
>>   
>>   static void aspeed_video_start(struct aspeed_video *video)
>> @@ -1201,6 +1336,9 @@ static void aspeed_video_stop(struct aspeed_video *video)
>>   	if (video->srcs[1].size)
>>   		aspeed_video_free_buf(video, &video->srcs[1]);
>>   
>> +	if (video->bcd.size)
>> +		aspeed_video_free_buf(video, &video->bcd);
>> +
>>   	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
>>   	video->flags = 0;
>>   }
>> @@ -1219,10 +1357,12 @@ static int aspeed_video_querycap(struct file *file, void *fh,
>>   static int aspeed_video_enum_format(struct file *file, void *fh,
>>   				    struct v4l2_fmtdesc *f)
>>   {
>> +	struct aspeed_video *video = video_drvdata(file);
>> +
>>   	if (f->index)
>>   		return -EINVAL;
>>   
>> -	f->pixelformat = V4L2_PIX_FMT_JPEG;
>> +	f->pixelformat = video->pix_fmt.pixelformat;
>>   
>>   	return 0;
>>   }
>> @@ -1237,6 +1377,29 @@ static int aspeed_video_get_format(struct file *file, void *fh,
>>   	return 0;
>>   }
>>   
>> +static int aspeed_video_set_format(struct file *file, void *fh,
>> +				   struct v4l2_format *f)
>> +{
>> +	struct aspeed_video *video = video_drvdata(file);
>> +
>> +	if (vb2_is_busy(&video->queue))
>> +		return -EBUSY;
>> +
>> +	switch (f->fmt.pix.pixelformat) {
>> +	case V4L2_PIX_FMT_JPEG:
>> +		video->format = VIDEO_FMT_STANDARD;
>> +		break;
>> +	case V4L2_PIX_FMT_AJPG:
>> +		video->format = VIDEO_FMT_ASPEED;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +	video->pix_fmt.pixelformat = f->fmt.pix.pixelformat;
>> +
>> +	return 0;
>> +}
>> +
>>   static int aspeed_video_enum_input(struct file *file, void *fh,
>>   				   struct v4l2_input *inp)
>>   {
>> @@ -1454,7 +1617,7 @@ static const struct v4l2_ioctl_ops aspeed_video_ioctl_ops = {
>>   
>>   	.vidioc_enum_fmt_vid_cap = aspeed_video_enum_format,
>>   	.vidioc_g_fmt_vid_cap = aspeed_video_get_format,
>> -	.vidioc_s_fmt_vid_cap = aspeed_video_get_format,
>> +	.vidioc_s_fmt_vid_cap = aspeed_video_set_format,
>>   	.vidioc_try_fmt_vid_cap = aspeed_video_get_format,
>>   
>>   	.vidioc_reqbufs = vb2_ioctl_reqbufs,
>> @@ -1486,27 +1649,6 @@ static const struct v4l2_ioctl_ops aspeed_video_ioctl_ops = {
>>   	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>>   };
>>   
>> -static void aspeed_video_update_jpeg_quality(struct aspeed_video *video)
>> -{
>> -	u32 comp_ctrl = FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
>> -
>> -	aspeed_video_update(video, VE_COMP_CTRL,
>> -			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
>> -			    comp_ctrl);
>> -}
>> -
>> -static void aspeed_video_update_subsampling(struct aspeed_video *video)
>> -{
>> -	if (video->jpeg.virt)
>> -		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
>> -
>> -	if (video->yuv420)
>> -		aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_YUV420);
>> -	else
>> -		aspeed_video_update(video, VE_SEQ_CTRL, VE_SEQ_CTRL_YUV420, 0);
>> -}
>> -
>>   static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
>>   {
>>   	struct aspeed_video *video = container_of(ctrl->handler,
>> @@ -1516,16 +1658,23 @@ static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
>>   	switch (ctrl->id) {
>>   	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
>>   		video->jpeg_quality = ctrl->val;
>> -		aspeed_video_update_jpeg_quality(video);
>> +		if (test_bit(VIDEO_STREAMING, &video->flags))
>> +			aspeed_video_update_regs(video);
>>   		break;
>>   	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
>> -		if (ctrl->val == V4L2_JPEG_CHROMA_SUBSAMPLING_420) {
>> -			video->yuv420 = true;
>> -			aspeed_video_update_subsampling(video);
>> -		} else {
>> -			video->yuv420 = false;
>> -			aspeed_video_update_subsampling(video);
>> -		}
>> +		video->yuv420 = (ctrl->val == V4L2_JPEG_CHROMA_SUBSAMPLING_420);
>> +		if (test_bit(VIDEO_STREAMING, &video->flags))
>> +			aspeed_video_update_regs(video);
>> +		break;
>> +	case V4L2_CID_ASPEED_HQ_MODE:
>> +		video->hq_mode = ctrl->val;
>> +		if (test_bit(VIDEO_STREAMING, &video->flags))
>> +			aspeed_video_update_regs(video);
>> +		break;
>> +	case V4L2_CID_ASPEED_HQ_JPEG_QUALITY:
>> +		video->jpeg_hq_quality = ctrl->val;
>> +		if (test_bit(VIDEO_STREAMING, &video->flags))
>> +			aspeed_video_update_regs(video);
>>   		break;
>>   	default:
>>   		return -EINVAL;
>> @@ -1538,6 +1687,28 @@ static const struct v4l2_ctrl_ops aspeed_video_ctrl_ops = {
>>   	.s_ctrl = aspeed_video_set_ctrl,
>>   };
>>   
>> +static const struct v4l2_ctrl_config aspeed_ctrl_HQ_mode = {
>> +	.ops = &aspeed_video_ctrl_ops,
>> +	.id = V4L2_CID_ASPEED_HQ_MODE,
>> +	.name = "Aspeed HQ Mode",
>> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
>> +	.min = false,
>> +	.max = true,
>> +	.step = 1,
>> +	.def = false,
>> +};
>> +
>> +static const struct v4l2_ctrl_config aspeed_ctrl_HQ_jpeg_quality = {
>> +	.ops = &aspeed_video_ctrl_ops,
>> +	.id = V4L2_CID_ASPEED_HQ_JPEG_QUALITY,
>> +	.name = "Aspeed HQ Quality",
>> +	.type = V4L2_CTRL_TYPE_INTEGER,
>> +	.min = 1,
>> +	.max = ASPEED_VIDEO_JPEG_NUM_QUALITIES,
>> +	.step = 1,
>> +	.def = 1,
>> +};
>> +
>>   static void aspeed_video_resolution_work(struct work_struct *work)
>>   {
>>   	struct delayed_work *dwork = to_delayed_work(work);
>> @@ -1552,6 +1723,8 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>>   
>>   	aspeed_video_init_regs(video);
>>   
>> +	aspeed_video_update_regs(video);
>> +
>>   	aspeed_video_get_resolution(video);
>>   
>>   	if (video->detected_timings.width != video->active_timings.width ||
>> @@ -1662,6 +1835,8 @@ static int aspeed_video_start_streaming(struct vb2_queue *q,
>>   	video->perf.duration_max = 0;
>>   	video->perf.duration_min = 0xffffffff;
>>   
>> +	aspeed_video_update_regs(video);
>> +
>>   	rc = aspeed_video_start_frame(video);
>>   	if (rc) {
>>   		aspeed_video_bufs_done(video, VB2_BUF_STATE_QUEUED);
>> @@ -1800,6 +1975,7 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>>   	struct v4l2_device *v4l2_dev = &video->v4l2_dev;
>>   	struct vb2_queue *vbq = &video->queue;
>>   	struct video_device *vdev = &video->vdev;
>> +	struct v4l2_ctrl_handler *hdl = &video->ctrl_handler;
>>   	int rc;
>>   
>>   	video->pix_fmt.pixelformat = V4L2_PIX_FMT_JPEG;
>> @@ -1814,16 +1990,18 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>>   		return rc;
>>   	}
>>   
>> -	v4l2_ctrl_handler_init(&video->ctrl_handler, 2);
>> -	v4l2_ctrl_new_std(&video->ctrl_handler, &aspeed_video_ctrl_ops,
>> +	v4l2_ctrl_handler_init(hdl, 4);
>> +	v4l2_ctrl_new_std(hdl, &aspeed_video_ctrl_ops,
>>   			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 0,
>>   			  ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1, 1, 0);
>> -	v4l2_ctrl_new_std_menu(&video->ctrl_handler, &aspeed_video_ctrl_ops,
>> +	v4l2_ctrl_new_std_menu(hdl, &aspeed_video_ctrl_ops,
>>   			       V4L2_CID_JPEG_CHROMA_SUBSAMPLING,
>>   			       V4L2_JPEG_CHROMA_SUBSAMPLING_420, mask,
>>   			       V4L2_JPEG_CHROMA_SUBSAMPLING_444);
>> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_mode, NULL);
>> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_jpeg_quality, NULL);
>>   
>> -	rc = video->ctrl_handler.error;
>> +	rc = hdl->error;
>>   	if (rc) {
>>   		v4l2_ctrl_handler_free(&video->ctrl_handler);
>>   		v4l2_device_unregister(v4l2_dev);
>> @@ -1832,7 +2010,7 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>>   		return rc;
>>   	}
>>   
>> -	v4l2_dev->ctrl_handler = &video->ctrl_handler;
>> +	v4l2_dev->ctrl_handler = hdl;
>>   
>>   	vbq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>   	vbq->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
>> @@ -1980,6 +2158,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
>>   	video->comp_size_read = config->comp_size_read;
>>   
>>   	video->frame_rate = 30;
>> +	video->jpeg_hq_quality = 1;
>>   	video->dev = &pdev->dev;
>>   	spin_lock_init(&video->lock);
>>   	mutex_init(&video->video_lock);
>> diff --git a/include/uapi/linux/aspeed-video.h b/include/uapi/linux/aspeed-video.h
>> new file mode 100644
>> index 000000000000..63f0432192a5
>> --- /dev/null
>> +++ b/include/uapi/linux/aspeed-video.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) 2021 ASPEED Technology Inc.
>> + */
>> +
>> +#ifndef _UAPI_LINUX_ASPEED_VIDEO_H
>> +#define _UAPI_LINUX_ASPEED_VIDEO_H
>> +
>> +#include <linux/v4l2-controls.h>
>> +
>> +#define V4L2_CID_ASPEED_COMPRESSION_SCHEME	(V4L2_CID_USER_ASPEED_BASE  + 1)
>> +#define V4L2_CID_ASPEED_HQ_MODE			(V4L2_CID_USER_ASPEED_BASE  + 2)
>> +#define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(V4L2_CID_USER_ASPEED_BASE  + 3)
> I believe you are missing documentation for these. Even vendor CID get to be
> documented in the RST doc, it also helps us reviewer to judge if these are
> trully vendor controls or should be generalized, its not currently possible to
> make an opinion.
OK, I will add aspeed.rst to disclose related information.
>> +
>> +#endif /* _UAPI_LINUX_ASPEED_VIDEO_H */

-- 
Best Regards
Jammy

