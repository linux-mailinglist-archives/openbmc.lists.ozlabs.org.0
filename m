Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEAF635214
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 09:17:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHDWs6QD8z3chb
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 19:17:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
X-Greylist: delayed 519 seconds by postgrey-1.36 at boromir; Wed, 23 Nov 2022 19:17:20 AEDT
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHDWN5vVgz3cJ7;
	Wed, 23 Nov 2022 19:17:20 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aeb9c.dynamic.kabel-deutschland.de [95.90.235.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B9EDE61EA1BD5;
	Wed, 23 Nov 2022 09:08:30 +0100 (CET)
Message-ID: <c8a4a3b6-6591-2710-433f-642277eeb8f3@molgen.mpg.de>
Date: Wed, 23 Nov 2022 09:08:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] media: aspeed: Use v4l2_dbg to replace v4l2_warn to avoid
 log spam
To: Jammy Huang <jammy_huang@aspeedtech.com>
References: <20221110095611.522-1-jammy_huang@aspeedtech.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20221110095611.522-1-jammy_huang@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, zev@bewilderbeest.net, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, joel@jms.id.au, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jammy,


Am 10.11.22 um 10:56 schrieb Jammy Huang:
> If the host is powered off, there will be many warning log. To avoid the

…, many warnings are logged.

Also, please paste one example message.

Are the messages really just debug messages, or only in the one 
condition? If the latter, another solution should be found, like 
checking if the host is powered off, or rate limiting the message.

> log spam in this condition, replace v4l2_warn with v4l2_dbg.

Please add a reference, to Zev’s report on the mailing list.

Link: …

> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed/aspeed-video.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index cf76aeee8cb6..662465d13a0e 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -586,13 +586,13 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>   	bool bcd_buf_need = (video->format != VIDEO_FMT_STANDARD);
>   
>   	if (video->v4l2_input_status) {
> -		v4l2_warn(&video->v4l2_dev, "No signal; don't start frame\n");
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "No signal; don't start frame\n");
>   		return 0;
>   	}
>   
>   	if (!(seq_ctrl & VE_SEQ_CTRL_COMP_BUSY) ||
>   	    !(seq_ctrl & VE_SEQ_CTRL_CAP_BUSY)) {
> -		v4l2_warn(&video->v4l2_dev, "Engine busy; don't start frame\n");
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "Engine busy; don't start frame\n");
>   		return -EBUSY;
>   	}
>   
> @@ -615,7 +615,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>   				       struct aspeed_video_buffer, link);
>   	if (!buf) {
>   		spin_unlock_irqrestore(&video->lock, flags);
> -		v4l2_warn(&video->v4l2_dev, "No buffers; don't start frame\n");
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "No buffers; don't start frame\n");
>   		return -EPROTO;
>   	}
>   
> @@ -796,7 +796,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   			if (video->format == VIDEO_FMT_STANDARD &&
>   			    list_is_last(&buf->link, &video->buffers)) {
>   				empty = false;
> -				v4l2_warn(&video->v4l2_dev, "skip to keep last frame updated\n");
> +				v4l2_dbg(1, debug, &video->v4l2_dev, "skip to keep last frame updated\n");
>   			} else {
>   				buf->vb.vb2_buf.timestamp = ktime_get_ns();
>   				buf->vb.sequence = video->sequence++;
> @@ -1060,7 +1060,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   						      res_check(video),
>   						      MODE_DETECT_TIMEOUT);
>   		if (!rc) {
> -			v4l2_warn(&video->v4l2_dev, "Timed out; first mode detect\n");
> +			v4l2_dbg(1, debug, &video->v4l2_dev, "Timed out; first mode detect\n");
>   			clear_bit(VIDEO_RES_DETECT, &video->flags);
>   			return;
>   		}
> @@ -1081,7 +1081,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   						      MODE_DETECT_TIMEOUT);
>   		clear_bit(VIDEO_RES_DETECT, &video->flags);
>   		if (!rc) {
> -			v4l2_warn(&video->v4l2_dev, "Timed out; second mode detect\n");
> +			v4l2_dbg(1, debug, &video->v4l2_dev, "Timed out; second mode detect\n");
>   			return;
>   		}
>   
> @@ -1104,7 +1104,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   	} while (invalid_resolution && (tries++ < INVALID_RESOLUTION_RETRIES));
>   
>   	if (invalid_resolution) {
> -		v4l2_warn(&video->v4l2_dev, "Invalid resolution detected\n");
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "Invalid resolution detected\n");
>   		return;
>   	}
>   
> @@ -1856,7 +1856,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
>   				!test_bit(VIDEO_FRAME_INPRG, &video->flags),
>   				STOP_TIMEOUT);
>   	if (!rc) {
> -		v4l2_warn(&video->v4l2_dev, "Timed out when stopping streaming\n");
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "Timed out when stopping streaming\n");
>   
>   		/*
>   		 * Need to force stop any DMA and try and get HW into a good
> 
> base-commit: aae703b02f92bde9264366c545e87cec451de471
> prerequisite-patch-id: bf47e8ab2998acfbc32be5a4b7b5ae8a3ae4218b
> prerequisite-patch-id: bf82715983e08f2e810ff1a82ce644f5f9006cd9
> prerequisite-patch-id: 28a2040ef0235e5765f05d2fc5529bce2a0f4c6f
> prerequisite-patch-id: 7e761c779730536db8baf50db5fc8caf058e95af
> prerequisite-patch-id: c48ea20973fa35938a7d33a0e20d2900df48755f
