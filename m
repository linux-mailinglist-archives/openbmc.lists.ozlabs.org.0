Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D164A4C2B21
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 12:44:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K49zb14r5z30Qq
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 22:44:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LueZOwwS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LueZOwwS; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K49zB5WGcz2x9Q
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 22:43:48 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id j78so1509435qke.2
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 03:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5gArQSwHwyCEW3+RdeY9YEQDCJ0lb88+ttMV1KtaKhw=;
 b=LueZOwwSiWEHdyie9V2stclRbegLWYg1DZqJ7vXZzCpUTNphs8dzhW6AJWgfZH714O
 mBQXQ89kpIw148kFc0aUNpgNpZP9KwNUpW/Toz3lHz2Y2C5wswLgLW6Knclfmjz3zvnB
 DhcdL9GYNjy+QkT9A2DYomYsbxLpC8yVX8K9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5gArQSwHwyCEW3+RdeY9YEQDCJ0lb88+ttMV1KtaKhw=;
 b=QpfrQwW1ffhtMO6pjhkezlTYPib183HI/w5lUU9wfEIqlW3gN66eFK0cudyER3MPPD
 Un/K0Yw0yfl4hgKn/kln3ilVBgRnWwil7O1+9e/xFYAwakJvI6EXj6Vrs4BXRsPBKEpj
 jZe0I6SQ1t2A5mj5ZBOXw+mIk9R5x2J0oXOnSFpdDtXgjvB84ARq0hbXMe/jd1AHQ7jM
 2OYhGvzamM5lmdPhcqz3LLRfkRZVLapczM8jdJVpMoI1ePFExiG3G+9xab2Fnj78xXxl
 NYP1udBsyvOZYWpxnWtTWyQiwHELLc1xojwthzZ3MeNGST8cJvsO0T664v4mY1wFjolo
 lvEA==
X-Gm-Message-State: AOAM530VR85TpyDs4h3dNqHY4TZbxss+QrdyqghbdWzeI72aZ9EswsUU
 wW35KemanuHNwlNLmZEIZ98s8P8375imuUA2WzI=
X-Google-Smtp-Source: ABdhPJxzN0Jeb9gYeQrhF0fZ/QL4uwtloSHMQJ5ZPSfyeWl8j/T+0OeVi/kfNxfbLJPi3JV7d8geCBJCHeWq97KdIbw=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr1254882qkj.666.1645703024560; Thu, 24
 Feb 2022 03:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20220224081121.10389-1-jamin_lin@aspeedtech.com>
 <20220224081121.10389-2-jamin_lin@aspeedtech.com>
In-Reply-To: <20220224081121.10389-2-jamin_lin@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 24 Feb 2022 11:43:32 +0000
Message-ID: <CACPK8XeXhRwp6PrNoGnFedBwh7MqR6Qu++AOOGDbOmDF2xq-pA@mail.gmail.com>
Subject: Re: [u-boot,v2019.04-aspeed-openbmc 1/1] fix compiling warnings for
 AST2600 A1 SPL
To: Jamin Lin <jamin_lin@aspeedtech.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 24 Feb 2022 at 08:11, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> remove duplicated define
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  include/configs/evb_ast2600a1_spl.h | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_spl.h
> index 655896b237..006cc4345b 100644
> --- a/include/configs/evb_ast2600a1_spl.h
> +++ b/include/configs/evb_ast2600a1_spl.h
> @@ -42,13 +42,6 @@
>  #endif
>  #endif
>
> -/* SPL */
> -#define CONFIG_SPL_TEXT_BASE           0x00000000
> -#define CONFIG_SPL_MAX_SIZE            0x0000E800
> -#define CONFIG_SPL_STACK               0x10010000
> -#define CONFIG_SPL_BSS_START_ADDR      0x90000000
> -#define CONFIG_SPL_BSS_MAX_SIZE                0x00100000

A good cleanup. While we're here, can we clean up the various ast2600
config headers?

There is a large diff between the a0 and the a1 spl header. I know the
A0 has a smaller SRAM. Are there any other differences required?

> -
>  #define CONFIG_SUPPORT_EMMC_BOOT
>
>  #endif /* __CONFIG_H */
> --
> 2.17.1
>
