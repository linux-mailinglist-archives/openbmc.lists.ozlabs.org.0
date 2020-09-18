Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 128192703DF
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 20:23:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtMfF3QK3zDqvL
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 04:23:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=c/zXpZsn; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtMdN3tH9zDqpC
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 04:22:48 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 16F6B57548;
 Fri, 18 Sep 2020 18:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1600453362; x=1602267763; bh=AXTzqOMKRdTepOEjTBH5sqYj5
 wVFqd4JPnvHouIW5BE=; b=c/zXpZsnYueP26mTagJ4+iFsL2Nn2Q/bZ5EwoQnBJ
 2zhOJw5IfiUooNSuN9ugpv+BZ6lbYbmDPssizQ6GoCeQpTt1t2t0wMhrlBcXqrTl
 Nhw4T7hyXGo3pxvwRpGyctx0iwXsst7bK0t/pOmawuP7+ZERivE4Pgw2nYQG5MNd
 74=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_aVvRzTuQm0; Fri, 18 Sep 2020 21:22:42 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0500E5753A;
 Fri, 18 Sep 2020 21:22:41 +0300 (MSK)
Received: from [10.199.0.126] (10.199.0.126) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 18
 Sep 2020 21:22:41 +0300
Message-ID: <6df4dd0dcc61aa0a11396ec8cfd3d073416ca272.camel@yadro.com>
Subject: Re: Quanta requests to create a repo in OpenBMC github
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Patrick Venture <venture@google.com>
Date: Fri, 18 Sep 2020 21:22:40 +0300
In-Reply-To: <CAO=noty_XW8LmRJ3kc7pzjO5n73=70NDhmFk=25zvvJBfmir8Q@mail.gmail.com>
References: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
 <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
 <CANPkJS_p9iTJJCue_cSePsgsJ71ztv06XEvEpqe1Y294ne5UYQ@mail.gmail.com>
 <20200917152912.GG6152@heinlein>
 <CADKL2t5npwwBs6ecKAqscJ8=BoakpwDNMjuSiZOSXTkCNcLryA@mail.gmail.com>
 <c2760962bf75625e06c5a85663faff9ef64cecd2.camel@yadro.com>
 <CAO=noty_XW8LmRJ3kc7pzjO5n73=70NDhmFk=25zvvJBfmir8Q@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.126]
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'm just curious, because I don't really know how does pid-control
actually works. Let's say we have following zone configuration (EM
configuration file, unrelated PID parameters are hidden):
{
    "FailSafePercent": 100,
    "MinThermalOutput": 30,
    "Name": "Main",
    "Type": "Pid.Zone"
},
{
    "Class": "temp",
    "Inputs": [
        "DIMM [ABCDEF]\\d+ CPU0",
        "DIMM [ABCDEF]\\d+ CPU1"
    ],
    "Name": "DIMM ALL",
    "Outputs": [],
    "SetPoint": 80.0,
    "Type": "Pid",
    "Zones": [
        "Main"
    ],
    ...
},
{
    "Class": "temp",
    "Inputs": [
        "EXIT_AIR"
    ],
    "Name": "EXIT_AIR",
    "Outputs": [],
    "SetPoint": 50.0,
    "Type": "Pid",
    "Zones": [
        "Main"
    ],
    ...
},
{
    "Class": "fan",
    "Inputs": [
        "SYS_FAN"
    ],
    "Name": "SYS_FAN",
    "Outputs": [
        "SYS_FAN_PWM"
    ],
    "Type": "Pid",
    "Zones": [
        "Main"
    ],
    ...
},


How would it work? I was sure pid-control would examine all the sensors
and try to keep temperature below setpoints: 80 degrees for any of DIMM
memory sensors and 50 degree for exit air. If so, what is the benefit
to use this virtual margin sensor?

On Fri, 2020-09-18 at 08:49 -0700, Patrick Venture wrote:
> On Fri, Sep 18, 2020 at 1:06 AM Andrei Kartashev <
> a.kartashev@yadro.com> wrote:
> > 
> > > This daemon is intended to be used in combination with
> > > phosphor-pid-control. You define a configuration file with two
> > > sections: sensors and zones.
> > > 
> > > Sensors have a D-Bus path to read from along with a target
> > > temperature
> > > and some other parameters. The daemon subtracks the current
> > > temperature from the target temperature to get the "margin". A
> > > smaller
> > > margin means the temperature is closer to the limit.
> > > 
> > > Zones group sensors together and look for the worst (lowest)
> > > margin
> > > value within that group. This value is then exported for use in
> > > phosphor-pid-control.
> > 
> > I wonder, isn't phosphor-pid-control do the same by its own? How
> > does
> > it works inside pid-control daemon, when you set several thermal
> > sensors for one Zone an set setpoint for each of them?
> 
> Not sure what your question is, but yes, the pid-control daemon can
> host its own margin sensor values that are populated externally,
> however this is only supported via the json configuration at present.
> 
> > 
> > --
> > Best regards,
> > Andrei Kartashev
> > 
> > 
-- 
Best regards,
Andrei Kartashev


