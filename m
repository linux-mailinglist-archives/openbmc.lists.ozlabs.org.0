Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5D7DC7B4
	for <lists+openbmc@lfdr.de>; Tue, 31 Oct 2023 08:54:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y9hwAhp6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKMqX72Bmz3cC3
	for <lists+openbmc@lfdr.de>; Tue, 31 Oct 2023 18:54:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y9hwAhp6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKMpz28MLz2yG9
	for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 18:54:17 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a7fb84f6ceso45657487b3.1
        for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698738854; x=1699343654; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BxgfRq08akdKpYPvawQ/qmWvcE1o35b6GhP90H8S4Mw=;
        b=Y9hwAhp6ifPZUpRgrwU4lNv20C3cFltqOeTWtc+xtTo1aE6zaBMVGAJqmxh8gJRP8k
         p9BbaYlQzaD9MJp8zUT3NUnx/HhKLn2YXS5ECEn3HSS4aTBXaAE5hDiYXysWfWwNxyhy
         LkzgyN+VpFX4W+sIyRurXQ3ql8mHdFyCocgwvxKJRFaNn9ZBage0HtwuyYPcTwf+c3cB
         YyY4wd2zz+TzlRzeZ0ZlK1GmxKBIHL9+9NzLzx5f00g90WOc5z+WoLe9u2DCzENjU+gb
         qHShD0iVleGtswXb8AEX4R2rroj2F78ZR8uJdlaIsFnBXfpT0UUlr3yWBfEBYVsKCSHb
         wm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698738854; x=1699343654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxgfRq08akdKpYPvawQ/qmWvcE1o35b6GhP90H8S4Mw=;
        b=cYYsvCQPXIy/B+o6eu82hNjcOGtAmmARROxZ8jJbhevnxsgUkmFPw5hZzliXjS/dOd
         mLOv43pxzGOVHLAJMzsmEA929r3IX4ubm4S1IfSV1HKJDY1f+4HqT8Sny/cuoxIXjLiO
         tTfA3K/KVszNjYk/32vy5xEHU1i/VCo8vZfMC6Pkl/TtTrS8DUXK6uLh1OpxJskwV1jf
         WsQo02/njOdt7RD/w3E/JqnK51COGD5zn7CX07D1BqAw3RC9qSZ7OPLz43Bs6s0Wdb71
         Qi1gHtZFUqvQIV6xBz6OVzRlA0mW8C3/p1AAASpVu0IQ8TOfxmqYzS54oyXTQqHaKAfw
         maDw==
X-Gm-Message-State: AOJu0YzBiMukDSAx7upuCXd5cZ7I+DtSZUUxh/UH3rpPWubgUALfKM5S
	MWt3F6xlEWsLWCBuAqJSGLlgGMXhpMLJTYEO/bM=
X-Google-Smtp-Source: AGHT+IFrhKKyprJBm7nHBd4Rydqf0TOpZaL4oUpk4f4I19bsjnxQTcsk67zFEJtpBYSlcIgoeVc3brPEWGbY86zKMbg=
X-Received: by 2002:a81:ad62:0:b0:5a7:c01d:268 with SMTP id
 l34-20020a81ad62000000b005a7c01d0268mr10163703ywk.18.1698738854542; Tue, 31
 Oct 2023 00:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231030150119.342791-1-tmaimon77@gmail.com> <20231030150119.342791-2-tmaimon77@gmail.com>
 <e3de2c1f-3a05-4ffc-a50e-0b5522cf7740@roeck-us.net>
In-Reply-To: <e3de2c1f-3a05-4ffc-a50e-0b5522cf7740@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 31 Oct 2023 09:54:03 +0200
Message-ID: <CAP6Zq1hEFN==n3Um6MCvR-MqPERxwrm8Qd0DrKudA6L4xynDZA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] hwmon: npcm750-pwm-fan: Add NPCM8xx support
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, joel@jms.id.au, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

Thanks for your comments

On Mon, 30 Oct 2023 at 17:57, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/30/23 08:01, Tomer Maimon wrote:
> > Adding Pulse Width Modulation (PWM) and fan tacho NPCM8xx support to
> > NPCM PWM and fan tacho driver.
> > NPCM8xx uses a different number of PWM devices.
> >
> > As part of adding NPCM8XX support:
> > - Add NPCM8xx specific compatible string.
> > - Add data to handle architecture-specific PWM and fan tacho parameters.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >   drivers/hwmon/npcm750-pwm-fan.c | 34 +++++++++++++++++++++++++++++----
> >   1 file changed, 30 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> > index 10ed3f4335d4..765b08fa0396 100644
> > --- a/drivers/hwmon/npcm750-pwm-fan.c
> > +++ b/drivers/hwmon/npcm750-pwm-fan.c
> > @@ -46,9 +46,9 @@
> >   #define NPCM7XX_PWM_CTRL_CH3_EN_BIT         BIT(16)
> >
> >   /* Define the maximum PWM channel number */
> > -#define NPCM7XX_PWM_MAX_CHN_NUM                      8
> > +#define NPCM7XX_PWM_MAX_CHN_NUM                      12
> >   #define NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE 4
> > -#define NPCM7XX_PWM_MAX_MODULES                 2
> > +#define NPCM7XX_PWM_MAX_MODULES                 3
> >
> >   /* Define the Counter Register, value = 100 for match 100% */
> >   #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM             255
> > @@ -171,6 +171,10 @@
> >   #define FAN_PREPARE_TO_GET_FIRST_CAPTURE    0x01
> >   #define FAN_ENOUGH_SAMPLE                   0x02
> >
> > +struct npcm_hwmon_info {
> > +     u32 pwm_max_channel;
> > +};
> > +
> >   struct npcm7xx_fan_dev {
> >       u8 fan_st_flg;
> >       u8 fan_pls_per_rev;
> > @@ -204,6 +208,7 @@ struct npcm7xx_pwm_fan_data {
> >       struct timer_list fan_timer;
> >       struct npcm7xx_fan_dev fan_dev[NPCM7XX_FAN_MAX_CHN_NUM];
> >       struct npcm7xx_cooling_device *cdev[NPCM7XX_PWM_MAX_CHN_NUM];
> > +     const struct npcm_hwmon_info *info;
> >       u8 fan_select;
> >   };
> >
> > @@ -619,9 +624,13 @@ static umode_t npcm7xx_is_visible(const void *data,
> >                                 enum hwmon_sensor_types type,
> >                                 u32 attr, int channel)
> >   {
> > +     const struct npcm7xx_pwm_fan_data *hwmon_data = data;
> > +
> >       switch (type) {
> >       case hwmon_pwm:
> > -             return npcm7xx_pwm_is_visible(data, attr, channel);
> > +             if (channel < hwmon_data->info->pwm_max_channel)
> > +                     return npcm7xx_pwm_is_visible(data, attr, channel);
>
> I would have expected this check to be handled in npcm7xx_pwm_is_visible().
I will change the handle in npcm7xx_pwm_is_visible
>
> Guenter
>

Thanks,

Tomer
