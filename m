Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 092BC256DB6
	for <lists+openbmc@lfdr.de>; Sun, 30 Aug 2020 14:50:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfY8V1014zDqW5
	for <lists+openbmc@lfdr.de>; Sun, 30 Aug 2020 22:50:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nXZvxVAY; dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfY7L0gKTzDqRZ
 for <openbmc@lists.ozlabs.org>; Sun, 30 Aug 2020 22:49:17 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id u126so3346664iod.12
 for <openbmc@lists.ozlabs.org>; Sun, 30 Aug 2020 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pdBRR0cueC+gQFMWe643ZTOPACqLEtpMVbSZLMNIJk8=;
 b=nXZvxVAYREeSQudgh5+FEP9PDKNIFXymwC/FlXmvC3gptxL63qm2e7mHxhHkFau5qh
 2B5zLmRu9pDycfVr8sGnqogTSC9i8RWh2jTLL+eLAlVA1PuposUsD3C4QigoyoS4aV+e
 jC1xTnrrMuj87umbNnmcDgLuO22Hp3K2A6zBqumWazXMaE+CuUrnCnk1fHk+LPmM4sFC
 uKfK5UiIeLES0sJzHHylkDPqEYYO7RGucS0X+HM2h3EZgqIUv0RPWuaxwj249C1VplMd
 ORn/YxVjTGLzbzXCL3crni/RO6PDMpQ6vdePMs7tKwX2BGgt900+8kCsHtjtwtAOfVtn
 ZP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pdBRR0cueC+gQFMWe643ZTOPACqLEtpMVbSZLMNIJk8=;
 b=ohrchYKjhfsss19Q2G+BCHT8ie1paotlVoYjvOz5877dQfB0qv691FchvmJ3UADBGH
 G2QZ+ZtYLpDzVLLndb6MJCPXgQbaec2xk5v2gLG4k9R1jENFRf3JqDuRmbQyeopZiRGg
 hqikwg56tz4zXOC7dW7LbNqX5Fd83DibazTyEZG4qfPFYs/IKwHpRRBJjozWZ43a1OoP
 E3zZIl95Kj9FHCjTfzLs4JL/6Goe+3WeURry3nZpHkwYXIZZ0P5QC5amQDItuUUI/s5B
 2a6W2uSPsP93rPfkJ8ngIMmXx9H4eGuQsaSIBS4ZgG0EQcsjq6kkfQVvMwzLaTJyhnFx
 Acgg==
X-Gm-Message-State: AOAM5308b/BlKgylsq9eHHni5I5wY3PZtD+HiY2i/mt7UOyEbPZPzQ4w
 Td7C5hiHASn8bsCvuovmLh1hxP2I4qng1mmXGA==
X-Google-Smtp-Source: ABdhPJw7O7EzuonqLJJFe/6YP0MDgHVcW3ajTLQEw/YH6cRXtE4Hd9v1Grf3WAIzDWhra7xl7zwb3LoQhXLRSc5T6Gs=
X-Received: by 2002:a02:ccdb:: with SMTP id k27mr7904474jaq.103.1598791753939; 
 Sun, 30 Aug 2020 05:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200830122051.197892-1-tali.perry1@gmail.com>
In-Reply-To: <20200830122051.197892-1-tali.perry1@gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 30 Aug 2020 15:47:52 +0300
Message-ID: <CAKKbWA47=-ubf+HZJwNMWdPsKdeOO6VAUvApcvewhOcxhg0KWQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: bug fix timeout (usec instead of msec)
To: Tali Perry <tali.perry1@gmail.com>
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
Cc: xqiu@google.com, Benjamin Fair <benjaminfair@google.com>, wsa@the-dreams.de,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Aug 30, 2020 at 3:21 PM Tali Perry <tali.perry1@gmail.com> wrote:
>
> i2c: npcm7xx: bug fix timeout (usec instead of msec)
>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>

> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 75f07138a6fa..abb334492a3d 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2093,8 +2093,13 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>                 }
>         }
>
> -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> +       /*
> +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> +        * 2: double the timeout for clock stretching case
> +        * 9: bits per transaction (including the ack/nack)
> +        * 1000000: micro second in a second
> +        */
> +       timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);
>         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
>         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>
> base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
> --
> 2.22.0
>


--
Regards,
Avi
