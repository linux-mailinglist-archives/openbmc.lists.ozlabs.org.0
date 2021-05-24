Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9438DF83
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 05:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpMTX31g2z2ymX
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 13:02:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpMTJ0837z2yXP;
 Mon, 24 May 2021 13:02:41 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14O2nGqc079838;
 Mon, 24 May 2021 10:49:16 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 11:02:09 +0800
Date: Mon, 24 May 2021 11:02:07 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v4 1/3] ARM: dts: aspeed: ast2600evb: Add sdhci node and
 gpio regulator for A2 evb.
Message-ID: <20210524030206.GA22722@aspeedtech.com>
References: <20210520101346.16772-1-steven_lee@aspeedtech.com>
 <20210520101346.16772-2-steven_lee@aspeedtech.com>
 <CACPK8XcSYgQKRp7C5gZ9LKekL0LCHYPDwjC49EDTEr5__T2M3Q@mail.gmail.com>
 <20210524023526.GA2727@aspeedtech.com>
 <CACPK8XewH8b5FB+6bQ9EWy--Y6x79-95MCqNmFovJhO4hS0e=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACPK8XewH8b5FB+6bQ9EWy--Y6x79-95MCqNmFovJhO4hS0e=A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14O2nGqc079838
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, "moderated list:ASPEED SD/MMC
 DRIVER" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 05/24/2021 10:46, Joel Stanley wrote:
> On Mon, 24 May 2021 at 02:35, Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > The 05/21/2021 09:25, Joel Stanley wrote:
> > > Hi Steven,
> > >
> > > On Thu, 20 May 2021 at 10:16, Steven Lee <steven_lee@aspeedtech.com> wrote:
> > > >
> > > > AST2600 A2(or newer) EVB has gpio regulators for toggling signal voltage
> > > > between 3.3v and 1.8v, the patch adds sdhci node and gpio regulator in the
> > > > new dts file and adds commment for describing the reference design.
> > >
> > > spelling: comment
> > >
> >
> > Thanks, will correct the typo.
> >
> > > I need you to justify the separate dts for the A2 EVB.
> > >
> > > What would happen if this device tree was loaded on to an A1 or A0?
> > >
> >
> > Since the clock default value(SCU210) of A1 and A0 are different to A2,
> > the following error would happen if A2 device tree was loaded on A1/A0.
> >
> > ```
> > [  133.179825] mmc1: Reset 0x4 never completed.
> > [  133.184599] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
> > [  133.191786] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00000002
> > [  133.198972] mmc1: sdhci: Blk size:  0x00007008 | Blk cnt:  0x00000001
> > [  133.206158] mmc1: sdhci: Argument:  0x00000c00 | Trn mode: 0x00000013
> > [  133.213343] mmc1: sdhci: Present:   0x01f70001 | Host ctl: 0x00000011
> > [  133.220528] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
> > [  133.227713] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00008007
> > [  133.234898] mmc1: sdhci: Timeout:   0x0000000b | Int stat: 0x00000000
> > [  133.242083] mmc1: sdhci: Int enab:  0x00ff0083 | Sig enab: 0x00ff0083
> > [  133.249268] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> > [  133.256453] mmc1: sdhci: Caps:      0x07f80080 | Caps_1:   0x00000007
> > [  133.263638] mmc1: sdhci: Cmd:       0x0000341a | Max curr: 0x001f0f08
> > [  133.270824] mmc1: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x01dd7f7f
> > [  133.278009] mmc1: sdhci: Resp[2]:   0x325b5900 | Resp[3]:  0x00400e00
> > [  133.285193] mmc1: sdhci: Host ctl2: 0x00000000
> > [  133.290148] mmc1: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0xbe041200
> > [  133.297332] mmc1: sdhci: ============================================
> >
> > ```
> >
> > Besides, A1/A0 EVBs don't have regulator, vmmc and vqmmc should be
> > removed from sdhci node of A1/A0 dts.
> >
> > > Would this device tree be used for the A3 (and any future revision?)
> > >
> >
> > Yes, A3 can use the A2 dts.
> >
> > > An alternative proposal: we modify the ast2600-evb.dts to support the
> > > A2 (which I assume would also support the A3).
> > >
> > > If we need a separate board file for the A0 and A1 EVB, we add a new
> > > one that supports these earlier revisions. Or we decide to only
> > > support the latest revision in mainline.
> > >
> >
> > In this patch, I add a new dts to support A2 sdhci, and include the
> > original dts since the other settings can be loaded on A2.
> > Do you mean creating a new file(e.g. aspeed-ast2600-evb-a1.dts) for A1,
> > and modifying the original aspeed-ast2600-evb.dts for supporting A2?
> 
> Yes, that would be my suggestion. The aspeed-ast2600-evb-a1.dts could
> include the aspeed-ast2600-evb.dts.
> 

Thanks for the prompt reply, I will add aspeed-ast2600-evb-a1.dts for
A1 and A0.

> > If we decide to only support the latest version in mainline, users
> > should mark vmmc and vqmmc as comment and modify clk-phase manually
> > for supporting A1.
> 
> If you believe there will be users of the A1 for some time, then I
> think it makes sense to support both A1 and future boards in mainline.
> 
> Cheers,
> 
> Joel
