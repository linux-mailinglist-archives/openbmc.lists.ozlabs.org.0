Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345577C4774
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 03:49:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Tc3iDCYD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4wgj6v7Sz3cQr
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 12:49:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Tc3iDCYD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4wfg6DS3z3cMH;
	Wed, 11 Oct 2023 12:48:59 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53636f98538so10875979a12.1;
        Tue, 10 Oct 2023 18:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1696988935; x=1697593735; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6blQLn2I3D+7E4kfx/VjBl3FG3wnWcWQYJiYRJd/c58=;
        b=Tc3iDCYDN2z/Q/v/LhSvDagxnjCw5PLiXMg51USNCaT4xsiZisJGB7M7IDQdzDNoTX
         JAszZtuwsh8/gmfmRwfuubhXo8CqxPdmj/ryFN9eCyFrqQdFIqXAvLZaUGXfNnSOsuaR
         QopXGtjrRIRpCFO9edhd9S35xnOS1kBx6kcKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696988935; x=1697593735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6blQLn2I3D+7E4kfx/VjBl3FG3wnWcWQYJiYRJd/c58=;
        b=YnLaY+bzCBFUJE1WtCaChB3eQulHsghJS1sLY5n4AaUn8sW8EOAY8Rur3HthR6GpjD
         fpn/tx6iVxUd5FvRF6S1yHrUGSOEua1vDTnipeVM92HsZ/3+On1+kTZMEwACdEqjTHUN
         UENm+UwROcbrOo3VfVFhZ6+fm9Sh8Rj+PKEdEVKxTsKRdzrjSstbvs45+qm8eHNtwGEi
         C76yIRz7X5pvuI83RgRFbG7FVpRdEhNf9K8jsaK5LMXRXl9pHVeprKeLloIvFsA+9voZ
         oYVSnDjM7tGuQ8y013Qg63mmW383kTf+yyde/jzqQlr+bEGA5dUfOyWZ9Mj16tppuvBY
         pLTg==
X-Gm-Message-State: AOJu0YwsL5Z8f9AfG1ZiMMATIDetJf6IQsiIU06yNXXBWW+3hwPq1QYe
	l2Sy4XLL/fGDt5r782eUXehwU/ZsZwqucEK2HPM=
X-Google-Smtp-Source: AGHT+IG7b/tITQaSOSHGVjLPS11JqPX4ZYJdmpfkrJEDokNKEjsIU/5znXvrSPXzCXj1BdyVDXUgsUUTnAEqW9oJgGI=
X-Received: by 2002:a17:906:10da:b0:9a9:e393:8bcd with SMTP id
 v26-20020a17090610da00b009a9e3938bcdmr16813208ejv.5.1696988935659; Tue, 10
 Oct 2023 18:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231005035525.19036-1-chanh@os.amperecomputing.com> <20231005035525.19036-3-chanh@os.amperecomputing.com>
In-Reply-To: <20231005035525.19036-3-chanh@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Oct 2023 12:18:44 +1030
Message-ID: <CACPK8XcPb_o+vVvZVeF0nqo+-4apS1TjY6o5sFPF7F24KR6ERw@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: aspeed: mtjade, mtmitchell: Add new gpio-line-names
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
> Add new gpio-line-names from the Mt.Jade and Mt.Mitchell
> HW schematic.
>
> Mt.Jade
>   GPIOB5: presence-cpu0
>   GPIOF0: ps0-pgood
>   GPIOF1: ps1-pgood
>   GPIOG2: host0-shd-ack-n
>   GPIOH0: uart1-mode1
>   GPIOH1: uart2-mode1
>   GPIOH2: uart3-mode1
>   GPIOH3: uart4-mode1
>   GPIOH7: i2c6-reset-n
>   GPIOH3: host0-reboot-ack-n
>   GPIOM4: s0-i2c9-alert-n
>   GPIOM5: s1-i2c9-alert-n
>   GPIOQ6: led-identify
>   GPIOS0: s0-vr-hot-n
>   GPIOS1: s1-vr-hot-n
>   GPIOS5: vr-pmbus-sel-n
>   GPIOY3: bmc-vga-en-n
>   GPIOZ3: s0-rtc-lock
>   GPIOAC2: spi0-program-sel
>   GPIOAC3: spi0-backup-sel
>
> Mt.Mitchell:
>   GPIOC3: bmc-debug-mode
>   GPIOE1: eth-phy-int-n
>   GPIOH0: jtag-program-sel
>   GPIOH1: fpga-program-b
>   GPIOW3: s1-pcp-pgood
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

I didn't check that you had the assignments correct, but the structure
looks good.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   | 42 +++++++++----------
>  .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   |  9 ++--
>  2 files changed, 26 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
> index e57efcc8522a..c87be433bdd0 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
> @@ -762,42 +762,42 @@
>         gpio-line-names =
>         /*A0-A7*/       "","","","host0-special-boot","","","","",
>         /*B0-B7*/       "i2c-backup-sel","","","",
> -                       "power-button","","","",
> +                       "power-button","presence-cpu0","","",
>         /*C0-C7*/       "","","","","","","","",
>         /*D0-D7*/       "","","","","","","","",
>         /*E0-E7*/       "","","","","","","","",
> -       /*F0-F7*/       "","","power-chassis-control","s0-ddr-save","power-chassis-good",
> -                       "s1-ddr-save","","",
> -       /*G0-G7*/       "host0-ready","host0-shd-req-n","","s0-overtemp-n","","",
> -                       "","",
> -       /*H0-H7*/       "","","","","ps0-vin-good","ps1-vin-good","","",
> -       /*I0-I7*/       "presence-ps0","presence-ps1","s1-special-boot",
> -                               "","","","","",
> -       /*J0-J7*/       "s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n","",
> -                       "","","","",
> +       /*F0-F7*/       "ps0-pgood","ps1-pgood","power-chassis-control","s0-ddr-save",
> +                       "power-chassis-good", "s1-ddr-save","","",
> +       /*G0-G7*/       "host0-ready","host0-shd-req-n","host0-shd-ack-n",
> +                       "s0-overtemp-n","","","","",
> +       /*H0-H7*/       "uart1-mode1","uart2-mode1","uart3-mode1","uart4-mode1",
> +                       "ps0-vin-good","ps1-vin-good","","i2c6-reset-n",
> +       /*I0-I7*/       "presence-ps0","presence-ps1","s1-special-boot","","","","","",
> +       /*J0-J7*/       "s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
> +                       "host0-reboot-ack-n","","","","",
>         /*K0-K7*/       "","","","","","","","",
>         /*L0-L7*/       "","","","host0-sysreset-n","s0-spi-auth-fail-n","","","",
> -       /*M0-M7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","s0-i2c9-alert-n","s1-i2c9-alert-n","","",
>         /*N0-N7*/       "","","","","","","","",
>         /*O0-O7*/       "","","","","","","","",
>         /*P0-P7*/       "","","","","","","","",
> -       /*Q0-Q7*/       "","","","","","identify-button","","",
> -       /*R0-R7*/       "","","ext-hightemp-n","",
> -                       "ocp-main-pwren","reset-button","","",
> -       /*S0-S7*/       "","","","","rtc-battery-voltage-read-enable","","","",
> +       /*Q0-Q7*/       "","","","","","identify-button","led-identify","",
> +       /*R0-R7*/       "","","ext-hightemp-n","","ocp-main-pwren","reset-button","","",
> +       /*S0-S7*/       "s0-vr-hot-n","s1-vr-hot-n","","",
> +                       "rtc-battery-voltage-read-enable","vr-pmbus-sel-n","","",
>         /*T0-T7*/       "","","","","","","","",
>         /*U0-U7*/       "","","","","","","","",
>         /*V0-V7*/       "","","","","","","","",
>         /*W0-W7*/       "","","","","","","","",
>         /*X0-X7*/       "","","","","","","","",
> -       /*Y0-Y7*/       "","","","","","","","",
> -       /*Z0-Z7*/       "s0-plimit","s1-fault-alert","s1-fw-boot-ok","","",
> +       /*Y0-Y7*/       "","","","bmc-vga-en-n","","","","",
> +       /*Z0-Z7*/       "s0-plimit","s1-fault-alert","s1-fw-boot-ok","s0-rtc-lock","",
>                         "s1-sys-auth-failure-n","s1-overtemp-n","",
>         /*AA0-AA7*/     "","","","","","","","",
> -       /*AB0-AB7*/     "s1-hightemp-n","s1-plimit","s0-ddr-addr",
> -                       "s1-ddr-addr","","","","",
> -       /*AC0-AC7*/     "sys-pwr-gd","","","","","","presence-cpu1",
> -                       "ocp-pgood";
> +       /*AB0-AB7*/     "s1-hightemp-n","s1-plimit","s0-ddr-addr","s1-ddr-addr","","",
> +                       "","",
> +       /*AC0-AC7*/     "sys-pwr-gd","","spi0-program-sel","spi0-backup-sel","bmc-ok",
> +                       "","presence-cpu1","ocp-pgood";
>
>         i2c4-o-en-hog {
>                 gpio-hog;
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> index 2f571b43106d..b7c4f7cfad07 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> @@ -575,16 +575,17 @@
>         gpio-line-names =
>         /*A0-A7*/       "","","","","","i2c2-reset-n","i2c6-reset-n","i2c4-reset-n",
>         /*B0-B7*/       "","","","","host0-sysreset-n","host0-pmin-n","","",
> -       /*C0-C7*/       "s0-vrd-fault-n","s1-vrd-fault-n","","",
> +       /*C0-C7*/       "s0-vrd-fault-n","s1-vrd-fault-n","bmc-debug-mode","",
>                         "irq-n","","vrd-sel","spd-sel",
>         /*D0-D7*/       "presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
>                         "","bmc-ncsi-txen","","",
> -       /*E0-E7*/       "","","clk50m-bmc-ncsi","","","","","",
> +       /*E0-E7*/       "","eth-phy-int-n","clk50m-bmc-ncsi","","","","","",
>         /*F0-F7*/       "s0-pcp-oc-warn-n","s1-pcp-oc-warn-n","power-chassis-control",
>                         "cpu-bios-recover","s0-heartbeat","hs-csout-prochot",
>                         "s0-vr-hot-n","s1-vr-hot-n",
>         /*G0-G7*/       "","","hsc-12vmain-alt1-n","","","","","",
> -       /*H0-H7*/       "","","wd-disable-n","power-chassis-good","","","","",
> +       /*H0-H7*/       "jtag-program-sel","fpga-program-b","wd-disable-n",
> +                       "power-chassis-good","","","","",
>         /*I0-I7*/       "","","","","","adc-sw","power-button","rtc-battery-voltage-read-enable",
>         /*J0-J7*/       "","","","","","","","",
>         /*K0-K7*/       "","","","","","","","",
> @@ -605,7 +606,7 @@
>         /*V0-V7*/       "s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
>                         "host0-reboot-ack-n","s0-fw-boot-ok","host0-shd-req-n",
>                         "host0-shd-ack-n","s0-overtemp-n",
> -       /*W0-W7*/       "","ocp-main-pwren","ocp-pgood","",
> +       /*W0-W7*/       "ocp-aux-pwren","ocp-main-pwren","ocp-pgood","s1-pcp-pgood",
>                         "bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
>         /*X0-X7*/       "i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
>                         "s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
> --
> 2.17.1
>
