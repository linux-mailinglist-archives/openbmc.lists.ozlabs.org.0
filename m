Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8683428AD03
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 06:32:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8m484jNdzDqkD
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 15:32:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Vi0Okto4; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8m1m1Dw0zDqkX;
 Mon, 12 Oct 2020 15:30:18 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id s4so16688385qkf.7;
 Sun, 11 Oct 2020 21:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ix53B+4PxpD3FvNrquTS4wrFrQE1rmLNYwUdzsQBz70=;
 b=Vi0Okto4r2twCBe/iUIb9WvlHH1xO2X3Pgp/nljP/qcnaXwYhnCYzuh1+uReRXwRdx
 TPoGM9Rlp+ghbeEWUbk+eDkR+uz9q51GERSJbC0puwH+q4lKe8vhqMSjFp+Sge2IR07V
 Yz5TD89m4VosCu5dlVKyhk/N9QRS5LXdMkwaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ix53B+4PxpD3FvNrquTS4wrFrQE1rmLNYwUdzsQBz70=;
 b=jol1/tp7MjE8tyuqnqu/yeS/QmzTE6VlMlwXaMe0vvpueYK7r9KVHXSyv6y2BoYiJJ
 moCq1C/pyaloxHsHFXyKrpbfZcBzjuRPmLfC/sfSVctmZcIvlFZf1y8z6JxOBXFSUdTU
 cLIgZG7pW5qwQIrfCPW1pp/p8dYIMqVOcc1Uk72p4jGnUXCbs5/YpnHmRrarUvjVJ44X
 hnpFWEe08NYjjKSb0/sQ7qaVe4LM9l8PM9legrv9JKqhmkIyRbxx6ZKZQceHCbanJtaE
 9Ru2dU6iOLvtr6H5oyCks1e0u3A3O6JE3tHGdeLxTEOLjPKxIdnKWSdYiOEFlNHLT3mj
 feIg==
X-Gm-Message-State: AOAM530/3CLPGZZDocJ86fbi1rIQ6w4I7xFLV9CtqP2yLQazGEiinNWY
 AY3oEGf3hx4FuGNgGzxJZZ1bMmdJTaxyN1t+13s=
X-Google-Smtp-Source: ABdhPJyNBsj3Xl5S6RY3Rvn00/GtfkhS8Ore3QHLa1prcwNZOO4RsI2temxvhrolGiYtx4NchxSTU3LmSRQ/3KhH1ts=
X-Received: by 2002:a05:620a:16aa:: with SMTP id
 s10mr7987574qkj.273.1602477012120; 
 Sun, 11 Oct 2020 21:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-2-billy_tsai@aspeedtech.com>
In-Reply-To: <20201012033150.21056-2-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Oct 2020 04:30:00 +0000
Message-ID: <CACPK8XcQ+uodvYCyL7_RO9W2QF+AA2LidHhXi2tR3_uriQFccQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Arm: dts: aspeed-g6: Fix the register range of gpio
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 12 Oct 2020 at 03:32, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> This patch is used to fix the memory range of gpio0
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 97ca743363d7..ad19dce038ea 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -357,7 +357,7 @@
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
>                                 compatible = "aspeed,ast2600-gpio";
> -                               reg = <0x1e780000 0x800>;
> +                               reg = <0x1e780000 0x400>;
>                                 interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>                                 gpio-ranges = <&pinctrl 0 0 208>;
>                                 ngpios = <208>;
> --
> 2.17.1
>
