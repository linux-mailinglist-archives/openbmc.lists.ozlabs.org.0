Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936D78D4B4
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 11:42:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbK8r20hpz3bwp
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 19:42:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=7pne=ep=xs4all.nl=hverkuil-cisco@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbK8V0VLtz2yVn
	for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2023 19:42:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00C7662843;
	Wed, 30 Aug 2023 09:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3490FC433C8;
	Wed, 30 Aug 2023 09:42:26 +0000 (UTC)
Message-ID: <0c91f68d-d172-bd14-9115-b6977ad2d01f@xs4all.nl>
Date: Wed, 30 Aug 2023 11:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v14 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
Content-Language: en-US, nl
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 andrzej.p@collabora.com
References: <20230828091859.3889817-1-milkfafa@gmail.com>
 <20230828091859.3889817-8-milkfafa@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230828091859.3889817-8-milkfafa@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kwliu@nuvoton.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Marvin,

A few minor change requests, and a question w.r.t. the V4L2_CID_NPCM_RECT_COUNT
control:

On 28/08/2023 11:18, Marvin Lin wrote:
> Add driver for Video Capture/Differentiation Engine (VCD) and Encoding
> Compression Engine (ECE) present on Nuvoton NPCM SoCs. As described in
> the datasheet NPCM750D_DS_Rev_1.0, the VCD can capture a frame from
> digital video input and compare two frames in memory, and then the ECE
> can compress the frame data into HEXTILE format. This driver implements
> V4L2 interfaces and provides user controls to support KVM feature, also
> tested with VNC Viewer ver.6.22.826 and openbmc/obmc-ikvm.
> 
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> ---
>  MAINTAINERS                                 |   12 +
>  drivers/media/platform/Kconfig              |    1 +
>  drivers/media/platform/Makefile             |    1 +
>  drivers/media/platform/nuvoton/Kconfig      |   15 +
>  drivers/media/platform/nuvoton/Makefile     |    2 +
>  drivers/media/platform/nuvoton/npcm-regs.h  |  152 ++
>  drivers/media/platform/nuvoton/npcm-video.c | 1840 +++++++++++++++++++
>  7 files changed, 2023 insertions(+)
>  create mode 100644 drivers/media/platform/nuvoton/Kconfig
>  create mode 100644 drivers/media/platform/nuvoton/Makefile
>  create mode 100644 drivers/media/platform/nuvoton/npcm-regs.h
>  create mode 100644 drivers/media/platform/nuvoton/npcm-video.c
> 

<snip>

> +static int npcm_video_querycap(struct file *file, void *fh,
> +			       struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, DEVICE_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, "NPCM Video Engine", sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s", DEVICE_NAME);

You can drop this last line, it is already filled in by the V4L2 core for
platform devices.

> +
> +	return 0;
> +}
> +
> +static int npcm_video_enum_format(struct file *file, void *fh,
> +				  struct v4l2_fmtdesc *f)
> +{
> +	struct npcm_video *video = video_drvdata(file);
> +	const struct npcm_fmt *fmt;
> +
> +	if (f->index >= NUM_FORMATS)
> +		return -EINVAL;
> +
> +	fmt = &npcm_fmt_list[f->index];
> +	if (fmt->fourcc == V4L2_PIX_FMT_HEXTILE && !video->ece.enable)
> +		return -EINVAL;
> +
> +	f->pixelformat = fmt->fourcc;
> +	return 0;
> +}
> +
> +static int npcm_video_try_format(struct file *file, void *fh,
> +				 struct v4l2_format *f)
> +{
> +	struct npcm_video *video = video_drvdata(file);
> +	const struct npcm_fmt *fmt;
> +
> +	fmt = npcm_video_find_format(f);
> +
> +	/* If format not found or HEXTILE not supported, use RGB565 as default */
> +	if (!fmt || (fmt->fourcc == V4L2_PIX_FMT_HEXTILE && !video->ece.enable))
> +		f->fmt.pix.pixelformat = npcm_fmt_list[0].fourcc;
> +
> +	f->fmt.pix.field = V4L2_FIELD_NONE;
> +	f->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
> +	f->fmt.pix.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	f->fmt.pix.width = video->pix_fmt.width;
> +	f->fmt.pix.height = video->pix_fmt.height;
> +	f->fmt.pix.bytesperline = video->bytesperline;
> +	f->fmt.pix.sizeimage = video->pix_fmt.sizeimage;
> +
> +	return 0;
> +}
> +
> +static int npcm_video_get_format(struct file *file, void *fh,
> +				 struct v4l2_format *f)
> +{
> +	struct npcm_video *video = video_drvdata(file);
> +
> +	f->fmt.pix = video->pix_fmt;
> +	return 0;
> +}
> +
> +static int npcm_video_set_format(struct file *file, void *fh,
> +				 struct v4l2_format *f)
> +{
> +	struct npcm_video *video = video_drvdata(file);
> +	int ret;
> +
> +	ret = npcm_video_try_format(file, fh, f);
> +	if (ret)
> +		return ret;
> +
> +	if (vb2_is_busy(&video->queue)) {
> +		dev_err(video->dev, "%s device busy\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	video->pix_fmt.pixelformat = f->fmt.pix.pixelformat;
> +	return 0;
> +}
> +
> +static int npcm_video_enum_input(struct file *file, void *fh,
> +				 struct v4l2_input *inp)
> +{
> +	struct npcm_video *video = video_drvdata(file);
> +
> +	if (inp->index)
> +		return -EINVAL;
> +
> +	strscpy(inp->name, "Host VGA capture", sizeof(inp->name));
> +	inp->type = V4L2_INPUT_TYPE_CAMERA;
> +	inp->capabilities = V4L2_IN_CAP_DV_TIMINGS;
> +	inp->status = video->v4l2_input_status;
> +
> +	return 0;
> +}
> +
> +static int npcm_video_get_input(struct file *file, void *fh, unsigned int *i)
> +{
> +	*i = 0;
> +
> +	return 0;
> +}
> +
> +static int npcm_video_set_input(struct file *file, void *fh, unsigned int i)
> +{
> +	if (i)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int npcm_video_set_dv_timings(struct file *file, void *fh,
> +				     struct v4l2_dv_timings *timings)
> +{
> +	struct npcm_video *video = video_drvdata(file);
> +	int rc;
> +
> +	if (timings->bt.width == video->active_timings.width &&
> +	    timings->bt.height == video->active_timings.height)
> +		return 0;
> +
> +	if (vb2_is_busy(&video->queue)) {
> +		dev_err(video->dev, "%s device busy\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	rc = npcm_video_set_resolution(video, &timings->bt);
> +	if (rc)
> +		return rc;
> +
> +	timings->type = V4L2_DV_BT_656_1120;
> +
> +	return 0;
> +}
> +
> +static int npcm_video_get_dv_timings(struct file *file, void *fh,
> +				     struct v4l2_dv_timings *timings)
> +{
> +	struct npcm_video *video = video_drvdata(file);
> +
> +	timings->type = V4L2_DV_BT_656_1120;
> +	timings->bt = video->active_timings;
> +
> +	return 0;
> +}
> +
> +static int npcm_video_query_dv_timings(struct file *file, void *fh,
> +				       struct v4l2_dv_timings *timings)
> +{
> +	struct npcm_video *video = video_drvdata(file);
> +
> +	npcm_video_detect_resolution(video);
> +	timings->type = V4L2_DV_BT_656_1120;
> +	timings->bt = video->detected_timings;
> +
> +	return video->v4l2_input_status ? -ENOLINK : 0;
> +}
> +
> +static int npcm_video_enum_dv_timings(struct file *file, void *fh,
> +				      struct v4l2_enum_dv_timings *timings)
> +{
> +	return v4l2_enum_dv_timings_cap(timings, &npcm_video_timings_cap,
> +					NULL, NULL);
> +}
> +
> +static int npcm_video_dv_timings_cap(struct file *file, void *fh,
> +				     struct v4l2_dv_timings_cap *cap)
> +{
> +	*cap = npcm_video_timings_cap;
> +
> +	return 0;
> +}
> +
> +static int npcm_video_sub_event(struct v4l2_fh *fh,
> +				const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		return v4l2_src_change_event_subscribe(fh, sub);
> +	}
> +
> +	return v4l2_ctrl_subscribe_event(fh, sub);
> +}
> +
> +static const struct v4l2_ioctl_ops npcm_video_ioctls = {
> +	.vidioc_querycap = npcm_video_querycap,
> +
> +	.vidioc_enum_fmt_vid_cap = npcm_video_enum_format,
> +	.vidioc_g_fmt_vid_cap = npcm_video_get_format,
> +	.vidioc_s_fmt_vid_cap = npcm_video_set_format,
> +	.vidioc_try_fmt_vid_cap = npcm_video_try_format,
> +
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +
> +	.vidioc_enum_input = npcm_video_enum_input,
> +	.vidioc_g_input = npcm_video_get_input,
> +	.vidioc_s_input = npcm_video_set_input,
> +
> +	.vidioc_s_dv_timings = npcm_video_set_dv_timings,
> +	.vidioc_g_dv_timings = npcm_video_get_dv_timings,
> +	.vidioc_query_dv_timings = npcm_video_query_dv_timings,
> +	.vidioc_enum_dv_timings = npcm_video_enum_dv_timings,
> +	.vidioc_dv_timings_cap = npcm_video_dv_timings_cap,
> +
> +	.vidioc_subscribe_event = npcm_video_sub_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static int npcm_video_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct npcm_video *video = container_of(ctrl->handler, struct npcm_video,
> +						ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_NPCM_CAPTURE_MODE:
> +		if (ctrl->val == V4L2_NPCM_CAPTURE_MODE_COMPLETE)
> +			video->ctrl_cmd = VCD_CMD_OPERATION_CAPTURE;
> +		else if (ctrl->val == V4L2_NPCM_CAPTURE_MODE_DIFF)
> +			video->ctrl_cmd = VCD_CMD_OPERATION_COMPARE;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int npcm_video_get_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct npcm_video *video = container_of(ctrl->handler, struct npcm_video,
> +						ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_NPCM_RECT_COUNT:
> +		ctrl->val = video->rect[video->vb_index];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops npcm_video_ctrl_ops = {
> +	.s_ctrl = npcm_video_set_ctrl,
> +	.g_volatile_ctrl = npcm_video_get_volatile_ctrl,
> +};
> +
> +static const char * const npcm_ctrl_capture_mode_menu[] = {
> +	"COMPLETE mode",
> +	"DIFF mode",

Hmm, I would drop the 'mode' bit, since it is already obvious that
these are the modes.

> +	NULL,
> +};
> +
> +static const struct v4l2_ctrl_config npcm_ctrl_capture_mode = {
> +	.ops = &npcm_video_ctrl_ops,
> +	.id = V4L2_CID_NPCM_CAPTURE_MODE,
> +	.name = "NPCM Video Capture Mode",
> +	.type = V4L2_CTRL_TYPE_MENU,
> +	.min = 0,
> +	.max = V4L2_NPCM_CAPTURE_MODE_DIFF,
> +	.def = 0,
> +	.qmenu = npcm_ctrl_capture_mode_menu,
> +};
> +
> +static const struct v4l2_ctrl_config npcm_ctrl_rect_count = {
> +	.ops = &npcm_video_ctrl_ops,
> +	.id = V4L2_CID_NPCM_RECT_COUNT,
> +	.name = "NPCM Compressed Hextile Rectangle Count",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.flags = V4L2_CTRL_FLAG_VOLATILE,
> +	.min = 0,
> +	.max = (MAX_WIDTH / RECT_W) * (MAX_HEIGHT / RECT_H),
> +	.step = 1,
> +	.def = 0,
> +};

Just to confirm: you decided against using an integer array control?

There is a real danger that if userspace isn't reading this control
quickly enough (i.e. before the next frame arrives at the driver), then
the control's value is that of that next frame instead of the current
frame.

It doesn't feel robust to me.

<snip>

Regards,

	Hans
