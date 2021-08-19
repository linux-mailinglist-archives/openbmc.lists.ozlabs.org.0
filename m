Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A634A3F12F5
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 07:54:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqv923mXjz3cPy
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 15:54:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HERgekw9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HERgekw9; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gqv8c4LFmz3cHb
 for <openbmc@lists.ozlabs.org>; Thu, 19 Aug 2021 15:53:52 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id c10so3407440qko.11
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 22:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=4AgUxzjo5zFrpXCNmK39zMPZwmYzZ7R4zpQ9/3x5iHo=;
 b=HERgekw9sb3A/x7rrhKBqLYWHtt69lNxVXi/kLIZul4+dAKES6nbyrWd2dQVD50c6B
 inofKZuf47A/yoQGwF0u1v483k47HqXHbXkLxIWqeDqdDVh0XFy5udaZpYHQQi6B3g2O
 qwyKUuqRllPzgp0xoQ/43N64c1C/EbesEReoPPS8cfNLb+mxDOcYWWO/gcGyUgDp8jEM
 9qHj1ezH8S8AZ7YcFBqEj+ufupKwtmUHhpfsYKILgQJVNqBk8nUqGeWVg/KJ3GAwvzOA
 HbrqZFgTPaRHmN/dGS1sFgilD6/LRhDOIccd63TkDGl9nUsvdA7HXwsLoByBYnTKDQLF
 IfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=4AgUxzjo5zFrpXCNmK39zMPZwmYzZ7R4zpQ9/3x5iHo=;
 b=ijzKEEFttSmYLed31yW3Trh6G3pmyLHkNT8kYTEa+Q8KSD05/oBUwROAdv8IdjAgn5
 DDC28EK0/VRu10KuHuHEjj15EwWfPMgsz9OMqPuWcJqGSC6kuke35KqdWAJAon4nFLRj
 dm0VVAstTla1QICZJ+47qWfSXqAiaNcUH2Zaz8/axf2GINb+aGInnnk9jwP/ocBxutjH
 ktUdlVOo4otuG6Sn9zGYEZfyrOGxNjbJl4auLZjV8XAauC/ZdWYSG8HRmysu7ZS+aEVC
 nD1gQmT0otG5pFi6lm5sN/OuaXjx6haUs2IzukVEv+lUpT047RyhGZaRqfUhxVOoiVz6
 xsuA==
X-Gm-Message-State: AOAM531HoDAuGJdNCOa/VV0r5g7GHMQfIAfBgXiUznF65XYt5LWKrDv3
 yO6gXyAwJxUECF9qVJ6635Y6QIOP+jJxduEbMxS7F+L3HJU=
X-Google-Smtp-Source: ABdhPJzlCNwmPOix1DIbCc29od+zMe0Yt+a/Q91Alo9PdlX0ncKj0iS2pXGIS4ogAl5JeY5srk+yhUpE7w8C7xoDf5g=
X-Received: by 2002:a05:620a:c92:: with SMTP id
 q18mr1989402qki.331.1629352429077; 
 Wed, 18 Aug 2021 22:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210819054908.140514-1-liuxiwei@inspur.com>
In-Reply-To: <20210819054908.140514-1-liuxiwei@inspur.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Thu, 19 Aug 2021 13:53:38 +0800
Message-ID: <CANFuQ7ATsRGYYU1nXDufYULSpKXGg0QJ_PJ-byF9UK++-sbF+A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dtd: fp5280g2: ENable KCS 3 for MCTP binding
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please ignore it.

On Thu, Aug 19, 2021 at 1:49 PM George Liu <liuxiwei1013@gmail.com> wrote:
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
