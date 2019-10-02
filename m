Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30703C8826
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 14:17:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jwBW2Xv6zDqZy
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 22:17:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Z14LuOio"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jw1V6zkqzDqXs
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 22:09:50 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id u22so25926873qtq.13
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xRZOLj+xaCYLhNNnf9sTqRZa8KqXSlG8QkBL2ilUAAs=;
 b=Z14LuOio9r+GyY5PaufCtUyIBycJvCCmT5dYCWrxarGj9HnDo/2g8xfSG7k8dBeVeN
 GF6CV301TTq/Kiq/YhHgJKeDGir8MB+bVPYU17wJj9eC4cqAEVswpIinQFInYjqpkniv
 oMuWjPYJ+xJ2g6nPCXVnuZvW9wjc1oOFSmC0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRZOLj+xaCYLhNNnf9sTqRZa8KqXSlG8QkBL2ilUAAs=;
 b=lgbgtkq2dk0dRfMT3ibR9aB3DLX9fSpyCSgi/jBuWeEXCKsv4YW/VQDNZb623JY9Hj
 tYqYZgbn9md7HLsiUwYurGCeKbUbqx8ysk8nFrRKgcVaI9c2eUszZgVGFInS8K8EnLDC
 kCJWKxYRXCg2ZfxvxLIpoz9Dt1ijwPxtPToRlRTEPzGkJBml8EbLdK1A7MlWV/rt3OEh
 gZM9ziICo2XNDfdxmMGZ3X2LgnCXz636qcm6k7FvN7xURFNeD6/WPHli+Ob3RX/gSVYF
 TXRk/EB+/CFUJ0FNm0G2zSlJKCtwCVC8kU3LW3Ex0zxoYoBUNmD0Xlz5jBCLnH8t7hRM
 ruDA==
X-Gm-Message-State: APjAAAXjNcFFNXo+GtDR7DABGN1kFLxRQAyX0aB+gwlfnVU4QULXv+DE
 9DorGRo6dbHbKwRDC4LgA3f64QoaUWbaErq+KBVknFg9
X-Google-Smtp-Source: APXvYqzD6mIuETK2eKC/seQYYNQUbNZiey2RTP46IQl9cC4tLEJydW1sJkd/8i0mW0hrD4iSM9et7zWkvdPsCRKdUYQ=
X-Received: by 2002:ac8:2f81:: with SMTP id l1mr3568466qta.269.1570018186242; 
 Wed, 02 Oct 2019 05:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <77b1d8b9-08a6-9a75-15a1-1c54dc7ddd9f@linux.vnet.ibm.com>
In-Reply-To: <77b1d8b9-08a6-9a75-15a1-1c54dc7ddd9f@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Oct 2019 12:09:34 +0000
Message-ID: <CACPK8XdP1NcOeBODTFXUz7XSjfe5xkaR0tf49yPLscGk+WfW2Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Add i2c eeproms
To: Jinu Thomas <jinujoy@linux.vnet.ibm.com>
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

Hello Jinu,

On Tue, 1 Oct 2019 at 06:05, Jinu Thomas <jinujoy@linux.vnet.ibm.com> wrote:
>
>
> Added eeproms for the below VPD devices
> - BMC
> - TPM
> - System Planar
> - DCM 0 VRM
> - DCM 1 VRM
> - Base Op panel
> - Lcd Op panel
>
> Signed-off-by: Jinu Joy Thomas <jinu.joy.thomas@in.ibm.com>

Your patch looks good. Can you please find someone who has access to
the Rainier schematics to review your changes?

Cheers,

Joel

> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 35 ++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index cdc65eb28d20..7d2f3257b419 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -53,6 +53,11 @@
>
>   &i2c0 {
>       status = "okay";
> +
> +        eeprom@50 {
> +                compatible = "atmel,24c64";
> +                reg = <0x50>;
> +        };
>   };
>
>   &i2c1 {
> @@ -262,6 +267,16 @@
>           reg = <0x76>;
>           #io-channel-cells = <0>;
>       };
> +
> +        eeprom@50 {
> +                compatible = "atmel,24c64";
> +                reg = <0x50>;
> +        };
> +
> +        eeprom@51 {
> +                compatible = "atmel,24c64";
> +                reg = <0x51>;
> +        };
>   };
>
>   &i2c8 {
> @@ -296,6 +311,16 @@
>           compatible = "ti,tmp275";
>           reg = <0x4a>;
>       };
> +
> +        eeprom@50 {
> +                compatible = "atmel,24c64";
> +                reg = <0x50>;
> +        };
> +
> +        eeprom@51 {
> +                compatible = "atmel,24c64";
> +                reg = <0x51>;
> +        };
>   };
>
>   &i2c9 {
> @@ -340,6 +365,11 @@
>           compatible = "infineon,ir35221";
>           reg = <0x74>;
>       };
> +
> +        eeprom@50 {
> +                compatible = "atmel,24c64";
> +                reg = <0x50>;
> +        };
>   };
>
>   &i2c10 {
> @@ -384,6 +414,11 @@
>           compatible = "infineon,ir35221";
>           reg = <0x74>;
>       };
> +        eeprom@50 {
> +                compatible = "atmel,24c64";
> +                reg = <0x50>;
> +        };
> +
>   };
>
>   &i2c11 {
> --
> 2.20.1 (Apple Git-117)
>
