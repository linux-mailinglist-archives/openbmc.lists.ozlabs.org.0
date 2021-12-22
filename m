Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8032847CAD6
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 02:38:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJbZN2cM3z2ywv
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 12:38:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NEsC0bwT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NEsC0bwT; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJbYv3z3fz2xt0;
 Wed, 22 Dec 2021 12:38:09 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id p4so859765qkm.7;
 Tue, 21 Dec 2021 17:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fJAfK3DqpfiPmHQwaBI/smOBiafG0laxAPbgGyOvQTg=;
 b=NEsC0bwTrII2R5alA3OhKMtCJh6qrGtuahtPqUjey2ycLMqVZjwaz2JNlqDUDv/LSz
 ZQqLPDa9wna5XSVi0/muG0Apl+8GH4q4zGAPrcxoZX9XOmTJRnuCPjYxhATh7kTWXRyf
 gUiVLkVJypdREiMOBk6ZrWff6h4SMV81HMYzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fJAfK3DqpfiPmHQwaBI/smOBiafG0laxAPbgGyOvQTg=;
 b=W7xBFVcezxY0MGDwgec8V8ryNokpKiyHTpOwW+KOokpy550Jlk+HPFi1Hip+Td19Y0
 6f9XeG+aHQOVEyf/IRYf8epx9kqdf/pm4uQJzkB9yY7CxwH6jk66aaJowhNc3TNUUnlJ
 c4QY8J/4IForhoKH/4gRBCznSt7RAOjI2803antseR7dWQekfc2uwLqCoqHQTdyEt1Kk
 NMl+7wcbeHOS4l53dem58Y+y3G/ms6X2mbYDmI/gEPcy5vBuL9kXcFjytEQbo/MXg+TX
 nECj4aJ8xu7s4TNXgXPQUlqG4S44MCFEhak/SMtpa3PofuqJbWQByHGEJ3aP4bDNhAo4
 b+8w==
X-Gm-Message-State: AOAM532vKuHl5ZKDNWiDVpPMcGmdHbw5E7+Y15MINa7mP+RefcTmZ0Sg
 WEabTaDk07Uu64N2/hM6pfdMDx+i1KU0fYZ+Vvs=
X-Google-Smtp-Source: ABdhPJxhiavwjj59AhM6tp4D2rXd4oQSL5w/FRsldzbqAWfZsoEC+QgYrJGyQgUTUvGjcxZ9auohlAELtVpy61lkCeg=
X-Received: by 2002:a37:94c2:: with SMTP id w185mr740322qkd.666.1640137086103; 
 Tue, 21 Dec 2021 17:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20211210093623.2140640-1-yulei.sh@bytedance.com>
In-Reply-To: <20211210093623.2140640-1-yulei.sh@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 01:37:53 +0000
Message-ID: <CACPK8XeK977rY33Kt3-vhEbqa68iXbG6vbRAfRGYxC94tE=t_g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: g220a: Enable secondary flash
To: Lei YU <yulei.sh@bytedance.com>
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
 openbmc <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lei,

On Fri, 10 Dec 2021 at 09:36, Lei YU <yulei.sh@bytedance.com> wrote:
>
> Enable the secondary flash of the g220a's BMC and the wdt2.
>
> Signed-off-by: Lei YU <yulei.sh@bytedance.com>

I've applied this and the layout patch for v5.17, and to the openbmc tree.

> ---
>  arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> index 01dace8f5e5f..05f392f42960 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> @@ -260,6 +260,13 @@ flash@0 {
>                 spi-max-frequency = <50000000>;
>  #include "openbmc-flash-layout-64.dtsi"
>         };
> +       flash@1 {
> +               status = "okay";
> +               label = "alt-bmc";
> +               m25p,fast-read;
> +               spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64-alt.dtsi"
> +       };
>  };
>
>  &spi1 {
> @@ -278,6 +285,10 @@ &adc {
>         status = "okay";
>  };
>
> +&wdt2 {
> +       aspeed,alt-boot;
> +};
> +
>  &gpio {
>         status = "okay";
>         gpio-line-names =
> --
> 2.25.1
>
