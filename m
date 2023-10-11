Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EAA7C478B
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 03:54:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=USJai6k6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4wml1RDbz3cDS
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 12:54:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=USJai6k6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4wkx5Ks6z3vZg;
	Wed, 11 Oct 2023 12:52:41 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9adca291f99so1062350866b.2;
        Tue, 10 Oct 2023 18:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1696989158; x=1697593958; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=luUw5tqGQ3BU2f4zRF8kts9D/h2ull0YaqRJxHMMH9o=;
        b=USJai6k6ubTwRbI+EfW8ty+50loRmBYC0KZ/HJHmkf3LLNn1oMeGxRRLmGXtrtg34w
         BvvlLidIUX5PvYiPJnjPqrUB4s6tt+jHONkTdGpFnUMNOiYIRkgaNzvvq9hDc2BPJNro
         R4DlUeZYrtF7hQR6BxFZ+F3e9KLDGMPBtq4Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696989158; x=1697593958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luUw5tqGQ3BU2f4zRF8kts9D/h2ull0YaqRJxHMMH9o=;
        b=mbbDFeUsNfuKRC3sa7nzEXPrY2R0NjNhnzn+PpwxU3WcTU0ImTpIEd8OjnMdnnSstp
         2s4DFhoil6w2Dkp2GynoFMNZW66H4E6wMIFU3Qz2Zuf+k9w1pa6KKdy+3V2v/C+7ujYg
         LmbtbF/N7Et985yhYBroX7Phy9ca/Mk5oCX4oE3stzx2NopcSndZfatXRHg+6xhXz6wT
         XuAei7IZE1zex/wK2hJpaHFELASEKHzV9UCb9tn1fRN/2v0H3+FMOFfhIlA+1C6e1yV0
         ZjZkvkud6igBwsyP4NKq9pgCfA9+hmFfwu2phPBsgUeB5Gj2WEz759eAGNyN1Z87yLQm
         KrNQ==
X-Gm-Message-State: AOJu0YwmppceBVykVwMbmJOXmTcMPzus5riRAczc9sA0Ftl1UkFLl0ZB
	sC+CuiQF1CuoM20NYu4L2tpsBMMJc1T30mdJ0xw=
X-Google-Smtp-Source: AGHT+IF3xxxedApqqgkmd6UpoOa2FEJjAqgkiL1GacDU0VEwrkGybGeOFwHXsM6784ZOvbnnHBcngKb3QSFjnv4Wn8M=
X-Received: by 2002:a17:907:2723:b0:9a5:d657:47ee with SMTP id
 d3-20020a170907272300b009a5d65747eemr16776999ejl.58.1696989158194; Tue, 10
 Oct 2023 18:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231005035525.19036-1-chanh@os.amperecomputing.com> <20231005035525.19036-8-chanh@os.amperecomputing.com>
In-Reply-To: <20231005035525.19036-8-chanh@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Oct 2023 12:22:26 +1030
Message-ID: <CACPK8XehearTYQrmKTwwCB=Gvgur25Zr+UkgxzJW-7KKbJ9U7w@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port
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
> Adds the I2C alias ports to each NVMe drive via the
> backplane card.
>
> Besides that, it also adds the eeprom and temperature sensor
> on the backplane card.
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 267 ++++++++++++++++++
>  1 file changed, 267 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> index eb8d5e367276..1f70e3e4e83b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> @@ -14,6 +14,42 @@
>         aliases {
>                 serial7 = &uart8;
>                 serial8 = &uart9;
> +
> +               /*
> +                *  I2C NVMe alias port
> +                */
> +               i2c100 = &backplane_0;
> +               i2c48 = &nvmeslot_0;
> +               i2c49 = &nvmeslot_1;
> +               i2c50 = &nvmeslot_2;
> +               i2c51 = &nvmeslot_3;
> +               i2c52 = &nvmeslot_4;
> +               i2c53 = &nvmeslot_5;
> +               i2c54 = &nvmeslot_6;
> +               i2c55 = &nvmeslot_7;
> +
> +               i2c101 = &backplane_1;
> +               i2c56 = &nvmeslot_8;
> +               i2c57 = &nvmeslot_9;
> +               i2c58 = &nvmeslot_10;
> +               i2c59 = &nvmeslot_11;
> +               i2c60 = &nvmeslot_12;
> +               i2c61 = &nvmeslot_13;
> +               i2c62 = &nvmeslot_14;
> +               i2c63 = &nvmeslot_15;
> +
> +               i2c102 = &backplane_2;
> +               i2c64 = &nvmeslot_16;
> +               i2c65 = &nvmeslot_17;
> +               i2c66 = &nvmeslot_18;
> +               i2c67 = &nvmeslot_19;
> +               i2c68 = &nvmeslot_20;
> +               i2c69 = &nvmeslot_21;
> +               i2c70 = &nvmeslot_22;
> +               i2c71 = &nvmeslot_23;
> +
> +               i2c80 = &nvme_m2_0;
> +               i2c81 = &nvme_m2_1;
>         };
>
>         chosen {
> @@ -534,6 +570,237 @@
>
>  &i2c9 {
>         status = "okay";
> +       i2c-mux@70 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +               i2c-mux-idle-disconnect;
> +
> +               backplane_1: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x0>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c64";
> +                               reg = <0x50>;
> +                               pagesize = <32>;
> +                       };
> +
> +                       i2c-mux@71 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x71>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               nvmeslot_8: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x0>;
> +                               };
> +                               nvmeslot_9: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x1>;
> +                               };
> +                               nvmeslot_10: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x2>;
> +                               };
> +                               nvmeslot_11: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x3>;
> +                               };
> +                               nvmeslot_12: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x4>;
> +                               };
> +                               nvmeslot_13: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x5>;
> +                               };
> +                               nvmeslot_14: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x6>;
> +                               };
> +                               nvmeslot_15: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x7>;
> +                               };
> +                       };
> +
> +                       tmp432@4c {
> +                               compatible = "ti,tmp75";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               backplane_2: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x2>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c64";
> +                               reg = <0x50>;
> +                               pagesize = <32>;
> +                       };
> +
> +                       i2c-mux@71 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x71>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               nvmeslot_16: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x0>;
> +                               };
> +                               nvmeslot_17: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x1>;
> +                               };
> +                               nvmeslot_18: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x2>;
> +                               };
> +                               nvmeslot_19: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x3>;
> +                               };
> +                               nvmeslot_20: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x4>;
> +                               };
> +                               nvmeslot_21: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x5>;
> +                               };
> +                               nvmeslot_22: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x6>;
> +                               };
> +                               nvmeslot_23: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x7>;
> +                               };
> +                       };
> +
> +                       tmp432@4c {
> +                               compatible = "ti,tmp75";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               backplane_0: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x4>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c64";
> +                               reg = <0x50>;
> +                               pagesize = <32>;
> +                       };
> +
> +                       i2c-mux@71 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x71>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               nvmeslot_0: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x0>;
> +                               };
> +                               nvmeslot_1: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x1>;
> +                               };
> +                               nvmeslot_2: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x2>;
> +                               };
> +                               nvmeslot_3: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x3>;
> +                               };
> +                               nvmeslot_4: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x4>;
> +                               };
> +                               nvmeslot_5: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x5>;
> +                               };
> +                               nvmeslot_6: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x6>;
> +                               };
> +                               nvmeslot_7: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x7>;
> +                               };
> +                       };
> +
> +                       tmp432@4c {
> +                               compatible = "ti,tmp75";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +
> +               i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x7>;
> +
> +                       i2c-mux@71 {
> +                               compatible = "nxp,pca9546";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x71>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               nvme_m2_0: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x0>;
> +                               };
> +
> +                               nvme_m2_1: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x1>;
> +                               };
> +                       };
> +               };
> +       };
>  };
>
>  &i2c11 {
> --
> 2.17.1
>
