Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2287B7B6AD4
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 15:45:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=XzRY5BPW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Jxc6gd6z3cSn
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 00:45:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=XzRY5BPW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xs4all.nl (client-ip=195.121.94.183; helo=ewsoutbound.kpnmail.nl; envelope-from=hverkuil-cisco@xs4all.nl; receiver=lists.ozlabs.org)
X-Greylist: delayed 1234 seconds by postgrey-1.37 at boromir; Wed, 04 Oct 2023 00:45:22 AEDT
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Jwy15Tkz2xgp
	for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2023 00:45:21 +1100 (AEDT)
X-KPN-MessageId: fe5816ca-61ef-11ee-b94e-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id fe5816ca-61ef-11ee-b94e-005056992ed3;
	Tue, 03 Oct 2023 15:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=fBK3ZyyNKocOX4XjWS5oCsnNQEjc4aFYVR6szoxTD5I=;
	b=XzRY5BPWurc8EfXN20Oz0kk03McgTiKUs6fVEhPfvc930mwudc8ozVwMtMRZmAPv3AZ7WwXjQffl9
	 izLLpmj8prh5NVgJ5zewR7ZvWEnMwDaWPozS+acLbwf5gvBmNa6noMIGTcFSXtZvNiQ+zLhenuK/FE
	 aVzvwadVniFZmcAy/tKBipfMzRQQSpUC9pf3c0NZ292kle0rpnipfv5m1gfqI3AqBSVTM6+MkBjrUk
	 r8I1bGBCcZTqEw6eKEJHlxHojJ8Hopg1bCFiikMmH/NIjA5sKeFYr2xu9Z6LYyxUfoSx4HG5VXqjPs
	 /84/o98Ytj39laYZCiTpPoD9mv6pRpw==
X-KPN-MID: 33|eB3i4tWe0ravoetkyYEFHpSo0xF7TJz17Bl3Dx3b1C1g6gtg8Qi/lzttKb83xZX
 qzAnwsZadIevXQWKCEsDZfnRuhLQd+WWAODKZjAgsk/s=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|wYgDMpCR3QkPrGwrvjNYY8xiXfxcQUNl2Fk/1tQ25S6jTgB1LG6Dn5x55UmqYxR
 WxXWzKzVNKlYcEmctrsTfVw==
X-Originating-IP: 173.38.220.46
Received: from [10.47.77.214] (unknown [173.38.220.46])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id fe05b6bb-61ef-11ee-ad2d-005056998788;
	Tue, 03 Oct 2023 15:23:08 +0200 (CEST)
Message-ID: <1e5bb09f-be36-4fc6-88f3-8f6565b6147f@xs4all.nl>
Date: Tue, 3 Oct 2023 15:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: nuvoton: npcm-video: Fix sleeping in atomic
 context
Content-Language: en-US
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org
References: <20231003075512.2081141-1-milkfafa@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231003075512.2081141-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kflin@nuvoton.com, dan.carpenter@linaro.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/3/23 09:55, Marvin Lin wrote:
> Fix sleeping in atomic context warnings reported by the Smatch static
> analysis tool. Use GFP_ATOMIC instead of GFP_KERNEL in atomic context.
> 
> Fixes: 70721089985c ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> ---
>  drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> index ac8d73b794d3..5d160978f7b3 100644
> --- a/drivers/media/platform/nuvoton/npcm-video.c
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -412,7 +412,7 @@ static unsigned int npcm_video_add_rect(struct npcm_video *video,
>  	struct rect_list *list = NULL;
>  	struct v4l2_rect *r;
>  
> -	list = kzalloc(sizeof(*list), GFP_KERNEL);
> +	list = kzalloc(sizeof(*list), GFP_ATOMIC);
>  	if (!list)
>  		return 0;
>  
> @@ -467,7 +467,7 @@ static struct rect_list *npcm_video_new_rect(struct npcm_video *video,
>  	struct rect_list *list = NULL;
>  	struct v4l2_rect *r;
>  
> -	list = kzalloc(sizeof(*list), GFP_KERNEL);
> +	list = kzalloc(sizeof(*list), GFP_ATOMIC);
>  	if (!list)
>  		return NULL;
>  

I'm not really sure this is the right approach.

Looking closer at the code I notice that npcm_video_irq is a threaded
interrupt handler, so wouldn't it be easier to change the video->lock
spinlock to a mutex?

Regards,

	Hans
