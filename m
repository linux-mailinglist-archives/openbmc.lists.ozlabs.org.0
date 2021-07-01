Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3173B8CB4
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 05:41:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFkWz3YPBz307r
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 13:41:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dlYhx9E9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dlYhx9E9; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFkWh6L60z2yXt;
 Thu,  1 Jul 2021 13:40:47 +1000 (AEST)
Received: by mail-qv1-xf2d.google.com with SMTP id p7so2291696qvn.5;
 Wed, 30 Jun 2021 20:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KzjvxraLHkUL6R1pcfOnqYkrW7Z0FdLZP/xq4dd/Y0=;
 b=dlYhx9E99duCm0NaB/kWcOwhqCGzKn4RnKcOmg6LnkaTrQSWwnh5hiGs7AeTlYDmQY
 Wu95jIzmVAqLiJ5EeuQdeURZCO7kRkO2xYvhyKtB/yUQ0lQyZejvw/hsguY8L+umYxI+
 rK1KKE4emsqDUAu1hDycmWiTja/lMiLEwgtcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KzjvxraLHkUL6R1pcfOnqYkrW7Z0FdLZP/xq4dd/Y0=;
 b=ptw8wl38Vw8TmdWvA4ZqE5mj0QT8swHbHfAqvyMMFUquhkIMCvho/csvMTiJBGgKTm
 DgM4BFV1pGq5baJwKixjn/oiz2SBrT2Qj4fn8EJHx167VNtPnuchHJirilgAofyxXqRq
 3uK+4N2XJZKo0p4i2BCtEh1r7EWxA1aYxdKYRhcYSwpQsP+/q5bZevuHCA5bAcpWweAc
 6JRRPxQHRYopOT2xVyetF9IwdYF2XYDUMq43lqcecYW9GDLjQcEdXgzCQMiAtJbhKD49
 dhcsrguJP8/yzx8rWUFmmOOZcWv0LS3L1Q6stBwVfhRS6+2cI9drQCiQnI1lvN50XOng
 +opg==
X-Gm-Message-State: AOAM533k3maLJHAC5LhZTku4RAeHZl/NOPCXB4zvrOSKowMtRYUORjDA
 BQZtibPOE8Zv2X9An2xwLKuYcX1v9rQahwOmYzI=
X-Google-Smtp-Source: ABdhPJxlwHAuvRqiX7FJucBQnUlJorGW5k5hBXv34Umx0R+6lHLkQ/CjjMPAF7JNAttwGM1syLRKCAOFGvlh3gI4ybk=
X-Received: by 2002:ad4:48d1:: with SMTP id v17mr40319626qvx.16.1625110844609; 
 Wed, 30 Jun 2021 20:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210625061017.1149942-1-andrew@aj.id.au>
In-Reply-To: <20210625061017.1149942-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jul 2021 03:40:32 +0000
Message-ID: <CACPK8Xd9tsMJaQ9BQSGL0Vfi4UpJ1iuOtMVmfKneydd-zYBhsw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: tacoma: Add phase corrections for eMMC
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 25 Jun 2021 at 06:10, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The degree values were reversed out from the magic tap values of 7 (in)
> and 15 + inversion (out) initially suggested by Aspeed.
>
> With the patch tacoma survives several gigabytes of reads and writes
> using dd while without it locks up randomly during the boot process.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Thanks for the fix. Is this required due to "mmc: sdhci-of-aspeed: Add
AST2600 bus clock support" or "mmc: sdhci-of-aspeed: Expose clock
phase controls"?

On the topic of those patches, it would be good if we could operate
the devices (with the slower speed?) when the device tree does not
provide the phase values. Think about system bringup, or where you
need the system booting in order to determine the phase calculations.

What changes would be required to the host driver for it to work out of the box?


> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index c1478d2db602..670080bb80eb 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -189,6 +189,7 @@ &emmc_controller {
>
>  &emmc {
>         status = "okay";
> +       clk-phase-mmc-hs200 = <36>, <270>;
>  };
>
>  &fsim0 {
> --
> 2.30.2
>
