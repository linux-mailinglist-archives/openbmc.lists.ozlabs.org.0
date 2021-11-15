Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 184074525EC
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 02:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtThl0MLbz2yPZ
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 12:57:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ht2Fr60PFz2xD3;
 Mon, 15 Nov 2021 19:21:03 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="257147590"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="257147590"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 00:19:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="603763025"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 00:19:49 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id F2AD020287;
 Mon, 15 Nov 2021 10:19:46 +0200 (EET)
Date: Mon, 15 Nov 2021 10:19:46 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v4 7/9] media: aspeed: Support aspeed mode to reduce
 compressed data
Message-ID: <YZIYIsURV0Gv1bc6@paasikivi.fi.intel.com>
References: <20211115074437.28079-1-jammy_huang@aspeedtech.com>
 <20211115074437.28079-8-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115074437.28079-8-jammy_huang@aspeedtech.com>
X-Mailman-Approved-At: Tue, 16 Nov 2021 12:57:15 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

Thanks for the patch. A few comments below...

On Mon, Nov 15, 2021 at 03:44:35PM +0800, Jammy Huang wrote:
> @@ -969,35 +1045,70 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>  
>  static void aspeed_video_update_regs(struct aspeed_video *video)
>  {
> -	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
> +	u8 jpeg_hq_quality = clamp((int)video->jpeg_hq_quality - 1, 0,
> +				   ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1);
> +	u32 comp_ctrl =	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
> +		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
> +		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_LUM, jpeg_hq_quality) |
> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_CHR, jpeg_hq_quality |
> +			   0x10);
>  	u32 ctrl = 0;
> -	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
> +	u32 seq_ctrl = 0;
>  
> -	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
> -		 video->frame_rate);
> -	v4l2_dbg(1, debug, &video->v4l2_dev, "subsample(%s)\n",
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n", video->frame_rate);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
> +		 format_str[video->format],
>  		 video->yuv420 ? "420" : "444");
> -	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
> -		 video->jpeg_quality);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d) hq(%s) hq_quality(%d)\n",
> +		 video->jpeg_quality, video->hq_mode ? "on" : "off",
> +		 video->jpeg_hq_quality);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression mode(%s)\n",
> +		 compress_mode_str[video->compression_mode]);
> +
> +	if (video->format == VIDEO_FMT_ASPEED)
> +		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
> +	else
> +		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
>  
>  	if (video->frame_rate)
>  		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
>  
> +	if (video->format == VIDEO_FMT_STANDARD) {
> +		comp_ctrl &= ~FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode);
> +		seq_ctrl |= VE_SEQ_CTRL_JPEG_MODE;
> +	}
> +
>  	if (video->yuv420)
>  		seq_ctrl |= VE_SEQ_CTRL_YUV420;
>  
>  	if (video->jpeg.virt)
>  		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
>  
> +#ifdef CONFIG_MACH_ASPEED_G4

This would be better done based on the device recognised, not the selected
compile target. The same goes for the rest of the conditional pre-processor
bits.

> +	switch (video->compression_mode) {
> +	case 0:	//DCT only
> +		comp_ctrl |= VE_COMP_CTRL_VQ_DCT_ONLY;
> +		break;
> +	case 1:	//DCT VQ mix 2-color
> +		comp_ctrl &= ~(VE_COMP_CTRL_VQ_4COLOR | VE_COMP_CTRL_VQ_DCT_ONLY);
> +		break;
> +	case 2:	//DCT VQ mix 4-color
> +		comp_ctrl |= VE_COMP_CTRL_VQ_4COLOR;
> +		break;
> +	}
> +#endif
> +

-- 
Kind regards,

Sakari Ailus
