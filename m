Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C1847CAA1
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 02:00:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJZkk3n2Qz2ywt
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 12:00:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Gi3j/UTX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Gi3j/UTX; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJZk76q1Rz2yxV;
 Wed, 22 Dec 2021 12:00:15 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id kk22so947557qvb.0;
 Tue, 21 Dec 2021 17:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zKvHA40MElrX93jDS+MnFfwzXO7n7dGjS2ojGYwXai4=;
 b=Gi3j/UTXIWZzylZ3QkdRnufKIADVVwnkFqbNZJCtFl0nhmYlkuLU4pi6BJ2cnHpTt/
 ziwIuSswzs0NDdxGbx54Hs2AbIWAjnPh/zSCzCjVqzy4OzLhGtOCVx7Exjnpde851WoF
 +L3VHPYHBPC+Mrc8aeqv0J7TwyFnKjlGWj/FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zKvHA40MElrX93jDS+MnFfwzXO7n7dGjS2ojGYwXai4=;
 b=x6/tGuIpAxZxJdpUNS6rpGgYmGtnxeKe67DG5hBcXDq3YwWI1DUcTQCW+AzEWxhE+A
 Q02Za3/im6ManKgPs3xqV3n6Qw2jHKfxxi9BeLm7vJk4oWO4z7kFio/+LNIlVISVhLaI
 +edWLCzVTdnW+auoHAqIrYoavkLeORhaugUVosGFIjHzAZ89imRWXPk/TiepA8y47wzO
 Gl4xPwqFSBRkvN/4FZYMM/A88wAicbE3KziTfAUgPXj3YOMwXJo9Q952nhuoVqni/53b
 I2gTvvpTFJL9hmd5oQRiLULkNSAu6peMFgKK0zlI0NlLB8m4h1mCkuxOosYyWwur/FgP
 5ARQ==
X-Gm-Message-State: AOAM530cFbs6oPD7jktuzcGtckoTcnfi6Hd+tQt02pagdHJJEge0Y6i8
 N5ks2VK0EDU8Omka+Iv8HTQTK42VG+qc5dJBXO8=
X-Google-Smtp-Source: ABdhPJxJqlQU6wjR7AqfqAIfm+g5QOBnhT8O+VmMIGj5tnMG/mtLZmwwYNW1b8yLylfxlofFXh6AQpoiqUfz4Dvfc+Q=
X-Received: by 2002:a05:6214:e63:: with SMTP id
 jz3mr748923qvb.65.1640134811727; 
 Tue, 21 Dec 2021 17:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
 <20211217095403.2618-3-jammy_huang@aspeedtech.com>
In-Reply-To: <20211217095403.2618-3-jammy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 00:59:58 +0000
Message-ID: <CACPK8XcmcP=vu8pWVKdiQVokPyh39Tuy0mfmgPSzb0wb0tcJuA@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: aspeed: Use FIELD_GET to improve readability
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

On Fri, 17 Dec 2021 at 09:53, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>
> Use the bitfield macro FIELD_GET, and GENMASK to do the shift and mask in
> one go for reg values.
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed-video.c | 35 ++++++++++++---------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index d5f77b205175..581a4261f9b7 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -156,26 +156,22 @@
>  #define  VE_SRC_LR_EDGE_DET_NO_H       BIT(13)
>  #define  VE_SRC_LR_EDGE_DET_NO_DISP    BIT(14)
>  #define  VE_SRC_LR_EDGE_DET_NO_CLK     BIT(15)
> -#define  VE_SRC_LR_EDGE_DET_RT_SHF     16
> -#define  VE_SRC_LR_EDGE_DET_RT         GENMASK(27, VE_SRC_LR_EDGE_DET_RT_SHF)
> +#define  VE_SRC_LR_EDGE_DET_RT         GENMASK(27, 16)
>  #define  VE_SRC_LR_EDGE_DET_INTERLACE  BIT(31)
>
>  #define VE_SRC_TB_EDGE_DET             0x094
>  #define  VE_SRC_TB_EDGE_DET_TOP                GENMASK(12, 0)
> -#define  VE_SRC_TB_EDGE_DET_BOT_SHF    16
> -#define  VE_SRC_TB_EDGE_DET_BOT                GENMASK(28, VE_SRC_TB_EDGE_DET_BOT_SHF)
> +#define  VE_SRC_TB_EDGE_DET_BOT                GENMASK(28, 16)
>
>  #define VE_MODE_DETECT_STATUS          0x098
>  #define  VE_MODE_DETECT_H_PERIOD       GENMASK(11, 0)
> -#define  VE_MODE_DETECT_V_LINES_SHF    16
> -#define  VE_MODE_DETECT_V_LINES                GENMASK(27, VE_MODE_DETECT_V_LINES_SHF)
> +#define  VE_MODE_DETECT_V_LINES                GENMASK(27, 16)
>  #define  VE_MODE_DETECT_STATUS_VSYNC   BIT(28)
>  #define  VE_MODE_DETECT_STATUS_HSYNC   BIT(29)
>
>  #define VE_SYNC_STATUS                 0x09c
>  #define  VE_SYNC_STATUS_HSYNC          GENMASK(11, 0)
> -#define  VE_SYNC_STATUS_VSYNC_SHF      16
> -#define  VE_SYNC_STATUS_VSYNC          GENMASK(27, VE_SYNC_STATUS_VSYNC_SHF)
> +#define  VE_SYNC_STATUS_VSYNC          GENMASK(27, 16)
>
>  #define VE_H_TOTAL_PIXELS              0x0A0
>
> @@ -988,23 +984,24 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                 sync = aspeed_video_read(video, VE_SYNC_STATUS);
>                 htotal = aspeed_video_read(video, VE_H_TOTAL_PIXELS);
>
> -               video->frame_bottom = (src_tb_edge & VE_SRC_TB_EDGE_DET_BOT) >>
> -                       VE_SRC_TB_EDGE_DET_BOT_SHF;
> -               video->frame_top = src_tb_edge & VE_SRC_TB_EDGE_DET_TOP;
> +               video->frame_bottom = FIELD_GET(VE_SRC_TB_EDGE_DET_BOT,
> +                                               src_tb_edge);
> +               video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP,
> +                                            src_tb_edge);
>                 det->vfrontporch = video->frame_top;
> -               det->vbackporch = ((mds & VE_MODE_DETECT_V_LINES) >>
> -                       VE_MODE_DETECT_V_LINES_SHF) - video->frame_bottom;
> -               det->vsync = (sync & VE_SYNC_STATUS_VSYNC) >>
> -                       VE_SYNC_STATUS_VSYNC_SHF;
> +               det->vbackporch = FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
> +                       video->frame_bottom;
> +               det->vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
>                 if (video->frame_top > video->frame_bottom)
>                         continue;
>
> -               video->frame_right = (src_lr_edge & VE_SRC_LR_EDGE_DET_RT) >>
> -                       VE_SRC_LR_EDGE_DET_RT_SHF;
> -               video->frame_left = src_lr_edge & VE_SRC_LR_EDGE_DET_LEFT;
> +               video->frame_right = FIELD_GET(VE_SRC_LR_EDGE_DET_RT,
> +                                              src_lr_edge);
> +               video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT,
> +                                             src_lr_edge);

I suggest putting these on one line to further improve readability:

               video->frame_right = FIELD_GET(VE_SRC_LR_EDGE_DET_RT,
src_lr_edge);
               video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT,
src_lr_edge);

The same for the other lines you've changed above.

And then add:

Reviewed-by: Joel Stanley <joel@jms.id.au>

>                 det->hfrontporch = video->frame_left;
>                 det->hbackporch = htotal - video->frame_right;
> -               det->hsync = sync & VE_SYNC_STATUS_HSYNC;
> +               det->hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
>                 if (video->frame_left > video->frame_right)
>                         continue;
>
> --
> 2.25.1
>
