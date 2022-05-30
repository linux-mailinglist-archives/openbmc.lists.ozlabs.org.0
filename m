Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FDF537367
	for <lists+openbmc@lfdr.de>; Mon, 30 May 2022 03:50:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBJJp3wd4z308M
	for <lists+openbmc@lfdr.de>; Mon, 30 May 2022 11:50:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OgWzttlO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OgWzttlO;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBJJL1G6Yz2xnN
	for <openbmc@lists.ozlabs.org>; Mon, 30 May 2022 11:50:09 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id e25so2066345wra.11
        for <openbmc@lists.ozlabs.org>; Sun, 29 May 2022 18:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KFYdGxCviuYw41X1kDOWW0+Ewb5ovhGNZ0ZuUIUHI3c=;
        b=OgWzttlOYXzra/puCRDH7GzhuwlzIAM5vyoF35Ci8ju78T3s2n1kbvLydoVlyavWWz
         IR1fsHIE1wbA3+fJ9rSa92MLTnrQyduzjGnaZXka4wqv1kgDEeoy/jCCKKUJ9+BmJw5+
         d+z7YM+I4rR/veq+cduRxp8/wXQLVM5wAsKIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KFYdGxCviuYw41X1kDOWW0+Ewb5ovhGNZ0ZuUIUHI3c=;
        b=A/890IKhgzNlLpm5y5Xo5XI2BMq+QIZV82ggNKMehCThJ9i28QSOnL3y73GtMhzxPH
         oD3tqfTqEIWwjVisxlnouylFEuAvNCvQDA5uzp30tYypKkYpyG04BCBMPjL1mjWtc4bP
         zyF9aPNJM2VO3Wl4yKyhNr1pvRadMGiyWusqrslgWBPZmfdw2hf7GBMI/o5mktXkA+H8
         zySDfU0UpTuSHV0rx4BIkDckJSMqnqgfVn3LlTPEk6OdWQf+Nft4tatTtlF2F0N4nnLG
         +DBWI5s7VXlj34UNvjQlfkzOOFYXbSCwqPCkQKvy6+f0puAHRPmMCAC4Nro+suZGbqMU
         r7Xw==
X-Gm-Message-State: AOAM5307ySRQQxT8II2xEO1ACLDbv5Rnsrw6DMJ2OLc2YOSqNCmpfvht
	tpS56bBlfrgTBP1Jrh0Idne+vHhj9GcxqP08LHWcctxj
X-Google-Smtp-Source: ABdhPJwzIrbIfK0ZmLr0/ScqE1oK4CGaMfjVwvYxzhdRLZVoGpp4a3EOX0OLcCAurN9sRELURnT7ypSn7j3O5joEzhM=
X-Received: by 2002:adf:ec0f:0:b0:20f:c997:6dba with SMTP id
 x15-20020adfec0f000000b0020fc9976dbamr33737515wrn.628.1653875403783; Sun, 29
 May 2022 18:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220527141246.21704-1-eajames@linux.ibm.com>
In-Reply-To: <20220527141246.21704-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 May 2022 01:49:50 +0000
Message-ID: <CACPK8XeCfLBwNPW6JqNE67-E6p8dGj5k=+1cOm+f6TREW-f-Tg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] arm: dts: ast2600: Add I2C pinctrl
To: Eddie James <eajames@linux.ibm.com>
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

On Fri, 27 May 2022 at 14:12, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set the pinctrl groups for each I2C bus. These are essential to
> I2C operating correctly.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Thanks, I've applied this.

It should also be sent upstream when you get a chance.

Cheers,

Joel

> ---
>  arch/arm/dts/ast2600.dtsi | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm/dts/ast2600.dtsi b/arch/arm/dts/ast2600.dtsi
> index 5c14a4a453..a383979ae7 100644
> --- a/arch/arm/dts/ast2600.dtsi
> +++ b/arch/arm/dts/ast2600.dtsi
> @@ -803,6 +803,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c1_default>;
>                 status = "disabled";
>         };
>
> @@ -816,6 +818,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c2_default>;
>                 status = "disabled";
>         };
>
> @@ -829,6 +833,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c3_default>;
>         };
>
>         i2c3: i2c@200 {
> @@ -841,6 +847,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c4_default>;
>         };
>
>         i2c4: i2c@280 {
> @@ -853,6 +861,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c5_default>;
>         };
>
>         i2c5: i2c@300 {
> @@ -865,6 +875,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c6_default>;
>         };
>
>         i2c6: i2c@380 {
> @@ -877,6 +889,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c7_default>;
>         };
>
>         i2c7: i2c@400 {
> @@ -889,6 +903,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c8_default>;
>         };
>
>         i2c8: i2c@480 {
> @@ -901,6 +917,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c9_default>;
>         };
>
>         i2c9: i2c@500 {
> @@ -913,6 +931,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c10_default>;
>                 status = "disabled";
>         };
>
> @@ -926,6 +946,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c11_default>;
>                 status = "disabled";
>         };
>
> @@ -939,6 +961,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c12_default>;
>                 status = "disabled";
>         };
>
> @@ -952,6 +976,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c13_default>;
>                 status = "disabled";
>         };
>
> @@ -965,6 +991,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c14_default>;
>                 status = "disabled";
>         };
>
> @@ -978,6 +1006,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c15_default>;
>                 status = "disabled";
>         };
>
> @@ -991,6 +1021,8 @@
>                 bus-frequency = <100000>;
>                 interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&scu ASPEED_CLK_APB2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c16_default>;
>                 status = "disabled";
>         };
>
> @@ -1218,6 +1250,7 @@
>                 function = "I2C1";
>                 groups = "I2C1";
>         };
> +
>         pinctrl_i2c2_default: i2c2_default {
>                 function = "I2C2";
>                 groups = "I2C2";
> --
> 2.27.0
>
