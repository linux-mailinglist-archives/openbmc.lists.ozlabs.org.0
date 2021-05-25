Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3E438FE28
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 11:49:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq8Rv2d4Zz301m
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 19:49:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq8Rf5w4tz2yYT;
 Tue, 25 May 2021 19:48:59 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14P9ZLSX049551;
 Tue, 25 May 2021 17:35:21 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May
 2021 17:48:19 +0800
Date: Tue, 25 May 2021 17:48:16 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v5 0/4] mmc: sdhci-of-aspeed: Support toggling SD bus
 signal
Message-ID: <20210525094815.GA8757@aspeedtech.com>
References: <20210524073308.9328-1-steven_lee@aspeedtech.com>
 <CACPK8XcfvUQD5xwb=2Va5Sr+bmaWfJMZkh61HK1=J1qLYc84zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACPK8XcfvUQD5xwb=2Va5Sr+bmaWfJMZkh61HK1=J1qLYc84zQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14P9ZLSX049551
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 05/25/2021 15:55, Joel Stanley wrote:
> On Mon, 24 May 2021 at 07:33, Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > AST2600-A2 EVB has the reference design for enabling SD bus
> > power and toggling SD bus signal voltage between 3.3v and 1.8v by
> > GPIO regulators.
> > This patch series adds sdhci node and gpio regulators in a new dts file
> > for AST2600-A2 EVB.
> > The description of the reference design of AST2600-A2 EVB is added
> > in the new dts file.
> >
> > This patch also include a helper for updating AST2600 sdhci capability
> > registers.
> 
> The device trees look good:
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> I've applied patches 1-3 to the aspeed tree for v5.14. I made a little
> fix to patch 3 as it needed to add the new device tree to the
> makefile.
> 

Thanks!

> When I was testing on my A2 EVB I saw this:
> 
> [    1.436219] sdhci-aspeed 1e750100.sdhci: Requested out of range
> phase tap 192 for 9 degrees of phase compensation at 1562500Hz,
> clamping to tap 15
> [    1.450913] sdhci-aspeed 1e750100.sdhci: Requested out of range
> phase tap 963 for 45 degrees of phase compensation at 1562500Hz,
> clamping to tap 15
> 
> Do you know what is happening there?
> 

Per MMC spec, eMMC bus speed is set as legacy mode(0~26MHz) at startup of
eMMC initializtion flow. Clock phase calculation is triggered in set_clock()
and it calculates taps based on phase_deg(<9>, <225>) in the dts file and the
current speed(1562500Hz), which causes the warning message you mentioned.
As the phase_deg in the dts file should be calculated with 100MHz.

https://lkml.org/lkml/2021/5/24/95

But after some initialization flow, eMMC bus speed will be set to
correct speed(100MHz).
Clock phase calculation will be triggered again to get correct taps.

> Cheers,
> 
> Joel
