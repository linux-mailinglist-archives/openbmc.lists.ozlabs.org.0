Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF12758DB5
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 08:23:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5QkQ0Qq7z3cYT
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 16:23:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=o+ek=df=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Qcj5XVTz3c7S;
	Wed, 19 Jul 2023 16:18:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C853860DC4;
	Wed, 19 Jul 2023 06:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11382C433C7;
	Wed, 19 Jul 2023 06:18:40 +0000 (UTC)
Message-ID: <21e13f35-5caf-6d60-c388-3386e3540834@xs4all.nl>
Date: Wed, 19 Jul 2023 08:18:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: aspeed: Fix memory overwrite if timing is
 1600x900
Content-Language: en-US
To: Jammy Huang <orbit.huang@gmail.com>, eajames@linux.ibm.com,
 mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230717095111.1957-1-jammy_huang@aspeedtech.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230717095111.1957-1-jammy_huang@aspeedtech.com>
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
Cc: Jammy Huang <jammy_huang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

On 17/07/2023 11:51, Jammy Huang wrote:
> When capturing 1600x900, system could crash when system memory usage is
> tight.
> 
> The way to reproduce this issue:
> 1. Use 1600x900 to display on host
> 2. Mount ISO through 'Virtual media' on OpenBMC's web
> 3. Run script as below on host to do sha continuously
>   #!/bin/bash
>   while [ [1] ];
>   do
> 	find /media -type f -printf '"%h/%f"\n' | xargs sha256sum
>   done
> 4. Open KVM on OpenBMC's web
> 
> The size of macro block captured is 8x8. Therefore, we should make sure
> the height of src-buf is 8 aligned to fix this issue.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>

Your email address you sent this from differs from your SoB. Can you post
again from the correct email address? Checkpatch complains about this.

Regards,

	Hans

> ---
>  v2 changes
>   - Add how to reproduce this issue.
> ---
>  drivers/media/platform/aspeed/aspeed-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index 374eb7781936..14594f55a77f 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -1130,7 +1130,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>  static void aspeed_video_set_resolution(struct aspeed_video *video)
>  {
>  	struct v4l2_bt_timings *act = &video->active_timings;
> -	unsigned int size = act->width * act->height;
> +	unsigned int size = act->width * ALIGN(act->height, 8);
>  
>  	/* Set capture/compression frame sizes */
>  	aspeed_video_calc_compressed_size(video, size);
> @@ -1147,7 +1147,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>  		u32 width = ALIGN(act->width, 64);
>  
>  		aspeed_video_write(video, VE_CAP_WINDOW, width << 16 | act->height);
> -		size = width * act->height;
> +		size = width * ALIGN(act->height, 8);
>  	} else {
>  		aspeed_video_write(video, VE_CAP_WINDOW,
>  				   act->width << 16 | act->height);
> 
> base-commit: 2605e80d3438c77190f55b821c6575048c68268e

