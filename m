Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3822587F8
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:20:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgcPN39KjzDqG9
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 16:20:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fN6xv1In; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgcN01q4nzDqTw
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 16:18:56 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id c8so288921edv.5
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 23:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4P0L3o64bTf0gnUeFQi3EtgVZiHMztmTsJn3aih3Sg=;
 b=fN6xv1InbkRNIyZ9KtP48FYhIDi/+RRXeqZHjzyT2BU7FKl2+ZWn5kFJKuh5rCer5H
 wFKuGBTMlZbxtmf7CoBAutbTq64ebM1R7zlGT7GbfRc9f2bZqTvKN037zvpmnsyOGYQ2
 3tjmRp4suffaKaMzHrLwPN5DSlMO8DwWQT5V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4P0L3o64bTf0gnUeFQi3EtgVZiHMztmTsJn3aih3Sg=;
 b=ODH06VT7a+4F/rxuiWSRRWlRLdaFG7wMp+emiUD6+VOjdRmcoIAt9kr2e/3Jb0AHZV
 o27nlOvklPtsfq0WkX2Af31kHPdzelP8xREJ07Fx1MlY9d1rWkJp/iGGCkeNBVVWxz8Y
 d090dG0716r4gbeU0/c81oyllH0rKumbj0RqHzHC7zPU51ZPM22Adg+fvJU3fiMnBy71
 GTROrI/TpsO1gUg5GOqNFhuN7onm29C86TeR5jxqUEM+1MdpNIGhZn/9EaaPsA+8WZQj
 CLVZKg4PkeNCzS73Kx9ILvb9Jm6DTQ1fEAKwwqv6P+cGpEYDl5bb2URXmEfaeo7qnH5M
 MwhQ==
X-Gm-Message-State: AOAM532stI6UAeXnLcdzYmUCZcnie0dnpmrxNZ0as+fPbkVZ+yuf1fWh
 QoKv53RMkik3rzvMP0wBLJqB88vYwFAIKJFR8Tg=
X-Google-Smtp-Source: ABdhPJx6Rci+hzagP4VHejV0GpbjrSYbIwICVuRW0mTrZ38EEKhJh6JVSCUQChM7OWonx+ItzlkujDV3K7WNf8kIgiU=
X-Received: by 2002:a05:6402:948:: with SMTP id
 h8mr396737edz.325.1598941131900; 
 Mon, 31 Aug 2020 23:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200827133002.369439-1-andrew@aj.id.au>
 <20200827133002.369439-3-andrew@aj.id.au>
In-Reply-To: <20200827133002.369439-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 06:18:39 +0000
Message-ID: <CACPK8Xd_1aGPmLVn0k8X8dtBpoSZWHGkrAvJ=Oa83oGvgeW68Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 2/3] pmbus: (max31785) Add a local
 pmbus_set_page() implementation
To: Andrew Jeffery <andrew@aj.id.au>
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

On Thu, 27 Aug 2020 at 13:30, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Extensive testing and tracing has shown that the MAX31785 is unreliable
> in the face of PAGE write commands, ACK'ing the PAGE request but
> reporting a value of 0 on some subsequent PAGE reads. The trace data
> suggests that a one-shot retry of the PAGE write is enough to get the
> requested value to stick.
>
> As we configure the device before registering with the PMBus core,
> centralise PAGE handling inside the driver and implement the one-shot
> retry semantics there.

Are you still doing a retry with every operation due to the macro magic?

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/pmbus/max31785.c | 32 ++++++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 88b7156d777e..a392c0efe0a6 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -361,6 +361,27 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
>         return -ENXIO;
>  }
>
> +static int max31785_pmbus_set_page(struct i2c_client *client, int page)
> +{
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < 2; i++) {
> +               ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> +               if (ret < 0)
> +                       return ret;
> +
> +               ret = max31785_i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> +               if (ret < 0)
> +                       return ret;
> +
> +               if (ret == page)
> +                       return 0;
> +       }
> +
> +       return -EIO;
> +}
> +
>  /*
>   * Returns negative error codes if an unrecoverable problem is detected, 0 if a
>   * recoverable problem is detected, or a positive value on success.
> @@ -392,7 +413,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
>                 return -ENXIO;
>         }
>
> -       ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> +       ret = max31785_pmbus_set_page(client, page);
>         if (ret < 0)
>                 return ret;
>
> @@ -613,7 +634,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
>                 return -ENXIO;
>         }
>
> -       ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> +       ret = max31785_pmbus_set_page(client, page);
>         if (ret < 0)
>                 return ret;
>
> @@ -714,7 +735,7 @@ static int max31785_configure_dual_tach(struct i2c_client *client,
>         int i;
>
>         for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
> -               ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> +               ret = max31785_pmbus_set_page(client, i);
>                 if (ret < 0)
>                         return ret;
>
> @@ -756,7 +777,7 @@ static int max31785_probe(struct i2c_client *client,
>
>         *info = max31785_info;
>
> -       ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
> +       ret = max31785_pmbus_set_page(client, 255);
>         if (ret < 0)
>                 return ret;
>
> @@ -798,8 +819,7 @@ static int max31785_probe(struct i2c_client *client,
>                 if (!have_fan || fan_configured)
>                         continue;
>
> -               ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE,
> -                                                        i);
> +               ret = max31785_pmbus_set_page(client, i);
>                 if (ret < 0)
>                         return ret;
>
> --
> 2.25.1
>
