Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0E48D0BB
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 04:17:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZ8jt2jlWz2yyK
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 14:17:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UQF/0vh5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=UQF/0vh5; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZ8jS4HJ4z2yJV;
 Thu, 13 Jan 2022 14:16:43 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id h15so1153035qtx.0;
 Wed, 12 Jan 2022 19:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/gINneDYHArTmYDuiZroEiN0ihwxBALKaNwAenOfdY=;
 b=UQF/0vh5YPu246CIaKrZq34eNz6twmswUX900v6ezJ3ZkA0EvZMJFkdOdMbmrWOSPF
 sRH9L/o642dayg4As32yFaNLh/rANq3I8gi9nI51O2JLNCaBxHJIp9QwI7mW1JpO8cE4
 DWBPbv9TqflPKoTkBsY7ymSqB3bzoBWMheUK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/gINneDYHArTmYDuiZroEiN0ihwxBALKaNwAenOfdY=;
 b=i39VylbTbSpiA5C32Nv182cC9yW3a1o1rU4uGeMxdWSm3i1u2Z5kBbltAqNTMCCiHc
 npWxrxThH2EIiADY/pBe7ljideOiwcB5hup8Y4nqOjQGoiReF4U5CGd2GO7H64r05bDK
 7nXWfATX9VF29Q0cOBZ04SejRCXkB4d1XFvoBMTnW981N7GQtn0adYrl3P4LwtrsBNbE
 lRWiF13VkEZI776nCPv7U6eooBgeqz4VdTFwSak523pERPBEhTK1d4OGbEtD3ibkSA97
 RdFgE1L0Rc9vupAhnExiopqsyaWaQKJM2pPWdCKNrHlsBw98WnlM+lumU0pnB6Epg4zE
 xUUQ==
X-Gm-Message-State: AOAM533uGlcssSNKmBnBfX4IXcfje+6ThlabJIv/3M8FsXXnD/xRq+Db
 9CLrkfkr9e6hy65NV5u1VhDPrGtvGVec9YbTmkg=
X-Google-Smtp-Source: ABdhPJwjC8vJ9oEqVShEVmfTLImiXZ9NACvdnYSMgbS//mqpu0MoR8m4WgqPkDXWDI1ELo+mE0NL/IvUF8RDNd8G80k=
X-Received: by 2002:ac8:5a0b:: with SMTP id n11mr2134767qta.625.1642043799724; 
 Wed, 12 Jan 2022 19:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20220112230247.982212-1-iwona.winiarska@intel.com>
 <20220112230247.982212-4-iwona.winiarska@intel.com>
In-Reply-To: <20220112230247.982212-4-iwona.winiarska@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jan 2022 03:16:25 +0000
Message-ID: <CACPK8XfL8-TovFWBxXo7ryijPXeS+sFwejxz-fKNNwxgD1N+oA@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] ARM: dts: aspeed: Add PECI controller nodes
To: Iwona Winiarska <iwona.winiarska@intel.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 12 Jan 2022 at 23:04, Iwona Winiarska <iwona.winiarska@intel.com> wrote:
>
> Add PECI controller nodes with all required information.
>
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 11 +++++++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 11 +++++++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi | 11 +++++++++++
>  3 files changed, 33 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index b313a1cf5f73..3c2961da6272 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -391,6 +391,17 @@ uart_routing: uart-routing@9c {
>                                 };
>                         };
>
> +                       peci0: peci-controller@1e78b000 {
> +                               compatible = "aspeed,ast2400-peci";
> +                               reg = <0x1e78b000 0x60>;
> +                               interrupts = <15>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
> +                               resets = <&syscon ASPEED_RESET_PECI>;
> +                               cmd-timeout-ms = <1000>;
> +                               clock-frequency = <1000000>;
> +                               status = "disabled";
> +                       };
> +
>                         uart2: serial@1e78d000 {
>                                 compatible = "ns16550a";
>                                 reg = <0x1e78d000 0x20>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index c7049454c7cb..aab1c3ecb4dc 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -511,6 +511,17 @@ ibt: ibt@140 {
>                                 };
>                         };
>
> +                       peci0: peci-controller@1e78b000 {
> +                               compatible = "aspeed,ast2500-peci";
> +                               reg = <0x1e78b000 0x60>;
> +                               interrupts = <15>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
> +                               resets = <&syscon ASPEED_RESET_PECI>;
> +                               cmd-timeout-ms = <1000>;
> +                               clock-frequency = <1000000>;
> +                               status = "disabled";
> +                       };
> +
>                         uart2: serial@1e78d000 {
>                                 compatible = "ns16550a";
>                                 reg = <0x1e78d000 0x20>;
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 5106a424f1ce..564f1292993f 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -507,6 +507,17 @@ wdt4: watchdog@1e7850c0 {
>                                 status = "disabled";
>                         };
>
> +                       peci0: peci-controller@1e78b000 {
> +                               compatible = "aspeed,ast2600-peci";
> +                               reg = <0x1e78b000 0x100>;
> +                               interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
> +                               resets = <&syscon ASPEED_RESET_PECI>;
> +                               cmd-timeout-ms = <1000>;
> +                               clock-frequency = <1000000>;
> +                               status = "disabled";
> +                       };
> +
>                         lpc: lpc@1e789000 {
>                                 compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
>                                 reg = <0x1e789000 0x1000>;
> --
> 2.31.1
>
