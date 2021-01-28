Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABCD306E8E
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 08:17:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRBc93XbQzDrg1
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 18:16:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRBb71x9SzDr84
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 18:15:59 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10S79moP098999;
 Thu, 28 Jan 2021 15:09:48 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 28 Jan
 2021 15:15:40 +0800
Date: Thu, 28 Jan 2021 07:15:36 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Benjamin Fair <benjaminfair@google.com>
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
Message-ID: <20210128071536.GA2594588@aspeedtech.com>
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <CAO=notwtzF96o9oJe=5px4KFWFdzWQxHMMbFdA2JmwEFBLC8bA@mail.gmail.com>
 <CADKL2t4xDhpYmA==E6TczfNbvVReQJM0p84rwpy5vLrDXqsNBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CADKL2t4xDhpYmA==E6TczfNbvVReQJM0p84rwpy5vLrDXqsNBg@mail.gmail.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10S79moP098999
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
Cc: Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

The 01/28/2021 01:48, Benjamin Fair wrote:
> On Wed, 27 Jan 2021 at 08:04, Patrick Venture <venture@google.com> wrote:
> >
> > On Wed, Jan 27, 2021 at 1:44 AM Troy Lee <troy_lee@aspeedtech.com> wrote:
> > >
> > > Hi team,
> > >
> > > For security consideration, user might want to disable AST2500/AST2600 P2A functionality by default. To compensate the effect to phosphor-ipmi-flash, we're planning to support two alternative in-band firmware upgrade over PCIe for AST2500/AST2600 (AST2520 and AST2620 are excluded):
> > >  - Through a reserved **VGA** memory on BAR[0], or
> > >  - Through a reserved **PCIe** shared memory on BAR[1]
> > >
> > > The usage pretty much the same as P2A, but it runs on different BAR, offset and length.
> > > This will involves modifying phosphor-ipmi-flash/[tools|bmc]. Should I create new **interfaces**, e.g. astpcie/astvga?
> >
> > I'm not sure it makes sense to create new interfaces, but rather to
> > add optional parameters for those differences... but I've added some
> > people to the reply line to help answer.
> 
> I'd also prefer optional parameters so we can keep all these PCIe
> configurations grouped together.
> 
Understood. I'll see if I can design it as parameters, either on
compiler time or runtime. Thers is a little different in BMC side, the
ioctl might be different.

> >
> > >
> > > Thanks,
> > > Troy Lee
> > >
> > >

Thanks for suggestion,
Troy Lee
