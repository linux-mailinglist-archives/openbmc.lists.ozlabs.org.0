Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE92587F6
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:18:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgcMR1MDzzDqTZ
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 16:18:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=X2hE1qjs; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgcLf5f1kzDqBr
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 16:17:45 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id l17so270605edq.12
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R6Hz5PMS8ZmG+bifv8tcGQvHvsb9otCvCmrdeupw+6s=;
 b=X2hE1qjs5WDHi3iLqwJ3laeT0HY63f1gUpHeSUDBnqL3RFOqL23a2KMICOC+hleIe5
 yXEsOTiLlHD81UqFaovTxd0p3E2suyg2quC5ZzPGI6zn+Ld8sq2sVHSzIv/Pk32HSVWk
 P5ujo0qzLLHtcSnL8GEr5MNlPxgfGvw2r27Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R6Hz5PMS8ZmG+bifv8tcGQvHvsb9otCvCmrdeupw+6s=;
 b=Gm7B8xLMmv2VWfcScdDmvz39eyAuoxxTYH5WNcmO1We4QA7PmM3BtsN/2xtLXmtaC4
 /EwdcDgas1YdIMur6ud31tQWwtaX06NG/rBZlqJgiZECKtJu6hrsPNDPk5P5dnGNK2nW
 qDXFhaslZ+a0ns2zULqCfEB2K9H494l4nds638QwqajyATxzCl0zsvs3K5MA8ZMfndjM
 bMmI/ftNDckA3B+w0jtNeDcqLQyNxouUK0j4+6pF0suOAMAFePVd/Xy8LVj2RxgexR7p
 3zeecTsPotIsWehdjzQs/NeCm6ew5C8zAuuhMCNE1lrcFb2G6xyoDt9YZ2qv4EdvKrnU
 xdQA==
X-Gm-Message-State: AOAM532xm/h0jDSiBgJX39KH2Llq4+lXChK/B6+0PIIqvgtAx1384whY
 HPLKvP4xFmcY79LyjHdEYc4AJvSUEIRZR/rXC+fl7b+meOY=
X-Google-Smtp-Source: ABdhPJwoMWPHMSzIso4w9dKT/ohxQXpaez4ZDqnv875X3Xp6htuYbyqhLzDLwbSavJDJiWU1HX+5qLhrG3Q8d9+xUXE=
X-Received: by 2002:aa7:db89:: with SMTP id u9mr364472edt.267.1598941061871;
 Mon, 31 Aug 2020 23:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200827133002.369439-1-andrew@aj.id.au>
 <20200827133002.369439-2-andrew@aj.id.au>
In-Reply-To: <20200827133002.369439-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 06:17:29 +0000
Message-ID: <CACPK8XdU-nC94RJqSxxOWiSga5drzdocnVS1T1Aj9tU4dTevaw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 1/3] pmbus: (max31785) Retry enabling fans
 after writing MFR_FAN_CONFIG
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
> It has been observed across large fleets of systems that a small subset
> of those systems occasionally loose control of some number of fans

lose

> across a BMC reboot (their hwmon fan attributes are missing from sysfs).
>
> From extensive testing and tracing it was discovered that writes
> enabling a fan in FAN_CONFIG_1_2 failed to stick on the system under
> test with a frequency of about 1 in 1000 re-binds of the driver.
>
> The MAX31785 datasheet recommends in the documentation for
> MFR_FAN_CONFIG that the asssociated fan(s) be disabled before updating

associated

> the register. The sequence in question implements this suggestion, and
> the observed loss-of-fans symptom occurs when the write to re-enable the
> fan in FAN_CONFIG_1_2 fails to stick.
>
> The trace data suggests a one-shot retry is enough to successfully
> update FAN_CONFIG_1_2. With the workaround, no loss of fans was observed
> in over 20,000 consecutive rebinds of the driver.

Once you add your i2c throttling you should back out this change and re-test.

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/pmbus/max31785.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index cbcd0b2301f4..88b7156d777e 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -376,6 +376,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
>         u32 page;
>         u32 uval;
>         int ret;
> +       int i;
>
>         if (!of_device_is_compatible(child, "pmbus-fan"))
>                 return 0;
> @@ -552,10 +553,24 @@ static int max31785_of_fan_config(struct i2c_client *client,
>         if (ret < 0)
>                 return ret;
>
> -       ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
> -                                                pb_cfg);
> -       if (ret < 0)
> -               return ret;
> +       for (i = 0; i < 2; i++) {
> +               ret = max31785_i2c_smbus_write_byte_data(client,
> +                                                        PMBUS_FAN_CONFIG_12,
> +                                                        pb_cfg);
> +               if (ret < 0)
> +                       continue;
> +
> +               ret = max31785_i2c_smbus_read_byte_data(client,
> +                                                       PMBUS_FAN_CONFIG_12);
> +               if (ret < 0)
> +                       continue;
> +
> +               if (ret == pb_cfg)
> +                       break;
> +       }
> +
> +       if (i == 2)
> +               return -EIO;
>
>         /*
>          * Fans are on pages 0 - 5. If the page property of a fan node is
> --
> 2.25.1
>
