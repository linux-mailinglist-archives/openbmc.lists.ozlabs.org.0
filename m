Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5614E7C2
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 05:01:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4883Rw5949zDqdL
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 15:01:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=l55VUxcK; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4883RL0yHDzDqcV
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 15:00:45 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id v25so4398819qto.7
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 20:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2nFkcX0v05SESbc6KFOuppTIXAOgSrk9EKYN/BcV3DY=;
 b=l55VUxcKbSW6dnxqpGPBd8Hm7UfDb6JVk6F09kTV2Iu6uaj97mSOcoBZmJ5sJo6YvA
 LonMEO0iel+iFDM0UR27JzGAe9XY0AKF1xYEXhItgZTGVAunUh0cA6tmp2fGjRZ0z+P3
 hAq/rEMcTdfFEWtkZDVHNy2zEnFsLJJJDX/vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2nFkcX0v05SESbc6KFOuppTIXAOgSrk9EKYN/BcV3DY=;
 b=i7ZeJH00L9HMBP1XoSErQG03epC0RV5kM6W/8W0vqPdmG7m7sdiWXHP30rNJLkHlrn
 BjEDx7YzDZsWqtWxzwxa11iM7fCNMP4J/dHeD4xtvOeEoF6jUwyqyWZn8Mxb+NC6CESX
 v5wgElpIQz2PWyzxeWqBc9NtrBFG/DJotqGICUKjl4kmC6N4BwkUqIPH+nGmjsWNjlgK
 Ti9bBf10FhQASCkUadz4mpwgXsAe26pevmRsc2eUEQjbWvyMUZDt6FLghG0wZUxy7WZj
 4wJzvrkupl/OvKF+TvCj5zspU6pGAuk99REudGfxa95syizMqx7QxZauWuDRxDaJHJNj
 NesA==
X-Gm-Message-State: APjAAAWXJHW7sqEvMFh1kLYo5mHCm9ygTUTu1tCabsoe0tWcEim5Brt5
 /wZD/Ag93rEKE/6pXDB8EtVhfD/M5VwH8Iz5bxID16x2
X-Google-Smtp-Source: APXvYqwmY1Ne0A/+wbLXMAbdnz/A/HFtOs8GV389f0Iyp2ILf6M2KLIhh9toqSyh41zb18aAnJI4Nygj/nDtMPgOFvI=
X-Received: by 2002:ac8:754e:: with SMTP id b14mr8855557qtr.220.1580443242207; 
 Thu, 30 Jan 2020 20:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
In-Reply-To: <20200123074956.21482-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Jan 2020 04:00:29 +0000
Message-ID: <CACPK8XcWsHoeamPtd_R3=RUEjs93OyEo_Q-uk0=wfoa8ispSbA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 v2 0/3] aspeed-g6: enable usb support
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 23 Jan 2020 at 07:50, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> The patch series aims at enabling USB Host and Gadget support on AST2600
> platforms. I'm targeting openbmc tree mainly for some early feedback and
> more widespread testing. I'm planning to upstream the patches after
> 5.6-rc1.
>
> Patch #1 moves hardcoded vhub attributes (number of downstream ports and
> endpoints) to "struct ast_hub_config" which is then attached to "struct
> of_device_id". By doing this, it will be easier to enable ast2600 vhub
> which supports more ports and endpoints.
>
> Patch #2 enables AST2600 support in aspeed-vhub gadget driver.
>
> Patch #3 adds USB devices and according pin groups in aspeed-g6 dtsi.

I have put these in the openbmc tree. Please send the changes upstream
for review asap (I would do it now) so we can get Ben's feedback on
them.

Cheers,

Joel

>
> Tao Ren (3):
>   usb: gadget: aspeed: read vhub config from of_device_id
>   usb: gadget: aspeed: add ast2600 vhub support
>   ARM: dts: aspeed-g6: add usb functions
>
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   |  25 +++++
>  arch/arm/boot/dts/aspeed-g6.dtsi           |  43 ++++++++
>  drivers/usb/gadget/udc/aspeed-vhub/Kconfig |   4 +-
>  drivers/usb/gadget/udc/aspeed-vhub/core.c  | 108 ++++++++++++++-------
>  drivers/usb/gadget/udc/aspeed-vhub/dev.c   |  30 ++++--
>  drivers/usb/gadget/udc/aspeed-vhub/epn.c   |   4 +-
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c   |  22 +++--
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h  |  21 ++--
>  8 files changed, 185 insertions(+), 72 deletions(-)
>
> --
> 2.17.1
>
