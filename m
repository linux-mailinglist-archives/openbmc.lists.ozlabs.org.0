Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C3B40A900
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 10:15:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7x4T4752z2yHN
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 18:15:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TDiqiQyd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TDiqiQyd; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7x422hQvz2xh1;
 Tue, 14 Sep 2021 18:15:29 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id m9so7790525qtk.4;
 Tue, 14 Sep 2021 01:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=McFPfgp+89QkBjV+rL8b9/JFaBCL/hN6AdRiaLyQM5Q=;
 b=TDiqiQyd07G7uOdJOlYQxkkipWc8uuxMMgsDLmil0ViNQH11kpnH0kP9421cMyje+8
 +Ys7OS2zIi6FGc7sJQq33n3Z7Zcnf5sQshdhEaKnGe5OZX40beS18RRSFo0mSB+k/oQX
 m6ecVrZjFuBhGJKit8YeNytsIfui2/mdPrCliYKSyMKNOeEeioci34A5GHzdb+jhVdgV
 AqF2/t97GASWT6Ii8qTu21CV0uiAdIzrHLoz2WF8dudVXr8UfzWxmeXVXhb56jtXmRSS
 Jfe6bSt0KxrUgsP5pjnQ73UgaNwpk2VOrSkNGBmyoYsxLFftIFzUcR+2fDPze5x8q2Ju
 HYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McFPfgp+89QkBjV+rL8b9/JFaBCL/hN6AdRiaLyQM5Q=;
 b=E+1Xsu0hSndJoMHkT9uqVIvqGJfa0EhBsskNjfDENm4rXye0nLjP8QR4IiyN3aEA5s
 kxTABQavvRKLnkPF9YlQzCwh7OqQCFBbIIlREApHGI25bJ9l5kn693PTTv2Td1vewCTn
 k3jr30Am0jbGw0Heqw9PFSeYQLGFZiz74Tb9d5+PLu/Tzgmty4Lqu473QkYWgJIHvats
 K0Th4gfN6z5DNsDW12LDvrSKWEr5EUfjvaLevXL8Om7EYmLGD3DDHXua6hZUKvLBBGsf
 srw6Nsf71HPPq4QCL6sKKQU4xzP/hrB3sJmNeCzZuGFcLBvHvWVOuhpZk7S7KLG6Deoh
 H/EA==
X-Gm-Message-State: AOAM532UJNsGL47GsccKriaPgRVPXDkU3sT4Y+0btoFL8fMQS57gxQ8C
 1t+sH0uPTWBjvDkbRvGTsIDZ7DsLZ3HgKkzdwEg=
X-Google-Smtp-Source: ABdhPJxQ2y7T2sJVQXB7MRygHfYxfwfK3HqUmuHPwMx4E6Ku5uphr5nfmF5aLPoPmS5RJHTa9r0G3desrVf520itfQ0=
X-Received: by 2002:a05:622a:102:: with SMTP id
 u2mr3614591qtw.149.1631607325330; 
 Tue, 14 Sep 2021 01:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210819055227.140980-1-liuxiwei@inspur.com>
In-Reply-To: <20210819055227.140980-1-liuxiwei@inspur.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Tue, 14 Sep 2021 16:15:14 +0800
Message-ID: <CANFuQ7A5jLXftmfLn_W93MuDF8heL88BPQRL_rkYk+bj0_Db0w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: fp5280g2: Enable KCS 3 for MCTP binding
To: joel@jms.id.au, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: robh+dt@kernel.org, George Liu <liuxiwei@inspur.com>,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hey Joel:
do you have any comments at this patch?

Thx -- George Liu

On Thu, Aug 19, 2021 at 1:52 PM George Liu <liuxiwei1013@gmail.com> wrote:
>
> Signed-off-by: George Liu <liuxiwei@inspur.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> index 1752f3250e44..d0c3acbf6c8c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> @@ -3,6 +3,7 @@
>  #include "aspeed-g5.dtsi"
>  #include <dt-bindings/gpio/aspeed-gpio.h>
>  #include <dt-bindings/leds/leds-pca955x.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>
>  / {
>         model = "FP5280G2 BMC";
> @@ -902,4 +903,10 @@ fan@7 {
>
>  };
>
> +&kcs3 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xca2>;
> +       aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +};
> +
>  #include "ibm-power9-dual.dtsi"
> --
> 2.30.2
>
