Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BCB4ED34C
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 07:35:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTX8V3HLQz2yhD
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 16:35:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=h7zuOYeL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=h7zuOYeL; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTX853fzLz2x9B;
 Thu, 31 Mar 2022 16:35:31 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id j21so20599345qta.0;
 Wed, 30 Mar 2022 22:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FRwyhCfFURBcXBoHw/XPGOMafg7GfcP+PVhu/Z1q1Wc=;
 b=h7zuOYeL1xlzDSg/Dz9LLtGzsTkAV8ZhfdG2hlkY8DR9IR5/Cf8Cp6Rr6kGS4B70/z
 pEn6jkHLyHrIhWcg89KwLitabqR04yS0kFAUxsLIbXC9FU3xk2/ohlrxg++YbUaLiFKw
 R2Ts3e5t60p0t4zZN0HprcfVl+gjtSq4mJSv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRwyhCfFURBcXBoHw/XPGOMafg7GfcP+PVhu/Z1q1Wc=;
 b=Xtdh9UACCpf11b89U+/yl1vjI95LbU5W3wwS4AdicuZsNDle1ScLG0zoMaLrEFplcT
 IeCnhWQsRnKAlYOqgMBYKJBZ3INiPm8uXuUtkAaOgfzxuaR+oxpQiHRTxX4/vG7N50q4
 1vWyadxOmfKikz+tu+ze6tFd6lvSaC3sTreNL5QglIghP9FgJf5BciasBW6FovrCLoI2
 sF2JSg78wDDKQqLzZ7sM/NMWA/1eoEsXiGNVUPF3Qijzsvn4Va6rmpvXGLqaniaVGilM
 upwTxVmGHa3mc5j6kyAjIaUYus3aWAf2jkO6QyOkfDqs7FGYu00jAY1RG6zByNrYU+KX
 pzBg==
X-Gm-Message-State: AOAM5305F/jKrbknVNdEgX1ADGi7Kx27L4r9jPdrphfoNFXKXLMxM7y+
 +tKrUszmp9TZOR9lFQc6PmwytnxviRv9rakbzVk=
X-Google-Smtp-Source: ABdhPJx3x9+Ty7fxA/kSw7b2BKr5dhZh18sbQ5KgYAsbTW/db0vNpiEu2Yno6yrZ9TmFayNUNAEDO1hCS0geM0u/hJY=
X-Received: by 2002:a05:622a:285:b0:2e1:dcda:98fd with SMTP id
 z5-20020a05622a028500b002e1dcda98fdmr2825408qtw.625.1648704928211; Wed, 30
 Mar 2022 22:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220331022425.28606-1-zev@bewilderbeest.net>
In-Reply-To: <20220331022425.28606-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 31 Mar 2022 05:35:16 +0000
Message-ID: <CACPK8Xfg1xV6Cwb2qhu3A7-Ladj6htr45s8ZFqwApTFj4Ab2tQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: romed8hm3: Add lm25066 sense
 resistor values
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
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 31 Mar 2022 at 02:24, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> With this property set the sensor readings from these devices can now
> be calibrated properly.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I guess:

Fixes: a9a3d60b937a ("ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC")

Reviewed-by: Joel Stanley <joel@jms.id.au>

I'll send some fixes in after -rc1.

> ---
>  arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> index e71ccfd1df63..572a43e57cac 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> @@ -100,12 +100,14 @@ w83773g@4c {
>         lm25066@40 {
>                 compatible = "lm25066";
>                 reg = <0x40>;
> +               shunt-resistor-micro-ohms = <1000>;
>         };
>
>         /* 12VSB PMIC */
>         lm25066@41 {
>                 compatible = "lm25066";
>                 reg = <0x41>;
> +               shunt-resistor-micro-ohms = <10000>;
>         };
>  };
>
> --
> 2.35.1
>
