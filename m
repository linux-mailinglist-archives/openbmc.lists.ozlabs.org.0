Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3518622C74
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 14:35:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6mDQ5H8Yz3cNj
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 00:35:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aXyU+cQZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=tali.perry1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aXyU+cQZ;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6mCq1YPKz2xb4
	for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2022 00:34:28 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id bj12so46582331ejb.13
        for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2022 05:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hRp9ggfrc3pUhH9noDOfG+UiWKthVVd275v3/Gnchcc=;
        b=aXyU+cQZbjaM3EYAqiUJn3okIvP2e+SODq8aYWqIwzolbE+jBkhydN1zN9gS6J6S2t
         nJRubFkkS8Z8NTbnp73jQ5IHzVDhViOqJVEr+ydO9TlZEjv19ZBHIzI3nppE8QEizUfE
         wjMcic7NBViBYAZZ5Bw+j3TMooHCzHTbJY9VArlQ9KMMQSxBUwQYX461AkwiGjzVIX+d
         6guJ2K6extaSKkB3UyWvJyXx8Gya49h1IlyRPk+jirk4s+1j1IzF8tiqnjlEtY52UKF2
         93/WoNGhCZaCtFtJbo+F/cYXnYdtHeNIYuVsbC4RQYL7l+uqnalMnxE/7Ds6pVJK8666
         WUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRp9ggfrc3pUhH9noDOfG+UiWKthVVd275v3/Gnchcc=;
        b=4L+V2qZzcSYoaJtbILTNfKzcbFwzAsKOrXtB4a95NDxNdeONCZMrjTugxYZxUMaytm
         EtvvO38cUkP1BmxdP0OQRPra7LhkBoay+vhwuHyWgGQ+95EmWv4c9bXAsuiQeihj/Q0p
         z/0BFavz6yKpA6/d4wed6ZiX6eY5Yr+A2ZCd02bpw/ZMVX/I7TWnqhGdvcz3hXpXTrNK
         bjLGbvJy1jokoAcxXBskTEYE/XaqoA3xcDrMcaSWxIVLVuftlOFu4kpSGYnmGCmdOed8
         gQ7kepnSDzeI8lhR7Oc4EO/JpsMvnchweCYYPAMJ8HtH8hEyNkvIogBJW/SsNP7J5nJU
         CuPg==
X-Gm-Message-State: ANoB5pnsJgV+0WDnooz60UagDNx91glYjjE6rCSq64toxnGueHt+97/J
	q1OxgoiOeNFQuSicraBIP8zTNThwKm7+I2lCHmg=
X-Google-Smtp-Source: AA0mqf7tAyXaBYFaB/TMNCyFr5IQym41MY+ujgilkkq1l2YZHn5HWQoqBIZ6Fo+x/si5MfSvowvF2KKje0J6KxLJyz4=
X-Received: by 2002:a17:906:1458:b0:7ae:4d8c:91fe with SMTP id
 q24-20020a170906145800b007ae4d8c91femr20131187ejc.452.1668000861495; Wed, 09
 Nov 2022 05:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20221109112250.124829-1-yuancan@huawei.com>
In-Reply-To: <20221109112250.124829-1-yuancan@huawei.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Wed, 9 Nov 2022 15:34:10 +0200
Message-ID: <CAHb3i=tUA5ai_hVHZYJS9Yo3ihF_TkKxM8wb6SsVBLmae7FwYA@mail.gmail.com>
Subject: Re: [PATCH] i2c: npcm7xx: Fix error handling in npcm_i2c_init()
To: Yuan Can <yuancan@huawei.com>
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, wsa@kernel.org, linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 9, 2022 at 1:24 PM Yuan Can <yuancan@huawei.com> wrote:
>
> A problem about i2c-npcm7xx create debugfs failed is triggered with the
> following log given:
>
>  [  173.827310] debugfs: Directory 'npcm_i2c' with parent '/' already present!
>
> The reason is that npcm_i2c_init() returns platform_driver_register()
> directly without checking its return value, if platform_driver_register()
> failed, it returns without destroy the newly created debugfs, resulting
> the debugfs of npcm_i2c can never be created later.
>
>  npcm_i2c_init()
>    debugfs_create_dir() # create debugfs directory
>    platform_driver_register()
>      driver_register()
>        bus_add_driver()
>          priv = kzalloc(...) # OOM happened
>    # return without destroy debugfs directory
>
> Fix by removing debugfs when platform_driver_register() returns error.
>
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 0c365b57d957..83457359ec45 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2393,8 +2393,17 @@ static struct platform_driver npcm_i2c_bus_driver = {
>
>  static int __init npcm_i2c_init(void)
>  {
> +       int ret;
> +
>         npcm_i2c_debugfs_dir = debugfs_create_dir("npcm_i2c", NULL);
> -       return platform_driver_register(&npcm_i2c_bus_driver);
> +
> +       ret = platform_driver_register(&npcm_i2c_bus_driver);
> +       if (ret) {
> +               debugfs_remove_recursive(npcm_i2c_debugfs_dir);
> +               return ret;
> +       }
> +
> +       return 0;
>  }
>  module_init(npcm_i2c_init);
>
> --
> 2.17.1
>

Thanks Yuan!

Reviewed-by: Tali Perry <tali.perry@nuvoton.com>
