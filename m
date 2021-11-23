Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25D459EA8
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 09:53:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hyyc45YsLz2ynk
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 19:53:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nqFXzfi2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nqFXzfi2; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyybf3yJbz2yPT
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 19:53:32 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id a2so19167779qtx.11
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 00:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQ0wJ2HUKGEUwmb2OsdkRqQ8rWvwN0HNLkNoTNoaQSo=;
 b=nqFXzfi2dCnV8Lk3k5juBnuX56gwA7tfWjinovHPSHY2j1zcvHrliKdnoHLpzfhuwu
 O/mRWju+aaNNvmStTpqta0r3uRV4i5Ow3S7scHySvFX1Chyr6JnMmnh2DKisglfHoc/h
 lIe5nFV0UDYqqAxqM7nG7vGbn1VvYxu5GR8zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQ0wJ2HUKGEUwmb2OsdkRqQ8rWvwN0HNLkNoTNoaQSo=;
 b=5rBut/HrgUHTDzmDzUrWzruk8UhO+4rR8fx3pcCU9e6nD9xzmxgjW0q3lLdSQO4HnM
 +ipsTSP3TiN+nyIP2PVJ8XBgcSfspJu2DcDRS0ALryLCEanGXGHlLLyL16XFOWpYLzK6
 7M8Xq0KI5SOV1vIclttQDGbNvQUmyS0AL3jm6erdHv+DX3BdFJp6wWJH6GazD/AMkmUZ
 4gpva+LjLOlDE3pNzoD6CEfU00O3WLyvkh07+vnLWTemTNPSU/a/qXKRXlvSC7eWhDns
 7ddvmQ9aKiVtpTvL0ILZsN+rxKxayiJJWr3FFZQe+EI+qV5qEkWFPQtKop9ZHcJzRVuJ
 rz6g==
X-Gm-Message-State: AOAM531HkSemkxwdVL8GypwUfXLC7EsabtZssTN9dLtuJjTXipr5RiRF
 F2BwufvfMUla29Labig6IsC0cGWaeSb/Y1T3hgCMjYrZwqA=
X-Google-Smtp-Source: ABdhPJyZ5SayJ/W4D8Z0jfPb4+B4n8N7jKIIvKJnuX2WA42HZWF37RcSEBZq7w0CM4VexKQJy9Jid7Uv/w64yyW0aU0=
X-Received: by 2002:a05:622a:20b:: with SMTP id
 b11mr4151627qtx.25.1637657606778; 
 Tue, 23 Nov 2021 00:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20211118014445.1621187-1-wak@google.com>
In-Reply-To: <20211118014445.1621187-1-wak@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Nov 2021 08:53:13 +0000
Message-ID: <CACPK8XfD31bUx1NZM3qo7VEwMe-N8VsQimP9b7GxCn1PwxC5yQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix GPIO pin names
To: "William A. Kennington III" <wak@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi William,

On Thu, 18 Nov 2021 at 01:45, William A. Kennington III <wak@google.com> wrote:
>
> The pinctrl driver for the NPCM7xx updated some of the pinctrl names to
> include HGPIO definitions, but the dts file remained unchanged. This
> breaks pinctrl parsing if the strings don't match.
>
> Signed-off-by: William A. Kennington III <wak@google.com>

I'm wondering where you want this patch to be applied (and who would do so!).

Is the relevant pinctrl driver change merged to mainline? If so, send
it to the upstream lists (linux-arm-kernel) and cc some nuvoton
reviewers.

If you just want it in the openbmc tree, we can do that. Normally this
means putting the branch name in the subject.

You should get some review from someone who works on the nuvoton
boards regardless.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi | 42 ++++++++++-----------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
> index 444ea403547b..7c7942cdfd08 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
> @@ -219,77 +219,77 @@ gpio19ol_pins: gpio19ol-pins {
>                         output-low;
>                 };
>                 gpio20_pins: gpio20-pins {
> -                       pins = "GPIO20/SMB4CSDA/SMB15SDA";
> +                       pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
>                         bias-disable;
>                         input-enable;
>                 };
>                 gpio20o_pins: gpio20o-pins {
> -                       pins = "GPIO20/SMB4CSDA/SMB15SDA";
> +                       pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
>                         bias-disable;
>                         output-high;
>                 };
>                 gpio20ol_pins: gpio20ol-pins {
> -                       pins = "GPIO20/SMB4CSDA/SMB15SDA";
> +                       pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
>                         bias-disable;
>                         output-low;
>                 };
>                 gpio21_pins: gpio21-pins {
> -                       pins = "GPIO21/SMB4CSCL/SMB15SCL";
> +                       pins = "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL";
>                         bias-disable;
>                         input-enable;
>                 };
>                 gpio21ol_pins: gpio21ol-pins {
> -                       pins = "GPIO21/SMB4CSCL/SMB15SCL";
> +                       pins = "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL";
>                         bias-disable;
>                         output-low;
>                 };
>                 gpio22_pins: gpio22-pins {
> -                       pins = "GPIO22/SMB4DSDA/SMB14SDA";
> +                       pins = "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA";
>                         bias-disable;
>                         input-enable;
>                 };
>                 gpio22ol_pins: gpio22ol-pins {
> -                       pins = "GPIO22/SMB4DSDA/SMB14SDA";
> +                       pins = "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA";
>                         bias-disable;
>                         output-low;
>                 };
>                 gpio23_pins: gpio23-pins {
> -                       pins = "GPIO23/SMB4DSCL/SMB14SCL";
> +                       pins = "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL";
>                         bias-disable;
>                         input-enable;
>                 };
>                 gpio23ol_pins: gpio23ol-pins {
> -                       pins = "GPIO23/SMB4DSCL/SMB14SCL";
> +                       pins = "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL";
>                         bias-disable;
>                         output-low;
>                 };
>                 gpio24_pins: gpio24-pins {
> -                       pins = "GPIO24/IOXHDO";
> +                       pins = "GPIO24/HGPIO4/IOXHDO";
>                         bias-disable;
>                         input-enable;
>                 };
>                 gpio24o_pins: gpio24o-pins {
> -                       pins = "GPIO24/IOXHDO";
> +                       pins = "GPIO24/HGPIO4/IOXHDO";
>                         bias-disable;
>                         output-high;
>                 };
>                 gpio24ol_pins: gpio24ol-pins {
> -                       pins = "GPIO24/IOXHDO";
> +                       pins = "GPIO24/HGPIO4/IOXHDO";
>                         bias-disable;
>                         output-low;
>                 };
>                 gpio25_pins: gpio25-pins {
> -                       pins = "GPIO25/IOXHDI";
> +                       pins = "GPIO25/HGPIO5/IOXHDI";
>                         bias-disable;
>                         input-enable;
>                 };
>                 gpio25o_pins: gpio25o-pins {
> -                       pins = "GPIO25/IOXHDI";
> +                       pins = "GPIO25/HGPIO5/IOXHDI";
>                         bias-disable;
>                         output-high;
>                 };
>                 gpio25ol_pins: gpio25ol-pins {
> -                       pins = "GPIO25/IOXHDI";
> +                       pins = "GPIO25/HGPIO5/IOXHDI";
>                         bias-disable;
>                         output-low;
>                 };
> @@ -523,32 +523,32 @@ gpio58ol_pins: gpio58ol-pins {
>                         output-low;
>                 };
>                 gpio59_pins: gpio59-pins {
> -                       pins = "GPIO59/SMB3DSDA";
> +                       pins = "GPIO59/HGPIO6/SMB3DSDA";
>                         bias-disable;
>                         input-enable;
>                 };
>                 gpio59o_pins: gpio59o-pins {
> -                       pins = "GPIO59/SMB3DSDA";
> +                       pins = "GPIO59/HGPIO6/SMB3DSDA";
>                         bias-disable;
>                         output-high;
>                 };
>                 gpio59ol_pins: gpio59ol-pins {
> -                       pins = "GPIO59/SMB3DSDA";
> +                       pins = "GPIO59/HGPIO6/SMB3DSDA";
>                         bias-disable;
>                         output-low;
>                 };
>                 gpio60_pins: gpio60-pins {
> -                       pins = "GPIO60/SMB3DSCL";
> +                       pins = "GPIO60/HGPIO7/SMB3DSCL";
>                         bias-disable;
>                         input-enable;
>                 };
>                 gpio60o_pins: gpio60o-pins {
> -                       pins = "GPIO60/SMB3DSCL";
> +                       pins = "GPIO60/HGPIO7/SMB3DSCL";
>                         bias-disable;
>                         output-high;
>                 };
>                 gpio60ol_pins: gpio60ol-pins {
> -                       pins = "GPIO60/SMB3DSCL";
> +                       pins = "GPIO60/HGPIO7/SMB3DSCL";
>                         bias-disable;
>                         output-low;
>                 };
> --
> 2.34.0.rc1.387.gb447b232ab-goog
>
