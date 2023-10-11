Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F847C476E
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 03:48:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Nu2Gx9t2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4wfb6bp8z3cVd
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 12:48:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Nu2Gx9t2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4wdr5Ysgz3cNN;
	Wed, 11 Oct 2023 12:48:16 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-538575a38ffso10292456a12.1;
        Tue, 10 Oct 2023 18:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1696988893; x=1697593693; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=igjlN4dO3JjcdB2G4ww8hAUFD7DZ0Fw5neZs9pJmc38=;
        b=Nu2Gx9t2D5b5wmx689NURbsEvMEdfltmwSmteIBuRcy8HG3fp+9Eo+DHwai3tz4YBx
         U52WV2PguhpRl3+t+Ldz5/mqyDQkMW8zrXxchjx5Qiq5OMK2pspOg5gXvwzZFcO1nSSy
         XuH+dpKrlSO04N9griuaKfrcHp9MghdNVCMUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696988893; x=1697593693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igjlN4dO3JjcdB2G4ww8hAUFD7DZ0Fw5neZs9pJmc38=;
        b=vih7ZT+gFYoDFSW8h9FtxtrKxKrxsdsT5oCLznNuag97OqPrt+d11bQFcLvAfDnSAV
         acyUTE/pmhkMmPUvfpTi+PseKVcg3qDAHAlFeTfwfPti7vpK4kBctcatsSH4wbqeewni
         02oav+LFLsDeTW6vf6dAogdVUG7Li9/e57GXBPcdRnDqZLAEn7jvUp294K9hqcHRTPgv
         AbfgWQkgOaE8+d5Q/uiTpzYPTM4TYokndOVMS7fxpLAfQ4EapuNBnjc03n/vjWSmFU5T
         Wkctg5W3BNzTqgLyveRrvYWfztsY8DLkZCpewew0Y+vXJ8yQ8xyknSrVkh1vC3BKwLHb
         yDMw==
X-Gm-Message-State: AOJu0YxwOg4lgLDryqJJOIWbfLiFlFZcCQhHSQS+lmcxOn9GkbsiSXMC
	ummYv4Q9YkEPK3HwIfTUAE7mSPuXYVs5IWGVD0M=
X-Google-Smtp-Source: AGHT+IEuuMqEy3USpJDXR0kSSSQMnE9Vm8JFze2cJqxGftCWpvdSX0K+UCUFBZu0kfb7wHhQh1dEjjpMVzNhVPs+EdA=
X-Received: by 2002:a17:907:7890:b0:9ae:711d:7e03 with SMTP id
 ku16-20020a170907789000b009ae711d7e03mr17862404ejc.15.1696988892477; Tue, 10
 Oct 2023 18:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231005035525.19036-1-chanh@os.amperecomputing.com> <20231005035525.19036-2-chanh@os.amperecomputing.com>
In-Reply-To: <20231005035525.19036-2-chanh@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Oct 2023 12:18:01 +1030
Message-ID: <CACPK8XdpUpg0vDG7UwO-o=dYD-88evizSUb-yKm9qdUP2rjzdg@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: dts: aspeed: mtjade, mtmitchell: Update gpio-line-names
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
> Update GPIO line-name to follow naming convention specified at
> github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   | 42 +++++++++----------
>  .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   |  6 +--
>  2 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
> index 0a51d2e32fab..e57efcc8522a 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
> @@ -760,30 +760,30 @@
>
>  &gpio {
>         gpio-line-names =
> -       /*A0-A7*/       "","","","S0_BMC_SPECIAL_BOOT","","","","",
> -       /*B0-B7*/       "BMC_SELECT_EEPROM","","","",
> -                       "POWER_BUTTON","","","",
> +       /*A0-A7*/       "","","","host0-special-boot","","","","",
> +       /*B0-B7*/       "i2c-backup-sel","","","",
> +                       "power-button","","","",
>         /*C0-C7*/       "","","","","","","","",
>         /*D0-D7*/       "","","","","","","","",
>         /*E0-E7*/       "","","","","","","","",
> -       /*F0-F7*/       "","","BMC_SYS_PSON_L","S0_DDR_SAVE","PGOOD",
> -                       "S1_DDR_SAVE","","",
> -       /*G0-G7*/       "host0-ready","SHD_REQ_L","","S0_OVERTEMP_L","","",
> +       /*F0-F7*/       "","","power-chassis-control","s0-ddr-save","power-chassis-good",
> +                       "s1-ddr-save","","",
> +       /*G0-G7*/       "host0-ready","host0-shd-req-n","","s0-overtemp-n","","",
>                         "","",
> -       /*H0-H7*/       "","","","","PSU1_VIN_GOOD","PSU2_VIN_GOOD","","",
> -       /*I0-I7*/       "PSU1_PRESENT","PSU2_PRESENT","S1_BMC_SPECIAL_BOOT",
> -                       "","","","","",
> -       /*J0-J7*/       "S0_HIGHTEMP_L","S0_FAULT_L","S0_SCP_AUTH_FAIL_L","",
> +       /*H0-H7*/       "","","","","ps0-vin-good","ps1-vin-good","","",
> +       /*I0-I7*/       "presence-ps0","presence-ps1","s1-special-boot",
> +                               "","","","","",
> +       /*J0-J7*/       "s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n","",
>                         "","","","",
>         /*K0-K7*/       "","","","","","","","",
> -       /*L0-L7*/       "","","","BMC_SYSRESET_L","SPI_AUTH_FAIL_L","","","",
> +       /*L0-L7*/       "","","","host0-sysreset-n","s0-spi-auth-fail-n","","","",
>         /*M0-M7*/       "","","","","","","","",
>         /*N0-N7*/       "","","","","","","","",
>         /*O0-O7*/       "","","","","","","","",
>         /*P0-P7*/       "","","","","","","","",
> -       /*Q0-Q7*/       "","","","","","UID_BUTTON","","",
> -       /*R0-R7*/       "","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
> -                       "OCP_MAIN_PWREN","RESET_BUTTON","","",
> +       /*Q0-Q7*/       "","","","","","identify-button","","",
> +       /*R0-R7*/       "","","ext-hightemp-n","",
> +                       "ocp-main-pwren","reset-button","","",
>         /*S0-S7*/       "","","","","rtc-battery-voltage-read-enable","","","",
>         /*T0-T7*/       "","","","","","","","",
>         /*U0-U7*/       "","","","","","","","",
> @@ -791,18 +791,18 @@
>         /*W0-W7*/       "","","","","","","","",
>         /*X0-X7*/       "","","","","","","","",
>         /*Y0-Y7*/       "","","","","","","","",
> -       /*Z0-Z7*/       "S0_BMC_PLIMIT","S1_FAULT_L","S1_FW_BOOT_OK","","",
> -                       "S1_SCP_AUTH_FAIL_L","S1_OVERTEMP_L","",
> +       /*Z0-Z7*/       "s0-plimit","s1-fault-alert","s1-fw-boot-ok","","",
> +                       "s1-sys-auth-failure-n","s1-overtemp-n","",
>         /*AA0-AA7*/     "","","","","","","","",
> -       /*AB0-AB7*/     "S1_HIGHTEMP_L","S1_BMC_PLIMIT","S0_BMC_DDR_ADDR",
> -                       "S1_BMC_DDR_ADR","","","","",
> -       /*AC0-AC7*/     "SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
> -                       "BMC_OCP_PG";
> +       /*AB0-AB7*/     "s1-hightemp-n","s1-plimit","s0-ddr-addr",
> +                       "s1-ddr-addr","","","","",
> +       /*AC0-AC7*/     "sys-pwr-gd","","","","","","presence-cpu1",
> +                       "ocp-pgood";
>
>         i2c4-o-en-hog {
>                 gpio-hog;
>                 gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
>                 output-high;
> -               line-name = "BMC_I2C4_O_EN";
> +               line-name = "i2c4-o-en";
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> index 0715cb9ab30c..2f571b43106d 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> @@ -599,17 +599,17 @@
>         /*Q0-Q7*/       "","","","","","","","",
>         /*R0-R7*/       "","","","","","","","",
>         /*S0-S7*/       "","","identify-button","led-identify",
> -                       "s1-ddr-save","spi-nor-access","sys-pgood","presence-cpu1",
> +                       "s1-ddr-save","spi-nor-access","host0-ready","presence-cpu1",
>         /*T0-T7*/       "","","","","","","","",
>         /*U0-U7*/       "","","","","","","","",
>         /*V0-V7*/       "s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
> -                       "host0-reboot-ack-n","host0-ready","host0-shd-req-n",
> +                       "host0-reboot-ack-n","s0-fw-boot-ok","host0-shd-req-n",
>                         "host0-shd-ack-n","s0-overtemp-n",
>         /*W0-W7*/       "","ocp-main-pwren","ocp-pgood","",
>                         "bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
>         /*X0-X7*/       "i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
>                         "s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
> -                       "s1-overtemp-n","s1-spi-auth-fail-n",
> +                       "s1-overtemp-n","cpld-s1-spi-auth-fail-n",
>         /*Y0-Y7*/       "","","","","","","","host0-special-boot",
>         /*Z0-Z7*/       "reset-button","ps0-pgood","ps1-pgood","","","","","";
>
> --
> 2.17.1
>
