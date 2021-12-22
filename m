Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5047CACA
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 02:31:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJbQS3HM5z2ym7
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 12:31:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HGxs8jlV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HGxs8jlV; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJbQ03BNqz2xsx;
 Wed, 22 Dec 2021 12:31:18 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id p4so845829qkm.7;
 Tue, 21 Dec 2021 17:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BL4VTrxHuhNngkVjVPPyXcbNQ/vv2xvDhyVBuDNvoBE=;
 b=HGxs8jlV6uJBLy77VN0ld1Ch0KRpJ634KfWR9yIX8fJk3s2xAZEEuxCDpXgkg8n9Yo
 iOnOqRhsMKTh31pymyYvwtnt3keVbkK4uIiH7PR9wCr9iPjXQXz3CRRpxDAC+et0arj7
 SAtH7PDcshRL8CTuOEcpixfhsxwtrIIL5YMCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BL4VTrxHuhNngkVjVPPyXcbNQ/vv2xvDhyVBuDNvoBE=;
 b=NuyfjpJADKMchvvjc5K3fw/625cuGyN/bzqgZNgJbBNqnc2ZeIr6ltNBltDePcYW4I
 Bdrsg6YRB6EljEAbE05VDmvOKfqe3nIiRNrOWD3xC2ODLM/SEh5SHlAaKgKiH0cTJZoZ
 8BUz1NIh++RmUyKCISYfOFZ4Oq+nLsojvByR0l3KyndYumZSTQScodK6hlqxx9CMRAmu
 BclqD8G9VFSZdqdmYzEKe0P6hxbkTBHr7Gn98zFEV2EmI8HBUqdNykIzck2EcAlX9PDS
 sGwjF4jCLiP5eN6mPH2V7IeVHWwefmUIdlAJleHfBxddzxn8hRW2QcqakTC1ezTOTTn3
 0Xrg==
X-Gm-Message-State: AOAM533KQ0R5cQU5PVu5tsbAhBaUt4KPNc5/UcjeLKWbJQXXkSahzl4Y
 YV6VMKePqux32Otp36wYrkt7h+05CVecoYVKY6g=
X-Google-Smtp-Source: ABdhPJwYB/w9mWQ/fJ18cguaiEKzZSEf2jcz9l7mfEhP1ihTCU6+UEnF0DuWo1HpbZ9y0+2JAC3df9FcIneYpMNTd+k=
X-Received: by 2002:a37:4047:: with SMTP id n68mr734946qka.346.1640136674770; 
 Tue, 21 Dec 2021 17:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
 <20211217095403.2618-4-jammy_huang@aspeedtech.com>
In-Reply-To: <20211217095403.2618-4-jammy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 01:31:02 +0000
Message-ID: <CACPK8Xf_5wZXzfDSrdLLxs_B_jX7BVHc5o2Thw1DJvYix1AA8Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: aspeed: Correct values for detected timing
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
> Correct timing's fp/sync/bp value based on the information below.
> It should be noticed that the calculation formula should be changed
> per sync polarity.
>
> The sequence of signal: sync - backporch - video data - frontporch
>
> The following registers start counting from sync's rising edge:
> 1. VR090: frame edge's left and right
> 2. VR094: frame edge's top and bottom
> 3. VR09C: counting from sync's rising edge to falling edge
>
>             +--+     +-------------------+     +--+
>             |  |     |    v i d e o      |     |  |
>          +--+  +-----+                   +-----+  +---+
>
>         sync+--+
>     left/top+--------+
> right/bottom+----------------------------+
>
>                   +-------------------+
>                   |    v i d e o      |
>       +--+  +-----+                   +-----+  +---+
>          |  |                               |  |
>          +--+                               +--+
>         sync+-------------------------------+
>     left/top+-----+
> right/bottom+-------------------------+

This is a good explanation. Can you add detail that relates the names
you use here to to the variable names in your patch (or change them to
match)?

>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed-video.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 581a4261f9b7..5ad3a20c5bac 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -988,10 +988,20 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                                                 src_tb_edge);
>                 video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP,
>                                              src_tb_edge);
> -               det->vfrontporch = video->frame_top;
> -               det->vbackporch = FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
> -                       video->frame_bottom;
>                 det->vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);


Would it be clearer if you structured the code like this?

 vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
 vlines = FIELD_GET(VE_MODE_DETECT_V_LINES, mds);

 if (det->polarities & V4L2_DV_VSYNC_POS_POL)) {
    det->vbackporch = video->frame_top - vsync;
    det->vfrontporch = vlines - video->frame_bottom;
    det->vsync = vsync;
 } else {
    det->vbackporch = video->frame_top;
    det->vfrontporch = vlines - video->frame_bottom - vsync;
    det->vsync = vlines - vsync;

}


> +               if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
> +                       det->vbackporch = video->frame_top - det->vsync;
> +                       det->vfrontporch =
> +                               FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
> +                               video->frame_bottom;
> +               } else {
> +                       det->vsync = FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
> +                                              det->vsync;
> +                       det->vbackporch = video->frame_top;
> +                       det->vfrontporch =
> +                               FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
> +                               video->frame_bottom - det->vsync;
> +               }
>                 if (video->frame_top > video->frame_bottom)
>                         continue;
>
> @@ -999,9 +1009,16 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                                                src_lr_edge);
>                 video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT,
>                                               src_lr_edge);
> -               det->hfrontporch = video->frame_left;
> -               det->hbackporch = htotal - video->frame_right;
>                 det->hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
> +               if (det->polarities & V4L2_DV_HSYNC_POS_POL) {
> +                       det->hbackporch = video->frame_left - det->hsync;
> +                       det->hfrontporch = htotal - video->frame_right;
> +               } else {
> +                       det->hsync = htotal - det->hsync;
> +                       det->hbackporch = video->frame_left;
> +                       det->hfrontporch = htotal - video->frame_right -
> +                                          det->hsync;
> +               }
>                 if (video->frame_left > video->frame_right)
>                         continue;
>
> --
> 2.25.1
>
