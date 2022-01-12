Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAAA48BC0A
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 01:52:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYTYZ4bGdz3035
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 11:52:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OB80mjKi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OB80mjKi; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYTY747Pjz2xtv;
 Wed, 12 Jan 2022 11:52:09 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id kl12so1232871qvb.5;
 Tue, 11 Jan 2022 16:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+BgWpZzbxCgBoKpAYDSuqEtaMBxXySjsMaStwtkHZLg=;
 b=OB80mjKifIvc9EHx5zG+SkcH7yRMZSrRQfy3eaWc/DKzOeWK4e5uBMsZJIbVO0f/Cl
 i+w7LX3TWzIbpkY+IWG4ncOGaxh0UkPRtJfoB4B5ybQtzvpgkKu15LlSR3n8tl2Q8N3b
 mEvoTmZxcExs8mBAlxOFbFFwDWYaZ/bzYvD/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+BgWpZzbxCgBoKpAYDSuqEtaMBxXySjsMaStwtkHZLg=;
 b=aJmUBnTr32e9aw95h5oVsnTnRoz1JkZjmW3RsW9woJDynth8DS1luTAhaLgjEvzidZ
 tuIeeEWWfoWUZRaeu9yL/UcjSR6wPnHUmVc8TLbeGlycLOzq9tQKXSEsYSz/kqzM4lbf
 oLqvVRxQaUAyKWs20WgelKE5iwHqjNCBSovwJv7mhUlJ0qrMTcNEyvwxWEbuQifSGe+b
 3LET8KQOMB+RDh6BbmdndY+vuEPNCgd/6/ou/IvAcSQCkhXlnc2F4AcJAZmsP8MvOwbK
 dJXmBN+0JSFOkr83PjnPhEJEQNfAZTgCJ+Ui0s5FlEv/Tq+nLqgDWPQj/c4XfwC2Jlth
 g7FQ==
X-Gm-Message-State: AOAM530ZmTaia46oTU4texpDIrTn5ruimjZvFUecBfvOdMHxJrzjU8m8
 iao7ukVO+Tn/KJTCFHWZmHx2Oe1o5EwCvd3hGaI=
X-Google-Smtp-Source: ABdhPJzJOUMABjpc3ziYwOsfvzN8V0NbNaMl+QXw963PVYPbHL58cyH5UiA1U0TR38v7QS3biobyspuPT3SSX4zmMi0=
X-Received: by 2002:ad4:5dce:: with SMTP id m14mr5680680qvh.130.1641948725803; 
 Tue, 11 Jan 2022 16:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20211214045348.13702-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20211214045348.13702-1-jammy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jan 2022 00:51:53 +0000
Message-ID: <CACPK8XfkXi6M=gzfkYcuoga6WxnzSm2+mspBt4gjop7Ytm+VCA@mail.gmail.com>
Subject: Re: [PATCH] media: aspeed: Fix no complete irq for non-64-aligned
 width
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

On Tue, 14 Dec 2021 at 04:53, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>
> In ast2500, engine will stop occasionally for 1360x768.
>
> This is a bug which has been addressed, but the workaround is specific
> for 1680 only. Here we make it more complete.
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed-video.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 793b2adaa0f5..4d3e6b105d44 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1055,18 +1055,20 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>         /* Set capture/compression frame sizes */
>         aspeed_video_calc_compressed_size(video, size);
>
> -       if (video->active_timings.width == 1680) {
> +       if (!IS_ALIGNED(act->width, 64)) {
>                 /*
>                  * This is a workaround to fix a silicon bug on A1 and A2

Please add:  "a AST2500 silicon bug" so we know which A1/A2 this is
referring to.

With that added, you can add:

 Reviewed-by: Joel Stanley <joel@jms.id.au>

>                  * revisions. Since it doesn't break capturing operation of
>                  * other revisions, use it for all revisions without checking
> -                * the revision ID. It picked 1728 which is a very next
> -                * 64-pixels aligned value to 1680 to minimize memory bandwidth
> +                * the revision ID. It picked new width which is a very next
> +                * 64-pixels aligned value to minimize memory bandwidth
>                  * and to get better access speed from video engine.
>                  */
> +               u32 width = ALIGN(act->width, 64);
> +
>                 aspeed_video_write(video, VE_CAP_WINDOW,
> -                                  1728 << 16 | act->height);
> -               size += (1728 - 1680) * video->active_timings.height;
> +                                  width << 16 | act->height);
> +               size = width * act->height;

You could make it clearer by putting the write on one line:

                aspeed_video_write(video, VE_CAP_WINDOW, width << 16 |
act->height);
