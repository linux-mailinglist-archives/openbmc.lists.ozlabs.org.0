Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C987B5563
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 16:42:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lAK7F61c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzkFL18yRz3vhY
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 01:42:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lAK7F61c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzkDl28s0z2yDD;
	Tue,  3 Oct 2023 01:41:57 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4525dd7f9d0so6569668137.3;
        Mon, 02 Oct 2023 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696257714; x=1696862514; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuONyKg15YQEfcmQSSJ5vfkQtZUaUZITftCnmC5Qbt0=;
        b=lAK7F61cP5wmW+TLHWhGgO2XXtJCCkxLJivsA9GWOPgvkvT1OqupjElkFtw/G/A7dS
         h+uQNmeRxdcPtIHISm3QjZAyjXSur/sxTy2n4H74cegtNCsh8lwc58/jWh9vJIXtd+f3
         FmY759bJQjAUY2ZblHLFBXnqEnm0yYhwGj+DMs1eJOuC9hLcm8hNG2SRtJkmhRAtl+1C
         4qJ7CLh27TZN5elv4NcStpOImUbMfKzn6f3SviTya5gDVrhpbXF0O4BU2XWR9UMZf0j0
         PsNuLwUEF4TQv2L+nsIRSZ7e+myH7XqIdRvYF8K8ossML24uyrB2nXmkTqNr1aiFR9Et
         uLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696257714; x=1696862514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuONyKg15YQEfcmQSSJ5vfkQtZUaUZITftCnmC5Qbt0=;
        b=wYCFKRWV4tVlKzdOn0NFHwI83xDaZqKNx08JPhOJoDm4z7ZeyU7p9zfQCIKmM2w/QF
         SzFsT1brR33Dsv5irh/+ZzDlb8cbmHNTaYAbPMQnF/Vhyv8W8Ogqs5j/e9iNMH9uWcjq
         XlnMeydJw6++UNRWa6pOsB9GYUN2jMaYxrvF2hbL98Hweo4E/sR62xeV/68iWWBCGnV4
         2OnAQpJ+nPsWqw7bp/eNpnvs4Vn2hVhkvrxFZygCEUx51zza1n4MMlLKXN3c+a9Xoc0+
         XoYICYCAc9PJlwDQcOhsMuEjDvu+llETMiRPxSioQC4WGh5WDI8EOzwkaxNodZURfk4D
         HULA==
X-Gm-Message-State: AOJu0Yw1/NcJ4CWw7kdyB0vQ55ACQkTpnPD5n4/IuHl+LxeAOirrUy3S
	RTyT+DjV4/XID7F6EZ+nB/6y4DaqygS3FfkIOV0=
X-Google-Smtp-Source: AGHT+IElerjrCcefgHtmK3qIE1fR2exmsQjLSyfgP5Jq1Pr72cjG18/lChNYTheZ147g6PmS4a4kNQNf9ZE3Y6gqUuw=
X-Received: by 2002:a67:cf0a:0:b0:44d:3d2c:2a1a with SMTP id
 y10-20020a67cf0a000000b0044d3d2c2a1amr8059854vsl.9.1696257713749; Mon, 02 Oct
 2023 07:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230928123009.2913-1-aladyshev22@gmail.com> <20230928123009.2913-4-aladyshev22@gmail.com>
 <20230929120835.0000108e@Huawei.com>
In-Reply-To: <20230929120835.0000108e@Huawei.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Mon, 2 Oct 2023 17:41:42 +0300
Message-ID: <CACSj6VUS+cjsvjzY=wggMXXO1DEH0=9aHi1ADp0F-O8AKL5cCg@mail.gmail.com>
Subject: Re: [PATCH 3/3] mctp: Add MCTP-over-KCS transport binding
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
Cc: tmaimon77@gmail.com, minyard@acm.org, andrew@aj.id.au, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, edumazet@google.com, netdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, jk@codeconstruct.com.au, matt@codeconstruct.com.au, pabeni@redhat.com, openipmi-developer@lists.sourceforge.net, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the review!
I've corrected many things from your comments and have sent the V2 patch.
I'm not sure about the LIST thing and all the devres management. I've
written the KCS handling the same way it is done in the standard IPMI
KCS driver (https://github.com/torvalds/linux/blob/master/drivers/char/ipmi=
/kcs_bmc_cdev_ipmi.c)
Not sure if we need to do any different here.
Please see detailed response below:

On Fri, Sep 29, 2023 at 2:08=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Thu, 28 Sep 2023 15:30:09 +0300
> Konstantin Aladyshev <aladyshev22@gmail.com> wrote:
>
> > This change adds a MCTP KCS transport binding, as defined by the DMTF
> > specificiation DSP0254 - "MCTP KCS Transport Binding".
> > A MCTP protocol network device is created for each KCS channel found in
> > the system.
> > The interrupt code for the KCS state machine is based on the current
> > IPMI KCS driver.
> >
> > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
>
> Drive by review as I was curious and might as well comment whilst reading=
.
> Some comments seem to equally apply to other kcs drivers so maybe I'm
> missing something...
>
> Jonathan
>
>
> > ---
> >  drivers/net/mctp/Kconfig    |   8 +
> >  drivers/net/mctp/Makefile   |   1 +
> >  drivers/net/mctp/mctp-kcs.c | 624 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 633 insertions(+)
> >  create mode 100644 drivers/net/mctp/mctp-kcs.c
> >
> > diff --git a/drivers/net/mctp/Kconfig b/drivers/net/mctp/Kconfig
> > index dc71657d9184..a37f7ba947c0 100644
> > --- a/drivers/net/mctp/Kconfig
> > +++ b/drivers/net/mctp/Kconfig
> > @@ -33,6 +33,14 @@ config MCTP_TRANSPORT_I2C
> >         from DMTF specification DSP0237. A MCTP protocol network device=
 is
> >         created for each I2C bus that has been assigned a mctp-i2c devi=
ce.
> >
> > +config MCTP_TRANSPORT_KCS
> > +     tristate "MCTP KCS transport"
> > +     depends on IPMI_KCS_BMC
> > +     help
> > +       Provides a driver to access MCTP devices over KCS transport, fr=
om
> > +       DMTF specification DSP0254. A MCTP protocol network device is
> > +       created for each KCS channel found in the system.
> > +
> >  endmenu
> >
> >  endif
> > diff --git a/drivers/net/mctp/Makefile b/drivers/net/mctp/Makefile
> > index 1ca3e6028f77..885339a40f22 100644
> > --- a/drivers/net/mctp/Makefile
> > +++ b/drivers/net/mctp/Makefile
> > @@ -1,2 +1,3 @@
> >  obj-$(CONFIG_MCTP_SERIAL) +=3D mctp-serial.o
> >  obj-$(CONFIG_MCTP_TRANSPORT_I2C) +=3D mctp-i2c.o
> > +obj-$(CONFIG_MCTP_TRANSPORT_KCS) +=3D mctp-kcs.o
> > diff --git a/drivers/net/mctp/mctp-kcs.c b/drivers/net/mctp/mctp-kcs.c
> > new file mode 100644
> > index 000000000000..8d8b77ad709c
> > --- /dev/null
> > +++ b/drivers/net/mctp/mctp-kcs.c
> > @@ -0,0 +1,624 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Management Component Transport Protocol (MCTP) KCS transport bindin=
g.
> > + * This driver is an implementation of the DMTF specificiation
> > + * "DSP0254 - Management Component Transport Protocol (MCTP) KCS Trans=
port
> > + * Binding", available at:
> > + *
> > + * https://www.dmtf.org/sites/default/files/standards/documents/DSP025=
4_1.0.0.pdf
> > + *
> > + * This driver provides DSP0254-type MCTP-over-KCS transport using a L=
inux
> > + * KCS client subsystem.
> > + *
> > + * Copyright (c) 2023 Konstantin Aladyshev <aladyshev22@gmail.com>
> > + */
> > +
> > +#include <linux/if_arp.h>
> > +#include <linux/ipmi_kcs.h>
> > +#include <linux/kcs_bmc_client.h>
> > +#include <linux/mctp.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> Check these.  There aren't any mutex's in here that I noticed...
>

Currently there are no mutex's in the driver. Where do you think they
are needed?
For example there no mutex's in the 'mctp-serial.c' driver
(https://github.com/torvalds/linux/blob/master/drivers/net/mctp/mctp-serial=
.c)

> > +#include <linux/netdevice.h>
> > +#include <net/mctp.h>
> > +#include <net/mctpdevice.h>
> > +#include <net/pkt_sched.h>
>
> > +// According to SMBUS spec, the polynomial is:
> > +// // C(x) =3D X^8 + X^2 + X^1 + 1, which is 0x107,
> > +// // just ignore bit8 in definition.
> I'm confused by this part. Is this calling out a specification issue, or
> something that the relevant specs make clear?  If the second, add a refer=
ence.
> If it's a specification issue that's fine, but are we sure it will get re=
solved
> hwo you've done it here?

This part of the code along with the comments was copied from the
relevant edk2 driver.
But it turned out that I can just use `i2c_smbus_pec` from the kernel
headers. So I've dropped all of this code.

> > +#define MCTP_KCS_PACKET_ERROR_CODE_POLY 0x07
> > +//
>
>
> > +
> > +static void mctp_kcs_rx_work(struct work_struct *work)
> > +{
> > +     struct mctp_kcs *mkcs =3D container_of(work, struct mctp_kcs, rx_=
work);
> > +     struct mctp_skb_cb *cb;
> > +     struct sk_buff *skb;
> > +     unsigned long flags;
> > +     int rc;
> > +     int i;
> > +     struct mctp_kcs_header *kcs_header;
> > +     int data_len;
> > +     int data_in_idx;
> > +
> > +     spin_lock_irqsave(&mkcs->lock, flags);
> > +     for (i =3D 0; i < (mkcs->data_in_idx); i++)
> > +             dev_dbg(mkcs->client.dev->dev, "%s: data_in[%d]=3D0x%02x"=
,
> > +                     __func__, i, mkcs->data_in[i]);
> > +
> > +     data_len =3D mkcs->data_in_idx - sizeof(struct mctp_kcs_header) -
> > +                sizeof(struct mctp_kcs_trailer);
> > +     if (mkcs->phase !=3D KCS_PHASE_WRITE_DONE) {
> > +             dev_err(mkcs->client.dev->dev,
> > +                     "%s: error! Wrong KCS stage at the end of data re=
ad (phase=3D%d)",
> > +                     __func__, mkcs->phase);
> > +             mkcs->netdev->stats.rx_dropped++;
> > +             spin_unlock_irqrestore(&mkcs->lock, flags);
> > +             return;
> > +     }
> > +
> > +     mkcs->phase =3D KCS_PHASE_WAIT_READ;
> > +     data_in_idx =3D mkcs->data_in_idx;
> > +     mkcs->data_in_idx =3D 0;
> > +
> > +     skb =3D netdev_alloc_skb(mkcs->netdev, data_len);
> > +     if (!skb) {
> > +             mkcs->netdev->stats.rx_dropped++;
> > +             spin_unlock_irqrestore(&mkcs->lock, flags);
>
> I'd use a sequence of gotos and labels to deal with the different cleanup=
.

Done

>
> > +             return;
> > +     }
> > +
> > +     kcs_header =3D (struct mctp_kcs_header *)mkcs->data_in;
> > +     rc =3D mctp_kcs_validate_data(mkcs, kcs_header, data_in_idx);
> > +     if (rc) {
> > +             dev_err(mkcs->client.dev->dev,
> > +                     "%s: error! Binding validation failed", __func__)=
;
> > +             dev_kfree_skb(skb);
> > +             spin_unlock_irqrestore(&mkcs->lock, flags);
> > +             return;
> > +     }
> > +
> > +     skb->protocol =3D htons(ETH_P_MCTP);
> > +     skb_put_data(skb, mkcs->data_in + sizeof(struct mctp_kcs_header),
> > +                  data_len);
> > +     spin_unlock_irqrestore(&mkcs->lock, flags);
> > +     skb_reset_network_header(skb);
> > +
> > +     cb =3D __mctp_cb(skb);
> > +     cb->halen =3D 0;
> > +
> > +     netif_rx(skb);
> > +     mkcs->netdev->stats.rx_packets++;
> > +     mkcs->netdev->stats.rx_bytes +=3D data_len;
> > +}
> > +
>
> > +static void mctp_kcs_setup(struct net_device *ndev)
> > +{
> > +     ndev->type =3D ARPHRD_MCTP;
> > +
> > +     /* we limit at the fixed MTU, which is also the MCTP-standard
> > +      * baseline MTU, so is also our minimum
> > +      */
> > +     ndev->mtu =3D MCTP_KCS_MTU;
> > +     ndev->max_mtu =3D MCTP_KCS_MTU;
> > +     ndev->min_mtu =3D MCTP_KCS_MTU;
> > +
> > +     ndev->hard_header_len =3D 0;
> > +     ndev->addr_len =3D 0;
> > +     ndev->tx_queue_len =3D DEFAULT_TX_QUEUE_LEN;
> > +     ndev->flags =3D IFF_NOARP;
> > +     ndev->netdev_ops =3D &mctp_kcs_netdev_ops;
> > +     ndev->needs_free_netdev =3D true;
> > +}
> > +
> > +static void kcs_bmc_ipmi_force_abort(struct mctp_kcs *mkcs)
> > +{
> > +     dev_err(mkcs->client.dev->dev,
> > +             "Error! Force abort on KCS communication");
> > +     set_state(mkcs, ERROR_STATE);
> > +     kcs_bmc_read_data(mkcs->client.dev);
> > +     kcs_bmc_write_data(mkcs->client.dev, KCS_ZERO_DATA);
> > +     mkcs->phase =3D KCS_PHASE_ERROR;
> > +     mkcs->data_in_idx =3D 0;
> > +}
> > +
> > +static void kcs_bmc_ipmi_handle_data(struct mctp_kcs *mkcs)
> > +{
> > +     struct kcs_bmc_device *dev;
> > +     u8 data;
> > +
> > +     dev =3D mkcs->client.dev;
> As below, I'd put this on the line defining the local variable and rename=
 it.

Done

>
> > +
> > +     switch (mkcs->phase) {
> > +     case KCS_PHASE_WRITE_START:
> > +             dev_dbg(dev->dev, "%s: KCS_PHASE_WRITE_START", __func__);
> > +             mkcs->phase =3D KCS_PHASE_WRITE_DATA;
> > +             fallthrough;
> > +
> > +     case KCS_PHASE_WRITE_DATA:
> > +             dev_dbg(dev->dev, "%s: KCS_PHASE_WRITE_DATA", __func__);
> > +             if (mkcs->data_in_idx < KCS_MSG_BUFSIZ) {
> > +                     set_state(mkcs, WRITE_STATE);
> > +                     kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> > +                     mkcs->data_in[mkcs->data_in_idx++] =3D
> > +                             kcs_bmc_read_data(dev);
> > +                     dev_dbg(dev->dev,
> > +                             "%s: KCS_PHASE_WRITE_DATA: data_in[%d]=3D=
0x%02x",
> > +                             __func__, mkcs->data_in_idx - 1,
> > +                             mkcs->data_in[mkcs->data_in_idx - 1]);
> > +             } else {
> > +                     kcs_bmc_ipmi_force_abort(mkcs);
> > +                     mkcs->error =3D KCS_LENGTH_ERROR;
> > +             }
> > +             break;
> > +
> > +     case KCS_PHASE_WRITE_END_CMD:
> > +             dev_dbg(dev->dev, "%s: KCS_PHASE_WRITE_END_CMD", __func__=
);
> > +             if (mkcs->data_in_idx < KCS_MSG_BUFSIZ) {
> > +                     set_state(mkcs, READ_STATE);
> > +                     mkcs->data_in[mkcs->data_in_idx++] =3D
> > +                             kcs_bmc_read_data(dev);
> > +                     dev_dbg(dev->dev,
> > +                             "%s: KCS_PHASE_WRITE_END_CMD: data_in[%d]=
=3D0x%02x",
> > +                             __func__, mkcs->data_in_idx - 1,
> > +                             mkcs->data_in[mkcs->data_in_idx - 1]);
> > +                     mkcs->phase =3D KCS_PHASE_WRITE_DONE;
> > +                     schedule_work(&mkcs->rx_work);
> > +             } else {
> > +                     kcs_bmc_ipmi_force_abort(mkcs);
> > +                     mkcs->error =3D KCS_LENGTH_ERROR;
> > +             }
> > +             break;
> > +
> > +     case KCS_PHASE_READ:
> > +             dev_dbg(dev->dev,
> > +                     "%s: KCS_PHASE_READ, data_out_idx=3D%d, data_out_=
len=3D%d",
> > +                     __func__, mkcs->data_out_idx, mkcs->data_out_len)=
;
> > +             if (mkcs->data_out_idx =3D=3D mkcs->data_out_len)
> > +                     set_state(mkcs, IDLE_STATE);
> > +
> > +             data =3D kcs_bmc_read_data(dev);
> > +             if (data !=3D KCS_CMD_READ_BYTE) {
> > +                     dev_dbg(dev->dev,
> > +                             "%s: error! data is not equal to KCS_CMD_=
READ_BYTE",
> > +                             __func__);
> > +                     set_state(mkcs, ERROR_STATE);
> > +                     kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> > +                     break;
> > +             }
> > +
> > +             if (mkcs->data_out_idx =3D=3D mkcs->data_out_len) {
> > +                     kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> > +                     mkcs->netdev->stats.tx_bytes +=3D mkcs->data_out_=
len;
> > +                     mkcs->netdev->stats.tx_packets++;
> > +                     mkcs->phase =3D KCS_PHASE_IDLE;
> > +                     if (netif_queue_stopped(mkcs->netdev))
> > +                             netif_start_queue(mkcs->netdev);
> > +                     break;
> > +             }
> > +
> > +             dev_dbg(dev->dev, "%s: KCS_PHASE_READ: data_out[%d]=3D0x%=
02x",
> > +                     __func__, mkcs->data_out_idx,
> > +                     mkcs->data_out[mkcs->data_out_idx]);
> > +             kcs_bmc_write_data(dev, mkcs->data_out[mkcs->data_out_idx=
++]);
> > +             break;
> > +
> > +     case KCS_PHASE_ABORT_ERROR1:
> > +             dev_dbg(dev->dev, "%s: KCS_PHASE_ABORT_ERROR1", __func__)=
;
> > +             set_state(mkcs, READ_STATE);
> > +             kcs_bmc_read_data(dev);
> > +             kcs_bmc_write_data(dev, mkcs->error);
> > +             mkcs->phase =3D KCS_PHASE_ABORT_ERROR2;
> > +             break;
> > +
> > +     case KCS_PHASE_ABORT_ERROR2:
> > +             dev_dbg(dev->dev, "%s: KCS_PHASE_ABORT_ERROR2", __func__)=
;
> > +             set_state(mkcs, IDLE_STATE);
> > +             kcs_bmc_read_data(dev);
> > +             kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> > +             mkcs->phase =3D KCS_PHASE_IDLE;
> > +             break;
> > +
> > +     default:
> > +             dev_dbg(dev->dev, "%s: unknown KCS phase", __func__);
> > +             kcs_bmc_ipmi_force_abort(mkcs);
> > +             break;
> > +     }
> > +}
> > +
> > +static void kcs_bmc_ipmi_handle_cmd(struct mctp_kcs *mkcs)
> > +{
> > +     struct kcs_bmc_device *dev;
> > +     u8 cmd;
> > +
> > +     dev =3D mkcs->client.dev;
> Might as well save a few lines as it doesn't hurt readability.
>
>         struct kcs_bmc_device *dev =3D mkcs->client.dev;
>

Done

> > +
> > +     set_state(mkcs, WRITE_STATE);
> > +     kcs_bmc_write_data(mkcs->client.dev, KCS_ZERO_DATA);
> > +
> > +     cmd =3D kcs_bmc_read_data(mkcs->client.dev);
> > +     switch (cmd) {
> Local variable doesn't add anything really and you should use your handy
> 'dev'.  Maybe rename dev, as most readers will assume it's a struct devic=
e
> and get confused (briefly) at the dev->dev bits in here.
>
>
>         switch (kcs_bmc_read_data(dev)) {
>

Done

> > +     case KCS_CMD_WRITE_START:
> > +             dev_dbg(dev->dev, "%s: KCS_CMD_WRITE_START", __func__);
> > +             mkcs->phase =3D KCS_PHASE_WRITE_START;
> > +             mkcs->error =3D KCS_NO_ERROR;
> > +             mkcs->data_in_idx =3D 0;
> > +             break;
> > +
> > +     case KCS_CMD_WRITE_END:
> > +             dev_dbg(dev->dev, "%s: KCS_CMD_WRITE_END", __func__);
> > +             if (mkcs->phase !=3D KCS_PHASE_WRITE_DATA) {
> > +                     kcs_bmc_ipmi_force_abort(mkcs);
> > +                     break;
> > +             }
> > +             mkcs->phase =3D KCS_PHASE_WRITE_END_CMD;
> > +             break;
> > +
> > +     case KCS_CMD_GET_STATUS_ABORT:
> > +             dev_dbg(dev->dev, "%s: KCS_CMD_GET_STATUS_ABORT", __func_=
_);
> > +             if (mkcs->error =3D=3D KCS_NO_ERROR)
> > +                     mkcs->error =3D KCS_ABORTED_BY_COMMAND;
> > +
> > +             mkcs->phase =3D KCS_PHASE_ABORT_ERROR1;
> > +             mkcs->data_in_idx =3D 0;
> > +             break;
> > +
> > +     default:
> > +             dev_dbg(dev->dev, "%s: unknown KCS command", __func__);
> > +             kcs_bmc_ipmi_force_abort(mkcs);
> > +             mkcs->error =3D KCS_ILLEGAL_CONTROL_CODE;
> > +             break;
> > +     }
> > +}
> > +
> > +static inline struct mctp_kcs *client_to_mctp_kcs(struct kcs_bmc_clien=
t *client)
> > +{
> > +     return container_of(client, struct mctp_kcs, client);
> > +}
> > +
> > +static irqreturn_t kcs_bmc_mctp_event(struct kcs_bmc_client *client)
> > +{
> > +     struct mctp_kcs *mkcs;
> > +     u8 status;
> > +     int ret;
> > +
> > +     mkcs =3D client_to_mctp_kcs(client);
> > +     if (!mkcs) {
> > +             dev_err(client->dev->dev,
> > +                     "%s: error! can't find mctp_kcs from KCS client",
> > +                     __func__);
> > +             return IRQ_NONE;
> > +     }
> > +
> > +     spin_lock(&mkcs->lock);
> > +
> > +     status =3D kcs_bmc_read_status(client->dev);
> > +     if (status & KCS_STATUS_IBF) {
> > +             if (status & KCS_STATUS_CMD_DAT)
> > +                     kcs_bmc_ipmi_handle_cmd(mkcs);
> > +             else
> > +                     kcs_bmc_ipmi_handle_data(mkcs);
> > +
> > +             ret =3D IRQ_HANDLED;
> > +     } else {
> > +             ret =3D IRQ_NONE;
> > +     }
> > +
> > +     spin_unlock(&mkcs->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct kcs_bmc_client_ops kcs_bmc_mctp_client_ops =3D {
> > +     .event =3D kcs_bmc_mctp_event,
> > +};
> > +
> > +static DEFINE_SPINLOCK(kcs_bmc_mctp_instances_lock);
> > +static LIST_HEAD(kcs_bmc_mctp_instances);
> As mentioned below, this seems to be only used to find some data again
> in remove. Lots of cleaner ways to do that than a list in the driver.
> I'd explore the alternatives.
>

This was copied from the other KCS drivers. For example please see
'kcs_bmc_cdev_ipmi.c':
https://github.com/torvalds/linux/blob/8a749fd1a8720d4619c91c8b6e7528c0a355=
c0aa/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c#L469

> > +
> > +static int kcs_bmc_mctp_add_device(struct kcs_bmc_device *kcs_bmc)
> > +{
> > +     struct mctp_kcs *mkcs;
> > +     struct net_device *ndev;
> > +     char name[32];
> > +     int rc;
> > +
> > +     snprintf(name, sizeof(name), "mctpkcs%d", kcs_bmc->channel);
> > +
> > +     ndev =3D alloc_netdev(sizeof(*mkcs), name, NET_NAME_ENUM, mctp_kc=
s_setup);
> Interesting that there is an explicit devm_register_netdev() but not one =
for
> this simple allocation case (there is one for the ethernet specific versi=
on).
> Never mind, we have devm_add_action_or_reset() for that.  Just create a
> small wrapper for free_netdev() (which will look like devm_free_netdev()
> in net/devres.c but that's local to that file) and add
>
>         rc =3D devm_add_action_or_reset(&kcs_bmc->dev,
>                                       wrapper_for_free_netdev(), ndev);
>         if (rc)
>                 return rc;
>


Did you mean something like this?
```
static void devm_free_netdev(struct device *dev, void *this)
{
struct net_device_devres *res =3D this;

free_netdev(res->ndev);
}


...

static int kcs_bmc_mctp_add_device(struct kcs_bmc_device *kcs_bmc)
{

// Instead of:
//ndev =3D alloc_netdev
//rc =3D register_netdev(ndev);

// Use
...
if (!devm_register_netdev(kcs_bmc->dev, ndev)) {
dev_err_probe(kcs_bmc->dev,
        "alloc_netdev failed for KCS channel %d\n",
        kcs_bmc->channel);
return -ENOMEM;
}

rc =3D devm_add_action_or_reset(&kcs_bmc->dev,
                              devm_free_netdev(),
                              ndev);
if (rc)
return rc;
...
}
```
What calls do I need to perform in `kcs_bmc_mctp_remove_device` in this cas=
e?
Do I still have to perform `unregister_netdev` and `free_netdev` for exampl=
e?

Anyway I don't see anything similar in the current mctp-i2c/mctp-serial dri=
vers.


> > +     if (!ndev) {
> > +             dev_err(kcs_bmc->dev,
> > +                     "alloc_netdev failed for KCS channel %d\n",
> > +                     kcs_bmc->channel);
> No idea if the kcs subsystem handles deferred probing right, but in gener=
al
> anything called just in 'probe' routines can use dev_err_probe() to prett=
y
> print errors and also register any deferred cases with the logging stuff =
that
> lets you find out why they were deferred.
>

Done

> > +             rc =3D -ENOMEM;
> > +             goto err;
> In general I find it easier to follow code that only uses a goto if there
> is shared cleanup to do.
>                 return -ENOMEM; and for this path I don't need to read fu=
rther.

Done

> > +     }
> > +
> > +     mkcs =3D netdev_priv(ndev);
> > +     mkcs->netdev =3D ndev;
> > +     mkcs->client.dev =3D kcs_bmc;
> > +     mkcs->client.ops =3D &kcs_bmc_mctp_client_ops;
> > +     mkcs->data_in =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_=
KERNEL);
> > +     mkcs->data_out =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP=
_KERNEL);
>
> You should not be mixing device manged cleanup and manual cleanup.  Rule =
of thumb
> is don't call any devm_ functions in a 'probe / add' type routine after y=
ou pass
> the first element that requires manual cleanup. Otherwise you get horribl=
e
> race conditions or if not that, just code that is hard to check for them.
>

Not sure how to fix

> > +     if (!mkcs->data_in || !mkcs->data_out) {
> Check these independently.  It costs a few extra lines but give more expl=
icit
> messages and keeps ordering etc simpler.
>

Done

> > +             dev_err(kcs_bmc->dev,
> > +                     "failed to allocate data buffers for KCS channel =
%d\n",
> > +                     kcs_bmc->channel);
> > +             rc =3D -ENOMEM;
> > +             goto free_netdev;
> > +     }
> > +
> > +     INIT_WORK(&mkcs->rx_work, mctp_kcs_rx_work);
> > +
> > +     rc =3D register_netdev(ndev);
>
> after change above, devm_register_netdev()
>
> > +     if (rc)
> > +             goto free_netdev;
> > +
> > +     spin_lock_irq(&kcs_bmc_mctp_instances_lock);
> > +     list_add(&mkcs->entry, &kcs_bmc_mctp_instances);
>
> Add a callback and devm_add_action_or_reset() to unwind this as well.
>
> > +     spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
> > +
> > +     dev_info(kcs_bmc->dev, "Add MCTP client for the KCS channel %d",
> > +              kcs_bmc->channel);
> > +     return 0;
> > +
> > +free_netdev:
> > +     if (ndev)
>
> How do you get here with ndev not set?  If there is a path, that's probab=
ly
> a bug.
>

This check is no longer needed after the changes above.

> > +             free_netdev(ndev);
> > +
> > +err:
> > +     return rc;
> > +}
> > +
> > +static int kcs_bmc_mctp_remove_device(struct kcs_bmc_device *kcs_bmc)
> > +{
> > +     struct mctp_kcs *mkcs =3D NULL, *pos;
> > +
> > +     dev_info(kcs_bmc->dev, "Remove MCTP client for the KCS channel %d=
",
> > +              kcs_bmc->channel);
> > +     spin_lock_irq(&kcs_bmc_mctp_instances_lock);
> > +     list_for_each_entry(pos, &kcs_bmc_mctp_instances, entry) {
> > +             if (pos->client.dev =3D=3D kcs_bmc) {
> > +                     mkcs =3D pos;
> > +                     list_del(&pos->entry);
> > +                     break;
> I don't know the kcs stuff at all but these seems 'unusual'.
> Can't you stash  device_set_drvdata(kcs_bmc->dev) or does it
> just match the structure containing the client pointed to
> by kcs_bmc_device? If so use something like
> container_of(kcs_bmc->client, struct mctp_kcs, client);
> Ah. You already have a function for that.  Why not use that here?
>
> There isn't normally a reason for a driver to maintain an
> additional list like this.
>

Once again this logic was copied from the KCS IPMI driver:
https://github.com/torvalds/linux/blob/8a749fd1a8720d4619c91c8b6e7528c0a355=
c0aa/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c#L520

> > +             }
> > +     }
> > +     spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
> > +
> > +     if (!mkcs)
> > +             return -ENODEV;
> > +
> > +     unregister_netdev(mkcs->netdev);
> > +     free_netdev(mkcs->netdev);
>
> This stuff should be opposite order of add above, or leave it to devm to =
clean up.

Which things are exact things that are currently in the incorrect order?

>
> > +     kcs_bmc_disable_device(mkcs->client.dev, &mkcs->client);
>
> This doesn't match with stuff in add - so I'd like a comment to explain
> why it is here.  Also needs a comment on the ordering.  Perhaps this
> is why you can't use devm for all the above, in which case I'd use it
> nowhere in this driver.
> I'm also confused on relationship between mks->client.dev and kcs_bmc
> (I'm fairly sure they are the same, so just use kcs_bmc here).
>

I've changed the variable. Not sure about `kcs_bmc_disable_device`.
I've added it since it is also present in the IPMI KCS driver.
https://github.com/torvalds/linux/blob/8a749fd1a8720d4619c91c8b6e7528c0a355=
c0aa/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c#L533

>
> > +     devm_kfree(kcs_bmc->dev, mkcs->data_in);
> > +     devm_kfree(kcs_bmc->dev, mkcs->data_out);
>
> Alarm bells occur whenever an explicit devm_kfree turns up in
> except in complex corner cases. Please look at how devm based
> resource management works. These should not be here.
>
> Also, remove_device should either do things in the opposite order
> to add_device, or it should have comments saying why not!
>
>

https://github.com/torvalds/linux/blob/8a749fd1a8720d4619c91c8b6e7528c0a355=
c0aa/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c#L534C2-L534C2

> > +     return 0;
> > +}
> > +
> > +static const struct kcs_bmc_driver_ops kcs_bmc_mctp_driver_ops =3D {
> > +     .add_device =3D kcs_bmc_mctp_add_device,
> > +     .remove_device =3D kcs_bmc_mctp_remove_device,
> > +};
> > +
> > +static struct kcs_bmc_driver kcs_bmc_mctp_driver =3D {
> > +     .ops =3D &kcs_bmc_mctp_driver_ops,
> > +};
> > +
> > +static int __init mctp_kcs_init(void)
> > +{
> > +     kcs_bmc_register_driver(&kcs_bmc_mctp_driver);
> > +     return 0;
> > +}
> > +
> > +static void __exit mctp_kcs_exit(void)
> > +{
> > +     kcs_bmc_unregister_driver(&kcs_bmc_mctp_driver);
> > +}
>
> Hmm. So kcs is a very small subsystem hence no one has done the usual
> module_kcs_driver() wrapper (see something like module_i2c_driver)
> for an example.  You can just use the underlying macro directly
> though to get rid of most of this boilerplate.
>
>
> module_driver(kcs_bmc_mctp_driver, kcs_bmc_register_driver,
>               kcs_bmc_uregister_driver);
>

Not possible. If I understand error message correctly it is from the
fact that 'kcs_bmc_register_driver' returns void:
```
| drivers/net/mctp/mctp-kcs.c: In function 'kcs_bmc_mctp_driver_init':
| drivers/net/mctp/mctp-kcs.c:576:36: error: void value not ignored as
it ought to be
|   576 | module_driver(kcs_bmc_mctp_driver, kcs_bmc_register_driver,
kcs_bmc_unregister_driver);
| include/linux/device/driver.h:265:16: note: in definition of macro
'module_driver'
|   265 |         return __register(&(__driver) , ##__VA_ARGS__); \
|       |                ^~~~~~~~~~
| include/linux/device/driver.h:266:1: error: control reaches end of
non-void function [-Werror=3Dreturn-type]
|   266 | } \
|       | ^
| drivers/net/mctp/mctp-kcs.c:576:1: note: in expansion of macro 'module_dr=
iver'
|   576 | module_driver(kcs_bmc_mctp_driver, kcs_bmc_register_driver,
kcs_bmc_unregister_driver);
|       | ^~~~~~~~~~~~~
| cc1: some warnings being treated as errors
```

> > +
> > +module_init(mctp_kcs_init);
> > +module_exit(mctp_kcs_exit);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Konstantin Aladyshev <aladyshev22@gmail.com>");
> > +MODULE_DESCRIPTION("MCTP KCS transport");
>

Best regards,
Konstantin Aladyshev
