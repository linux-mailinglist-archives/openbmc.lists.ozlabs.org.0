Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112A4D3F55
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 03:46:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDYNg33Pdz3056
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 13:46:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=P3INw/Os;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=P3INw/Os; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDYNC1nScz2xKR
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 13:46:02 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id jq9so3605196qvb.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Mar 2022 18:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovS0xc3NlUvmaBKWsNDqi5XI9DcultD+2i8fAoUfuZE=;
 b=P3INw/Osw6Uvc98sN+P5c6KlMe0G/3is/Kk8WzDBE/1pY089f+lUeGM/xRYq/8ieRx
 KujqcQ6JcfEasSIsjxR/D6oOnObkGRxj2GxzFfkbeDjLMqO39K44OoCj0fu3I6DdkxH3
 /ra7hndclA8T24IY+0/zpwOdXkmTp2bPBmvbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovS0xc3NlUvmaBKWsNDqi5XI9DcultD+2i8fAoUfuZE=;
 b=QihZTW9H93VmYMWzAv3Uj5gfxEW7a0+2v3IWK9BbGHMnEOK7JEpabKOiHt0+Hk7CsK
 A/anQ3XnzuP2AEwl2QtmHPiZm3nrinON4ApAFfMy2qgWUUjcTEWoIljiUkRC/9O7HFUP
 HrzJXwgd/AvT+s+yZx6Zsa2MVhHeiLOQOyWP/Qr7Tvz8xT9Bb3uTsy+vA48NNIzikcYV
 dyXloEpjLuvNsfUEcv+OnCYDVkfYdR4NkClD3friAneJ459zPmynladMzFMnEToDWaO4
 GuJippEBs7ZVja26ESjx9SlbqxhBIKXwXgFcp/ho5rSLpVJYpFBVbCheLXpUud0d9jrL
 8yxQ==
X-Gm-Message-State: AOAM532grBqHKhaXXBv0LA3pcPYqj0M1ctVD8kiPlmQSWhM1wSjyCP1s
 MaqYn+86iu7fFQESfNA6jQZOcN0TCvwOHEh4FzE=
X-Google-Smtp-Source: ABdhPJztU4lWwS7B3oFeIJUSQJmJKoNgg1ENQQap8OJWOJ4geLdnk5qoGoQkN/mYMi1mxoqMG7399CeQ/S8sY3UvgAc=
X-Received: by 2002:ad4:5fc5:0:b0:435:4420:d056 with SMTP id
 jq5-20020ad45fc5000000b004354420d056mr2149966qvb.130.1646880357786; Wed, 09
 Mar 2022 18:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20220310014720.439813-1-wangxiaohua.1217@bytedance.com>
In-Reply-To: <20220310014720.439813-1-wangxiaohua.1217@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Mar 2022 02:45:45 +0000
Message-ID: <CACPK8XfPPLoS=mhwbAHY4EfVad=1_dnhB+gaHBjPj1wWbWE4gg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15] ARM: dts: aspeed-g6: Add VIDEO node
To: Wang Xiaohua <wangxiaohua.1217@bytedance.com>
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

On Thu, 10 Mar 2022 at 01:47, Wang Xiaohua
<wangxiaohua.1217@bytedance.com> wrote:
>
> Add the VIDEO node back
>
> Deleted by commit 645afe73f9512ee2
> ("ARM: dts: aspeed: ast2600: Update XDMA engine node")
>
> Signed-off-by: Wang Xiaohua <wangxiaohua.1217@bytedance.com>

Thanks, I've applied this.

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index c32e87fad4dc..3827e707f3a1 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -298,6 +298,16 @@ vhub: usb-vhub@1e6a0000 {
>                         status = "disabled";
>                 };
>
> +               video: video@1e700000 {
> +                       compatible = "aspeed,ast2600-video-engine";
> +                       reg = <0x1e700000 0x1000>;
> +                       clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +                                <&syscon ASPEED_CLK_GATE_ECLK>;
> +                       clock-names = "vclk", "eclk";
> +                       interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };
> +
>                 apb {
>                         compatible = "simple-bus";
>                         #address-cells = <1>;
> --
> 2.25.1
>
