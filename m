Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B17158FA
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 10:47:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVmGs3ySPz3cNF
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 18:47:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XJR9dqr4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XJR9dqr4;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVmGH4rWvz2ynB
	for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 18:46:29 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-970056276acso648607666b.2
        for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1685436385; x=1688028385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FqqqKzzYeg0OWWEIaXdgyMYxfeRq0HM3Gm6xjPBJn9I=;
        b=XJR9dqr4PGBW9ZAkYC4lNv/aLoaf60sjJr8DMOPTzi7vT1wcLsV8ayc7PkiKEdozpo
         J/aRcu+VXhkxyEbg2IV0FR4yaXd+VGpw9s8FgHtHyN8LqGrS8Eq6dwJA3Q7ynqW844WO
         /wm5yiRZa17dM5kHqsIa9fgPP/991siNxbKgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685436385; x=1688028385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqqqKzzYeg0OWWEIaXdgyMYxfeRq0HM3Gm6xjPBJn9I=;
        b=AMkPH0oJUvyicEc3TVoiEGybrYPL8joaVrrT62MJtBkZYXcQT7NeA6FtgWYAe4uWTU
         E52973+30XJ0AIYvP7lYRvqIKV/Fzr0+KpGOPbDIudxG98r8V2W4cu8dXs6E8ZA5GoAQ
         cRzEIeH45dMgquzs5fHVZUQOUiUUzCTU7TRXj3G2W4k2DzWkn1cgjneEzDI7yGfe1mhg
         GFQMUaOOv32hU35ZQFJu4E2200NileIKH7larC7xOMZdaRSmwlvsn4+sXmoQVReNTd6Y
         GDZlf1lPIVt92qxma/4m3vVQ0qY3caUqUYF6+fieAdtCp7trv6wwAZYuCs7M1/bDv9uw
         ME1Q==
X-Gm-Message-State: AC+VfDwPugLWOz8HZwZPBLYU/P5VfJUdNTNNcD3l3b5YHOHih7rLRjqk
	Aa3z0nwxf0u+hEqPVXX2Rw9R9fGZM8HbOpy0k1I=
X-Google-Smtp-Source: ACHHUZ6LEUqIMDOf73LEW+2e+CPbi2pv5b+2YA2WqWn46WSW+YKdJ4pFVWXuYBN9rb6F95WEjL7g/PGuQI74O8LB0cQ=
X-Received: by 2002:a17:907:7285:b0:96b:e92:4feb with SMTP id
 dt5-20020a170907728500b0096b0e924febmr1729493ejc.60.1685436385098; Tue, 30
 May 2023 01:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230530084010.808942-1-lintao1890@163.com>
In-Reply-To: <20230530084010.808942-1-lintao1890@163.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 May 2023 08:46:13 +0000
Message-ID: <CACPK8Xf44CWubxnnFOVhQ27W=uPhm03puSfCZX5BogDQBMTD6Q@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v6] board: ast2600: Add
 Inspur SCM V1 board
To: lintao1890@163.com
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
Cc: Lin Tao <lintao.lc@inspur.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 30 May 2023 at 08:40, <lintao1890@163.com> wrote:
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -695,7 +695,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2600-slt.dtb \
>         ast2600-tacoma.dtb \
>         ast2600-intel.dtb \
> -       ast2600-tacoma.dtb
> +       ast2600-tacoma.dtb \
> +       ast2600-inspur-nf5280m7.dtb

Sort these alphabetically.


> +&sdrammc {
> +       clock-frequency = <400000000>;
> +};
> +


> +&i2c1 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c2_default>;

Please go back and read my previous review comments about the pinctrl
properties on the i2c nodes.

> +++ b/board/aspeed/ast2600_inspur/inspur.c

> +int board_late_init(void)
> +{
> +       /* TODO: add Port80 init.*/
> +       return 0;


In my previous mail I suggested creating a patch series, with the
device tree in the first patch and board file in a second.
Importantly, I suggested adding the board file with the actual content
you required so we could review it properly.

If you're not ready to add the board file content, I suggest sending
just the device tree without any of the board file content (Kconfig as
well as .c).

Cheers,

Joel
