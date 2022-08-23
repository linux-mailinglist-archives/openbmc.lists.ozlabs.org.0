Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32459CCB3
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 02:02:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBTtX04GBz3blb
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 10:02:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Zeg6Kz2R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Zeg6Kz2R;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBTt65kYpz2xGS;
	Tue, 23 Aug 2022 10:01:50 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id bq11so8498296wrb.12;
        Mon, 22 Aug 2022 17:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3umAISoMC9J1t3BQnQeJGoOxGoRbwjWe7DCguBppyoc=;
        b=Zeg6Kz2RJM9iX7KdwqBfkrJ5XtKSu2WYnnXIK1wVEw6q5cJlmZRYnZmGaxQoQolmB1
         WFEmQxnNAd5pgsCMkCvaA19L2kXw/pcag7CNE0jvQnuEcl0/ariluL27G0EGMk9xndBK
         E7Ugqd9OhUioYRXzvSqZhJ1KVGA6xhDo+Cy/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3umAISoMC9J1t3BQnQeJGoOxGoRbwjWe7DCguBppyoc=;
        b=H5EK/M2O7QnZsW0hEn5LEyD949TvG6maxavJwTVa1FZDG7e6vQJVm3nh62+YhK/tyZ
         zlWEanUx6v+emCY7ORsxl8DZI4p7vryZBK8XGrZXbp7oe0h9zzd9G4TciAeBQsFH21YZ
         QWlYUCK5ixQC1vDfv4j4tj5aoD3/7l8OHCgVy2GTnvdW+V2ny8Dzsr8fMbG3inoP9WTR
         /NJqsvMDfgWCaaJPk9J9nkGh5R7marhNBX1raV+As/DUk9cWCotrZlXfZxZ/cZLx70Lv
         u+E40FINKmc5/UH6tFnanjcAzzy1xA9VHX/pWAvQidKaErPQcfrAx29c0vz6YP5P0HIL
         +eAg==
X-Gm-Message-State: ACgBeo0A9ua3iZUk+VMJuM3hyVrEJ13K44lgrnxcT4WeTwYoW7jvnYN/
	Ig3FrdZFMbQcUNw7T021znitWgWXgSMXH74S6bY=
X-Google-Smtp-Source: AA6agR6mr3WZ/vgmSGJDMvRNbfbSeY+27SFUtG2f01EaGpn62xeLlnirjZG+tWS0fwnTFBEaCEPEd5gkEGvVWU+bFfc=
X-Received: by 2002:a05:6000:1c0c:b0:225:569c:dd2c with SMTP id
 ba12-20020a0560001c0c00b00225569cdd2cmr4445061wrb.628.1661212904633; Mon, 22
 Aug 2022 17:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220822070204.GA6110@hcl-ThinkPad-T495>
In-Reply-To: <20220822070204.GA6110@hcl-ThinkPad-T495>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Aug 2022 00:01:32 +0000
Message-ID: <CACPK8XfgYma8=qV0kKOKSSpXprC1sBZgKuaGsAhD1ifYG4KgTw@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: Update for Facebook Yosemite V2 BMC
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 22 Aug 2022 at 07:02, Karthikeyan Pasupathi
<pkarthikeyan1509@gmail.com> wrote:
>
> This patch includes the following updates for Yosemite V2
> BMC.
>
> 1) Updated GPIO configuration for power control.

Please take a look the openbmc naming conventions for the GPIOs. If
you are not going to follow them, please explain why in your commit
message.


> 2) Added IPMB-13 channel for Debug Card communication.
> 3) Removed EEPROM driver IPMB-12 channel and keeping it as
>    "status ok".

If you find yourself writing a commit log that contains 1), 2), 3)
then there's a fair chance you could have sent three separate patches.
Consider this for next time.

>
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>  .../dts/aspeed-bmc-facebook-yosemitev2.dts    | 49 +++++++++++++++++--
>  1 file changed, 44 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> index 8864e9c312a8..4d2ff7eb6740 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> @@ -119,6 +119,40 @@
>                         &pinctrl_adc15_default>;
>  };
>
> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/   "","","","","","","","",
> +       /*B0-B7*/   "","","","","","","","",
> +       /*C0-C7*/   "","","","","","","","",
> +       /*D0-D7*/   "POWER_BUTTON","POWER_OUT1","","POWER_OUT2","","POWER_OUT3","","POWER_OUT4",
> +       /*E0-E7*/   "DEBUG_UART_SEL0","DEBUG_UART_SEL1","DEBUG_UART_SEL2","DEBUG_UART_RX_SEL_N","","","","",
> +       /*F0-F7*/   "","","","","","","","",
> +       /*G0-G7*/   "LED_POST_CODE_0","LED_POST_CODE_1","LED_POST_CODE_2","LED_POST_CODE_3","","","","",
> +       /*H0-H7*/   "","","","","","","","",
> +       /*I0-I7*/   "SLOT1_POWER_OK","SLOT2_POWER_OK","SLOT3_POWER_OK","SLOT4_POWER_OK","","","","",
> +       /*J0-J7*/   "","","","","","","","",
> +       /*K0-K7*/   "","","","","","","","",
> +       /*L0-L7*/   "","","","","","","","",
> +       /*M0-M7*/   "","","","","","","","",
> +       /*N0-N7*/   "","","I2C_SLOT1","I2C_SLOT2","I2C_SLOT3","I2C_SLOT4","","",
> +       /*O0-O7*/   "","","","SELECTOR_BUTTON","SLOT1_POWER","SLOT2_POWER","SLOT3_POWER","SLOT4_POWER",
> +       /*P0-P7*/   "","","","","LED_POST_CODE_4","LED_POST_CODE_5","LED_POST_CODE_6","LED_POST_CODE_7",
> +       /*Q0-Q7*/   "","","","","","","","",
> +       /*R0-R7*/   "","","","GPIO_DBG_CARD_PRSNT","","","","",
> +       /*S0-S7*/   "RESET_OUT1","RESET_OUT2","RESET_OUT3","RESET_OUT4","","","","",
> +       /*T0-T7*/   "","","","","","","","",
> +       /*U0-U7*/   "","","","","","","","",
> +       /*V0-V7*/   "","","","","","","","",
> +       /*W0-W7*/   "","","","","","","","",
> +       /*X0-X7*/   "","","","","","","","",
> +       /*Y0-Y7*/   "","","","","","","","",
> +       /*Z0-Z7*/   "POST_COMPLETE","POST_COMPLETE2","POST_COMPLETE3","POST_COMPLETE4","","","","",
> +       /*AA0-AA7*/ "","","","","HAND_SW1","HAND_SW2","HAND_SW3","HAND_SW4",
> +       /*AB0-AB7*/ "RESET_BUTTON","","","","","","","",
> +               /*AC0-AC7*/ "","","","","","","","";
> +};
> +
>  &i2c1 {
>         //Host1 IPMB bus
>         status = "okay";
> @@ -207,11 +241,16 @@
>
>  &i2c12 {
>         status = "okay";
> -       //MEZZ_FRU
> -       eeprom@51 {
> -               compatible = "atmel,24c64";
> -               reg = <0x51>;
> -               pagesize = <32>;
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +       // Debug Card
> +       multi-master;
> +       ipmb13@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
>         };
>  };
>
> --
> 2.17.1
>
