Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951552B0A0
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 05:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2yh22wVkz3bqm
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 13:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h6EOZxPo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h6EOZxPo; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2ygY3rJqz2ypZ
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 13:11:20 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id bu29so1413445lfb.0
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IXJq1+R1QxtlpTzPAlkqxkXDPTpOwJq3evXUikAcpDo=;
 b=h6EOZxPoZ8vufrcLlsXBs8T52aRQMNwCTbIg51IMauYovCcYmvwW0XpJ8S2H+Y94Cn
 W50Kpdv4rHDew00/Gy/DaVhbqcDU4tXJaPw1i5ZlP9vatqwJ+5KRMPZSkN7mMsNQZ08B
 nGEIJlQhGwnnHek0htUSPxBL0PasiuRJIr5vJClTcUJDDqzseTSGdJzZZseAAptOiS0v
 mUoSJhoVA7+eF4ydjCVzkWfJXmJ4ZPrepUdJOutUt5/eY5+Azsz2c+CjuhkgP2pl7Y1G
 ACKwzUjOYXUbwb1ShCJpr421ByISZrKpVhdmG6tR2kl5bIR8kokzcDCtXR8Aej7orikq
 5/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IXJq1+R1QxtlpTzPAlkqxkXDPTpOwJq3evXUikAcpDo=;
 b=eAtFX1ZArkGlBetTaEW/VVBJ4yXx9WeEHBSwM7++uzRyPzP3qjnKwGWSsQ+NS8bKSj
 v/BttA+wvXGpw8OD0bdOojbMZOaIfcy/Agg0RDZyUAlhTiipdm4KLT38HF8jLn7d0GFd
 aCp6XJoZBF5gMwsC52G1GSKWuCsDWvlprvQwKgRjd4M1sZ4QA8QHP31OxUTUJcvCNuzz
 Xbr4RwlR5gpnZurxiC8jLVE7JhXwVGYuOsCIOhoF1pEfJeQngnYq5EGv/dtGkLqoH/a+
 gIpyArcayN6/Y4NrO2ThQF16juzLqggzV/l74lsTLYiiOdMnHuu0+AgPlhYAzgOmR0dy
 etQQ==
X-Gm-Message-State: AOAM533t/cYkfrImA7TPnrmjFRN2197Lgca5k51BP5oS3jCt7+2uGaTR
 PrtEreExGQB/J5NLC78vvk3G85tPcTXVudXZyZY=
X-Google-Smtp-Source: ABdhPJz8EDpS6WCV78uSJBbPuJsPvLqOP6A6WbY4uNX1/EcJTY/IaQZjddzysCWmEKdeZnEq9v9IzmjLrd/T7iKtz/o=
X-Received: by 2002:a05:6512:39c4:b0:475:b040:904d with SMTP id
 k4-20020a05651239c400b00475b040904dmr18212749lfu.185.1652843471178; Tue, 17
 May 2022 20:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220517092927.19537-1-ctcchien@nuvoton.com>
 <20220517092927.19537-4-ctcchien@nuvoton.com>
 <YoPzaSc/8BBVWWsB@mail.local>
In-Reply-To: <YoPzaSc/8BBVWWsB@mail.local>
From: Medad Young <medadyoung@gmail.com>
Date: Wed, 18 May 2022 11:11:00 +0800
Message-ID: <CAHpyw9fw54hQrsPa4psbUs2VfBqHj+gMKDceL2N5k8_jU+434w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, YSCHU@nuvoton.com,
 Tomer Maimon <tmaimon77@gmail.com>, KWLIU@nuvoton.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, KFTING <KFTING@nuvoton.com>,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Alexandre,

thanks for your comments.

Alexandre Belloni <alexandre.belloni@bootlin.com> =E6=96=BC 2022=E5=B9=B45=
=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=883:11=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Hello,
>
> Thank you for your submission. There are a bunch of checkpatch --strict i=
ssues,
> please fix them.
>
> On 17/05/2022 17:29:26+0800, Medad CChien wrote:
> > Add real time clock support for NCT3018Y.
>
> Is the NCT3018Y an SoC or a discrete RTC?

NCT3018Y is a discrete RTC

>
> >
> > Fix the following warnings and errors:
> > error:
> >    drivers/rtc/rtc-nct3018y.c:513:39: warning: format '%d' expects argu=
ment of type 'int', but argument 5 has type 'long unsigned int'
> >    drivers/rtc/rtc-nct3018y.c:513:39: warning: format '%d' expects argu=
ment of type 'int', but argument 5 has type 'long unsigned int'
> > warnings:
> >    drivers/rtc/rtc-nct3018y.c:192:26: warning: unused variable 'nct3018=
y'
> >    drivers/rtc/rtc-nct3018y.c:513:39: warning: format '%d' expects argu=
ment of type 'int', but argument 5 has type 'long unsigned int'
> > Reported-by: kernel test robot <lkp@intel.com>
> >
>
> This part doesn't belong in the commit message as the patch introducing
> the issue will never be upstream

OK, I got your point,
I will remove this part.

>
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > ---
> >  drivers/rtc/Kconfig        |  10 +
> >  drivers/rtc/Makefile       |   1 +
> >  drivers/rtc/rtc-nct3018y.c | 592 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 603 insertions(+)
> >  create mode 100644 drivers/rtc/rtc-nct3018y.c
> >
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index d85a3c31347c..d83d31c76443 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -383,6 +383,16 @@ config RTC_DRV_MAX77686
> >         This driver can also be built as a module. If so, the module
> >         will be called rtc-max77686.
> >
> > +config RTC_DRV_NCT3018Y
> > +     tristate "Nuvoton Real Time Clock"
>
> This definitively needs a better description

OK, I will add a better description.
>
> > +     depends on OF
> > +     help
> > +        If you say yes here you get support for the Nuvoton NCT3018Y R=
TC
> > +        module.
> > +
> > +        This driver can also be built as a module, if so, the module w=
ill
> > +        be called "rtc-nct3018y".
> > +
> >  config RTC_DRV_RK808
> >       tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
> >       depends on MFD_RK808
> > diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> > index e92f3e943245..d3c100e43d1f 100644
> > --- a/drivers/rtc/Makefile
> > +++ b/drivers/rtc/Makefile
> > @@ -112,6 +112,7 @@ obj-$(CONFIG_RTC_DRV_MV)  +=3D rtc-mv.o
> >  obj-$(CONFIG_RTC_DRV_MXC)    +=3D rtc-mxc.o
> >  obj-$(CONFIG_RTC_DRV_MXC_V2) +=3D rtc-mxc_v2.o
> >  obj-$(CONFIG_RTC_DRV_GAMECUBE)       +=3D rtc-gamecube.o
> > +obj-$(CONFIG_RTC_DRV_NCT3018Y)       +=3D rtc-nct3018y.o
> >  obj-$(CONFIG_RTC_DRV_NTXEC)  +=3D rtc-ntxec.o
> >  obj-$(CONFIG_RTC_DRV_OMAP)   +=3D rtc-omap.o
> >  obj-$(CONFIG_RTC_DRV_OPAL)   +=3D rtc-opal.o
> > diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
> > new file mode 100644
> > index 000000000000..4b2e66be8064
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-nct3018y.c
> > @@ -0,0 +1,592 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2022 Nuvoton Technology Corporation
> > +
> > +#include <linux/bcd.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/rtc.h>
> > +#include <linux/slab.h>
> > +
> > +#define NCT3018Y_REG_SC              0x00 /* seconds */
> > +#define NCT3018Y_REG_SCA     0x01 /* alarm */
> > +#define NCT3018Y_REG_MN              0x02
> > +#define NCT3018Y_REG_MNA     0x03 /* alarm */
> > +#define NCT3018Y_REG_HR              0x04
> > +#define NCT3018Y_REG_HRA     0x05 /* alarm */
> > +#define NCT3018Y_REG_DW              0x06
> > +#define NCT3018Y_REG_DM              0x07
> > +#define NCT3018Y_REG_MO              0x08
> > +#define NCT3018Y_REG_YR              0x09
> > +#define NCT3018Y_REG_CTRL    0x0A /* timer control */
> > +#define NCT3018Y_REG_ST              0x0B /* status */
> > +#define NCT3018Y_REG_CLKO    0x0C /* clock out */
> > +
> > +#define NCT3018Y_BIT_AF              BIT(7)
> > +#define NCT3018Y_BIT_ST              BIT(7)
> > +#define NCT3018Y_BIT_DM              BIT(6)
> > +#define NCT3018Y_BIT_HF              BIT(5)
> > +#define NCT3018Y_BIT_DSM     BIT(4)
> > +#define NCT3018Y_BIT_AIE     BIT(3)
> > +#define NCT3018Y_BIT_OFIE    BIT(2)
> > +#define NCT3018Y_BIT_CIE     BIT(1)
> > +#define NCT3018Y_BIT_TWO     BIT(0)
> > +
> > +#define NCT3018Y_REG_CLKO_F_MASK     0x03 /* frequenc mask */
> > +#define NCT3018Y_REG_CLKO_CKE                0x80 /* clock out enabled=
 */
> > +
> > +static struct i2c_driver nct3018y_driver;
>
> I prefer we avoid this forward declaration.

Ok, I will try to avoid it.

>
> > +
> > +struct nct3018y {
> > +     struct rtc_device *rtc;
> > +     struct i2c_client *client;
> > +     struct gpio_desc *wakeup_host;
> > +#ifdef CONFIG_COMMON_CLK
> > +     struct clk_hw           clkout_hw;
> > +#endif
> > +};
> > +
> > +static int nct3018y_read_block_data(struct i2c_client *client,
> > +                                 unsigned char reg, unsigned char leng=
th, unsigned char *buf)
> > +{
> > +     struct i2c_msg msgs[] =3D {
> > +             {/* setup read ptr */
> > +                     .addr =3D client->addr,
> > +                     .len =3D 1,
> > +                     .buf =3D &reg,
> > +             },
> > +             {
> > +                     .addr =3D client->addr,
> > +                     .flags =3D I2C_M_RD,
> > +                     .len =3D length,
> > +                     .buf =3D buf
> > +             },
> > +     };
> > +
> > +     if ((i2c_transfer(client->adapter, msgs, 2)) !=3D 2) {
> > +             dev_err(&client->dev, "%s: read error\n", __func__);
>
> Please cut down on the error messages most of them will never be useful
> but will take some space. Also, you should probably use regmap instead
> of rolling your own function.
>

OK

> > +             return -EIO;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct3018y_write_block_data(struct i2c_client *client,
> > +                                  unsigned char reg, unsigned char len=
gth,
> > +                                  unsigned char *buf)
> > +{
> > +     int i, err;
> > +
> > +     for (i =3D 0; i < length; i++) {
> > +             unsigned char data[2] =3D { reg + i, buf[i] };
> > +
> > +             err =3D i2c_master_send(client, data, sizeof(data));
> > +             if (err !=3D sizeof(data)) {
> > +                     dev_err(&client->dev, "%s: err=3D%d addr=3D%02x, =
data=3D%02x\n", __func__,
> > +                             err, data[0], data[1]);
> > +                     return -EIO;
> > +             }
>
> Are you sure you need to send data byte per byte?

OK, I will try to modify

>
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
> > +{
> > +     unsigned char buf;
> > +     int err;
> > +
> > +     dev_dbg(&client->dev, "%s:on:%d\n", __func__, on);
> > +     err =3D nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1, &b=
uf);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     if (on)
> > +             buf |=3D NCT3018Y_BIT_AIE;
> > +     else
> > +             buf &=3D ~NCT3018Y_BIT_AIE;
> > +
> > +     buf |=3D NCT3018Y_BIT_CIE;
> > +     err =3D nct3018y_write_block_data(client, NCT3018Y_REG_CTRL, 1, &=
buf);
> > +     if (err < 0) {
> > +             dev_err(&client->dev, "%s: write NCT3018Y_REG_ST error\n"=
, __func__);
> > +             return -EIO;
> > +     }
> > +
> > +     err =3D nct3018y_read_block_data(client, NCT3018Y_REG_ST, 1, &buf=
);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     buf &=3D ~(NCT3018Y_BIT_AF);
> > +     err =3D nct3018y_write_block_data(client, NCT3018Y_REG_ST, 1, &bu=
f);
> > +     if (err < 0) {
> > +             dev_err(&client->dev, "%s: write NCT3018Y_REG_ST error\n"=
, __func__);
> > +             return -EIO;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct3018y_get_alarm_mode(struct i2c_client *client, unsigned=
 char *alarm_enable,
> > +                               unsigned char *alarm_flag)
> > +{
> > +     unsigned char buf;
> > +     int err;
> > +
> > +     if (alarm_enable) {
> > +             dev_dbg(&client->dev, "%s:NCT3018Y_REG_CTRL\n", __func__)=
;
> > +             err =3D nct3018y_read_block_data(client, NCT3018Y_REG_CTR=
L, 1, &buf);
> > +             if (err)
> > +                     return err;
> > +             *alarm_enable =3D buf & NCT3018Y_BIT_AIE;
> > +     }
> > +
> > +     if (alarm_flag) {
> > +             dev_dbg(&client->dev, "%s:NCT3018Y_REG_ST\n", __func__);
> > +             err =3D nct3018y_read_block_data(client, NCT3018Y_REG_ST,=
 1, &buf);
> > +             if (err)
> > +                     return err;
> > +             *alarm_flag =3D buf & NCT3018Y_BIT_AF;
> > +     }
> > +
> > +     dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
> > +             __func__, *alarm_enable, *alarm_flag);
> > +
> > +     return 0;
> > +}
> > +
> > +static irqreturn_t nct3018y_irq(int irq, void *dev_id)
> > +{
> > +     struct nct3018y *nct3018y =3D i2c_get_clientdata(dev_id);
> > +     struct i2c_client *client =3D nct3018y->client;
> > +     int err;
> > +     unsigned char alarm_flag;
> > +     unsigned char alarm_enable;
> > +
> > +     dev_dbg(&client->dev, "%s:irq:%d\n", __func__, irq);
> > +     err =3D nct3018y_get_alarm_mode(nct3018y->client, &alarm_enable, =
&alarm_flag);
> > +     if (err)
> > +             return IRQ_NONE;
> > +
> > +     if (alarm_flag) {
> > +             dev_dbg(&client->dev, "%s:alarm flag:%x\n",
> > +                     __func__, alarm_flag);
> > +             rtc_update_irq(nct3018y->rtc, 1, RTC_IRQF | RTC_AF);
> > +             nct3018y_set_alarm_mode(nct3018y->client, 1);
>
> Doesn't that rearm the alarm? I would expect the opposite here.

OK.

>
> > +             dev_dbg(&client->dev, "%s:IRQ_HANDLED\n", __func__);
> > +             return IRQ_HANDLED;
> > +     }
> > +
> > +     return IRQ_NONE;
> > +}
> > +
> > +/*
> > + * In the routines that deal directly with the nct3018y hardware, we u=
se
> > + * rtc_time -- month 0-11, hour 0-23, yr =3D calendar year-epoch.
> > + */
> > +static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time =
*tm)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     unsigned char buf[10];
> > +     int err;
> > +
> > +     err =3D nct3018y_read_block_data(client, NCT3018Y_REG_ST, 1, buf)=
;
> > +     if (err)
> > +             return err;
> > +
> > +     if (!buf[0]) {
> > +             dev_err(&client->dev, " voltage <=3D1.7, date/time is not=
 reliable.\n");
>
> This error message is not actually useful, implement the RTC_VL_READ
> ioctl instead.

OK, I will check how other RTC drivers do.

>
> > +             return -EINVAL;
> > +     }
> > +
> > +     err =3D nct3018y_read_block_data(client, NCT3018Y_REG_SC, 10, buf=
);
> > +     if (err)
> > +             return err;
> > +
> > +     tm->tm_sec =3D bcd2bin(buf[0] & 0x7F);
> > +     tm->tm_min =3D bcd2bin(buf[2] & 0x7F);
> > +     tm->tm_hour =3D bcd2bin(buf[4] & 0x3F); /* rtc hr 0-24 */
>
> This comment is not accurate, as shown by the comment on top of the
> function. I would prefer no comment in that case.

OK

>
> > +     tm->tm_wday =3D buf[6] & 0x07;
> > +     tm->tm_mday =3D bcd2bin(buf[7] & 0x3F);
> > +     tm->tm_mon =3D bcd2bin(buf[8] & 0x1F) - 1 ; /* rtc mn 1-12 */
> > +     tm->tm_year =3D bcd2bin(buf[9]) + 100;
> > +
> > +     dev_dbg(&client->dev, "%s:s=3D%d, m=3D%d, hr=3D%d, md=3D%d, m=3D%=
d, yr=3D%d, wd=3D%d\n",
> > +             __func__, tm->tm_sec, tm->tm_min, tm->tm_hour, tm->tm_mda=
y, tm->tm_mon,
> > +             tm->tm_year, tm->tm_wday);
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *=
tm)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     unsigned char buf[10] =3D {0};
> > +     int err;
> > +
> > +     dev_dbg(&client->dev, "%s:s=3D%d, m=3D%d, hr=3D%d, md=3D%d, m=3D%=
d, yr=3D%d, wd=3D%d\n",
> > +             __func__, tm->tm_sec, tm->tm_min, tm->tm_hour, tm->tm_mda=
y, tm->tm_mon,
> > +             tm->tm_year, tm->tm_wday);
> > +
> > +     err =3D nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1, bu=
f);
> > +     if (err)
> > +             return err;
> > +
> > +     if (!(buf[0] & NCT3018Y_BIT_TWO)) {
> > +             dev_err(&client->dev,
> > +                     " TWO is not set.\n");
>
> This is not useful, what is TWO?

TWO stands for Time Registers Write Ownership
for NCT3018Y, driver needs to set this bit before writing to other register=
s

>
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* hours, minutes and seconds */
> > +     buf[NCT3018Y_REG_SC] =3D bin2bcd(tm->tm_sec);
> > +     buf[NCT3018Y_REG_MN] =3D bin2bcd(tm->tm_min);
> > +     buf[NCT3018Y_REG_HR] =3D bin2bcd(tm->tm_hour);
> > +     buf[NCT3018Y_REG_DW] =3D tm->tm_wday & 0x07;
> > +     buf[NCT3018Y_REG_DM] =3D bin2bcd(tm->tm_mday);
> > +
> > +     /* month, 1 - 12 */
> > +     buf[NCT3018Y_REG_MO] =3D bin2bcd(tm->tm_mon+1);
> > +
> > +     /* year and century */
>
> Were is the century?

I will update the comment, for there is no century.

>
> > +     buf[NCT3018Y_REG_YR] =3D bin2bcd(tm->tm_year - 100);
> > +
> > +     return nct3018y_write_block_data(client, NCT3018Y_REG_SC, 10, buf=
);
> > +}
> > +
> > +static int nct3018y_rtc_read_alarm(struct device *dev, struct rtc_wkal=
rm *tm)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     unsigned char buf[5];
> > +     int err;
> > +
> > +     err =3D nct3018y_read_block_data(client, NCT3018Y_REG_SCA, 5, buf=
);
> > +     if (err)
> > +             return err;
> > +
> > +     dev_dbg(&client->dev, "%s: raw data is sec=3D%02x, min=3D%02x hr=
=3D%02x\n",
> > +             __func__, buf[0], buf[2], buf[4]);
> > +
> > +     tm->time.tm_sec =3D bcd2bin(buf[0] & 0x7F);
> > +     tm->time.tm_min =3D bcd2bin(buf[2] & 0x7F);
> > +     tm->time.tm_hour =3D bcd2bin(buf[4] & 0x3F);
> > +
> > +     err =3D nct3018y_get_alarm_mode(client, &tm->enabled, &tm->pendin=
g);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     dev_dbg(&client->dev, "%s:s=3D%d m=3D%d, hr=3D%d, enabled=3D%d, p=
ending=3D%d\n",
> > +             __func__, tm->time.tm_sec, tm->time.tm_min,
> > +             tm->time.tm_hour, tm->enabled, tm->pending);
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct3018y_rtc_set_alarm(struct device *dev, struct rtc_wkalr=
m *tm)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     unsigned char buf[3];
> > +     int err;
> > +
> > +     dev_dbg(dev, "%s, sec=3D%d, min=3D%d hour=3D%d tm->enabled:%d\n",
> > +             __func__, tm->time.tm_sec, tm->time.tm_min, tm->time.tm_h=
our,
> > +             tm->enabled);
> > +
> > +     buf[0] =3D bin2bcd(tm->time.tm_sec);
> > +     buf[1] =3D bin2bcd(tm->time.tm_min);
> > +     buf[2] =3D bin2bcd(tm->time.tm_hour);
> > +
> > +     err =3D nct3018y_write_block_data(client, NCT3018Y_REG_SCA, 1, bu=
f);
> > +     if (err)
> > +             return err;
>
>
> Writing byte per byte opens a huge window for a race condition here.
>

I write byte per byte,
because these three registers are not continuous

> > +
> > +     err =3D nct3018y_write_block_data(client, NCT3018Y_REG_MNA, 1, bu=
f+1);
> > +     if (err)
> > +             return err;
> > +
> > +     err =3D nct3018y_write_block_data(client, NCT3018Y_REG_HRA, 1, bu=
f+2);
> > +     if (err)
> > +             return err;
> > +
> > +     return nct3018y_set_alarm_mode(client, tm->enabled);
> > +}
> > +
> > +static int nct3018y_irq_enable(struct device *dev, unsigned int enable=
d)
> > +{
> > +     dev_dbg(dev, "%s: alarm enable=3D%d\n", __func__, enabled);
> > +
> > +     return nct3018y_set_alarm_mode(to_i2c_client(dev), enabled);
> > +}
> > +
> > +#ifdef CONFIG_COMMON_CLK
> > +/*
> > + * Handling of the clkout
> > + */
> > +
> > +#define clkout_hw_to_nct3018y(_hw) container_of(_hw, struct nct3018y, =
clkout_hw)
> > +
> > +static const int clkout_rates[] =3D {
> > +     32768,
> > +     1024,
> > +     32,
> > +     1,
> > +};
> > +
> > +static unsigned long nct3018y_clkout_recalc_rate(struct clk_hw *hw,
> > +                                              unsigned long parent_rat=
e)
> > +{
> > +     struct nct3018y *nct3018y =3D clkout_hw_to_nct3018y(hw);
> > +     struct i2c_client *client =3D nct3018y->client;
> > +     unsigned char buf;
> > +     int ret =3D nct3018y_read_block_data(client, NCT3018Y_REG_CLKO, 1=
, &buf);
> > +
> > +     if (ret < 0)
> > +             return 0;
> > +
> > +     buf &=3D NCT3018Y_REG_CLKO_F_MASK;
> > +     return clkout_rates[buf];
> > +}
> > +
> > +static long nct3018y_clkout_round_rate(struct clk_hw *hw, unsigned lon=
g rate,
> > +                                    unsigned long *prate)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(clkout_rates); i++)
> > +             if (clkout_rates[i] <=3D rate)
> > +                     return clkout_rates[i];
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct3018y_clkout_set_rate(struct clk_hw *hw, unsigned long r=
ate,
> > +                                unsigned long parent_rate)
> > +{
> > +     struct nct3018y *nct3018y =3D clkout_hw_to_nct3018y(hw);
> > +     struct i2c_client *client =3D nct3018y->client;
> > +     unsigned char buf;
> > +     int ret =3D nct3018y_read_block_data(client, NCT3018Y_REG_CLKO, 1=
, &buf);
> > +     int i;
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(clkout_rates); i++)
> > +             if (clkout_rates[i] =3D=3D rate) {
> > +                     buf &=3D ~NCT3018Y_REG_CLKO_F_MASK;
> > +                     buf |=3D i;
> > +                     ret =3D nct3018y_write_block_data(client, NCT3018=
Y_REG_CLKO, 1, &buf);
> > +                     return ret;
> > +             }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int nct3018y_clkout_control(struct clk_hw *hw, bool enable)
> > +{
> > +     struct nct3018y *nct3018y =3D clkout_hw_to_nct3018y(hw);
> > +     struct i2c_client *client =3D nct3018y->client;
> > +     unsigned char buf;
> > +     int ret =3D nct3018y_read_block_data(client, NCT3018Y_REG_CLKO, 1=
, &buf);
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (enable)
> > +             buf |=3D NCT3018Y_REG_CLKO_CKE;
> > +     else
> > +             buf &=3D ~NCT3018Y_REG_CLKO_CKE;
> > +
> > +     ret =3D nct3018y_write_block_data(client, NCT3018Y_REG_CLKO, 1, &=
buf);
> > +     return ret;
> > +}
> > +
> > +static int nct3018y_clkout_prepare(struct clk_hw *hw)
> > +{
> > +     return nct3018y_clkout_control(hw, 1);
> > +}
> > +
> > +static void nct3018y_clkout_unprepare(struct clk_hw *hw)
> > +{
> > +     nct3018y_clkout_control(hw, 0);
> > +}
> > +
> > +static int nct3018y_clkout_is_prepared(struct clk_hw *hw)
> > +{
> > +     struct nct3018y *nct3018y =3D clkout_hw_to_nct3018y(hw);
> > +     struct i2c_client *client =3D nct3018y->client;
> > +     unsigned char buf;
> > +     int ret =3D nct3018y_read_block_data(client, NCT3018Y_REG_CLKO, 1=
, &buf);
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return buf & NCT3018Y_REG_CLKO_CKE;
> > +}
> > +
> > +static const struct clk_ops nct3018y_clkout_ops =3D {
> > +     .prepare =3D nct3018y_clkout_prepare,
> > +     .unprepare =3D nct3018y_clkout_unprepare,
> > +     .is_prepared =3D nct3018y_clkout_is_prepared,
> > +     .recalc_rate =3D nct3018y_clkout_recalc_rate,
> > +     .round_rate =3D nct3018y_clkout_round_rate,
> > +     .set_rate =3D nct3018y_clkout_set_rate,
> > +};
> > +
> > +static struct clk *nct3018y_clkout_register_clk(struct nct3018y *nct30=
18y)
> > +{
> > +     struct i2c_client *client =3D nct3018y->client;
> > +     struct device_node *node =3D client->dev.of_node;
> > +     struct clk *clk;
> > +     struct clk_init_data init;
> > +     int ret;
> > +     unsigned char buf;
> > +
> > +     /* disable the clkout output */
> > +     buf =3D 0;
> > +     ret =3D nct3018y_write_block_data(client, NCT3018Y_REG_CLKO, 1, &=
buf);
> > +     if (ret < 0)
> > +             return ERR_PTR(ret);
> > +
> > +     init.name =3D "nct3018y-clkout";
> > +     init.ops =3D &nct3018y_clkout_ops;
> > +     init.flags =3D 0;
> > +     init.parent_names =3D NULL;
> > +     init.num_parents =3D 0;
> > +     nct3018y->clkout_hw.init =3D &init;
> > +
> > +     /* optional override of the clockname */
> > +     of_property_read_string(node, "clock-output-names", &init.name);
> > +
> > +     /* register the clock */
> > +     clk =3D devm_clk_register(&client->dev, &nct3018y->clkout_hw);
> > +
> > +     if (!IS_ERR(clk))
> > +             of_clk_add_provider(node, of_clk_src_simple_get, clk);
> > +
> > +     return clk;
> > +}
> > +#endif
> > +
> > +static const struct rtc_class_ops nct3018y_rtc_ops =3D {
> > +     .read_time      =3D nct3018y_rtc_read_time,
> > +     .set_time       =3D nct3018y_rtc_set_time,
> > +     .read_alarm     =3D nct3018y_rtc_read_alarm,
> > +     .set_alarm      =3D nct3018y_rtc_set_alarm,
> > +     .alarm_irq_enable =3D nct3018y_irq_enable,
> > +};
> > +
> > +static int nct3018y_probe(struct i2c_client *client,
> > +                       const struct i2c_device_id *id)
> > +{
> > +     struct nct3018y *nct3018y;
> > +     int err;
> > +     unsigned char buf;
> > +
> > +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> > +             dev_err(&client->dev, "%s: ENODEV\n", __func__);
> > +             return -ENODEV;
> > +     }
> > +
> > +     nct3018y =3D devm_kzalloc(&client->dev, sizeof(struct nct3018y),
> > +                             GFP_KERNEL);
> > +     if (!nct3018y)
> > +             return -ENOMEM;
> > +
> > +     i2c_set_clientdata(client, nct3018y);
> > +     nct3018y->client =3D client;
> > +     device_set_wakeup_capable(&client->dev, 1);
> > +
> > +     err =3D nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1, &b=
uf);
> > +     if (err < 0) {
> > +             dev_err(&client->dev, "%s: read error\n", __func__);
> > +             return err;
> > +     } else if (buf & NCT3018Y_BIT_TWO) {
> > +             dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is :%ld\n",
> > +                     __func__, buf & NCT3018Y_BIT_TWO);
> > +     }
> > +
> > +     buf =3D 0 | NCT3018Y_BIT_TWO;
>
> This seems weird

Ok, I will modify it.

>
> > +     err =3D nct3018y_write_block_data(client, NCT3018Y_REG_CTRL, 1, &=
buf);
> > +     if (err < 0) {
> > +             dev_err(&client->dev, "%s: write fail, so ReadOnly\n", __=
func__);
> > +     } else {
> > +             buf =3D 0;
> > +             err =3D nct3018y_write_block_data(client, NCT3018Y_REG_ST=
, 1, &buf);
> > +             if (err < 0) {
> > +                     dev_err(&client->dev, "%s: write error\n", __func=
__);
> > +                     return err;
> > +             }
> > +     }
> > +
> > +     nct3018y->rtc =3D devm_rtc_allocate_device(&client->dev);
> > +     if (IS_ERR(nct3018y->rtc))
> > +             return PTR_ERR(nct3018y->rtc);
> > +
> > +     nct3018y->rtc->ops =3D &nct3018y_rtc_ops;
> > +     nct3018y->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> > +     nct3018y->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> > +     nct3018y->rtc->set_start_time =3D true;
>
> Do you have a good reason to set set_start_time here?
>

Sorry, I am new here.
I just follow other drivers.
so you think I should not set set_start_time, right?

> > +
> > +     nct3018y->wakeup_host =3D devm_gpiod_get(&client->dev, "host-wake=
up", GPIOD_IN);
> > +     if (IS_ERR(nct3018y->wakeup_host)) {
> > +             err =3D PTR_ERR(nct3018y->wakeup_host);
> > +             dev_err(&client->dev, "could not get host wakeup gpio: %d=
", err);
> > +             return err;
> > +     }
> > +     client->irq =3D gpiod_to_irq(nct3018y->wakeup_host);
>
> I don't get why you need that instead of using client->irq directly
> which is already parsed by the i2c core for you.
>

Ok, I will check it.

> > +
> > +     dev_dbg(&client->dev, "%s: client->irq:%d\n", __func__, client->i=
rq);
> > +
> > +     if (client->irq > 0) {
> > +             err =3D devm_request_threaded_irq(&client->dev, client->i=
rq,
> > +                             NULL, nct3018y_irq,
> > +                             IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
> > +                             nct3018y_driver.driver.name, client);
> > +             if (err) {
> > +                     dev_err(&client->dev, "unable to request IRQ %d\n=
", client->irq);
> > +                     return err;
> > +             }
> > +     }
> > +
> > +     err =3D devm_rtc_register_device(nct3018y->rtc);
> > +     if (err)
> > +             return err;
> > +
>
> By reordering this part, you could simply return
> devm_rtc_register_device().

OK

>
> > +#ifdef CONFIG_COMMON_CLK
> > +     /* register clk in common clk framework */
> > +     nct3018y_clkout_register_clk(nct3018y);
> > +#endif
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct i2c_device_id nct3018y_id[] =3D {
> > +     { "nct3018y", 0 },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, nct3018y_id);
> > +
> > +
> > +static const struct of_device_id nct3018y_of_match[] =3D {
> > +     { .compatible =3D "nuvoton,nct3018y" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, nct3018y_of_match);
> > +
> > +static struct i2c_driver nct3018y_driver =3D {
> > +     .driver         =3D {
> > +             .name   =3D "rtc-nct3018y",
> > +             .of_match_table =3D of_match_ptr(nct3018y_of_match),
> > +     },
> > +     .probe          =3D nct3018y_probe,
> > +     .id_table       =3D nct3018y_id,
> > +};
> > +
> > +module_i2c_driver(nct3018y_driver);
> > +
> > +MODULE_AUTHOR("Medad CChien <ctcchien@nuvoton.com>");
> > +MODULE_DESCRIPTION("Nuvoton NCT3018Y RTC driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.17.1
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

B.R.
Medad
