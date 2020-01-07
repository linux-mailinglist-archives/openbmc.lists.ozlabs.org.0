Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7759131DE3
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 04:16:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sHbG0m6hzDqLV
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 14:16:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="EaEf9e/u"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sHZP3wR2zDqHS;
 Tue,  7 Jan 2020 14:15:41 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id z76so41828933qka.2;
 Mon, 06 Jan 2020 19:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AtlpYaLLMTE+8NWj8eY7Oj/Fx28nhIerkc8u9tEkgfs=;
 b=EaEf9e/uQygjuM+AEzZUvq8zZj4XTSn8eBSZxJ2kdECMeMr2xsLtNwLrM8H1zWadMR
 vhcxHHa1FQugOhTE6EOcR3Cagp5qN1zXyVY6TQM1TMoE0yAIds5qKhHWXdZQjwxNYwAa
 8LNL3Mgs3mEIDhXSZcI/JY3GiTiP1rFayNVIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AtlpYaLLMTE+8NWj8eY7Oj/Fx28nhIerkc8u9tEkgfs=;
 b=IZydxgN+mXDsKzfXfBmbYMoXgAe8FiJFcRR56gnnamg7yW5SFFpFiNapgWhmJQ/fGu
 AJSOEWwlUODlUxM3AY/mh7IZoLf5Q94vSkwCKIGlj5+Q8xmOac178sDCoiqyIitcpkLZ
 2QhzuhQEksOkRDgLK66h6GINN4RIHihLgwpOWtI5Nlo0amcNM362qz340/XxGr5O4UGQ
 rNnec7PFFacigzCk5ZBEEBJ1x8BFW3WpWyerv4SvtnzoJJazFiUUpLOQg3aZ+sCoICIj
 rb0K2Q3JXeckO7OOBOv7M49+beUvIkrIpvcGA51aKl5HOqhP/JlmsuQ7m1c2Q4OgQFzn
 s9VQ==
X-Gm-Message-State: APjAAAWq98D+coxBEewlGjTSDCYr9/T+8F3z0aiPrtY0I9sb+ud4fnlZ
 MgI6zK0Bx65CzwcKinGLU42lt8Eog85+aPGMOxXdhd9i
X-Google-Smtp-Source: APXvYqzHsbqA4VEOnhaS6z/+XeB6SwzNXtgr4zi0SMOslB8kLr9/KAIzZeRbEKo3csmaVlW7PqquRa2yw1FsJCWhzuU=
X-Received: by 2002:ae9:e702:: with SMTP id m2mr85124606qka.208.1578366938200; 
 Mon, 06 Jan 2020 19:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
 <20200107011503.17435-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200107011503.17435-4-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Jan 2020 03:15:26 +0000
Message-ID: <CACPK8XejA6emrboLzfwEpmn=dn1JcyHKJVud_cBXVNRiZixgTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: aspeed: add AST2600 support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 7 Jan 2020 at 01:14, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Video engine in AST2600 has the exactly same register set with
> AST2500 except VR084 register which provides more precise JPEG
> size read back. This commit adds support for the difference and
> adds 'aspeed,ast2600-video-engine' compatible OF string.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/media/platform/aspeed-video.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index d8593cb2ae84..0dbe72672338 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -72,10 +72,10 @@
>  #define  VE_SEQ_CTRL_CAP_BUSY          BIT(16)
>  #define  VE_SEQ_CTRL_COMP_BUSY         BIT(18)
>
> -#ifdef CONFIG_MACH_ASPEED_G5
> -#define  VE_SEQ_CTRL_JPEG_MODE         BIT(13) /* AST2500 */
> -#else
> +#ifdef CONFIG_MACH_ASPEED_G4
>  #define  VE_SEQ_CTRL_JPEG_MODE         BIT(8)  /* AST2400 */
> +#else
> +#define  VE_SEQ_CTRL_JPEG_MODE         BIT(13) /* AST2500/2600 */
>  #endif /* CONFIG_MACH_ASPEED_G5 */

Yeah, nah. This should have never been done this way. I will send some
patches to fix it up, and you can add ast2600 support on top of them,
if that works for you.

Cheers,

Joel

>
>  #define VE_CTRL                                0x008
> @@ -135,6 +135,12 @@
>
>  #define VE_OFFSET_COMP_STREAM          0x078
>
> +#ifdef CONFIG_MACH_ASPEED_G6
> +#define VE_JPEG_COMP_SIZE_READ_BACK    0x084   /* AST2600 */
> +#else
> +#define VE_JPEG_COMP_SIZE_READ_BACK    VE_OFFSET_COMP_STREAM
> +#endif
> +
>  #define VE_SRC_LR_EDGE_DET             0x090
>  #define  VE_SRC_LR_EDGE_DET_LEFT       GENMASK(11, 0)
>  #define  VE_SRC_LR_EDGE_DET_NO_V       BIT(12)
> @@ -572,7 +578,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>         if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>                 struct aspeed_video_buffer *buf;
>                 u32 frame_size = aspeed_video_read(video,
> -                                                  VE_OFFSET_COMP_STREAM);
> +                                                  VE_JPEG_COMP_SIZE_READ_BACK);
>
>                 spin_lock(&video->lock);
>                 clear_bit(VIDEO_FRAME_INPRG, &video->flags);
> @@ -1719,6 +1725,7 @@ static int aspeed_video_remove(struct platform_device *pdev)
>  static const struct of_device_id aspeed_video_of_match[] = {
>         { .compatible = "aspeed,ast2400-video-engine" },
>         { .compatible = "aspeed,ast2500-video-engine" },
> +       { .compatible = "aspeed,ast2600-video-engine" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
> --
> 2.17.1
>
