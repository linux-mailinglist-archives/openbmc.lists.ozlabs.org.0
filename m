Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB44BEF7F
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:23:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jf30g6Jz3bSx
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:23:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=anYGhEvX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2a;
 helo=mail-vs1-xe2a.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=anYGhEvX; dkim-atps=neutral
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2FvT4K4pz30Mn
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 19:33:56 +1100 (AEDT)
Received: by mail-vs1-xe2a.google.com with SMTP id g20so16692187vsb.9
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 00:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ufcy944rkWYKZObvy1+rpFgMmzS5p+LaqMauq+MUEW4=;
 b=anYGhEvXvHwbxgxsHz489ymn/gP/REFDdoRerZAfwz/vbB8aDXxPvY1rUSUcibANRy
 UiFK1mpVtXQkCnUA5LUyQAiADQ7yL5YRAqWx9vQ+scj0ycQhWh4C18/iHALNSp13W8mS
 QuSJQCILZqTa1iQnnkzdfA/kPDD5KIdgsPfcH5aE6AcT4oXc6itDcF5CtpVPL1k03v4K
 4S4eZbvsFeIbAApBbzqRP8jgwV3CAokSxhHciEaM0n/gQG8mh0h8GXMtCsSRtd2whx0h
 KUXz0TbrQtYWGUbbEJ0EuY3Xx5LD8yn53kyCgntIqelnYkvh4/PWmHdUOkPM9ZYUh+tT
 Fquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ufcy944rkWYKZObvy1+rpFgMmzS5p+LaqMauq+MUEW4=;
 b=WOe3W934pc+ZqBqaAizrEwsV1MOfmSb3GTmVuSEB267WR84hxY4PNq1DONi996PKIj
 Y6W+1cjWyIsniugQIdJsD1c3idc9kZY9zFMIhIo0Ev6P6M37aeYGLN6EWSvUIcJQfVVi
 jXkh+jdfs0BNzlJ/xw/AZxErBUQIYWyjDm7ccRszr1CYHgQITbuGCQh8qid0dSzHuPkQ
 DNshWwRWOjMyKX17a4GP/82i6a+k4htUjeMrvB1BIUgZic/rQX0SAXIiANDHlOVp1Tls
 ujU+tJowM5fxT0YshkyJuB83+ONiwfnyw8MzbEwAENS1vEEFyknTnI29Pta/+PRazitF
 wTRA==
X-Gm-Message-State: AOAM532KLuTN1luwxXjhqSXquAO55wsOCXEbtrhtoRikWLtm0huky+/m
 QJuRYjjY1S6VYCD6az4bHKnMG49Dz0tecI5/eg==
X-Google-Smtp-Source: ABdhPJwJNio1dad1aaWQl70fBp62eHOCefzP0BnnUismdjIt1635Ofbsf+YmMSai31L2tPhyjh5ESBxdt/6SyOFXsCM=
X-Received: by 2002:a67:db0c:0:b0:31c:2859:2ff2 with SMTP id
 z12-20020a67db0c000000b0031c28592ff2mr2541361vsj.29.1645432433446; Mon, 21
 Feb 2022 00:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-12-warp5tw@gmail.com>
 <888977e0-03bb-3a6b-eca3-7fbf35f53ffc@canonical.com>
In-Reply-To: <888977e0-03bb-3a6b-eca3-7fbf35f53ffc@canonical.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 21 Feb 2022 16:33:41 +0800
Message-ID: <CACD3sJaFFC2Fe_EyzM3t1_DCkYPRe-mXQdqpe4=Y27vuRajKoA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] i2c: npcm: Support NPCM845
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Feb 2022 13:21:12 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org,
 Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof:

Thank you for your comments and they'll be addressed.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B42=E6=9C=8820=E6=97=A5
=E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=885:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 20/02/2022 04:53, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add NPCM8XX I2C support.
> > The NPCM8XX uses a similar i2c module as NPCM7XX.
> > The internal HW FIFO is larger in NPCM8XX.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  drivers/i2c/busses/Kconfig       |  8 +--
> >  drivers/i2c/busses/Makefile      |  2 +-
> >  drivers/i2c/busses/i2c-npcm7xx.c | 87 ++++++++++++++++++++++----------
> >  3 files changed, 66 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index 42da31c1ab70..ab9ee2de5e00 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -817,13 +817,13 @@ config I2C_NOMADIK
> >         I2C interface from ST-Ericsson's Nomadik and Ux500 architecture=
s,
> >         as well as the STA2X11 PCIe I/O HUB.
> >
> > -config I2C_NPCM7XX
> > +config I2C_NPCM
> >       tristate "Nuvoton I2C Controller"
> > -     depends on ARCH_NPCM7XX || COMPILE_TEST
> > +     depends on ARCH_NPCM || COMPILE_TEST
> >       help
> >         If you say yes to this option, support will be included for the
> > -       Nuvoton I2C controller, which is available on the NPCM7xx BMC
> > -       controller.
> > +       Nuvoton I2C controller, which is available on the NPCM BMC
> > +       controllers.
> >         Driver can also support slave mode (select I2C_SLAVE).
> >
> >  config I2C_OCORES
> > diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> > index 1d00dce77098..01fdf74a5565 100644
> > --- a/drivers/i2c/busses/Makefile
> > +++ b/drivers/i2c/busses/Makefile
> > @@ -80,7 +80,7 @@ obj-$(CONFIG_I2C_MT7621)    +=3D i2c-mt7621.o
> >  obj-$(CONFIG_I2C_MV64XXX)    +=3D i2c-mv64xxx.o
> >  obj-$(CONFIG_I2C_MXS)                +=3D i2c-mxs.o
> >  obj-$(CONFIG_I2C_NOMADIK)    +=3D i2c-nomadik.o
> > -obj-$(CONFIG_I2C_NPCM7XX)    +=3D i2c-npcm7xx.o
> > +obj-$(CONFIG_I2C_NPCM)               +=3D i2c-npcm7xx.o
> >  obj-$(CONFIG_I2C_OCORES)     +=3D i2c-ocores.o
> >  obj-$(CONFIG_I2C_OMAP)               +=3D i2c-omap.o
> >  obj-$(CONFIG_I2C_OWL)                +=3D i2c-owl.o
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2cbf9c679aed..b281e0424e3e 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >
> > @@ -91,7 +92,7 @@ enum i2c_addr {
> >
> >  /* init register and default value required to enable module */
> >  #define NPCM_I2CSEGCTL                       0xE4
> > -#define NPCM_I2CSEGCTL_INIT_VAL              0x0333F000
> > +#define NPCM_I2CSEGCTL_INIT_VAL              bus->data->segctl_init_va=
l
> >
> >  /* Common regs */
> >  #define NPCM_I2CSDA                  0x00
> > @@ -228,8 +229,7 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D=
 {
> >  #define NPCM_I2CFIF_CTS_CLR_FIFO     BIT(6)
> >  #define NPCM_I2CFIF_CTS_SLVRSTR              BIT(7)
> >
> > -/* NPCM_I2CTXF_CTL reg fields */
> > -#define NPCM_I2CTXF_CTL_TX_THR               GENMASK(4, 0)
> > +/* NPCM_I2CTXF_CTL reg field */
> >  #define NPCM_I2CTXF_CTL_THR_TXIE     BIT(6)
> >
> >  /* NPCM_I2CT_OUT reg fields */
> > @@ -238,22 +238,22 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =
=3D {
> >  #define NPCM_I2CT_OUT_T_OUTST                BIT(7)
> >
> >  /* NPCM_I2CTXF_STS reg fields */
> > -#define NPCM_I2CTXF_STS_TX_BYTES     GENMASK(4, 0)
> > +#define NPCM_I2CTXF_STS_TX_BYTES     bus->data->txf_sts_tx_bytes
>
> It's not a clean code to use defines for complex types. It's not a
> constant anymore, so just use bus->data->txf_sts_tx_bytes directly.
>
> The same in other places.
>
> >  #define NPCM_I2CTXF_STS_TX_THST              BIT(6)
> >
>
> Best regards,
> Krzysztof

Best regards,
Tyrone
