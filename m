Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC737BFB74
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:31:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OgTk5uOg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4ZyM2Nlcz3dBM
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 23:31:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OgTk5uOg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::930; helo=mail-ua1-x930.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Zxg038Qz3cB0;
	Tue, 10 Oct 2023 23:30:46 +1100 (AEDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7b6043d0bbeso157607241.1;
        Tue, 10 Oct 2023 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696941043; x=1697545843; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w2qN8F6nYAa+2xmRwIlDQSB4198TvxfZi8QWe3khXg=;
        b=OgTk5uOghS+hV3sWM9Vizvrge0xJjZCFwXnMuv3xLGwGJ6LQwpY6wZFmZ2rbqnOpjx
         AIEVQMQzyLO0CLuXBs1lJfUb06Zr6zdtUnOdVBfn+Avap6rZH1Z69JoT1H/7lKNs1MYs
         jpXfrBYX3t2yW3nNzBvnkjS+bx7IK2aUbtfhZ8daidmq0AQ3K+uLIviXMgOV1uy9oR+P
         QHPeNXGW4xrrY0rdYPrNxJcYSvgESliZ/DKnwOPvonH63+1OWcmcCSDprHgufgokKJVM
         9P9EVuFE+fo1asSamNWUlqtLzfjA0190wFHx6ISzK8rOIrzsAmzD24WYsQ76uLBF3JJ+
         xF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696941043; x=1697545843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4w2qN8F6nYAa+2xmRwIlDQSB4198TvxfZi8QWe3khXg=;
        b=CL4SDgIz7U7md81n9r473t1dwdUxf1F7IuE99z2GBeVj7HShWaOWjUmSM9sytWFzvE
         2+mSIPUZrbzgUlcWsyRQ+z9XIWbTCSMQx0Wxnm/Cxkqfj4j8zYUPs6n2OR4N9yj1ILx/
         0vq1KPQVi5KeLF2mXQAYXmJUDmwkDC2/YwwUQFzX2TnjaztkzLR6iLYBUVyUva/vIVmc
         30bZ1ZvpgA4tZ6XtyDzfoDWTcrb5baCYxh0d93FSOekhamB4CNZwuBUxnsFdVRlnOQ6L
         4dXD+mryL5Wenn3sOhz6a68hWj2ytnkTlpPdgr6MaIpP+AtsOi81Z8wuIUmYsVPXsF6c
         o0+Q==
X-Gm-Message-State: AOJu0Yy85Fkaw5va7DbPfXuwnttu/M1Xf54bpTaWkAiBtB9d1Qhu34mx
	RZSV4ujIpFE8piUhQE6HbdMrT4DAM6BrrWFFz0U=
X-Google-Smtp-Source: AGHT+IEDo+tM/CaMbO060hv7hvd01+++CpJglMfZYlHmgyemZBUv9Wsa40oFLsqj2NbhcoLXtQlCvf6Qs0b8jE95iB4=
X-Received: by 2002:a67:f4da:0:b0:452:94a4:9c59 with SMTP id
 s26-20020a67f4da000000b0045294a49c59mr12481712vsn.10.1696941042676; Tue, 10
 Oct 2023 05:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231006100214.396-1-aladyshev22@gmail.com> <20231006100214.396-4-aladyshev22@gmail.com>
 <ZSP2ug4V0MGGGGFq@kernel.org>
In-Reply-To: <ZSP2ug4V0MGGGGFq@kernel.org>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Tue, 10 Oct 2023 15:30:31 +0300
Message-ID: <CACSj6VUKr4zghtsKAPSYZAv0v04vf_ket+L2OyvsDjF7L6pBgw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] mctp: Add MCTP-over-KCS transport binding
To: Simon Horman <horms@kernel.org>
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

Thanks for your comments! Please see the v5 version for the corrections.

On Mon, Oct 9, 2023 at 3:49=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Fri, Oct 06, 2023 at 01:02:14PM +0300, Konstantin Aladyshev wrote:
> > This change adds a MCTP KCS transport binding, as defined by the DMTF
> > specificiation DSP0254 - "MCTP KCS Transport Binding".
>
> nit: specification
>
>      checkpatch.pl --codespell is helpful here
>

Done.

> > A MCTP protocol network device is created for each KCS channel found in
> > the system.
> > The interrupt code for the KCS state machine is based on the current
> > IPMI KCS driver.
> >
> > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> > ---
> >  drivers/net/mctp/Kconfig    |   8 +
> >  drivers/net/mctp/Makefile   |   1 +
> >  drivers/net/mctp/mctp-kcs.c | 594 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 603 insertions(+)
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
>
> nit: specification
>

Here it is spelled correctly. But it were incorrect in the commit
message itself and in the cover letter. Both are fixed now.

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
> > index 000000000000..2ea2ab00c188
> > --- /dev/null
> > +++ b/drivers/net/mctp/mctp-kcs.c
> > @@ -0,0 +1,594 @@
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
> > +#include <linux/i2c.h>
> > +#include <linux/if_arp.h>
> > +#include <linux/ipmi_kcs.h>
> > +#include <linux/kcs_bmc_client.h>
> > +#include <linux/mctp.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/netdevice.h>
> > +#include <net/mctp.h>
> > +#include <net/mctpdevice.h>
> > +#include <net/pkt_sched.h>
> > +
> > +#define MCTP_KCS_MTU 64
> > +#define KCS_MSG_BUFSIZ 1000
> > +
> > +struct mctp_kcs {
> > +     struct list_head entry;
> > +
> > +     /* protects rx & tx state machines */
> > +     spinlock_t lock;
> > +
> > +     struct kcs_bmc_client client;
> > +     struct net_device *netdev;
> > +
> > +     enum kcs_ipmi_phases phase;
> > +     enum kcs_ipmi_errors error;
> > +
> > +     int data_in_idx;
>
> Perhaps data_in_idx could be unsigned, unless it can hold negative values=
.
>

Done

> > +     u8 *data_in;
> > +
> > +     int data_out_idx;
> > +     int data_out_len;
>
> Likewise for data_out_idx and data_out_len.
>

Done

> > +     u8 *data_out;
> > +
> > +     struct work_struct rx_work;
> > +};
> > +
> > +struct mctp_kcs_header {
> > +     u8 netfn_lun;
> > +     u8 defining_body;
> > +     u8 len;
> > +} __packed;
> > +
> > +struct mctp_kcs_trailer {
> > +     u8 pec;
> > +} __packed;
> > +
> > +#define MCTP_KCS_NETFN_LUN 0xb0
> > +#define DEFINING_BODY_DMTF_PRE_OS_WORKING_GROUP 0x01
> > +
> > +static int mctp_kcs_validate_data(struct mctp_kcs *mkcs,
> > +                               struct mctp_kcs_header *hdr, int len)
> > +{
> > +     struct net_device *ndev =3D mkcs->netdev;
> > +     struct mctp_kcs_trailer *tlr;
> > +     u8 pec;
> > +
> > +     if (hdr->netfn_lun !=3D MCTP_KCS_NETFN_LUN) {
> > +             dev_err(mkcs->client.dev->dev,
> > +                     "%s: KCS binding header error! netfn_lun =3D 0x%0=
2x, but should be 0x%02x",
> > +                     __func__, hdr->netfn_lun, MCTP_KCS_NETFN_LUN);
> > +             ndev->stats.rx_dropped++;
> > +             return -EINVAL;
> > +     }
> > +     if (hdr->defining_body !=3D DEFINING_BODY_DMTF_PRE_OS_WORKING_GRO=
UP) {
> > +             dev_err(mkcs->client.dev->dev,
> > +                     "%s: KCS binding header error! defining_body =3D =
0x%02x, but should be 0x%02x",
> > +                     __func__, hdr->defining_body,
> > +                     DEFINING_BODY_DMTF_PRE_OS_WORKING_GROUP);
> > +             ndev->stats.rx_dropped++;
> > +             return -EINVAL;
> > +     }
> > +     if (hdr->len !=3D (u8)(len - sizeof(struct mctp_kcs_header) -
> > +                          sizeof(struct mctp_kcs_trailer))) {
>
> It's not clear what stops this, and the similar logic in mctp_kcs_rx_work=
()
> from underflowing in the presence of bad input.
>

Done
I've added another check in the beginning of the function that 'len'
is big enough to contain both binding structures.

> > +             dev_err(mkcs->client.dev->dev,
> > +                     "%s: KCS binding header error! len =3D 0x%02x, bu=
t should be 0x%02x",
> > +                     __func__, hdr->len,
> > +                     (u8)(len - sizeof(struct mctp_kcs_header) -
> > +                          sizeof(struct mctp_kcs_trailer)));
> > +             ndev->stats.rx_length_errors++;
> > +             return -EINVAL;
> > +     }
> > +
> > +     pec =3D i2c_smbus_pec(0, (u8 *)(hdr + 1), hdr->len);
> > +     tlr =3D (struct mctp_kcs_trailer *)((u8 *)(hdr + 1) + hdr->len);
> > +     if (pec !=3D tlr->pec) {
> > +             dev_err(mkcs->client.dev->dev,
> > +                     "%s: PEC error! Packet value=3D0x%02x, calculated=
 value=3D0x%02x",
> > +                     __func__, tlr->pec, pec);
> > +             ndev->stats.rx_crc_errors++;
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
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
>
> nit: please arrange local variables in Networking code in reverse xmas tr=
ee
>      order - longest line to shortest.
>
>      This can be helpful: https://github.com/ecree-solarflare/xmastree
>

Done

> > +
> > +     spin_lock_irqsave(&mkcs->lock, flags);
> > +     for (i =3D 0; i < (mkcs->data_in_idx); i++)
> > +             dev_dbg(mkcs->client.dev->dev, "%s: data_in[%d]=3D0x%02x"=
,
> > +                     __func__, i, mkcs->data_in[i]);
>
> I'm unsure if it went out of fashion for some reason,
> but perhaps print_hex_dump_bytes() or similar is useful here.
>

I use `dev_dbg` in other places, and I'm not sure that
'print_hex_dump_bytes()' is equivalent in this case

> > +
> > +     data_len =3D mkcs->data_in_idx - sizeof(struct mctp_kcs_header) -
> > +                sizeof(struct mctp_kcs_trailer);
>
> Perhaps it makes sense to move the check below so that is is
> above the calculation above, thus groping handling of data_in_idx togethe=
r.
>
> Also could data_len be calculated in and returned by
> mctp_kcs_validate_data() ?
>

I'm not sure that 'mctp_kcs_validate_data()' should return something
like that, but I've refactored the code and now 'data_len' is
calculated only after the successful packet validation.

> > +     if (mkcs->phase !=3D KCS_PHASE_WRITE_DONE) {
> > +             dev_err(mkcs->client.dev->dev,
> > +                     "%s: error! Wrong KCS stage at the end of data re=
ad (phase=3D%d)",
> > +                     __func__, mkcs->phase);
> > +             mkcs->netdev->stats.rx_dropped++;
> > +             goto unlock_irq;
> > +     }
> > +
> > +     mkcs->phase =3D KCS_PHASE_WAIT_READ;
> > +     data_in_idx =3D mkcs->data_in_idx;
> > +     mkcs->data_in_idx =3D 0;
> > +
> > +     skb =3D netdev_alloc_skb(mkcs->netdev, data_len);
> > +     if (!skb) {
> > +             mkcs->netdev->stats.rx_dropped++;
> > +             goto unlock_irq;
> > +     }
>
> Would it make sense to allocate the skb after calling
> mctp_kcs_validate_data() ?
>

Done

> > +
> > +     kcs_header =3D (struct mctp_kcs_header *)mkcs->data_in;
>
>
> Similar to my comment above on underflow.
> It's unclear to me what ensures that the header is present
> in data_in.
>
> Also, as kcs_header is only passed to mctp_kcs_validate_data,
> which also has access to mkcs, perhaps it could be
> extracted in mctp_kcs_validate_data().
>

Done

> > +     rc =3D mctp_kcs_validate_data(mkcs, kcs_header, data_in_idx);
> > +     if (rc) {
> > +             dev_err(mkcs->client.dev->dev,
> > +                     "%s: error! Binding validation failed", __func__)=
;
> > +             dev_kfree_skb(skb);
> > +             goto unlock_irq;
> > +     }
> > +
> > +     skb->protocol =3D htons(ETH_P_MCTP);
> > +     skb_put_data(skb, mkcs->data_in + sizeof(struct mctp_kcs_header),
> > +                  data_len);
> > +     skb_reset_network_header(skb);
> > +
> > +     cb =3D __mctp_cb(skb);
> > +     cb->halen =3D 0;
> > +
> > +     netif_rx(skb);
> > +     mkcs->netdev->stats.rx_packets++;
> > +     mkcs->netdev->stats.rx_bytes +=3D data_len;
> > +
> > +unlock_irq:
> > +     spin_unlock_irqrestore(&mkcs->lock, flags);
> > +}
> > +
> > +static netdev_tx_t mctp_kcs_start_xmit(struct sk_buff *skb,
> > +                                    struct net_device *ndev)
> > +{
> > +     struct mctp_kcs_header *kcs_header;
> > +     unsigned long flags;
> > +     int i;
> > +     struct mctp_kcs *mkcs =3D netdev_priv(ndev);
> > +
> > +     if (skb->len > MCTP_KCS_MTU) {
> > +             dev_err(&ndev->dev, "%s: error! skb len is bigger than MT=
U",
> > +                     __func__);
> > +             ndev->stats.tx_dropped++;
> > +             goto out;
> > +     }
> > +
> > +     spin_lock_irqsave(&mkcs->lock, flags);
> > +     if (mkcs->phase !=3D KCS_PHASE_WAIT_READ) {
> > +             dev_err(&ndev->dev,
> > +                     "%s: error! Wrong KCS stage at the start of data =
write (phase=3D%d)",
> > +                     __func__, mkcs->phase);
> > +             dev_kfree_skb(skb);
> > +             spin_unlock_irqrestore(&mkcs->lock, flags);
> > +             return NETDEV_TX_BUSY;
> > +     }
> > +
> > +     netif_stop_queue(ndev);
> > +     mkcs->phase =3D KCS_PHASE_READ;
> > +     kcs_header =3D (struct mctp_kcs_header *)mkcs->data_out;
> > +     kcs_header->netfn_lun =3D MCTP_KCS_NETFN_LUN;
> > +     kcs_header->defining_body =3D DEFINING_BODY_DMTF_PRE_OS_WORKING_G=
ROUP;
> > +     kcs_header->len =3D skb->len;
> > +     skb_copy_bits(skb, 0, kcs_header + 1, skb->len);
> > +     mkcs->data_out[sizeof(struct mctp_kcs_header) + skb->len] =3D
> > +             i2c_smbus_pec(0, (u8 *)(kcs_header + 1), skb->len);
> > +     mkcs->data_out_idx =3D 1;
> > +     mkcs->data_out_len =3D skb->len + sizeof(struct mctp_kcs_header) =
+
> > +                          sizeof(struct mctp_kcs_trailer);
> > +
> > +     for (i =3D 0; i < (mkcs->data_out_len); i++)
> > +             dev_dbg(&ndev->dev, "%s: data_out[%d]=3D0x%02x", __func__=
, i,
> > +                     mkcs->data_out[i]);
> > +
> > +     // Write first data byte to initialize transmission
> > +     kcs_bmc_write_data(mkcs->client.dev, mkcs->data_out[0]);
> > +
> > +     spin_unlock_irqrestore(&mkcs->lock, flags);
> > +out:
> > +     dev_kfree_skb(skb);
> > +     return NETDEV_TX_OK;
> > +}
> > +
> > +static void set_state(struct mctp_kcs *mkcs, u8 state)
> > +{
> > +     dev_dbg(mkcs->client.dev->dev, "%s: state=3D0x%02x", __func__, st=
ate);
> > +     kcs_bmc_update_status(mkcs->client.dev, KCS_STATUS_STATE_MASK,
> > +                           KCS_STATUS_STATE(state));
> > +}
> > +
> > +static int mctp_kcs_ndo_open(struct net_device *ndev)
> > +{
> > +     struct mctp_kcs *mkcs;
> > +
> > +     mkcs =3D netdev_priv(ndev);
> > +     dev_info(&ndev->dev, "Open MCTP over KCS channel %d",
> > +              mkcs->client.dev->channel);
> > +     return kcs_bmc_enable_device(mkcs->client.dev, &mkcs->client);
> > +}
> > +
> > +static int mctp_kcs_ndo_stop(struct net_device *ndev)
> > +{
> > +     struct mctp_kcs *mkcs;
> > +
> > +     mkcs =3D netdev_priv(ndev);
> > +     dev_info(&ndev->dev, "Stop MCTP over KCS channel %d",
> > +              mkcs->client.dev->channel);
> > +     mkcs->data_in_idx =3D 0;
> > +     mkcs->data_out_idx =3D 0;
> > +     mkcs->data_out_len =3D 0;
> > +     mkcs->phase =3D KCS_PHASE_IDLE;
> > +     set_state(mkcs, IDLE_STATE);
> > +     kcs_bmc_disable_device(mkcs->client.dev, &mkcs->client);
> > +     return 0;
> > +}
> > +
> > +static const struct net_device_ops mctp_kcs_netdev_ops =3D {
> > +     .ndo_start_xmit =3D mctp_kcs_start_xmit,
> > +     .ndo_open =3D mctp_kcs_ndo_open,
> > +     .ndo_stop =3D mctp_kcs_ndo_stop,
> > +};
> > +
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
> > +     u8 data;
> > +     struct kcs_bmc_device *kcs_bmc =3D mkcs->client.dev;
> > +
> > +     switch (mkcs->phase) {
> > +     case KCS_PHASE_WRITE_START:
> > +             dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_WRITE_START", __func=
__);
> > +             mkcs->phase =3D KCS_PHASE_WRITE_DATA;
> > +             fallthrough;
> > +
> > +     case KCS_PHASE_WRITE_DATA:
> > +             dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_WRITE_DATA", __func_=
_);
> > +             if (mkcs->data_in_idx < KCS_MSG_BUFSIZ) {
> > +                     set_state(mkcs, WRITE_STATE);
> > +                     kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> > +                     mkcs->data_in[mkcs->data_in_idx++] =3D
> > +                             kcs_bmc_read_data(kcs_bmc);
> > +                     dev_dbg(kcs_bmc->dev,
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
> > +             dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_WRITE_END_CMD", __fu=
nc__);
> > +             if (mkcs->data_in_idx < KCS_MSG_BUFSIZ) {
> > +                     set_state(mkcs, READ_STATE);
> > +                     mkcs->data_in[mkcs->data_in_idx++] =3D
> > +                             kcs_bmc_read_data(kcs_bmc);
> > +                     dev_dbg(kcs_bmc->dev,
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
> > +             dev_dbg(kcs_bmc->dev,
> > +                     "%s: KCS_PHASE_READ, data_out_idx=3D%d, data_out_=
len=3D%d",
> > +                     __func__, mkcs->data_out_idx, mkcs->data_out_len)=
;
> > +             if (mkcs->data_out_idx =3D=3D mkcs->data_out_len)
> > +                     set_state(mkcs, IDLE_STATE);
> > +
> > +             data =3D kcs_bmc_read_data(kcs_bmc);
> > +             if (data !=3D KCS_CMD_READ_BYTE) {
> > +                     dev_dbg(kcs_bmc->dev,
> > +                             "%s: error! data is not equal to KCS_CMD_=
READ_BYTE",
> > +                             __func__);
> > +                     set_state(mkcs, ERROR_STATE);
> > +                     kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> > +                     break;
> > +             }
> > +
> > +             if (mkcs->data_out_idx =3D=3D mkcs->data_out_len) {
> > +                     kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> > +                     mkcs->netdev->stats.tx_bytes +=3D mkcs->data_out_=
len;
> > +                     mkcs->netdev->stats.tx_packets++;
> > +                     mkcs->phase =3D KCS_PHASE_IDLE;
> > +                     if (netif_queue_stopped(mkcs->netdev))
> > +                             netif_start_queue(mkcs->netdev);
> > +                     break;
> > +             }
> > +
> > +             dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_READ: data_out[%d]=
=3D0x%02x",
> > +                     __func__, mkcs->data_out_idx,
> > +                     mkcs->data_out[mkcs->data_out_idx]);
> > +             kcs_bmc_write_data(kcs_bmc,
> > +                                mkcs->data_out[mkcs->data_out_idx++]);
> > +             break;
> > +
> > +     case KCS_PHASE_ABORT_ERROR1:
> > +             dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_ABORT_ERROR1", __fun=
c__);
> > +             set_state(mkcs, READ_STATE);
> > +             kcs_bmc_read_data(kcs_bmc);
> > +             kcs_bmc_write_data(kcs_bmc, mkcs->error);
> > +             mkcs->phase =3D KCS_PHASE_ABORT_ERROR2;
> > +             break;
> > +
> > +     case KCS_PHASE_ABORT_ERROR2:
> > +             dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_ABORT_ERROR2", __fun=
c__);
> > +             set_state(mkcs, IDLE_STATE);
> > +             kcs_bmc_read_data(kcs_bmc);
> > +             kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> > +             mkcs->phase =3D KCS_PHASE_IDLE;
> > +             break;
> > +
> > +     default:
> > +             dev_dbg(kcs_bmc->dev, "%s: unknown KCS phase", __func__);
> > +             kcs_bmc_ipmi_force_abort(mkcs);
> > +             break;
> > +     }
> > +}
> > +
> > +static void kcs_bmc_ipmi_handle_cmd(struct mctp_kcs *mkcs)
> > +{
> > +     struct kcs_bmc_device *kcs_bmc =3D mkcs->client.dev;
> > +
> > +     set_state(mkcs, WRITE_STATE);
> > +     kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> > +
> > +     switch (kcs_bmc_read_data(kcs_bmc)) {
> > +     case KCS_CMD_WRITE_START:
> > +             dev_dbg(kcs_bmc->dev, "%s: KCS_CMD_WRITE_START", __func__=
);
> > +             mkcs->phase =3D KCS_PHASE_WRITE_START;
> > +             mkcs->error =3D KCS_NO_ERROR;
> > +             mkcs->data_in_idx =3D 0;
> > +             break;
> > +
> > +     case KCS_CMD_WRITE_END:
> > +             dev_dbg(kcs_bmc->dev, "%s: KCS_CMD_WRITE_END", __func__);
> > +             if (mkcs->phase !=3D KCS_PHASE_WRITE_DATA) {
> > +                     kcs_bmc_ipmi_force_abort(mkcs);
> > +                     break;
> > +             }
> > +             mkcs->phase =3D KCS_PHASE_WRITE_END_CMD;
> > +             break;
> > +
> > +     case KCS_CMD_GET_STATUS_ABORT:
> > +             dev_dbg(kcs_bmc->dev, "%s: KCS_CMD_GET_STATUS_ABORT", __f=
unc__);
> > +             if (mkcs->error =3D=3D KCS_NO_ERROR)
> > +                     mkcs->error =3D KCS_ABORTED_BY_COMMAND;
> > +
> > +             mkcs->phase =3D KCS_PHASE_ABORT_ERROR1;
> > +             mkcs->data_in_idx =3D 0;
> > +             break;
> > +
> > +     default:
> > +             dev_dbg(kcs_bmc->dev, "%s: unknown KCS command", __func__=
);
> > +             kcs_bmc_ipmi_force_abort(mkcs);
> > +             mkcs->error =3D KCS_ILLEGAL_CONTROL_CODE;
> > +             break;
> > +     }
> > +}
> > +
> > +static struct mctp_kcs *client_to_mctp_kcs(struct kcs_bmc_client *clie=
nt)
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
> > +     if (!ndev) {
> > +             dev_err_probe(kcs_bmc->dev, -ENOMEM,
> > +                           "alloc_netdev failed for KCS channel %d\n",
> > +                           kcs_bmc->channel);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     mkcs =3D netdev_priv(ndev);
> > +     mkcs->netdev =3D ndev;
> > +     mkcs->client.dev =3D kcs_bmc;
> > +     mkcs->client.ops =3D &kcs_bmc_mctp_client_ops;
> > +     mkcs->data_in =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_=
KERNEL);
> > +     if (!mkcs->data_in) {
> > +             dev_err_probe(
> > +                     kcs_bmc->dev, -ENOMEM,
> > +                     "failed to allocate data_in buffer for KCS channe=
l %d\n",
> > +                     kcs_bmc->channel);
> > +             rc =3D -ENOMEM;
> > +             goto free_netdev;
> > +     }
> > +     mkcs->data_out =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP=
_KERNEL);
> > +     if (!mkcs->data_out) {
> > +             dev_err_probe(
> > +                     kcs_bmc->dev, -ENOMEM,
> > +                     "failed to allocate data_out buffer for KCS chann=
el %d\n",
> > +                     kcs_bmc->channel);
> > +             rc =3D -ENOMEM;
> > +             goto free_netdev;
> > +     }
> > +
> > +     INIT_WORK(&mkcs->rx_work, mctp_kcs_rx_work);
> > +
> > +     rc =3D register_netdev(ndev);
> > +     if (rc)
> > +             goto free_netdev;
> > +
> > +     spin_lock_irq(&kcs_bmc_mctp_instances_lock);
> > +     list_add(&mkcs->entry, &kcs_bmc_mctp_instances);
> > +     spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
> > +
> > +     dev_info(kcs_bmc->dev, "Add MCTP client for the KCS channel %d",
> > +              kcs_bmc->channel);
> > +     return 0;
> > +
> > +free_netdev:
> > +     free_netdev(ndev);
> > +
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
> > +             }
> > +     }
> > +     spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
> > +
> > +     if (!mkcs)
> > +             return -ENODEV;
> > +
> > +     unregister_netdev(mkcs->netdev);
> > +     free_netdev(mkcs->netdev);
> > +     kcs_bmc_disable_device(kcs_bmc, &mkcs->client);
> > +     devm_kfree(kcs_bmc->dev, mkcs->data_out);
> > +     devm_kfree(kcs_bmc->dev, mkcs->data_in);
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
> > +
> > +module_init(mctp_kcs_init);
> > +module_exit(mctp_kcs_exit);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Konstantin Aladyshev <aladyshev22@gmail.com>");
> > +MODULE_DESCRIPTION("MCTP KCS transport");
> > --
> > 2.25.1
> >
> >
