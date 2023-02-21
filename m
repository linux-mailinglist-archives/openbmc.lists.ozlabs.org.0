Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E8069DEAE
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 12:25:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLcQw0jf9z3bXQ
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 22:25:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VL9mrWHe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VL9mrWHe;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLcQJ4Hg5z3bT5
	for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2023 22:24:54 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id ee7so687236edb.2
        for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2023 03:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MzxDxiXhL/HAIpgXds7s3EpZZnQWia2mh3ftj+vsk04=;
        b=VL9mrWHezHwyEqAob9Kwt60w/H41bAh0Lp05H6DFmidZ+ss7J/v0vCBXv/bxte/Xnr
         Il826qkDPWgsa5yl6XystuFfBCx+08PM5XXcFGhEj1axxweZ5M7DQ+hwGNA1AC2nB7u3
         O9JGkDFUeKyOnB8/2L0rbp3fDChAuqjhD3G4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzxDxiXhL/HAIpgXds7s3EpZZnQWia2mh3ftj+vsk04=;
        b=GQ7np4t6hngQaOnn0vz6ePoAw2IAtQYviUgrKQ9gAwOfiVNiBUVjfToQDXdI7UQEvz
         gxyHmQW3dFfmVhAZKkGADOT+6pk3rQfy+mLGIETIDwAhAQVTsCOa5vCqfcpFPbttgGHO
         dyQznIKwZl24Tj/WIbSFq/z/xlW1HISgyceSSTsjVxPQSM4Jz502D3b/FIzK49PAMfro
         4svGS+a1/cImSIjprO6GslEScZdvdAt4EJKpmKOSbqan0wmAblf4m6XSg3SaawPcCxiw
         VQ5GVKq+ZW75cesPOO9pi1QytGLtNmqNg7KQHm7rtbez3akrl+Z0xGlw9CURMgGTDYlY
         BePA==
X-Gm-Message-State: AO0yUKWCrQFK3oK9+NHPokgAYrck6NW0eZJU3CU7Op9VqGv8egwGQYwF
	vSUydYe+XU6mo+KJZEGty+g0NAMDhZERM5OG5bs=
X-Google-Smtp-Source: AK7set+JBMmSg1yvy9uZRqImaf8lvlyq9D2t+kq6n3nPjABWR+DhTtBATso+dm2YL6fhiLPBngaijiPqwGprH7Pcaus=
X-Received: by 2002:a17:906:bce7:b0:8b1:28f6:8ab3 with SMTP id
 op7-20020a170906bce700b008b128f68ab3mr5849035ejb.15.1676978690695; Tue, 21
 Feb 2023 03:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20230211032235.20220-1-zev@bewilderbeest.net>
In-Reply-To: <20230211032235.20220-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2023 11:24:38 +0000
Message-ID: <CACPK8XdDa_5NMMmJJr2=Rfvqoao6U3eLgAwOAKPYhyX7uemutQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0] media: aspeed: Use v4l2_dbg to replace
 v4l2_warn to avoid log spam
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 11 Feb 2023 at 03:22, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> From: Jammy Huang <jammy_huang@aspeedtech.com>
>
> If the host is powered off, there will be many warning log. To avoid the
> log spam in this condition, replace v4l2_warn with v4l2_dbg.
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> (cherry picked from commit def4d25856b2fa41c1c1390f1e8d1b027166f5e9)
> ---
>
> This patch eliminates a lot of needless aspeed-video log noise that
> the current dev-6.0 kernel exhibits.  It's now in the mainline kernel
> and should be in the 6.2 release; it'd be nice to also backport to the
> OpenBMC kernel.

Good idea. We should send it to stable, assuming Sasha's bot hasn't
picked it up already.

I've applied it to dev-6.0.

>
>  drivers/media/platform/aspeed/aspeed-video.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index 20f795ccc11b..c0cebac4b966 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -549,13 +549,13 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>         u32 seq_ctrl = aspeed_video_read(video, VE_SEQ_CTRL);
>
>         if (video->v4l2_input_status) {
> -               v4l2_warn(&video->v4l2_dev, "No signal; don't start frame\n");
> +               v4l2_dbg(1, debug, &video->v4l2_dev, "No signal; don't start frame\n");
>                 return 0;
>         }
>
>         if (!(seq_ctrl & VE_SEQ_CTRL_COMP_BUSY) ||
>             !(seq_ctrl & VE_SEQ_CTRL_CAP_BUSY)) {
> -               v4l2_warn(&video->v4l2_dev, "Engine busy; don't start frame\n");
> +               v4l2_dbg(1, debug, &video->v4l2_dev, "Engine busy; don't start frame\n");
>                 return -EBUSY;
>         }
>
> @@ -564,7 +564,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>                                        struct aspeed_video_buffer, link);
>         if (!buf) {
>                 spin_unlock_irqrestore(&video->lock, flags);
> -               v4l2_warn(&video->v4l2_dev, "No buffers; don't start frame\n");
> +               v4l2_dbg(1, debug, &video->v4l2_dev, "No buffers; don't start frame\n");
>                 return -EPROTO;
>         }
>
> @@ -977,7 +977,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                                                       res_check(video),
>                                                       MODE_DETECT_TIMEOUT);
>                 if (!rc) {
> -                       v4l2_warn(&video->v4l2_dev, "Timed out; first mode detect\n");
> +                       v4l2_dbg(1, debug, &video->v4l2_dev, "Timed out; first mode detect\n");
>                         clear_bit(VIDEO_RES_DETECT, &video->flags);
>                         return;
>                 }
> @@ -998,7 +998,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                                                       MODE_DETECT_TIMEOUT);
>                 clear_bit(VIDEO_RES_DETECT, &video->flags);
>                 if (!rc) {
> -                       v4l2_warn(&video->v4l2_dev, "Timed out; second mode detect\n");
> +                       v4l2_dbg(1, debug, &video->v4l2_dev, "Timed out; second mode detect\n");
>                         return;
>                 }
>
> @@ -1021,7 +1021,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>         } while (invalid_resolution && (tries++ < INVALID_RESOLUTION_RETRIES));
>
>         if (invalid_resolution) {
> -               v4l2_warn(&video->v4l2_dev, "Invalid resolution detected\n");
> +               v4l2_dbg(1, debug, &video->v4l2_dev, "Invalid resolution detected\n");
>                 return;
>         }
>
> @@ -1683,7 +1683,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
>                                 !test_bit(VIDEO_FRAME_INPRG, &video->flags),
>                                 STOP_TIMEOUT);
>         if (!rc) {
> -               v4l2_warn(&video->v4l2_dev, "Timed out when stopping streaming\n");
> +               v4l2_dbg(1, debug, &video->v4l2_dev, "Timed out when stopping streaming\n");
>
>                 /*
>                  * Need to force stop any DMA and try and get HW into a good
> --
> 2.39.1
>
