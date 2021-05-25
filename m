Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F738F7E2
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 04:05:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpy8S1Dfbz2yxv
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 12:05:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jamin_lin@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpy8171PRz2y0C;
 Tue, 25 May 2021 12:04:48 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14P1pJMg007540;
 Tue, 25 May 2021 09:51:19 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May
 2021 10:04:16 +0800
Date: Tue, 25 May 2021 10:04:13 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
Message-ID: <20210525020412.GA2489@aspeedtech.com>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com>
 <CACPK8XdNXiGMQZOtsfMMK+w_PSvO20XT8B9MG+rGhdjYoV4ZuQ@mail.gmail.com>
 <20210520033140.GA3656@aspeedtech.com>
 <20210521020033.GB19153@taoren-ubuntu-R90MNF91>
 <20210524015310.GA2591@aspeedtech.com>
 <CACPK8Xd5HTNAR8MpQPWGp+-t9ixz2r3JYDjr6jUS+9ExyB94zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACPK8Xd5HTNAR8MpQPWGp+-t9ixz2r3JYDjr6jUS+9ExyB94zg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14P1pJMg007540
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
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Steven Lee <steven_lee@aspeedtech.com>, "moderated
 list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 open list <linux-kernel@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Rayn Chen <rayn_chen@aspeedtech.com>, "open
 list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Tao Ren <rentao.bupt@gmail.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 05/24/2021 02:34, Joel Stanley wrote:
> On Mon, 24 May 2021 at 01:53, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> >
> > The 05/21/2021 02:00, Tao Ren wrote:
> > > Hi Jamin,
> > >
> > > On Thu, May 20, 2021 at 11:31:41AM +0800, Jamin Lin wrote:
> > > > The 05/19/2021 22:59, Joel Stanley wrote:
> > > > > On Wed, 19 May 2021 at 08:05, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> > > > > >
> > > > > > The register definition between AST2600 A2 and A3 is different.
> > > > > > This patch avoid new registers definition of AST2600 to use
> > > > > > this driver. We will submit the path for the new registers
> > > > > > definition of AST2600.
> > > > >
> > > > > The AST2600 v9 datasheet says that bit 2 selects between old and new
> > > > > register sets, and that the old register set is the default.
> > > > >
> > > > > Has the default changed for the A3?, and the datasheet is incorrect?
> > > > >
> > > > > Does the A3 still support the old register set?
> > > > >
> > > > We suggest user to use the new i2c driver for AST2600 and we will sumbit
> > > > it. This driver is used to AST2500 and AST2400 SOCs. Change this
> > > > driver to check global register of i2c to avoid user build the wrong driver.
> > >
> > > If I understand correctly, the answer implies old register set is still
> > > supported in A3 although aspeed suggest people using the new driver/mode?
> > >
> > > Can you please share more context behind the suggestion? Such as new
> > > register mode has better performance? Or some known issues that were
> > > deteted in old mode are fixed in new register mode?
> > >
> > Yes, AST2600 A1, A2 and A3 support both old and new register set. The difference
> > between old and new register set are the register address and supported registers.
> > User can choose to use both old and new register set. However, ASPEED would like to
> > change new register set by default for AST2600.
> 
> We can certainly make the driver for the new register set the default
> for AST2600 when the new driver is merged.
> 
> I disagree that we should introduce a run time check to fail to probe
> the old driver. Please do not merge this patch.
> 
> Please focus your effort on getting the new driver merged instead.
> 
> Cheers,
> 
> Joel

Thanks for your suggestion. I will submit the new i2c driver for AST2600
soon.
Jamin
