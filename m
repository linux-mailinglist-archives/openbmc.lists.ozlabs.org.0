Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B53358C02
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 20:17:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGTxW0G0Pz3bqT
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 04:17:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=qiifLgIH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=qiifLgIH; dkim-atps=neutral
X-Greylist: delayed 498 seconds by postgrey-1.36 at boromir;
 Fri, 09 Apr 2021 04:16:50 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGTxG4C7Dz2yQr
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 04:16:50 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8620441389;
 Thu,  8 Apr 2021 18:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1617905305; x=1619719706; bh=4cp
 +K2SwZU4JPjJDzHJl/sc1r9Y1FIoNQCmV7QCVLIM=; b=qiifLgIHl3KFf4zRRtR
 DjKLCz+eorY2p6QWRkzyqsXLIBl6/Rbv7uT2PNHxqlQ8IJvyhiWcLAOdE3jiENVO
 01NfJwt35cLriyXjgyYWUkvQflIcGcsufhLKZ4on34mJBbzEan53UxOiTaOS5H++
 UktqXVr8gjw3CuAKM74t8MD8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHchCFKJflWB; Thu,  8 Apr 2021 21:08:25 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2EF6841375;
 Thu,  8 Apr 2021 21:08:25 +0300 (MSK)
Received: from [10.199.0.182] (10.199.0.182) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Apr
 2021 21:08:25 +0300
Subject: Re: adding sync method in phosphor-time-manager
To: <openbmc@lists.ozlabs.org>
References: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <20201007013446.GE6152@heinlein>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <80ea13b3-1779-b2b3-c295-3d09dfd41987@yadro.com>
Date: Thu, 8 Apr 2021 21:08:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20201007013446.GE6152@heinlein>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.182]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

Hi Patrick, everybody!

As far as I can see, this discussion has had no development, to our regret.
We would really like to read some clarification on what is the proposed 
method
of timekeeping for x86 systems nowadays, because with TimeOwner interface
removed, it's not clear to me anymore.

Do you allow the users to set time/date on the BMC side? If so, how do you
propagate those changes on to the host, which in x86 is the owner of RTC?
What if the BMC is rebooted before the time settings are propagated?

If you don't allow setting the time in BMC, then what are the options 
for the user?
Do you allow a choice between NTP and Host time only?

How and when is the time synced from the host? Is there a method to 
force a sync?

Is there maybe some document that covers this topic?

WBR, Alexander Amelkin
YADRO

07.10.2020 04:34, Patrick Williams пишет:
> On Tue, Oct 06, 2020 at 05:38:13PM +0000, Velumani T-ERS,HCLTech wrote:
>> Classification:
>> Hi Team,
>>
>> We wanted to add another time sync method in phosphor-time-manager to get the time from the host and set it to BMC. To have this option configurable I propose a dbus property in the time interface(given below). Please provide your feedback/comments.
>>
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Time/Synchronization.interface.yaml
>> enumerations:
>>      - name: Method
>>        description: >
>>          Possible methods of time synchronization.
>>        values:
>>          - name: NTP
>>            description: >
>>              Sync by using the Network Time Protocol.
>>          - name: Manual
>>            description: >
>>              Sync time manually.
>>           - name: HostSync
>>            description: >
>>              Sync the time from host.
>>
> Hopefully Vishwa can weigh in here.
>
> It is my understanding that the default implementation allows the host
> to synchronize the time down already.  There use to be an interface that
> determined the "TimeOwner" to specify if the BMC or the Host were in
> charge of the time.  That was removed not too long ago.
>
> https://github.com/openbmc/phosphor-dbus-interfaces/commit/70c76a29b898f05e28c803808bd57a2b6c3f7a6f
>
> I think you should look through the history on this commit (it
> references a discussion related to the mailing list) and check with the
> people in that chain as to why it was removed before we add back in
> something very similar.
>
