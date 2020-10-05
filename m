Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E152842D4
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 01:07:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4x7b41xjzDqGv
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 10:07:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OKZAR4QY; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4x6W4H1rzDqGG
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 10:06:07 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id 19so11353430qtp.1
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 16:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vxxQ9gocXfWXOuxXjHODE4zl7ezUzHUPAtWaBg80uZI=;
 b=OKZAR4QYHSO4bSHxOPrCpeKjDrid9Vx2YG1bpq2HD5DvySWLBmumwv4DDrG/ASBkkO
 L3ZHzC9+JQdi4jFZx2cj6BwHO0vhb0ILG/ip9OQovNrat0nObEJYRmvvqWAMHVHDFzyL
 ZXp6hnLIVxS50EEE83+72GXmyCOKmwDxi4beY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vxxQ9gocXfWXOuxXjHODE4zl7ezUzHUPAtWaBg80uZI=;
 b=ZxMMmMm0Wggs1Qr+3X6othpODUD3mJ3hCZZ8Jk4R/pPwf4tBbLHGNY3UzBkXu9Sx1g
 F/MNQ/9zV1BjBLy/wS9zdnxR2r4eOuhZAyl6D2sTwzyMh2ygz6gQlS2w3kAybm+tngqq
 8kXxy3xIZn3CtTbSO7/QNL+C1dSPXK2wP778hjNosxbLW16Vh6bKKM5MpCMR9ud9m6O9
 JvAQCLJtD4AP578LqZvyxv7aYEChbmdBgyoFvTWPvExXgaag/INgqOl80OEtP9POiNyy
 uWDOh5jLS6cVtjbAFsI9R42m6BSmiq5VZiTD3a64XVIWKJLaktQbf8YDiBXeSgZMuXgk
 8aFg==
X-Gm-Message-State: AOAM531CdnZmBjTUNkDMGJQbNZs3qE6EwJSA4+/yeDjBU13y168Gtb4O
 9pAPHAX1j99GFWkzmT+DNOyh4zzm71icGPC5uSw=
X-Google-Smtp-Source: ABdhPJwlqhxTg6QiPUsq1lIx7VWPSYa7cf+CzELJzw9BudDY1a4FEUG1/WPq1FhIt3yC6bJ2JGCN4Eemy8FyMmw+Fu8=
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr2419882qta.176.1601939165341; 
 Mon, 05 Oct 2020 16:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <1601504817-16752-1-git-send-email-lancelot.kao@fii-usa.com>
 <20201001123249.GC6152@heinlein>
In-Reply-To: <20201001123249.GC6152@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Oct 2020 23:05:53 +0000
Message-ID: <CACPK8XewuMZTvhh7QA6iBbkH5AqQWS9RVeZXaAF-XzAYhYsG1A@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] hwmon: Ampere Computing ALTRA SMPMPRO
 sensor driver
To: Patrick Williams <patrick@stwcx.xyz>, linux-hwmon@vger.kernel.org
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Lancelot <lancelot.kao@fii-usa.com>,
 Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 1 Oct 2020 at 12:32, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 30, 2020 at 05:26:57PM -0500, Lancelot wrote:
> > From: Lancelot Kao <lancelot.kao@fii-usa.com>
> >
> > Add SMPMPro-hwmon driver to monitor Ampere CPU/Memory/VR via an
> > i2c interface of the CPU's smpmpro management device.
> >
> > Signed-off-by: Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
> > Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
>
> Nice work at adding this driver.
>
> It does look like you've missed CC'ing upstream though.  Was this
> intentional?  (linux-hwmon@vger.kernel.org)

As Patrick mentioned, let's review this on the upstream list.

Cheers,

Joel

>
> > +/* Capability Registers  */
> > +#define TEMP_SENSOR_SUPPORT_REG      0x05
> > +#define PWR_SENSOR_SUPPORT_REG       0x06
> > +#define VOLT_SENSOR_SUPPORT_REG      0x07
> > +#define OTHER_CAP_REG                    0x08
> > +#define CORE_CLUSTER_CNT_REG 0x0B
> > +#define SYS_CACHE_PCIE_CNT_REG       0x0C
> > +#define SOCKET_INFO_REG              0x0D
>
> There seems to be some sporatic indentation throughout all the #defines
> in this file, where it appears you attempted to align the values.  Make
> sure you have tabs set to 8-step spacing for kernel code.
>
> > +static void smpmpro_init_device(struct i2c_client *client,
> > +                             struct smpmpro_data *data)
> > +{
> > +     u16 ret;
> > +
> > +     ret = i2c_smbus_read_word_swapped(client, TEMP_SENSOR_SUPPORT_REG);
> > +     if (ret < 0)
> > +             return;
> > +     data->temp_support_regs = ret;
>
> i2c_smbus_read_word_swapped returns a s32 even though you're looking for
> a u16.  By setting `ret` to u16 you've caused two problems:
>
>     * You are immediately truncating -ERRNO values into a u16 so that
>       you are unable to differentiate values like 0xFFFFFFFF as a
>       register value and -1 as an errno.
>
>     * The if condition here can never be true, so you're never catching
>       error conditions.  (An u16 can never be negative, so ret < 0 can
>       never be true.)
>
> This issue occurs throughout the driver.
>
> > +static int smpmpro_read_temp(struct device *dev, u32 attr, int channel,
> > +                          long *val)
> > +{
> > +     struct smpmpro_data *data = dev_get_drvdata(dev);
> > +     struct i2c_client *client = data->client;
> > +     int ret;
>
> You might want a sized int on this one?  Repeated in most other
> functions.
>
> > +static int smpmpro_read_power(struct device *dev, u32 attr, int channel,
> > +                          long *val)
> > +{
> > +     struct smpmpro_data *data = dev_get_drvdata(dev);
> > +     struct i2c_client *client = data->client;
> > +     int ret, ret_mw;
> > +     int ret2 = 0, ret2_mw = 0;
>
> Any reason to not initialize ret/ret_mw?  By it being different from
> ret2/ret2_mw it makes me question "is this ok?", which spends more time
> in review.
>
> > +static int smpmpro_i2c_probe(struct i2c_client *client,
> > +                       const struct i2c_device_id *id)
> ...
> > +     /* Initialize the Altra SMPMPro chip */
> > +     smpmpro_init_device(client, data);
>
> I didn't see anything in the smpmpro_init_device function, but is there
> anything you can or should do to ensure this device really is an
> SMPMPro rather than exclusively relying on the device tree compatible?
>
> > +static struct i2c_driver smpmpro_driver = {
> > +     .class          = I2C_CLASS_HWMON,
> > +     .probe          = smpmpro_i2c_probe,
> > +     .driver = {
> > +             .name   = "smpmpro",
> > +     },
> > +     .id_table       = smpmpro_i2c_id,
> > +};
> > +
> > +module_i2c_driver(smpmpro_driver);
>
> Are you missing the .of_match_table inside .driver?  Is that necessary
> or useful for your use?  I'm not sure if you can have device tree
> entries that automatically instantiate the hwmon driver otherwise.
>
> --
> Patrick Williams
