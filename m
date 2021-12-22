Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0F47CFED
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 11:25:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJqFz1ByTz2ywd
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 21:25:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eDnUGes/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::332;
 helo=mail-wm1-x332.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=eDnUGes/; dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJqFZ6ssvz2xF1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 21:24:48 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso1180528wme.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 02:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lx5+TxPzkP4OG3zPUcL4TMPhe96VYfMUcp13pH7KaAE=;
 b=eDnUGes/xSqMGPzgt0iViSMu9iMis5tca1eQfJ9LvnPP7mHLRm0JcV6pIr5CRPFNhj
 0BxCzwkAgOjoilwHnzwU5BeYtfBhQQtUx+UP574RBhyLZ5VS9lTGNZaztrmRVf+1FFUm
 eugl9UNAhSU8zgDd6VNry1cIIVJPXWYU3TxOhXIisFEA+w8mdc6fV2Ex3O8lmKw7yn2n
 3SU/+otRfPTRHlgwytAgso7JFMflROfqowlVM31LmUsZ8jZaxmZ7IYQwa5o8qyw+ign/
 CMEPGFhZzsKW1hNzO6EXzCXa+mvzq0+dmwSmn+UqS86p+1CbSwfcgxN9hRn41/KBk6e4
 JVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lx5+TxPzkP4OG3zPUcL4TMPhe96VYfMUcp13pH7KaAE=;
 b=2vzohdnBz1nepEuPnVqiMPT3nGrZIwg7nQRi/92RUBjiLt0gX0vXrfLZj9v9bffWvE
 ZpzNuOTiCfHfw3ivUq81rBaEPzDq4acjCU+NL6yD8gD3p5usLw18gUcMC6Ql398Trtl1
 8JO0H6V4D59PCdPKYNsPeZ4ywWslh/Xy5Lma5W+NpXJYA5fxCA3AiTd9Mqp/dSJQs5qy
 9qRyduYqIwNb9UPtjSlHXrOFq0jfP1Zh7a7BSEfM6Yy8e6wnIPVw66+/K/0V8wHTqVNM
 YTiYpG0evhpH5QSBCIPk7bAAONVETa334sB7mCPyNrcOD5A+qV8YlIoSMyhBp7CQzRxh
 /MHg==
X-Gm-Message-State: AOAM530S6mr+wNsr/UirHKjGNX8lyLCM7JWB8vLjz6mGvBnXwcRu10D0
 /5G8cLaid8BbOdAKu/YumLeLqOD2YjtuiLnuRpRj+HSNpXSERw==
X-Google-Smtp-Source: ABdhPJz//KrQsPxi4wZTtZCUVjbaTxcXt6pS1TkT82qwKeYay5IjW9XufC3q9Je/jFNFtXXOOETH6uEcBhWm5+2OG5E=
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr456499wmg.112.1640168682021; 
 Wed, 22 Dec 2021 02:24:42 -0800 (PST)
MIME-Version: 1.0
References: <CANFuQ7AkTrtrogMj4YeAe0SWQFjG1Cd9WqFAktbvsOHmtd-Qpw@mail.gmail.com>
In-Reply-To: <CANFuQ7AkTrtrogMj4YeAe0SWQFjG1Cd9WqFAktbvsOHmtd-Qpw@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 22 Dec 2021 18:24:30 +0800
Message-ID: <CAGm54UFK6tFt64Z0aeKQWdmseJotBrtnNFgD90wjdQidU0x9Gw@mail.gmail.com>
Subject: Re: [External] Solve the problem of bad CRC when using
 u-boot-aspeed-sdk
To: George Liu <liuxiwei1013@gmail.com>
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

On Wed, Dec 22, 2021 at 4:05 PM George Liu <liuxiwei1013@gmail.com> wrote:
>
> Hi, everyone:
>
> The 64M flash used by Inspur's fp5280g2 machine has recently found
> that it cannot be saved when setting the u-boot environment variable,
> and then a warning message appears when rebooting:
>
> ```
> Loading Environment from SPI Flash... SF: Detected mx66l51235l with
> page size 256 Bytes, erase size 64 KiB, total 64 MiB
> *** Warning-bad CRC, using default environment
> ```
>
> Since fp5280g2 includes `openbmc-flash-layout-64.dtsi`, the initial problem is:
> 1. The value of CONFIG_ENV_SIZE and CONFIG_ENV_OFFSET[1] of u-boot is
> inconsistent with the size of u-boot env of Kernel's
> openbmc-flash-layout-64.dtsi[2].
> 2. The `Env. size` of the fw_env_ast2600_nor.config[3] file also needs
> to be updated
>
> After modifying the above problem and test by:
> 1. Use `setenv` to add a new environment variable in u-boot and reboot
> BMC, and then use `fw_printenv` to see this value synchronously.
> 2. Use `fw_setenv` to add a new environment variable in BMC and reboot
> BMC into u-boot, and then use `printenv` to see this value
> synchronously.
>
> We pushed a new patch to meta-inspur and it worked fine.
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49916

Good to know the issue is fixed.
Could you kindly re-work the patches to make it applicable for all
systems using 64MiB static layout?


-- 
BRs,
Lei YU
