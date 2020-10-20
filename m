Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC9294383
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 21:51:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG44Q4tllzDqgk
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 06:51:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=82.165.159.6; helo=mout-xforward.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout-xforward.kundenserver.de (mout-xforward.kundenserver.de
 [82.165.159.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG4305MjTzDqb1;
 Wed, 21 Oct 2020 06:49:41 +1100 (AEDT)
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MEUaQ-1kfLdi2hdi-00Fxof; Tue, 20 Oct 2020 21:49:36 +0200
Received: by mail-qt1-f172.google.com with SMTP id z33so2218067qth.8;
 Tue, 20 Oct 2020 12:49:35 -0700 (PDT)
X-Gm-Message-State: AOAM531x4AGRMBw8NNpYX5/GUM9gAgleuHsJLvCnMsCbl2iLZUpKxexH
 j2yBbCZZEK4En4xSaypMNc9cgMWDy5T1fgYhq6M=
X-Google-Smtp-Source: ABdhPJxahAeCCZ+8cSFCHPbztp1fC8i2fCEFCD3p12STG/2pilYb1GliyL1BTDC01y5E8TslQzleq/H6WGoO9R09SbE=
X-Received: by 2002:ac8:1ba6:: with SMTP id z35mr3921572qtj.204.1603223374472; 
 Tue, 20 Oct 2020 12:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
 <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
 <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <PS1PR0601MB1849166CBF6D1678E6E1210C9C1F0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
In-Reply-To: <PS1PR0601MB1849166CBF6D1678E6E1210C9C1F0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Oct 2020 21:49:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2pEfbLDWTppVHmGxXduOWPCwBw-8bMY9h3EbEecsVfTA@mail.gmail.com>
Message-ID: <CAK8P3a2pEfbLDWTppVHmGxXduOWPCwBw-8bMY9h3EbEecsVfTA@mail.gmail.com>
Subject: Re: [PATCH] net: ftgmac100: Fix missing TX-poll issue
To: Dylan Hung <dylan_hung@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Wuue8FptZxHkS6Ev8m9gZkZWRu7n7UIMCJ+tj2ddX1FXRYEC1sj
 JtXmwTeGskZLgImiZ6Hxq/aEfSa+VojOigMZce3hi0UARopv26NVJYOvttecQrshPq+TymH
 +YZR0HNNMP3pEc1mMaOtPdBF05RLhl3mAqjG/yeMqC7mpvw9usYKrFWIbiUBS9KuC5b7V63
 uewOKP3mksunayOCIkahw==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:VnVq/uvd9NI=:Yd7Ykv8WoaeowXVl7zCXvHME
 Mmr3sbFa/roN/TmKYegsPRTKY32bFJRwTD2wA8nEDWXAchstCEdafotIFqMcv0cSjxkzc0tb+
 nKdIeJSkVR2EaAay0uHXrvNeFyCTvn/EoHRxYPOvq+PyOgZkSFenI5udz8elxQk8py5nC6CQa
 eFbPWqmGuVIiLABV3NtZd6jfJ+DdtUSemj5LLZBgoRLsYQ8jzgKOV/qnhPEiAdd9UPTJ9rCDC
 31+kZhgJXDCs1NZEx9pJd8UtQu4av27TnIKIS9FrjsvvZj+E9ty4/LhRGSDeIn+GF55tw5BBJ
 3o/+w99Gzu3cJYfs9Qf7KkT7SFIZ8NVwiSCu/hsvvXPIYiTcp0mx38MO0puu/m0alIy4hqFq6
 JXCaHzskndWTo2V57w+eCghvSF2OJRk8u0aTXGC6uL3rYUqif1jO0UHTffzuNoeSYvIAHFVrg
 qlf32Rj2A7/O9PFgOIFCVQudSddR3cWme2t4mSDs6ZAClyyTjFly35Kheu5dNl7VdJLT1cww=
 =
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
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 20, 2020 at 11:37 AM Dylan Hung <dylan_hung@aspeedtech.com> wrote:
> > +1 @first is system memory from dma_alloc_coherent(), right?
> >
> > You shouldn't have to do this. Is coherent DMA memory broken on your
> > platform?
>
> It is about the arbitration on the DRAM controller.  There are two queues in the dram controller, one is for the CPU access and the other is for the HW engines.
> When CPU issues a store command, the dram controller just acknowledges cpu's request and pushes the request into the queue.  Then CPU triggers the HW MAC engine, the HW engine starts to fetch the DMA memory.
> But since the cpu's request may still stay in the queue, the HW engine may fetch the wrong data.

There is still something missing in the explanation: The iowrite32()
only tells the
device that it should check the queue, but not where the data is. I would expect
the device to either see the correct data that was marked valid by the
'dma_wmb();first->txdes0 = cpu_to_le32(f_ctl_stat);' operation, or it would see
the old f_ctl_stat value telling it that the data is not yet valid and
not look at
the rest of the descriptor. In the second case you would see the data
not getting sent out until the next start_xmit(), but the device should not
fetch wrong data.

There are two possible scenarios in which your patch would still help:

a) the dma_wmb() does not serialize the stores as seen by DMA the
    way it is supposed to, so the device can observe the new value of txdec0
    before it observes the correct data.

b) The txdes0 field sometimes contains stale data that marks the
    descriptor as valid before the correct data is written. This field
    should have been set in ftgmac100_tx_complete_packet() earlier

If either of the two is the case, then the READ_ONCE() would just
introduce a long delay before the iowrite32() that makes it more likely
that the data is there, but the inconsistent state would still be observable
by the device if it is still working on previous frames.

        Arnd
