Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5444250A6
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 12:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ6LV0s2qz2ym7
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 21:02:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=PkUPgUgz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=PkUPgUgz; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ6L74pYNz2ygF
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 21:01:51 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 9B65A43ECF
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1633600904; x=1635415305; bh=9Do874x9TjciF7kLjWuqNf1uz
 2SMSE4hocVaqShHW7E=; b=PkUPgUgzuFLkSpMnjfmKEuIw7bATiaUKGKlMlIpXc
 v3Aq0e2QVPEOM7R8Tfb/ISoVfEwDfYrJwqJjQXwnpPW1XOx131FVFpkyksq7xwhS
 CM7GN1nIlokj0a+faNiaam4sxo99sR0xZNusyzESGYl52DqmTNxWKzxfON4QiF5B
 bA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6qfRSG7DFqV for <openbmc@lists.ozlabs.org>;
 Thu,  7 Oct 2021 13:01:44 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E79C543EC5
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 13:01:43 +0300 (MSK)
Received: from [10.199.0.213] (10.199.0.213) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 7 Oct
 2021 13:01:43 +0300
Message-ID: <4d5e66d42121fe920baaa599bf8c47b627c924b7.camel@yadro.com>
Subject: Re: support for gpio  as ipmb sensor
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Thu, 7 Oct 2021 13:01:40 +0300
In-Reply-To: <PS2PR02MB26955C60FF82D23E95A8281291B19@PS2PR02MB2695.apcprd02.prod.outlook.com>
References: <PS2PR02MB26959672C7002D26EB5F4A4691AF9@PS2PR02MB2695.apcprd02.prod.outlook.com>
 <ef4d5ac6-49e8-40d6-9e6b-1fe030f3909a@www.fastmail.com>
 <PS2PR02MB2695DA8CBF0598991A64D7B691B19@PS2PR02MB2695.apcprd02.prod.outlook.com>
 <PS2PR02MB26955C60FF82D23E95A8281291B19@PS2PR02MB2695.apcprd02.prod.outlook.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.213]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Naveen,

What are the consumers of this 30 GPIO lines? How are you going to
integrate this signal to software?

If this is really "sensors", which should be exposed to end user (e.g.
with ipmi discrete sensors), I propose to add some generic discrete
sensor mechanism, which can be configured from EM.
Probably we should extend xyz.openbmc_project.Sensor interfaces set to
handle discrete sensors.

If this is some internal mechanism, required only for other daemons, I
prefer you to not use "sensors" term - this something other )

On Thu, 2021-10-07 at 07:45 +0000, naveen moses wrote:
> 
> From: naveen moses <naveen.moses@hotmail.com>
> Sent: Thursday, October 7, 2021 11:42 AM
> To: Andrew Jeffery <andrew@aj.id.au>; openbmc@lists.ozlabs.org
> <openbmc@lists.ozlabs.org>
> Cc: Zhikui Ren <zhikui.ren@intel.com>; Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com>; Vernon Mauery
> <vernon.mauery@linux.intel.com>; Ed Tanous <ed@tanous.net>; naveen
> moses <naveen.moses@outlook.com>
> Subject: Re: support for gpio as ipmb sensor  
> Hi Andrew,
> 
> Thanks for the suggestions. please find my comments below:
> 
> What do you mean when you say "cannot be directly monitored using
> gpio
> monitor"?
>  
> Naveen : The gpio is connected via ipmb bridge interface so to read
> its state it should be done via ipmb call.
> so, it cannot be specified as direct gpio config to be read by gpio-
> monitor process.
> 
> What about modelling the behaviour the GPIO state represents rather
> than just providing a DBus interface to the GPIO values?
> 
> Naveen : The gpio behavior is done in separate process and there is a
> separate process which is depends on the gpio state.
> Here the implementation is not for a specific gpio. there are 10 to
> 30 similiar gpios
> which can be only accessed via ipmb bridge interface.  The ipmb gpio
> sensor we are proposing
> could be for multiple number ipmb based gpios. The states of the
> individual ipmb gpios are monitored if they are configured in entity
> manager as gpio sensors.
> their state is updated as sensor state property which can be read by
> other dependent properties.
>   
> Thanks,Naveen
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Wednesday, October 6, 2021 5:46 AM
> To: naveen moses <naveen.moses@hotmail.com>; openbmc@lists.ozlabs.org
> <openbmc@lists.ozlabs.org>
> Cc: Zhikui Ren <zhikui.ren@intel.com>; Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com>; Vernon Mauery
> <vernon.mauery@linux.intel.com>; Ed Tanous <ed@tanous.net>; naveen
> moses <naveen.moses@outlook.com>
> Subject: Re: support for gpio as ipmb sensor  
> Hi Naveen,
> 
> On Tue, 5 Oct 2021, at 23:46, naveen moses wrote:
> > Hi All,
> > 
> > we have a couple of gpios ( input ) accessed via ipmb commands in
> > our platform.
> > which cannot be directly monitored using gpio monitor.
> 
> What do you mean when you say "cannot be directly monitored using
> gpio 
> monitor"?
> 
> > 
> > our idea is to expose them as ipmb sensors which has gpio state as 
> > property which is updated based
> > on the current state of the gpio.
> > 
> > at present there is no compatible interface under 
> > xyz/openbmc_project/sensors for gpio as sensor.
> > 
> > So is this acceptable to create a new interface for gpio state
> > under 
> > xyz/openbmc_project/sensors :
> > interface name : gpioState
> > which has a property named value whose possible values are boolean 
> > (true or false).
> 
> What about modelling the behaviour the GPIO state represents rather 
> than just providing a DBus interface to the GPIO values?
> 
> Andrew

-- 
Best regards,
Andrei Kartashev


