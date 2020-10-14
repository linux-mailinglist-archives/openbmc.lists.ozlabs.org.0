Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D1528D993
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 07:31:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB1HZ6MZqzDqkb
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 16:31:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=W1bbLqtM; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB1Gn22gPzDqTs
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 16:30:55 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id q26so1525612qtb.5
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 22:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=74gtbcSoQxBU/Zm+4MVD4nGSWX1uGiDbcEQFSH2Vxhw=;
 b=W1bbLqtMmSL+ANSOQe8P5DwLGGiKKtcj7T8ijYHZ+Cjn35VQJt1HwpuWShCRVQQHDr
 IZc1oYF2nVGSp8zrVWaPHXXaqWNiWZROH7EvKmO4qSK7YfIWL8MGSNpN86/pjw/F1+Sx
 Pbt1X2n0rA5hwuFs4X3TC/ar8/JQa4xo5EWLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=74gtbcSoQxBU/Zm+4MVD4nGSWX1uGiDbcEQFSH2Vxhw=;
 b=uMO8uMNyobV9ccVk7KmmvSQsfSaMslsk2iRPenk6+Q/QNFDDCdGiFoAQWUvYlKyi1+
 utC2Q1Ix814dn7qw5pt0e3XRYJgXZIriB05filZTTqyh1pFt7n4axMliyC6S8ekTuOkn
 5MCIi5vakpM8TWt/2YHJVlpCiVN2bXXXtMyK7dH9O0Je4Pg5qcWgeifmWT3M5E11Nt/Z
 /kTdeDQzOOcwvh0JQSRG8PF2aRw/fAMf4d4QgVEKFtleId8s0KWAJ1YkgyPZUBFxlVf1
 uVEmkO4wX9nEfbMMoiKCdTw+t8Fu0sDr1Brgao3m1vTwhkP0aZ0H8ivq0GYL7rAm1sqT
 TOvA==
X-Gm-Message-State: AOAM5311jeLDZOTlkdJZumTAwaC1/1sFPqOzVKAeJL0ml8yedZU/Q8xh
 tIdLRNBOTFV1u8Dexkor6AQugP9irsXBzVfBUMw=
X-Google-Smtp-Source: ABdhPJwFSofO1DnV5P1Q+GhVV9xWH5KVbG2AZVq2YXBrwkOok/555qf+pK9DhGN6Re52aadNtaTeBFn/Zu46YqnpXHg=
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr3268208qta.176.1602653453244; 
 Tue, 13 Oct 2020 22:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201013100314.216154-1-tali.perry1@gmail.com>
In-Reply-To: <20201013100314.216154-1-tali.perry1@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Oct 2020 05:30:41 +0000
Message-ID: <CACPK8XfoBcQpxaMHWcMrcwU3KtKi8KLNXDP5Nu-5Feo8V+7VFw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: Support changing bus speed using debugfs.
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
 Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, wsa@kernel.org,
 linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 13 Oct 2020 at 10:03, Tali Perry <tali.perry1@gmail.com> wrote:
>
> Systems that can dynamically add and remove slave devices
> often need to change the bus speed in runtime.
> This patch expose the bus frequency to the user.
> This feature can also be used for test automation.
>
> --
> v2 -> v1:
>         - Fix typos.
>         - Remove casting to u64.
>
> v1: initial version
>
> Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I'm not sure that the Fixes tag is quite correct, but it's no biggie.


> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2ad166355ec9..633ac67153e2 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2208,6 +2208,40 @@ static const struct i2c_algorithm npcm_i2c_algo = {
>  /* i2c debugfs directory: used to keep health monitor of i2c devices */
>  static struct dentry *npcm_i2c_debugfs_dir;
>
> +static int i2c_speed_get(void *data, u64 *val)
> +{
> +       struct npcm_i2c *bus = data;
> +
> +       *val = bus->bus_freq;
> +       return 0;
> +}
> +
> +static int i2c_speed_set(void *data, u64 val)
> +{
> +       struct npcm_i2c *bus = data;
> +       int ret;
> +
> +       if (val < I2C_FREQ_MIN_HZ || val > I2C_FREQ_MAX_HZ)
> +               return -EINVAL;
> +
> +       if (val == bus->bus_freq)
> +               return 0;
> +
> +       i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +       npcm_i2c_int_enable(bus, false);
> +
> +       ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
> +
> +       i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +       if (ret)
> +               return -EAGAIN;
> +
> +       return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%llu\n");
> +
>  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>                                   struct npcm_i2c *bus)
>  {
> @@ -2223,6 +2257,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>         debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
>         debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
>         debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> +       debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
>
>         bus->debugfs = d;
>  }
>
> base-commit: 865c50e1d279671728c2936cb7680eb89355eeea
> --
> 2.22.0
>
