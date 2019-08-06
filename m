Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA483D8F
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 00:53:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4638zv6hFkzDr6d
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 08:52:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=willemdebruijn.kernel@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uY93aBpP"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4638zB2nmVzDqxH
 for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2019 08:52:22 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id k8so83923815eds.7
 for <openbmc@lists.ozlabs.org>; Tue, 06 Aug 2019 15:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OsJD8VAyQTj0knelEu7AORFyn7iI15mUs1OulFCIa7E=;
 b=uY93aBpPveaVHlQRcVwG6b+9jyOA7zhi8PPWRWif38Hx+fTKmUlIAsBblWXgL9C7t7
 OnzuBrCaEkapIqKLCwxjCu7cPPKD8nytc9NEQmm6U2dU30UkKlYRXc47MxO1EWPlCsBE
 P1fDyYghQzZOE+hVM6tItTpSSUwlQHG1JTlAKP4xnJ0Zp7ekhIAB1b5H9Qs4fr7gV+3a
 UfXdMu426INvC/zUXEckaz7hsKqQ5kgUJuqOmUeaokrsdcPhwBM6L/OsqDEKiqAFMUBZ
 sfQ1WQwkXcN1sAFkH1gVP69V7NCLSS5oz8m2vSTaCgDV0vn7Tld+QdsZITF7PO9suslb
 jjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsJD8VAyQTj0knelEu7AORFyn7iI15mUs1OulFCIa7E=;
 b=IaeBwWpEI3X/CRuzzISw6LdapoWxHmr8x6DWKadAVTxxzFx228HO1+0ima6Pe8y7+p
 wGvDWh6bwRUlC58bxQlub6TyqF0uLR+YPGSrDrSHPkUGyQ7fHySR3qs7KqSkttr9GIWQ
 5XPcw6O4prU7IbxUzLp39igoM7Ey+JaMb8RURJMuxCcCav4QIp9YobHhTpM2o53aOtcq
 7EACzKcmXVgvWTlvDU8D6SOFCqaDWCVn8Y4whD9TR3Szm9Va5X5FsDdx3v/ktdWKkliV
 PR6DCKPkuqXKKXOZiQz8spUiTH/AMaYp83uFT6ZVS+wfn4Yd1vCwE94x93zMOg0Fryly
 4Wsg==
X-Gm-Message-State: APjAAAWHKskVSWBntnBr36eG0s79uCdk6PnNRn5fNVuD7/H56X5mcUGe
 8R+x7SewRGP3aP/h9SPLuz3ntloGHU8mWvr5G1Q=
X-Google-Smtp-Source: APXvYqzjVk+wti27MISqMtqocoFJjeRp3FLEib2dkcShJ52VZJx85DMCd2eM20vsIVOu9tOXu2t4AojG84lUxgR+v4M=
X-Received: by 2002:a17:906:1108:: with SMTP id
 h8mr5357770eja.229.1565131934674; 
 Tue, 06 Aug 2019 15:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190801072611.27935-1-avifishman70@gmail.com>
 <20190801072611.27935-3-avifishman70@gmail.com>
 <CA+FuTSd89gJBX-zaZTzgNxpqtR_MvVfMf=6hdRe5+1MPRszw8g@mail.gmail.com>
 <CAKKbWA6hjxupFQNnTUOfeKLXd2wtZ9+g7uUpe34CeErn5kBAaA@mail.gmail.com>
In-Reply-To: <CAKKbWA6hjxupFQNnTUOfeKLXd2wtZ9+g7uUpe34CeErn5kBAaA@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 6 Aug 2019 18:51:38 -0400
Message-ID: <CAF=yD-KD1TNTMp1Dhex766MmZUyX6rt7Oo=FoCdkc19B6Z_07g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] net: npcm: add NPCM7xx EMC 10/100 Ethernet driver
To: Avi Fishman <avifishman70@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Network Development <netdev@vger.kernel.org>,
 David Miller <davem@davemloft.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > Does this device support stacked VLAN?
> I am not familiar with stacked VLAN.
> Our HW for sure there is no support. can the SW stack handle it for me?
> Does it mean that  the packets can be larger?

If the device does not support it, I believe it's fine to leave it to S/W.

> > Is this really the device maximum?
>
> The device can support upto 64KB, but of course I will not allocate
> for each RX data such a big buffer.
> Can I know what is the maximum value the network stack may request? I
> saw many driver allocating 1536 for each packet.

The maximum is the minimum of the link layer and device h/w limits,
but you indeed don't want to allocate for worst case if that is highly
unlikely.

Your choice of 1500 is fine for this initial commit, really. More on
MTU below with ndo_change_mtu

> > > +       rxd_offset = (readl((ether->reg + REG_CRXDSA)) -
> > > +                     readl((ether->reg + REG_RXDLSA)))
> > > +               / sizeof(struct npcm7xx_txbd);
> > > +       DUMP_PRINT("RXD offset    %6d\n", rxd_offset);
> > > +       DUMP_PRINT("cur_rx        %6d\n", ether->cur_rx);
> > > +       DUMP_PRINT("rx_err        %6d\n", ether->rx_err);
> > > +       ether->rx_err = 0;
> > > +       DUMP_PRINT("rx_berr       %6d\n", ether->rx_berr);
> > > +       ether->rx_berr = 0;
> > > +       DUMP_PRINT("rx_stuck      %6d\n", ether->rx_stuck);
> > > +       ether->rx_stuck = 0;
> > > +       DUMP_PRINT("rdu           %6d\n", ether->rdu);
> > > +       ether->rdu = 0;
> > > +       DUMP_PRINT("rxov rx       %6d\n", ether->rxov);
> > > +       ether->rxov = 0;
> > > +       /* debug counters */
> > > +       DUMP_PRINT("rx_int_count  %6d\n", ether->rx_int_count);
> > > +       ether->rx_int_count = 0;
> > > +       DUMP_PRINT("rx_err_count  %6d\n", ether->rx_err_count);
> > > +       ether->rx_err_count = 0;
> >
> > Basic counters like tx_packets and rx_errors are probably better
> > exported regardless of debug level as net_device_stats. And then don't
> > need to be copied in debug output.
>
> They are also exported there, see below ether->stats.tx_packets++; and
> ether->stats.rx_errors++;
> those are different counters for debug since we had HW issues that we
> needed to workaround and might need them for future use.
> Currently the driver is stable on millions of parts in the field.
>
> >
> > Less standard counters like tx interrupt count are probably better
> > candidates for ethtool -S.
>
> I don't have support for ethtool.
> is it a must? it is quite some work and this driver is already in the
> field for quite some years.

Your driver includes a struct ethtool_ops. Implementing its callback
.get_ethtool_stats seems straightforward?

David also requested using standard infrastructure over this custom
debug logic. Ethool stats appear the most logical choice to me. But
there may be others.

> > > +static struct sk_buff *get_new_skb(struct net_device *netdev, u32 i)
> > > +{
> > > +       __le32 buffer;
> > > +       struct npcm7xx_ether *ether = netdev_priv(netdev);
> > > +       struct sk_buff *skb = netdev_alloc_skb(netdev,
> > > +               roundup(MAX_PACKET_SIZE_W_CRC, 4));
> > > +
> > > +       if (unlikely(!skb)) {
> > > +               if (net_ratelimit())
> > > +                       netdev_warn(netdev, "failed to allocate rx skb\n");
> >
> > can use net_warn_ratelimited (here and elsewhere)
>
> should I replace every netdev_warn/err/info with net_warn/err/inf_ratelimited?
> I saw in drivers that are using net_warn_ratelimited, that many time
> uses also netdev_warn/err/info

They probably use the second in non-ratelimited cases?

> > > +static irqreturn_t npcm7xx_tx_interrupt(int irq, void *dev_id)
> > > +{
> > > +       struct npcm7xx_ether *ether;
> > > +       struct platform_device *pdev;
> > > +       struct net_device *netdev;
> > > +       __le32 status;
> > > +       unsigned long flags;
> > > +
> > > +       netdev = dev_id;
> > > +       ether = netdev_priv(netdev);
> > > +       pdev = ether->pdev;
> > > +
> > > +       npcm7xx_get_and_clear_int(netdev, &status, 0xFFFF0000);
> > > +
> > > +       ether->tx_int_count++;
> > > +
> > > +       if (status & MISTA_EXDEF)
> > > +               dev_err(&pdev->dev, "emc defer exceed interrupt status=0x%08X\n"
> > > +                       , status);
> > > +       else if (status & MISTA_TXBERR) {
> > > +               dev_err(&pdev->dev, "emc bus error interrupt status=0x%08X\n",
> > > +                       status);
> > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> > > +               npcm7xx_info_print(netdev);
> > > +#endif
> > > +               spin_lock_irqsave(&ether->lock, flags);
> >
> > irqsave in hard interrupt context?
>
> I need to protect my REG_MIEN register that is changed in other places.
> I think that spin_lock_irqsave() is relevant when working in SMP,
> since other CPU may still be running.
> Isn't it?

This is an interesting case. The hardware interrupt handler will not
interrupt itself. But it is architecture dependent whether all
interrupts are disabled when a particular interrupt handler is running
(as per the unreliable guide to locking).

So even in absence of SMP, this would indeed need spin_lock_irqsave if
there are multiple hardware interrupt handlers potentially accessing
the same data. That sounds unlikely in general, but does happen here
for REG_MIEN, in npcm7xx_tx_interrupt and npcm7xx_rx_interrupt. So I
was mistaken, this is not only the most conservative locking method,
it is indeed required.

>
> >
> > > +               writel(0, (ether->reg + REG_MIEN)); /* disable any interrupt */
> > > +               spin_unlock_irqrestore(&ether->lock, flags);
> > > +               ether->need_reset = 1;
> > > +       } else if (status & ~(MISTA_TXINTR | MISTA_TXCP | MISTA_TDU))
> > > +               dev_err(&pdev->dev, "emc other error interrupt status=0x%08X\n",
> > > +                       status);
> > > +
> > > +    /* if we got MISTA_TXCP | MISTA_TDU remove those interrupt and call napi */
> >
> > The goal of napi is to keep interrupts disabled until napi completes.
>
> We have a HW issue that because of it I still enabled TX complete interrupt,
> I will see if I can disable all interrupts and only leave the error interrupts

Please do. I'm not sure what happens when trying to schedule napi
while it is already scheduled or running. Even in the best case
(nothing), these spurious interrupts are inefficient.

> >
> > > +       if (status & (MISTA_TXCP | MISTA_TDU) &
> > > +           readl((ether->reg + REG_MIEN))) {
> > > +               __le32 reg_mien;
> > > +
> > > +               spin_lock_irqsave(&ether->lock, flags);
> > > +               reg_mien = readl((ether->reg + REG_MIEN));
> > > +               if (reg_mien & ENTDU)
> > > +                       /* Disable TDU interrupt */
> > > +                       writel(reg_mien & (~ENTDU), (ether->reg + REG_MIEN));
> > > +
> > > +               spin_unlock_irqrestore(&ether->lock, flags);
> > > +
> > > +               if (status & MISTA_TXCP)
> > > +                       ether->tx_cp_i++;
> > > +               if (status & MISTA_TDU)
> > > +                       ether->tx_tdu_i++;
> > > +       } else {
> > > +               dev_dbg(&pdev->dev, "status=0x%08X\n", status);
> > > +       }
> > > +
> > > +       napi_schedule(&ether->napi);
> > > +
> > > +       return IRQ_HANDLED;
> > > +}
> > > +
> > > +static irqreturn_t npcm7xx_rx_interrupt(int irq, void *dev_id)
> > > +{
> > > +       struct net_device *netdev = (struct net_device *)dev_id;
> > > +       struct npcm7xx_ether *ether = netdev_priv(netdev);
> > > +       struct platform_device *pdev = ether->pdev;
> > > +       __le32 status;
> > > +       unsigned long flags;
> > > +       unsigned int any_err = 0;
> > > +       __le32 rxfsm;
> > > +
> > > +       npcm7xx_get_and_clear_int(netdev, &status, 0xFFFF);
> >
> > Same here
>
> in non error case I do leave only the error interrupts and schedule napi.

Oh, so the Rx interrupt remains suppressed. Then that's fine.

> > > +static const struct net_device_ops npcm7xx_ether_netdev_ops = {
> > > +       .ndo_open               = npcm7xx_ether_open,
> > > +       .ndo_stop               = npcm7xx_ether_close,
> > > +       .ndo_start_xmit         = npcm7xx_ether_start_xmit,
> > > +       .ndo_get_stats          = npcm7xx_ether_stats,
> > > +       .ndo_set_rx_mode        = npcm7xx_ether_set_rx_mode,
> > > +       .ndo_set_mac_address    = npcm7xx_set_mac_address,
> > > +       .ndo_do_ioctl           = npcm7xx_ether_ioctl,
> > > +       .ndo_validate_addr      = eth_validate_addr,
> > > +       .ndo_change_mtu         = eth_change_mtu,
> >
> > This is marked as deprecated. Also in light of the hardcoded
> > MAX_PACKET_SIZE, probably want to set dev->max_mtu.
>
> can I just not set .ndo_change_mtu? or I must add my own implementation?
> setting of dev->max_mtu, can be done in probe, yes?

It's fine to just not have it. The patchset that introduced max_mtu
(61e84623ace3, a52ad514fdf3) removed many.

One reason to have a callback function is to bring the device down/up
with different sized rx buffers.

But handling that might be too much extra complexity for the initial
patch. It's fine to keep the fixed rx alloc size as is.

> BTW, I see that currently the mtu is 1500 but I do get transactions
> with len of 1514 (I didn't compile with VLAN)

That is to be expected, as MTU excludes link layer header (and FCS,
and perhaps also vlan?)
