Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C956A641E
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 01:18:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRFFh2pgRz3bhD
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 11:18:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TpkSu77E;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TpkSu77E;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRFF02psKz2yw0;
	Wed,  1 Mar 2023 11:17:54 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id ck15so47496325edb.0;
        Tue, 28 Feb 2023 16:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CX/UlvUpEOObHnKgy2nGq9RLjTYBpOBbXecaXxjC6bU=;
        b=TpkSu77EQxvtY0DpBTCQH9L31x0vlJwkJ0SVlP1ctEwuhdkUs2bR6FzJVSue8fxFzO
         6Bu9QM0Fbt4l5TuQPkF/qObZn84TY760HzbWuI8a5jcta8y/m79lEyxkv0LYMbqVdhCx
         8MMnGifFnuczhmWJnL2Nljafagvjs88t/oRno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CX/UlvUpEOObHnKgy2nGq9RLjTYBpOBbXecaXxjC6bU=;
        b=mEB1DFwM1dTgFvNZv5NLmJdJWlP6NmFVvFKSwHkroBtp8rEWcCxxH/CNYRZ1CWinQh
         +S8Q0/GIZDsaeZpMnw0bglnBpbqq/c8RzaAbI0d0McT3gcKag5vB6DiBIuZPC2H+ejjO
         dHQ3HJ2lAOUfnC00jBBBiY480jl+JzJlFNu1b2LM6PITElw6+ik5PPTHF8oyCvLj7A2v
         F0QT61NgY4QYegWOFDb1l/TijQYnnaZ21ssVLYuZfWB9pWF1frvTdbH00X/iemXpNzfG
         0JW9DpbixVDKkUhL4ElH40w9Eoh4b16RubfLtoAmXZCHDKxkWDJpNHg0BkEFzRPvQ8EV
         CPPw==
X-Gm-Message-State: AO0yUKXPA76sDqJ4mTnU32aGBBUa4zGuB3YqYN9P/SJfSH3ZhHW8zEQ/
	O0ctKWS0hceC/37UJaDZo1gnTi6SeikmUlliggU=
X-Google-Smtp-Source: AK7set9nqT3/GW3KWnP4XtzE5YzdIhzPhnt4YkcC+fIxbs0hJzMGO1mJKle+lI7WC2l6DTANxa9ZQuH9wieYVA0c1Vc=
X-Received: by 2002:a05:6402:4494:b0:4af:6e95:85e9 with SMTP id
 er20-20020a056402449400b004af6e9585e9mr10379668edb.4.1677629867947; Tue, 28
 Feb 2023 16:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20230228102820.18477-1-chanh@os.amperecomputing.com>
In-Reply-To: <20230228102820.18477-1-chanh@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 00:17:36 +0000
Message-ID: <CACPK8XesuUATxCVEGpus=ZHTkjS=L=gjRHC3V+=XLSofU-WSSw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: mtmitchell: Enable NCSI
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 28 Feb 2023 at 10:28, Chanh Nguyen <chanh@os.amperecomputing.com> wrote:
>
> Support the mac3 (RGMII4) as an NC-SI stack instead of an MDIO PHY.
>
> The OCP slot #0 and OCP slot #1 use a common the BMC_NCSI signal,
> so we use only one of them at the same time. The OCP slot #0 will
> be enabled by PCA9539's setting by default.
>
> Also, enable the OCP Auxiliary Power during booting.
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

LGTM. I'll apply it once we have a -rc1.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
> Changes in v2:
>    - Change PCA9539APW node name.                     [Krzysztof]
> ---
>  .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> index 4b91600eaf62..1e0e88465254 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> @@ -251,6 +251,14 @@
>         pinctrl-0 = <&pinctrl_rgmii1_default>;
>  };
>
> +&mac3 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii4_default>;
> +       clock-names = "MACCLK", "RCLK";
> +       use-ncsi;
> +};
> +
>  &fmc {
>         status = "okay";
>         flash@0 {
> @@ -439,6 +447,26 @@
>         status = "okay";
>  };
>
> +&i2c8 {
> +       status = "okay";
> +
> +       gpio@77 {
> +               compatible = "nxp,pca9539";
> +               reg = <0x77>;
> +               gpio-controller;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #gpio-cells = <2>;
> +
> +               bmc-ocp0-en-hog {
> +                       gpio-hog;
> +                       gpios = <7 GPIO_ACTIVE_LOW>;
> +                       output-high;
> +                       line-name = "bmc-ocp0-en-n";
> +               };
> +       };
> +};
> +
>  &i2c9 {
>         status = "okay";
>  };
> @@ -530,13 +558,20 @@
>         /*V0-V7*/       "s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
>                         "host0-reboot-ack-n","host0-ready","host0-shd-req-n",
>                         "host0-shd-ack-n","s0-overtemp-n",
> -       /*W0-W7*/       "ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
> +       /*W0-W7*/       "","ocp-main-pwren","ocp-pgood","",
>                         "bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
>         /*X0-X7*/       "i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
>                         "s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
>                         "s1-overtemp-n","s1-spi-auth-fail-n",
>         /*Y0-Y7*/       "","","","","","","","host0-special-boot",
>         /*Z0-Z7*/       "reset-button","ps0-pgood","ps1-pgood","","","","","";
> +
> +       ocp-aux-pwren-hog {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "ocp-aux-pwren";
> +       };
>  };
>
>  &gpio1 {
> --
> 2.17.1
>
