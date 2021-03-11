Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA1C3381F2
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 00:53:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxQkY2ycyz3cMY
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 10:53:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PgdHsQFL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PgdHsQFL; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxQkK2DFJz30Ql
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 10:53:12 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id a14so3452347qvj.7
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 15:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fl0mxREW40CUvi0dMmHxkoAyWyLe1G9e+PkjQgLXd34=;
 b=PgdHsQFLk12S1cVrkAT5tUAGtsj7ExOXlx96SHmrPPN1n+X0vqMnFliYX9K5nWZbnp
 npuCXTvutWEoJ9j81dc9REUjrwlqgiL6v2LDFY2Vd/W6bnGh4h8MP5HuIr169y05o8Od
 bkqOZ8WOYpoFj/UQRGpvfhqnWXLnUjqfSCHTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fl0mxREW40CUvi0dMmHxkoAyWyLe1G9e+PkjQgLXd34=;
 b=YbEWcbsFXAwmwMUwOIQYoyaWbcKhJeld8Zs5hacCGSp7GFC9B/IeuhEjGGjsE0+oRQ
 8orKQzZYdZEaMpwe2IHNJHUPExBlCbQhXaIMAI8uX+fv9AMhto8z5U9+gT9+9sCItcdY
 R3NY3AkvMaofOPV6sb1yV48ShDELO6u1WKFsFIONdgEzOg4RjwUYbhDMYP1cDMsak3O6
 soVDEqmz2iuykuSxbeW9ce9cTBpPWrwphc7QTc6rqwxz+5VLBqWsMvcaINfe9YoYCNm9
 pNmDdjPhECApTPD3/dg3MgXWwlfiaufC/RfSEjaBiXAaGvsFCfiyJWft9LQE4LmmIr1r
 hxyg==
X-Gm-Message-State: AOAM532iFP3hWT3brKEC3l0/PcSeAZTkv8waLGokVUBAYUQ/FsR7JFM+
 YRF8cBBOCKTLt9hja8UKu0Fec3khQyk+t9Wu3J7ogrvFoOY=
X-Google-Smtp-Source: ABdhPJzl7X0TSeECI+DqpG7cr+K1KdpmLMe0+rGTJXYNIXhwVKdhaNyzsavNNb4TqygMlv6bdCjw5xEjMfq5qxOXtno=
X-Received: by 2002:a0c:8304:: with SMTP id j4mr10111829qva.18.1615506788445; 
 Thu, 11 Mar 2021 15:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20210310173222.17556-1-eajames@linux.ibm.com>
In-Reply-To: <20210310173222.17556-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Mar 2021 23:52:56 +0000
Message-ID: <CACPK8Xd+HEF8LgkxPS1phf4GbOh+BN5Y-X5GOH8Vebpquk=dgw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 1/3] ARM: dts: aspeed: rainier: Enable fan
 watchdog
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

On Wed, 10 Mar 2021 at 17:32, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set watchdog 1 to pulse the fan watchdog circuit that drives the FAULT
> pin of the MAX31785, resulting in fans running at full speed, if at
> any point the BMC stops pulsing it, such as a BMC reboot at runtime.
> Enable watchdog 2 for BMC reboots.

This patch looks okay, assuming you have tested rebooting still works.

Have we tested that u-boot reboots still work, and do not trigger the reset?

Have you considered making a common ibm-p10 device tree, and
including/removing nodes as appropriate for the various rainier and
everest systems? I think this will reduce the work required to
maintain the trees, particularly as it avoids adding changes like this
twice.

Cheers,

Joel


>
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 85fb60d16fdf..9f34136ec40f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -3193,6 +3193,20 @@ flash@0 {
>         };
>  };
>
> +&wdt1 {
> +       aspeed,reset-type = "none";
> +       aspeed,external-signal;
> +       aspeed,ext-push-pull;
> +       aspeed,ext-active-high;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_wdtrst1_default>;
> +};
> +
> +&wdt2 {
> +       status = "okay";
> +};
> +
>  &xdma {
>         status = "okay";
>         memory-region = <&vga_memory>;
> --
> 2.27.0
>
