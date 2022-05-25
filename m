Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C75334A7
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 03:21:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Cvj6lJFz301F
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 11:21:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Wln+Iowo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f;
 helo=mail-wr1-x42f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Wln+Iowo; dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7CvL5rv8z2y0B
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 11:21:17 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id f2so28064603wrc.0
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 18:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jz7RiwwqBsNVsA4nxOngfy+cwVxSf+avZmgPCQg2td8=;
 b=Wln+IowotioBNA9Fwa1LmYNZy7b+tTJODsS6vJX4HshobmAlQwHwPruGA0FFljQv2d
 x6rCNQoUO+jYm8VO1jg4xT7C8938alqdL2r9dtXj0dXeOXD0HieS2BmfjNFpkGL5/pWe
 Oi2L1PFSAO41c9gEVZl+n6zyP8An7pXt8dark=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jz7RiwwqBsNVsA4nxOngfy+cwVxSf+avZmgPCQg2td8=;
 b=QAjBWMGqkzvJpJClZFG15xOcRgPkVN8jBpFsq83w5XSSzaPabfLTexDusQdJigkdSx
 01ylNTs+TSBwmdaCUEnNpuuartf/MVRAF/9/Gse9HbXNh+isuiLYqO2BLwOKix9Xcoge
 vcr6MNTNTZpPTwcYk7xptrjSuMrF9BSJq7l1gKDVz8iQd043Whx016TpDPk8ltRXBL6v
 CjFdO03vIrmCkRrJf3pe+ABOwdyxWOpbWhRCvNZjLdOYrerCEPHjoIakPTbUMfl9agxZ
 x/3LYBj5MEkM6hwULQ/hVqLv4SCZYXs1W0V5CNHVTUFoFdbNNlrPmdTlCKz99G90z5Va
 cZqA==
X-Gm-Message-State: AOAM533wFzF/4/78xt89KB5GY4t1omQKFDCI+X1IU0fvEFGdPLR+kpBN
 fl23nwqU8WNfXuyKSdg6/9PHI/vRQ0dD0zx0rJM=
X-Google-Smtp-Source: ABdhPJz6JMiFgRw1rFmWWQw2VgvXi+mreUal49JQtsBnpEorR1RyB7+hZhdXAoaAghcaMKfT0GIkNE4kA3iPf5VgKuQ=
X-Received: by 2002:a5d:595f:0:b0:20d:97d:4d14 with SMTP id
 e31-20020a5d595f000000b0020d097d4d14mr24458586wri.549.1653441673883; Tue, 24
 May 2022 18:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220525011138.5882-1-eajames@linux.ibm.com>
In-Reply-To: <20220525011138.5882-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 May 2022 01:21:01 +0000
Message-ID: <CACPK8XfxQbQ1EVvcfRaTjCqEr9U+FHzXENL7368Ru51hHuQyUg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15] iio: si7020: Remove reset in probe
To: Eddie James <eajames@linux.ibm.com>
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

On Wed, 25 May 2022 at 01:11, Eddie James <eajames@linux.ibm.com> wrote:
>
> I2C commands issued after the SI7020 is starting up or after reset
> can potentially upset the startup sequence. Therefore, the host
> needs to wait for the startup sequence to finish before issuing
> further i2c commands. This is impractical in cases where the SI7020
> is on a shared bus or behind a mux, which may switch channels at
> any time (generating I2C traffic). Therefore, remove the device
> reset in the probe function.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Following the upstream discussion, I think this is the way forward.
Send this out to the upstream list when you have time.

https://lore.kernel.org/all/20220518204119.38943-1-eajames@linux.ibm.com/

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/iio/humidity/si7020.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
> index ab6537f136ba..3c55b81ce984 100644
> --- a/drivers/iio/humidity/si7020.c
> +++ b/drivers/iio/humidity/si7020.c
> @@ -115,13 +115,6 @@ static int si7020_probe(struct i2c_client *client,
>                                      I2C_FUNC_SMBUS_READ_WORD_DATA))
>                 return -EOPNOTSUPP;
>
> -       /* Reset device, loads default settings. */
> -       ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
> -       if (ret < 0)
> -               return ret;
> -       /* Wait the maximum power-up time after software reset. */
> -       msleep(15);
> -
>         indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
>         if (!indio_dev)
>                 return -ENOMEM;
> --
> 2.27.0
>
