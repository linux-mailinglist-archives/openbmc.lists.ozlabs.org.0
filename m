Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5527F90C
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 07:30:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C21tT3jQLzDqSt
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 15:30:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uSUNB1YV; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C21sZ64CszDqSt
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 15:29:47 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id w16so4154742qkj.7
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 22:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zhY5hxIQkMTQaQ3nm7tEbfUHYEvpPQmlr9WcnS8917k=;
 b=uSUNB1YV1xnHksocWCene6AYfImFzQe38OeAIIpF2pXuVPgqmJebEZzs8DSzWz0od8
 ji7f+nFXQmoXXiaeKy4UaG2djRyE6mZ3fUvHR5/agPA2dTlaMar/T5nIasN+tnOpbJ0f
 o+0Ja2Ard0/NH5M4gE0Xpt1ErwFWKISSg8q72J3Fw3uK6IQebb99cSLlCpcui73d+M20
 NXvbv2S0mPg+nlPWb8IfcxKHdFURFLmKElqnXZnt6dHLVTKHcgofpf3vqVCfTK6idjBS
 KdWrKH//+EWHMBOiex0fSBIBy0wPjvZ6z6wbakp48M3guMWBoSZyCjgqpZpJa4JEaLMx
 vNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zhY5hxIQkMTQaQ3nm7tEbfUHYEvpPQmlr9WcnS8917k=;
 b=Vbox5+M2KsVoOyQo/BLc3ZNDJTFOSULg4m2W0yR1jScfR/fXb7Wf7Lq2lqsGlBDo4L
 v2O1Yul6duItXsxpmKoKC0ypmM6+C6gVaaq7VfGUR2dIGaAr3NqhV0MxJq+4/GtWS8mD
 RJy9z+LbMXMiG5TJHUi1gc8he20HPHAcCAzP1GdDfIA/0Lgzw/M4rBsqFK47m5mzsQmV
 PrHqiWNBgZ0Wjt+Act2dJ77bCG0i8gNUzokWRGr8I93PZxI6+MgCH9h1u3K5LdB29XVg
 fmobggskQT7irzyJzWgNzqRKgHOUEPyTl2+2MkrKJ9CH4zSsabQNomgod6WzLO6ZoIms
 ppew==
X-Gm-Message-State: AOAM530GX3ehrQOgXNFNTYkLd5vkN7StkDYkBPy3GMkQugPZmgeCt5wZ
 35jgaS88tl+u0u+XX2WMlyiUn0/SXiWCxVgsc0s=
X-Google-Smtp-Source: ABdhPJwFIcT/1nd4aA8mRqtPX7Afn5mDgHKLPqj0BEqHV6EY6auuZ5x+TyxSUGlFdRvfF7aKpN4c+3WG+ng0xQs5nPw=
X-Received: by 2002:ae9:e914:: with SMTP id x20mr5979986qkf.163.1601530181916; 
 Wed, 30 Sep 2020 22:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com>
 <20200930093117.GY3956970@smile.fi.intel.com>
In-Reply-To: <20200930093117.GY3956970@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 1 Oct 2020 08:32:02 +0300
Message-ID: <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Alex Qiu <xqiu@google.com>, Benjamin Fair <benjaminfair@google.com>,
 avifishman70@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 30, 2020 at 12:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 30, 2020 at 10:13:42AM +0300, Tali Perry wrote:
> > Systems that can dinamically add and remove slave devices
>
> dynamically
>
> > often need to change the bus speed in runtime.
>
> > This patch exposes the bus frequency to the user.
>
> Expose the bus frequency to the user.
>
> > This feature can also be used for test automation.
>
> In general I think that DT overlays or so should be user rather than this.
> If we allow to change bus speed settings for debugging purposes it might make
> sense to do this on framework level for all drivers which support that (via
> additional callback or so).

Do you mean adding something like this:

struct i2c_algorithm {
/*
* If an adapter algorithm can't do I2C-level access, set master_xfer
* to NULL. If an adapter algorithm can do SMBus access, set
* smbus_xfer. If set to NULL, the SMBus protocol is simulated
* using common I2C messages.
*
* master_xfer should return the number of messages successfully
* processed, or a negative value on error
*/
int (*master_xfer)(struct i2c_adapter *adap, struct i2c_msg *msgs,
  int num);
....
int (*set_speed)(struct i2c_adapter *adap, unsigned int speed);
....
/* To determine what the adapter supports */
u32 (*functionality)(struct i2c_adapter *adap);

...
};

And expose this feature in functionality?


>
> > Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 36 ++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> > index 2ad166355ec9..44e2340c1893 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2208,6 +2208,41 @@ static const struct i2c_algorithm npcm_i2c_algo = {
> >  /* i2c debugfs directory: used to keep health monitor of i2c devices */
> >  static struct dentry *npcm_i2c_debugfs_dir;
> >
> > +static int i2c_speed_get(void *data, u64 *val)
> > +{
> > +     struct npcm_i2c *bus = data;
> > +
> > +     *val = (u64)bus->bus_freq;
> > +     return 0;
> > +}
> > +
> > +static int i2c_speed_set(void *data, u64 val)
> > +{
> > +     struct npcm_i2c *bus = data;
> > +     int ret;
> > +
> > +     if (val < (u64)I2C_FREQ_MIN_HZ || val > (u64)I2C_FREQ_MAX_HZ)
> > +             return -EINVAL;
> > +
> > +     if (val == (u64)bus->bus_freq)
> > +             return 0;
> > +
> > +     i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> > +
> > +     npcm_i2c_int_enable(bus, false);
> > +
> > +     ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
> > +
> > +     i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
>
> While all these explicit castings?
>
> > +
> > +     if (ret)
> > +             return -EAGAIN;
> > +
> > +     return 0;
> > +}
>
> > +
>
> No need to have this blank line
>
> > +DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%lld\n");
> > +
> >  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
> >                                 struct npcm_i2c *bus)
> >  {
> > @@ -2223,6 +2258,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
> >       debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
> >       debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
> >       debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> > +     debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
> >
> >       bus->debugfs = d;
> >  }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
