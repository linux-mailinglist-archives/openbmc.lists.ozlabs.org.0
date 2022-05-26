Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92576534E2D
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 13:43:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L85fC6sBWz3blR
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 21:42:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JLvO98Fu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2c; helo=mail-vs1-xe2c.google.com; envelope-from=tali.perry1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JLvO98Fu;
	dkim-atps=neutral
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L85dl74Rpz2ypD
	for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 21:42:35 +1000 (AEST)
Received: by mail-vs1-xe2c.google.com with SMTP id c26so1146139vsl.6
        for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JEe4JTq4HMoZ+I0YWVgsR8sQxwI+sin4+wwLO1J3RKE=;
        b=JLvO98Fu21sCqp2drA5IfmaUVr0h4lXAXWuPssLA5gtFkyn/FNC1jLwcQi+AGBV7wH
         uJrpcQYkVYpsRk0cSakfbvPtYDIyFqdskvQJ1qsUHfT+rPBKMNjdeW6IOShNFFKid1b2
         0vNUdDNqr6zoooiZ0/NarObdmNt80ywVrC/tAsYJTXXogKHxQnQYvkkCFB7b7XWPYvmz
         KCMVKcwrNpvs/ZDYn28Ru24YXag2mLh0gV/bYbWeabYCR7Oo+d0fh2EC+ynAeCzEApky
         AvBjMkJrEKG49Q63WoPqYa0sO+vBpxe7FJ5oQ0VotbsdoOrm873KJcD3X0yKlZhjsv8X
         33jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JEe4JTq4HMoZ+I0YWVgsR8sQxwI+sin4+wwLO1J3RKE=;
        b=hE4Eey32qKZyKQlgmfuLF+USRDfS7KbtXadXnxZG+f1zF1ZQbMJ4ErnNmfFHrSCLlO
         NoWiENFGCJp0l95kEwmh59GRDKBze6B4Z5hCPk/YI1FdSKr7iJzz8vokHV5neFrDGDN2
         k/70iZ2TQM6vLaTazp38jmJZxGMS6yMMahaF6v/H7dlbbzroS/hVSkDKAIIdtRfq2WWG
         AqSKR0uVAm7PGYxAB4G2RKBqR7vtT7qFFCR5hpiglF7vJvr1ajtYGoHGA65fz0RmqOYV
         ipKs3FoxCgxxxs/hEbSOfxCh41XmJf1UAr+Vm7yO/HXbhGueVQ6WYGaKd2++V4h1ob+k
         b+jg==
X-Gm-Message-State: AOAM532EtBVllAcQQmdxDj+8Fb0QBcdYDXCrdWh3dqbaFoza543v7fTa
	Ly4uBlfFuEpgfWELBm11zgBBk7H/fwfImNvD4Z0=
X-Google-Smtp-Source: ABdhPJxIWXKb0kNzslGKXSAJfQCxTBRn9ur413NVMbEzqZ/Rc3zTbpcH1KxoGPjgrUzciHvXWJHHcjItv26rUnsZcWM=
X-Received: by 2002:a67:e09d:0:b0:335:def7:e939 with SMTP id
 f29-20020a67e09d000000b00335def7e939mr14828589vsl.27.1653565351588; Thu, 26
 May 2022 04:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220526094100.1494193-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20220526094100.1494193-1-jiasheng@iscas.ac.cn>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 26 May 2022 14:42:20 +0300
Message-ID: <CAHb3i=v+LV=sGCX8obuy=sXBFvnP9k-THb=mGw4ze8M5AVCYoQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: npcm7xx: barco-p50-gpio: Add check for platform_driver_register
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
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
Cc: Benjamin Fair <benjaminfair@google.com>, avifishman70@gmail.com, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 26, 2022 at 12:41 PM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> As platform_driver_register() could fail, it should be better
> to deal with the return value in order to maintain the code
> consisitency.
>
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 71aad029425d..08737fa2dcbf 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2336,8 +2336,7 @@ static struct platform_driver npcm_i2c_bus_driver = {
>  static int __init npcm_i2c_init(void)
>  {
>         npcm_i2c_debugfs_dir = debugfs_create_dir("npcm_i2c", NULL);
> -       platform_driver_register(&npcm_i2c_bus_driver);
> -       return 0;
> +       return platform_driver_register(&npcm_i2c_bus_driver);
>  }
>  module_init(npcm_i2c_init);
>
> --
> 2.25.1
>
thanks, Jiansheng !

Acked-by: Tali Perry <tali.perry1@gmail.com>
