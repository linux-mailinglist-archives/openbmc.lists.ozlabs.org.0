Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F6481109
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 06:28:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4624WN4bjFzDqWN
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 14:28:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b43; helo=mail-yb1-xb43.google.com;
 envelope-from=willemdebruijn.kernel@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T4Suw4MD"; 
 dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zxz31K2ZzDqR0
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 03:26:03 +1000 (AEST)
Received: by mail-yb1-xb43.google.com with SMTP id d9so19517645ybf.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2019 10:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ezBID7n/qSLSbHesEIdqOHp7IeYm9XV8bMw0NEQPmZY=;
 b=T4Suw4MDDzJeiRzMZI/vPFCm9OPbDhguqs//d61BC7jry+c6pOVd18XhX7CL9eI4bW
 B9U/TlKxfiJIlZsBQfwDaX6IM53746dqGJoTAjMIS1eQnKutKNwVrBdTPZLIZ5wX7hmn
 f0nO80nCZ/BWJwXGiBe2FZtWo3bdwmlPSZ5ewAz7Rb5txfgmqKud7M3LFWPp4pl8SV/n
 2z+7b0UjfID8JMPV5+6QOR7o7eRKpAEcTkjN7++kJm/kFsLxkyRDI4YQK0omiDp1daH3
 FRmkezdBreaoxXefJrnaXwHefmOzZXRMSGEgZqW7CIEfEzF9kXnS6JsiGSBjS0Octs/v
 M/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ezBID7n/qSLSbHesEIdqOHp7IeYm9XV8bMw0NEQPmZY=;
 b=S+WB/WSzSdnH3tS/DMF6gm4bIdGY7dysYlBRAY0c5ACsHE078ryORjF58tjHWXpfwe
 7hDXUBi+6IxP5lUHU50YRnmZZjR04uNu7ikq7I22WDbtRU4BFOEqO4rNtdwoATflMUtU
 u6ivXVB/XGZIMO+mIZgNBx/xbIsFz1QI/2Xv7pzeZWGF7T0Zb+rHT/2p8QsOVsEfhiwY
 VIq39NGQJz/TrSXLZRqgV6xJZSyYmiqr/F7T4QcZYUFZ/UK00Svmz6LXW0JoKgI1vMo5
 RJ4f9XtDkfwJsABW+FG4TPFtVXVLlOkg1tTNBwvz24lwSyceEPsg+8wzZRDmEITVoTsN
 plmg==
X-Gm-Message-State: APjAAAWck1VBkZMDKQkn5WLVgkGMFsLdlEdlFoodMs4e7tljfLIhX492
 RaqEMUWkDyAbwG/pET8mstrzOcXe
X-Google-Smtp-Source: APXvYqwKE2nGqmY0jT7jYrIUrRvopZxpBqJnArBHucmjEBgk/EsbFT0meOUCIRu3P8KlY8etNr0spQ==
X-Received: by 2002:a25:5456:: with SMTP id i83mr77417866ybb.242.1564680358375; 
 Thu, 01 Aug 2019 10:25:58 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id r10sm16571770ywh.8.2019.08.01.10.25.57
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 10:25:58 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id a5so25926953ybo.13
 for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2019 10:25:57 -0700 (PDT)
X-Received: by 2002:a25:a08e:: with SMTP id y14mr12622ybh.390.1564680357285;
 Thu, 01 Aug 2019 10:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190801072611.27935-1-avifishman70@gmail.com>
 <20190801072611.27935-3-avifishman70@gmail.com>
In-Reply-To: <20190801072611.27935-3-avifishman70@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 1 Aug 2019 13:25:20 -0400
X-Gmail-Original-Message-ID: <CA+FuTSd89gJBX-zaZTzgNxpqtR_MvVfMf=6hdRe5+1MPRszw8g@mail.gmail.com>
Message-ID: <CA+FuTSd89gJBX-zaZTzgNxpqtR_MvVfMf=6hdRe5+1MPRszw8g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] net: npcm: add NPCM7xx EMC 10/100 Ethernet driver
To: Avi Fishman <avifishman70@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 05 Aug 2019 14:26:33 +1000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjaminfair@google.com,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, tali.perry1@gmail.com,
 robh+dt@kernel.org, tglx@linutronix.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Network Development <netdev@vger.kernel.org>,
 David Miller <davem@davemloft.net>, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 1, 2019 at 3:28 AM Avi Fishman <avifishman70@gmail.com> wrote:
>
> EMC Ethernet Media Access Controller supports 10/100 Mbps and
> RMII.
> This driver has been working on Nuvoton BMC NPCM7xx.
>
> Signed-off-by: Avi Fishman <avifishman70@gmail.com>



> +/* global setting for driver */
> +#define RX_QUEUE_LEN   128
> +#define TX_QUEUE_LEN   64
> +#define MAX_RBUFF_SZ   0x600
> +#define MAX_TBUFF_SZ   0x600
> +#define TX_TIMEOUT     50
> +#define DELAY          1000
> +#define CAM0           0x0
> +#define RX_POLL_SIZE    16
> +
> +#ifdef CONFIG_VLAN_8021Q
> +#define IS_VLAN 1
> +#else
> +#define IS_VLAN 0
> +#endif
> +
> +#define MAX_PACKET_SIZE           (1514 + (IS_VLAN * 4))

1514 -> ETH_FRAME_LEN

4 -> VLAN_HLEN

Does this device support stacked VLAN?

Is this really the device maximum?

> +#define MAX_PACKET_SIZE_W_CRC     (MAX_PACKET_SIZE + 4) /* 1518 */

4 -> ETH_FCS_LEN

> +#if defined CONFIG_NPCM7XX_EMC_ETH_DEBUG || defined CONFIG_DEBUG_FS
> +#define REG_PRINT(reg_name) {t = scnprintf(next, size, "%-10s = %08X\n", \
> +       #reg_name, readl(ether->reg + (reg_name))); size -= t;  next += t; }
> +#define DUMP_PRINT(f, x...) {t = scnprintf(next, size, f, ## x); size -= t; \
> +       next += t; }
> +
> +static int npcm7xx_info_dump(char *buf, int count, struct net_device *netdev)
> +{
> +       struct npcm7xx_ether *ether = netdev_priv(netdev);
> +       struct npcm7xx_txbd *txbd;
> +       struct npcm7xx_rxbd *rxbd;
> +       unsigned long flags;
> +       unsigned int i, cur, txd_offset, rxd_offset;
> +       char *next = buf;
> +       unsigned int size = count;
> +       int t;
> +       int is_locked = spin_is_locked(&ether->lock);
> +
> +       if (!is_locked)
> +               spin_lock_irqsave(&ether->lock, flags);
> +
> +       /* ------basic driver information ---- */
> +       DUMP_PRINT("NPCM7XX EMC %s driver version: %s\n", netdev->name,
> +                  DRV_MODULE_VERSION);
> +
> +       REG_PRINT(REG_CAMCMR);
> +       REG_PRINT(REG_CAMEN);
> +       REG_PRINT(REG_CAMM_BASE);
> +       REG_PRINT(REG_CAML_BASE);
> +       REG_PRINT(REG_TXDLSA);
> +       REG_PRINT(REG_RXDLSA);
> +       REG_PRINT(REG_MCMDR);
> +       REG_PRINT(REG_MIID);
> +       REG_PRINT(REG_MIIDA);
> +       REG_PRINT(REG_FFTCR);
> +       REG_PRINT(REG_TSDR);
> +       REG_PRINT(REG_RSDR);
> +       REG_PRINT(REG_DMARFC);
> +       REG_PRINT(REG_MIEN);
> +       REG_PRINT(REG_MISTA);
> +       REG_PRINT(REG_MGSTA);
> +       REG_PRINT(REG_MPCNT);
> +       writel(0x7FFF, (ether->reg + REG_MPCNT));
> +       REG_PRINT(REG_MRPC);
> +       REG_PRINT(REG_MRPCC);
> +       REG_PRINT(REG_MREPC);
> +       REG_PRINT(REG_DMARFS);
> +       REG_PRINT(REG_CTXDSA);
> +       REG_PRINT(REG_CTXBSA);
> +       REG_PRINT(REG_CRXDSA);
> +       REG_PRINT(REG_CRXBSA);
> +       REG_PRINT(REG_RXFSM);
> +       REG_PRINT(REG_TXFSM);
> +       REG_PRINT(REG_FSM0);
> +       REG_PRINT(REG_FSM1);
> +       REG_PRINT(REG_DCR);
> +       REG_PRINT(REG_DMMIR);
> +       REG_PRINT(REG_BISTR);
> +       DUMP_PRINT("\n");
> +
> +       DUMP_PRINT("netif_queue %s\n\n", netif_queue_stopped(netdev) ?
> +                                       "Stopped" : "Running");
> +       if (ether->rdesc)
> +               DUMP_PRINT("napi is %s\n\n", test_bit(NAPI_STATE_SCHED,
> +                                                     &ether->napi.state) ?
> +                                                       "scheduled" :
> +                                                       "not scheduled");
> +
> +       txd_offset = (readl((ether->reg + REG_CTXDSA)) -
> +                     readl((ether->reg + REG_TXDLSA))) /
> +               sizeof(struct npcm7xx_txbd);
> +       DUMP_PRINT("TXD offset    %6d\n", txd_offset);
> +       DUMP_PRINT("cur_tx        %6d\n", ether->cur_tx);
> +       DUMP_PRINT("finish_tx     %6d\n", ether->finish_tx);
> +       DUMP_PRINT("pending_tx    %6d\n", ether->pending_tx);
> +       /* debug counters */
> +       DUMP_PRINT("tx_tdu        %6d\n", ether->tx_tdu);
> +       ether->tx_tdu = 0;
> +       DUMP_PRINT("tx_tdu_i      %6d\n", ether->tx_tdu_i);
> +       ether->tx_tdu_i = 0;
> +       DUMP_PRINT("tx_cp_i       %6d\n", ether->tx_cp_i);
> +        ether->tx_cp_i = 0;
> +       DUMP_PRINT("tx_int_count  %6d\n", ether->tx_int_count);
> +       ether->tx_int_count = 0;
> +       DUMP_PRINT("count_xmit tx %6d\n", ether->count_xmit);
> +       ether->count_xmit = 0;
> +       DUMP_PRINT("count_finish  %6d\n", ether->count_finish);
> +       ether->count_finish = 0;
> +       DUMP_PRINT("\n");
> +
> +       rxd_offset = (readl((ether->reg + REG_CRXDSA)) -
> +                     readl((ether->reg + REG_RXDLSA)))
> +               / sizeof(struct npcm7xx_txbd);
> +       DUMP_PRINT("RXD offset    %6d\n", rxd_offset);
> +       DUMP_PRINT("cur_rx        %6d\n", ether->cur_rx);
> +       DUMP_PRINT("rx_err        %6d\n", ether->rx_err);
> +       ether->rx_err = 0;
> +       DUMP_PRINT("rx_berr       %6d\n", ether->rx_berr);
> +       ether->rx_berr = 0;
> +       DUMP_PRINT("rx_stuck      %6d\n", ether->rx_stuck);
> +       ether->rx_stuck = 0;
> +       DUMP_PRINT("rdu           %6d\n", ether->rdu);
> +       ether->rdu = 0;
> +       DUMP_PRINT("rxov rx       %6d\n", ether->rxov);
> +       ether->rxov = 0;
> +       /* debug counters */
> +       DUMP_PRINT("rx_int_count  %6d\n", ether->rx_int_count);
> +       ether->rx_int_count = 0;
> +       DUMP_PRINT("rx_err_count  %6d\n", ether->rx_err_count);
> +       ether->rx_err_count = 0;

Basic counters like tx_packets and rx_errors are probably better
exported regardless of debug level as net_device_stats. And then don't
need to be copied in debug output.

Less standard counters like tx interrupt count are probably better
candidates for ethtool -S.

> +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> +static void npcm7xx_info_print(struct net_device *netdev)
> +{
> +       char *emc_dump_buf;
> +       int count;
> +       struct npcm7xx_ether *ether;
> +       struct platform_device *pdev;
> +       char c;
> +       char *tmp_buf;
> +       const size_t print_size = 5 * PAGE_SIZE;
> +
> +       ether = netdev_priv(netdev);
> +       pdev = ether->pdev;
> +
> +       emc_dump_buf = kmalloc(print_size, GFP_KERNEL);
> +       if (!emc_dump_buf)
> +               return;
> +
> +       tmp_buf = emc_dump_buf;
> +       count = npcm7xx_info_dump(emc_dump_buf, print_size, netdev);
> +       while (count > 512) {
> +               c = tmp_buf[512];
> +               tmp_buf[512] = 0;
> +               dev_info(&pdev->dev, "%s", tmp_buf);
> +               tmp_buf += 512;
> +               tmp_buf[0] = c;
> +               count -= 512;

Missing closing parenthesis.

Also, why this buffering to printk?

> +static void npcm7xx_write_cam(struct net_device *netdev,
> +                             unsigned int x, unsigned char *pval)
> +{
> +       struct npcm7xx_ether *ether = netdev_priv(netdev);
> +       __le32 msw, lsw;
> +
> +       msw = (pval[0] << 24) | (pval[1] << 16) | (pval[2] << 8) | pval[3];
> +
> +       lsw = (pval[4] << 24) | (pval[5] << 16);

Does __le32 plus this explicit shifting define host endianness? Better
to keep independent?

> +
> +       writel(lsw, (ether->reg + REG_CAML_BASE) + x * CAM_ENTRY_SIZE);
> +       writel(msw, (ether->reg + REG_CAMM_BASE) + x * CAM_ENTRY_SIZE);
> +       dev_dbg(&ether->pdev->dev,
> +               "REG_CAML_BASE = 0x%08X REG_CAMM_BASE = 0x%08X", lsw, msw);
> +}
> +
> +static struct sk_buff *get_new_skb(struct net_device *netdev, u32 i)
> +{
> +       __le32 buffer;
> +       struct npcm7xx_ether *ether = netdev_priv(netdev);
> +       struct sk_buff *skb = netdev_alloc_skb(netdev,
> +               roundup(MAX_PACKET_SIZE_W_CRC, 4));
> +
> +       if (unlikely(!skb)) {
> +               if (net_ratelimit())
> +                       netdev_warn(netdev, "failed to allocate rx skb\n");

can use net_warn_ratelimited (here and elsewhere)

> +               buffer = ether->rx_scratch_dma;
> +       } else {
> +               /* Do not unmark the following skb_reserve() Receive Buffer
> +                * Starting Address must be aligned to 4 bytes and the following
> +                * line if unmarked will make it align to 2 and this likely will
> +                * hult the RX and crash the linux

halt?

> +                * skb_reserve(skb, NET_IP_ALIGN);
> +                */
> +               skb->dev = netdev;
> +               buffer = dma_map_single(&netdev->dev,
> +                                       skb->data,
> +                                       roundup(MAX_PACKET_SIZE_W_CRC, 4),
> +                                       DMA_FROM_DEVICE);
> +               if (unlikely(dma_mapping_error(&netdev->dev, buffer))) {
> +                       if (net_ratelimit())
> +                               netdev_err(netdev, "failed to map rx page\n");
> +                       dev_kfree_skb_any(skb);
> +                       buffer = ether->rx_scratch_dma;
> +                       skb = NULL;
> +               }
> +       }
> +       ether->rx_skb[i] = skb;
> +       ether->rdesc[i].buffer = buffer;
> +
> +       return skb;
> +}
> +

> +static int npcm7xx_ether_close(struct net_device *netdev)
> +{
> +       struct npcm7xx_ether *ether = netdev_priv(netdev);
> +
> +       npcm7xx_return_default_idle(netdev);
> +
> +       if (ether->phy_dev)
> +               phy_stop(ether->phy_dev);
> +       else if (ether->use_ncsi)
> +               ncsi_stop_dev(ether->ncsidev);
> +
> +       msleep(20);
> +
> +       free_irq(ether->txirq, netdev);
> +       free_irq(ether->rxirq, netdev);
> +
> +       netif_stop_queue(netdev);
> +       napi_disable(&ether->napi);

Cleanup state in reverse of allocation.

> +static int npcm7xx_ether_start_xmit(struct sk_buff *skb, struct net_device *netdev)
> +{
> +       struct npcm7xx_ether *ether = netdev_priv(netdev);
> +       struct npcm7xx_txbd *txbd;
> +       unsigned long flags;
> +
> +       ether->count_xmit++;
> +
> +       /* Insert new buffer */
> +       txbd = (ether->tdesc + ether->cur_tx);
> +       txbd->buffer = dma_map_single(&netdev->dev, skb->data, skb->len,
> +                                     DMA_TO_DEVICE);
> +       ether->tx_skb[ether->cur_tx]  = skb;
> +       if (skb->len > MAX_PACKET_SIZE)
> +               dev_err(&ether->pdev->dev,
> +                       "skb->len (= %d) > MAX_PACKET_SIZE (= %d)\n",
> +                       skb->len, MAX_PACKET_SIZE);

> +       txbd->sl = skb->len > MAX_PACKET_SIZE ? MAX_PACKET_SIZE : skb->len;

Check for errors before mapping to device, and drop packet? Probably
don't want to output truncated packets.

Also rate limit such messages.

> +       dma_wmb();
> +
> +       txbd->mode = TX_OWN_DMA | PADDINGMODE | CRCMODE;
> +
> +       /* make sure that data is in memory before we trigger TX */
> +       wmb();
> +
> +       /* trigger TX */
> +       writel(ENSTART, (ether->reg + REG_TSDR));
> +
> +       if (++ether->cur_tx >= TX_QUEUE_LEN)
> +               ether->cur_tx = 0;
> +
> +       spin_lock_irqsave(&ether->lock, flags);
> +       ether->pending_tx++;
> +
> +       /* sometimes we miss the tx interrupt due to HW issue, so NAPI will not
> +        * clean the pending tx, so we clean it also here
> +        */
> +       npcm7xx_clean_tx(netdev, true);
> +
> +       if (ether->pending_tx >= TX_QUEUE_LEN - 1) {
> +               __le32 reg_mien;
> +               unsigned int index_to_wake = ether->cur_tx +
> +                       ((TX_QUEUE_LEN * 3) / 4);
> +
> +               if (index_to_wake >= TX_QUEUE_LEN)
> +                       index_to_wake -= TX_QUEUE_LEN;
> +
> +               txbd = (ether->tdesc + index_to_wake);
> +               txbd->mode = TX_OWN_DMA | PADDINGMODE | CRCMODE | MACTXINTEN;
> +
> +               /* make sure that data is in memory before we trigger TX */
> +               wmb();
> +
> +               /* Clear TDU interrupt */
> +               writel(MISTA_TDU, (ether->reg + REG_MISTA));
> +
> +               /* due to HW issue somtimes, we miss the TX interrupt we just

somtimes -> sometimes

> +                * set (MACTXINTEN), so we also set TDU for Transmit
> +                * Descriptor Unavailable interrupt
> +                */
> +               reg_mien = readl((ether->reg + REG_MIEN));
> +               if (reg_mien != 0)
> +                       /* Enable TDU interrupt */
> +                       writel(reg_mien | ENTDU, (ether->reg + REG_MIEN));
> +
> +               ether->tx_tdu++;
> +               netif_stop_queue(netdev);
> +       }
> +
> +       spin_unlock_irqrestore(&ether->lock, flags);
> +
> +       return 0;
> +}
> +
> +static irqreturn_t npcm7xx_tx_interrupt(int irq, void *dev_id)
> +{
> +       struct npcm7xx_ether *ether;
> +       struct platform_device *pdev;
> +       struct net_device *netdev;
> +       __le32 status;
> +       unsigned long flags;
> +
> +       netdev = dev_id;
> +       ether = netdev_priv(netdev);
> +       pdev = ether->pdev;
> +
> +       npcm7xx_get_and_clear_int(netdev, &status, 0xFFFF0000);
> +
> +       ether->tx_int_count++;
> +
> +       if (status & MISTA_EXDEF)
> +               dev_err(&pdev->dev, "emc defer exceed interrupt status=0x%08X\n"
> +                       , status);
> +       else if (status & MISTA_TXBERR) {
> +               dev_err(&pdev->dev, "emc bus error interrupt status=0x%08X\n",
> +                       status);
> +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> +               npcm7xx_info_print(netdev);
> +#endif
> +               spin_lock_irqsave(&ether->lock, flags);

irqsave in hard interrupt context?

> +               writel(0, (ether->reg + REG_MIEN)); /* disable any interrupt */
> +               spin_unlock_irqrestore(&ether->lock, flags);
> +               ether->need_reset = 1;
> +       } else if (status & ~(MISTA_TXINTR | MISTA_TXCP | MISTA_TDU))
> +               dev_err(&pdev->dev, "emc other error interrupt status=0x%08X\n",
> +                       status);
> +
> +    /* if we got MISTA_TXCP | MISTA_TDU remove those interrupt and call napi */

The goal of napi is to keep interrupts disabled until napi completes.

> +       if (status & (MISTA_TXCP | MISTA_TDU) &
> +           readl((ether->reg + REG_MIEN))) {
> +               __le32 reg_mien;
> +
> +               spin_lock_irqsave(&ether->lock, flags);
> +               reg_mien = readl((ether->reg + REG_MIEN));
> +               if (reg_mien & ENTDU)
> +                       /* Disable TDU interrupt */
> +                       writel(reg_mien & (~ENTDU), (ether->reg + REG_MIEN));
> +
> +               spin_unlock_irqrestore(&ether->lock, flags);
> +
> +               if (status & MISTA_TXCP)
> +                       ether->tx_cp_i++;
> +               if (status & MISTA_TDU)
> +                       ether->tx_tdu_i++;
> +       } else {
> +               dev_dbg(&pdev->dev, "status=0x%08X\n", status);
> +       }
> +
> +       napi_schedule(&ether->napi);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t npcm7xx_rx_interrupt(int irq, void *dev_id)
> +{
> +       struct net_device *netdev = (struct net_device *)dev_id;
> +       struct npcm7xx_ether *ether = netdev_priv(netdev);
> +       struct platform_device *pdev = ether->pdev;
> +       __le32 status;
> +       unsigned long flags;
> +       unsigned int any_err = 0;
> +       __le32 rxfsm;
> +
> +       npcm7xx_get_and_clear_int(netdev, &status, 0xFFFF);

Same here

> +static int npcm7xx_poll(struct napi_struct *napi, int budget)
> +{
> +       struct npcm7xx_ether *ether =
> +               container_of(napi, struct npcm7xx_ether, napi);
> +       struct npcm7xx_rxbd *rxbd;
> +       struct net_device *netdev = ether->netdev;
> +       struct platform_device *pdev = ether->pdev;
> +       struct sk_buff *s;
> +       unsigned int length;
> +       __le32 status;
> +       unsigned long flags;
> +       int rx_cnt = 0;
> +       int complete = 0;
> +       unsigned int rx_offset = (readl((ether->reg + REG_CRXDSA)) -
> +                                 ether->start_rx_ptr) /
> +                               sizeof(struct npcm7xx_txbd);
> +       unsigned int local_count = (rx_offset >= ether->cur_rx) ?
> +               rx_offset - ether->cur_rx : rx_offset +
> +               RX_QUEUE_LEN - ether->cur_rx;
> +
> +       if (local_count > ether->max_waiting_rx)
> +               ether->max_waiting_rx = local_count;
> +
> +       if (local_count > (4 * RX_POLL_SIZE))
> +               /* we are porbably in a storm of short packets and we don't

porbably - probably

> +                * want to get into RDU since short packets in RDU cause
> +                * many RXOV which may cause EMC halt, so we filter out all
> +                * coming packets
> +                */
> +               writel(0, (ether->reg + REG_CAMCMR));
> +
> +       if (local_count <= budget)
> +               /* we can restore accepting of packets */
> +               writel(ether->camcmr, (ether->reg + REG_CAMCMR));
> +
> +       spin_lock_irqsave(&ether->lock, flags);
> +       npcm7xx_clean_tx(netdev, false);
> +       spin_unlock_irqrestore(&ether->lock, flags);
> +
> +       rxbd = (ether->rdesc + ether->cur_rx);
> +
> +       while (rx_cnt < budget) {
> +               status = rxbd->sl;
> +               if ((status & RX_OWN_DMA) == RX_OWN_DMA) {
> +                       complete = 1;
> +                       break;
> +               }
> +               /* for debug puposes we save the previous value */

puposes -> purposes

> +               rxbd->reserved = status;
> +               s = ether->rx_skb[ether->cur_rx];
> +               length = status & 0xFFFF;
> +
> +               /* If VLAN is not supporte RXDS_PTLE (packet too long) is also

supporte -> supported (stopping pointing out typos after this).

> +static const struct net_device_ops npcm7xx_ether_netdev_ops = {
> +       .ndo_open               = npcm7xx_ether_open,
> +       .ndo_stop               = npcm7xx_ether_close,
> +       .ndo_start_xmit         = npcm7xx_ether_start_xmit,
> +       .ndo_get_stats          = npcm7xx_ether_stats,
> +       .ndo_set_rx_mode        = npcm7xx_ether_set_rx_mode,
> +       .ndo_set_mac_address    = npcm7xx_set_mac_address,
> +       .ndo_do_ioctl           = npcm7xx_ether_ioctl,
> +       .ndo_validate_addr      = eth_validate_addr,
> +       .ndo_change_mtu         = eth_change_mtu,

This is marked as deprecated. Also in light of the hardcoded
MAX_PACKET_SIZE, probably want to set dev->max_mtu.

> +static int npcm7xx_ether_probe(struct platform_device *pdev)
> +{
> +       struct npcm7xx_ether *ether;
> +       struct net_device *netdev;
> +       int error;
> +
> +       struct clk *emc_clk = NULL;
> +       struct device_node *np = pdev->dev.of_node;
> +
> +       pdev->id = of_alias_get_id(np, "ethernet");
> +       if (pdev->id < 0)
> +               pdev->id = 0;
> +
> +       emc_clk = devm_clk_get(&pdev->dev, NULL);
> +
> +       if (IS_ERR(emc_clk))
> +               return PTR_ERR(emc_clk);
> +
> +       /* Enable Clock */
> +       clk_prepare_enable(emc_clk);
> +
> +       error = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +       if (error)
> +               return -ENODEV;
> +
> +       netdev = alloc_etherdev(sizeof(struct npcm7xx_ether));
> +       if (!netdev)
> +               return -ENOMEM;
> +
> +       ether = netdev_priv(netdev);
> +
> +       ether->reset = devm_reset_control_get(&pdev->dev, NULL);
> +       if (IS_ERR(ether->reset))
> +               return PTR_ERR(ether->reset);

Memory leak on error path

Also missing netif_napi_del in npcm7xx_ether_remove?
