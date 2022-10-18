Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C57756035E5
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 00:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsT9j6zNpz3blt
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 09:31:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KYd0rpCB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=46.235.227.172; helo=madras.collabora.co.uk; envelope-from=nicolas.dufresne@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KYd0rpCB;
	dkim-atps=neutral
X-Greylist: delayed 577 seconds by postgrey-1.36 at boromir; Wed, 19 Oct 2022 02:30:09 AEDT
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsHqP3H5rz2y28;
	Wed, 19 Oct 2022 02:30:09 +1100 (AEDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A8681660035C;
	Tue, 18 Oct 2022 16:20:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666106424;
	bh=hcGU7f2VWGhlcxE4rVQ+mVCpg2sdCRIPSaRmUZxYE0A=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=KYd0rpCB1h0ybwIZP/sZD7SPX5E9qw5ofpBKQIn00e+WHIPBQumpLISuQNVhEkHmP
	 LU8RoMV3iAoYwTMuNPcgPsfTd0IJz9gdeQMIusMzJuFUtL/4jd1OEPDS0iw0hjZGPk
	 E7Zl/eCC3kxAANA6ZfuVwC7R4gAMf7nfzoKamKWsbJCYhzLwqs9mg+P7+X20cAqRw/
	 z2GyJAlgew02RseuUuFa5mqipVU6pGLVJGKPwnpahh+b2NYvsUrJIag/XrLT8/WE4h
	 aQRj9oxYzCy52mpE+ZueAGx3HGIO2jfq1nXIpyu0eIimIzITtmwwvuswm4Sl9MlSHN
	 izmAkcWfvdzhg==
Message-ID: <e4bc14ec62f08b7e96441e909337d00a41221a1d.camel@collabora.com>
Subject: Re: [PATCH v9 3/4] media: aspeed: Support aspeed mode to reduce
 compressed data
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com, 
 mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org,  openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  hverkuil-cisco@xs4all.nl,
 ezequiel@vanguardiasur.com.ar,  stanimir.varbanov@linaro.org,
 laurent.pinchart@ideasonboard.com,  sakari.ailus@linux.intel.com,
 ribalda@chromium.org
Date: Tue, 18 Oct 2022 11:20:13 -0400
In-Reply-To: <20220921025112.13150-4-jammy_huang@aspeedtech.com>
References: <20220921025112.13150-1-jammy_huang@aspeedtech.com>
	 <20220921025112.13150-4-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Oct 2022 09:31:09 +1100
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

Hi,

Le mercredi 21 septembre 2022 =C3=A0 10:51 +0800, Jammy Huang a =C3=A9crit=
=C2=A0:
> aspeed supports differential jpeg format which only compress the parts
> which are changed. In this way, it reduces both the amount of data to be
> transferred by network and those to be decoded on the client side.
>=20
> 2 new ctrls are added:
> * Aspeed HQ Mode: to control aspeed's high quality(2-pass) compression mo=
de
>   This only works with yuv444 subsampling.
> * Aspeed HQ Quality: to control the quality of aspeed's HQ mode
>   only useful if Aspeed HQ mode is enabled
>=20
> Aspeed JPEG Format requires an additional buffer, called bcd, to store
> the information about which macro block in the new frame is different
> from the previous one.
>=20
> To have bcd correctly working, we need to swap the buffers for src0/1 to
> make src1 refer to previous frame and src0 to the coming new frame.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed/aspeed-video.c | 281 +++++++++++++++----
>  include/uapi/linux/aspeed-video.h            |  15 +
>  2 files changed, 245 insertions(+), 51 deletions(-)
>  create mode 100644 include/uapi/linux/aspeed-video.h
>=20
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media=
/platform/aspeed/aspeed-video.c
> index 20f795ccc11b..739288026418 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -33,6 +33,7 @@
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-dma-contig.h>
> +#include <uapi/linux/aspeed-video.h>
> =20
>  #define ASPEED_VIDEO_V4L2_MIN_BUF_REQ 3
> =20
> @@ -59,6 +60,7 @@
> =20
>  #define VE_MAX_SRC_BUFFER_SIZE		0x8ca000 /* 1920 * 1200, 32bpp */
>  #define VE_JPEG_HEADER_SIZE		0x006000 /* 512 * 12 * 4 */
> +#define VE_BCD_BUFF_SIZE		0x9000 /* (1920/8) * (1200/8) */
> =20
>  #define VE_PROTECTION_KEY		0x000
>  #define  VE_PROTECTION_KEY_UNLOCK	0x1a038aa8
> @@ -107,6 +109,13 @@
>  #define VE_SCALING_FILTER2		0x020
>  #define VE_SCALING_FILTER3		0x024
> =20
> +#define VE_BCD_CTRL			0x02C
> +#define  VE_BCD_CTRL_EN_BCD		BIT(0)
> +#define  VE_BCD_CTRL_EN_ABCD		BIT(1)
> +#define  VE_BCD_CTRL_EN_CB		BIT(2)
> +#define  VE_BCD_CTRL_THR		GENMASK(23, 16)
> +#define  VE_BCD_CTRL_ABCD_THR		GENMASK(31, 24)
> +
>  #define VE_CAP_WINDOW			0x030
>  #define VE_COMP_WINDOW			0x034
>  #define VE_COMP_PROC_OFFSET		0x038
> @@ -115,6 +124,7 @@
>  #define VE_SRC0_ADDR			0x044
>  #define VE_SRC_SCANLINE_OFFSET		0x048
>  #define VE_SRC1_ADDR			0x04c
> +#define VE_BCD_ADDR			0x050
>  #define VE_COMP_ADDR			0x054
> =20
>  #define VE_STREAM_BUF_SIZE		0x058
> @@ -135,6 +145,8 @@
>  #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
>  #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
> =20
> +#define VE_CB_ADDR			0x06C
> +
>  #define AST2400_VE_COMP_SIZE_READ_BACK	0x078
>  #define AST2600_VE_COMP_SIZE_READ_BACK	0x084
> =20
> @@ -211,6 +223,12 @@ enum {
>  	VIDEO_CLOCKS_ON,
>  };
> =20
> +enum aspeed_video_format {
> +	VIDEO_FMT_STANDARD =3D 0,
> +	VIDEO_FMT_ASPEED,
> +	VIDEO_FMT_MAX =3D VIDEO_FMT_ASPEED
> +};
> +
>  // for VE_CTRL_CAPTURE_FMT
>  enum aspeed_video_capture_format {
>  	VIDEO_CAP_FMT_YUV_STUDIO_SWING =3D 0,
> @@ -245,16 +263,20 @@ struct aspeed_video_perf {
>  /*
>   * struct aspeed_video - driver data
>   *
> - * res_work:           holds the delayed_work for res-detection if unloc=
k
> - * buffers:            holds the list of buffer queued from user
> + * res_work:		holds the delayed_work for res-detection if unlock
> + * buffers:		holds the list of buffer queued from user
>   * flags:		holds the state of video
>   * sequence:		holds the last number of frame completed
>   * max_compressed_size:	holds max compressed stream's size
>   * srcs:		holds the buffer information for srcs
>   * jpeg:		holds the buffer information for jpeg header
> + * bcd:			holds the buffer information for bcd work
>   * yuv420:		a flag raised if JPEG subsampling is 420
> + * format:		holds the video format
> + * hq_mode:		a flag raised if HQ is enabled. Only for VIDEO_FMT_ASPEED
>   * frame_rate:		holds the frame_rate
>   * jpeg_quality:	holds jpeq's quality (0~11)
> + * jpeg_hq_quality:	holds hq's quality (1~12) only if hq_mode enabled
>   * frame_bottom:	end position of video data in vertical direction
>   * frame_left:		start position of video data in horizontal direction
>   * frame_right:		end position of video data in horizontal direction
> @@ -290,10 +312,14 @@ struct aspeed_video {
>  	unsigned int max_compressed_size;
>  	struct aspeed_video_addr srcs[2];
>  	struct aspeed_video_addr jpeg;
> +	struct aspeed_video_addr bcd;
> =20
>  	bool yuv420;
> +	enum aspeed_video_format format;
> +	bool hq_mode;
>  	unsigned int frame_rate;
>  	unsigned int jpeg_quality;
> +	unsigned int jpeg_hq_quality;
> =20
>  	unsigned int frame_bottom;
>  	unsigned int frame_left;
> @@ -458,8 +484,20 @@ static const struct v4l2_dv_timings_cap aspeed_video=
_timings_cap =3D {
>  	},
>  };
> =20
> +static const char * const compress_scheme_str[] =3D {"DCT Only",
> +	"DCT VQ mix 2-color", "DCT VQ mix 4-color"};
> +static const char * const format_str[] =3D {"Standard JPEG",
> +	"Aspeed JPEG"};
> +
>  static unsigned int debug;
> =20
> +static bool aspeed_video_alloc_buf(struct aspeed_video *video,
> +				   struct aspeed_video_addr *addr,
> +				   unsigned int size);
> +
> +static void aspeed_video_free_buf(struct aspeed_video *video,
> +				  struct aspeed_video_addr *addr);
> +
>  static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
>  {
>  	int i;
> @@ -547,6 +585,7 @@ static int aspeed_video_start_frame(struct aspeed_vid=
eo *video)
>  	unsigned long flags;
>  	struct aspeed_video_buffer *buf;
>  	u32 seq_ctrl =3D aspeed_video_read(video, VE_SEQ_CTRL);
> +	bool bcd_buf_need =3D (video->format !=3D VIDEO_FMT_STANDARD);
> =20
>  	if (video->v4l2_input_status) {
>  		v4l2_warn(&video->v4l2_dev, "No signal; don't start frame\n");
> @@ -559,6 +598,20 @@ static int aspeed_video_start_frame(struct aspeed_vi=
deo *video)
>  		return -EBUSY;
>  	}
> =20
> +	if (bcd_buf_need && !video->bcd.size) {
> +		if (!aspeed_video_alloc_buf(video, &video->bcd,
> +					    VE_BCD_BUFF_SIZE)) {
> +			dev_err(video->dev, "Failed to allocate BCD buffer\n");
> +			dev_err(video->dev, "don't start frame\n");
> +			return -ENOMEM;
> +		}
> +		aspeed_video_write(video, VE_BCD_ADDR, video->bcd.dma);
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "bcd addr(%#x) size(%d)\n",
> +			 video->bcd.dma, video->bcd.size);
> +	} else if (!bcd_buf_need && video->bcd.size) {
> +		aspeed_video_free_buf(video, &video->bcd);
> +	}
> +
>  	spin_lock_irqsave(&video->lock, flags);
>  	buf =3D list_first_entry_or_null(&video->buffers,
>  				       struct aspeed_video_buffer, link);
> @@ -657,6 +710,24 @@ static void aspeed_video_irq_res_change(struct aspee=
d_video *video, ulong delay)
>  	schedule_delayed_work(&video->res_work, delay);
>  }
> =20
> +static void aspeed_video_swap_src_buf(struct aspeed_video *v)
> +{
> +	if (v->format =3D=3D VIDEO_FMT_STANDARD)
> +		return;
> +
> +	/* Reset bcd buffer to have a full frame update every 8 frames.  */
> +	if (IS_ALIGNED(v->sequence, 8))
> +		memset((u8 *)v->bcd.virt, 0x00, VE_BCD_BUFF_SIZE);
> +
> +	if (v->sequence & 0x01) {
> +		aspeed_video_write(v, VE_SRC0_ADDR, v->srcs[1].dma);
> +		aspeed_video_write(v, VE_SRC1_ADDR, v->srcs[0].dma);
> +	} else {
> +		aspeed_video_write(v, VE_SRC0_ADDR, v->srcs[0].dma);
> +		aspeed_video_write(v, VE_SRC1_ADDR, v->srcs[1].dma);
> +	}
> +}
> +
>  static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  {
>  	struct aspeed_video *video =3D arg;
> @@ -705,6 +776,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *ar=
g)
> =20
>  	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>  		struct aspeed_video_buffer *buf;
> +		bool empty =3D true;
>  		u32 frame_size =3D aspeed_video_read(video,
>  						   video->comp_size_read);
> =20
> @@ -718,13 +790,23 @@ static irqreturn_t aspeed_video_irq(int irq, void *=
arg)
>  		if (buf) {
>  			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, frame_size);
> =20
> -			if (!list_is_last(&buf->link, &video->buffers)) {
> +			/*
> +			 * aspeed_jpeg requires continuous update.
> +			 * On the contrary, standard jpeg can keep last buffer
> +			 * to always have the latest result.
> +			 */
> +			if (video->format =3D=3D VIDEO_FMT_STANDARD &&
> +			    list_is_last(&buf->link, &video->buffers)) {
> +				empty =3D false;
> +				v4l2_warn(&video->v4l2_dev, "skip to keep last frame updated\n");
> +			} else {
>  				buf->vb.vb2_buf.timestamp =3D ktime_get_ns();
>  				buf->vb.sequence =3D video->sequence++;
>  				buf->vb.field =3D V4L2_FIELD_NONE;
>  				vb2_buffer_done(&buf->vb.vb2_buf,
>  						VB2_BUF_STATE_DONE);
>  				list_del(&buf->link);
> +				empty =3D list_empty(&video->buffers);
>  			}
>  		}
>  		spin_unlock(&video->lock);
> @@ -738,7 +820,10 @@ static irqreturn_t aspeed_video_irq(int irq, void *a=
rg)
>  		aspeed_video_write(video, VE_INTERRUPT_STATUS,
>  				   VE_INTERRUPT_COMP_COMPLETE);
>  		sts &=3D ~VE_INTERRUPT_COMP_COMPLETE;
> -		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
> +
> +		aspeed_video_swap_src_buf(video);
> +
> +		if (test_bit(VIDEO_STREAMING, &video->flags) && !empty)
>  			aspeed_video_start_frame(video);
>  	}
> =20
> @@ -1085,10 +1170,14 @@ static void aspeed_video_set_resolution(struct as=
peed_video *video)
>  				   FIELD_PREP(VE_TGS_FIRST, video->frame_top) |
>  				   FIELD_PREP(VE_TGS_LAST,
>  					      video->frame_bottom + 1));
> -		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
> +		aspeed_video_update(video, VE_CTRL,
> +				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
> +				    VE_CTRL_INT_DE);
>  	} else {
>  		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
> -		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
> +		aspeed_video_update(video, VE_CTRL,
> +				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
> +				    VE_CTRL_DIRECT_FETCH);
>  	}
> =20
>  	size *=3D 4;
> @@ -1121,21 +1210,66 @@ static void aspeed_video_set_resolution(struct as=
peed_video *video)
>  		aspeed_video_free_buf(video, &video->srcs[0]);
>  }
> =20
> -static void aspeed_video_init_regs(struct aspeed_video *video)
> +static void aspeed_video_update_regs(struct aspeed_video *video)
>  {
> -	u32 comp_ctrl =3D VE_COMP_CTRL_RSVD |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
> -	u32 ctrl =3D VE_CTRL_AUTO_OR_CURSOR |
> -		FIELD_PREP(VE_CTRL_CAPTURE_FMT, VIDEO_CAP_FMT_YUV_FULL_SWING);
> -	u32 seq_ctrl =3D video->jpeg_mode;
> +	u8 jpeg_hq_quality =3D clamp((int)video->jpeg_hq_quality - 1, 0,
> +				   ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1);
> +	u32 comp_ctrl =3D	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality)=
 |
> +		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
> +		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_LUM, jpeg_hq_quality) |
> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_CHR, jpeg_hq_quality | 0x10);
> +	u32 ctrl =3D 0;
> +	u32 seq_ctrl =3D 0;
> +
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
> +		 video->frame_rate);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
> +		 format_str[video->format],
> +		 video->yuv420 ? "420" : "444");
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
> +		 video->jpeg_quality);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "hq_mode(%s) hq_quality(%d)\n",
> +		 video->hq_mode ? "on" : "off", video->jpeg_hq_quality);
> +
> +	if (video->format =3D=3D VIDEO_FMT_ASPEED)
> +		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
> +	else
> +		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
> =20
>  	if (video->frame_rate)
>  		ctrl |=3D FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
> =20
> +	if (video->format =3D=3D VIDEO_FMT_STANDARD) {
> +		comp_ctrl &=3D ~FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode);
> +		seq_ctrl |=3D video->jpeg_mode;
> +	}
> +
>  	if (video->yuv420)
>  		seq_ctrl |=3D VE_SEQ_CTRL_YUV420;
> =20
> +	if (video->jpeg.virt)
> +		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
> +
> +
> +	/* Set control registers */
> +	aspeed_video_update(video, VE_SEQ_CTRL,
> +			    video->jpeg_mode | VE_SEQ_CTRL_YUV420,
> +			    seq_ctrl);
> +	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
> +	aspeed_video_update(video, VE_COMP_CTRL,
> +			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
> +			    VE_COMP_CTRL_EN_HQ | VE_COMP_CTRL_HQ_DCT_LUM |
> +			    VE_COMP_CTRL_HQ_DCT_CHR | VE_COMP_CTRL_VQ_4COLOR |
> +			    VE_COMP_CTRL_VQ_DCT_ONLY,
> +			    comp_ctrl);
> +}
> +
> +static void aspeed_video_init_regs(struct aspeed_video *video)
> +{
> +	u32 ctrl =3D VE_CTRL_AUTO_OR_CURSOR |
> +		FIELD_PREP(VE_CTRL_CAPTURE_FMT, VIDEO_CAP_FMT_YUV_FULL_SWING);
> +
>  	/* Unlock VE registers */
>  	aspeed_video_write(video, VE_PROTECTION_KEY, VE_PROTECTION_KEY_UNLOCK);
> =20
> @@ -1150,9 +1284,8 @@ static void aspeed_video_init_regs(struct aspeed_vi=
deo *video)
>  	aspeed_video_write(video, VE_JPEG_ADDR, video->jpeg.dma);
> =20
>  	/* Set control registers */
> -	aspeed_video_write(video, VE_SEQ_CTRL, seq_ctrl);
>  	aspeed_video_write(video, VE_CTRL, ctrl);
> -	aspeed_video_write(video, VE_COMP_CTRL, comp_ctrl);
> +	aspeed_video_write(video, VE_COMP_CTRL, VE_COMP_CTRL_RSVD);
> =20
>  	/* Don't downscale */
>  	aspeed_video_write(video, VE_SCALING_FACTOR, 0x10001000);
> @@ -1168,6 +1301,8 @@ static void aspeed_video_init_regs(struct aspeed_vi=
deo *video)
>  			   FIELD_PREP(VE_MODE_DT_HOR_STABLE, 6) |
>  			   FIELD_PREP(VE_MODE_DT_VER_STABLE, 6) |
>  			   FIELD_PREP(VE_MODE_DT_EDG_THROD, 0x65));
> +
> +	aspeed_video_write(video, VE_BCD_CTRL, 0);
>  }
> =20
>  static void aspeed_video_start(struct aspeed_video *video)
> @@ -1201,6 +1336,9 @@ static void aspeed_video_stop(struct aspeed_video *=
video)
>  	if (video->srcs[1].size)
>  		aspeed_video_free_buf(video, &video->srcs[1]);
> =20
> +	if (video->bcd.size)
> +		aspeed_video_free_buf(video, &video->bcd);
> +
>  	video->v4l2_input_status =3D V4L2_IN_ST_NO_SIGNAL;
>  	video->flags =3D 0;
>  }
> @@ -1219,10 +1357,12 @@ static int aspeed_video_querycap(struct file *fil=
e, void *fh,
>  static int aspeed_video_enum_format(struct file *file, void *fh,
>  				    struct v4l2_fmtdesc *f)
>  {
> +	struct aspeed_video *video =3D video_drvdata(file);
> +
>  	if (f->index)
>  		return -EINVAL;
> =20
> -	f->pixelformat =3D V4L2_PIX_FMT_JPEG;
> +	f->pixelformat =3D video->pix_fmt.pixelformat;
> =20
>  	return 0;
>  }
> @@ -1237,6 +1377,29 @@ static int aspeed_video_get_format(struct file *fi=
le, void *fh,
>  	return 0;
>  }
> =20
> +static int aspeed_video_set_format(struct file *file, void *fh,
> +				   struct v4l2_format *f)
> +{
> +	struct aspeed_video *video =3D video_drvdata(file);
> +
> +	if (vb2_is_busy(&video->queue))
> +		return -EBUSY;
> +
> +	switch (f->fmt.pix.pixelformat) {
> +	case V4L2_PIX_FMT_JPEG:
> +		video->format =3D VIDEO_FMT_STANDARD;
> +		break;
> +	case V4L2_PIX_FMT_AJPG:
> +		video->format =3D VIDEO_FMT_ASPEED;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	video->pix_fmt.pixelformat =3D f->fmt.pix.pixelformat;
> +
> +	return 0;
> +}
> +
>  static int aspeed_video_enum_input(struct file *file, void *fh,
>  				   struct v4l2_input *inp)
>  {
> @@ -1454,7 +1617,7 @@ static const struct v4l2_ioctl_ops aspeed_video_ioc=
tl_ops =3D {
> =20
>  	.vidioc_enum_fmt_vid_cap =3D aspeed_video_enum_format,
>  	.vidioc_g_fmt_vid_cap =3D aspeed_video_get_format,
> -	.vidioc_s_fmt_vid_cap =3D aspeed_video_get_format,
> +	.vidioc_s_fmt_vid_cap =3D aspeed_video_set_format,
>  	.vidioc_try_fmt_vid_cap =3D aspeed_video_get_format,
> =20
>  	.vidioc_reqbufs =3D vb2_ioctl_reqbufs,
> @@ -1486,27 +1649,6 @@ static const struct v4l2_ioctl_ops aspeed_video_io=
ctl_ops =3D {
>  	.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
>  };
> =20
> -static void aspeed_video_update_jpeg_quality(struct aspeed_video *video)
> -{
> -	u32 comp_ctrl =3D FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality)=
 |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
> -
> -	aspeed_video_update(video, VE_COMP_CTRL,
> -			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
> -			    comp_ctrl);
> -}
> -
> -static void aspeed_video_update_subsampling(struct aspeed_video *video)
> -{
> -	if (video->jpeg.virt)
> -		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
> -
> -	if (video->yuv420)
> -		aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_YUV420);
> -	else
> -		aspeed_video_update(video, VE_SEQ_CTRL, VE_SEQ_CTRL_YUV420, 0);
> -}
> -
>  static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct aspeed_video *video =3D container_of(ctrl->handler,
> @@ -1516,16 +1658,23 @@ static int aspeed_video_set_ctrl(struct v4l2_ctrl=
 *ctrl)
>  	switch (ctrl->id) {
>  	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
>  		video->jpeg_quality =3D ctrl->val;
> -		aspeed_video_update_jpeg_quality(video);
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
>  		break;
>  	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
> -		if (ctrl->val =3D=3D V4L2_JPEG_CHROMA_SUBSAMPLING_420) {
> -			video->yuv420 =3D true;
> -			aspeed_video_update_subsampling(video);
> -		} else {
> -			video->yuv420 =3D false;
> -			aspeed_video_update_subsampling(video);
> -		}
> +		video->yuv420 =3D (ctrl->val =3D=3D V4L2_JPEG_CHROMA_SUBSAMPLING_420);
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
> +		break;
> +	case V4L2_CID_ASPEED_HQ_MODE:
> +		video->hq_mode =3D ctrl->val;
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
> +		break;
> +	case V4L2_CID_ASPEED_HQ_JPEG_QUALITY:
> +		video->jpeg_hq_quality =3D ctrl->val;
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -1538,6 +1687,28 @@ static const struct v4l2_ctrl_ops aspeed_video_ctr=
l_ops =3D {
>  	.s_ctrl =3D aspeed_video_set_ctrl,
>  };
> =20
> +static const struct v4l2_ctrl_config aspeed_ctrl_HQ_mode =3D {
> +	.ops =3D &aspeed_video_ctrl_ops,
> +	.id =3D V4L2_CID_ASPEED_HQ_MODE,
> +	.name =3D "Aspeed HQ Mode",
> +	.type =3D V4L2_CTRL_TYPE_BOOLEAN,
> +	.min =3D false,
> +	.max =3D true,
> +	.step =3D 1,
> +	.def =3D false,
> +};
> +
> +static const struct v4l2_ctrl_config aspeed_ctrl_HQ_jpeg_quality =3D {
> +	.ops =3D &aspeed_video_ctrl_ops,
> +	.id =3D V4L2_CID_ASPEED_HQ_JPEG_QUALITY,
> +	.name =3D "Aspeed HQ Quality",
> +	.type =3D V4L2_CTRL_TYPE_INTEGER,
> +	.min =3D 1,
> +	.max =3D ASPEED_VIDEO_JPEG_NUM_QUALITIES,
> +	.step =3D 1,
> +	.def =3D 1,
> +};
> +
>  static void aspeed_video_resolution_work(struct work_struct *work)
>  {
>  	struct delayed_work *dwork =3D to_delayed_work(work);
> @@ -1552,6 +1723,8 @@ static void aspeed_video_resolution_work(struct wor=
k_struct *work)
> =20
>  	aspeed_video_init_regs(video);
> =20
> +	aspeed_video_update_regs(video);
> +
>  	aspeed_video_get_resolution(video);
> =20
>  	if (video->detected_timings.width !=3D video->active_timings.width ||
> @@ -1662,6 +1835,8 @@ static int aspeed_video_start_streaming(struct vb2_=
queue *q,
>  	video->perf.duration_max =3D 0;
>  	video->perf.duration_min =3D 0xffffffff;
> =20
> +	aspeed_video_update_regs(video);
> +
>  	rc =3D aspeed_video_start_frame(video);
>  	if (rc) {
>  		aspeed_video_bufs_done(video, VB2_BUF_STATE_QUEUED);
> @@ -1800,6 +1975,7 @@ static int aspeed_video_setup_video(struct aspeed_v=
ideo *video)
>  	struct v4l2_device *v4l2_dev =3D &video->v4l2_dev;
>  	struct vb2_queue *vbq =3D &video->queue;
>  	struct video_device *vdev =3D &video->vdev;
> +	struct v4l2_ctrl_handler *hdl =3D &video->ctrl_handler;
>  	int rc;
> =20
>  	video->pix_fmt.pixelformat =3D V4L2_PIX_FMT_JPEG;
> @@ -1814,16 +1990,18 @@ static int aspeed_video_setup_video(struct aspeed=
_video *video)
>  		return rc;
>  	}
> =20
> -	v4l2_ctrl_handler_init(&video->ctrl_handler, 2);
> -	v4l2_ctrl_new_std(&video->ctrl_handler, &aspeed_video_ctrl_ops,
> +	v4l2_ctrl_handler_init(hdl, 4);
> +	v4l2_ctrl_new_std(hdl, &aspeed_video_ctrl_ops,
>  			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 0,
>  			  ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1, 1, 0);
> -	v4l2_ctrl_new_std_menu(&video->ctrl_handler, &aspeed_video_ctrl_ops,
> +	v4l2_ctrl_new_std_menu(hdl, &aspeed_video_ctrl_ops,
>  			       V4L2_CID_JPEG_CHROMA_SUBSAMPLING,
>  			       V4L2_JPEG_CHROMA_SUBSAMPLING_420, mask,
>  			       V4L2_JPEG_CHROMA_SUBSAMPLING_444);
> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_mode, NULL);
> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_jpeg_quality, NULL);
> =20
> -	rc =3D video->ctrl_handler.error;
> +	rc =3D hdl->error;
>  	if (rc) {
>  		v4l2_ctrl_handler_free(&video->ctrl_handler);
>  		v4l2_device_unregister(v4l2_dev);
> @@ -1832,7 +2010,7 @@ static int aspeed_video_setup_video(struct aspeed_v=
ideo *video)
>  		return rc;
>  	}
> =20
> -	v4l2_dev->ctrl_handler =3D &video->ctrl_handler;
> +	v4l2_dev->ctrl_handler =3D hdl;
> =20
>  	vbq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  	vbq->io_modes =3D VB2_MMAP | VB2_READ | VB2_DMABUF;
> @@ -1980,6 +2158,7 @@ static int aspeed_video_probe(struct platform_devic=
e *pdev)
>  	video->comp_size_read =3D config->comp_size_read;
> =20
>  	video->frame_rate =3D 30;
> +	video->jpeg_hq_quality =3D 1;
>  	video->dev =3D &pdev->dev;
>  	spin_lock_init(&video->lock);
>  	mutex_init(&video->video_lock);
> diff --git a/include/uapi/linux/aspeed-video.h b/include/uapi/linux/aspee=
d-video.h
> new file mode 100644
> index 000000000000..63f0432192a5
> --- /dev/null
> +++ b/include/uapi/linux/aspeed-video.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2021 ASPEED Technology Inc.
> + */
> +
> +#ifndef _UAPI_LINUX_ASPEED_VIDEO_H
> +#define _UAPI_LINUX_ASPEED_VIDEO_H
> +
> +#include <linux/v4l2-controls.h>
> +
> +#define V4L2_CID_ASPEED_COMPRESSION_SCHEME	(V4L2_CID_USER_ASPEED_BASE  +=
 1)
> +#define V4L2_CID_ASPEED_HQ_MODE			(V4L2_CID_USER_ASPEED_BASE  + 2)
> +#define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(V4L2_CID_USER_ASPEED_BASE  + 3=
)

I believe you are missing documentation for these. Even vendor CID get to b=
e
documented in the RST doc, it also helps us reviewer to judge if these are
trully vendor controls or should be generalized, its not currently possible=
 to
make an opinion.

> +
> +#endif /* _UAPI_LINUX_ASPEED_VIDEO_H */

