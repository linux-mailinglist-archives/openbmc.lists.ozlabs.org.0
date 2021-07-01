Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B71D33B8C94
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 05:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFjvD4sM4z3069
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 13:12:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=alBMPcQg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=alBMPcQg; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFjtw42LZz2yMb;
 Thu,  1 Jul 2021 13:12:23 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id r20so3166158qtp.3;
 Wed, 30 Jun 2021 20:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KqTfUx+1bpJ+GEZ1JasFELVQC7fHMfJcaiqyDCFPIuw=;
 b=alBMPcQgQ4sDn+WFk4di7zdZI+/oW/JiE9BmC+6+i/eynxs5Q0F3qzXMd7jvbJKdcs
 al/BWmsBczUkNgGX5+H5/V+IfzFfTZPVMZE1W6Noo41j/BuxZ885p4LEtUOIqJ4dG6lJ
 XC9l//ve4l7B0pZnQSDiMWuxyfXb0dEdbjCBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KqTfUx+1bpJ+GEZ1JasFELVQC7fHMfJcaiqyDCFPIuw=;
 b=HOEixXpThTf4BW/3QO9QOqertbedxVkcnp5tN53/2qqZby3YEUEVH+hXi1hsJVChFW
 ThSrE9HIg1p0RqkzkA3xg4hwCy1lWB0/n9dU0EkSM2RSjRO+P6ffC0U4KxkypZeM2w+u
 f2FTSx7nKdgRoH7busr23CByVTwqX9LVUYvC4FaltgXr/qRhsaJAp/D9CmL3XKWixWzp
 akgvcSpdpunK9MYga2COJA//JJKs5Zu7XZ78LftuTI5lCms4TC2qiNlqVlbWP+qDcYUp
 L7RrOJUWU7LTdS55YS4NqEECColjwOeq1mewsATEmQ26U/jcRa0Ss2dhQHtS7maBjTM5
 a9bg==
X-Gm-Message-State: AOAM53286NON/p2IxjoGWTnJILwDRyeXugDu4ZbeK4ahueWB49pqnHPs
 q8s8e5z5yatycfTDYz6RCHjVXa2YopRpXgtF+/o=
X-Google-Smtp-Source: ABdhPJy2kf91B2vTqHlagKoi/6aakbeQj8UnEv2eAc/5e2Sz//Sa79thJYLh7yTsO1ikEDcd9FDWPoHzHnB45g8OURo=
X-Received: by 2002:a05:622a:50f:: with SMTP id
 l15mr14036901qtx.263.1625109140085; 
 Wed, 30 Jun 2021 20:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210416075113.18047-1-zev@bewilderbeest.net>
In-Reply-To: <20210416075113.18047-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jul 2021 03:12:07 +0000
Message-ID: <CACPK8XeRg5P8+W8kyxSNyOa7JBhua5QdP_oCVJALGPJQio0dhA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: update e3c246d4i vuart properties
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 16 Apr 2021 at 07:52, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This device-tree was merged with a provisional vuart IRQ-polarity
> property that was still under review and ended up taking a somewhat
> different form.  This patch updates it to match the final form of the
> new vuart properties, which additionally allow specifying the SIRQ
> number and LPC address.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>


Fixes: ca03042f0f12 ("serial: 8250_aspeed_vuart: add aspeed,
lpc-io-reg and aspeed, lpc-interrupts DT properties")
Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>
> The relevant aspeed-vuart patches [0] have been merged into Greg KH's
> tty-next tree, so I figure it's probably okay to proceed with the
> corresponding dts adjustments now.
>
> [0] https://lore.kernel.org/openbmc/20210412034712.16778-1-zev@bewilderbeest.net/
>
>  arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> index dcab6e78dfa4..8be40c8283af 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> @@ -4,6 +4,7 @@
>  #include "aspeed-g5.dtsi"
>  #include <dt-bindings/gpio/aspeed-gpio.h>
>  #include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>
>  /{
>         model = "ASRock E3C246D4I BMC";
> @@ -73,7 +74,8 @@ &uart5 {
>
>  &vuart {
>         status = "okay";
> -       aspeed,sirq-active-high;
> +       aspeed,lpc-io-reg = <0x2f8>;
> +       aspeed,lpc-interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
>  };
>
>  &mac0 {
> --
> 2.31.1
>
