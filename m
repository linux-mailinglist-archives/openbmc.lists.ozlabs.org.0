Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4EB47CA99
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 01:54:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJZbz67Jyz2yg3
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 11:54:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Pidswvau;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Pidswvau; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJZbY0FLxz2xXC;
 Wed, 22 Dec 2021 11:54:30 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id fo11so887717qvb.4;
 Tue, 21 Dec 2021 16:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hJjp5YMAMRD++/FKZ6hhLRZiHYEXKQMmjSr0lGSiXEY=;
 b=Pidswvaubov6mS0KQ4ft+ylEcNwiHnJIpkWOHL3DShMeWV3W+DWPcDPYaSTRxpACgX
 j5gQJz1favORDNFmJ0LrYV+0Q56hfKYhaayPfJQutC875/Kn5VCODSbKVt/s6JmDJv+C
 Z6mGYLKHhH7V5qon1UOPu6a1BEWPLp9Exmj2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hJjp5YMAMRD++/FKZ6hhLRZiHYEXKQMmjSr0lGSiXEY=;
 b=3l0Qt+QyYaHQBEMPd1JIVK8fXnZ5WCaxuMIYekPZoMYGE+Z7gFcIS9RglYCpp0kmcS
 m0Y+KwUW2U9PQXiCDEB2o4K4OUSpNyuDbXWxPX8wBglqtGK9BJRLxLXYtVKyKK7R5ZnR
 /kifChjzf76uYeZ0T91rY+LHaiewgeLargFmyIWsEL5LquTVE1He55pnJemvw8hZslMt
 mlGAE3lKoaM1b/PeLL8ttQckYXVHW5AADaHQvPKQQFrV/T/wBzFa6iV/5x1AejCH1Zns
 sqcBUf9++J7NMpb4fBRV8Rt6KJspaQN6iXBpYS7khBa8cNJ80JsFQr8R48NG2BuVkqpn
 4Uqg==
X-Gm-Message-State: AOAM531jRAsz3OWx2i4HzdRgjlK4dUj2tAY/Izv471LigXYzQOS/OEI4
 psfhRinOB3EXYmsnm9iHBxvqkYtFS7NauUsKJr0=
X-Google-Smtp-Source: ABdhPJxGYfoA9EpJMot757NvA6aGpaIieF4ECLe/jAqe+CU75Xnsm8uzivICqIa4KhBVKpQ91ERTBIBtdaAXGrJopuA=
X-Received: by 2002:a05:6214:e63:: with SMTP id
 jz3mr735408qvb.65.1640134465924; 
 Tue, 21 Dec 2021 16:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
 <20211217095403.2618-2-jammy_huang@aspeedtech.com>
In-Reply-To: <20211217095403.2618-2-jammy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 00:54:09 +0000
Message-ID: <CACPK8XfTme51V3uB=7T9=1pzQVZnamP+7nL9h1jOiqiD66=MNw@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: aspeed: Correct value for h-total-pixels
To: Jammy Huang <jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 17 Dec 2021 at 09:54, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>
> Previous reg-field, 0x98[11:0], stands for the period of the detected
> hsync signal.
> Use the correct reg, 0xa0, to get h-total in pixels.
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/media/platform/aspeed-video.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index b388bc56ce81..d5f77b205175 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -166,7 +166,7 @@
>  #define  VE_SRC_TB_EDGE_DET_BOT                GENMASK(28, VE_SRC_TB_EDGE_DET_BOT_SHF)
>
>  #define VE_MODE_DETECT_STATUS          0x098
> -#define  VE_MODE_DETECT_H_PIXELS       GENMASK(11, 0)
> +#define  VE_MODE_DETECT_H_PERIOD       GENMASK(11, 0)
>  #define  VE_MODE_DETECT_V_LINES_SHF    16
>  #define  VE_MODE_DETECT_V_LINES                GENMASK(27, VE_MODE_DETECT_V_LINES_SHF)
>  #define  VE_MODE_DETECT_STATUS_VSYNC   BIT(28)
> @@ -177,6 +177,8 @@
>  #define  VE_SYNC_STATUS_VSYNC_SHF      16
>  #define  VE_SYNC_STATUS_VSYNC          GENMASK(27, VE_SYNC_STATUS_VSYNC_SHF)
>
> +#define VE_H_TOTAL_PIXELS              0x0A0
> +
>  #define VE_INTERRUPT_CTRL              0x304
>  #define VE_INTERRUPT_STATUS            0x308
>  #define  VE_INTERRUPT_MODE_DETECT_WD   BIT(0)
> @@ -938,6 +940,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>         u32 src_lr_edge;
>         u32 src_tb_edge;
>         u32 sync;
> +       u32 htotal;
>         struct v4l2_bt_timings *det = &video->detected_timings;
>
>         det->width = MIN_WIDTH;
> @@ -983,6 +986,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                 src_tb_edge = aspeed_video_read(video, VE_SRC_TB_EDGE_DET);
>                 mds = aspeed_video_read(video, VE_MODE_DETECT_STATUS);
>                 sync = aspeed_video_read(video, VE_SYNC_STATUS);
> +               htotal = aspeed_video_read(video, VE_H_TOTAL_PIXELS);
>
>                 video->frame_bottom = (src_tb_edge & VE_SRC_TB_EDGE_DET_BOT) >>
>                         VE_SRC_TB_EDGE_DET_BOT_SHF;
> @@ -999,8 +1003,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                         VE_SRC_LR_EDGE_DET_RT_SHF;
>                 video->frame_left = src_lr_edge & VE_SRC_LR_EDGE_DET_LEFT;
>                 det->hfrontporch = video->frame_left;
> -               det->hbackporch = (mds & VE_MODE_DETECT_H_PIXELS) -
> -                       video->frame_right;
> +               det->hbackporch = htotal - video->frame_right;
>                 det->hsync = sync & VE_SYNC_STATUS_HSYNC;
>                 if (video->frame_left > video->frame_right)
>                         continue;
> --
> 2.25.1
>
