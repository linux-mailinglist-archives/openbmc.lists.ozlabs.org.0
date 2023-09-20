Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDFF7A88B2
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 17:43:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrN971fRsz3cNv
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 01:43:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=ud8i=fe=xs4all.nl=hverkuil-cisco@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrN8l4cFrz3c53
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 01:43:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id F3174CE1170;
	Wed, 20 Sep 2023 15:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE46DC433C8;
	Wed, 20 Sep 2023 15:42:56 +0000 (UTC)
Message-ID: <b8f8876e-d712-4ffb-b082-b8e02363ec33@xs4all.nl>
Date: Wed, 20 Sep 2023 17:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 7/7] media: nuvoton: Add driver for NPCM video capture
 and encoding engine
Content-Language: en-US, nl
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 andrzej.p@collabora.com
References: <20230920022812.601800-1-milkfafa@gmail.com>
 <20230920022812.601800-8-milkfafa@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230920022812.601800-8-milkfafa@gmail.com>
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

On 20/09/2023 04:28, Marvin Lin wrote:
> Add driver for Video Capture/Differentiation Engine (VCD) and Encoding
> Compression Engine (ECE) present on Nuvoton NPCM SoCs. As described in
> the datasheet NPCM750D_DS_Rev_1.0, the VCD can capture frames from
> digital video input and compare two frames in memory, and then the ECE
> can compress the frame data into HEXTILE format. This driver implements
> V4L2 interfaces and provides user controls to support KVM feature, also
> tested with VNC Viewer ver.6.22.826 and openbmc/obmc-ikvm.
> 
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>

I'm getting two sparse warnings:

drivers/media/platform/nuvoton/npcm-video.c:227:27: warning: incorrect type in argument 1 (different address spaces)
drivers/media/platform/nuvoton/npcm-video.c:227:27:    expected void const volatile [noderef] __iomem *addr
drivers/media/platform/nuvoton/npcm-video.c:227:27:    got void *
drivers/media/platform/nuvoton/npcm-video.c:1050:20: warning: context imbalance in 'npcm_video_irq' - different lock contexts for basic block

That last one is a missing unlock:

> +static irqreturn_t npcm_video_irq(int irq, void *arg)
> +{
> +	struct npcm_video *video = arg;
> +	struct regmap *vcd = video->vcd_regmap;
> +	struct npcm_video_buffer *buf;
> +	unsigned int index, size, status, fmt;
> +	dma_addr_t dma_addr;
> +	void *addr;
> +	static const struct v4l2_event ev = {
> +		.type = V4L2_EVENT_SOURCE_CHANGE,
> +		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
> +	};
> +
> +	regmap_read(vcd, VCD_STAT, &status);
> +	dev_dbg(video->dev, "VCD irq status 0x%x\n", status);
> +
> +	regmap_write(vcd, VCD_STAT, VCD_STAT_CLEAR);
> +
> +	if (test_bit(VIDEO_STOPPED, &video->flags) ||
> +	    !test_bit(VIDEO_STREAMING, &video->flags))
> +		return IRQ_NONE;
> +
> +	if (status & VCD_STAT_DONE) {
> +		regmap_write(vcd, VCD_INTE, 0);
> +		spin_lock(&video->lock);
> +		clear_bit(VIDEO_CAPTURING, &video->flags);
> +		buf = list_first_entry_or_null(&video->buffers,
> +					       struct npcm_video_buffer, link);
> +		if (!buf) {
> +			spin_unlock(&video->lock);
> +			return IRQ_NONE;
> +		}
> +
> +		addr = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +		index = buf->vb.vb2_buf.index;
> +		fmt = video->pix_fmt.pixelformat;
> +
> +		switch (fmt) {
> +		case V4L2_PIX_FMT_RGB565:
> +			size = npcm_video_raw(video, index, addr);
> +			break;
> +		case V4L2_PIX_FMT_HEXTILE:
> +			dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> +			size = npcm_video_hextile(video, index, dma_addr, addr);
> +			break;
> +		default:

Missing unlock here.

> +			return IRQ_NONE;
> +		}
> +
> +		vb2_set_plane_payload(&buf->vb.vb2_buf, 0, size);
> +		buf->vb.vb2_buf.timestamp = ktime_get_ns();
> +		buf->vb.sequence = video->sequence++;
> +		buf->vb.field = V4L2_FIELD_NONE;
> +
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +		list_del(&buf->link);
> +		spin_unlock(&video->lock);
> +
> +		if (npcm_video_start_frame(video))
> +			dev_err(video->dev, "Failed to capture next frame\n");
> +	}
> +
> +	/* Resolution changed */
> +	if (status & VCD_STAT_VHT_CHG || status & VCD_STAT_HAC_CHG) {
> +		if (!test_bit(VIDEO_RES_CHANGING, &video->flags)) {
> +			set_bit(VIDEO_RES_CHANGING, &video->flags);
> +
> +			vb2_queue_error(&video->queue);
> +			v4l2_event_queue(&video->vdev, &ev);
> +		}
> +	}
> +
> +	if (status & VCD_STAT_IFOR || status & VCD_STAT_IFOT) {
> +		dev_warn(video->dev, "VCD FIFO overrun or over thresholds\n");
> +		if (npcm_video_start_frame(video))
> +			dev_err(video->dev, "Failed to recover from FIFO overrun\n");
> +	}
> +
> +	return IRQ_HANDLED;
> +}

Regards,

	Hans

