Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54737242AC2
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 16:00:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRWZ63YN2zDqch
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 00:00:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Tf27IH0u; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRWXq2wQ8zDq6q
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 23:59:38 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6A25F4C899;
 Wed, 12 Aug 2020 13:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1597240772;
 x=1599055173; bh=5EN5ZOYC/htiJTPmm4z7m+zedP0gwH47oBglnE2NwBs=; b=
 Tf27IH0u37qaFNkrjhgaczoRRuM+6lM51U6un7IawtPcIEjZBPzfHdgS+cMSLKOw
 t5ne3b2+l14Uh26LhfTIWgyX0iVHxYrp+ZqY1bv7+GVnXfGLVI6ZIT44V0oc3w4G
 /tG31dCG9RWx/d7M+hwexoOcGJ8ZwuYfTuerqDFmv0g=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKlTFw30KI3E; Wed, 12 Aug 2020 16:59:32 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D10974C84A;
 Wed, 12 Aug 2020 16:59:32 +0300 (MSK)
Received: from localhost (172.17.14.122) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 12
 Aug 2020 16:59:32 +0300
Date: Wed, 12 Aug 2020 16:59:32 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: The Power9 host booting problem with OpenBMC kernel 5.7.x
Message-ID: <20200812135932.GA13370@bbwork.lan>
References: <20200810184446.GA14652@bbwork.lan>
 <CACPK8XdFNpsyzgY8n_3VTxS-Z88bT1pBEXPO+w=dWE6G1fj3jA@mail.gmail.com>
 <20200811183314.GA26661@bbwork.lan>
 <CACPK8XeLsJ+xKc7yD43sbkVCGohNoPx_d+JVNbv0unqS2XLM1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACPK8XeLsJ+xKc7yD43sbkVCGohNoPx_d+JVNbv0unqS2XLM1Q@mail.gmail.com>
X-Originating-IP: [172.17.14.122]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Artem Senichev <artemsen@gmail.com>, openbmc <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, Eddie James <eajames@linux.ibm.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 12, 2020 at 08:56:16AM +0000, Joel Stanley wrote:
> Thanks for the response. I've merged the two threads, and I have a
> candidate for a fix.
> 
> On Tue, 11 Aug 2020 at 18:33, Alexander A. Filippov
> <a.filippov@yadro.com> wrote:
> > With the kerenl 5.8 the host is still not booting.
> > I've checked on both machines and they have very different results:
> >  - On the machine with two CPUs the issue is still reproduced.
> >    I see no difference, neither in the behavior, nor in the logs.
> >  - On the machine with one CPU the failure happens due the PNOR flash.
> >    It looks like this:
> 
> >
> > I've noticed that the kernel 5.8 detect the flash driver incorrectly:
> > mx25l51245g instead of mx66l51235f.
> > It happens on both machines and I don't understand why it leads to the problems
> > on only one of them.
> 
> I found upstream v5.8 has a regression in the spi-nor driver on
> aspeed. I've put a revert of the patch that caused the regression on
> the list, but it requires some more investigation to find a proper
> fix:
> 
>  https://patchwork.ozlabs.org/project/openbmc/patch/20200812035847.2352277-1-joel@jms.id.au/
> 

Yes, this solves the problem with the flash drives.
They are still reported other model names, but work properly.


> On Tue, 11 Aug 2020 at 11:54, Artem Senichev <artemsen@gmail.com> wrote:
> > > My guess is it's something to do with the timekeeping, irq or rcu
> > > code. All areas of complexity!
> > >
> >
> > We had similar behaviour in P8 when tried to use ColdFire FSI:
> > https://github.com/openbmc/openbmc/issues/3433
> >
> > In this issue, htop shows 100% load of one CPU on the host and it is not an OS
> > task. Looks like FSI doesn't stop working and fully loads one core.
> 
> I think we have an issue with the irq polarity of the vuart device.
> Did you notice an excessive number of lpc_serirq interrupts on the
> host (check /proc/interrupts)?

You are right, lpc_serirq_mux1 is 183507008 after the host OS has just booted.

> 
> Try doing this on your BMC before booting your host:
> 
> root@bmc:~# echo 0 >
> /sys/devices/platform/ahb/ahb:apb/1e787000.serial/sirq_polarity
>

Yes, after this the both hosts work properly.

Thanks for your help.

> If that fixes it we can make a change to the device tree to make the
> setting permanent.
> 
> Cheers,
> 
> Joel

--
Regards,
Alexander
