Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF894AED91
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 10:07:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtvC76dMTz3cBN
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 20:06:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtvBh42lcz2y7J;
 Wed,  9 Feb 2022 20:06:33 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aee30.dynamic.kabel-deutschland.de
 [95.90.238.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id D9D6561EA1923;
 Wed,  9 Feb 2022 10:06:28 +0100 (CET)
Message-ID: <f790f9aa-fcb7-d163-9c1c-9eb107d4b1bd@molgen.mpg.de>
Date: Wed, 9 Feb 2022 10:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] media: aspeed: Use full swing as JFIF to fix incorrect
 color
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>
References: <20220209084225.4456-1-jammy_huang@aspeedtech.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220209084225.4456-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


Am 09.02.22 um 09:42 schrieb Jammy Huang:
> Current settings for video capture rgb-2-yuv is BT.601(studio swing),
> but JFIF uses BT.601(full swing) to deocde. This mismatch will lead
> to incorrect color. For example, input RGB value, (0, 0, 255), will
> become (16, 16, 235) after jpg decoded.
> 
> Add an enum, aspeed_video_capture_format, to define VR008[7:6]
> capture format and correct default settings for video capture to fix
> the problem.

Maybe quote the datasheet:

VR008[7:6] will decide the data format for video capture:
00: CCIR601 studio swing compliant YUV format
01: CCIR601 full swing compliant YUV format
10: RGB format
11: Gray color mode

> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> v2:
>   - update subject from 'media: aspeed: Fix-incorrect-color' to
>     'media: aspeed: Use full swing as JFIF to fix incorrect'
>   - update commit message
>   - add enum, aspeed_video_capture_format, to define VR008[7:6]
> ---
>   drivers/media/platform/aspeed-video.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb9c17ac0e14..5bcf60b4628b 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -86,8 +86,6 @@
>   #define  VE_CTRL_SOURCE			BIT(2)
>   #define  VE_CTRL_INT_DE			BIT(4)
>   #define  VE_CTRL_DIRECT_FETCH		BIT(5)
> -#define  VE_CTRL_YUV			BIT(6)
> -#define  VE_CTRL_RGB			BIT(7)
>   #define  VE_CTRL_CAPTURE_FMT		GENMASK(7, 6)
>   #define  VE_CTRL_AUTO_OR_CURSOR		BIT(8)
>   #define  VE_CTRL_CLK_INVERSE		BIT(11)
> @@ -202,6 +200,15 @@ enum {
>   	VIDEO_CLOCKS_ON,
>   };
>   
> +// for VE_CTRL_CAPTURE_FMT
> +enum aspeed_video_capture_format {
> +	VIDEO_CAP_FMT_YUV_STUDIO = 0,

Maybe also append `_SWING`?

> +	VIDEO_CAP_FMT_YUV_FULL,
> +	VIDEO_CAP_FMT_RGB,
> +	VIDEO_CAP_FMT_GRAY,
> +	VIDEO_CAP_FMT_MAX
> +};
> +
>   struct aspeed_video_addr {
>   	unsigned int size;
>   	dma_addr_t dma;
> @@ -1089,7 +1096,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>   	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
>   		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>   		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
> -	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR;
> +	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR |
> +		FIELD_PREP(VE_CTRL_CAPTURE_FMT, VIDEO_CAP_FMT_YUV_FULL);
>   	u32 seq_ctrl = video->jpeg_mode;
>   
>   	if (video->frame_rate)

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
