Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 244EE750453
	for <lists+openbmc@lfdr.de>; Wed, 12 Jul 2023 12:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1DLw0pz7z3bwb
	for <lists+openbmc@lfdr.de>; Wed, 12 Jul 2023 20:22:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 579 seconds by postgrey-1.37 at boromir; Wed, 12 Jul 2023 20:21:43 AEST
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1DLH4lwFz3byl;
	Wed, 12 Jul 2023 20:21:43 +1000 (AEST)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 053DF61E5FE01;
	Wed, 12 Jul 2023 12:09:16 +0200 (CEST)
Message-ID: <461f3b88-87e6-32f2-3ed8-5764a9a6e162@molgen.mpg.de>
Date: Wed, 12 Jul 2023 12:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: aspeed: Fix memory overwrite if timing is 1600x900
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>
References: <20230712092606.2508-1-jammy_huang@aspeedtech.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230712092606.2508-1-jammy_huang@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, joel@jms.id.au, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jammy,


Thank you very much for your patch.

Am 12.07.23 um 11:26 schrieb Jammy Huang:
> When capturing 1600x900, system could crash when system memory usage is
> tight.

Please provide part of the trace, and if you have a commend to reproduce 
it, please also add it. Is it documented somewhere, that it needs to be 
aligned?

> The size of macro block captured is 8x8. Therefore, we should make sure
> the height of src-buf is 8 aligned to fix this issue.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed/aspeed-video.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index 374eb7781936..14594f55a77f 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -1130,7 +1130,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   static void aspeed_video_set_resolution(struct aspeed_video *video)
>   {
>   	struct v4l2_bt_timings *act = &video->active_timings;
> -	unsigned int size = act->width * act->height;
> +	unsigned int size = act->width * ALIGN(act->height, 8);
>   
>   	/* Set capture/compression frame sizes */
>   	aspeed_video_calc_compressed_size(video, size);
> @@ -1147,7 +1147,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   		u32 width = ALIGN(act->width, 64);
>   
>   		aspeed_video_write(video, VE_CAP_WINDOW, width << 16 | act->height);
> -		size = width * act->height;
> +		size = width * ALIGN(act->height, 8);

Maybe add a comment.

Excuse my ignorance, but as `width` is already 64 bit aligned, how does 
aligning the second factor make a difference for `size`? Can you give an 
example?

>   	} else {
>   		aspeed_video_write(video, VE_CAP_WINDOW,
>   				   act->width << 16 | act->height);
> 
> base-commit: 2605e80d3438c77190f55b821c6575048c68268e


Kind regards,

Paul
