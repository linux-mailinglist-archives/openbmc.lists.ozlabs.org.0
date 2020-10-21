Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3179E2958CB
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 09:07:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGz272kZbzDqfk
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 18:07:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cuU/fpuI; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGTrK6cwxzDqTR;
 Wed, 21 Oct 2020 23:12:01 +1100 (AEDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 099232237B;
 Wed, 21 Oct 2020 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603282319;
 bh=QsMYkMa6PBVVYYZ7BTm9Ize/SeOd8e2vqy0LlM9MFOQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cuU/fpuIroFdhhVAc7BKKuZeFmsO9VcqwQRKV60RYWHQaz0Sf4sr1L4MIXaZDnmZR
 L+WBd++xvTvAtSFrmgPo3CLWxUrrufM1n03l+pI9Bnt9TH7IcjlNlYIQnUNSLg7S5n
 kCCIwzQ0RAo6dFEx/7rYS1Vegyn7712A7XZvqkmI=
Received: by mail-qk1-f169.google.com with SMTP id h140so2048155qke.7;
 Wed, 21 Oct 2020 05:11:58 -0700 (PDT)
X-Gm-Message-State: AOAM531dic0stjfU/UU1qjszuah/Na0Mgd4HvpHaDWzrhIln11mZEowQ
 7rC2r86D9GPrxNTSPQyNoDEcLY78GKdWTIIWpAA=
X-Google-Smtp-Source: ABdhPJzuJ99P/Tgb6oBO1lZhiTXqGsC7ijBifM7xSa9Zqm87Br7mScbgBLmXTiOZUtDsedSZPfFOS3X0xvSz2ceCStI=
X-Received: by 2002:a05:620a:215d:: with SMTP id
 m29mr2890521qkm.138.1603282317961; 
 Wed, 21 Oct 2020 05:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
 <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
 <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <PS1PR0601MB1849166CBF6D1678E6E1210C9C1F0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
 <CAK8P3a2pEfbLDWTppVHmGxXduOWPCwBw-8bMY9h3EbEecsVfTA@mail.gmail.com>
 <32bfb619bbb3cd6f52f9e5da205673702fed228f.camel@kernel.crashing.org>
 <CAK8P3a2j7fV5EFmC8UvSyvXixU8=Nmp6hrJco-fdP2Z+w8bLnA@mail.gmail.com>
In-Reply-To: <CAK8P3a2j7fV5EFmC8UvSyvXixU8=Nmp6hrJco-fdP2Z+w8bLnA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 21 Oct 2020 14:11:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0qzyb0z-OH-hGNJ8iQoLckVkkz4DQfYpFFd=UuXP3gwA@mail.gmail.com>
Message-ID: <CAK8P3a0qzyb0z-OH-hGNJ8iQoLckVkkz4DQfYpFFd=UuXP3gwA@mail.gmail.com>
Subject: Re: [PATCH] net: ftgmac100: Fix missing TX-poll issue
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 22 Oct 2020 17:36:08 +1100
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Po-Yu Chuang <ratbert@faraday-tech.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Dylan Hung <dylan_hung@aspeedtech.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

(replying to my own mail from a different address to deal with the
regular one being blacklisted somewhere, sorry for any duplicates)

On Wed, Oct 21, 2020 at 9:16 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Oct 21, 2020 at 12:10 AM Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > On Tue, 2020-10-20 at 21:49 +0200, Arnd Bergmann wrote:
> > > On Tue, Oct 20, 2020 at 11:37 AM Dylan Hung <dylan_hung@aspeedtech.com> wrote:
> > > > > +1 @first is system memory from dma_alloc_coherent(), right?
> > > > >
> > > > > You shouldn't have to do this. Is coherent DMA memory broken on your
> > > > > platform?
> > > >
> > > > It is about the arbitration on the DRAM controller.  There are two queues in the dram controller, one is for the CPU access and the other is for the HW engines.
> > > > When CPU issues a store command, the dram controller just acknowledges cpu's request and pushes the request into the queue.  Then CPU triggers the HW MAC engine, the HW engine starts to fetch the DMA memory.
> > > > But since the cpu's request may still stay in the queue, the HW engine may fetch the wrong data.
> >
> > Actually, I take back what I said earlier, the above seems to imply
> > this is more generic.
> >
> > Dylan, please confirm, does this affect *all* DMA capable devices ? If
> > yes, then it's a really really bad design bug in your chips
> > unfortunately and the proper fix is indeed to make dma_wmb() do a dummy
> > read of some sort (what address though ? would any dummy non-cachable
> > page do ?) to force the data out as *all* drivers will potentially be
> > affected.
> >
> > I was under the impression that it was a specific timing issue in the
> > vhub and ethernet parts, but if it's more generic then it needs to be
> > fixed globally.
>
> We have CONFIG_ARM_HEAVY_MB for SoCs with similar problems,
> it turns mb() and wmb() into a platform specific function call, though it
> doesn't do that for dma_wmb() and smp_wmb(), which should not
> be affected if the problem is only missing serialization between DMA
> and CPU writes.
>
> > > If either of the two is the case, then the READ_ONCE() would just
> > > introduce a long delay before the iowrite32() that makes it more likely
> > > that the data is there, but the inconsistent state would still be observable
> > > by the device if it is still working on previous frames.
> >
> > I think it just get stuck until we try another packet, ie, it doesn't
> > see the new descriptor valid bit. But Dylan can elaborate.
>
> Ok, that would point to an insufficient barrier in iowrite32() as well,
> not in dma_wmb().
>
> At the moment, the only chips that need the heavy barrier are
> omap4 and mstar_v7, and early l2 cache controllers (not the one
> on Cortex-A7) have another synchronization callback that IIRC
> is used for streaming mappings.
>
> These are the two implementations of soc_mb() we have:
>
> /*
>  * This may need locking to deal with situations where an interrupt
>  * happens while we are in here and mb() gets called by the interrupt handler.
>  *
>  * The vendor code did have a spin lock but it doesn't seem to be needed and
>  * removing it hasn't caused any side effects so far.
> *
>  * [writel|readl]_relaxed have to be used here because otherwise
>  * we'd end up right back in here.
>  */
> static void mstarv7_mb(void)
> {
>        /* toggle the flush miu pipe fire bit */
>        writel_relaxed(0, l3bridge + MSTARV7_L3BRIDGE_FLUSH);
>        writel_relaxed(MSTARV7_L3BRIDGE_FLUSH_TRIGGER, l3bridge
>                        + MSTARV7_L3BRIDGE_FLUSH);
>        while (!(readl_relaxed(l3bridge + MSTARV7_L3BRIDGE_STATUS)
>                        & MSTARV7_L3BRIDGE_STATUS_DONE)) {
>                /* wait for flush to complete */
>        }
> }
> /*
>  * OMAP4 interconnect barrier which is called for each mb() and wmb().
>  * This is to ensure that normal paths to DRAM (normal memory, cacheable
>  * accesses) are properly synchronised with writes to DMA coherent memory
>  * (normal memory, uncacheable) and device writes.
>  *
>  * The mb() and wmb() barriers only operate only on the MPU->MA->EMIF
>  * path, as we need to ensure that data is visible to other system
>  * masters prior to writes to those system masters being seen.
>  *
>  * Note: the SRAM path is not synchronised via mb() and wmb().
>  */
> static void omap4_mb(void)
> {
>        if (dram_sync)
>                writel_relaxed(0, dram_sync);
> }
>
> Obviously, adding one of these for ast2600 would slow down every
> mb() and writel() a lot, but if it is a chip-wide problem rather than
> one isolated to the network device, it would be the correct solution,
> provided that a correct code sequence can be found.
>
>       Arnd
