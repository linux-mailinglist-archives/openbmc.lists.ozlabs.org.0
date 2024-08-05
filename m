Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0996794753A
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 08:27:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l0k6L89O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcmhN71Ptz3cbL
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 16:27:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l0k6L89O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=stanley.chuys@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wcmgt3F0jz2yhZ
	for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2024 16:27:20 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-39b37637977so441315ab.1
        for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2024 23:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722839238; x=1723444038; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5QNauZ8OXZTmR6EO/9TDDTdZRCnTWuwnvRVR7xTElo=;
        b=l0k6L89OMYwqdeOP5zRZlS//xJaCEPM452csWxcdTQs0JrQS2O2qFIYqJkFSm5P1Uq
         T25+ALF6Ws7/tHnq2JBajxX3MHBl/RbrHl3ZZesCTwfKN+WTGHn935NX+ii/4wDRhNdJ
         5MpHGP7cF/jIaibQxAoC4a2p0doV3bqn1XBz4SgFM8EeENao009lAcHKd8ZVHucJ6HLO
         ucM6AsE1kjHERLzgreqHRoqHPsVNHCknvJaA2HpeXOXs3cZpGcoxc0osHXWP/02bxOGH
         dapG2YPdI+D6d+4hJfm/UU0HLdLugokvpEvwGhJZh6qent5AtTTHMByQjAp6KCI6l5Cq
         D6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722839238; x=1723444038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5QNauZ8OXZTmR6EO/9TDDTdZRCnTWuwnvRVR7xTElo=;
        b=d8WNVecKkKTEufA4qWhDN1vShWNSnIa9tbhfU6ieYLLnyYGqaMvj4F9laprNM2od4W
         Y/WbLQcEUR4GdgFDu7dIMobiHe8zuxpUGra6oij0Xhb/HClVSFgk/ruilr6tFBAYypfO
         N9O/q5j089Z10eCPMICrnxIcpI7ZxSuz07IOcZIDG3e9OBSobkLCiDXaPIB7bb8OkM+p
         kQOyryKHdlcS7W8GtsBeTxJcC9wp8Od1ztKqONAxPpHBOv74l4Yjxl8VbWSZyha9se09
         tTXyfb6zIF9weOkCG6ei4tD8GQiZP125+AgCSOGffqt+rzMGBSvNAcnSeR/J3N3HemdS
         miyw==
X-Forwarded-Encrypted: i=1; AJvYcCWEMR0ZmvHYuIdAMcAD0VMoPxd+tBgOSPvWsC7rwDO/dXUrM+YqZpvo46BkjsxHiFLpm+vdiuYj@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9WoZ4LPuRFw6RY+BAuA0zWWzhfsIHhChJHSu3EQmTnhi3n9UI
	tkJ/naHcFa42LIkpBK6hkiDEllGBQ/575JEQgU+0QNWOYOsYLVX9W4V1X84Jw/F/f5klUW4NPiu
	CQsPO/DIXC0Mn5sfhc1vmut8Cjs4=
X-Google-Smtp-Source: AGHT+IHBQ2iV8+hSCNWBfZJ9EiYTpddpBCAi4eoNeQzLCjoFs8LJ9YZ/cxk/cZu/MyOux436/ZO5npc7ZhXiAGnkNFQ=
X-Received: by 2002:a05:6e02:12e8:b0:39a:ef62:4e96 with SMTP id
 e9e14a558f8ab-39b1fc3eca2mr68992815ab.4.1722839237654; Sun, 04 Aug 2024
 23:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240801071946.43266-1-yschu@nuvoton.com> <20240801071946.43266-3-yschu@nuvoton.com>
 <e0b6ba00-f0bb-405b-b299-487e73a0c999@kernel.org>
In-Reply-To: <e0b6ba00-f0bb-405b-b299-487e73a0c999@kernel.org>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Mon, 5 Aug 2024 14:27:04 +0800
Message-ID: <CAPwEoQPcW_jNZkVSLjOf9M8ydKphnzR3D-m+gLhD0xygxGaZcw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
To: Krzysztof Kozlowski <krzk@kernel.org>
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

On Thu, Aug 1, 2024 at 11:02=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 01/08/2024 09:19, Stanley Chu wrote:
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
>
> Use proper terminology. Master is gone since 2021, right?
>
> This applies everywhere.
>

Thanks for the review.
I will fix it in v2.

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
> Why this is outside driver private data - npcm_i3c_master?
>
> > +
> > +static int npcm_i3c_master_wait_for_complete(struct npcm_i3c_master *m=
aster);
> > +static void npcm_i3c_master_stop_dma(struct npcm_i3c_master *master);
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
>
> ...
>
>
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
>
>
> Hm? Why this is not a separate DMA controller?
>

I will implement a separate dma driver later, the dma configuration
and lock will be removed from i3c driver.

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
>
> Use dev consistently.
>
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
>
> Once allocation with dev, other with pdev->dev...
>
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
>
>
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
>
> Drop, not useful.
>
>
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
>
> Best regards,
> Krzysztof
>
