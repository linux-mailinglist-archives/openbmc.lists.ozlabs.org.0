Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB1306F65
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 08:31:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRBwJ55BczDrgf
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 18:30:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRBvN73xHzDrT2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 18:30:07 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10S7NxD7000111;
 Thu, 28 Jan 2021 15:23:59 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 28 Jan
 2021 15:29:52 +0800
Date: Thu, 28 Jan 2021 07:29:47 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
Message-ID: <20210128072947.GB2594588@aspeedtech.com>
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <6ea6d5b9-0e31-4a87-8990-b5ce53e2416d@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6ea6d5b9-0e31-4a87-8990-b5ce53e2416d@www.fastmail.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10S7NxD7000111
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

The 01/28/2021 07:14, Andrew Jeffery wrote:
> 
> 
> On Wed, 27 Jan 2021, at 20:13, Troy Lee wrote:
> > Hi team,
> > 
> > For security consideration, user might want to disable AST2500/AST2600 
> > P2A functionality by default. To compensate the effect to 
> > phosphor-ipmi-flash, we're planning to support two alternative in-band 
> > firmware upgrade over PCIe for AST2500/AST2600 (AST2520 and AST2620 are 
> > excluded):
> >  - Through a reserved **VGA** memory on BAR[0], or
> >  - Through a reserved **PCIe** shared memory on BAR[1]
> > 
> > The usage pretty much the same as P2A, but it runs on different BAR, 
> > offset and length.
> > This will involves modifying phosphor-ipmi-flash/[tools|bmc]. Should I 
> > create new **interfaces**, e.g. astpcie/astvga?
> > 
> 
> This is the HOST2BMC functionality in the 2600 datasheet?
> 
> It would be great to have more detail on how it works.
> 
> Andrew

No, it doesn't use HOST2BMC interface, it uses VGA controller's mmio.
Perhaps HOST2BMC is also a possible solution, too.

02:00.0 0300: 1a03:2000 (rev 51) (prog-if 00 [VGA controller])
        Subsystem: 1a03:2000
        Flags: bus master, medium devsel, latency 0, IRQ 16
        Memory at f6000000 (32-bit, non-prefetchable) [size=16M]  <--- Option 1
        Memory at f7040000 (32-bit, non-prefetchable) [size=128K] <--- Option 2
        I/O ports at e000 [size=128]
        Expansion ROM at 000c0000 [disabled] [size=128K]
        Capabilities: [40] Power Management version 3
        Capabilities: [50] MSI: Enable- Count=1/4 Maskable- 64bit+
        Kernel driver in use: ast
        Kernel modules: ast

Option 1 allocates a 1MB memory from the end of VGA memory, so it will
need some change to VBIOS.

Option 2 allocates a 4K memory from BMC memory space. Since the buffer
is smaller, the ipmi-blob protocol overhead will be greater.


Thanks,
Troy Lee
