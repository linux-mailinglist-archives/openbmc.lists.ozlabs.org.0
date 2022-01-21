Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ECA495AAB
	for <lists+openbmc@lfdr.de>; Fri, 21 Jan 2022 08:30:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jg9yh734yz3bVZ
	for <lists+openbmc@lfdr.de>; Fri, 21 Jan 2022 18:30:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=qy9o=sf=xs4all.nl=hverkuil@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jg9yQ6WM9z2x9X;
 Fri, 21 Jan 2022 18:30:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DE00617A1;
 Fri, 21 Jan 2022 07:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5310C340E1;
 Fri, 21 Jan 2022 07:30:18 +0000 (UTC)
Message-ID: <418fc1b2-ddbe-24e3-82cc-aa8ce74f4507@xs4all.nl>
Date: Fri, 21 Jan 2022 08:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/4] media: aspeed: Fix timing polarity incorrect
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com,
 mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20211222082139.26933-1-jammy_huang@aspeedtech.com>
 <20211222082139.26933-5-jammy_huang@aspeedtech.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20211222082139.26933-5-jammy_huang@aspeedtech.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/22/21 09:21, Jammy Huang wrote:
> This is a workaround for sync polarity unstable.
> Sync value get by VR09C counts from sync's rising edge, which means
> sync's polarity is negative if sync value is bigger than total/2.

Do you have an example of such a format, or is this mostly theoretical?

Either provide the example or make a note that it is theoretical.

Regards,

	Hans

> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  v2:
>   - Use 'total/2' rather than 'total<<1'
>   - Update comment
> ---
>  drivers/media/platform/aspeed-video.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 7c50567f5ab0..c3e3343d91e1 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -989,6 +989,16 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>  
>  		video->frame_bottom = FIELD_GET(VE_SRC_TB_EDGE_DET_BOT, src_tb_edge);
>  		video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP, src_tb_edge);
> +
> +		/*
> +		 * This is a workaround for polarity detection when the sync
> +		 * value is larger than half.
> +		 */
> +		if (vsync > (vtotal / 2))
> +			det->polarities &= ~V4L2_DV_VSYNC_POS_POL;
> +		else
> +			det->polarities |= V4L2_DV_VSYNC_POS_POL;
> +
>  		if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
>  			det->vbackporch = video->frame_top - vsync;
>  			det->vfrontporch = vtotal - video->frame_bottom;
> @@ -1003,6 +1013,16 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>  
>  		video->frame_right = FIELD_GET(VE_SRC_LR_EDGE_DET_RT, src_lr_edge);
>  		video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT, src_lr_edge);
> +
> +		/*
> +		 * This is a workaround for polarity detection when the sync
> +		 * value is larger than half.
> +		 */
> +		if (hsync > (htotal / 2))
> +			det->polarities &= ~V4L2_DV_HSYNC_POS_POL;
> +		else
> +			det->polarities |= V4L2_DV_HSYNC_POS_POL;
> +
>  		if (det->polarities & V4L2_DV_HSYNC_POS_POL) {
>  			det->hbackporch = video->frame_left - hsync;
>  			det->hfrontporch = htotal - video->frame_right;
