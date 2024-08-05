Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855BF9475E5
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 09:20:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E6y3sUKD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wcns03F1bz3cYZ
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 17:20:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E6y3sUKD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com; envelope-from=stanley.chuys@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WcnrR3nwDz3cWG
	for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2024 17:19:49 +1000 (AEST)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-38252b3a90eso2491835ab.0
        for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2024 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722842387; x=1723447187; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evvYuZnO/VfX71m5cAD/4vb5enxdS4MFo1l1OsUQQvU=;
        b=E6y3sUKD9kJ9G63P8tL4V+o/4IXT6ID+o2qH3HZQ80U79NDybtO7xec+RLL0IDStap
         IYtTzVNLcBgG4DVsVa/vixVTBBuBUSBQfW6bmjT8HPKZ66CWO/E8GiRUe/ouLlrO+2Te
         04MluQanSqbrjwzncVjQctHmZZ/3Nh7O15CDC/w1xu3pm4gWjqlXrwJDpFlQHJR2ZHes
         yubJVyaAZJw/M5LDTOYBB0iS4891g4XQwc2ZYjtPnvq5iJ3qW+T27AAABncI9vsESDZe
         fZUNwro4jFNmHLa0OJFfAYfpYmwaZpf0giUFBVthTouPQZEcZyOwOTNDIJhYIZYNv205
         yYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722842387; x=1723447187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evvYuZnO/VfX71m5cAD/4vb5enxdS4MFo1l1OsUQQvU=;
        b=BxY7pK6vsE7T22D7F4AP2csYRhS6UTpKpWcKB87OeT+BTTWqyKDC9mUfLKvPmV4mlS
         tTBbwhxErfUQN+poVIbeJTOsSidivQWvUzSVvUxjGWsoD9SoKv4uHrJULwXXWJ05HlVQ
         pXdWn2jQszAJwIZzGbhB17BGYW7aUJa85sCKD2FE2efCpnBEG/crZYfrEvT2qx1OhcUU
         gz94Fl+9Eflf0OfvD8JQGburU/gJilNAoeBlk7QM29ObeBXAq1UpryENn//JL4Q0lzVc
         +F6tHFHNYXHphBRIJUnoKKVj+IHmWv2GopWEKo5mPZMXGxqtWdjEOD9zRCPCUXorpMLa
         pGLw==
X-Forwarded-Encrypted: i=1; AJvYcCXeKrr4zAqKeGvlaf2pbfJdmb/IwMuQ1cwPICZ4xXVSpL9pytnOWWfBncKYcfitE1+rSJNx5pBjRt9p2Qjcp443O99QfXEVF1c=
X-Gm-Message-State: AOJu0Yzf5PCKKTE7yAKf9+zS+pb9LCaFJCo2iBvNHs9nwpSuZ7Qcl9RR
	UhHCt6RsJSZIzpA61v+06+OCRCpveZg1BW97Ptd3fVtRk0G1Mqin90D09OEJAva3jzuvRtpqiuh
	7/kYSs3N8RlEgbYhinoc5R9fnXAY=
X-Google-Smtp-Source: AGHT+IF1TyhmmzYZs0h2App42WClVn67KK0oECERowntM+HrBgAkf+HP3Ujaq1+toLkFJ9C3OwUIRUmv6wxNF6r21tA=
X-Received: by 2002:a05:6e02:1c2d:b0:39a:ea4c:8c39 with SMTP id
 e9e14a558f8ab-39b1fc44fdbmr69102385ab.4.1722842386369; Mon, 05 Aug 2024
 00:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240801071946.43266-1-yschu@nuvoton.com> <20240801071946.43266-3-yschu@nuvoton.com>
 <Zq0Ge097urOty5l+@lizhi-Precision-Tower-5810>
In-Reply-To: <Zq0Ge097urOty5l+@lizhi-Precision-Tower-5810>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Mon, 5 Aug 2024 15:19:34 +0800
Message-ID: <CAPwEoQNrGE8cgxEYxezZmFufpK3C18Cn9rw4mjQNSjtV-eWSrQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
To: Frank Li <Frank.li@nxp.com>
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
Cc: robh@kernel.org, alexandre.belloni@bootlin.com, yschu@nuvoton.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kwliu@nuvoton.com, cpchiang1@nuvoton.com, krzk+dt@kernel.org, linux-i3c@lists.infradead.org, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Aug 3, 2024 at 12:17=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Aug 01, 2024 at 03:19:46PM +0800, Stanley Chu wrote:
> > Add support for the Nuvoton npcm845 i3c controller which
> > implements I3C master functionality as defined in the MIPI
> > Alliance Specification for I3C, Version 1.0.
> >
> > The master role is supported in SDR mode only. IBI and Hot-join
> > requsts are supported.
> >
> > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> > Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
> > ---
> >  MAINTAINERS                             |    7 +
> >  drivers/i3c/master/Kconfig              |   14 +
> >  drivers/i3c/master/Makefile             |    1 +
> >  drivers/i3c/master/npcm845-i3c-master.c | 2364 +++++++++++++++++++++++
> >  4 files changed, 2386 insertions(+)
> >  create mode 100644 drivers/i3c/master/npcm845-i3c-master.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 42decde38320..2d30b6e418d8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2670,6 +2670,13 @@ F:     Documentation/userspace-api/media/drivers=
/npcm-video.rst
> >  F:   drivers/media/platform/nuvoton/
> >  F:   include/uapi/linux/npcm-video.h
> >
> > +ARM/NUVOTON NPCM845 I3C MASTER DRIVER
> > +M:   Stanley Chu <yschu@nuvoton.com>
> > +M:   James Chiang <cpchiang1@nuvoton.com>
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> > +F:   drivers/i3c/master/npcm845-i3c-master.c
> > +
> >  ARM/NUVOTON WPCM450 ARCHITECTURE
> >  M:   Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> >  L:   openbmc@lists.ozlabs.org (moderated for non-subscribers)
> > diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> > index 90dee3ec5520..a71d504d4744 100644
> > --- a/drivers/i3c/master/Kconfig
> > +++ b/drivers/i3c/master/Kconfig
> > @@ -44,6 +44,20 @@ config SVC_I3C_MASTER
> >       help
> >         Support for Silvaco I3C Dual-Role Master Controller.
> >
> > +config NPCM845_I3C_MASTER
> > +     tristate "Nuvoton NPCM845 I3C master driver"
> > +     depends on I3C
> > +     depends on HAS_IOMEM
> > +     depends on ARCH_NPCM || COMPILE_TEST
> > +     help
> > +       Support for Nuvoton NPCM845 I3C Master Controller.
> > +
> > +       This hardware is an instance of the SVC I3C controller; this
> > +       driver adds platform specific support for NPCM845 hardware.
> > +
> > +       This driver can also be built as a module.  If so, the module
> > +       will be called npcm845-i3c-master.
> > +
> >  config MIPI_I3C_HCI
> >       tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL=
)"
> >       depends on I3C
> > diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> > index 3e97960160bc..3ed55113190a 100644
> > --- a/drivers/i3c/master/Makefile
> > +++ b/drivers/i3c/master/Makefile
> > @@ -3,4 +3,5 @@ obj-$(CONFIG_CDNS_I3C_MASTER)         +=3D i3c-master-c=
dns.o
> >  obj-$(CONFIG_DW_I3C_MASTER)          +=3D dw-i3c-master.o
> >  obj-$(CONFIG_AST2600_I3C_MASTER)     +=3D ast2600-i3c-master.o
> >  obj-$(CONFIG_SVC_I3C_MASTER)         +=3D svc-i3c-master.o
> > +obj-$(CONFIG_NPCM845_I3C_MASTER)     +=3D npcm845-i3c-master.o
> >  obj-$(CONFIG_MIPI_I3C_HCI)           +=3D mipi-i3c-hci/
> > diff --git a/drivers/i3c/master/npcm845-i3c-master.c b/drivers/i3c/mast=
er/npcm845-i3c-master.c
> > new file mode 100644
> > index 000000000000..19672fdbe2b8
> > --- /dev/null
> > +++ b/drivers/i3c/master/npcm845-i3c-master.c
> > @@ -0,0 +1,2364 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NPCM845 I3C master driver
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + * Based on the work from svc i3c master driver and add platform
> > + * specific support for the NPCM845 hardware.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/completion.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/errno.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/list.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/reset.h>
> > +#include <linux/i3c/master.h>
> > +#include <linux/pinctrl/consumer.h>
> > +#include <linux/platform_device.h>
>
> Please sort include files
>
> > +
> > +/* Master Mode Registers */
> > +#define NPCM_I3C_MCONFIG      0x000
> > +#define   NPCM_I3C_MCONFIG_MASTER_EN BIT(0)
> > +#define   NPCM_I3C_MCONFIG_DISTO(x) FIELD_PREP(BIT(3), (x))
> > +#define   NPCM_I3C_MCONFIG_HKEEP(x) FIELD_PREP(GENMASK(5, 4), (x))
> > +#define   NPCM_I3C_MCONFIG_ODSTOP(x) FIELD_PREP(BIT(6), (x))
> > +#define   NPCM_I3C_MCONFIG_PPBAUD(x) FIELD_PREP(GENMASK(11, 8), (x))
> > +#define   NPCM_I3C_MCONFIG_PPLOW(x) FIELD_PREP(GENMASK(15, 12), (x))
> > +#define   NPCM_I3C_MCONFIG_ODBAUD(x) FIELD_PREP(GENMASK(23, 16), (x))
> > +#define   NPCM_I3C_MCONFIG_ODHPP(x) FIELD_PREP(BIT(24), (x))
> > +#define   NPCM_I3C_MCONFIG_SKEW(x) FIELD_PREP(GENMASK(27, 25), (x))
> > +#define   NPCM_I3C_MCONFIG_SKEW_MASK GENMASK(27, 25)
> > +#define   NPCM_I3C_MCONFIG_I2CBAUD(x) FIELD_PREP(GENMASK(31, 28), (x))
> > +
> > +#define NPCM_I3C_MCTRL        0x084
> > +#define   NPCM_I3C_MCTRL_REQUEST_MASK GENMASK(2, 0)
> > +#define   NPCM_I3C_MCTRL_REQUEST(x) FIELD_GET(GENMASK(2, 0), (x))
> > +#define   NPCM_I3C_MCTRL_REQUEST_NONE 0
> > +#define   NPCM_I3C_MCTRL_REQUEST_START_ADDR 1
> > +#define   NPCM_I3C_MCTRL_REQUEST_STOP 2
> > +#define   NPCM_I3C_MCTRL_REQUEST_IBI_ACKNACK 3
> > +#define   NPCM_I3C_MCTRL_REQUEST_PROC_DAA 4
> > +#define   NPCM_I3C_MCTRL_REQUEST_FORCE_EXIT 6
> > +#define   NPCM_I3C_MCTRL_REQUEST_AUTO_IBI 7
> > +#define   NPCM_I3C_MCTRL_TYPE_I3C 0
> > +#define   NPCM_I3C_MCTRL_TYPE_I2C BIT(4)
> > +#define   NPCM_I3C_MCTRL_IBIRESP_AUTO 0
> > +#define   NPCM_I3C_MCTRL_IBIRESP_ACK_WITHOUT_BYTE 0
> > +#define   NPCM_I3C_MCTRL_IBIRESP_ACK_WITH_BYTE BIT(7)
> > +#define   NPCM_I3C_MCTRL_IBIRESP_NACK BIT(6)
> > +#define   NPCM_I3C_MCTRL_IBIRESP_MANUAL GENMASK(7, 6)
> > +#define   NPCM_I3C_MCTRL_DIR(x) FIELD_PREP(BIT(8), (x))
> > +#define   NPCM_I3C_MCTRL_DIR_WRITE 0
> > +#define   NPCM_I3C_MCTRL_DIR_READ 1
> > +#define   NPCM_I3C_MCTRL_ADDR(x) FIELD_PREP(GENMASK(15, 9), (x))
> > +#define   NPCM_I3C_MCTRL_RDTERM(x) FIELD_PREP(GENMASK(23, 16), (x))
> > +
> > +#define NPCM_I3C_MSTATUS      0x088
> > +#define   NPCM_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
> > +#define   NPCM_I3C_MSTATUS_STATE_DAA(x) (NPCM_I3C_MSTATUS_STATE(x) =3D=
=3D 5)
> > +#define   NPCM_I3C_MSTATUS_STATE_IDLE(x) (NPCM_I3C_MSTATUS_STATE(x) =
=3D=3D 0)
> > +#define   NPCM_I3C_MSTATUS_STATE_SLVREQ(x) (NPCM_I3C_MSTATUS_STATE(x) =
=3D=3D 1)
> > +#define   NPCM_I3C_MSTATUS_STATE_IBIACK(x) (NPCM_I3C_MSTATUS_STATE(x) =
=3D=3D 6)
> > +#define   NPCM_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
> > +#define   NPCM_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
> > +#define   NPCM_I3C_MSTATUS_IBITYPE(x) FIELD_GET(GENMASK(7, 6), (x))
> > +#define   NPCM_I3C_MSTATUS_IBITYPE_IBI 1
> > +#define   NPCM_I3C_MSTATUS_IBITYPE_MASTER_REQUEST 2
> > +#define   NPCM_I3C_MSTATUS_IBITYPE_HOT_JOIN 3
> > +#define   NPCM_I3C_MINT_SLVSTART BIT(8)
> > +#define   NPCM_I3C_MINT_MCTRLDONE BIT(9)
> > +#define   NPCM_I3C_MINT_COMPLETE BIT(10)
> > +#define   NPCM_I3C_MINT_RXPEND BIT(11)
> > +#define   NPCM_I3C_MINT_TXNOTFULL BIT(12)
> > +#define   NPCM_I3C_MINT_IBIWON BIT(13)
> > +#define   NPCM_I3C_MINT_ERRWARN BIT(15)
> > +#define   NPCM_I3C_MSTATUS_SLVSTART(x) FIELD_GET(NPCM_I3C_MINT_SLVSTAR=
T, (x))
> > +#define   NPCM_I3C_MSTATUS_MCTRLDONE(x) FIELD_GET(NPCM_I3C_MINT_MCTRLD=
ONE, (x))
> > +#define   NPCM_I3C_MSTATUS_COMPLETE(x) FIELD_GET(NPCM_I3C_MINT_COMPLET=
E, (x))
> > +#define   NPCM_I3C_MSTATUS_RXPEND(x) FIELD_GET(NPCM_I3C_MINT_RXPEND, (=
x))
> > +#define   NPCM_I3C_MSTATUS_TXNOTFULL(x) FIELD_GET(NPCM_I3C_MINT_TXNOTF=
ULL, (x))
> > +#define   NPCM_I3C_MSTATUS_IBIWON(x) FIELD_GET(NPCM_I3C_MINT_IBIWON, (=
x))
> > +#define   NPCM_I3C_MSTATUS_ERRWARN(x) FIELD_GET(NPCM_I3C_MINT_ERRWARN,=
 (x))
> > +#define   NPCM_I3C_MSTATUS_IBIADDR(x) FIELD_GET(GENMASK(30, 24), (x))
> > +
> > +#define NPCM_I3C_IBIRULES     0x08C
> > +#define   NPCM_I3C_IBIRULES_ADDR(slot, addr) FIELD_PREP(GENMASK(29, 0)=
, \
> > +                                                    ((addr) & 0x3F) <<=
 ((slot) * 6))
> > +#define   NPCM_I3C_IBIRULES_ADDRS 5
> > +#define   NPCM_I3C_IBIRULES_MSB0 BIT(30)
> > +#define   NPCM_I3C_IBIRULES_NOBYTE BIT(31)
> > +#define   NPCM_I3C_IBIRULES_MANDBYTE 0
> > +#define NPCM_I3C_MINTSET      0x090
> > +#define NPCM_I3C_MINTCLR      0x094
> > +#define NPCM_I3C_MINTMASKED   0x098
> > +#define NPCM_I3C_MERRWARN     0x09C
> > +#define   NPCM_I3C_MERRWARN_NACK(x) FIELD_GET(BIT(2), (x))
> > +#define   NPCM_I3C_MERRWARN_TIMEOUT BIT(20)
> > +#define   NPCM_I3C_MERRWARN_HCRC(x) FIELD_GET(BIT(10), (x))
> > +#define NPCM_I3C_MDMACTRL     0x0A0
> > +#define   NPCM_I3C_MDMACTRL_DMAFB(x) FIELD_PREP(GENMASK(1, 0), (x))
> > +#define   NPCM_I3C_MDMACTRL_DMATB(x) FIELD_PREP(GENMASK(3, 2), (x))
> > +#define   NPCM_I3C_MDMACTRL_DMAWIDTH(x) FIELD_PREP(GENMASK(5, 4), (x))
> > +#define NPCM_I3C_MDATACTRL    0x0AC
> > +#define   NPCM_I3C_MDATACTRL_FLUSHTB BIT(0)
> > +#define   NPCM_I3C_MDATACTRL_FLUSHRB BIT(1)
> > +#define   NPCM_I3C_MDATACTRL_UNLOCK_TRIG BIT(3)
> > +#define   NPCM_I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL GENMASK(5, 4)
> > +#define   NPCM_I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY 0
> > +#define   NPCM_I3C_MDATACTRL_RXCOUNT(x) FIELD_GET(GENMASK(28, 24), (x)=
)
> > +#define   NPCM_I3C_MDATACTRL_TXCOUNT(x) FIELD_GET(GENMASK(20, 16), (x)=
)
> > +#define   NPCM_I3C_MDATACTRL_TXFULL BIT(30)
> > +#define   NPCM_I3C_MDATACTRL_RXEMPTY BIT(31)
> > +
> > +#define NPCM_I3C_MWDATAB      0x0B0
> > +#define   NPCM_I3C_MWDATAB_END BIT(8)
> > +
> > +#define NPCM_I3C_MWDATABE     0x0B4
> > +#define NPCM_I3C_MWDATAH      0x0B8
> > +#define NPCM_I3C_MWDATAHE     0x0BC
> > +#define NPCM_I3C_MRDATAB      0x0C0
> > +#define NPCM_I3C_MRDATAH      0x0C8
> > +
> > +#define NPCM_I3C_MDYNADDR     0x0E4
> > +#define   NPCM_MDYNADDR_VALID BIT(0)
> > +#define   NPCM_MDYNADDR_ADDR(x) FIELD_PREP(GENMASK(7, 1), (x))
> > +
> > +#define NPCM_I3C_PARTNO       0x06C
> > +#define NPCM_I3C_VENDORID     0x074
> > +#define   NPCM_I3C_VENDORID_VID(x) FIELD_GET(GENMASK(14, 0), (x))
> > +
> > +#define NPCM_I3C_MAX_DEVS 32
> > +#define NPCM_I3C_PM_TIMEOUT_MS 1000
>
> Above register layer out is very similar with svc-i3c-master.c, I suppose
> you can reuse it and just add DMA support port.
>
> Frank
>

Hi Frank,
Thanks for the review.
There are some reasons I decided to add a new driver for our own platform.
- we have different design logic in the ibi handling to meet our
requirements. This affected the major part of the interrupt handler
and master_xfer function.
- npcm845 i3c uses the old version of silvaco IP and three are several
errata workarounds need to be applied. Some workarounds are specific
to npcm845 hardware.
These changes may not be proper to apply to svc-i3c-master.c.


> > +
> > +/* This parameter depends on the implementation and may be tuned */
> > +#define NPCM_I3C_FIFO_SIZE 16
> > +#define NPCM_I3C_MAX_IBI_PAYLOAD_SIZE 8
> > +#define NPCM_I3C_MAX_RDTERM 255
> > +#define NPCM_I3C_MAX_PPBAUD 15
> > +#define NPCM_I3C_MAX_PPLOW 15
> > +#define NPCM_I3C_MAX_ODBAUD 255
> > +#define NPCM_I3C_MAX_I2CBAUD 15
> > +#define I3C_SCL_PP_PERIOD_NS_MIN 40
> > +#define I3C_SCL_OD_LOW_PERIOD_NS_MIN 200
> > +
> > +/* DMA definitions */
> > +#define MAX_DMA_COUNT                1024
> > +#define DMA_CH_TX            0
> > +#define DMA_CH_RX            1
> > +#define NPCM_GDMA_CTL(n)     (n * 0x20 + 0x00)
> > +#define   NPCM_GDMA_CTL_GDMAMS(x) FIELD_PREP(GENMASK(3, 2), (x))
> > +#define   NPCM_GDMA_CTL_TWS(x) FIELD_PREP(GENMASK(13, 12), (x))
> > +#define   NPCM_GDMA_CTL_GDMAEN       BIT(0)
> > +#define   NPCM_GDMA_CTL_DAFIX        BIT(6)
> > +#define   NPCM_GDMA_CTL_SAFIX        BIT(7)
> > +#define   NPCM_GDMA_CTL_SIEN BIT(8)
> > +#define   NPCM_GDMA_CTL_DM   BIT(15)
> > +#define   NPCM_GDMA_CTL_TC   BIT(18)
> > +#define NPCM_GDMA_SRCB(n)    (n * 0x20 + 0x04)
> > +#define NPCM_GDMA_DSTB(n)    (n * 0x20 + 0x08)
> > +#define NPCM_GDMA_TCNT(n)    (n * 0x20 + 0x0C)
> > +#define NPCM_GDMA_CSRC(n)    (n * 0x20 + 0x10)
> > +#define NPCM_GDMA_CDST(n)    (n * 0x20 + 0x14)
> > +#define NPCM_GDMA_CTCNT(n)   (n * 0x20 + 0x18)
> > +#define NPCM_GDMA_MUX(n)     (((n & 0xFFFF) >> 12) * 2 + 6)
> > +#define GDMA_CH0_EN          GENMASK(6, 5)
> > +#define GDMA_CH1_EN          GENMASK(22, 21)
> > +
> > +struct npcm_i3c_cmd {
> > +     u8 addr;
> > +     bool rnw;
> > +     u8 *in;
> > +     const void *out;
> > +     unsigned int len;
> > +     unsigned int read_len;
> > +     bool continued;
> > +     bool use_dma;
> > +};
> > +
> > +struct npcm_i3c_xfer {
> > +     struct list_head node;
> > +     struct completion comp;
> > +     int ret;
> > +     unsigned int type;
> > +     unsigned int ncmds;
> > +     struct npcm_i3c_cmd cmds[];
> > +};
> > +
> > +struct npcm_i3c_regs_save {
> > +     u32 mconfig;
> > +     u32 mdynaddr;
> > +};
> > +
> > +struct npcm_dma_xfer_desc {
> > +     const u8 *out;
> > +     u8 *in;
> > +     u32 len;
> > +     bool rnw;
> > +     bool end;
> > +};
> > +/**
> > + * struct npcm_i3c_master - npcm845 I3C Master structure
> > + * @base: I3C master controller
> > + * @dev: Corresponding device
> > + * @regs: Memory mapping
> > + * @saved_regs: Volatile values for PM operations
> > + * @free_slots: Bit array of available slots
> > + * @addrs: Array containing the dynamic addresses of each attached dev=
ice
> > + * @descs: Array of descriptors, one per attached device
> > + * @hj_work: Hot-join work
> > + * @irq: Main interrupt
> > + * @pclk: System clock
> > + * @fclk: Fast clock (bus)
> > + * @sclk: Slow clock (other events)
> > + * @xferqueue: Transfer queue structure
> > + * @xferqueue.list: List member
> > + * @xferqueue.cur: Current ongoing transfer
> > + * @xferqueue.lock: Queue lock
> > + * @ibi: IBI structure
> > + * @ibi.num_slots: Number of slots available in @ibi.slots
> > + * @ibi.slots: Available IBI slots
> > + * @ibi.tbq_slot: To be queued IBI slot
> > + * @ibi.lock: IBI lock
> > + * @lock: Transfer lock, prevent concurrent daa/priv_xfer/ccc
> > + * @req_lock: protect between IBI isr and bus operation request
> > + */
> > +struct npcm_i3c_master {
> > +     struct i3c_master_controller base;
> > +     struct device *dev;
> > +     void __iomem *regs;
> > +     struct npcm_i3c_regs_save saved_regs;
> > +     u32 free_slots;
> > +     u8 addrs[NPCM_I3C_MAX_DEVS];
> > +     struct i3c_dev_desc *descs[NPCM_I3C_MAX_DEVS];
> > +     struct work_struct hj_work;
> > +     int irq;
> > +     struct clk *pclk;
> > +     struct clk *fclk;
> > +     struct {
> > +             u32 i3c_pp_hi;
> > +             u32 i3c_pp_lo;
> > +             u32 i3c_pp_sda_rd_skew;
> > +             u32 i3c_pp_sda_wr_skew;
> > +             u32 i3c_od_hi;
> > +             u32 i3c_od_lo;
> > +     } scl_timing;
> > +     struct {
> > +             struct list_head list;
> > +             struct npcm_i3c_xfer *cur;
> > +     } xferqueue;
> > +     struct {
> > +             unsigned int num_slots;
> > +             struct i3c_dev_desc **slots;
> > +             struct i3c_ibi_slot *tbq_slot;
> > +             /* Prevent races within IBI handlers */
> > +             spinlock_t lock;
> > +     } ibi;
> > +     spinlock_t req_lock;
> > +     struct mutex lock;
> > +     struct dentry *debugfs;
> > +
> > +     /* For DMA */
> > +     void __iomem *dma_regs;
> > +     void __iomem *dma_ctl_regs;
> > +     bool use_dma;
> > +     struct completion xfer_comp;
> > +     char *dma_tx_buf;
> > +     char *dma_rx_buf;
> > +     dma_addr_t dma_tx_addr;
> > +     dma_addr_t dma_rx_addr;
> > +     struct npcm_dma_xfer_desc dma_xfer;
> > +
> > +     bool en_hj;
> > +};
> > +
> > +/**
> > + * struct npcm_i3c_i2c_dev_data - Device specific data
> > + * @index: Index in the master tables corresponding to this device
> > + * @ibi: IBI slot index in the master structure
> > + * @ibi_pool: IBI pool associated to this device
> > + */
> > +struct npcm_i3c_i2c_dev_data {
> > +     u8 index;
> > +     int ibi;
> > +     struct i3c_generic_ibi_pool *ibi_pool;
> > +};
> > +
> > +static DEFINE_MUTEX(npcm_i3c_dma_lock);
>
> Why need globel lock for dma?
>
> > +
> > +static int npcm_i3c_master_wait_for_complete(struct npcm_i3c_master *m=
aster);
> > +static void npcm_i3c_master_stop_dma(struct npcm_i3c_master *master);
>
> Is it possible reorder function to avoid declear function here?
>
> > +
> > +static void npcm_i3c_master_dma_lock(void)
> > +{
> > +     mutex_lock(&npcm_i3c_dma_lock);
> > +}
> > +
> > +static void npcm_i3c_master_dma_unlock(void)
> > +{
> > +     mutex_unlock(&npcm_i3c_dma_lock);
> > +}
>
> I think above two help functions is not nesseceary at all.
>
> > +
> > +static bool npcm_i3c_master_error(struct npcm_i3c_master *master)
> > +{
> > +     u32 mstatus, merrwarn;
> > +
> > +     mstatus =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +     if (NPCM_I3C_MSTATUS_ERRWARN(mstatus)) {
> > +             merrwarn =3D readl(master->regs + NPCM_I3C_MERRWARN);
> > +             writel(merrwarn, master->regs + NPCM_I3C_MERRWARN);
> > +
> > +             /* Ignore timeout error */
> > +             if (merrwarn & NPCM_I3C_MERRWARN_TIMEOUT) {
> > +                     dev_dbg(master->dev, "Warning condition: MSTATUS =
0x%08x, MERRWARN 0x%08x\n",
> > +                             mstatus, merrwarn);
> > +                     return false;
> > +             }
> > +
> > +             dev_err(master->dev,
> > +                     "Error condition: MSTATUS 0x%08x, MERRWARN 0x%08x=
\n",
> > +                     mstatus, merrwarn);
> > +
> > +             return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
> > +static void npcm_i3c_master_set_sda_skew(struct npcm_i3c_master *maste=
r, int skew)
> > +{
> > +     u32 val;
> > +
> > +     val =3D readl(master->regs + NPCM_I3C_MCONFIG) & ~NPCM_I3C_MCONFI=
G_SKEW_MASK;
> > +     val |=3D NPCM_I3C_MCONFIG_SKEW(skew);
> > +     writel(val, master->regs + NPCM_I3C_MCONFIG);
> > +}
> > +
> > +static void npcm_i3c_master_enable_interrupts(struct npcm_i3c_master *=
master, u32 mask)
> > +{
> > +     writel(mask, master->regs + NPCM_I3C_MINTSET);
> > +}
> > +
> > +static void npcm_i3c_master_disable_interrupts(struct npcm_i3c_master =
*master)
> > +{
> > +     u32 mask =3D readl(master->regs + NPCM_I3C_MINTSET);
> > +
> > +     writel(mask, master->regs + NPCM_I3C_MINTCLR);
> > +}
> > +
> > +static void npcm_i3c_master_clear_merrwarn(struct npcm_i3c_master *mas=
ter)
> > +{
> > +     /* Clear pending warnings */
> > +     writel(readl(master->regs + NPCM_I3C_MERRWARN),
> > +            master->regs + NPCM_I3C_MERRWARN);
> > +}
> > +
> > +static void npcm_i3c_master_flush_fifo(struct npcm_i3c_master *master)
> > +{
> > +     /* Flush FIFOs */
> > +     writel(NPCM_I3C_MDATACTRL_FLUSHTB | NPCM_I3C_MDATACTRL_FLUSHRB,
> > +            master->regs + NPCM_I3C_MDATACTRL);
> > +}
> > +
> > +static void npcm_i3c_master_flush_rx_fifo(struct npcm_i3c_master *mast=
er)
> > +{
> > +     writel(NPCM_I3C_MDATACTRL_FLUSHRB, master->regs + NPCM_I3C_MDATAC=
TRL);
> > +}
> > +
> > +static void npcm_i3c_master_reset_fifo_trigger(struct npcm_i3c_master =
*master)
> > +{
> > +     u32 reg;
> > +
> > +     /* Set RX and TX tigger levels, flush FIFOs */
> > +     reg =3D NPCM_I3C_MDATACTRL_FLUSHTB |
> > +           NPCM_I3C_MDATACTRL_FLUSHRB |
> > +           NPCM_I3C_MDATACTRL_UNLOCK_TRIG |
> > +           NPCM_I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL |
> > +           NPCM_I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY;
> > +     writel(reg, master->regs + NPCM_I3C_MDATACTRL);
> > +}
> > +
> > +static void npcm_i3c_master_reset(struct npcm_i3c_master *master)
> > +{
> > +     npcm_i3c_master_clear_merrwarn(master);
> > +     npcm_i3c_master_reset_fifo_trigger(master);
> > +     npcm_i3c_master_disable_interrupts(master);
> > +}
> > +
> > +static inline struct npcm_i3c_master *
> > +to_npcm_i3c_master(struct i3c_master_controller *master)
> > +{
> > +     return container_of(master, struct npcm_i3c_master, base);
> > +}
> > +
> > +static void npcm_i3c_master_hj_work(struct work_struct *work)
> > +{
> > +     struct npcm_i3c_master *master;
> > +
> > +     master =3D container_of(work, struct npcm_i3c_master, hj_work);
> > +
> > +     i3c_master_do_daa(&master->base);
> > +}
> > +
> > +static struct i3c_dev_desc *
> > +npcm_i3c_master_dev_from_addr(struct npcm_i3c_master *master,
> > +                          unsigned int ibiaddr)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < NPCM_I3C_MAX_DEVS; i++)
> > +             if (master->addrs[i] =3D=3D ibiaddr)
> > +                     break;
> > +
> > +     if (i =3D=3D NPCM_I3C_MAX_DEVS)
> > +             return NULL;
> > +
> > +     return master->descs[i];
> > +}
> > +
> > +static void npcm_i3c_master_ack_ibi(struct npcm_i3c_master *master,
> > +                                bool mandatory_byte)
> > +{
> > +     unsigned int ibi_ack_nack;
> > +     u32 reg;
> > +
> > +     ibi_ack_nack =3D NPCM_I3C_MCTRL_REQUEST_IBI_ACKNACK;
> > +     if (mandatory_byte)
> > +             ibi_ack_nack |=3D NPCM_I3C_MCTRL_IBIRESP_ACK_WITH_BYTE |
> > +                     NPCM_I3C_MCTRL_RDTERM(NPCM_I3C_MAX_IBI_PAYLOAD_SI=
ZE);
> > +     else
> > +             ibi_ack_nack |=3D NPCM_I3C_MCTRL_IBIRESP_ACK_WITHOUT_BYTE=
;
> > +
> > +     writel(ibi_ack_nack, master->regs + NPCM_I3C_MCTRL);
> > +     readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > +                        NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> > +}
> > +
> > +static void npcm_i3c_master_nack_ibi(struct npcm_i3c_master *master)
> > +{
> > +     u32 reg;
> > +
> > +     writel(NPCM_I3C_MCTRL_REQUEST_IBI_ACKNACK |
> > +            NPCM_I3C_MCTRL_IBIRESP_NACK,
> > +            master->regs + NPCM_I3C_MCTRL);
> > +     readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > +                        NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> > +}
> > +
> > +static void npcm_i3c_master_emit_stop(struct npcm_i3c_master *master)
> > +{
> > +     u32 reg =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +
> > +     /* Do not emit stop in the IDLE or SLVREQ state */
> > +     if (NPCM_I3C_MSTATUS_STATE_IDLE(reg) || NPCM_I3C_MSTATUS_STATE_SL=
VREQ(reg))
> > +             return;
> > +
> > +     /*
> > +      * The spurious IBI event may change controller state to IBIACK, =
switch state
> > +      * to NORMACT before emitSTOP request.
> > +      */
> > +     if (NPCM_I3C_MSTATUS_STATE_IBIACK(reg)) {
> > +             npcm_i3c_master_nack_ibi(master);
> > +             writel(NPCM_I3C_MINT_IBIWON, master->regs + NPCM_I3C_MSTA=
TUS);
> > +     }
> > +
> > +     writel(NPCM_I3C_MCTRL_REQUEST_STOP, master->regs + NPCM_I3C_MCTRL=
);
> > +     readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > +                        NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> > +
> > +     /*
> > +      * This delay is necessary after the emission of a stop, otherwis=
e eg.
> > +      * repeating IBIs do not get detected. There is a note in the man=
ual
> > +      * about it, stating that the stop condition might not be settled
> > +      * correctly if a start condition follows too rapidly.
> > +      */
> > +     udelay(1);
> > +}
> > +
> > +static int npcm_i3c_master_handle_ibi(struct npcm_i3c_master *master,
> > +                                  struct i3c_dev_desc *dev)
> > +{
> > +     struct npcm_i3c_i2c_dev_data *data =3D i3c_dev_get_master_data(de=
v);
> > +     struct i3c_ibi_slot *slot;
> > +     unsigned int count;
> > +     u32 mdatactrl, val;
> > +     int ret;
> > +     u8 *buf;
> > +
> > +     if (!data) {
> > +             dev_err_ratelimited(master->dev, "No data for addr 0x%x\n=
",
> > +                     dev->info.dyn_addr);
> > +             goto no_ibi_pool;
> > +     }
> > +
> > +     if (!data->ibi_pool) {
> > +             dev_err_ratelimited(master->dev, "No ibi pool for addr 0x=
%x\n",
> > +                     master->addrs[data->index]);
> > +             goto no_ibi_pool;
> > +     }
> > +     slot =3D i3c_generic_ibi_get_free_slot(data->ibi_pool);
> > +     if (!slot) {
> > +             dev_err_ratelimited(master->dev, "No free ibi slot\n");
> > +             goto no_ibi_pool;
> > +     }
> > +
> > +     slot->len =3D 0;
> > +     buf =3D slot->data;
> > +
> > +     /*
> > +      * Sometimes I3C HW returns to IDLE state after IBIRCV completed,
> > +      * continue when state becomes IDLE.
> > +      */
> > +     ret =3D readl_relaxed_poll_timeout(master->regs + NPCM_I3C_MSTATU=
S, val,
> > +                                      NPCM_I3C_MSTATUS_COMPLETE(val) |
> > +                                      NPCM_I3C_MSTATUS_STATE_IDLE(val)=
,
> > +                                      0, 1000);
> > +     if (ret) {
> > +             dev_err(master->dev, "Timeout when polling for COMPLETE\n=
");
> > +             if (NPCM_I3C_MSTATUS_RXPEND(val))
> > +                     npcm_i3c_master_flush_rx_fifo(master);
> > +             i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
> > +             slot =3D NULL;
> > +             goto handle_done;
> > +     }
> > +
> > +     while (NPCM_I3C_MSTATUS_RXPEND(readl(master->regs + NPCM_I3C_MSTA=
TUS))  &&
> > +            slot->len < NPCM_I3C_MAX_IBI_PAYLOAD_SIZE) {
> > +             mdatactrl =3D readl(master->regs + NPCM_I3C_MDATACTRL);
> > +             count =3D NPCM_I3C_MDATACTRL_RXCOUNT(mdatactrl);
> > +             readsb(master->regs + NPCM_I3C_MRDATAB, buf, count);
> > +             slot->len +=3D count;
> > +             buf +=3D count;
> > +     }
> > +
> > +handle_done:
> > +     master->ibi.tbq_slot =3D slot;
> > +
> > +     return ret;
> > +
> > +no_ibi_pool:
> > +     /* No ibi pool, drop the payload if received  */
> > +     readl_relaxed_poll_timeout(master->regs + NPCM_I3C_MSTATUS, val,
> > +                                NPCM_I3C_MSTATUS_COMPLETE(val) |
> > +                                NPCM_I3C_MSTATUS_STATE_IDLE(val),
> > +                                0, 1000);
> > +     npcm_i3c_master_flush_rx_fifo(master);
> > +     return -ENOSPC;
> > +}
> > +
> > +static int npcm_i3c_master_handle_ibiwon(struct npcm_i3c_master *maste=
r, bool autoibi)
> > +{
> > +     struct npcm_i3c_i2c_dev_data *data;
> > +     unsigned int ibitype, ibiaddr;
> > +     struct i3c_dev_desc *dev;
> > +     u32 status;
> > +     int ret =3D 0;
> > +
> > +     status =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +     ibitype =3D NPCM_I3C_MSTATUS_IBITYPE(status);
> > +     ibiaddr =3D NPCM_I3C_MSTATUS_IBIADDR(status);
> > +
> > +     dev_dbg(master->dev, "ibitype=3D%d ibiaddr=3D%d\n", ibitype, ibia=
ddr);
> > +     dev_dbg(master->dev, "ibiwon: mctrl=3D0x%x mstatus=3D0x%x\n",
> > +             readl(master->regs + NPCM_I3C_MCTRL), status);
> > +     /* Handle the critical responses to IBI's */
> > +     switch (ibitype) {
> > +     case NPCM_I3C_MSTATUS_IBITYPE_IBI:
> > +             dev =3D npcm_i3c_master_dev_from_addr(master, ibiaddr);
> > +             /* Bypass the invalid ibi with address 0 */
> > +             if (!dev || ibiaddr =3D=3D 0) {
> > +                     if (!autoibi) {
> > +                             npcm_i3c_master_nack_ibi(master);
> > +                             break;
> > +                     }
> > +                     /*
> > +                      * Wait for complete to make sure the subsequent =
emitSTOP
> > +                      * request will be performed in the correct state=
(NORMACT).
> > +                      */
> > +                     readl_relaxed_poll_timeout(master->regs + NPCM_I3=
C_MSTATUS, status,
> > +                                                NPCM_I3C_MSTATUS_COMPL=
ETE(status),
> > +                                                0, 1000);
> > +                     /* Flush the garbage data */
> > +                     if (NPCM_I3C_MSTATUS_RXPEND(status))
> > +                             npcm_i3c_master_flush_rx_fifo(master);
> > +                     break;
> > +             }
> > +             if (!autoibi) {
> > +                     if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
> > +                             npcm_i3c_master_ack_ibi(master, true);
> > +                     else
> > +                             npcm_i3c_master_ack_ibi(master, false);
> > +             }
> > +             npcm_i3c_master_handle_ibi(master, dev);
> > +             break;
> > +     case NPCM_I3C_MSTATUS_IBITYPE_HOT_JOIN:
> > +             npcm_i3c_master_ack_ibi(master, false);
> > +             break;
> > +     case NPCM_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
> > +             npcm_i3c_master_nack_ibi(master);
> > +             status =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +             /* Invalid event may be reported as MR request
> > +              * and sometimes produce dummy bytes. Flush the garbage d=
ata.
> > +              */
> > +             if (NPCM_I3C_MSTATUS_RXPEND(status))
> > +                     npcm_i3c_master_flush_rx_fifo(master);
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     /*
> > +      * If an error happened, we probably got interrupted and the exch=
ange
> > +      * timedout. In this case we just drop everything, emit a stop an=
d wait
> > +      * for the slave to interrupt again.
> > +      */
> > +     if (npcm_i3c_master_error(master)) {
> > +             if (master->ibi.tbq_slot) {
> > +                     data =3D i3c_dev_get_master_data(dev);
> > +                     i3c_generic_ibi_recycle_slot(data->ibi_pool,
> > +                                                  master->ibi.tbq_slot=
);
> > +                     master->ibi.tbq_slot =3D NULL;
> > +             }
> > +
> > +             dev_err(master->dev, "npcm_i3c_master_error in ibiwon\n")=
;
> > +             /*
> > +              * No need to emit stop here because the caller should do=
 it
> > +              * if return error
> > +              */
> > +             ret =3D -EIO;
> > +             goto clear_ibiwon;
> > +     }
> > +
> > +     /* Handle the non critical tasks */
> > +     switch (ibitype) {
> > +     case NPCM_I3C_MSTATUS_IBITYPE_IBI:
> > +             npcm_i3c_master_emit_stop(master);
> > +             if (dev && master->ibi.tbq_slot) {
> > +                     i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
> > +                     master->ibi.tbq_slot =3D NULL;
> > +             }
> > +             break;
> > +     case NPCM_I3C_MSTATUS_IBITYPE_HOT_JOIN:
> > +             /* Emit stop to avoid the INVREQ error after DAA process =
*/
> > +             npcm_i3c_master_emit_stop(master);
> > +             queue_work(master->base.wq, &master->hj_work);
> > +             break;
> > +     case NPCM_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
> > +             ret =3D -EOPNOTSUPP;
> > +     default:
> > +             break;
> > +     }
> > +
> > +clear_ibiwon:
> > +     /* clear IBIWON status */
> > +     writel(NPCM_I3C_MINT_IBIWON, master->regs + NPCM_I3C_MSTATUS);
> > +     return ret;
> > +}
> > +
> > +static void npcm_i3c_master_ibi_isr(struct npcm_i3c_master *master)
> > +{
> > +     u32 val, mstatus;
> > +     int ret;
> > +
> > +     spin_lock(&master->req_lock);
> > +
> > +     /* Check slave ibi handled not yet */
> > +     mstatus =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +     if (!NPCM_I3C_MSTATUS_STATE_SLVREQ(mstatus))
> > +             goto ibi_out;
> > +
> > +     /*
> > +      * IBIWON may be set before NPCM_I3C_MCTRL_REQUEST_AUTO_IBI, caus=
ing
> > +      * readl_relaxed_poll_timeout() to return immediately. Consequent=
ly,
> > +      * ibitype will be 0 since it was last updated only after the 8th=
 SCL
> > +      * cycle, leading to missed client IBI handlers.
> > +      *
> > +      * Clear NPCM_I3C_MINT_IBIWON before sending NPCM_I3C_MCTRL_REQUE=
ST_AUTO_IBI.
> > +      */
> > +     writel(NPCM_I3C_MINT_IBIWON, master->regs + NPCM_I3C_MSTATUS);
> > +
> > +     /* Acknowledge the incoming interrupt with the AUTOIBI mechanism =
*/
> > +     writel(NPCM_I3C_MCTRL_REQUEST_AUTO_IBI |
> > +            NPCM_I3C_MCTRL_IBIRESP_AUTO |
> > +            NPCM_I3C_MCTRL_RDTERM(NPCM_I3C_MAX_IBI_PAYLOAD_SIZE),
> > +            master->regs + NPCM_I3C_MCTRL);
> > +
> > +     /* Wait for IBIWON, should take approximately 100us */
> > +     ret =3D readl_relaxed_poll_timeout_atomic(master->regs + NPCM_I3C=
_MSTATUS, val,
> > +                                      NPCM_I3C_MSTATUS_IBIWON(val), 0,=
 1000);
> > +     if (ret) {
> > +             /* Cancel AUTOIBI if not started */
> > +             val =3D readl(master->regs + NPCM_I3C_MCTRL);
> > +             if (NPCM_I3C_MCTRL_REQUEST(val) =3D=3D NPCM_I3C_MCTRL_REQ=
UEST_AUTO_IBI)
> > +                     writel(0, master->regs + NPCM_I3C_MCTRL);
> > +             dev_err(master->dev, "Timeout when polling for IBIWON\n")=
;
> > +             npcm_i3c_master_clear_merrwarn(master);
> > +             npcm_i3c_master_emit_stop(master);
> > +             goto ibi_out;
> > +     }
> > +
> > +     if (npcm_i3c_master_handle_ibiwon(master, true))
> > +             npcm_i3c_master_emit_stop(master);
> > +ibi_out:
> > +     spin_unlock(&master->req_lock);
> > +}
> > +
> > +static irqreturn_t npcm_i3c_master_irq_handler(int irq, void *dev_id)
> > +{
> > +     struct npcm_i3c_master *master =3D (struct npcm_i3c_master *)dev_=
id;
> > +     u32 active =3D readl(master->regs + NPCM_I3C_MINTMASKED), mstatus=
;
> > +
> > +     if (NPCM_I3C_MSTATUS_COMPLETE(active)) {
> > +             /* Clear COMPLETE status before emit STOP */
> > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MS=
TATUS);
> > +             /* Disable COMPLETE interrupt */
> > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MI=
NTCLR);
> > +
> > +             if (master->dma_xfer.end) {
> > +                     /* Stop DMA to prevent receiving the data of othe=
r transaction */
> > +                     npcm_i3c_master_stop_dma(master);
> > +                     npcm_i3c_master_set_sda_skew(master, 0);
> > +                     npcm_i3c_master_emit_stop(master);
> > +             }
> > +
> > +             complete(&master->xfer_comp);
> > +
> > +             return IRQ_HANDLED;
> > +     }
> > +
> > +     if (NPCM_I3C_MSTATUS_SLVSTART(active)) {
> > +             /* Clear the interrupt status */
> > +             writel(NPCM_I3C_MINT_SLVSTART, master->regs + NPCM_I3C_MS=
TATUS);
> > +
> > +             /* Read I3C state */
> > +             mstatus =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +
> > +             if (NPCM_I3C_MSTATUS_STATE_SLVREQ(mstatus)) {
> > +                     npcm_i3c_master_ibi_isr(master);
> > +             } else {
> > +                     /*
> > +                      * Workaround:
> > +                      * SlaveStart event under bad signals condition. =
SLVSTART bit in
> > +                      * MSTATUS may set even slave device doesn't hold=
ing I3C_SDA low,
> > +                      * but actual SlaveStart event may happened concu=
rently in this
> > +                      * bad signals condition handler. Give a chance t=
o check current
> > +                      * work state and intmask to avoid actual SlaveSt=
art cannot be
> > +                      * trigger after we clear SlaveStart interrupt st=
atus.
> > +                      */
> > +
> > +                     /* Check if state change after we clear interrupt=
 status */
> > +                     active =3D readl(master->regs + NPCM_I3C_MINTMASK=
ED);
> > +                     mstatus =3D readl(master->regs + NPCM_I3C_MSTATUS=
);
> > +
> > +                     if (NPCM_I3C_MSTATUS_STATE_SLVREQ(mstatus)) {
> > +                             if (!NPCM_I3C_MSTATUS_SLVSTART(active))
> > +                                     npcm_i3c_master_ibi_isr(master);
> > +                             /* else: handle interrupt in next time */
> > +                     }
> > +             }
> > +     }
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int npcm_i3c_master_bus_init(struct i3c_master_controller *m)
> > +{
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     struct i3c_bus *bus =3D i3c_master_get_bus(m);
> > +     struct i3c_device_info info =3D {};
> > +     unsigned long fclk_rate, fclk_period_ns;
> > +     unsigned long i3c_scl_rate, i2c_scl_rate;
> > +     unsigned int pp_high_period_ns, od_low_period_ns, i2c_period_ns;
> > +     unsigned int scl_period_ns;
> > +     u32 ppbaud, pplow, odhpp, odbaud, i2cbaud, reg;
> > +     int ret;
> > +
> > +     /* Timings derivation */
> > +     fclk_rate =3D clk_get_rate(master->fclk);
> > +     if (!fclk_rate)
> > +             return -EINVAL;
> > +
> > +     fclk_period_ns =3D DIV_ROUND_UP(1000000000, fclk_rate);
> > +
> > +     /*
> > +      * Configure for Push-Pull mode.
> > +      */
> > +     if (master->scl_timing.i3c_pp_hi >=3D I3C_SCL_PP_PERIOD_NS_MIN &&
> > +         master->scl_timing.i3c_pp_lo >=3D master->scl_timing.i3c_pp_h=
i) {
> > +             ppbaud =3D DIV_ROUND_UP(master->scl_timing.i3c_pp_hi, fcl=
k_period_ns) - 1;
> > +             if (ppbaud > NPCM_I3C_MAX_PPBAUD)
> > +                     ppbaud =3D NPCM_I3C_MAX_PPBAUD;
> > +             pplow =3D DIV_ROUND_UP(master->scl_timing.i3c_pp_lo, fclk=
_period_ns)
> > +                     - (ppbaud + 1);
> > +             if (pplow > NPCM_I3C_MAX_PPLOW)
> > +                     pplow =3D NPCM_I3C_MAX_PPLOW;
> > +             bus->scl_rate.i3c =3D 1000000000 / (((ppbaud + 1) * 2 + p=
plow) * fclk_period_ns);
> > +     } else {
> > +             scl_period_ns =3D DIV_ROUND_UP(1000000000, bus->scl_rate.=
i3c);
> > +             if (bus->scl_rate.i3c =3D=3D 10000000) {
> > +                     /* Workaround for npcm8xx: 40/60 ns */
> > +                     ppbaud =3D DIV_ROUND_UP(40, fclk_period_ns) - 1;
> > +                     pplow =3D DIV_ROUND_UP(20, fclk_period_ns);
> > +             } else {
> > +                     /* 50% duty-cycle */
> > +                     ppbaud =3D DIV_ROUND_UP((scl_period_ns / 2), fclk=
_period_ns) - 1;
> > +                     pplow =3D 0;
> > +             }
> > +             if (ppbaud > NPCM_I3C_MAX_PPBAUD)
> > +                     ppbaud =3D NPCM_I3C_MAX_PPBAUD;
> > +     }
> > +     pp_high_period_ns =3D (ppbaud + 1) * fclk_period_ns;
> > +
> > +     /*
> > +      * Configure for Open-Drain mode.
> > +      */
> > +     if (master->scl_timing.i3c_od_hi >=3D pp_high_period_ns &&
> > +         master->scl_timing.i3c_od_lo >=3D I3C_SCL_OD_LOW_PERIOD_NS_MI=
N) {
> > +             if (master->scl_timing.i3c_od_hi =3D=3D pp_high_period_ns=
)
> > +                     odhpp =3D 1;
> > +             else
> > +                     odhpp =3D 0;
> > +             odbaud =3D DIV_ROUND_UP(master->scl_timing.i3c_od_lo, pp_=
high_period_ns) - 1;
> > +     } else {
> > +             /* Set default OD timing: 1MHz/1000ns with 50% duty cycle=
 */
> > +             odhpp =3D 0;
> > +             odbaud =3D DIV_ROUND_UP(500, pp_high_period_ns) - 1;
> > +     }
> > +     if (odbaud > NPCM_I3C_MAX_ODBAUD)
> > +             odbaud =3D NPCM_I3C_MAX_ODBAUD;
> > +     od_low_period_ns =3D (odbaud + 1) * pp_high_period_ns;
> > +
> > +     /* Configure for I2C mode */
> > +     i2c_period_ns =3D DIV_ROUND_UP(1000000000, bus->scl_rate.i2c);
> > +     if (i2c_period_ns < od_low_period_ns * 2)
> > +             i2c_period_ns =3D od_low_period_ns * 2;
> > +     i2cbaud =3D DIV_ROUND_UP(i2c_period_ns, od_low_period_ns) - 2;
> > +     if (i2cbaud > NPCM_I3C_MAX_I2CBAUD)
> > +             i2cbaud =3D NPCM_I3C_MAX_I2CBAUD;
> > +
> > +     i3c_scl_rate =3D 1000000000 / (((ppbaud + 1) * 2 + pplow) * fclk_=
period_ns);
> > +     i2c_scl_rate =3D 1000000000 / ((i2cbaud + 2) * od_low_period_ns);
> > +
> > +     reg =3D NPCM_I3C_MCONFIG_MASTER_EN |
> > +           NPCM_I3C_MCONFIG_DISTO(0) |
> > +           NPCM_I3C_MCONFIG_HKEEP(3) |
> > +           NPCM_I3C_MCONFIG_ODSTOP(1) |
> > +           NPCM_I3C_MCONFIG_PPBAUD(ppbaud) |
> > +           NPCM_I3C_MCONFIG_PPLOW(pplow) |
> > +           NPCM_I3C_MCONFIG_ODBAUD(odbaud) |
> > +           NPCM_I3C_MCONFIG_ODHPP(odhpp) |
> > +           NPCM_I3C_MCONFIG_SKEW(0) |
> > +           NPCM_I3C_MCONFIG_I2CBAUD(i2cbaud);
> > +     writel(reg, master->regs + NPCM_I3C_MCONFIG);
> > +
> > +     dev_dbg(master->dev, "dts: i3c rate=3D%lu, i2c rate=3D%lu\n",
> > +             bus->scl_rate.i3c, bus->scl_rate.i2c);
> > +     dev_info(master->dev, "fclk=3D%lu, period_ns=3D%lu\n", fclk_rate,=
 fclk_period_ns);
> > +     dev_info(master->dev, "i3c scl_rate=3D%lu\n", i3c_scl_rate);
> > +     dev_info(master->dev, "i2c scl_rate=3D%lu\n", i2c_scl_rate);
> > +     dev_info(master->dev, "pp_high=3D%u, pp_low=3D%lu\n", pp_high_per=
iod_ns,
> > +                     (ppbaud + 1 + pplow) * fclk_period_ns);
> > +     dev_info(master->dev, "pp_sda_rd_skew=3D%d, pp_sda_wr_skew=3D%d\n=
",
> > +                     master->scl_timing.i3c_pp_sda_rd_skew,
> > +                     master->scl_timing.i3c_pp_sda_wr_skew);
> > +     dev_info(master->dev, "od_high=3D%d, od_low=3D%d\n",
> > +                     odhpp ? pp_high_period_ns : od_low_period_ns, od_=
low_period_ns);
> > +     dev_dbg(master->dev, "i2c_high=3D%u, i2c_low=3D%u\n", ((i2cbaud >=
> 1) + 1) * od_low_period_ns,
> > +                     ((i2cbaud >> 1) + 1 + (i2cbaud % 2)) * od_low_per=
iod_ns);
> > +     dev_dbg(master->dev, "ppbaud=3D%d, pplow=3D%d, odbaud=3D%d, i2cba=
ud=3D%d\n",
> > +             ppbaud, pplow, odbaud, i2cbaud);
> > +     dev_info(master->dev, "mconfig=3D0x%x\n", readl(master->regs + NP=
CM_I3C_MCONFIG));
> > +     /* Master core's registration */
> > +     ret =3D i3c_master_get_free_addr(m, 0);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     info.dyn_addr =3D ret;
> > +     reg =3D readl(master->regs + NPCM_I3C_VENDORID);
> > +     info.pid =3D (NPCM_I3C_VENDORID_VID(reg) << 33) | readl(master->r=
egs + NPCM_I3C_PARTNO);
> > +
> > +     writel(NPCM_MDYNADDR_VALID | NPCM_MDYNADDR_ADDR(info.dyn_addr),
> > +            master->regs + NPCM_I3C_MDYNADDR);
> > +
> > +     ret =3D i3c_master_set_info(&master->base, &info);
> > +
> > +     return ret;
> > +}
> > +
> > +static void npcm_i3c_master_bus_cleanup(struct i3c_master_controller *=
m)
> > +{
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +
> > +     npcm_i3c_master_disable_interrupts(master);
> > +
> > +     /* Disable master */
> > +     writel(0, master->regs + NPCM_I3C_MCONFIG);
> > +}
> > +
> > +static int npcm_i3c_master_reserve_slot(struct npcm_i3c_master *master=
)
> > +{
> > +     unsigned int slot;
> > +
> > +     if (!(master->free_slots & GENMASK(NPCM_I3C_MAX_DEVS - 1, 0)))
> > +             return -ENOSPC;
> > +
> > +     slot =3D ffs(master->free_slots) - 1;
> > +
> > +     master->free_slots &=3D ~BIT(slot);
> > +
> > +     return slot;
> > +}
> > +
> > +static void npcm_i3c_master_release_slot(struct npcm_i3c_master *maste=
r,
> > +                                     unsigned int slot)
> > +{
> > +     master->free_slots |=3D BIT(slot);
> > +}
> > +
> > +static int npcm_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> > +{
> > +     struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     struct npcm_i3c_i2c_dev_data *data;
> > +     int slot;
> > +
> > +     slot =3D npcm_i3c_master_reserve_slot(master);
> > +     if (slot < 0)
> > +             return slot;
> > +
> > +     data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> > +     if (!data) {
> > +             npcm_i3c_master_release_slot(master, slot);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     data->ibi =3D -1;
> > +     data->index =3D slot;
> > +     master->addrs[slot] =3D dev->info.dyn_addr ? dev->info.dyn_addr :
> > +                                                dev->info.static_addr;
> > +     master->descs[slot] =3D dev;
> > +
> > +     i3c_dev_set_master_data(dev, data);
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> > +                                        u8 old_dyn_addr)
> > +{
> > +     struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     struct npcm_i3c_i2c_dev_data *data =3D i3c_dev_get_master_data(de=
v);
> > +
> > +     master->addrs[data->index] =3D dev->info.dyn_addr ? dev->info.dyn=
_addr :
> > +                                                       dev->info.stati=
c_addr;
> > +
> > +     return 0;
> > +}
> > +
> > +static void npcm_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> > +{
> > +     struct npcm_i3c_i2c_dev_data *data =3D i3c_dev_get_master_data(de=
v);
> > +     struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +
> > +     master->addrs[data->index] =3D 0;
> > +     npcm_i3c_master_release_slot(master, data->index);
> > +
> > +     kfree(data);
> > +}
> > +
> > +static int npcm_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> > +{
> > +     struct i3c_master_controller *m =3D i2c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     struct npcm_i3c_i2c_dev_data *data;
> > +     int slot;
> > +
> > +     slot =3D npcm_i3c_master_reserve_slot(master);
> > +     if (slot < 0)
> > +             return slot;
> > +
> > +     data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> > +     if (!data) {
> > +             npcm_i3c_master_release_slot(master, slot);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     data->index =3D slot;
> > +     master->addrs[slot] =3D dev->addr;
> > +
> > +     i2c_dev_set_master_data(dev, data);
> > +
> > +     return 0;
> > +}
> > +
> > +static void npcm_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> > +{
> > +     struct npcm_i3c_i2c_dev_data *data =3D i2c_dev_get_master_data(de=
v);
> > +     struct i3c_master_controller *m =3D i2c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +
> > +     npcm_i3c_master_release_slot(master, data->index);
> > +
> > +     kfree(data);
> > +}
> > +
> > +static int npcm_i3c_master_readb(struct npcm_i3c_master *master, u8 *d=
st,
> > +                             unsigned int len)
> > +{
> > +     int ret, i;
> > +     u32 reg;
> > +
> > +     for (i =3D 0; i < len; i++) {
> > +             ret =3D readl_poll_timeout_atomic(master->regs + NPCM_I3C=
_MSTATUS,
> > +                                             reg,
> > +                                             NPCM_I3C_MSTATUS_RXPEND(r=
eg),
> > +                                             0, 1000);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             dst[i] =3D readl(master->regs + NPCM_I3C_MRDATAB);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_i3c_master_do_daa_locked(struct npcm_i3c_master *maste=
r,
> > +                                     u8 *addrs, unsigned int *count)
> > +{
> > +     u64 prov_id[NPCM_I3C_MAX_DEVS] =3D {}, nacking_prov_id =3D 0;
> > +     unsigned int dev_nb =3D 0, last_addr =3D 0;
> > +     unsigned long start =3D jiffies;
> > +     u32 reg;
> > +     int ret, i;
> > +     int dyn_addr;
> > +
> > +     npcm_i3c_master_flush_fifo(master);
> > +
> > +     while (true) {
> > +             /* Enter/proceed with DAA */
> > +             writel(NPCM_I3C_MCTRL_REQUEST_PROC_DAA |
> > +                    NPCM_I3C_MCTRL_TYPE_I3C |
> > +                    NPCM_I3C_MCTRL_IBIRESP_MANUAL |
> > +                    NPCM_I3C_MCTRL_DIR(NPCM_I3C_MCTRL_DIR_WRITE),
> > +                    master->regs + NPCM_I3C_MCTRL);
> > +
> > +             /*
> > +              * Either one slave will send its ID, or the assignment p=
rocess
> > +              * is done.
> > +              */
> > +             ret =3D readl_relaxed_poll_timeout_atomic(master->regs + =
NPCM_I3C_MSTATUS,
> > +                                             reg,
> > +                                             NPCM_I3C_MSTATUS_RXPEND(r=
eg) |
> > +                                             NPCM_I3C_MSTATUS_MCTRLDON=
E(reg),
> > +                                             0, 1000);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             if (time_after(jiffies, start + msecs_to_jiffies(3000))) =
{
> > +                     npcm_i3c_master_emit_stop(master);
> > +                     dev_info(master->dev, "do_daa expired\n");
> > +                     break;
> > +             }
> > +             /* runtime do_daa may ibiwon by others slave devices */
> > +             if (NPCM_I3C_MSTATUS_IBIWON(reg)) {
> > +                     ret =3D npcm_i3c_master_handle_ibiwon(master, fal=
se);
> > +                     if (ret) {
> > +                             dev_err(master->dev, "daa: handle ibi eve=
nt fail, ret=3D%d\n", ret);
> > +                             return ret;
> > +                     }
> > +                     continue;
> > +             }
> > +
> > +             if (dev_nb =3D=3D NPCM_I3C_MAX_DEVS) {
> > +                     npcm_i3c_master_emit_stop(master);
> > +                     dev_info(master->dev, "Reach max devs\n");
> > +                     break;
> > +             }
> > +             if (NPCM_I3C_MSTATUS_RXPEND(reg)) {
> > +                     u8 data[6];
> > +
> > +                     /* Give the slave device a suitable dynamic addre=
ss */
> > +                     dyn_addr =3D i3c_master_get_free_addr(&master->ba=
se, last_addr + 1);
> > +                     if (dyn_addr < 0)
> > +                             return dyn_addr;
> > +                     writel(dyn_addr, master->regs + NPCM_I3C_MWDATAB)=
;
> > +
> > +                     /*
> > +                      * We only care about the 48-bit provisional ID y=
et to
> > +                      * be sure a device does not nack an address twic=
e.
> > +                      * Otherwise, we would just need to flush the RX =
FIFO.
> > +                      */
> > +                     ret =3D npcm_i3c_master_readb(master, data, 6);
> > +                     if (ret)
> > +                             return ret;
> > +
> > +                     for (i =3D 0; i < 6; i++)
> > +                             prov_id[dev_nb] |=3D (u64)(data[i]) << (8=
 * (5 - i));
> > +
> > +                     /* We do not care about the BCR and DCR yet */
> > +                     ret =3D npcm_i3c_master_readb(master, data, 2);
> > +                     if (ret)
> > +                             return ret;
> > +             } else if (NPCM_I3C_MSTATUS_MCTRLDONE(reg)) {
> > +                     if ((NPCM_I3C_MSTATUS_STATE_IDLE(reg) |
> > +                          NPCM_I3C_MSTATUS_STATE_SLVREQ(reg)) &&
> > +                         NPCM_I3C_MSTATUS_COMPLETE(reg)) {
> > +                             /*
> > +                              * Sometimes the controller state is SLVR=
EQ after
> > +                              * DAA request completed, treat it as nor=
mal end.
> > +                              *
> > +                              * All devices received and acked they dy=
namic
> > +                              * address, this is the natural end of th=
e DAA
> > +                              * procedure.
> > +                              */
> > +                             break;
> > +                     } else if (NPCM_I3C_MSTATUS_NACKED(reg)) {
> > +                             /* No I3C devices attached */
> > +                             if (dev_nb =3D=3D 0) {
> > +                                     npcm_i3c_master_emit_stop(master)=
;
> > +                                     break;
> > +                             }
> > +
> > +                             /*
> > +                              * A slave device nacked the address, thi=
s is
> > +                              * allowed only once, DAA will be stopped=
 and
> > +                              * then resumed. The same device is suppo=
sed to
> > +                              * answer again immediately and shall ack=
 the
> > +                              * address this time.
> > +                              */
> > +                             if (prov_id[dev_nb] =3D=3D nacking_prov_i=
d)
> > +                                     return -EIO;
> > +
> > +                             dev_nb--;
> > +                             nacking_prov_id =3D prov_id[dev_nb];
> > +                             npcm_i3c_master_emit_stop(master);
> > +
> > +                             continue;
> > +                     } else {
> > +                             return -EIO;
> > +                     }
> > +             }
> > +
> > +             /* Wait for the slave to be ready to receive its address =
*/
> > +             ret =3D readl_poll_timeout_atomic(master->regs + NPCM_I3C=
_MSTATUS,
> > +                                             reg,
> > +                                             NPCM_I3C_MSTATUS_MCTRLDON=
E(reg) &&
> > +                                             NPCM_I3C_MSTATUS_STATE_DA=
A(reg) &&
> > +                                             NPCM_I3C_MSTATUS_BETWEEN(=
reg),
> > +                                             0, 1000);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             addrs[dev_nb] =3D dyn_addr;
> > +             dev_dbg(master->dev, "DAA: device %d assigned to 0x%02x\n=
",
> > +                     dev_nb, addrs[dev_nb]);
> > +             last_addr =3D addrs[dev_nb++];
> > +     }
> > +
> > +     *count =3D dev_nb;
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_i3c_update_ibirules(struct npcm_i3c_master *master)
> > +{
> > +     struct i3c_dev_desc *dev;
> > +     u32 reg_mbyte =3D 0, reg_nobyte =3D NPCM_I3C_IBIRULES_NOBYTE;
> > +     unsigned int mbyte_addr_ok =3D 0, mbyte_addr_ko =3D 0, nobyte_add=
r_ok =3D 0,
> > +             nobyte_addr_ko =3D 0;
> > +     bool list_mbyte =3D false, list_nobyte =3D false;
> > +
> > +     /* Create the IBIRULES register for both cases */
> > +     i3c_bus_for_each_i3cdev(&master->base.bus, dev) {
> > +             if (I3C_BCR_DEVICE_ROLE(dev->info.bcr) =3D=3D I3C_BCR_I3C=
_MASTER) {
> > +                     if (!(dev->info.bcr & I3C_BCR_IBI_REQ_CAP))
> > +                             continue;
> > +             }
> > +
> > +             if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD) {
> > +                     reg_mbyte |=3D NPCM_I3C_IBIRULES_ADDR(mbyte_addr_=
ok,
> > +                                                        dev->info.dyn_=
addr);
> > +
> > +                     /* IBI rules cannot be applied to devices with MS=
b=3D1 */
> > +                     if (dev->info.dyn_addr & BIT(7))
> > +                             mbyte_addr_ko++;
> > +                     else
> > +                             mbyte_addr_ok++;
> > +             } else {
> > +                     reg_nobyte |=3D NPCM_I3C_IBIRULES_ADDR(nobyte_add=
r_ok,
> > +                                                         dev->info.dyn=
_addr);
> > +
> > +                     /* IBI rules cannot be applied to devices with MS=
b=3D1 */
> > +                     if (dev->info.dyn_addr & BIT(7))
> > +                             nobyte_addr_ko++;
> > +                     else
> > +                             nobyte_addr_ok++;
> > +             }
> > +     }
> > +
> > +     /* Device list cannot be handled by hardware */
> > +     if (!mbyte_addr_ko && mbyte_addr_ok <=3D NPCM_I3C_IBIRULES_ADDRS)
> > +             list_mbyte =3D true;
> > +
> > +     if (!nobyte_addr_ko && nobyte_addr_ok <=3D NPCM_I3C_IBIRULES_ADDR=
S)
> > +             list_nobyte =3D true;
> > +
> > +     /* No list can be properly handled, return an error */
> > +     if (!list_mbyte && !list_nobyte)
> > +             return -ERANGE;
> > +
> > +     /* Pick the first list that can be handled by hardware, randomly =
*/
> > +     if (list_mbyte)
> > +             writel(reg_mbyte, master->regs + NPCM_I3C_IBIRULES);
> > +     else
> > +             writel(reg_nobyte, master->regs + NPCM_I3C_IBIRULES);
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_i3c_master_do_daa(struct i3c_master_controller *m)
> > +{
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     u8 addrs[NPCM_I3C_MAX_DEVS];
> > +     unsigned int dev_nb;
> > +     unsigned long flags;
> > +     int ret, i;
> > +
> > +     mutex_lock(&master->lock);
> > +     spin_lock_irqsave(&master->req_lock, flags);
> > +     /*
> > +      * Fix SCL/SDA timing issue during DAA.
> > +      * Set SKEW bit to 1 before initiating a DAA, set SKEW bit to 0
> > +      * after DAA is completed.
> > +      */
> > +     npcm_i3c_master_set_sda_skew(master, 1);
> > +     ret =3D npcm_i3c_master_do_daa_locked(master, addrs, &dev_nb);
> > +     npcm_i3c_master_set_sda_skew(master, 0);
> > +     spin_unlock_irqrestore(&master->req_lock, flags);
> > +     mutex_unlock(&master->lock);
> > +     if (ret) {
> > +             npcm_i3c_master_emit_stop(master);
> > +             npcm_i3c_master_clear_merrwarn(master);
> > +             goto daa_out;
> > +     }
> > +
> > +     /* Register all devices who participated to the core */
> > +     for (i =3D 0; i < dev_nb; i++) {
> > +             ret =3D i3c_master_add_i3c_dev_locked(m, addrs[i]);
> > +             if (ret)
> > +                     dev_err(master->dev, "Unable to add i3c dev@0x%x,=
 err %d\n",
> > +                             addrs[i], ret);
> > +     }
> > +
> > +     /* Configure IBI auto-rules */
> > +     ret =3D npcm_i3c_update_ibirules(master);
> > +     if (ret)
> > +             dev_err(master->dev, "Cannot handle such a list of device=
s");
> > +
> > +daa_out:
> > +     /* No Slave ACK */
> > +     if (ret =3D=3D -EIO)
> > +             return 0;
> > +
> > +     return ret;
> > +}
> > +
> > +static int npcm_i3c_master_read(struct npcm_i3c_master *master,
> > +                            u8 *in, unsigned int len)
> > +{
> > +     int offset =3D 0, i;
> > +     u32 mdctrl, mstatus;
> > +     bool completed =3D false;
> > +     unsigned int count;
> > +     unsigned long start =3D jiffies;
> > +
> > +     while (!completed) {
> > +             mstatus =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +             if (NPCM_I3C_MSTATUS_COMPLETE(mstatus) !=3D 0)
> > +                     completed =3D true;
> > +
> > +             if (time_after(jiffies, start + msecs_to_jiffies(1000))) =
{
> > +                     dev_dbg(master->dev, "I3C read timeout\n");
> > +                     return -ETIMEDOUT;
> > +             }
> > +
> > +             mdctrl =3D readl(master->regs + NPCM_I3C_MDATACTRL);
> > +             count =3D NPCM_I3C_MDATACTRL_RXCOUNT(mdctrl);
> > +             if (offset + count > len) {
> > +                     dev_err(master->dev, "I3C receive length too long=
!\n");
> > +                     return -EINVAL;
> > +             }
> > +             for (i =3D 0; i < count; i++)
> > +                     in[offset + i] =3D readl(master->regs + NPCM_I3C_=
MRDATAB);
> > +
> > +             offset +=3D count;
> > +     }
> > +
> > +     return offset;
> > +}
> > +
> > +static int npcm_i3c_master_write(struct npcm_i3c_master *master,
> > +                             const u8 *out, unsigned int len)
> > +{
> > +     int offset =3D 0, ret;
> > +     u32 mdctrl;
> > +
> > +     while (offset < len) {
> > +             ret =3D readl_poll_timeout(master->regs + NPCM_I3C_MDATAC=
TRL,
> > +                                      mdctrl,
> > +                                      !(mdctrl & NPCM_I3C_MDATACTRL_TX=
FULL),
> > +                                      0, 1000);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /*
> > +              * The last byte to be sent over the bus must either have=
 the
> > +              * "end" bit set or be written in MWDATABE.
> > +              */
> > +             if (likely(offset < (len - 1)))
> > +                     writel(out[offset++], master->regs + NPCM_I3C_MWD=
ATAB);
> > +             else
> > +                     writel(out[offset++], master->regs + NPCM_I3C_MWD=
ATABE);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void npcm_i3c_master_stop_dma(struct npcm_i3c_master *master)
> > +{
> > +     writel(0, master->dma_regs + NPCM_GDMA_CTL(DMA_CH_TX));
> > +     writel(0, master->dma_regs + NPCM_GDMA_CTL(DMA_CH_RX));
> > +     writel(0, master->regs + NPCM_I3C_MDMACTRL);
> > +
> > +     /* Disable COMPLETE interrupt */
> > +     writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MINTCLR);
> > +}
> > +
> > +static void npcm_i3c_master_write_dma_table(const u8 *src, u32 *dst, i=
nt len)
> > +{
> > +     int i;
> > +
> > +     if (len > MAX_DMA_COUNT)
> > +             return;
> > +
> > +     for (i =3D 0; i < len; i++)
> > +             dst[i] =3D (u32)src[i] & 0xFF;
> > +
> > +     /* Set end bit for last byte */
> > +     dst[len - 1] |=3D 0x100;
> > +}
> > +
> > +static int npcm_i3c_master_start_dma(struct npcm_i3c_master *master)
> > +{
> > +     struct npcm_dma_xfer_desc *xfer =3D &master->dma_xfer;
> > +     int ch =3D xfer->rnw ? DMA_CH_RX : DMA_CH_TX;
> > +     u32 val;
> > +
> > +     if (!xfer->len)
> > +             return 0;
> > +
> > +     dev_dbg(master->dev, "start dma for %s, count %d\n",
> > +             xfer->rnw ? "R" : "W", xfer->len);
> > +
> > +     /* Set DMA transfer count */
> > +     writel(xfer->len, master->dma_regs + NPCM_GDMA_TCNT(ch));
> > +
> > +     /* Write data to DMA TX table */
> > +     if (!xfer->rnw)
> > +             npcm_i3c_master_write_dma_table(xfer->out,
> > +                                            (u32 *)master->dma_tx_buf,
> > +                                            xfer->len);
> > +
> > +     /*
> > +      * Setup I3C DMA control
> > +      * 1 byte DMA width
> > +      * Enable DMA util disabled
> > +      */
> > +     val =3D NPCM_I3C_MDMACTRL_DMAWIDTH(1);
> > +     val |=3D xfer->rnw ? NPCM_I3C_MDMACTRL_DMAFB(2) : NPCM_I3C_MDMACT=
RL_DMATB(2);
> > +     writel(val, master->regs + NPCM_I3C_MDMACTRL);
> > +
> > +     /*
> > +      * Enable DMA
> > +      * Source Address Fixed for RX
> > +      * Destination Address Fixed for TX
> > +      * Use 32-bit transfer width for TX (queal to MWDATAB register wi=
dth)
> > +      */
> > +     val =3D NPCM_GDMA_CTL_GDMAEN;
> > +     if (xfer->rnw)
> > +             val |=3D NPCM_GDMA_CTL_SAFIX | NPCM_GDMA_CTL_GDMAMS(2);
> > +     else
> > +             val |=3D NPCM_GDMA_CTL_DAFIX | NPCM_GDMA_CTL_GDMAMS(1) | =
NPCM_GDMA_CTL_TWS(2);
> > +     writel(val, master->dma_regs + NPCM_GDMA_CTL(ch));
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_i3c_master_wait_for_complete(struct npcm_i3c_master *m=
aster)
> > +{
> > +     struct npcm_dma_xfer_desc *xfer =3D &master->dma_xfer;
> > +     int ch =3D xfer->rnw ? DMA_CH_RX : DMA_CH_TX;
> > +     u32 count;
> > +     int ret;
> > +
> > +     ret =3D wait_for_completion_timeout(&master->xfer_comp, msecs_to_=
jiffies(100));
> > +     if (!ret) {
> > +             dev_err(master->dev, "DMA transfer timeout (%s)\n", xfer-=
>rnw ? "Read" : "write");
> > +             dev_err(master->dev, "mstatus =3D 0x%02x\n", readl(master=
->regs + NPCM_I3C_MSTATUS));
> > +             return -ETIMEDOUT;
> > +     }
> > +
> > +     /* Get the DMA transfer count */
> > +     count =3D readl(master->dma_regs + NPCM_GDMA_CTCNT(ch));
> > +     count =3D (count > xfer->len) ? 0 : (xfer->len - count);
> > +     dev_dbg(master->dev, "dma xfer count %u\n", count);
> > +     if (xfer->rnw)
> > +             memcpy(xfer->in, master->dma_rx_buf, count);
> > +     if (count !=3D xfer->len)
> > +             dev_dbg(master->dev, "short dma xfer(%s), want %d transfe=
r %d\n",
> > +                     xfer->rnw ? "R" : "W", xfer->len, count);
> > +
> > +     npcm_i3c_master_stop_dma(master);
> > +
> > +     return count;
> > +}
> > +
> > +static int npcm_i3c_send_broadcast(struct npcm_i3c_master *master)
> > +{
> > +     u32 reg;
> > +     int ret;
> > +
> > +     writel(NPCM_I3C_MCTRL_REQUEST_START_ADDR |
> > +            NPCM_I3C_MCTRL_TYPE_I3C |
> > +            NPCM_I3C_MCTRL_IBIRESP_AUTO |
> > +            NPCM_I3C_MCTRL_DIR(0) |
> > +            NPCM_I3C_MCTRL_ADDR(I3C_BROADCAST_ADDR) |
> > +            NPCM_I3C_MCTRL_RDTERM(NPCM_I3C_MAX_IBI_PAYLOAD_SIZE),
> > +            master->regs + NPCM_I3C_MCTRL);
> > +     ret =3D readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > +                              NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000=
);
> > +     if (ret)
> > +             return -EIO;
> > +
> > +     if (NPCM_I3C_MSTATUS_IBIWON(reg)) {
> > +             ret =3D npcm_i3c_master_handle_ibiwon(master, true);
> > +             if (ret) {
> > +                     dev_err(master->dev, "xfer read: handle ibi event=
 fail, ret=3D%d\n", ret);
> > +                     return -EIO;
> > +             }
> > +
> > +             /* Clear COMPLETE status of this IBI transaction */
> > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MS=
TATUS);
> > +             return 1;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_i3c_master_xfer(struct npcm_i3c_master *master,
> > +                            bool rnw, unsigned int xfer_type, u8 addr,
> > +                            u8 *in, const u8 *out, unsigned int xfer_l=
en,
> > +                            unsigned int *read_len, bool continued,
> > +                            bool use_dma, bool first)
> > +{
> > +     u32 reg, rdterm =3D *read_len, mstatus, ibiresp;
> > +     int ret, i, count, space;
> > +     unsigned long flags;
> > +     unsigned long start;
> > +     bool bus_locked =3D false;
> > +
> > +     if (rdterm > NPCM_I3C_MAX_RDTERM)
> > +             rdterm =3D NPCM_I3C_MAX_RDTERM;
> > +
> > +     /* Prevent fifo operation from delay by interrupt */
> > +     if (!use_dma)
> > +             local_irq_disable();
> > +     else
> > +             npcm_i3c_master_dma_lock();
> > +
> > +     /* Prevent DMA start while IBI isr is running */
> > +     spin_lock_irqsave(&master->req_lock, flags);
> > +     bus_locked =3D true;
> > +
> > +     /*
> > +      * There is a chance that first tx data bit is lost when it
> > +      * is not ready in FIFO right after address phase.
> > +      * Prepare data before starting the transfer to fix this problem.
> > +      */
> > +     if (!rnw && xfer_len && !use_dma) {
> > +             ret =3D readl_poll_timeout(master->regs + NPCM_I3C_MDATAC=
TRL,
> > +                                      reg,
> > +                                      !(reg & NPCM_I3C_MDATACTRL_TXFUL=
L),
> > +                                      0, 1000);
> > +             if (ret) {
> > +                     bus_locked =3D false;
> > +                     spin_unlock_irqrestore(&master->req_lock, flags);
> > +                     local_irq_enable();
> > +                     return ret;
> > +             }
> > +
> > +             reg =3D readl(master->regs + NPCM_I3C_MDATACTRL);
> > +             space =3D NPCM_I3C_FIFO_SIZE - NPCM_I3C_MDATACTRL_TXCOUNT=
(reg);
> > +             count =3D xfer_len > space ? space : xfer_len;
> > +             for (i =3D 0; i < count; i++) {
> > +                     if (i =3D=3D xfer_len - 1)
> > +                             writel(out[0], master->regs + NPCM_I3C_MW=
DATABE);
> > +                     else
> > +                             writel(out[0], master->regs + NPCM_I3C_MW=
DATAB);
> > +                     out++;
> > +             }
> > +             xfer_len -=3D count;
> > +     }
> > +
> > +     if (use_dma) {
> > +             if (xfer_len > MAX_DMA_COUNT) {
> > +                     dev_err(master->dev, "data is larger than buffer =
size (%d)\n",
> > +                             MAX_DMA_COUNT);
> > +                     spin_unlock_irqrestore(&master->req_lock, flags);
> > +                     npcm_i3c_master_dma_unlock();
> > +                     return -EINVAL;
> > +             }
> > +             master->dma_xfer.out =3D out;
> > +             master->dma_xfer.in =3D in;
> > +             master->dma_xfer.len =3D xfer_len;
> > +             master->dma_xfer.rnw =3D rnw;
> > +             master->dma_xfer.end =3D !continued;
> > +             init_completion(&master->xfer_comp);
> > +     }
> > +
> > +     start =3D jiffies;
> > +
> > +broadcast_start:
> > +     if (first && rnw) {
> > +             /* Send 7E first to avoid collision during master read */
> > +             ret =3D npcm_i3c_send_broadcast(master);
> > +             if (ret < 0) {
> > +                     dev_err(master->dev, "send 7e error\n");
> > +                     goto emit_stop;
> > +             }
> > +             if (time_after(jiffies, start + msecs_to_jiffies(1000))) =
{
> > +                     dev_err(master->dev, "abnormal ibiwon events\n");
> > +                     goto emit_stop;
> > +             }
> > +             if (ret > 0)
> > +                     goto broadcast_start;
> > +     }
> > +
> > +     if (rnw) {
> > +             ibiresp =3D NPCM_I3C_MCTRL_IBIRESP_NACK;
> > +             npcm_i3c_master_set_sda_skew(master,
> > +                             master->scl_timing.i3c_pp_sda_rd_skew);
> > +     } else {
> > +             ibiresp =3D NPCM_I3C_MCTRL_IBIRESP_AUTO;
> > +             npcm_i3c_master_set_sda_skew(master,
> > +                             master->scl_timing.i3c_pp_sda_wr_skew);
> > +     }
> > +
> > +     if (use_dma)
> > +             npcm_i3c_master_start_dma(master);
> > +
> > +retry_start:
> > +     writel(NPCM_I3C_MCTRL_REQUEST_START_ADDR |
> > +            xfer_type |
> > +            ibiresp |
> > +            NPCM_I3C_MCTRL_DIR(rnw) |
> > +            NPCM_I3C_MCTRL_ADDR(addr) |
> > +            NPCM_I3C_MCTRL_RDTERM(rdterm),
> > +            master->regs + NPCM_I3C_MCTRL);
> > +
> > +     ret =3D readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > +                              NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000=
);
> > +     if (ret) {
> > +             dev_err(master->dev, "xfer (%d) wait ctrl-done timeout, m=
status=3D0x%02x\n",
> > +                     rnw, reg);
> > +             goto emit_stop;
> > +     }
> > +
> > +     mstatus =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +     if (NPCM_I3C_MSTATUS_IBIWON(mstatus)) {
> > +             if (rnw) {
> > +                     dev_err(master->dev, "xfer read: re-start but ibi=
won, mstatus=3D0x%02x\n",
> > +                                     mstatus);
> > +                     ret =3D -EIO;
> > +                     goto emit_stop;
> > +             }
> > +
> > +             ret =3D npcm_i3c_master_handle_ibiwon(master, true);
> > +             if (ret) {
> > +                     dev_err(master->dev, "xfer read: handle ibi event=
 fail, ret=3D%d\n", ret);
> > +                     goto emit_stop;
> > +             }
> > +
> > +             if (time_after(jiffies, start + msecs_to_jiffies(1000))) =
{
> > +                     dev_err(master->dev, "abnormal ibiwon events\n");
> > +                     goto emit_stop;
> > +             }
> > +
> > +             /* Clear COMPLETE status of this IBI transaction */
> > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MS=
TATUS);
> > +             goto retry_start;
> > +     }
> > +
> > +     /* Use COMPLETE interrupt as notification of transfer completion =
*/
> > +     if (use_dma)
> > +             npcm_i3c_master_enable_interrupts(master, NPCM_I3C_MINT_C=
OMPLETE);
> > +
> > +     bus_locked =3D false;
> > +     spin_unlock_irqrestore(&master->req_lock, flags);
> > +
> > +     reg =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +     if (NPCM_I3C_MSTATUS_NACKED(reg)) {
> > +             dev_dbg(master->dev, "addr 0x%x NACK\n", addr);
> > +             ret =3D -EIO;
> > +             goto emit_stop;
> > +     }
> > +
> > +     if (use_dma)
> > +             ret =3D npcm_i3c_master_wait_for_complete(master);
> > +     else if (rnw)
> > +             ret =3D npcm_i3c_master_read(master, in, xfer_len);
> > +     else
> > +             ret =3D npcm_i3c_master_write(master, out, xfer_len);
> > +     if (ret < 0)
> > +             goto emit_stop;
> > +
> > +     if (rnw)
> > +             *read_len =3D ret;
> > +
> > +     if (!use_dma) {
> > +             ret =3D readl_poll_timeout(master->regs + NPCM_I3C_MSTATU=
S, reg,
> > +                                      NPCM_I3C_MSTATUS_COMPLETE(reg), =
0, 1000);
> > +             if (ret)
> > +                     goto emit_stop;
> > +
> > +             /* If use_dma, COMPLETE bit is cleared in the isr */
> > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MS=
TATUS);
> > +     }
> > +
> > +
> > +     if (!continued && !use_dma) {
> > +             npcm_i3c_master_set_sda_skew(master, 0);
> > +             npcm_i3c_master_emit_stop(master);
> > +     }
> > +
> > +     if (!use_dma)
> > +             local_irq_enable();
> > +     else
> > +             npcm_i3c_master_dma_unlock();
> > +
> > +     return 0;
> > +
> > +emit_stop:
> > +     if (use_dma)
> > +             npcm_i3c_master_stop_dma(master);
> > +
> > +     if (bus_locked)
> > +             spin_unlock_irqrestore(&master->req_lock, flags);
> > +
> > +     spin_lock_irqsave(&master->req_lock, flags);
> > +
> > +     npcm_i3c_master_set_sda_skew(master, 0);
> > +
> > +     reg =3D readl(master->regs + NPCM_I3C_MSTATUS);
> > +     npcm_i3c_master_emit_stop(master);
> > +     npcm_i3c_master_clear_merrwarn(master);
> > +     npcm_i3c_master_flush_fifo(master);
> > +     spin_unlock_irqrestore(&master->req_lock, flags);
> > +
> > +     if (!use_dma)
> > +             local_irq_enable();
> > +     else
> > +             npcm_i3c_master_dma_unlock();
> > +
> > +     return ret;
> > +}
> > +
> > +static struct npcm_i3c_xfer *
> > +npcm_i3c_master_alloc_xfer(struct npcm_i3c_master *master, unsigned in=
t ncmds)
> > +{
> > +     struct npcm_i3c_xfer *xfer;
> > +
> > +     xfer =3D kzalloc(struct_size(xfer, cmds, ncmds), GFP_KERNEL);
> > +     if (!xfer)
> > +             return NULL;
> > +
> > +     INIT_LIST_HEAD(&xfer->node);
> > +     xfer->ncmds =3D ncmds;
> > +     xfer->ret =3D -ETIMEDOUT;
> > +
> > +     return xfer;
> > +}
> > +
> > +static void npcm_i3c_master_free_xfer(struct npcm_i3c_xfer *xfer)
> > +{
> > +     kfree(xfer);
> > +}
> > +
> > +static void npcm_i3c_master_dequeue_xfer_locked(struct npcm_i3c_master=
 *master,
> > +                                            struct npcm_i3c_xfer *xfer=
)
> > +{
> > +     if (master->xferqueue.cur =3D=3D xfer)
> > +             master->xferqueue.cur =3D NULL;
> > +     else
> > +             list_del_init(&xfer->node);
> > +}
> > +
> > +static void npcm_i3c_master_dequeue_xfer(struct npcm_i3c_master *maste=
r,
> > +                                     struct npcm_i3c_xfer *xfer)
> > +{
> > +     npcm_i3c_master_dequeue_xfer_locked(master, xfer);
> > +}
> > +
> > +static void npcm_i3c_master_start_xfer_locked(struct npcm_i3c_master *=
master)
> > +{
> > +     struct npcm_i3c_xfer *xfer =3D master->xferqueue.cur;
> > +     unsigned long flags;
> > +     int ret, i;
> > +
> > +     if (!xfer)
> > +             return;
> > +
> > +     /* Prevent fifo flush while IBI isr is running */
> > +     spin_lock_irqsave(&master->req_lock, flags);
> > +     npcm_i3c_master_clear_merrwarn(master);
> > +     npcm_i3c_master_flush_fifo(master);
> > +     spin_unlock_irqrestore(&master->req_lock, flags);
> > +
> > +     for (i =3D 0; i < xfer->ncmds; i++) {
> > +             struct npcm_i3c_cmd *cmd =3D &xfer->cmds[i];
> > +
> > +             ret =3D npcm_i3c_master_xfer(master, cmd->rnw, xfer->type=
,
> > +                                       cmd->addr, cmd->in, cmd->out,
> > +                                       cmd->len, &cmd->read_len,
> > +                                       cmd->continued, cmd->use_dma, (=
i =3D=3D 0));
> > +             if (ret)
> > +                     break;
> > +     }
> > +
> > +     xfer->ret =3D ret;
> > +     complete(&xfer->comp);
> > +
> > +     if (ret < 0)
> > +             npcm_i3c_master_dequeue_xfer_locked(master, xfer);
> > +
> > +     xfer =3D list_first_entry_or_null(&master->xferqueue.list,
> > +                                     struct npcm_i3c_xfer,
> > +                                     node);
> > +     if (xfer)
> > +             list_del_init(&xfer->node);
> > +
> > +     master->xferqueue.cur =3D xfer;
> > +     npcm_i3c_master_start_xfer_locked(master);
> > +}
> > +
> > +static void npcm_i3c_master_enqueue_xfer(struct npcm_i3c_master *maste=
r,
> > +                                     struct npcm_i3c_xfer *xfer)
> > +{
> > +     init_completion(&xfer->comp);
> > +     if (master->xferqueue.cur) {
> > +             list_add_tail(&xfer->node, &master->xferqueue.list);
> > +     } else {
> > +             master->xferqueue.cur =3D xfer;
> > +             npcm_i3c_master_start_xfer_locked(master);
> > +     }
> > +}
> > +
> > +static bool
> > +npcm_i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> > +                             const struct i3c_ccc_cmd *cmd)
> > +{
> > +     /* No software support for CCC commands targeting more than one s=
lave */
> > +     return (cmd->ndests =3D=3D 1);
> > +}
> > +
> > +static int npcm_i3c_master_send_bdcast_ccc_cmd(struct npcm_i3c_master =
*master,
> > +                                           struct i3c_ccc_cmd *ccc)
> > +{
> > +     unsigned int xfer_len =3D ccc->dests[0].payload.len + 1;
> > +     struct npcm_i3c_xfer *xfer;
> > +     struct npcm_i3c_cmd *cmd;
> > +     u8 *buf;
> > +     int ret;
> > +
> > +     xfer =3D npcm_i3c_master_alloc_xfer(master, 1);
> > +     if (!xfer)
> > +             return -ENOMEM;
> > +
> > +     buf =3D kmalloc(xfer_len, GFP_KERNEL);
> > +     if (!buf) {
> > +             npcm_i3c_master_free_xfer(xfer);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     buf[0] =3D ccc->id;
> > +     memcpy(&buf[1], ccc->dests[0].payload.data, ccc->dests[0].payload=
.len);
> > +
> > +     xfer->type =3D NPCM_I3C_MCTRL_TYPE_I3C;
> > +
> > +     cmd =3D &xfer->cmds[0];
> > +     cmd->addr =3D ccc->dests[0].addr;
> > +     cmd->rnw =3D ccc->rnw;
> > +     cmd->in =3D NULL;
> > +     cmd->out =3D buf;
> > +     cmd->len =3D xfer_len;
> > +     cmd->read_len =3D 0;
> > +     cmd->continued =3D false;
> > +
> > +     mutex_lock(&master->lock);
> > +     npcm_i3c_master_enqueue_xfer(master, xfer);
> > +     if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(10=
00)))
> > +             npcm_i3c_master_dequeue_xfer(master, xfer);
> > +     mutex_unlock(&master->lock);
> > +
> > +     ret =3D xfer->ret;
> > +     kfree(buf);
> > +     npcm_i3c_master_free_xfer(xfer);
> > +
> > +     return ret;
> > +}
> > +
> > +static int npcm_i3c_master_send_direct_ccc_cmd(struct npcm_i3c_master =
*master,
> > +                                           struct i3c_ccc_cmd *ccc)
> > +{
> > +     unsigned int xfer_len =3D ccc->dests[0].payload.len;
> > +     unsigned int read_len =3D ccc->rnw ? xfer_len : 0;
> > +     struct npcm_i3c_xfer *xfer;
> > +     struct npcm_i3c_cmd *cmd;
> > +     int ret;
> > +
> > +     xfer =3D npcm_i3c_master_alloc_xfer(master, 2);
> > +     if (!xfer)
> > +             return -ENOMEM;
> > +
> > +     xfer->type =3D NPCM_I3C_MCTRL_TYPE_I3C;
> > +
> > +     /* Broadcasted message */
> > +     cmd =3D &xfer->cmds[0];
> > +     cmd->addr =3D I3C_BROADCAST_ADDR;
> > +     cmd->rnw =3D 0;
> > +     cmd->in =3D NULL;
> > +     cmd->out =3D &ccc->id;
> > +     cmd->len =3D 1;
> > +     cmd->read_len =3D 0;
> > +     cmd->continued =3D true;
> > +
> > +     /* Directed message */
> > +     cmd =3D &xfer->cmds[1];
> > +     cmd->addr =3D ccc->dests[0].addr;
> > +     cmd->rnw =3D ccc->rnw;
> > +     cmd->in =3D ccc->rnw ? ccc->dests[0].payload.data : NULL;
> > +     cmd->out =3D ccc->rnw ? NULL : ccc->dests[0].payload.data,
> > +     cmd->len =3D xfer_len;
> > +     cmd->read_len =3D read_len;
> > +     cmd->continued =3D false;
> > +
> > +     mutex_lock(&master->lock);
> > +     npcm_i3c_master_enqueue_xfer(master, xfer);
> > +     if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(10=
00)))
> > +             npcm_i3c_master_dequeue_xfer(master, xfer);
> > +     mutex_unlock(&master->lock);
> > +
> > +     if (cmd->read_len !=3D xfer_len)
> > +             ccc->dests[0].payload.len =3D cmd->read_len;
> > +
> > +     ret =3D xfer->ret;
> > +     npcm_i3c_master_free_xfer(xfer);
> > +
> > +     return ret;
> > +}
> > +
> > +static int npcm_i3c_master_send_ccc_cmd(struct i3c_master_controller *=
m,
> > +                                    struct i3c_ccc_cmd *cmd)
> > +{
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     bool broadcast =3D cmd->id < 0x80;
> > +     int ret;
> > +
> > +     if (broadcast)
> > +             ret =3D npcm_i3c_master_send_bdcast_ccc_cmd(master, cmd);
> > +     else
> > +             ret =3D npcm_i3c_master_send_direct_ccc_cmd(master, cmd);
> > +
> > +     if (ret) {
> > +             dev_dbg(master->dev, "send ccc 0x%02x %s, ret =3D %d\n",
> > +                             cmd->id, broadcast ? "(broadcast)" : "", =
ret);
> > +             cmd->err =3D I3C_ERROR_M2;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int npcm_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> > +                                  struct i3c_priv_xfer *xfers,
> > +                                  int nxfers)
> > +{
> > +     struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     struct npcm_i3c_i2c_dev_data *data =3D i3c_dev_get_master_data(de=
v);
> > +     struct npcm_i3c_xfer *xfer;
> > +     int ret, i;
> > +
> > +     xfer =3D npcm_i3c_master_alloc_xfer(master, nxfers);
> > +     if (!xfer)
> > +             return -ENOMEM;
> > +
> > +     xfer->type =3D NPCM_I3C_MCTRL_TYPE_I3C;
> > +
> > +     for (i =3D 0; i < nxfers; i++) {
> > +             struct npcm_i3c_cmd *cmd =3D &xfer->cmds[i];
> > +
> > +             cmd->addr =3D master->addrs[data->index];
> > +             cmd->rnw =3D xfers[i].rnw;
> > +             cmd->in =3D xfers[i].rnw ? xfers[i].data.in : NULL;
> > +             cmd->out =3D xfers[i].rnw ? NULL : xfers[i].data.out;
> > +             cmd->len =3D xfers[i].len;
> > +             cmd->read_len =3D xfers[i].rnw ? xfers[i].len : 0;
> > +             cmd->continued =3D (i + 1) < nxfers;
> > +             if (master->use_dma && xfers[i].len > 1)
> > +                     cmd->use_dma =3D true;
> > +     }
> > +
> > +     mutex_lock(&master->lock);
> > +     npcm_i3c_master_enqueue_xfer(master, xfer);
> > +     if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(10=
00)))
> > +             npcm_i3c_master_dequeue_xfer(master, xfer);
> > +     mutex_unlock(&master->lock);
> > +
> > +     for (i =3D 0; i < nxfers; i++) {
> > +             struct npcm_i3c_cmd *cmd =3D &xfer->cmds[i];
> > +
> > +             if (xfers[i].rnw)
> > +                     xfers[i].len =3D cmd->read_len;
> > +     }
> > +     ret =3D xfer->ret;
> > +     npcm_i3c_master_free_xfer(xfer);
> > +
> > +     return ret;
> > +}
> > +
> > +static int npcm_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> > +                                 const struct i2c_msg *xfers,
> > +                                 int nxfers)
> > +{
> > +     struct i3c_master_controller *m =3D i2c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     struct npcm_i3c_i2c_dev_data *data =3D i2c_dev_get_master_data(de=
v);
> > +     struct npcm_i3c_xfer *xfer;
> > +     int ret, i;
> > +
> > +     xfer =3D npcm_i3c_master_alloc_xfer(master, nxfers);
> > +     if (!xfer)
> > +             return -ENOMEM;
> > +
> > +     xfer->type =3D NPCM_I3C_MCTRL_TYPE_I2C;
> > +
> > +     for (i =3D 0; i < nxfers; i++) {
> > +             struct npcm_i3c_cmd *cmd =3D &xfer->cmds[i];
> > +
> > +             cmd->addr =3D master->addrs[data->index];
> > +             cmd->rnw =3D xfers[i].flags & I2C_M_RD;
> > +             cmd->in =3D cmd->rnw ? xfers[i].buf : NULL;
> > +             cmd->out =3D cmd->rnw ? NULL : xfers[i].buf;
> > +             cmd->len =3D xfers[i].len;
> > +             cmd->read_len =3D cmd->rnw ? xfers[i].len : 0;
> > +             cmd->continued =3D (i + 1 < nxfers);
> > +     }
> > +
> > +     mutex_lock(&master->lock);
> > +     npcm_i3c_master_enqueue_xfer(master, xfer);
> > +     if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(10=
00)))
> > +             npcm_i3c_master_dequeue_xfer(master, xfer);
> > +     mutex_unlock(&master->lock);
> > +
> > +     ret =3D xfer->ret;
> > +     npcm_i3c_master_free_xfer(xfer);
> > +
> > +     return ret;
> > +}
> > +
> > +static int npcm_i3c_master_request_ibi(struct i3c_dev_desc *dev,
> > +                                   const struct i3c_ibi_setup *req)
> > +{
> > +     struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     struct npcm_i3c_i2c_dev_data *data =3D i3c_dev_get_master_data(de=
v);
> > +     unsigned long flags;
> > +     unsigned int i;
> > +     struct i3c_ibi_setup ibi_req;
> > +
> > +     if (dev->ibi->max_payload_len > NPCM_I3C_MAX_IBI_PAYLOAD_SIZE) {
> > +             dev_err(master->dev, "IBI max payload %d should be < %d\n=
",
> > +                     dev->ibi->max_payload_len, NPCM_I3C_MAX_IBI_PAYLO=
AD_SIZE + 1);
> > +             return -ERANGE;
> > +     }
> > +
> > +     memcpy(&ibi_req, req, sizeof(struct i3c_ibi_setup));
> > +     ibi_req.max_payload_len =3D NPCM_I3C_MAX_IBI_PAYLOAD_SIZE;
> > +     data->ibi_pool =3D i3c_generic_ibi_alloc_pool(dev, &ibi_req);
> > +     if (IS_ERR(data->ibi_pool))
> > +             return PTR_ERR(data->ibi_pool);
> > +
> > +     spin_lock_irqsave(&master->ibi.lock, flags);
> > +     for (i =3D 0; i < master->ibi.num_slots; i++) {
> > +             if (!master->ibi.slots[i]) {
> > +                     data->ibi =3D i;
> > +                     master->ibi.slots[i] =3D dev;
> > +                     break;
> > +             }
> > +     }
> > +     spin_unlock_irqrestore(&master->ibi.lock, flags);
> > +
> > +     if (i < master->ibi.num_slots)
> > +             return 0;
> > +
> > +     i3c_generic_ibi_free_pool(data->ibi_pool);
> > +     data->ibi_pool =3D NULL;
> > +
> > +     return -ENOSPC;
> > +}
> > +
> > +static void npcm_i3c_master_free_ibi(struct i3c_dev_desc *dev)
> > +{
> > +     struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     struct npcm_i3c_i2c_dev_data *data =3D i3c_dev_get_master_data(de=
v);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&master->ibi.lock, flags);
> > +     master->ibi.slots[data->ibi] =3D NULL;
> > +     data->ibi =3D -1;
> > +     spin_unlock_irqrestore(&master->ibi.lock, flags);
> > +
> > +     i3c_generic_ibi_free_pool(data->ibi_pool);
> > +}
> > +
> > +static int npcm_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
> > +{
> > +     struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +
> > +     /* Clear the interrupt status */
> > +     writel(NPCM_I3C_MINT_SLVSTART, master->regs + NPCM_I3C_MSTATUS);
> > +     npcm_i3c_master_enable_interrupts(master, NPCM_I3C_MINT_SLVSTART)=
;
> > +
> > +     return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVEN=
T_SIR);
> > +}
> > +
> > +static int npcm_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
> > +{
> > +     struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> > +     struct npcm_i3c_master *master =3D to_npcm_i3c_master(m);
> > +     int ret;
> > +
> > +     writel(NPCM_I3C_MINT_SLVSTART, master->regs + NPCM_I3C_MINTCLR);
> > +
> > +     ret =3D i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EV=
ENT_SIR);
> > +
> > +     return ret;
> > +}
> > +
> > +static void npcm_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
> > +                                         struct i3c_ibi_slot *slot)
> > +{
> > +     struct npcm_i3c_i2c_dev_data *data =3D i3c_dev_get_master_data(de=
v);
> > +
> > +     i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
> > +}
> > +
> > +static const struct i3c_master_controller_ops npcm_i3c_master_ops =3D =
{
> > +     .bus_init =3D npcm_i3c_master_bus_init,
> > +     .bus_cleanup =3D npcm_i3c_master_bus_cleanup,
> > +     .attach_i3c_dev =3D npcm_i3c_master_attach_i3c_dev,
> > +     .detach_i3c_dev =3D npcm_i3c_master_detach_i3c_dev,
> > +     .reattach_i3c_dev =3D npcm_i3c_master_reattach_i3c_dev,
> > +     .attach_i2c_dev =3D npcm_i3c_master_attach_i2c_dev,
> > +     .detach_i2c_dev =3D npcm_i3c_master_detach_i2c_dev,
> > +     .do_daa =3D npcm_i3c_master_do_daa,
> > +     .supports_ccc_cmd =3D npcm_i3c_master_supports_ccc_cmd,
> > +     .send_ccc_cmd =3D npcm_i3c_master_send_ccc_cmd,
> > +     .priv_xfers =3D npcm_i3c_master_priv_xfers,
> > +     .i2c_xfers =3D npcm_i3c_master_i2c_xfers,
> > +     .request_ibi =3D npcm_i3c_master_request_ibi,
> > +     .free_ibi =3D npcm_i3c_master_free_ibi,
> > +     .recycle_ibi_slot =3D npcm_i3c_master_recycle_ibi_slot,
> > +     .enable_ibi =3D npcm_i3c_master_enable_ibi,
> > +     .disable_ibi =3D npcm_i3c_master_disable_ibi,
> > +};
> > +
> > +static int npcm_i3c_master_prepare_clks(struct npcm_i3c_master *master=
)
> > +{
> > +     int ret =3D 0;
> > +
> > +     ret =3D clk_prepare_enable(master->pclk);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D clk_prepare_enable(master->fclk);
> > +     if (ret) {
> > +             clk_disable_unprepare(master->pclk);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void npcm_i3c_master_unprepare_clks(struct npcm_i3c_master *mas=
ter)
> > +{
> > +     clk_disable_unprepare(master->pclk);
> > +     clk_disable_unprepare(master->fclk);
> > +}
> > +
> > +static struct dentry *npcm_i3c_debugfs_dir;
> > +static int debug_show(struct seq_file *seq, void *v)
> > +{
> > +     struct npcm_i3c_master *master =3D seq->private;
> > +
> > +     seq_printf(seq, "MSTATUS=3D0x%x\n", readl(master->regs + NPCM_I3C=
_MSTATUS));
> > +     seq_printf(seq, "MERRWARN=3D0x%x\n", readl(master->regs + NPCM_I3=
C_MERRWARN));
> > +     seq_printf(seq, "MCTRL=3D0x%x\n", readl(master->regs + NPCM_I3C_M=
CTRL));
> > +     seq_printf(seq, "MDATACTRL=3D0x%x\n", readl(master->regs + NPCM_I=
3C_MDATACTRL));
> > +     seq_printf(seq, "MCONFIG=3D0x%x\n", readl(master->regs + NPCM_I3C=
_MCONFIG));
> > +
> > +     return 0;
> > +}
> > +
> > +DEFINE_SHOW_ATTRIBUTE(debug);
> > +
> > +static void npcm_i3c_init_debugfs(struct platform_device *pdev,
> > +                              struct npcm_i3c_master *master)
> > +{
> > +     if (!npcm_i3c_debugfs_dir) {
> > +             npcm_i3c_debugfs_dir =3D debugfs_create_dir("npcm_i3c", N=
ULL);
> > +             if (!npcm_i3c_debugfs_dir)
> > +                     return;
> > +     }
> > +
> > +     master->debugfs =3D debugfs_create_dir(dev_name(&pdev->dev),
> > +                                          npcm_i3c_debugfs_dir);
> > +     if (!master->debugfs)
> > +             return;
> > +
> > +     debugfs_create_file("debug", 0444, master->debugfs, master, &debu=
g_fops);
> > +}
> > +
> > +static int npcm_i3c_setup_dma(struct platform_device *pdev, struct npc=
m_i3c_master *master)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     u32 dma_conn, dma_ctl, reg_base;
> > +
> > +     if (!of_property_read_bool(dev->of_node, "use-dma"))
> > +             return 0;
> > +
> > +     master->dma_regs =3D devm_platform_ioremap_resource_byname(pdev, =
"dma");
> > +     if (IS_ERR(master->dma_regs))
> > +             return 0;
> > +
> > +     master->dma_ctl_regs =3D devm_platform_ioremap_resource_byname(pd=
ev, "dma_ctl");
> > +     if (IS_ERR(master->dma_ctl_regs))
> > +             return 0;
> > +
> > +     /* DMA TX transfer width is 32 bits(MWDATAB width) for each byte =
sent to I3C bus */
> > +     master->dma_tx_buf =3D dma_alloc_coherent(dev, MAX_DMA_COUNT * 4,
> > +                                             &master->dma_tx_addr, GFP=
_KERNEL);
> > +     if (!master->dma_tx_buf)
> > +             return -ENOMEM;
> > +
> > +     master->dma_rx_buf =3D dma_alloc_coherent(dev, MAX_DMA_COUNT,
> > +                                             &master->dma_rx_addr, GFP=
_KERNEL);
> > +     if (!master->dma_rx_buf) {
> > +             dma_free_coherent(master->dev, MAX_DMA_COUNT * 4, master-=
>dma_tx_buf,
> > +                               master->dma_tx_addr);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     /*
> > +      * Set DMA channel connectivity
> > +      * channel 0: I3C TX, channel 1: I3C RX
> > +      */
> > +     of_property_read_u32_index(dev->of_node, "reg", 0, &reg_base);
> > +     dma_conn =3D NPCM_GDMA_MUX(reg_base);
> > +     dma_ctl =3D GDMA_CH0_EN | GDMA_CH1_EN | (dma_conn + 1) << 16 | dm=
a_conn;
> > +     writel(dma_ctl, master->dma_ctl_regs);
> > +     master->use_dma =3D true;
> > +     dev_info(dev, "Using DMA (req_sel %d)\n", dma_conn);
> > +
> > +     /*
> > +      * Setup GDMA Channel for TX (Memory to I3C FIFO)
> > +      */
> > +     writel(master->dma_tx_addr, master->dma_regs + NPCM_GDMA_SRCB(DMA=
_CH_TX));
> > +     writel(reg_base + NPCM_I3C_MWDATAB, master->dma_regs +
> > +            NPCM_GDMA_DSTB(DMA_CH_TX));
> > +     /*
> > +      * Setup GDMA Channel for RX (I3C FIFO to Memory)
> > +      */
> > +     writel(reg_base + NPCM_I3C_MRDATAB, master->dma_regs +
> > +            NPCM_GDMA_SRCB(DMA_CH_RX));
> > +     writel(master->dma_rx_addr, master->dma_regs + NPCM_GDMA_DSTB(DMA=
_CH_RX));
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_i3c_master_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct npcm_i3c_master *master;
> > +     struct reset_control *reset;
> > +     u32 val;
> > +     int ret;
> > +
> > +     master =3D devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> > +     if (!master)
> > +             return -ENOMEM;
> > +
> > +     master->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(master->regs))
> > +             return PTR_ERR(master->regs);
> > +
> > +     master->pclk =3D devm_clk_get(dev, "pclk");
> > +     if (IS_ERR(master->pclk))
> > +             return PTR_ERR(master->pclk);
> > +
> > +     master->fclk =3D devm_clk_get(dev, "fast_clk");
> > +     if (IS_ERR(master->fclk))
> > +             return PTR_ERR(master->fclk);
> > +
> > +     master->irq =3D platform_get_irq(pdev, 0);
> > +     if (master->irq < 0)
> > +             return master->irq;
> > +
> > +     master->dev =3D dev;
> > +
> > +     ret =3D npcm_i3c_master_prepare_clks(master);
> > +     if (ret)
> > +             return ret;
> > +
> > +     reset =3D devm_reset_control_get(&pdev->dev, NULL);
> > +     if (!IS_ERR(reset)) {
> > +             reset_control_assert(reset);
> > +             udelay(5);
> > +             reset_control_deassert(reset);
> > +     }
> > +     INIT_WORK(&master->hj_work, npcm_i3c_master_hj_work);
> > +     ret =3D devm_request_irq(dev, master->irq, npcm_i3c_master_irq_ha=
ndler,
> > +                            IRQF_NO_SUSPEND, "npcm-i3c-irq", master);
> > +     if (ret)
> > +             goto err_disable_clks;
> > +
> > +     master->free_slots =3D GENMASK(NPCM_I3C_MAX_DEVS - 1, 0);
> > +
> > +     mutex_init(&master->lock);
> > +     INIT_LIST_HEAD(&master->xferqueue.list);
> > +
> > +     spin_lock_init(&master->req_lock);
> > +     spin_lock_init(&master->ibi.lock);
> > +     master->ibi.num_slots =3D NPCM_I3C_MAX_DEVS;
> > +     master->ibi.slots =3D devm_kcalloc(&pdev->dev, master->ibi.num_sl=
ots,
> > +                                      sizeof(*master->ibi.slots),
> > +                                      GFP_KERNEL);
> > +     if (!master->ibi.slots) {
> > +             ret =3D -ENOMEM;
> > +             goto err_disable_clks;
> > +     }
> > +
> > +     platform_set_drvdata(pdev, master);
> > +
> > +     npcm_i3c_master_reset(master);
> > +
> > +     if (of_property_read_bool(dev->of_node, "enable-hj"))
> > +             master->en_hj =3D true;
> > +     if (!of_property_read_u32(dev->of_node, "i3c-pp-scl-hi-period-ns"=
, &val))
> > +             master->scl_timing.i3c_pp_hi =3D val;
> > +
> > +     if (!of_property_read_u32(dev->of_node, "i3c-pp-scl-lo-period-ns"=
, &val))
> > +             master->scl_timing.i3c_pp_lo =3D val;
> > +
> > +     if (!of_property_read_u32(dev->of_node, "i3c-pp-sda-rd-skew", &va=
l))
> > +             master->scl_timing.i3c_pp_sda_rd_skew =3D val;
> > +
> > +     if (!of_property_read_u32(dev->of_node, "i3c-pp-sda-wr-skew", &va=
l))
> > +             master->scl_timing.i3c_pp_sda_wr_skew =3D val;
> > +
> > +     if (!of_property_read_u32(dev->of_node, "i3c-od-scl-hi-period-ns"=
, &val))
> > +             master->scl_timing.i3c_od_hi =3D val;
> > +
> > +     if (!of_property_read_u32(dev->of_node, "i3c-od-scl-lo-period-ns"=
, &val))
> > +             master->scl_timing.i3c_od_lo =3D val;
> > +
> > +     npcm_i3c_master_clear_merrwarn(master);
> > +     npcm_i3c_master_flush_fifo(master);
> > +
> > +     ret =3D npcm_i3c_setup_dma(pdev, master);
> > +     if (ret)
> > +             goto err_disable_clks;
> > +
> > +     npcm_i3c_init_debugfs(pdev, master);
> > +
> > +     /* Register the master */
> > +     ret =3D i3c_master_register(&master->base, &pdev->dev,
> > +                               &npcm_i3c_master_ops, false);
> > +     if (ret)
> > +             goto err_disable_clks;
> > +
> > +     if (master->en_hj) {
> > +             dev_info(master->dev, "enable hot-join\n");
> > +             npcm_i3c_master_enable_interrupts(master, NPCM_I3C_MINT_S=
LVSTART);
> > +     }
> > +     return 0;
> > +
> > +     debugfs_remove_recursive(master->debugfs);
> > +
> > +err_disable_clks:
> > +     npcm_i3c_master_unprepare_clks(master);
> > +
> > +     return ret;
> > +}
> > +
> > +static int npcm_i3c_master_remove(struct platform_device *pdev)
> > +{
> > +     struct npcm_i3c_master *master =3D platform_get_drvdata(pdev);
> > +
> > +     /* Avoid ibi events during driver unbinding */
> > +     writel(NPCM_I3C_MINT_SLVSTART, master->regs + NPCM_I3C_MINTCLR);
> > +
> > +     debugfs_remove_recursive(master->debugfs);
> > +
> > +     i3c_master_unregister(&master->base);
> > +
> > +     if (master->use_dma) {
> > +             dma_free_coherent(master->dev, MAX_DMA_COUNT * 4, master-=
>dma_tx_buf,
> > +                               master->dma_tx_addr);
> > +             dma_free_coherent(master->dev, MAX_DMA_COUNT, master->dma=
_rx_buf,
> > +                               master->dma_rx_addr);
> > +     }
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id npcm_i3c_master_of_match_tbl[] =3D {
> > +     { .compatible =3D "nuvoton,npcm845-i3c" },
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, npcm_i3c_master_of_match_tbl);
> > +
> > +static struct platform_driver npcm_i3c_master =3D {
> > +     .probe =3D npcm_i3c_master_probe,
> > +     .remove =3D npcm_i3c_master_remove,
> > +     .driver =3D {
> > +             .name =3D "npcm845-i3c-master",
> > +             .of_match_table =3D npcm_i3c_master_of_match_tbl,
> > +     },
> > +};
> > +module_platform_driver(npcm_i3c_master);
> > +
> > +MODULE_AUTHOR("Stanley Chu <yschu@nuvoton.com>");
> > +MODULE_AUTHOR("James Chiang <cpchiang1@nuvoton.com>");
> > +MODULE_DESCRIPTION("Nuvoton NPCM845 I3C master driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
