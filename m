Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD57C4784
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 03:53:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SiPtBJg4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4wlW5LShz3cQP
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 12:53:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SiPtBJg4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4wkB4kw9z3vYs;
	Wed, 11 Oct 2023 12:52:02 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso1054693866b.0;
        Tue, 10 Oct 2023 18:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1696989118; x=1697593918; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k8jpVbTN8e1NFVPlrUmh8i2J9AzNXH5X36L3cIHXeoE=;
        b=SiPtBJg4Vlug7TXdQNYCkYNvtJIfwCjc+ZH87ymmPMp15XQ93neCJOKEHXQvZhAY7x
         Is3cbDKxkRQ5wHs14FgsJio/lO5UpyeCvkEyc1EIVCpFO4JebBjwYLSR8Hols0IdmM+K
         5Or6h67OuJijQIoG5V5lxvAmrHd+ADsZXIDkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696989118; x=1697593918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8jpVbTN8e1NFVPlrUmh8i2J9AzNXH5X36L3cIHXeoE=;
        b=XYndcOep+nbWcbdSBZC7mVT3RJapuENY/7Gmf2FGx+pwSMcUmWdf7TwAFp7W2RpZ0n
         2JzNNQn2g9ZrbJWbO6gN9VXMUQrw3sfHYlMmJutdvhKle4B52g5ficPXqUlUntwYi1KP
         2YIFSf7rnOiPvHcrTcEH1/pHWzXBUdDs/mbF2nfLS/RtWSgrtT6c13IvR7rSqiEAoQdT
         OU3GdXK6S5+vFIUwV2In2tg9xHQTeOZWcyJGt0oJ6DuENuuS7PDEuZibvwQfXPMJF55o
         uE/bzzsIb1xd1DiRU1Uhy6vCmvYGgkZtozHZyGT/ocJsJPIID2Dsg9njIBepHBZt9/Ea
         KyHQ==
X-Gm-Message-State: AOJu0YwzzEXY45tfElNhCwc0CqL9LbGZZnH3a5eeCxnnHWTX0kqKwCDw
	322/KEX/k5OZSt1MLqjktzR5pm7YIq6ix3iPxqFE33d3woU=
X-Google-Smtp-Source: AGHT+IFCx+g9JHWDoLnMcozkiubkyTMt0hDKy7+W4kFVGz/dfkDSi66nrCqbpAmZXiZUa1jA01VOuaFCFh5GmHP1+8M=
X-Received: by 2002:a17:906:220f:b0:9a4:88af:b82 with SMTP id
 s15-20020a170906220f00b009a488af0b82mr15091743ejs.77.1696989118416; Tue, 10
 Oct 2023 18:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231005035525.19036-1-chanh@os.amperecomputing.com> <20231005035525.19036-7-chanh@os.amperecomputing.com>
In-Reply-To: <20231005035525.19036-7-chanh@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Oct 2023 12:21:47 +1030
Message-ID: <CACPK8Xfbh=jM0QRNYTQ-rjsyugzhoPxxMg+-1C+5g+uNtir+nw@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: aspeed: mtmitchell: Remove redundant ADC configurations
To: Chanh Nguyen <chanh@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 5 Oct 2023 at 14:26, Chanh Nguyen <chanh@os.amperecomputing.com> wrote:
>
> Mt.Mitchell DVT and later hardware do not use adc1. It only uses
> adc0 with channels 0, 1 and 2. This commit removes redundant ADC
> configurations.
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> index c676172f0dbf..eb8d5e367276 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> @@ -564,20 +564,7 @@
>
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> -               &pinctrl_adc2_default &pinctrl_adc3_default
> -               &pinctrl_adc4_default &pinctrl_adc5_default
> -               &pinctrl_adc6_default &pinctrl_adc7_default>;
> -};
> -
> -&adc1 {
> -       ref_voltage = <2500>;
> -       status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> -               &pinctrl_adc10_default &pinctrl_adc11_default
> -               &pinctrl_adc12_default &pinctrl_adc13_default
> -               &pinctrl_adc14_default &pinctrl_adc15_default>;
> +               &pinctrl_adc2_default>;
>  };
>
>  &vhub {
> --
> 2.17.1
>
