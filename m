Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D15336211AB
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 14:00:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N67VN6XXSz3bVN
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 23:59:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D0MB9l3S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D0MB9l3S;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N67Tp3DMtz2yRS
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 23:59:23 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id m22so1153770eji.10
        for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2022 04:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xMYYNsg0Fd1lbIlymnFj9xbwbr0Q9XGXqF2lkb6r5vo=;
        b=D0MB9l3SuLohSIy6XuTeWJN/UkCRPC4j9T5V2d4qNTDcoHVetCsF/ahRpMl6HP8cfs
         neczcXs959bMdeWHVbsy4CijF3RYG7XlF0/dz4v2Z3G4gqplfVuCffm3LmzWEES13yLg
         Sp/KEn2VS7yGrYdqtzzRm0CoKQsnY4tvbIlpDDgzDSvTlVdCxjAZZSPkrxid8XmcCNZP
         TGXqsboBRvpw9flB3iG5JkY1uJXsblNWe70qFR0oBb/b+V4vzSCgxXwvVY4hFhPJcsju
         PHo5MwbmloqxjAWIDDsJ7FDJJ+2qW5OhbgiffbByZwrBVMMOdblQGJJV6ibGCOf9UlLE
         G9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMYYNsg0Fd1lbIlymnFj9xbwbr0Q9XGXqF2lkb6r5vo=;
        b=KVVEWZwlto+EDc3bJE9aqXdg4GPcfYVKGsjI04XnRShz9jFDo3u8S6lCw1tnKZhMd0
         AB1hX5fGhXVADd/vFgUIhMP9thxZJGlzHhM8iNhEt31vURTMpEV2Pdqs4jT8UHUod70O
         L0gdYn8dByl2tX9Tv2QUHEd5rDT+eTziF3CZlLEUc8tXHDknNf99uM4BMi219Jp/NVkN
         X3haMIecE9b0hMYVuvTWIbjoTs5ypHP10PyOI/lyODkUgsTStFOEmTBo4l35hr1RNKzz
         eSp3lsmrY1C6ccqLFfH9RBErQwsk4ecGwPvtyFcrugMoPlhASYbNJydoWUjXueVpp5Zf
         foCg==
X-Gm-Message-State: ANoB5pk8/AYlwi0HtfoqFVNoIs0y4nBjSsLIz7pBb2iwk3oUUQ/ycOGE
	Lxi2npeJGUyJlE/YbHCy5Zjcrs+4eKwP2EryL27tng==
X-Google-Smtp-Source: AA0mqf6ANmUnYiYdo2x4UFuu2t3zI2/P/e7ukIEC+BUNZec2Z8td6z1gbnX7j+6fQ7HJlb2YQ6VecwBo00lb4mFY7E8=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr11060672ejs.190.1667912359878; Tue, 08
 Nov 2022 04:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20221108092840.14945-1-JJLIU0@nuvoton.com> <20221108092840.14945-4-JJLIU0@nuvoton.com>
In-Reply-To: <20221108092840.14945-4-JJLIU0@nuvoton.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:59:08 +0100
Message-ID: <CACRpkdYjVsHn1LuniEA2mB9Y5+hL3dP2kzVOLWYOcmAQk95sCw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: Add Nuvoton NPCM750 serial I/O
 expansion interface(SGPIO)
To: Jim Liu <jim.t90615@gmail.com>
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jim,

thanks for your patch!

On Tue, Nov 8, 2022 at 10:29 AM Jim Liu <jim.t90615@gmail.com> wrote:
>
> NPCM750 include two SGPIO modules.
> Each module supports up to 64 input and 64 output pins.
> the output pin must be serial to parallel device(such as the hc595)
> the input in must be parallel to serial device(such as the hc165)
>
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
> ---
> Changes for v2:
>    - modify description
(...)

This:

> +  GPIO pins can be programmed to support the following options
> +  - Support interrupt option for each input port and various interrupt
> +    sensitivity option (level-high, level-low, edge-high, edge-low)
> +  - Directly connected to APB bus and its shift clock is from APB bus clock
> +    divided by a programmable value.
> +  - nin_gpios is number of input GPIO lines
> +  - nout_gpios is number of output GPIO lines
> +  - ngpios is number of nin_gpios GPIO lines and nout_gpios GPIO lines.

Why does input/output have to be configured uniquely/static per system?

What is wrong with just using direction_input() and direction_output()
at runtime like everybody else?

> +        nin_gpios = <64>;
> +        nout_gpios = <64>;

Especially since in the example you just set them all to be both input
and output so they all depend on runtime direction configuration
anyway.

Yours,
Linus Walleij
