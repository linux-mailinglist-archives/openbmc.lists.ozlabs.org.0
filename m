Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 817664A3D96
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 07:21:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnHyV1pWPz3bPH
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 17:21:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=hIToVVd3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hIToVVd3; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnHy62RqPz2xsb
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 17:21:16 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id y17so10626273qtx.9
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 22:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nkmgKIKiD9UBvQWizYy5xgyRt+hD+ds5tyxjslzaYok=;
 b=hIToVVd3gHz4DrrXmj6QWAW2BK4+I/Gm8PqEiPGHNVgqnT17tRWRSPocT1Rn8Br4IT
 8dOcomZ5rOK2fmUbZtwxlSXwZ5s8KvPMp/hIbNgOM9qBrSFL3DnWR5qow0llAf+Nglfd
 tdcV5eMiRVr2ed8RspY6oZ7vIcLCwj6fwu5Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkmgKIKiD9UBvQWizYy5xgyRt+hD+ds5tyxjslzaYok=;
 b=fEvbz3XxmxBdy8p51rAvl0Cw5/BDdOhn2B7WTFtAbio8QuNfiB3FVOnKCCrPwa4Mn2
 3b391uWZgJe4aGUguoXoAJIFBlvgDtfZd0g+iiosaJ0Pe87RVpCz7iE1dShIKlGwqblX
 Qb16whv+4A2FH4SI9k0x3ZOQ4qP2CphoB+jlWuIt65CEKdXmrx8Sqr/6eU6GXgb22QsZ
 PCV/rd+dZOb1jiJKPa1NxX/aXGBmH0dnBy/SYz8lsbvANhvxffhcIZa6UieI5aRybzeH
 6AuSUbdOWCjMWa+PJqokZjHtrcv2ZqyE2Ih42OHCUfF1GB0Y81VvxUmJOKJvMx1MlvZq
 SsSw==
X-Gm-Message-State: AOAM531gWJefIM4v8CND3Ynz42E9J9MCZdTQzWiTpiYWMGIaGRCtWwMt
 Aza0MTqLkTpjisEf6kOZK44Wgh7H/CjW/wNSDo020xs/
X-Google-Smtp-Source: ABdhPJxtAV4rSjtUFa3vRl0tF+LSyNp91yFNPCtHhCxuG74ju2zIwVSXxegx/yhfdibSZyl/4WkypR87bauKZh6NJVQ=
X-Received: by 2002:ac8:7f06:: with SMTP id f6mr13753349qtk.625.1643610072873; 
 Sun, 30 Jan 2022 22:21:12 -0800 (PST)
MIME-Version: 1.0
References: <20220124213850.3766-1-zev@bewilderbeest.net>
 <20220124213850.3766-2-zev@bewilderbeest.net>
In-Reply-To: <20220124213850.3766-2-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jan 2022 06:21:01 +0000
Message-ID: <CACPK8Xd2UVOaRHRXzwXMrM-vb=ZkMRtSbG2EmVBNH+Shn8ejJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: mux: pca9541: add delayed-release support
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 24 Jan 2022 at 21:39, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> For heavily-utilized i2c busses, the overhead of reacquiring bus
> ownership on every transaction can be quite substantial.  By delaying
> the release of the bus (in anticipation of another transaction needing
> to re-acquire ownership in the near future), we can reduce the
> overhead significantly -- a subsequent transaction that arrives within
> the delay window can merely verify that we still own it.
>
> The new "release-delay-us" DT property specifies a number of
> microseconds to wait after a transaction before releasing the bus
> (zero by default so as to preserve the existing behavior of releasing
> it immediately).

Sounds like a good idea to me!

>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/i2c/muxes/i2c-mux-pca9541.c | 56 ++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index 6daec8d3d331..76269bf9f9ca 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -19,6 +19,7 @@
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-mux.h>
>  #include <linux/jiffies.h>
> @@ -75,6 +76,8 @@ struct pca9541 {
>         struct i2c_client *client;
>         unsigned long select_timeout;
>         unsigned long arb_timeout;
> +       unsigned long release_delay;
> +       struct delayed_work release_work;
>  };
>
>  static const struct i2c_device_id pca9541_id[] = {
> @@ -127,8 +130,11 @@ static int pca9541_reg_read(struct i2c_client *client, u8 command)
>   * Arbitration management functions
>   */
>
> -/* Release bus. Also reset NTESTON and BUSINIT if it was set. */
> -static void pca9541_release_bus(struct i2c_client *client)
> +/*
> + * Release bus. Also reset NTESTON and BUSINIT if it was set.
> + * client->adapter must already be locked.
> + */
> +static void __pca9541_release_bus(struct i2c_client *client)
>  {
>         int reg;
>
> @@ -138,6 +144,13 @@ static void pca9541_release_bus(struct i2c_client *client)
>                                   (reg & PCA9541_CTL_NBUSON) >> 1);
>  }
>
> +static void pca9541_release_bus(struct i2c_client *client)
> +{
> +       i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +       __pca9541_release_bus(client);
> +       i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +}
> +
>  /*
>   * Arbitration is defined as a two-step process. A bus master can only activate
>   * the slave bus if it owns it; otherwise it has to request ownership first.
> @@ -254,6 +267,9 @@ static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 chan)
>         unsigned long timeout = jiffies + ARB2_TIMEOUT;
>                 /* give up after this time */
>
> +       if (data->release_delay)
> +               cancel_delayed_work_sync(&data->release_work);
> +
>         data->arb_timeout = jiffies + ARB_TIMEOUT;
>                 /* force bus ownership after this time */
>
> @@ -276,10 +292,21 @@ static int pca9541_release_chan(struct i2c_mux_core *muxc, u32 chan)
>         struct pca9541 *data = i2c_mux_priv(muxc);
>         struct i2c_client *client = data->client;
>
> -       pca9541_release_bus(client);
> +       if (data->release_delay)
> +               schedule_delayed_work(&data->release_work, data->release_delay);
> +       else
> +               __pca9541_release_bus(client);
> +
>         return 0;
>  }
>
> +static void pca9541_release_workfn(struct work_struct *work)
> +{
> +       struct pca9541 *data = container_of(work, struct pca9541, release_work.work);
> +
> +       pca9541_release_bus(data->client);
> +}
> +
>  /*
>   * I2C init/probing/exit functions
>   */
> @@ -289,18 +316,13 @@ static int pca9541_probe(struct i2c_client *client,
>         struct i2c_adapter *adap = client->adapter;
>         struct i2c_mux_core *muxc;
>         struct pca9541 *data;
> +       u32 release_delay_us;
>         int ret;
>
>         if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE_DATA))
>                 return -ENODEV;
>
> -       /*
> -        * I2C accesses are unprotected here.
> -        * We have to lock the I2C segment before releasing the bus.
> -        */
> -       i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
>         pca9541_release_bus(client);
> -       i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
>
>         /* Create mux adapter */
>
> @@ -313,6 +335,14 @@ static int pca9541_probe(struct i2c_client *client,
>         data = i2c_mux_priv(muxc);
>         data->client = client;
>
> +       if (!device_property_read_u32(&client->dev, "release-delay-us", &release_delay_us)) {
> +               data->release_delay = usecs_to_jiffies(release_delay_us);
> +               ret = devm_delayed_work_autocancel(&client->dev, &data->release_work,
> +                                                  pca9541_release_workfn);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         i2c_set_clientdata(client, muxc);
>
>         ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
> @@ -328,6 +358,14 @@ static int pca9541_probe(struct i2c_client *client,
>  static int pca9541_remove(struct i2c_client *client)
>  {
>         struct i2c_mux_core *muxc = i2c_get_clientdata(client);
> +       struct pca9541 *data = i2c_mux_priv(muxc);
> +
> +       /*
> +        * Ensure the bus is released (in case the device gets destroyed
> +        * before release_work runs).
> +        */
> +       if (data->release_delay)
> +               pca9541_release_bus(client);
>
>         i2c_mux_del_adapters(muxc);
>         return 0;
> --
> 2.34.1
>

On Mon, 24 Jan 2022 at 21:39, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> For heavily-utilized i2c busses, the overhead of reacquiring bus
> ownership on every transaction can be quite substantial.  By delaying
> the release of the bus (in anticipation of another transaction needing
> to re-acquire ownership in the near future), we can reduce the
> overhead significantly -- a subsequent transaction that arrives within
> the delay window can merely verify that we still own it.
>
> The new "release-delay-us" DT property specifies a number of
> microseconds to wait after a transaction before releasing the bus
> (zero by default so as to preserve the existing behavior of releasing
> it immediately).
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/i2c/muxes/i2c-mux-pca9541.c | 56 ++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index 6daec8d3d331..76269bf9f9ca 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -19,6 +19,7 @@
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-mux.h>
>  #include <linux/jiffies.h>
> @@ -75,6 +76,8 @@ struct pca9541 {
>         struct i2c_client *client;
>         unsigned long select_timeout;
>         unsigned long arb_timeout;
> +       unsigned long release_delay;
> +       struct delayed_work release_work;
>  };
>
>  static const struct i2c_device_id pca9541_id[] = {
> @@ -127,8 +130,11 @@ static int pca9541_reg_read(struct i2c_client *client, u8 command)
>   * Arbitration management functions
>   */
>
> -/* Release bus. Also reset NTESTON and BUSINIT if it was set. */
> -static void pca9541_release_bus(struct i2c_client *client)
> +/*
> + * Release bus. Also reset NTESTON and BUSINIT if it was set.
> + * client->adapter must already be locked.
> + */
> +static void __pca9541_release_bus(struct i2c_client *client)
>  {
>         int reg;
>
> @@ -138,6 +144,13 @@ static void pca9541_release_bus(struct i2c_client *client)
>                                   (reg & PCA9541_CTL_NBUSON) >> 1);
>  }
>
> +static void pca9541_release_bus(struct i2c_client *client)
> +{
> +       i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +       __pca9541_release_bus(client);
> +       i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +}
> +
>  /*
>   * Arbitration is defined as a two-step process. A bus master can only activate
>   * the slave bus if it owns it; otherwise it has to request ownership first.
> @@ -254,6 +267,9 @@ static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 chan)
>         unsigned long timeout = jiffies + ARB2_TIMEOUT;
>                 /* give up after this time */
>
> +       if (data->release_delay)
> +               cancel_delayed_work_sync(&data->release_work);
> +
>         data->arb_timeout = jiffies + ARB_TIMEOUT;
>                 /* force bus ownership after this time */
>
> @@ -276,10 +292,21 @@ static int pca9541_release_chan(struct i2c_mux_core *muxc, u32 chan)
>         struct pca9541 *data = i2c_mux_priv(muxc);
>         struct i2c_client *client = data->client;
>
> -       pca9541_release_bus(client);
> +       if (data->release_delay)
> +               schedule_delayed_work(&data->release_work, data->release_delay);
> +       else
> +               __pca9541_release_bus(client);
> +
>         return 0;
>  }
>
> +static void pca9541_release_workfn(struct work_struct *work)
> +{
> +       struct pca9541 *data = container_of(work, struct pca9541, release_work.work);
> +
> +       pca9541_release_bus(data->client);
> +}
> +
>  /*
>   * I2C init/probing/exit functions
>   */
> @@ -289,18 +316,13 @@ static int pca9541_probe(struct i2c_client *client,
>         struct i2c_adapter *adap = client->adapter;
>         struct i2c_mux_core *muxc;
>         struct pca9541 *data;
> +       u32 release_delay_us;
>         int ret;
>
>         if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE_DATA))
>                 return -ENODEV;
>
> -       /*
> -        * I2C accesses are unprotected here.
> -        * We have to lock the I2C segment before releasing the bus.
> -        */
> -       i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
>         pca9541_release_bus(client);
> -       i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
>
>         /* Create mux adapter */
>
> @@ -313,6 +335,14 @@ static int pca9541_probe(struct i2c_client *client,
>         data = i2c_mux_priv(muxc);
>         data->client = client;
>
> +       if (!device_property_read_u32(&client->dev, "release-delay-us", &release_delay_us)) {
> +               data->release_delay = usecs_to_jiffies(release_delay_us);
> +               ret = devm_delayed_work_autocancel(&client->dev, &data->release_work,
> +                                                  pca9541_release_workfn);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         i2c_set_clientdata(client, muxc);
>
>         ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
> @@ -328,6 +358,14 @@ static int pca9541_probe(struct i2c_client *client,
>  static int pca9541_remove(struct i2c_client *client)
>  {
>         struct i2c_mux_core *muxc = i2c_get_clientdata(client);
> +       struct pca9541 *data = i2c_mux_priv(muxc);
> +
> +       /*
> +        * Ensure the bus is released (in case the device gets destroyed
> +        * before release_work runs).
> +        */
> +       if (data->release_delay)
> +               pca9541_release_bus(client);
>
>         i2c_mux_del_adapters(muxc);
>         return 0;
> --
> 2.34.1
>
