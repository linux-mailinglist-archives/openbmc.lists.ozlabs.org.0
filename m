Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9A447CABB
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 02:23:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJbDk2N4wz2ynj
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 12:23:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NTUsZ+hX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NTUsZ+hX; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJbDG1BMkz2yPM;
 Wed, 22 Dec 2021 12:22:52 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id j17so582244qtx.2;
 Tue, 21 Dec 2021 17:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cNVgFuSkvXsOF4mMDEXYWlsVrY9TlgTecIPAVLkOuWs=;
 b=NTUsZ+hXhAodFI9Oan+WRQ3tF0KpKZnGm18/mkaitLP2Ggx9jiN3HG4WVR7UsgomM4
 LNeynEFuG7cIg8gIUZdiizlJ1815Kx+tG5yi0mXaU6NPdtJxOcHD99hO8I2VDtUKdp5/
 wgAmLauiM8/dqVp43ngZ1f9vLn+6DKkqIdHUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cNVgFuSkvXsOF4mMDEXYWlsVrY9TlgTecIPAVLkOuWs=;
 b=xwTp681NykDiP2AgrudeTdme/5kzHYHU9VNeIny6lzT3WYr2hAJ3FlJY1wKMeIOVMO
 Gve0v0meOuFAixYNRNKDxsVWx3PWdVenOvT6xu9BK32Jein9iz84UUEhPFi1EMfU4tpO
 VnsQUN/o7c7HQsT8CBbghqFTM9o9n8rEl/6p7F8DqnFcF09+m9V0LQtimF3+uFt9dy8P
 zKlRgb2EUdjG7Gs9bm/Sr7aK9otkUF0DH0gyitrazyVv0Uvm0obSfMaSKF9mrL3RCGbJ
 pqyrJJnKkkjr2CqEDHfwAJiMbLxJSk9M+L1B08aQU8G0D25KcUoRyNyDWXhHoWdKZOj/
 /d5Q==
X-Gm-Message-State: AOAM532SGvIseQUCGugqJXeoz4o4PJz7CdsDFzJ+rWdGQDAQWf+qPQa0
 A9xZiK5Kk/aPHhzc6ocHHmVA46s7ZcuHB8b3mPQ=
X-Google-Smtp-Source: ABdhPJy3jDioVIMXa2v625o3reDXrAtyaAv6CujTMELAi6Yci7xqNtalhS1zaix51U3flPHoVs8qoyEnjyutV/e5lvg=
X-Received: by 2002:a05:622a:588:: with SMTP id
 c8mr699346qtb.108.1640136168852; 
 Tue, 21 Dec 2021 17:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
 <20211217095403.2618-5-jammy_huang@aspeedtech.com>
In-Reply-To: <20211217095403.2618-5-jammy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 01:22:36 +0000
Message-ID: <CACPK8Xf7rsjgCv=Honyf8gwDWbG67dPVjE+z_tXD4yEu1WaE5w@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: aspeed: Fix timing polarity incorrect
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
> This is a workaround for polarity unstable.
> Sync value get by VR09C counts from sync's rising edge, which means
> sync's polarity is negative if sync value is bigger than total/2.
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed-video.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 5ad3a20c5bac..f628f69bb7dd 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -989,6 +989,15 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                 video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP,
>                                              src_tb_edge);
>                 det->vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
> +               /*
> +                * Workaround for polarity detection
> +                * Use sync(VR098) counts from sync's rising edge till falling
> +                * edge to tell sync polarity.
> +                */
> +               if (det->vsync > (FIELD_GET(VE_MODE_DETECT_V_LINES, mds) >> 1))

Are you right shifting as this is the value / 2? I think it's clearer
to write / 2 instead of >> 1.

Mention in the comment that this is a workaround for when the sync
value is larger than half.

> +                       det->polarities &= ~V4L2_DV_VSYNC_POS_POL;
> +               else
> +                       det->polarities |= V4L2_DV_VSYNC_POS_POL;
>                 if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
>                         det->vbackporch = video->frame_top - det->vsync;
>                         det->vfrontporch =
> @@ -1010,6 +1019,15 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                 video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT,
>                                               src_lr_edge);
>                 det->hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
> +               /*
> +                * Workaround for polarity detection
> +                * Use sync(VR098) counts from sync's rising edge till falling
> +                * edge to tell sync polarity.
> +                */
> +               if (det->hsync > (htotal >> 1))
> +                       det->polarities &= ~V4L2_DV_HSYNC_POS_POL;
> +               else
> +                       det->polarities |= V4L2_DV_HSYNC_POS_POL;
>                 if (det->polarities & V4L2_DV_HSYNC_POS_POL) {
>                         det->hbackporch = video->frame_left - det->hsync;
>                         det->hfrontporch = htotal - video->frame_right;
> --
> 2.25.1
>
