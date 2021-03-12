Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5223D338208
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:06:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxR1g2QCpz3cWF
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:06:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=drg6w8vD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=drg6w8vD; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxR1S19pmz2xYq
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:06:20 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id u7so2559790qtq.12
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rjflLft2RIhPkMKv72JoOFV+Xbq+FG8xdLx8oY1YBs=;
 b=drg6w8vDtKTRaQNq5F8X2D2TUmlO0iLrBUDRicyFX4wN5+lp5mXJ2u3wId5sxYmU7L
 KN2mHRr9RD7R2+qBMoSS0L7R3IWYsyHNuytsFanvubiSiNufFWTPislgU4famtexNdew
 Mx3cpJj1/UzSoHCW/vc6YxfUFxxffz9qH2N4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rjflLft2RIhPkMKv72JoOFV+Xbq+FG8xdLx8oY1YBs=;
 b=J0u1X8jqaKoJQk4gCDilBkTqWwMBETHyXXQU3ca9ojf5k4txGJPpGIbiwVrj9Smcm3
 whZdRUjwFFyVq6eySM2tUytA2kfwlPazxfPL27wzEZQoo0h3amtcZeRRXpWg3LKkAdDi
 1NytCXgQ96yFHUfcvpIL1A2wn18c2T+/Huau0WGvbfEonUqyn56Jo7RVBozF5uYWxiGV
 C/9fDpYDmeXzHiVjjD4XDEw9065A3rLP7tXGwxAbq/MqQ6mMvfIPdFyvvLglZ8NNQsqj
 /0LDvU8FgrvUcAQPOYVJJaDaFvxiHRoXG188u4j6+JS4K4ERHdaaXcY8U6ZZUIVfDJPh
 sAtw==
X-Gm-Message-State: AOAM531jziHwfI3eA4mRy0qEjkZfr9k/+aPtkyedPgC+bTIhMtEEyj5a
 WkBdB8Y/Ow2rHq8qS3huqjOTV7Fjby6qBnmtEwk=
X-Google-Smtp-Source: ABdhPJyGyAQz0Ri8LsmK0bD5xhjALK6f9O3QnnysJA48CeuRs+fhCV6mlYkVDiR9/WZj8PnsHVGXvb5kh22KaxTudtk=
X-Received: by 2002:ac8:7153:: with SMTP id h19mr10102449qtp.176.1615507576874; 
 Thu, 11 Mar 2021 16:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-4-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:06:04 +0000
Message-ID: <CACPK8XfZTcdP7nWHo5Opt0sYUKoDhcgnwqdZ_=w6wbnxAP=D_w@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 03/35] ARM: dts: aspeed: rainier: Add
 gpio-keys-polled for fans
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

On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Brandon Wyman <bjwyman@gmail.com>
>
> Add a gpio-keys-polled section to the Rainier device tree for the fan
> presence signals on the PCA9552 I2C device on bus 7.
>
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 43 ++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index f52c10dd1a18..98c396283c1b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -183,6 +183,49 @@ front-sys-pwron0 {
>                         gpios = <&pca_oppanel 3 GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               poll-interval = <1000>;
> +
> +               fan0-presence {
> +                       label = "fan0-presence";
> +                       gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
> +                       linux,code = <6>;
> +               };
> +
> +               fan1-presence {
> +                       label = "fan1-presence";
> +                       gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
> +                       linux,code = <7>;
> +               };
> +
> +               fan2-presence {
> +                       label = "fan2-presence";
> +                       gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
> +                       linux,code = <8>;
> +               };
> +
> +               fan3-presence {
> +                       label = "fan3-presence";
> +                       gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
> +                       linux,code = <9>;
> +               };
> +
> +               fan4-presence {
> +                       label = "fan4-presence";
> +                       gpios = <&pca0 10 GPIO_ACTIVE_LOW>;
> +                       linux,code = <10>;
> +               };
> +
> +               fan5-presence {
> +                       label = "fan5-presence";
> +                       gpios = <&pca0 11 GPIO_ACTIVE_LOW>;
> +                       linux,code = <11>;
> +               };
> +       };
>  };
>
>  &ehci1 {
> --
> 2.27.0
>
