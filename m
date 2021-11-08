Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE8447B7B
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 08:57:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hnk482q6vz303F
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 18:57:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hnk3q2W24z2xXg;
 Mon,  8 Nov 2021 18:57:24 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aef86.dynamic.kabel-deutschland.de
 [95.90.239.134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 535E261E5FE00;
 Mon,  8 Nov 2021 08:57:19 +0100 (CET)
Message-ID: <cd62eba4-2553-6837-6069-52a209e48b8c@molgen.mpg.de>
Date: Mon, 8 Nov 2021 08:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] media: aspeed: Fix signal status not updated immediately
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>
References: <20211108061155.14479-1-jammy_huang@aspeedtech.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20211108061155.14479-1-jammy_huang@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jammy,


Am 08.11.21 um 07:11 schrieb Jammy Huang:

Maybe for the commit message summary:

media: aspeed: Update signal status immediately to ensure sane hw state


> If res-chg, VE_INTERRUPT_MODE_DETECT_WD irq will be raised. But
> v4l2_input_status wont't be updated to no-signal immediately until

won’t

> aspeed_video_get_resolution() in aspeed_video_resolution_work().
> 
> During the period of time, aspeed_video_start_frame() could be called
> because it doesn't know signal is unstable now. If it goes with
> aspeed_video_init_regs() of aspeed_video_irq_res_change() simultaneously
> , it will mess up hw state.

Please do not start a line with a comma, for example, put the comma on 
the line above.

> To fix this problem, v4l2_input_status will be updated to no-signal

… status is updated _ (Present tense in commit messages.)

> immediately for VE_INTERRUPT_MODE_DETECT_WD irq.
> 
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed-video.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 1ade264a8b69..3facd7ecc1a1 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -762,6 +762,8 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>   	set_bit(VIDEO_RES_CHANGE, &video->flags);
>   	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>   
> +	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
> +
>   	aspeed_video_off(video);
>   	aspeed_video_on(video);
>   	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
> @@ -1889,7 +1891,6 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>   	struct delayed_work *dwork = to_delayed_work(work);
>   	struct aspeed_video *video = container_of(dwork, struct aspeed_video,
>   						  res_work);
> -	u32 input_status = video->v4l2_input_status;
>   
>   	/* Exit early in case no clients remain */
>   	if (test_bit(VIDEO_STOPPED, &video->flags))
> @@ -1902,8 +1903,7 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>   	aspeed_video_get_resolution(video);
>   
>   	if (video->detected_timings.width != video->active_timings.width ||
> -	    video->detected_timings.height != video->active_timings.height ||
> -	    input_status != video->v4l2_input_status) {
> +	    video->detected_timings.height != video->active_timings.height) {
>   		static const struct v4l2_event ev = {
>   			.type = V4L2_EVENT_SOURCE_CHANGE,
>   			.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
> 

Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
