Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF69F3FB4C6
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 13:47:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GypSm0hS2z2yLV
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 21:46:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=nbsb7TYM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=nbsb7TYM; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GypSH5XKzz2yJ5
 for <openbmc@lists.ozlabs.org>; Mon, 30 Aug 2021 21:46:23 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C2C034CF30;
 Mon, 30 Aug 2021 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1630323977; x=1632138378; bh=Y+CHmZ6B/AiXBxjVmkcFhf5gN
 sJMUvq6Qut2MbLq3Qk=; b=nbsb7TYM+7pdfCDwL4vUjlPdobId+uNkjQtv08ft0
 va0svHQNLFQ63YffC594TLc7o/Pg2vfSLE4fXBGjolZth95ORzDrolOXuLxIVygN
 7XJT3ilS8mByVx57/19uNx0rEi14b5MIARySUV/iJzXWtCITue+Pq2CRIwZS4xCz
 NU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bb4K68EkypwJ; Mon, 30 Aug 2021 14:46:17 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 107A24CF40;
 Mon, 30 Aug 2021 14:46:16 +0300 (MSK)
Received: from [10.199.0.170] (10.199.0.170) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 30
 Aug 2021 14:46:16 +0300
Message-ID: <ff8a8a78fefd2639fa0bcc68bbbb98ec9f1f2e4a.camel@yadro.com>
Subject: Re: [PATCH 0/2] rtc: pch-rtc: add Intel Series PCH built-in
 read-only RTC
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Milton Miller II
 <miltonm@us.ibm.com>
Date: Mon, 30 Aug 2021 14:56:48 +0300
In-Reply-To: <YRwWmeQiVC3dGAjH@piout.net>
References: <YRhQJ4kdyu1Xs1Rb@piout.net>
 <20210810154436.125678-1-i.mikhaylov@yadro.com>
 <20210814224215.GX15173@home.paul.comp>
 <OFBF96A764.75CCED3A-ON00258734.0062B30C-00258734.00634222@ibm.com>
 <YRwWmeQiVC3dGAjH@piout.net>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.170]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: Paul Fertser <fercerpav@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2021-08-17 at 22:05 +0200, Alexandre Belloni wrote:
> On 17/08/2021 18:04:09+0000, Milton Miller II wrote:
> > 
> > On Aug 16, 2021, Alexandre Belloni wrote:
> > > On 15/08/2021 01:42:15+0300, Paul Fertser wrote:
> > > > On Tue, Aug 10, 2021 at 06:44:34PM +0300, Ivan Mikhaylov wrote:
> > > > > Add RTC driver with dt binding tree document. Also this driver
> > > adds one sysfs
> > > > > attribute for host power control which I think is odd for RTC
> > > driver.
> > > > > Need I cut it off and use I2C_SLAVE_FORCE? I2C_SLAVE_FORCE is not
> > > good
> > > > > way too from my point of view. Is there any better approach?
> > > > 
> > > > Reading the C620 datasheet I see this interface also allows other
> > > > commands (wake up, watchdog feeding, reboot etc.) and reading
> > > statuses
> > > > (e.g Intruder Detect, POWER_OK_BAD).
> > > > 
> > > > I think if there's any plan to use anything other but RTC via this
> > > > interface then the driver should be registered as an MFD.
> > > > 
> > > 
> > > This is not the current thinking, if everything is integrated, then
> > > there is no issue registering a watchdog from the RTC driver. I'll
> > > let
> > > you check with Lee...
> > 
> > I think the current statement is "if they are truly disjoint 
> > hardware controls" then an MFD might suffice, but if they require 
> > software cordination the new auxillary bus seems to be desired.
> > 
> 
> Honestly, the auxiliary bus doesn't provide anything that you can't do
> by registering a device in multiple subsystem from a single driver.
> (Lee Jones, Mark Brown and I did complain at the time that this was yet
> another back channel for misuses).
> 
> > > > However, I'm not sure what is the correct interface for
> > > poweroff/reboot
> > > control.
> > 
> > While there is a gpio interface to a simple regulator switch,
> > the project to date has been asserting direct or indirect 
> > gpios etc to control the host.   If these are events to 
> > trigger a change in state and not a direct state change
> > that some controller trys to follow, maybe a message delivery 
> > model?   (this is not to reboot or cycle the bmc).
> > 
> > milton
> 

Alexandre, gentle reminder about this one series. I can get rid off from sysfs
attribute and put it like RO rtc without any additional things for now as
starter.

Thanks.

