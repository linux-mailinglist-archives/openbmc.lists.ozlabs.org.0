Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062DF875B07
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 00:21:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JwEp9huL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrQKf5g8Jz3dRd
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 10:21:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JwEp9huL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr1LX0mMVz3d28
	for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2024 18:35:47 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-36523b9fa11so1558375ab.3
        for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2024 23:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709796943; x=1710401743; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6klZq6AmNzVM+PTbG3iiD1mw+FE3TQNzK9Dec3sUVw=;
        b=JwEp9huL7/yBocexLG1WRtR9aixyi2ZKHmAbRhhmyrmJcOzADewJtJ4eenhju3BiCq
         /NQnaRf/lHjBqJVpTqjOQnFK5iK0COqA9H561l9COS42TTH657N6A2VyO0kK7dWOXzQ3
         tTQ7Xrf7q2+5bgfebsyT3gaxrAw1ntwYLRzJj+jIqoTuXUfu+RPv6T+4OBIC8OIsH+XU
         dFxxCtF+urbrbyURvSij/9FgJur/0k2WYFPmf/CGgUgDbJ7NTqfcV26qFvqcg2WOsVT2
         Id+mVgBgvoxA4+CINlUkjWpbaF6t5xptup9tfCa82XvYKHc0U2yr/n/fhcLSR+FxW1rG
         /P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709796943; x=1710401743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6klZq6AmNzVM+PTbG3iiD1mw+FE3TQNzK9Dec3sUVw=;
        b=XxtwBN0ci90++ywEBUadTH1FS2sCi7X0hVGxDqdtd5v8Lx85MvuTa6bcMW6sXCM2yo
         s1H1ON5rF1gzvP+E58sSWR9eph6awHG53H3iukTW60+R0E8R9KZY9HIDlq9qgCw5oyWM
         DPIYkc8Op3iitOS6X7we5GcffdMYBeaGsxNEIsInopqfiob3qCoyWjHAAEQ8R/dX1OXf
         8mSWBAzgzSczSXDytEUubE8mmYMUuDsuIwiQre6kdhP4Ihk9v0SR5qyWsLMTdeXDJSua
         U1CnX5M8PDilb6prXQsxrQTEO5lqpKw8jLQuea4ZddtzKemeTBfkrtTzx0XiWKg07ZQu
         anAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdyKotyk3rBKNJ13iWH7Eb/N9cFnU/VmXJQYsyzJmZAVb616iA0EHGdBsKY3YHdnzfU8KICklCbFociha/i3lZA/zG9Pwr0pI=
X-Gm-Message-State: AOJu0YwfZuU+KUGPQC+p/8C9+lpRyqtG3q3yDwuJLqUDTGAPrBHLHpHL
	JL7yPMgAmuAfNUBIFEiYY61KIaXFXvyzWf+7QU5CzaY+i9VXlozdZiVBVRVmKg/S9edMvB6vo+9
	N8j+DWlba/9zHEJYy1LTjZBESVyE=
X-Google-Smtp-Source: AGHT+IGN33EUdloTeB6A/XXwtUjVayj3HyCq/K/UgigAb8TsWgLjQTuBGZUH8ioiaV618F31xgzAb4wPSjh8tkX4OP4=
X-Received: by 2002:a05:6e02:1687:b0:365:b506:509e with SMTP id
 f7-20020a056e02168700b00365b506509emr26223113ila.17.1709796942857; Wed, 06
 Mar 2024 23:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com> <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <a90ed00c-f836-4fb6-8191-9974937e3eb7@hatter.bewilderbeest.net>
In-Reply-To: <a90ed00c-f836-4fb6-8191-9974937e3eb7@hatter.bewilderbeest.net>
From: Ban Feng <baneric926@gmail.com>
Date: Thu, 7 Mar 2024 15:35:31 +0800
Message-ID: <CALz278Zgfgob573vgWz4PgC7vb=i8xt3kC1hSjo_cQi00B0XAg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 08 Mar 2024 10:18:22 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

On Sat, Mar 2, 2024 at 4:19=E2=80=AFPM Zev Weiss <zev@bewilderbeest.net> wr=
ote:
>
> On Mon, Feb 26, 2024 at 04:56:06PM PST, baneric926@gmail.com wrote:
> >From: Ban Feng <kcfeng0@nuvoton.com>
> >
> >NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
> >
> >Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> >---
> > Documentation/hwmon/index.rst   |   1 +
> > Documentation/hwmon/nct7363.rst |  33 +++
> > MAINTAINERS                     |   2 +
> > drivers/hwmon/Kconfig           |  11 +
> > drivers/hwmon/Makefile          |   1 +
> > drivers/hwmon/nct7363.c         | 412 ++++++++++++++++++++++++++++++++
> > 6 files changed, 460 insertions(+)
> > create mode 100644 Documentation/hwmon/nct7363.rst
> > create mode 100644 drivers/hwmon/nct7363.c
> >
> >diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.r=
st
> >index c7ed1f73ac06..302f954b45be 100644
> >--- a/Documentation/hwmon/index.rst
> >+++ b/Documentation/hwmon/index.rst
> >@@ -165,6 +165,7 @@ Hardware Monitoring Kernel Drivers
> >    mp5990
> >    nct6683
> >    nct6775
> >+   nct7363
> >    nct7802
> >    nct7904
> >    npcm750-pwm-fan
> >diff --git a/Documentation/hwmon/nct7363.rst b/Documentation/hwmon/nct73=
63.rst
> >new file mode 100644
> >index 000000000000..89699c95aa4b
> >--- /dev/null
> >+++ b/Documentation/hwmon/nct7363.rst
> >@@ -0,0 +1,33 @@
> >+.. SPDX-License-Identifier: GPL-2.0
> >+
> >+Kernel driver nct7363
> >+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >+
> >+Supported chip:
> >+
> >+  * Nuvoton NCT7363Y
> >+
> >+    Prefix: nct7363
> >+
> >+    Addresses: I2C 0x20, 0x21, 0x22, 0x23
> >+
> >+Author: Ban Feng <kcfeng0@nuvoton.com>
> >+
> >+
> >+Description
> >+-----------
> >+
> >+The NCT7363Y is a Fan controller which provides up to 16 independent
> >+FAN input monitors, and up to 16 independent PWM output with SMBus inte=
rface.
> >+
> >+
> >+Sysfs entries
> >+-------------
> >+
> >+Currently, the driver supports the following features:
> >+
> >+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >+fanX_input            provide current fan rotation value in RPM
> >+
> >+pwmX                  get or set PWM fan control value.
> >+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >diff --git a/MAINTAINERS b/MAINTAINERS
> >index 7b1efefed7c4..7ca66b713e30 100644
> >--- a/MAINTAINERS
> >+++ b/MAINTAINERS
> >@@ -15089,6 +15089,8 @@ M:     Ban Feng <kcfeng0@nuvoton.com>
> > L:    linux-hwmon@vger.kernel.org
> > S:    Maintained
> > F:    Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> >+F:    Documentation/hwmon/nct7363.rst
> >+F:    drivers/hwmon/nct7363.c
> >
> > NETDEVSIM
> > M:    Jakub Kicinski <kuba@kernel.org>
> >diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> >index a608264da87d..a297b5409b04 100644
> >--- a/drivers/hwmon/Kconfig
> >+++ b/drivers/hwmon/Kconfig
> >@@ -1616,6 +1616,17 @@ config SENSORS_NCT6775_I2C
> >         This driver can also be built as a module. If so, the module
> >         will be called nct6775-i2c.
> >
> >+config SENSORS_NCT7363
> >+      tristate "Nuvoton NCT7363Y"
> >+      depends on I2C
> >+      select REGMAP_I2C
> >+      help
> >+        If you say yes here you get support for the Nuvoton NCT7363Y,
> >+        hardware monitoring chip.
> >+
> >+        This driver can also be built as a module. If so, the module
> >+        will be called nct7363.
> >+
> > config SENSORS_NCT7802
> >       tristate "Nuvoton NCT7802Y"
> >       depends on I2C
> >diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> >index 47be39af5c03..d5e7531204df 100644
> >--- a/drivers/hwmon/Makefile
> >+++ b/drivers/hwmon/Makefile
> >@@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_NCT6775_CORE) +=3D nct6775-core=
.o
> > nct6775-objs                  :=3D nct6775-platform.o
> > obj-$(CONFIG_SENSORS_NCT6775) +=3D nct6775.o
> > obj-$(CONFIG_SENSORS_NCT6775_I2C) +=3D nct6775-i2c.o
> >+obj-$(CONFIG_SENSORS_NCT7363) +=3D nct7363.o
> > obj-$(CONFIG_SENSORS_NCT7802) +=3D nct7802.o
> > obj-$(CONFIG_SENSORS_NCT7904) +=3D nct7904.o
> > obj-$(CONFIG_SENSORS_NPCM7XX) +=3D npcm750-pwm-fan.o
> >diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
> >new file mode 100644
> >index 000000000000..c79d3ca4f111
> >--- /dev/null
> >+++ b/drivers/hwmon/nct7363.c
> >@@ -0,0 +1,412 @@
> >+// SPDX-License-Identifier: GPL-2.0-or-later
> >+/*
> >+ * Copyright (c) 2023 Nuvoton Technology corporation.
> >+ */
> >+
> >+#include <linux/bitfield.h>
> >+#include <linux/bits.h>
> >+#include <linux/err.h>
> >+#include <linux/hwmon.h>
> >+#include <linux/hwmon-sysfs.h>
> >+#include <linux/i2c.h>
> >+#include <linux/module.h>
> >+#include <linux/mutex.h>
> >+#include <linux/regmap.h>
> >+#include <linux/slab.h>
> >+
> >+#define NCT7363_REG_GPIO_0_3          0x20
> >+#define NCT7363_REG_GPIO_4_7          0x21
> >+#define NCT7363_REG_GPIO_10_13                0x22
> >+#define NCT7363_REG_GPIO_14_17                0x23
> >+#define NCT7363_REG_PWMEN_0_7         0x38
> >+#define NCT7363_REG_PWMEN_8_15                0x39
> >+#define NCT7363_REG_FANINEN_0_7               0x41
> >+#define NCT7363_REG_FANINEN_8_15      0x42
> >+#define NCT7363_REG_FANINX_HVAL(x)    (0x48 + ((x) * 2))
> >+#define NCT7363_REG_FANINX_LVAL(x)    (0x49 + ((x) * 2))
> >+#define NCT7363_REG_FSCPXDUTY(x)      (0x90 + ((x) * 2))
> >+
> >+#define PWM_SEL(x)                    (BIT(0) << (((x) % 4) * 2))
> >+#define FANIN_SEL(x)                  (BIT(1) << (((x) % 4) * 2))
> >+
> >+#define NCT7363_FANINX_LVAL_MASK      GENMASK(4, 0)
> >+#define NCT7363_FANIN_MASK            GENMASK(12, 0)
> >+
> >+#define NCT7363_PWM_COUNT             16
> >+
> >+static inline unsigned long FAN_FROM_REG(u16 val)
> >+{
> >+      /* In case fan is stopped or divide by 0 */
> >+      if (val =3D=3D NCT7363_FANIN_MASK || val =3D=3D 0)
> >+              return  0;
> >+
> >+      return (1350000UL / val);
> >+}
> >+
> >+static const struct of_device_id nct7363_of_match[] =3D {
> >+      { .compatible =3D "nuvoton,nct7363" },
>
> As far as I can see from the code in this driver, it looks like this
> driver should also be compatible with the nct7362; shall we add the ID
> table entry for it now?  (Though I only have a datasheet for the
> nct7362, not the nct7363, so I don't know exactly how they differ.)

As far as I know, the difference between these two ICs is 0x2A~0x2C
Fading LED for 7362, and 0x2A Watchdog Timer for 7363.
In my v1 patch, I indeed add the nct7362 to the ID table, however,
this makes it more complicated and our datasheet isn't public yet.
I think maybe supporting more chips will be done in the future, but not now=
.

>
> >+      { },
> >+};
> >+MODULE_DEVICE_TABLE(of, nct7363_of_match);
> >+
> >+struct nct7363_data {
> >+      struct regmap           *regmap;
> >+      struct mutex            lock; /* protect register access */
> >+
> >+      u16                     fanin_mask;
> >+      u16                     pwm_mask;
> >+};
> >+
> >+static int nct7363_read_fan(struct device *dev, u32 attr, int channel,
> >+                          long *val)
> >+{
> >+      struct nct7363_data *data =3D dev_get_drvdata(dev);
> >+      unsigned int hi, lo;
> >+      u16 cnt, rpm;
> >+      int ret =3D 0;
> >+
> >+      switch (attr) {
> >+      case hwmon_fan_input:
> >+              /*
> >+               * High-byte register should be read first to latch
> >+               * synchronous low-byte value
> >+               */
> >+              ret =3D regmap_read(data->regmap,
> >+                                NCT7363_REG_FANINX_HVAL(channel), &hi);
> >+              if (ret)
> >+                      return ret;
> >+
> >+              ret =3D regmap_read(data->regmap,
> >+                      NCT7363_REG_FANINX_LVAL(channel), &lo);
> >+              if (ret)
> >+                      return ret;
>
> I think this pair of reads should be done under data->lock to ensure
> that the LVAL read gets the right latched value in a scenario where
> multiple threads executing this function end up with their register
> reads interleaved.

ok, fix in v5

>
> >+
> >+              cnt =3D (hi << 5) | (lo & NCT7363_FANINX_LVAL_MASK);
> >+              rpm =3D FAN_FROM_REG(cnt);
> >+              *val =3D (long)rpm;
>
> Given that rpm is assigned from an unsigned long (FAN_FROM_REG()) and
> then to a long (*val), is there any reason we want it as a u16 in
> between the two?  Or for that matter, why not just:
>
>    *val =3D FAN_FROM_REG(cnt);
>
> ?

I'll modify this to align with the style of the nct7363_read_pwm function i=
n v5.

>
> >+              return 0;
> >+      default:
> >+              return -EOPNOTSUPP;
> >+      }
> >+}
> >+
> >+static umode_t nct7363_fan_is_visible(const void *_data, u32 attr, int =
channel)
> >+{
> >+      const struct nct7363_data *data =3D _data;
> >+
> >+      switch (attr) {
> >+      case hwmon_fan_input:
> >+              if (data->fanin_mask & BIT(channel))
> >+                      return 0444;
> >+              break;
> >+      default:
> >+              break;
> >+      }
> >+
> >+      return 0;
> >+}
> >+
> >+static int nct7363_read_pwm(struct device *dev, u32 attr, int channel,
> >+                          long *val)
> >+{
> >+      struct nct7363_data *data =3D dev_get_drvdata(dev);
> >+      unsigned int regval;
> >+      u16 ret;
> >+
> >+      switch (attr) {
> >+      case hwmon_pwm_input:
> >+              ret =3D regmap_read(data->regmap,
> >+                                NCT7363_REG_FSCPXDUTY(channel), &regval=
);
> >+              if (ret)
> >+                      return ret;
> >+
> >+              *val =3D (long)regval;
> >+              return 0;
> >+      default:
> >+              return -EOPNOTSUPP;
> >+      }
> >+}
> >+
> >+static int nct7363_write_pwm(struct device *dev, u32 attr, int channel,
> >+                           long val)
> >+{
> >+      struct nct7363_data *data =3D dev_get_drvdata(dev);
> >+      int ret;
> >+
> >+      switch (attr) {
> >+      case hwmon_pwm_input:
> >+              if (val < 0 || val > 255)
> >+                      return -EINVAL;
> >+
> >+              mutex_lock(&data->lock);
> >+              ret =3D regmap_write(data->regmap,
> >+                                 NCT7363_REG_FSCPXDUTY(channel), val);
> >+              mutex_unlock(&data->lock);
>
> ...though here, I'm not sure the locking is needed -- is there something
> that necessitates it for a single register write?

ok, fix in v5

>
> >+
> >+              return ret;
> >+
> >+      default:
> >+              return -EOPNOTSUPP;
> >+      }
> >+}
> >+
> >+static umode_t nct7363_pwm_is_visible(const void *_data, u32 attr, int =
channel)
> >+{
> >+      const struct nct7363_data *data =3D _data;
> >+
> >+      switch (attr) {
> >+      case hwmon_pwm_input:
> >+              if (data->pwm_mask & BIT(channel))
> >+                      return 0644;
> >+              break;
> >+      default:
> >+              break;
> >+      }
> >+
> >+      return 0;
> >+}
> >+
> >+static int nct7363_read(struct device *dev, enum hwmon_sensor_types typ=
e,
> >+                      u32 attr, int channel, long *val)
> >+{
> >+      switch (type) {
> >+      case hwmon_fan:
> >+              return nct7363_read_fan(dev, attr, channel, val);
> >+      case hwmon_pwm:
> >+              return nct7363_read_pwm(dev, attr, channel, val);
> >+      default:
> >+              return -EOPNOTSUPP;
> >+      }
> >+}
> >+
> >+static int nct7363_write(struct device *dev, enum hwmon_sensor_types ty=
pe,
> >+                       u32 attr, int channel, long val)
> >+{
> >+      switch (type) {
> >+      case hwmon_pwm:
> >+              return nct7363_write_pwm(dev, attr, channel, val);
> >+      default:
> >+              return -EOPNOTSUPP;
> >+      }
> >+}
> >+
> >+static umode_t nct7363_is_visible(const void *data,
> >+                                enum hwmon_sensor_types type,
> >+                                u32 attr, int channel)
> >+{
> >+      switch (type) {
> >+      case hwmon_fan:
> >+              return nct7363_fan_is_visible(data, attr, channel);
> >+      case hwmon_pwm:
> >+              return nct7363_pwm_is_visible(data, attr, channel);
> >+      default:
> >+              return 0;
> >+      }
> >+}
> >+
> >+static const struct hwmon_channel_info *nct7363_info[] =3D {
> >+      HWMON_CHANNEL_INFO(fan,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT,
> >+                         HWMON_F_INPUT),
> >+      HWMON_CHANNEL_INFO(pwm,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT,
> >+                         HWMON_PWM_INPUT),
> >+      NULL
> >+};
> >+
> >+static const struct hwmon_ops nct7363_hwmon_ops =3D {
> >+      .is_visible =3D nct7363_is_visible,
> >+      .read =3D nct7363_read,
> >+      .write =3D nct7363_write,
> >+};
> >+
> >+static const struct hwmon_chip_info nct7363_chip_info =3D {
> >+      .ops =3D &nct7363_hwmon_ops,
> >+      .info =3D nct7363_info,
> >+};
> >+
> >+static int nct7363_init_chip(struct nct7363_data *data)
> >+{
> >+      u8 i, gpio0_3 =3D 0, gpio4_7 =3D 0, gpio10_13 =3D 0, gpio14_17 =
=3D 0;
> >+      int ret;
> >+
> >+      for (i =3D 0; i < NCT7363_PWM_COUNT; i++) {
> >+              if (i < 4) {
> >+                      if (data->pwm_mask & BIT(i))
> >+                              gpio0_3 |=3D PWM_SEL(i);
> >+                      if (data->fanin_mask & BIT(i))
> >+                              gpio10_13 |=3D FANIN_SEL(i);
> >+              } else if (i < 8) {
> >+                      if (data->pwm_mask & BIT(i))
> >+                              gpio4_7 |=3D PWM_SEL(i);
> >+                      if (data->fanin_mask & BIT(i))
> >+                              gpio14_17 |=3D FANIN_SEL(i);
> >+              } else if (i < 12) {
> >+                      if (data->pwm_mask & BIT(i))
> >+                              gpio10_13 |=3D PWM_SEL(i);
> >+                      if (data->fanin_mask & BIT(i))
> >+                              gpio0_3 |=3D FANIN_SEL(i);
> >+              } else {
> >+                      if (data->pwm_mask & BIT(i))
> >+                              gpio14_17 |=3D PWM_SEL(i);
> >+                      if (data->fanin_mask & BIT(i))
> >+                              gpio4_7 |=3D FANIN_SEL(i);
> >+              }
> >+      }
>
> With the caveat that I haven't actually sketched it out myself to be
> sure, might it be a bit cleaner to do this with a 4-element array
> indexed by 'i / 4' instead of a big if/else chain and a bunch of
> near-duplicated blocks?

ok, fix in v5

>
> >+
> >+      /* Pin Function Configuration */
> >+      ret =3D regmap_write(data->regmap, NCT7363_REG_GPIO_0_3, gpio0_3)=
;
> >+      if (ret < 0)
> >+              return ret;
> >+      ret =3D regmap_write(data->regmap, NCT7363_REG_GPIO_4_7, gpio4_7)=
;
> >+      if (ret < 0)
> >+              return ret;
> >+      ret =3D regmap_write(data->regmap, NCT7363_REG_GPIO_10_13, gpio10=
_13);
> >+      if (ret < 0)
> >+              return ret;
> >+      ret =3D regmap_write(data->regmap, NCT7363_REG_GPIO_14_17, gpio14=
_17);
> >+      if (ret < 0)
> >+              return ret;
> >+
> >+      /* PWM and FANIN Monitoring Enable */
> >+      ret =3D regmap_write(data->regmap, NCT7363_REG_PWMEN_0_7,
> >+                         data->pwm_mask & 0xff);
> >+      if (ret < 0)
> >+              return ret;
> >+      ret =3D regmap_write(data->regmap, NCT7363_REG_PWMEN_8_15,
> >+                         (data->pwm_mask >> 8) & 0xff);
> >+      if (ret < 0)
> >+              return ret;
> >+      ret =3D regmap_write(data->regmap, NCT7363_REG_FANINEN_0_7,
> >+                         data->fanin_mask & 0xff);
> >+      if (ret < 0)
> >+              return ret;
> >+      ret =3D regmap_write(data->regmap, NCT7363_REG_FANINEN_8_15,
> >+                         (data->fanin_mask >> 8) & 0xff);
> >+      if (ret < 0)
> >+              return ret;
> >+
> >+      return 0;
> >+}
> >+
> >+static int nct7363_present_pwm_fanin(struct device *dev,
> >+                                   struct device_node *child,
> >+                                   struct nct7363_data *data)
> >+{
> >+      struct of_phandle_args args;
> >+      int ret, fanin_cnt;
> >+      u8 *fanin_ch;
> >+      u8 ch, index;
> >+
> >+      ret =3D of_parse_phandle_with_args(child, "pwms", "#pwm-cells",
> >+                                       0, &args);
> >+      if (ret)
> >+              return ret;
> >+
> >+      data->pwm_mask |=3D BIT(args.args[0]);
>
> Perhaps we should have
>
>    if (args.args[0] >=3D NCT7363_PWM_COUNT)
>      return -EINVAL;
>
> here?

ok, fix in v5

>
> >+
> >+      fanin_cnt =3D of_property_count_u8_elems(child, "tach-ch");
> >+      if (fanin_cnt < 1)
>
> fanin_cnt < 1 || fanin_cnt >=3D NCT7363_PWM_COUNT

ok, fix in v5

>
> >+              return -EINVAL;
> >+
> >+      fanin_ch =3D devm_kcalloc(dev, fanin_cnt, sizeof(*fanin_ch), GFP_=
KERNEL);
>
> Keeping this allocation around persistently for the whole lifetime of
> the device seems unnecessary -- it's not used beyond this function,
> right?  In fact, dynamically allocating it at all seems like overkill,
> considering that in addition to being temporary, it's also got a pretty
> small upper bound on its size.  I'd think a simple
>
>    u8 fanin_ch[NCT7363_PWM_COUNT];
>
> would suffice?  (Along with the check above to ensure fanin_cnt is
> within range of course.)

ok, fix in v5

>
> >+      if (!fanin_ch)
> >+              return -ENOMEM;
> >+
> >+      ret =3D of_property_read_u8_array(child, "tach-ch", fanin_ch, fan=
in_cnt);
> >+      if (ret)
> >+              return ret;
> >+
> >+      for (ch =3D 0; ch < fanin_cnt; ch++) {
> >+              index =3D fanin_ch[ch];
>
> ...and likewise a range check here too?

ok, fix in v5

>
> >+              data->fanin_mask |=3D BIT(index);
> >+      }
> >+
>
> Should we also grab the pulses-per-revolution property here and factor
> that in in FAN_FROM_REG()?

So far our FanPoles in tachometer count calculation formula is always 4.
Therefore, I don't add the pulses-per-revolution property into FAN_FROM_REG=
().

>
> >+      return 0;
> >+}
> >+
> >+static const struct regmap_config nct7363_regmap_config =3D {
> >+      .reg_bits =3D 8,
> >+      .val_bits =3D 8,
> >+};
> >+
> >+static int nct7363_probe(struct i2c_client *client)
> >+{
> >+      struct device *dev =3D &client->dev;
> >+      struct device_node *child;
> >+      struct nct7363_data *data;
> >+      struct device *hwmon_dev;
> >+      int ret;
> >+
> >+      data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >+      if (!data)
> >+              return -ENOMEM;
> >+
> >+      data->regmap =3D devm_regmap_init_i2c(client, &nct7363_regmap_con=
fig);
> >+      if (IS_ERR(data->regmap))
> >+              return PTR_ERR(data->regmap);
> >+
> >+      mutex_init(&data->lock);
> >+
> >+      for_each_child_of_node(dev->of_node, child) {
> >+              ret =3D nct7363_present_pwm_fanin(dev, child, data);
> >+              if (ret) {
> >+                      of_node_put(child);
> >+                      return ret;
> >+              }
> >+      }
> >+
> >+      /* Initialize the chip */
> >+      ret =3D nct7363_init_chip(data);
> >+      if (ret)
> >+              return ret;
> >+
> >+      hwmon_dev =3D
> >+              devm_hwmon_device_register_with_info(dev, client->name, d=
ata,
> >+                                                   &nct7363_chip_info, =
NULL);
> >+      return PTR_ERR_OR_ZERO(hwmon_dev);
> >+}
> >+
> >+static struct i2c_driver nct7363_driver =3D {
> >+      .class =3D I2C_CLASS_HWMON,
>
> Maybe add an i2c_device_id table to accompany the of_match table?

ok, fix in v5

Thanks,
Ban

>
> >+      .driver =3D {
> >+              .name =3D "nct7363",
> >+              .of_match_table =3D nct7363_of_match,
> >+      },
> >+      .probe =3D nct7363_probe,
> >+};
> >+
> >+module_i2c_driver(nct7363_driver);
> >+
> >+MODULE_AUTHOR("CW Ho <cwho@nuvoton.com>");
> >+MODULE_AUTHOR("Ban Feng <kcfeng0@nuvoton.com>");
> >+MODULE_DESCRIPTION("NCT7363 Hardware Monitoring Driver");
> >+MODULE_LICENSE("GPL");
> >--
> >2.34.1
> >
> >
