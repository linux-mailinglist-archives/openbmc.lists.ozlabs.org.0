Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78C257261
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 05:36:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfwqD2cQ4zDqSh
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 13:36:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Np8eJ16y; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfwpN3zLQzDqRc
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 13:35:53 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id a12so4064374eds.13
 for <openbmc@lists.ozlabs.org>; Sun, 30 Aug 2020 20:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Es49Pktfv7cyRBR2isn8kE0O0ZV8xR4yhOVye/VQUrk=;
 b=Np8eJ16yZ5iMi3JnVsjqeMJX6+O7o5Ri0YyeWM6xIP2rHgwlMYXKwdrjJFPowbg/BA
 Qnr2rsfVzQudIyB4cK4lD/oNRmPcWdr8Tm3bCZG9DNxyK38R0k0EkF38KUbtIzV7ScCs
 44b/yRnPTi24WZi3x+sC4lM5sLHPLrC56iNp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Es49Pktfv7cyRBR2isn8kE0O0ZV8xR4yhOVye/VQUrk=;
 b=ndi3CyEl/92xc7K+PVELtWZJoaf9uMtju8VeOdwvQmgMZIoonzyvki6MGqiE8wudUh
 GVaZ+pjMEn3RpHfyd38IJpTVzbREKTRqpcOjS0RK3FLxtCAkSLmmkRtQx5Q3Jg6JA/U1
 YTgbkIuWgxHvaheOpE/JgaPVnCmJzKnugQ23i+wVeY/q2S81Pqbhx8oJ8Ki+YG8hk75O
 aU/+HhxRNCgHXKm4Hoz2UbV61K1totmJGKEuka7uF0BywYlkOguODnNvcdfroHPUjLgF
 8v2FjEHJo+P31zVyOi9lY64b3hmupVoOEgl2KrTadJol+x5IB3HaUPvrbh/VivOXFGDq
 3RLg==
X-Gm-Message-State: AOAM531bAQkjmJpx79tt8ZEdm9dNZuKU4YlBmjm94Nb4zlMii3IUSxyW
 TYnczvdpwrVQFLrTQMNGE3ff4ws1Z2DA5jJ7DO8=
X-Google-Smtp-Source: ABdhPJx7qh+mNkv4fszmTyhwOjH5PtQGv7TcGVXG2A3V0/1q8FyjFJn4lSFRahcWP+iQ09eNAAQjowrra3y2n+LSM3I=
X-Received: by 2002:a05:6402:ca7:: with SMTP id
 cn7mr1902945edb.143.1598844949735; 
 Sun, 30 Aug 2020 20:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200830213121.239533-1-tali.perry1@gmail.com>
In-Reply-To: <20200830213121.239533-1-tali.perry1@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Aug 2020 03:35:36 +0000
Message-ID: <CACPK8Xev4w4BxrxR1zQPk=wiHCK2fSGD9tEeAQwPe_uayGw_CA@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: npcm7xx: Fix timeout calculation
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
Cc: xqiu@google.com, Benjamin Fair <benjaminfair@google.com>,
 Wolfram Sang <wsa@the-dreams.de>, Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 30 Aug 2020 at 21:31, Tali Perry <tali.perry1@gmail.com> wrote:
>
> timeout_usec value calculation was wrong, the calculated value
> was in msec instead of usec.
>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 75f07138a6fa..dfcf04e1967f 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2093,8 +2093,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>                 }
>         }
>
> -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> +       /*
> +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> +        * 2: double the timeout for clock stretching case
> +        * 9: bits per transaction (including the ack/nack)
> +        */
> +       timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
>         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
>         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>
> base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
> --
> 2.22.0
>
