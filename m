Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 654BB7A927B
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 10:04:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrnwp2fthz3cNW
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 18:04:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=ogar=ff=xs4all.nl=hverkuil-cisco@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrnwR0Dkcz303l
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 18:03:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id ABBF7CE1164;
	Thu, 21 Sep 2023 08:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9BDC116AA;
	Thu, 21 Sep 2023 08:03:43 +0000 (UTC)
Message-ID: <fb74f6b8-3139-4652-b36a-1de396d0ca23@xs4all.nl>
Date: Thu, 21 Sep 2023 10:03:42 +0200
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

Hi Marvin,

Just one small comment:

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
> ---
>  MAINTAINERS                                 |   12 +
>  drivers/media/platform/Kconfig              |    1 +
>  drivers/media/platform/Makefile             |    1 +
>  drivers/media/platform/nuvoton/Kconfig      |   15 +
>  drivers/media/platform/nuvoton/Makefile     |    2 +
>  drivers/media/platform/nuvoton/npcm-regs.h  |  152 ++
>  drivers/media/platform/nuvoton/npcm-video.c | 1830 +++++++++++++++++++
>  7 files changed, 2013 insertions(+)
>  create mode 100644 drivers/media/platform/nuvoton/Kconfig
>  create mode 100644 drivers/media/platform/nuvoton/Makefile
>  create mode 100644 drivers/media/platform/nuvoton/npcm-regs.h
>  create mode 100644 drivers/media/platform/nuvoton/npcm-video.c
> 

<snip>

> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> new file mode 100644
> index 000000000000..aabb6077a128
> --- /dev/null
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -0,0 +1,1830 @@

<snip>

> +
> +/*
> + * This control value is set when a buffer is dequeued by userspace, i.e. in
> + * npcm_video_buf_finish function.
> + */
> +static const struct v4l2_ctrl_config npcm_ctrl_rect_count = {
> +	.id = V4L2_CID_NPCM_RECT_COUNT,
> +	.name = "NPCM Compressed Hextile Rectangle Count",

This name is too long, it should be max 31 characters. Dropping the "Compressed " part
might be best, I think that word isn't needed.

> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 0,
> +	.max = (MAX_WIDTH / RECT_W) * (MAX_HEIGHT / RECT_H),
> +	.step = 1,
> +	.def = 0,
> +};

With this fixed, and the sparse warnings fixed, it should be ready for merging.

Regards,

	Hans

