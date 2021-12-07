Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE746B519
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 09:06:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7XtJ2XDyz2yfZ
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 19:06:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=QFdZNMo2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=QFdZNMo2; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Xsw00L7z2xrP
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 19:05:39 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1619643830;
 Tue,  7 Dec 2021 08:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1638864333; x=1640678734; bh=OEeEGiMcVeNZ99t9ubgOC+sp9
 toRh2F2F3OJEOyR+uQ=; b=QFdZNMo2E7dkiK7zzp3k6qqCoev02rX2naVvVohVO
 dsK+0WMCaPuyFf0DxDHcRZnDQyjb0JKrAvW9LrJGZFE5b5BpLfLC325QEbExOl0d
 IDTGYR9vyCvtOKr0hGjnprjAwUf2oXux9nWrSz41690rQHnryRrPAN1WGuCheVXC
 a4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1hfNImNQvx1; Tue,  7 Dec 2021 11:05:33 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 30CFE43842;
 Tue,  7 Dec 2021 11:05:26 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 7 Dec
 2021 11:05:25 +0300
Message-ID: <fabdbd3d04e3db2cef14346bc5b7e3fe71101c40.camel@yadro.com>
Subject: Re:  openBMC pwm-fan control policy
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Landon <cld795@163.com>
Date: Tue, 7 Dec 2021 11:05:23 +0300
In-Reply-To: <8e645b4.344b.17d93d37f8d.Coremail.cld795@163.com>
References: <mailman.0.1637828525.15424.openbmc@lists.ozlabs.org>
 <217ffd16.389b.17d5636abb5.Coremail.cld795@163.com>
 <20211125084640.GA22508@home.paul.comp>
 <78340dc9.749f.17d5ab53990.Coremail.cld795@163.com>
 <687802ca.772b.17d5ad02872.Coremail.cld795@163.com>
 <20211126215734.GH22508@home.paul.comp>
 <459566ca.670c.17d6b13a847.Coremail.cld795@163.com>
 <18a75e7d223e2c054e93e9a83a6c0ba474125518.camel@yadro.com>
 <6fc4e62.472c.17d7a6a0885.Coremail.cld795@163.com>
 <2f6c7248.c41.17d9291a38e.Coremail.cld795@163.com>
 <8e645b4.344b.17d93d37f8d.Coremail.cld795@163.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.10.105]
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
Cc: "fercerpav@gmail.com" <fercerpav@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sorry, I probably miss your question.

I still don't understand, what kind of help do you need, but I will try
to explain the idea:
PID-control daemon use concept of the PID systems, where you have
inputs (sensors) and outputs (FANs). To configure PIDs in pid-control
the zone concept is used: thermal zone can have several fans and
several sensors. 
Then you should select PID-loop type and set parameters for each sensor
and FAN. For normal temperature sensor you generally will use normal
PID-loop, were you setup PID coefficients and setpoint (target
temperature). When the value of one (or more) sensor exceed setpoint
PID-control will increase the speed of the fans in the zone trying to
keep temperatures below the setpoints.
For current sensors you probably should use stepwise mode, but I'm not
familiar here.

On Tue, 2021-12-07 at 15:37 +0800, Landon wrote:
>   
>   
> On 12/7/2021 09:45，Landon<cld795@163.com> wrote： 
> > 
> >  Hello,
> > Can you take a look at it, please?
> >  
> > Thanks!
> > On 12/2/2021 17:11，Landon<cld795@163.com> wrote： 
> > > Hello,
> > > 
> > > I read the
> > >  "https://github.com/openbmc/phosphor-pid-control/blob/master/configure.md"：
> > > 
> > > How to Configure Phosphor-pid-control
> > > 
> > > type == "temp"
> > > 
> > > Exactly the same as margin but all the inputs are supposed to be
> > > absolute temperatures and so the maximal value is used to feed
> > > the PID loop.
> > > type == "stepwise"
> > > 
> > > "name": "temp1",
> > > "type": "stepwise",
> > > "inputs": ["temp1"],
> > > "setpoint": 30.0,
> > > "pid": {
> > >   "samplePeriod": 0.1,
> > >   "positiveHysteresis": 1.0,
> > >   "negativeHysteresis": 1.0,
> > >   "isCeiling": false,
> > >   "reading": {
> > >     "0": 45,
> > >     "1": 46,
> > >     "2": 47,
> > >   },
> > >   "output": {
> > >     "0": 5000,
> > >     "1": 2400,
> > >     "2": 2600,
> > >   }
> > > }
> > > and
> > >  in  "https://github.com/openbmc/entity-manager/blob/master/configurations/R1000%20Chassis.json
> > > "
> > > {
> > >             "Class": "temp",            "FFGainCoefficient": 0.0,
> > > "FFOffCoefficient": 0.0,            "ICoefficient": -4.64,      
> > > "ILimitMax": 100,            "ILimitMin": 30,           
> > > "Inputs": [                "Exit Air Temp"            ],        
> > > "Name": "Exit Air Temp",            "NegativeHysteresis": 5.0,  
> > > "OutLimitMax": 100,            "OutLimitMin": 30,           
> > > "Outputs": [],            "PCoefficient": -0.15,           
> > > "PositiveHysteresis": 0.0,            "SetPoint": 75.0,         
> > > "SlewNeg": -1,            "SlewPos": 0.0,            "Type":
> > > "Pid",            "Zones": [                "Zone 1",           
> > > "Zone 2",                "Zone 3",                "Zone 4",     
> > > "Zone 5",                "Zone 6"            ]        },
> > >  but  I don't understand how to control the fan by temperature ?
> > > I was wondering if you could help me explain ?
> > > Thank you very much !
> > > On 11/29/2021 18:22，Andrei Kartashev<a.kartashev@yadro.com>
> > > wrote： 
> > > > Hello,
> > > > 
> > > > Please read phosphor-pid-control documentation:
> > > > https://github.com/openbmc/phosphor-pid-control
> > > > https://github.com/openbmc/phosphor-pid-
> > > > control/blob/master/configure.md
> > > > https://github.com/openbmc/phosphor-pid-
> > > > control/blob/master/tuning.md
> > > > https://github.com/openbmc/phosphor-pid-
> > > > control/tree/master/examples
> > > > 
> > > > Keep in mind that there are two different ways to configure
> > > > phosphor-
> > > > pid-control: statically with JSON config files and dynamically
> > > > with
> > > > DBUS (generally, using EntityManager JSON configuration) and
> > > > same
> > > > parameters with this two ways mostly have different names.
> > > > The way you want to use is generally depend on either you use
> > > > EM
> > > > for
> > > > your platform or not.
> > > > 
> > > > On Mon, 2021-11-29 at 17:43 +0800, Landon wrote:
> > > >  
> > > > >  Thank you!  
> > > > >  I have read it
> > > > >  :  https://github.com/openbmc/entity-
> > > > > manager/blob/master/configurations/R1000%20Chassis.json
> > > > >  But I don't understand,
> > > > >  Is there an explanation for this part?
> > > > >  Are there general instructions on how to control fan output
> > > > > by
> > > > >  temperature?
> > > > >  
> > > > >  and how to use phosphor-pid-control  to set this ?
> > > > >   
> > > > >  Is there“ phosphor-pid-control ”the instructions for this
> > > > > part?
> > > > >  Thank you very much !
> > > > >  On 11/27/2021 05:57，Paul Fertser<fercerpav@gmail.com> wrote：
> > > > >  
> > > > > > On Fri, Nov 26, 2021 at 01:55:31PM +0800, Landon wrote:
> > > > > >   
> > > > > >  
> > > > > > > add: I just want to know in  OpenBMC by reading different
> > > > > > >  temperature values  or
> > > > > > >   current values to  control the fan  output, so as  to
> > > > > > > cool down,
> > > > > > >   how does  this
> > > > > > >   strategy work? An example of this.
> > > > > > 
> > > > > >  This is using temperature values to control the fans so as
> > > > > > to cool
> > > > > >  down, it works by configuring phosphor-pid-control
> > > > > > appropriately, I
> > > > > >  hope it's enough of an example:
> > > > > >  
> > > > > >  https://github.com/openbmc/entity-
> > > > > >  manager/blob/master/configurations/R1000%20Chassis.json
> > > > > >  
> > > > > >  If you think phosphor-pid-control is missing some
> > > > > > documentation
> > > > > >  please
> > > > > >  read its source code and send documentation patches for
> > > > > > review.
> > > > > >  
> > > > 

-- 
Best regards,
Andrei Kartashev


