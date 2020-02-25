Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C2F16F3EF
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 00:53:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RwkS71MdzDqY5
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 10:53:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dPFxnnCn; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rwjk2vFczDqWt;
 Wed, 26 Feb 2020 10:53:13 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id o28so956348qkj.9;
 Tue, 25 Feb 2020 15:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V7uFpys0vvnGKgKU6TWcXA9gEqQEyPhW2p18eYUU23g=;
 b=dPFxnnCnNtyMs/buEAMu24zTzQfWWxcXLo5aG4w0AuWf7OdkEL+4JqRnDLeROGGc3b
 4nNBtR7AgRCkWaZTdT/uwfMRP416LuLwC2/4FR4v9hfGHxU5T47HcjiyDkc8h/WSKR+y
 TNU2hudIY73DXkfZCTCUKbOZ7Mt50kbLiAuYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7uFpys0vvnGKgKU6TWcXA9gEqQEyPhW2p18eYUU23g=;
 b=hLYJr63uxSqAPiX2LfZ0MaZCr8zM5UMu40H3ZOf3BH4YhToRk905zV0Wdpe67cC+C2
 xV51W+iVpi749tCx/zS6IlFtYzKz33Nctz7mtAdnMRSZNWo6lHO52ON4GSg7R3EfjqNO
 g+kvv2gIEb0ibKrzp157GI7DlBiXgSba9tj+QwrT3PtUZOYIJTxfsPA7FEDvfmH5y+Zt
 EylA/DzUAg+PsmzsSHyHuti5n6NOrWPVFia3S80woEJEoN3sKaIj1Dq2IEWFPaycQUd3
 QgLiuhac9XQm2oM835c+QhLDBOQDtgVAQsD/50r8U+Bba+ACiXiyXMPe6MHOCfyCaBJM
 fl2A==
X-Gm-Message-State: APjAAAWUXrdwZRzMzUDPw0ovYI56rIlmIZzGzrxuS7svRc2fhYs5n0dx
 JsuSHTrQPz9TnkWC4LzBCrgV7MiKt6NZULf+s7w=
X-Google-Smtp-Source: APXvYqz7krStiObclOwtZxgwPBr2nD3Jgb+LtwoxHEffLcks+uXl3itV433NONuRJbKJt/KbWqq69/l0vwv8kIRhO1Q=
X-Received: by 2002:a37:67c2:: with SMTP id b185mr1824063qkc.292.1582674789849; 
 Tue, 25 Feb 2020 15:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20200225195853.17480-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200225195853.17480-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Feb 2020 23:52:57 +0000
Message-ID: <CACPK8XeiH1iLQbmP+3yJninJtK7rQv=HMVnHzqjPH04V4xW+zg@mail.gmail.com>
Subject: Re: [PATCH -next] media: aspeed: add AST2600 support
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 25 Feb 2020 at 19:56, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Video engine in AST2600 has the exactly same register set with
> AST2500 except VR084 register which provides more precise JPEG
> size read back. This commit adds support for the difference and
> adds 'aspeed,ast2600-video-engine' compatible OF string.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Did you post an update to the device tree bindings too?

> ---
>  drivers/media/platform/aspeed-video.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 47444a336ebb..7d98db1d9b52 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  // Copyright 2020 IBM Corp.
> -// Copyright (c) 2019 Intel Corporation
> +// Copyright (c) 2019-2020 Intel Corporation
>
>  #include <linux/atomic.h>
>  #include <linux/bitfield.h>
> @@ -132,7 +132,8 @@
>  #define  VE_COMP_CTRL_HQ_DCT_CHR       GENMASK(26, 22)
>  #define  VE_COMP_CTRL_HQ_DCT_LUM       GENMASK(31, 27)
>
> -#define VE_OFFSET_COMP_STREAM          0x078
> +#define AST2400_VE_COMP_SIZE_READ_BACK 0x078
> +#define AST2600_VE_COMP_SIZE_READ_BACK 0x084
>
>  #define VE_SRC_LR_EDGE_DET             0x090
>  #define  VE_SRC_LR_EDGE_DET_LEFT       GENMASK(11, 0)
> @@ -252,12 +253,17 @@ struct aspeed_video_config {
>
>  static const struct aspeed_video_config ast2400_config = {
>         .jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
> -       .comp_size_read = VE_OFFSET_COMP_STREAM,
> +       .comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
>  };
>
>  static const struct aspeed_video_config ast2500_config = {
>         .jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
> -       .comp_size_read = VE_OFFSET_COMP_STREAM,
> +       .comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
> +};
> +
> +static const struct aspeed_video_config ast2600_config = {
> +       .jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
> +       .comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
>  };
>
>  static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
> @@ -1673,6 +1679,7 @@ static int aspeed_video_init(struct aspeed_video *video)
>  static const struct of_device_id aspeed_video_of_match[] = {
>         { .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
>         { .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
> +       { .compatible = "aspeed,ast2600-video-engine", .data = &ast2600_config },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
> --
> 2.17.1
>
