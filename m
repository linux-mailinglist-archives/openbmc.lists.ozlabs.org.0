Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E094B3EF31D
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 22:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gq2L35B0Gz3cK0
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 06:14:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gq2Kk2ccWz2xb8
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 06:13:45 +1000 (AEST)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id EC685C4880
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 20:06:14 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B09C4FF806;
 Tue, 17 Aug 2021 20:05:45 +0000 (UTC)
Date: Tue, 17 Aug 2021 22:05:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Milton Miller II <miltonm@us.ibm.com>
Subject: Re: [PATCH 0/2] rtc: pch-rtc: add Intel Series PCH built-in
 read-only RTC
Message-ID: <YRwWmeQiVC3dGAjH@piout.net>
References: <YRhQJ4kdyu1Xs1Rb@piout.net>
 <20210810154436.125678-1-i.mikhaylov@yadro.com>
 <20210814224215.GX15173@home.paul.comp>
 <OFBF96A764.75CCED3A-ON00258734.0062B30C-00258734.00634222@ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OFBF96A764.75CCED3A-ON00258734.0062B30C-00258734.00634222@ibm.com>
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
Cc: Paul Fertser <fercerpav@gmail.com>, Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Alessandro Zummo <a.zummo@towertech.it>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 17/08/2021 18:04:09+0000, Milton Miller II wrote:
> 
> On Aug 16, 2021, Alexandre Belloni wrote:
> >On 15/08/2021 01:42:15+0300, Paul Fertser wrote:
> >> On Tue, Aug 10, 2021 at 06:44:34PM +0300, Ivan Mikhaylov wrote:
> >> > Add RTC driver with dt binding tree document. Also this driver
> >adds one sysfs
> >> > attribute for host power control which I think is odd for RTC
> >driver.
> >> > Need I cut it off and use I2C_SLAVE_FORCE? I2C_SLAVE_FORCE is not
> >good
> >> > way too from my point of view. Is there any better approach?
> >> 
> >> Reading the C620 datasheet I see this interface also allows other
> >> commands (wake up, watchdog feeding, reboot etc.) and reading
> >statuses
> >> (e.g Intruder Detect, POWER_OK_BAD).
> >> 
> >> I think if there's any plan to use anything other but RTC via this
> >> interface then the driver should be registered as an MFD.
> >> 
> >
> >This is not the current thinking, if everything is integrated, then
> >there is no issue registering a watchdog from the RTC driver. I'll
> >let
> >you check with Lee...
> 
> I think the current statement is "if they are truly disjoint 
> hardware controls" then an MFD might suffice, but if they require 
> software cordination the new auxillary bus seems to be desired.
> 

Honestly, the auxiliary bus doesn't provide anything that you can't do
by registering a device in multiple subsystem from a single driver.
(Lee Jones, Mark Brown and I did complain at the time that this was yet
another back channel for misuses).

> >>However, I'm not sure what is the correct interface for
> >poweroff/reboot
> >control.
> 
> While there is a gpio interface to a simple regulator switch,
> the project to date has been asserting direct or indirect 
> gpios etc to control the host.   If these are events to 
> trigger a change in state and not a direct state change
> that some controller trys to follow, maybe a message delivery 
> model?   (this is not to reboot or cycle the bmc).
> 
> milton

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
