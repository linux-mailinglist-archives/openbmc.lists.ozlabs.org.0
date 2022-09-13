Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4C5B68C0
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 09:36:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRZyy0Ybnz3bhQ
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 17:36:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fbx72y6A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fbx72y6A;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRZyV3vBdz2xkn
	for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 17:35:59 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id t7so19261341wrm.10
        for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7QRL29rG2HP6m8gM1i+Qt1QxyR1wK0J/18IzoFP80Pw=;
        b=fbx72y6ApVRUsXgvdTcTaKevE06A7+UhyjXzv6KNoHVL9+X1YdTewweJTucmuHzrBM
         AKyp/HK7tf7zE9O/bboYz5LI9EMnpehyE/ZGN+P6Aa8BDgAXxoUBWBubOdLY357DLkko
         bBMQRWyfmx377QdVw8kjDOnXa5cZK5ZlDGK+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7QRL29rG2HP6m8gM1i+Qt1QxyR1wK0J/18IzoFP80Pw=;
        b=6m0vWrLhVLOMxmBFybaA82dTZoWfXVOKbQe+Gfsa64VFFagbCfH7hB6ueoRmJx9rNp
         1/FBQWf5g97lISA0GFXVjQSBl8uH7gFcP5jVpBCcOEWPI9r1z1RHH82hfkIwVdKO7lbx
         tGfH7i2ryqCwI2hgIVdOp9eBjc7CrfLifpz3yeYc5nMmULsVX3mKcV3lFzEj4ds/WeuF
         M27X/uxTtUq5DrVMImoL02dvwWcOULvuvy21CpKsmUXB44OC18UVpGbUNtBEoqr1zjtn
         m9pvLojIv9/QrK2d0kSeWiGfMXme2N9XKBkotbovxUiJzIR14ASo4H29W6B2LOZpiUL0
         8+aA==
X-Gm-Message-State: ACgBeo3QsGwtcisNG/wAsqxGedejW/5m5QU5sbp+KqJ26QXmbSGyFJOv
	pF704O51psd9Fa2/t8DTJlDIeQpqcgicqdWlLRoi07eY
X-Google-Smtp-Source: AA6agR5vREP4R4rQMGhnjUKIrgarx6WNNwtQbvGTpbwNGyFlzMXZ3DLZkIoErNOGI95tpCMbOpd1SFTB1T8xATpwck0=
X-Received: by 2002:a5d:6b83:0:b0:22a:80e4:f379 with SMTP id
 n3-20020a5d6b83000000b0022a80e4f379mr5559288wrx.3.1663054551724; Tue, 13 Sep
 2022 00:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220909034540.2396070-1-justinledford@google.com>
In-Reply-To: <20220909034540.2396070-1-justinledford@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Sep 2022 07:35:39 +0000
Message-ID: <CACPK8Xd4FMLmso5tjMkshoE=sd2F8ZMmi-7baQcMrgrgta3zuQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10] hwmon: (max31790) add fanN_enable
To: Justin Ledford <justinledford@google.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 9 Sept 2022 at 03:45, Justin Ledford <justinledford@google.com> wrote:
>
> The MAX31790 has a tach input enable bit in each fan's configuration
> register. This is only enabled by the driver if RPM mode is selected,
> but the driver doesn't provide a way to independently enable tachometer
> input regardless of the regulator mode.
>
> By adding the fanN_enable sysfs files, we can decouple the tach input
> from the regulator mode. Also update the documentation.
>
> Upstream (hwmon-next) commit: ca221abcb7ca95c9f36e3fb04ec19ab3fa865af0
> Signed-off-by: Justin Ledford <justinledford@google.com>

Hi Justin,

You generally need to be subscribed to the list to post. I have
manually moderated your mail through, but be sure to subscribe before
you next post. You can subscribe but set delivery to be false, if you
aren't interested in the mail. We do this to avoid spam.

Secondly, the v5.10 openbmc tree is completely unmaintined, and
therefore not accepting new changes. You should move your platforms to
v5.15 and submit your patches against that, which is actively
maintained by myself.

Cheers,

Joel

> ---
>  Documentation/hwmon/max31790.rst |  1 +
>  drivers/hwmon/max31790.c         | 38 ++++++++++++++++++++++++++------
>  2 files changed, 32 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
> index 7b097c3b9b90..33c5c7330efc 100644
> --- a/Documentation/hwmon/max31790.rst
> +++ b/Documentation/hwmon/max31790.rst
> @@ -38,6 +38,7 @@ Sysfs entries
>  fan[1-12]_input    RO  fan tachometer speed in RPM
>  fan[1-12]_fault    RO  fan experienced fault
>  fan[1-6]_target    RW  desired fan speed in RPM
> +fan[1-6]_enable    RW  enable or disable the tachometer input
>  pwm[1-6]_enable    RW  regulator mode, 0=disabled (duty cycle=0%), 1=manual mode, 2=rpm mode
>  pwm[1-6]           RW  read: current pwm duty cycle,
>                         write: target pwm duty cycle (0-255)
> diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> index 7e9362f6dc29..20bf5ffadefe 100644
> --- a/drivers/hwmon/max31790.c
> +++ b/drivers/hwmon/max31790.c
> @@ -202,6 +202,9 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
>                 }
>                 mutex_unlock(&data->update_lock);
>                 return 0;
> +       case hwmon_fan_enable:
> +               *val = !!(data->fan_config[channel] & MAX31790_FAN_CFG_TACH_INPUT_EN);
> +               return 0;
>         default:
>                 return -EOPNOTSUPP;
>         }
> @@ -214,7 +217,7 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
>         struct i2c_client *client = data->client;
>         int target_count;
>         int err = 0;
> -       u8 bits;
> +       u8 bits, fan_config;
>         int sr;
>
>         mutex_lock(&data->update_lock);
> @@ -243,6 +246,23 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
>                                         MAX31790_REG_TARGET_COUNT(channel),
>                                         data->target_count[channel]);
>                 break;
> +       case hwmon_fan_enable:
> +               fan_config = data->fan_config[channel];
> +               if (val == 0) {
> +                       fan_config &= ~MAX31790_FAN_CFG_TACH_INPUT_EN;
> +               } else if (val == 1) {
> +                       fan_config |= MAX31790_FAN_CFG_TACH_INPUT_EN;
> +               } else {
> +                       err = -EINVAL;
> +                       break;
> +               }
> +               if (fan_config != data->fan_config[channel]) {
> +                       err = i2c_smbus_write_byte_data(client, MAX31790_REG_FAN_CONFIG(channel),
> +                                                       fan_config);
> +                       if (!err)
> +                               data->fan_config[channel] = fan_config;
> +               }
> +               break;
>         default:
>                 err = -EOPNOTSUPP;
>                 break;
> @@ -270,6 +290,10 @@ static umode_t max31790_fan_is_visible(const void *_data, u32 attr, int channel)
>                     !(fan_config & MAX31790_FAN_CFG_TACH_INPUT))
>                         return 0644;
>                 return 0;
> +       case hwmon_fan_enable:
> +               if (channel < NR_CHANNEL)
> +                       return 0644;
> +               return 0;
>         default:
>                 return 0;
>         }
> @@ -423,12 +447,12 @@ static umode_t max31790_is_visible(const void *data,
>
>  static const struct hwmon_channel_info *max31790_info[] = {
>         HWMON_CHANNEL_INFO(fan,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> +                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> +                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> +                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> +                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> +                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> +                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
>                            HWMON_F_INPUT | HWMON_F_FAULT,
>                            HWMON_F_INPUT | HWMON_F_FAULT,
>                            HWMON_F_INPUT | HWMON_F_FAULT,
> --
> 2.37.2.789.g6183377224-goog
>
