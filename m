Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1DB4807AA
	for <lists+openbmc@lfdr.de>; Tue, 28 Dec 2021 10:15:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNTR03YF8z3064
	for <lists+openbmc@lfdr.de>; Tue, 28 Dec 2021 20:15:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gxWuaPuI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=leetroy@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gxWuaPuI; dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNTQX72Cmz2yXM
 for <openbmc@lists.ozlabs.org>; Tue, 28 Dec 2021 20:15:14 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso23656184ots.6
 for <openbmc@lists.ozlabs.org>; Tue, 28 Dec 2021 01:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PmZ4M51DXH3FI8i+BhzuR1x/xa61rGWFuDt9QSrlnho=;
 b=gxWuaPuIdAn6+3iIrpgYDPmAjE/cIbX4mEG9/+TetAzddgJkMIr1kQViOoTtfjGrKv
 uHD5R8iC99dSNnhZ3ksLnI3cPIui02MDGXCoeOsNZFzo6hTnelf9q/q0hQ3vI+frsK10
 co42CGApYtNw0BNPgl4ID4CmWcKFmdWXpm8bTPm/N5HjqBhZLlXZYsLeZ4clfp7abari
 QSCCrFlCwmdGZfD3ohiVwSpmQedpFLLytJc1BnBqK8vnEY3CnP0AqT+erYtc6ZlUgDtI
 PpjYDH2sgzOc+Dh4TJU21sLFCvTzW8JF1JFhFVuLiOyrMQXgDJLUykSvsMMWxR+v9zFl
 1ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PmZ4M51DXH3FI8i+BhzuR1x/xa61rGWFuDt9QSrlnho=;
 b=1GWAIpAdXevRBTh3rnwrYwjaj9GX4gCANLU7s6t4dPJfUJblBzQQNA1tam97/b02P9
 MhbRsBhvd6o7B0Bcj4+EtX0+uy9CgZJOEOX1yHISaKYf3buJCM+RYNKEQh9+lEwaH4oK
 uRyCruWn+tI2CZTDQVNY5yJZ24RkzcNSzK1LdxwRfto9GGOZW3VCI80KHUGvoErBAKj3
 D2UxQgCN0RdicwMq1nVAoan8tL7C1FRbeS41POHrGgJ2Ysaeq5Z3snAtspFohLZyJdA9
 W2TYiCloB0ocquNR7KnFQucAOVSXFq1OUaOeoJcQe2fYRldfraXZqHP1E/FiQPqqcPtB
 D0Xg==
X-Gm-Message-State: AOAM533EbKtLhF5raLQMFkM98ccWQnr6/CKoR5z7ncxvbFbSfYSmkP0h
 ZyM9d7Jero+cNO07+6QE01GIKlmTJZ1PDqD15TJg9dy4pI9WTg==
X-Google-Smtp-Source: ABdhPJw6BgbMP8Xj73KoJ+g/8emj9wjfugf/ww3bwXCabvPD9bjBWRvrPgEalEVKtsFooi8Na12TzoR/wy2u5c2XGUM=
X-Received: by 2002:a05:6830:1e7c:: with SMTP id
 m28mr14471415otr.93.1640682910139; 
 Tue, 28 Dec 2021 01:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
 <20211222092319.2988568-2-troy_lee@aspeedtech.com>
 <00d2736b-8263-125b-e4b1-3c56a99f27eb@kaod.org>
In-Reply-To: <00d2736b-8263-125b-e4b1-3c56a99f27eb@kaod.org>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 28 Dec 2021 17:15:03 +0800
Message-ID: <CAN9Jwz0ErY5HTc-Yutf5YxCS0fBEoKmYCdF7W1vFve_LaOSMfg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] hw/misc: Implementating dummy AST2600 I3C model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,
On Thu, Dec 23, 2021 at 9:48 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
>
> Hello,
>
> On 12/22/21 10:23, Troy Lee wrote:
> > Introduce a dummy AST2600 I3C model.
> >
> > Aspeed 2600 SDK enables I3C support by default.  The I3C driver will tr=
y
> > to reset the device controller and setup through device address table
> > register.  This dummy model response these register with default value
> > listed on ast2600v10 datasheet chapter 54.2.  If the device address
> > table register doesn't set correctly, it will cause guest machine kerne=
l
> > panic due to reference to invalid address.
>
> Overall looks good. Some comments,
>
> >
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > ---
> >   hw/misc/aspeed_i3c.c         | 258 ++++++++++++++++++++++++++++++++++=
+
> >   hw/misc/meson.build          |   1 +
> >   include/hw/misc/aspeed_i3c.h |  30 ++++
> >   3 files changed, 289 insertions(+)
> >   create mode 100644 hw/misc/aspeed_i3c.c
> >   create mode 100644 include/hw/misc/aspeed_i3c.h
> >
> > diff --git a/hw/misc/aspeed_i3c.c b/hw/misc/aspeed_i3c.c
> > new file mode 100644
> > index 0000000000..9d2bda203e
> > --- /dev/null
> > +++ b/hw/misc/aspeed_i3c.c
> > @@ -0,0 +1,258 @@
> > +/*
> > + * ASPEED I3C Controller
> > + *
> > + * Copyright (C) 2021 ASPEED Technology Inc.
> > + *
> > + * This code is licensed under the GPL version 2 or later.  See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "qemu/error-report.h"
> > +#include "hw/misc/aspeed_i3c.h"
> > +#include "qapi/error.h"
> > +#include "migration/vmstate.h"
> > +
> > +/* I3C Controller Registers */
> > +#define R_I3CG_REG0(x)                  (((x * 0x10) + 0x10) / 4)
> > +#define  I3CG_REG0_SDA_PULLUP_EN_MASK   GENMASK(29, 28)
>
> GENMASK() is a macro defined in the FSI model which is not upstream.
> There are other ways to define bitfield masks in QEMU. Please take a
> look at include/hw/registerfields.h.
Got it. I found some reference code with registerfields, I'll improve
in next patch.

> > +#define  I3CG_REG0_SDA_PULLUP_EN_2K     BIT(28)
> > +#define  I3CG_REG0_SDA_PULLUP_EN_750    BIT(29)
> > +#define  I3CG_REG0_SDA_PULLUP_EN_545    (BIT(29) | BIT(28))
> > +
> > +#define R_I3CG_REG1(x)                  (((x * 0x10) + 0x14) / 4)
> > +#define  I3CG_REG1_I2C_MODE             BIT(0)
> > +#define  I3CG_REG1_TEST_MODE            BIT(1)
> > +#define  I3CG_REG1_ACT_MODE_MASK        GENMASK(3, 2)
> > +#define  I3CG_REG1_ACT_MODE(x)          (((x) << 2) & I3CG_REG1_ACT_MO=
DE_MASK)
> > +#define  I3CG_REG1_PENDING_INT_MASK     GENMASK(7, 4)
> > +#define  I3CG_REG1_PENDING_INT(x)   (((x) << 4) & I3CG_REG1_PENDING_IN=
T_MASK)
> > +#define  I3CG_REG1_SA_MASK              GENMASK(14, 8)
> > +#define  I3CG_REG1_SA(x)                (((x) << 8) & I3CG_REG1_SA_MAS=
K)
> > +#define  I3CG_REG1_SA_EN                BIT(15)
> > +#define  I3CG_REG1_INST_ID_MASK         GENMASK(19, 16)
> > +#define  I3CG_REG1_INST_ID(x)           (((x) << 16) & I3CG_REG1_INST_=
ID_MASK)
> > +
> > +/* I3C Device Registers */
> > +#define R_DEVICE_CTRL                   (0x00 / 4)
> > +#define R_DEVICE_ADDR                   (0x04 / 4)
> > +#define R_HW_CAPABILITY                 (0x08 / 4)
> > +#define R_COMMAND_QUEUE_PORT            (0x0c / 4)
> > +#define R_RESPONSE_QUEUE_PORT           (0x10 / 4)
> > +#define R_RX_TX_DATA_PORT               (0x14 / 4)
> > +#define R_IBI_QUEUE_STATUS              (0x18 / 4)
> > +#define R_IBI_QUEUE_DATA                (0x18 / 4)
> > +#define R_QUEUE_THLD_CTRL               (0x1c / 4)
> > +#define R_DATA_BUFFER_THLD_CTRL         (0x20 / 4)
> > +#define R_IBI_QUEUE_CTRL                (0x24 / 4)
> > +#define R_IBI_MR_REQ_REJECT             (0x2c / 4)
> > +#define R_IBI_SIR_REQ_REJECT            (0x30 / 4)
> > +#define R_RESET_CTRL                    (0x34 / 4)
> > +#define R_SLV_EVENT_CTRL                (0x38 / 4)
> > +#define R_INTR_STATUS                   (0x3c / 4)
> > +#define R_INTR_STATUS_EN                (0x40 / 4)
> > +#define R_INTR_SIGNAL_EN                (0x44 / 4)
> > +#define R_INTR_FORCE                    (0x48 / 4)
> > +#define R_QUEUE_STATUS_LEVEL            (0x4c / 4)
> > +#define R_DATA_BUFFER_STATUS_LEVEL      (0x50 / 4)
> > +#define R_PRESENT_STATE                 (0x54 / 4)
> > +#define R_CCC_DEVICE_STATUS             (0x58 / 4)
> > +#define R_DEVICE_ADDR_TABLE_POINTER     (0x5c / 4)
> > +#define  DEVICE_ADDR_TABLE_DEPTH(x)     (((x) & GENMASK(31, 16)) >> 16=
)
> > +#define  DEVICE_ADDR_TABLE_ADDR(x)      ((x) & GENMASK(7, 0))
> > +#define R_DEV_CHAR_TABLE_POINTER        (0x60 / 4)
> > +#define R_VENDOR_SPECIFIC_REG_POINTER   (0x6c / 4)
> > +#define R_SLV_MIPI_PID_VALUE            (0x70 / 4)
> > +#define R_SLV_PID_VALUE                 (0x74 / 4)
> > +#define R_SLV_CHAR_CTRL                 (0x78 / 4)
> > +#define R_SLV_MAX_LEN                   (0x7c / 4)
> > +#define R_MAX_READ_TURNAROUND           (0x80 / 4)
> > +#define R_MAX_DATA_SPEED                (0x84 / 4)
> > +#define R_SLV_DEBUG_STATUS              (0x88 / 4)
> > +#define R_SLV_INTR_REQ                  (0x8c / 4)
> > +#define R_DEVICE_CTRL_EXTENDED          (0xb0 / 4)
> > +#define R_SCL_I3C_OD_TIMING             (0xb4 / 4)
> > +#define R_SCL_I3C_PP_TIMING             (0xb8 / 4)
> > +#define R_SCL_I2C_FM_TIMING             (0xbc / 4)
> > +#define R_SCL_I2C_FMP_TIMING            (0xc0 / 4)
> > +#define R_SCL_EXT_LCNT_TIMING           (0xc8 / 4)
> > +#define R_SCL_EXT_TERMN_LCNT_TIMING     (0xcc / 4)
> > +#define R_BUS_FREE_TIMING               (0xd4 / 4)
> > +#define R_BUS_IDLE_TIMING               (0xd8 / 4)
> > +#define R_I3C_VER_ID                    (0xe0 / 4)
> > +#define R_I3C_VER_TYPE                  (0xe4 / 4)
> > +#define R_EXTENDED_CAPABILITY           (0xe8 / 4)
> > +#define R_SLAVE_CONFIG                  (0xec / 4)
> > +
> > +static uint64_t aspeed_i3c_read(void *opaque,
> > +                                hwaddr addr,
> > +                                unsigned int size)
>
> You can avoid the new lines.
static uint64_t aspeed_i3c_read(void *opaque, hwaddr addr, unsigned int siz=
e)
Originally, I thought it would exceed 80 chars, but it is only 78 chars lon=
g.

> > +{
> > +    AspeedI3CState *s =3D ASPEED_I3C(opaque);
> > +    uint64_t val =3D 0;
> > +
> > +    addr >>=3D 2;
> > +
> > +    if (addr >=3D ASPEED_I3C_NR_REGS) {
>
> ASPEED_I3C_NR_REGS is a large value (0x8000 >> 2) which doesn't really
> represent the number of registers. I would do thing a bit differently.
> See the comment below in realize.
>
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PR=
Ix "\n",
> > +                      __func__, addr << 2);
> > +    } else if (addr < 0x800) {
>
> Where does that value come from  ?
>
> > +        /* I3C controller register */
> > +        val =3D s->regs[addr];
> > +    } else {
> > +        /* I3C device register */
>
> hmm, I think we need one region per I3C device instead.
I'll split it into two levels, controller and devices, where the
controller could
be a memory region only.

> > +        switch (addr & 0xff) {
> > +        case R_DEVICE_ADDR_TABLE_POINTER:
> > +            val =3D DEVICE_ADDR_TABLE_DEPTH(0x8) | DEVICE_ADDR_TABLE_A=
DDR(0x280);
> > +            break;
> > +        case R_DEV_CHAR_TABLE_POINTER:
> > +            val =3D 0x00020200;
> > +            break;
> > +        case R_VENDOR_SPECIFIC_REG_POINTER:
> > +            val =3D 0x000000b0;
> > +            break;
> > +        default:
> > +            val =3D s->regs[addr];
> > +            break;
> > +        }
> > +    }
> > +
> > +    printf("I3C Read[%08lx] =3D [%08lx]\n", addr << 2, val);
>
> Please use trace-events. See trace_aspeed_scu_read/write for example.
Got it.

> > +
> > +    return val;
> > +}
> > +
> > +static void aspeed_i3c_write(void *opaque,
> > +                             hwaddr addr,
> > +                             uint64_t data,
> > +                             unsigned int size)
>
> same.
>
Got it.

> > +{
> > +    AspeedI3CState *s =3D ASPEED_I3C(opaque);
> > +
> > +    printf("I3C Write[%08lx] =3D [%08lx]\n", addr, data);
>
> same.
>
Got it.

> > +
> > +    addr >>=3D 2;
> > +
> > +    if (addr >=3D ASPEED_I3C_NR_REGS) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_P=
RIx "\n",
> > +                      __func__, addr << 2);
> > +        return;
> > +    }
> > +
> > +    if (addr < 0x800) {
> > +        /* I3C controller register */
> > +        switch (addr) {
> > +        case R_I3CG_REG1(0):
> > +        case R_I3CG_REG1(1):
> > +        case R_I3CG_REG1(2):
> > +        case R_I3CG_REG1(3):
> > +            if (data & I3CG_REG1_I2C_MODE) {
> > +                qemu_log_mask(LOG_UNIMP,
> > +                              "%s: Not support I2C mode [%08lx]=3D%08l=
x",
> > +                              __func__, addr << 2, data);
> > +                break;
> > +            }
> > +            if (data & I3CG_REG1_SA_EN) {
> > +                qemu_log_mask(LOG_UNIMP,
> > +                              "%s: Not support slave mode [%08lx]=3D%0=
8lx",
> > +                              __func__, addr << 2, data);
> > +                break;
> > +            }
> > +            s->regs[addr] =3D data;
> > +            break;
> > +        default:
> > +            s->regs[addr] =3D data;
> > +            break;
> > +        }
> > +    } else {
> > +        /* I3C device register */
> > +        switch (addr & 0xff) {
> > +        case R_RESET_CTRL:
> > +            s->regs[addr] =3D 0x00000000;
> > +            break;
> > +        default:
> > +            s->regs[addr] =3D data;
> > +            break;
> > +        }
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps aspeed_i3c_ops =3D {
> > +    .read =3D aspeed_i3c_read,
> > +    .write =3D aspeed_i3c_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 4,
> > +    }
> > +};
> > +
> > +static void aspeed_i3c_reset(DeviceState *dev)
> > +{
> > +    struct AspeedI3CState *s =3D ASPEED_I3C(dev);
> > +
> > +    memset(s->regs, 0, sizeof(s->regs));
> > +
> > +    /* Init I3C controller register */
> > +
> > +
> > +    /* Init I3C devices register */
> > +    for (int i =3D 0; i < 4; ++i) {
>
> there are 5 devices. no ?
Oops, there are 6 devices.

> > +        uint32_t dev_base =3D (0x2000 + i * 0x1000) >> 4;
> > +        s->regs[dev_base + R_HW_CAPABILITY] =3D 0x000e00bf;
> > +        s->regs[dev_base + R_QUEUE_THLD_CTRL] =3D 0x01000101;
> > +
> > +        s->regs[dev_base + R_I3C_VER_ID] =3D 0x3130302a;
> > +        s->regs[dev_base + R_I3C_VER_TYPE] =3D 0x6c633033;
>
> This is a sign that we need an AspeedI3CDevice model :)
>
> > +    }
> > +}
> > +
> > +static void aspeed_i3c_realize(DeviceState *dev, Error **errp)
> > +{
> > +    AspeedI3CState *s =3D ASPEED_I3C(dev);
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> > +
> > +    sysbus_init_irq(sbd, &s->irq);
> > +
> > +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i3c_ops, s,
> > +            TYPE_ASPEED_I3C, 0x8000);
>
> I would do things differently with an AspeedI3CDevice, something like :
>
>      struct AspeedI3CDevice {
>          SysBusDevice parent_obj;
>
>          MemoryRegion mr;
>
>          uint32_t regs[0x300 >> 2];
>      };
>
> for which you would define the realize and reset handlers like above
> but relative to the device only. The read/write ops of the device
> region would be simplified.
>
> You will then to introduce an array of AspeedI3CDevice under
> AspeedI3CState :
>
>        AspeedI3CDevice devices[ASPEED_I3C_NR_DEVICES];
>
> and initialize them in a instance_init handler of AspeedI3CState :
>
>      static void aspeed_i3c_instance_init(Object *obj)
>      {
>          AspeedI3CState *s =3D ASPEED_I3C(obj);
>          int i;
>
>          for (i =3D 0; i < ASPEED_I3C_NR_DEVICES; i++) {
>              object_initialize_child(obj, "device[*]", &s->devices[i],
>                                      TYPE_ASPEED_I3C_DEVICE);
>          }
>      }
>
> and realize the devices in aspeed_i3c_realize  :
>
>      for (i =3D 0; i < ASPEED_I3C_NR_DEVICES; i++) {
>          Object *obj =3D OBJECT(&s->devices[i]);
>
>          if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
>              return;
>          }
>
>         /* Map the device MMIO window in the overall I3C MMIO */
>          memory_region_add_subregion(&s->iomem, 0x2000 + i * 0x1000;
>                                      &s->devices[i].mr);
>      }
This looks more straight forward.

> I don't think we need to handle the controller registers mapped at 0x0
> to start with. You could introduce a region to catch memory ops.
>
> At some point, we would have to consider modeling the I3C bus but that's
> beyond the scope of the initial model.
>
> Thanks,
>
> C.

Thanks for your suggestion, I'll update accordingly in the v2 patch.

Troy Lee

>
> > +
> > +    sysbus_init_mmio(sbd, &s->iomem);
> > +}
> > +
> > +static const VMStateDescription vmstate_aspeed_i3c =3D {
> > +    .name =3D TYPE_ASPEED_I3C,
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT32_ARRAY(regs, AspeedI3CState, ASPEED_I3C_NR_REGS)=
,
> > +        VMSTATE_END_OF_LIST(),
> > +    }
> > +};
> > +
> > +static void aspeed_i3c_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->realize =3D aspeed_i3c_realize;
> > +    dc->reset =3D aspeed_i3c_reset;
> > +    dc->desc =3D "Aspeed I3C Controller";
> > +    dc->vmsd =3D &vmstate_aspeed_i3c;
> > +}
> > +
> > +static const TypeInfo aspeed_i3c_info =3D {
> > +    .name =3D TYPE_ASPEED_I3C,
> > +    .parent =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(AspeedI3CState),
> > +    .class_init =3D aspeed_i3c_class_init,
> > +};
> > +
> > +static void aspeed_i3c_register_types(void)
> > +{
> > +    type_register_static(&aspeed_i3c_info);
> > +}
> > +
> > +type_init(aspeed_i3c_register_types);
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 73a92fc459..9e570131c2 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -103,6 +103,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true:=
 files('pvpanic-pci.c'))
> >   softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
> >   softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
> >     'aspeed_hace.c',
> > +  'aspeed_i3c.c',
> >     'aspeed_lpc.c',
> >     'aspeed_pwm.c',
> >     'aspeed_scu.c',
> > diff --git a/include/hw/misc/aspeed_i3c.h b/include/hw/misc/aspeed_i3c.=
h
> > new file mode 100644
> > index 0000000000..c8f8ae3791
> > --- /dev/null
> > +++ b/include/hw/misc/aspeed_i3c.h
> > @@ -0,0 +1,30 @@
> > +/*
> > + * ASPEED I3C Controller
> > + *
> > + * Copyright (C) 2021 ASPEED Technology Inc.
> > + *
> > + * This code is licensed under the GPL version 2 or later.  See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef ASPEED_I3C_H
> > +#define ASPEED_I3C_H
> > +
> > +#include "hw/sysbus.h"
> > +
> > +#define TYPE_ASPEED_I3C "aspeed.i3c"
> > +#define ASPEED_I3C(obj) OBJECT_CHECK(AspeedI3CState, (obj), TYPE_ASPEE=
D_I3C)
> > +
> > +#define ASPEED_I3C_NR_REGS (0x8000 >> 2)
> > +
> > +typedef struct AspeedI3CState {
> > +    /* <private> */
> > +    SysBusDevice parent;
> > +
> > +    /* <public> */
> > +    MemoryRegion iomem;
> > +    qemu_irq irq;
> > +
> > +    uint32_t regs[ASPEED_I3C_NR_REGS];
> > +} AspeedI3CState;
> > +#endif /* ASPEED_I3C_H */
> >
