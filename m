Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0599665757B
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 11:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NhpGH6nCdz3c34
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 21:50:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhpFy4y91z30hl
	for <openbmc@lists.ozlabs.org>; Wed, 28 Dec 2022 21:50:28 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aeff1.dynamic.kabel-deutschland.de [95.90.239.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0965C60027FC2;
	Wed, 28 Dec 2022 11:50:25 +0100 (CET)
Message-ID: <b8f173c0-6d40-d6aa-543e-fa8b06557f4f@molgen.mpg.de>
Date: Wed, 28 Dec 2022 11:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
Content-Language: en-US
To: Marvin Lin <milkfafa@gmail.com>
References: <20221227095123.2447948-1-milkfafa@gmail.com>
 <20221227095123.2447948-8-milkfafa@gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20221227095123.2447948-8-milkfafa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kflin@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Lin,


Thank you for the patches.

Am 27.12.22 um 10:51 schrieb Marvin Lin:
> Add driver for Video Capture/Differentiation Engine (VCD) and Encoding
> Compression Engine (ECE) present on Nuvoton NPCM SoCs. The VCD can
> capture and differentiate video data from digital or analog sources,

“differentiate video data” sounds uncommon to me. Am I just ignorant or 
is there a better term?

> then the ECE will compress the data into HEXTILE format. This driver
> implements V4L2 interfaces and provides user controls to support KVM
> feature, also tested with VNC Viewer and openbmc/obmc-ikvm.

Wich VNC viewer and version? Maybe also paste the new dev_ log messages 
you get from one boot.

It’d be great if you noted the datasheet name and revision.

> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> ---
>   MAINTAINERS                                 |   12 +
>   drivers/media/platform/Kconfig              |    1 +
>   drivers/media/platform/Makefile             |    1 +
>   drivers/media/platform/nuvoton/Kconfig      |   15 +
>   drivers/media/platform/nuvoton/Makefile     |    2 +
>   drivers/media/platform/nuvoton/npcm-regs.h  |  171 ++
>   drivers/media/platform/nuvoton/npcm-video.c | 1814 +++++++++++++++++++
>   7 files changed, 2016 insertions(+)
>   create mode 100644 drivers/media/platform/nuvoton/Kconfig
>   create mode 100644 drivers/media/platform/nuvoton/Makefile
>   create mode 100644 drivers/media/platform/nuvoton/npcm-regs.h
>   create mode 100644 drivers/media/platform/nuvoton/npcm-video.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f61eb221415b..1b56042d1dc3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2603,6 +2603,18 @@ F:	drivers/rtc/rtc-nct3018y.c
>   F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
>   F:	include/dt-bindings/clock/nuvoton,npcm845-clk.h
>   
> +ARM/NUVOTON NPCM VIDEO ENGINE DRIVER
> +M:	Joseph Liu <kwliu@nuvoton.com>
> +M:	Marvin Lin <kflin@nuvoton.com>
> +L:	linux-media@vger.kernel.org
> +L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
> +F:	Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml
> +F:	Documentation/userspace-api/media/drivers/npcm-video.rst
> +F:	drivers/media/platform/nuvoton/
> +F:	include/uapi/linux/npcm-video.h
> +
>   ARM/NUVOTON WPCM450 ARCHITECTURE
>   M:	Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>   L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index ee579916f874..91e54215de3a 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -73,6 +73,7 @@ source "drivers/media/platform/intel/Kconfig"
>   source "drivers/media/platform/marvell/Kconfig"
>   source "drivers/media/platform/mediatek/Kconfig"
>   source "drivers/media/platform/microchip/Kconfig"
> +source "drivers/media/platform/nuvoton/Kconfig"
>   source "drivers/media/platform/nvidia/Kconfig"
>   source "drivers/media/platform/nxp/Kconfig"
>   source "drivers/media/platform/qcom/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 5453bb868e67..3296ec1ebe16 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -16,6 +16,7 @@ obj-y += intel/
>   obj-y += marvell/
>   obj-y += mediatek/
>   obj-y += microchip/
> +obj-y += nuvoton/
>   obj-y += nvidia/
>   obj-y += nxp/
>   obj-y += qcom/
> diff --git a/drivers/media/platform/nuvoton/Kconfig b/drivers/media/platform/nuvoton/Kconfig
> new file mode 100644
> index 000000000000..5047d1ba3de5
> --- /dev/null
> +++ b/drivers/media/platform/nuvoton/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +comment "Nuvoton media platform drivers"
> +
> +config VIDEO_NPCM_VCD_ECE
> +	tristate "Nuvoton NPCM Video Capture/Encode Engine driver"
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on VIDEO_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	  Support for the Video Capture/Differentiation Engine (VCD) and
> +	  Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.
> +	  The VCD can capture and differentiate video data from digital or
> +	  analog sources, then the ECE will compress the data into HEXTILE
> +	  format.
> diff --git a/drivers/media/platform/nuvoton/Makefile b/drivers/media/platform/nuvoton/Makefile
> new file mode 100644
> index 000000000000..74a4e3fc8555
> --- /dev/null
> +++ b/drivers/media/platform/nuvoton/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_VIDEO_NPCM_VCD_ECE) += npcm-video.o
> diff --git a/drivers/media/platform/nuvoton/npcm-regs.h b/drivers/media/platform/nuvoton/npcm-regs.h
> new file mode 100644
> index 000000000000..f528f5726307
> --- /dev/null
> +++ b/drivers/media/platform/nuvoton/npcm-regs.h
> @@ -0,0 +1,171 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Register definition header for NPCM video driver
> + *
> + * Copyright (C) 2022 Nuvoton Technologies
> + */
> +
> +#ifndef _NPCM_REGS_H
> +#define _NPCM_REGS_H

[…]

> +struct npcm_video_addr {
> +	size_t size;
> +	dma_addr_t dma;
> +	void *virt;
> +};
> +
> +struct npcm_video_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head link;
> +};
> +
> +#define to_npcm_video_buffer(x) \
> +	container_of((x), struct npcm_video_buffer, vb)
> +
> +enum {
> +	VIDEO_STREAMING,
> +	VIDEO_FRAME_INPRG,
> +	VIDEO_STOPPED,
> +};
> +
> +struct rect_list {
> +	struct v4l2_clip clip;
> +	struct list_head list;
> +};
> +
> +struct rect_list_info {
> +	struct rect_list *list;
> +	struct rect_list *first;
> +	struct list_head *head;
> +	unsigned int index;
> +	unsigned int tile_perline;
> +	unsigned int tile_perrow;
> +	unsigned int offset_perline;
> +	unsigned int tile_size;
> +	unsigned int tile_cnt;
> +};
> +
> +struct npcm_ece {
> +	struct regmap *regmap;
> +	atomic_t clients;
> +	struct reset_control *reset;
> +};
> +
> +struct npcm_video {
> +	struct regmap *gcr_regmap;
> +	struct regmap *gfx_regmap;
> +	struct regmap *vcd_regmap;
> +
> +	struct device *dev;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_pix_format pix_fmt;
> +	struct v4l2_bt_timings active_timings;
> +	struct v4l2_bt_timings detected_timings;
> +	u32 v4l2_input_status;
> +	struct vb2_queue queue;
> +	struct video_device vdev;
> +	struct mutex video_lock; /* v4l2 and videobuf2 lock */
> +
> +	struct list_head buffers;
> +	spinlock_t lock; /* buffer list lock */
> +	unsigned long flags;
> +	unsigned int sequence;
> +
> +	size_t max_buffer_size;
> +	struct npcm_video_addr src;
> +	struct reset_control *reset;
> +	struct npcm_ece ece;
> +
> +	unsigned int frame_rate;
> +	unsigned int vb_index;
> +	u32 bytesperline;
> +	u8 bytesperpixel;
> +	u32 rect_cnt;
> +	u8 num_buffers;
> +	struct list_head *list;
> +	u32 *rect;
> +	int ctrl_cmd;
> +	int op_cmd;
> +};
> +
> +#define to_npcm_video(x) container_of((x), struct npcm_video, v4l2_dev)
> +
> +static const struct v4l2_dv_timings_cap npcm_video_timings_cap = {
> +	.type = V4L2_DV_BT_656_1120,
> +	.bt = {
> +		.min_width = MIN_WIDTH,
> +		.max_width = MAX_WIDTH,
> +		.min_height = MIN_HEIGHT,
> +		.max_height = MAX_HEIGHT,
> +		.min_pixelclock = 6574080, /* 640 x 480 x 24Hz */
> +		.max_pixelclock = 138240000, /* 1920 x 1200 x 60Hz */
> +		.standards = V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
> +			     V4L2_DV_BT_STD_CVT | V4L2_DV_BT_STD_GTF,
> +		.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE |
> +				V4L2_DV_BT_CAP_REDUCED_BLANKING |
> +				V4L2_DV_BT_CAP_CUSTOM,
> +	},
> +};
> +
> +static DECLARE_BITMAP(bitmap, BITMAP_SIZE);
> +
> +static void npcm_video_ece_prepend_rect_header(u8 *addr, u16 x, u16 y, u16 w, u16 h)
> +{
> +	__be16 x_pos = cpu_to_be16(x);
> +	__be16 y_pos = cpu_to_be16(y);
> +	__be16 width = cpu_to_be16(w);
> +	__be16 height = cpu_to_be16(h);
> +	__be32 encoding = cpu_to_be32(5); /* Hextile encoding */
> +
> +	memcpy(addr, &x_pos, 2);
> +	memcpy(addr + 2, &y_pos, 2);
> +	memcpy(addr + 4, &width, 2);
> +	memcpy(addr + 6, &height, 2);
> +	memcpy(addr + 8, &encoding, 4);
> +}
> +
> +static unsigned int npcm_video_ece_get_ed_size(struct npcm_video *video,
> +					       u32 offset, u8 *addr)
> +{
> +	struct regmap *ece = video->ece.regmap;
> +	u32 size, gap, val;

Using a fixed size type for variables not needing is, is actually not an 
optimization [1]. It’d be great, if you went over the whole change-set 
to use the non-fixed types, where possible. (You can also check the 
difference with `scripts/bloat-o-meter`.

> +	int ret;
> +
> +	ret = regmap_read_poll_timeout(ece, ECE_DDA_STS, val,
> +				       (val & ECE_DDA_STS_CDREADY), 0,
> +				       ECE_POLL_TIMEOUT_US);
> +
> +	if (ret) {
> +		dev_warn(video->dev, "Wait for ECE_DDA_STS_CDREADY timeout\n");
> +		return 0;
> +	}
> +
> +	size = readl(addr + offset);
> +	regmap_read(ece, ECE_HEX_CTRL, &val);
> +	gap = FIELD_GET(ECE_HEX_CTRL_ENC_GAP, val);
> +
> +	dev_dbg(video->dev, "offset = %u, ed_size = %u, gap = %u\n", offset,
> +		size, gap);
> +
> +	return size + gap;
> +}

[…]

> +module_platform_driver(npcm_video_driver);
> +
> +MODULE_AUTHOR("Joseph Liu<kwliu@nuvoton.com>");
> +MODULE_AUTHOR("Marvin Lin<kflin@nuvoton.com>");

Please add a space before the <.

> +MODULE_DESCRIPTION("Driver for Nuvoton NPCM Video Capture/Encode Engine");
> +MODULE_LICENSE("GPL");

Not GPL v2?


Kind regards,

Paul


[1]: https://notabs.org/coding/smallIntsBigPenalty.htm
