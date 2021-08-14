Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E46B63EE0F6
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 02:33:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpX8945Nbz30N8
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 10:33:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1431 seconds by postgrey-1.36 at boromir;
 Sun, 15 Aug 2021 09:46:41 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GnHBn6Cdwz308G
 for <openbmc@lists.ozlabs.org>; Sun, 15 Aug 2021 09:46:39 +1000 (AEST)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 7A197C31F3
 for <openbmc@lists.ozlabs.org>; Sat, 14 Aug 2021 23:22:45 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E15C8E0005;
 Sat, 14 Aug 2021 23:22:15 +0000 (UTC)
Date: Sun, 15 Aug 2021 01:22:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: [PATCH 0/2] rtc: pch-rtc: add Intel Series PCH built-in
 read-only RTC
Message-ID: <YRhQJ4kdyu1Xs1Rb@piout.net>
References: <20210810154436.125678-1-i.mikhaylov@yadro.com>
 <20210814224215.GX15173@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210814224215.GX15173@home.paul.comp>
X-Mailman-Approved-At: Tue, 17 Aug 2021 10:32:43 +1000
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 Alessandro Zummo <a.zummo@towertech.it>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 15/08/2021 01:42:15+0300, Paul Fertser wrote:
> On Tue, Aug 10, 2021 at 06:44:34PM +0300, Ivan Mikhaylov wrote:
> > Add RTC driver with dt binding tree document. Also this driver adds one sysfs
> > attribute for host power control which I think is odd for RTC driver.
> > Need I cut it off and use I2C_SLAVE_FORCE? I2C_SLAVE_FORCE is not good
> > way too from my point of view. Is there any better approach?
> 
> Reading the C620 datasheet I see this interface also allows other
> commands (wake up, watchdog feeding, reboot etc.) and reading statuses
> (e.g Intruder Detect, POWER_OK_BAD).
> 
> I think if there's any plan to use anything other but RTC via this
> interface then the driver should be registered as an MFD.
> 

This is not the current thinking, if everything is integrated, then
there is no issue registering a watchdog from the RTC driver. I'll let
you check with Lee...

However, I'm not sure what is the correct interface for poweroff/reboot
control.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
