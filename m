Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B645131E09
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 04:35:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sJ1V3HQZzDqMd
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 14:35:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="O/vFmAKA"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sJ0c49lszDq9G;
 Tue,  7 Jan 2020 14:34:53 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id x129so41491045qke.8;
 Mon, 06 Jan 2020 19:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ndz92OQlth4qYpDlhrpQ+U0RT8dpiuuzWnP0LR0lmf0=;
 b=O/vFmAKAucz5ybhp+Bbqjm5p5I9Fe5AIpf0Hl18CR3AY6xSOcSJvLMD6wq8rkSHQ7b
 xed+biueya7POybp+amzJ4WOZnWNcpenUWBOqlotsF67/UWF1DS8AEDxEVY+56sqrnus
 GQM3/VoFDoypI5Uc4HL9dtQRRTDML9q40FK90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ndz92OQlth4qYpDlhrpQ+U0RT8dpiuuzWnP0LR0lmf0=;
 b=jLYPW0g7fajxMI6yJTwKSKd2UHFA/x05bJsEHiv327Kahc1Si7C58sWOpealc5QIRq
 erltzLQ++d5o16I0IfzPb5q6OFGOWU/2yQqpia1gfHjEUlzARPFL7meHF3TYMchS6Umu
 uG/MafzcPObZ1wgcvPlQtNp8uZkirpw0o9tp+7mXtI+LQLQcsN8lUsFNQ7JXngBOxFMz
 1UYp2jRa95hr0yepNAjsemdeA/P3QqoBpm+BC0qf708gfZIiwthMMHQGFHq20o9iqeFc
 ymuKfeZpRjDXTD6EiurVlUbbR84xhpWG80ynha9OneUCBr4yIGEwhf8V+/b5iOGwIKZf
 pNNQ==
X-Gm-Message-State: APjAAAUSvI0IhlvUXyJAbaGqAOnMiqJxV+KuzWFdiDikBhU16Y1cFvEW
 hTprXSf35nMEMg/Wdf5ACvKx8X21Y3Qn/hUzWkM=
X-Google-Smtp-Source: APXvYqzG/yQj/It0Jak2RSDO0tveY9cMF2amzU1CBpByHehdAai9VEIKQ7Wsyj3hkRaiStx+jL8x9EHSqJJheOTg+uU=
X-Received: by 2002:a37:68d5:: with SMTP id
 d204mr86063740qkc.171.1578368088761; 
 Mon, 06 Jan 2020 19:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
 <20200107011503.17435-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200107011503.17435-2-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Jan 2020 03:34:37 +0000
Message-ID: <CACPK8XcEVBp6hQ=97ZVM6a_y77PAhLZZsV104FDwTCsZm7JWDg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: aspeed-g6: Add Video Engine node
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 7 Jan 2020 at 01:14, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> The AST2600 has Video Engine so add it.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Acked-by: Joel Stanley <joel@jms.id.au>

I will merge this through the aspeed tree for 5.6.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 5f6142d99eeb..89833987e270 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -297,6 +297,16 @@
>                                 quality = <100>;
>                         };
>
> +                       video: video@1e700000 {
> +                               compatible = "aspeed,ast2600-video-engine";
> +                               reg = <0x1e700000 0x1000>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +                                        <&syscon ASPEED_CLK_GATE_ECLK>;
> +                               clock-names = "vclk", "eclk";
> +                               interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                               status = "disabled";
> +                       };
> +
>                         gpio0: gpio@1e780000 {
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
> --
> 2.17.1
>
