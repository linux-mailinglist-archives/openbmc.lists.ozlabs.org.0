Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2F62DCB47
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 04:27:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxHWC6THczDqPv
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 14:27:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ApAyR3W7; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxHV64z1pzDqNH;
 Thu, 17 Dec 2020 14:26:53 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id l14so12681824qvh.2;
 Wed, 16 Dec 2020 19:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zNZ7AMe4cLHmnMLAtt8IJmwBucyEmBbRYyBbkl+v2AE=;
 b=ApAyR3W7pn0Xb8qXx9hZLPIzSYkIeQI2mix5QVd2C+XgzRkz9RpKtTZ7rVk5lj01xC
 MpBkXdNQWocvpqCOJIjya7V4JOODwe7obaZNjQwow4ZjWt5m6xsIKUoRKVSgVjkn7N0Q
 x7XN2OQiim6MoCLRLAXTLdlaGytDwax+di+G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zNZ7AMe4cLHmnMLAtt8IJmwBucyEmBbRYyBbkl+v2AE=;
 b=gy8Y9dw9K8v/iex3ak8v2LphJg7jsoNvflijQ+tIG/WdLm0eG+imuyVBFxc9jHGBwU
 W89ClEbxdD+yGIpVotydL66B4tZTU+huiqcsy7GAlOpaWKQL4AfzHpA3DjFvXwKvTXq1
 C1vUJwA6qYYKAMpaJNLqyc6a3jyDtVW1n8J/rbk2JgojGKtldxr6pG7AmGPosHW/WcV1
 XGKMYB7iJzziVXfV1IPd3V1k06IycvJUXEdtyqlNfk64lmYOMhRsVG89V5eFZNYVZYgI
 P6/tCpo04b+A/nxaUllPEdgKkXl7eDjlHPEs2Z69qbpQpw/MzbxNIFTzGxksTMUrhu9W
 yHNw==
X-Gm-Message-State: AOAM532Tt1E1S+SCGmF2IDrw+t2Il1OoLjpFBYoLDL7jUeO0b4H4wWsj
 v7PhOODU+JOQpK8pH+G33wdSHxu1S0tbZMUWmgU=
X-Google-Smtp-Source: ABdhPJwhJaKeLKSvu+8D7miZDngPk0d8g3gukqn/1/zLmpk8q3A883iEvBLFmrC0s9xac4a2LdojxqGrVQNzLY4uA/A=
X-Received: by 2002:a05:6214:c66:: with SMTP id
 t6mr45581201qvj.43.1608175608805; 
 Wed, 16 Dec 2020 19:26:48 -0800 (PST)
MIME-Version: 1.0
References: <1e823780-b1ef-42dd-bb60-321b4d482d31@www.fastmail.com>
 <20201217024912.3198-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201217024912.3198-1-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Dec 2020 03:26:36 +0000
Message-ID: <CACPK8XenUwdHiFnqHEKgQj=fisnThuDRwrosUm+tG20tdxzg-w@mail.gmail.com>
Subject: Re: [PATCH v3] driver: aspeed: g6: Fix PWMG0 pinctrl setting
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Dec 2020 at 02:50, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
> SCU414 to SCU4B4.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Billy!

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index b673a44ffa3b..aa53e9d3489b 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -367,7 +367,7 @@ FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
>
>  #define D22 40
>  SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> -SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU414, 8));
> +SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU4B4, 8));
>  PIN_DECL_2(D22, GPIOF0, SD1CLK, PWM8);
>  GROUP_DECL(PWM8G0, D22);
>
> --
> 2.17.1
>
