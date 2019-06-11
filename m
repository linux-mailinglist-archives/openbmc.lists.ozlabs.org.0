Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3763C145
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 04:37:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NDgB63WGzDqPF
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 12:37:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="A+ONLNLb"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NDfg4Y4fzDqP5
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 12:36:59 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id j19so12761184qtr.12
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 19:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQxS9hsPSjMxzSgc1SJ2WYCvYc++kdBbXfQZ6iDqUpg=;
 b=A+ONLNLbuo5dItceR2i6B6qONKuddl/lKZizTgZZJIZHx1vCO4PjD0DTEpG9WL5bpC
 dl2tV0MT0heeGp+d8BTY1cCK+Lgw/hZEAAjmSg56gdq9NtEu4mqa3auwxJxWWvoPkei6
 n0OPHennfvhc1GNHZIIpyhvlhBuczqsAdGWI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQxS9hsPSjMxzSgc1SJ2WYCvYc++kdBbXfQZ6iDqUpg=;
 b=KCPU3BSTn5fAU7y3v3dkUBclrAbi9bVQQuO+WIfnESXZXeHQccDpJy3FuxhpaxElSY
 TPGtFAarEkVO/2tCAAb3oqD0etG8dDkWW7cSnYmveIiLLyBZ4rGkPSp6i6ElIjeTkjp9
 osvFlW7QDS6znCjHNSd1G9yBbW72jUYtY7QDTro9TNE6wTPE49zKyawnWfWm2i+19dD2
 lP3oIvuwxiV3fD3BIS/J0U5MKtdDNWOsGK2d2oPsZV2IZlBUnu3ako4yOHKYg+50SKy7
 OefssXFachOFaMV1I7dBliOtBgFPqyQp8XJkO52i6GL14odQqsCfrluImnF9finjYpP8
 /oYQ==
X-Gm-Message-State: APjAAAXDjzSS33xFI+F/IuIwwouCQ25S9wQ5veSbPqbNleT45I1xYWxV
 dO8V7zARBaVsyztjV9QPUBb94vAKA5MobxfzgtM=
X-Google-Smtp-Source: APXvYqx4Gby/dftFzK1EF0jtur5etO4UAARAB4cGl1xxiO1fo5BZEQU1RYn9Fp+JlvW9xL/s3LwbWAoWMl1Vj2H7u5g=
X-Received: by 2002:ac8:7545:: with SMTP id b5mr53209469qtr.234.1560220615482; 
 Mon, 10 Jun 2019 19:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <1559939981-15837-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1559939981-15837-1-git-send-email-hongweiz@ami.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Jun 2019 02:36:41 +0000
Message-ID: <CACPK8XcSqzpCqu56P69dS2Vng8aDoEz+OjONLHa4ZAQbjj0dGA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.1 v1] ARM: ASPEED: I2C: Update I2C driver to
 use APB_clk
To: Hongwei Zhang <hongweiz@ami.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hongwei,

On Fri, 7 Jun 2019 at 20:39, Hongwei Zhang <hongweiz@ami.com> wrote:
>
> Update I2C clock driver to calculate the clock frequency based on
> apb_clk, instead of bus's parent clock frequency.

I'm not sure what your patch is trying to do. As I understand it, this
is what the driver already does.

The parent clock frequency should be set in the device tree to be the APB clock:

        i2c0: i2c-bus@40 {
                #address-cells = <1>;
                #size-cells = <0>;
                #interrupt-cells = <1>;

                reg = <0x40 0x40>;
                compatible = "aspeed,ast2500-i2c-bus";
                clocks = <&syscon ASPEED_CLK_APB>;

Cheers,

Joel

>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 45 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 6c8b38f..9cce1fe 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -167,6 +167,7 @@ struct aspeed_i2c_bus {
>  };
>
>  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
> +static u32 calculate_APB_clock_freq(struct platform_device *pdev);
>
>  static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  {
> @@ -862,11 +863,11 @@ static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor)
>  }
>
>  /* precondition: bus.lock has been acquired. */
> -static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
> +static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus, u32 apb_clk)
>  {
>         u32 divisor, clk_reg_val;
>
> -       divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
> +       divisor = DIV_ROUND_UP(apb_clk, bus->bus_frequency);
>         clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
>         clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
>                         ASPEED_I2CD_TIME_THDSTA_MASK |
> @@ -883,12 +884,16 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
>                              struct platform_device *pdev)
>  {
>         u32 fun_ctrl_reg = ASPEED_I2CD_MASTER_EN;
> +       u32 apb_clk;
>         int ret;
>
>         /* Disable everything. */
>         writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
>
> -       ret = aspeed_i2c_init_clk(bus);
> +       apb_clk = calculate_APB_clock_freq(pdev);
> +
> +       ret = aspeed_i2c_init_clk(bus, apb_clk);
> +
>         if (ret < 0)
>                 return ret;
>
> @@ -945,6 +950,40 @@ static const struct of_device_id aspeed_i2c_bus_of_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
>
> +static u32 calculate_APB_clock_freq(struct platform_device *pdev)
> +{
> +       u8 pclk_div;
> +       u32 scu_csr, scu_hpll;
> +       u32 apb_clk, output_freq;
> +       char *baseptr = ioremap(0x1e6e2000, 0x28);
> +       const struct of_device_id *of_id = of_match_device(aspeed_i2c_bus_of_table, &pdev->dev);
> +
> +       scu_csr = readl(baseptr + 0x08);
> +       scu_hpll = readl(baseptr + 0x24);
> +       pclk_div = (scu_csr & 0x03800000) >> 23; /* 23:25 */
> +
> +       if (strcmp(of_id->compatible, "aspeed, ast2400-i2c-bus") == 0) {
> +               u8 OD, D, N;
> +
> +               D = scu_hpll & 0x0000000F;         /* 0:3  */
> +               OD = (scu_hpll & 0x00000010) >> 4; /* 4    */
> +               N = (scu_hpll & 0x000007E0) >> 5;  /* 5:10 */
> +               output_freq = (24 * (2 - OD) * ((N+2) / (D+1)) * 1000000); /* Output Frequency */
> +
> +               apb_clk = (output_freq / ((pclk_div * 2) + 2));
> +       } else {
> +               u8 M, N, P;
> +
> +               N = scu_hpll & 0x0000001F;         /* 0:4   */
> +               M = (scu_hpll & 0x00001FE0) >> 5;  /* 5:12  */
> +               P = (scu_hpll & 0x0007E000) >> 13; /* 13:18 */
> +               output_freq = ((24 * ((M+1) / (N+1) / (P+1))) * 1000000); /* Output Frequency */
> +
> +               apb_clk = (output_freq / ((pclk_div * 4) + 4));
> +       }
> +       return apb_clk;
> +}
> +
>  static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>  {
>         const struct of_device_id *match;
> --
> 2.7.4
>
