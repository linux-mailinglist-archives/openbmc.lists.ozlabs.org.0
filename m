Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB3426D09A
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 03:30:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsKDJ04FczDqJK
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 11:30:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=f7BaZ9jS; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsKBh6tJxzDqDs
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 11:29:32 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 233AF57548
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:reply-to:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1600280587; x=
 1602094988; bh=7kWbCHyHKr7f51K1Or0xgFg3F+/gTb7fS9Z6YqcLOc8=; b=f
 7BaZ9jSVuA1T0WX445Sa8fHCsXXHbcLBvgSAHNvPzTA2LSNF1AURX0hT9+vhO8i/
 GS+J94sB+9s/qvR9bbgQbyYjRDktpOKnETTuuh2YDcSSMr3bs0dnKY1MZB70phpQ
 l29AuiLwuWWnBBSnKT6iXHDY75YHssF+B6hkLOVRrQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2NGqANpNSvI for <openbmc@lists.ozlabs.org>;
 Wed, 16 Sep 2020 21:23:07 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0E3E257524
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 21:23:07 +0300 (MSK)
Received: from [10.199.0.170] (10.199.0.170) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 16
 Sep 2020 21:23:07 +0300
Subject: Re: dbus-sensors: Unit property for xyz.openbmc_project.Sensor.Value
 interface
To: openbmc <openbmc@lists.ozlabs.org>
References: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
 <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
 <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <224f51bd-8c63-07fb-9728-40a35e86dfc3@yadro.com>
Date: Wed, 16 Sep 2020 21:23:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.170]
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
Reply-To: Ed Tanous <ed@tanous.net>, James Feist <james.feist@linux.intel.com>
Cc: Andrei Kartashev <a.kartashev@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 16.09.2020 19:24, Ed Tanous wrote:
> On Wed, Sep 16, 2020 at 8:23 AM James Feist <james.feist@linux.intel.com> wrote:
>>
>> On 9/16/2020 6:28 AM, Andrei Kartashev wrote:
>>> Hi,
>>>
>>> We noticed that dbus-sensors doesn't fully implement
>>> xyz.openbmc_project.Sensor.Value interface: there is no Unit property
>>> for all the sensors, defined by dbus-sensors.
>>> I believe it was intentionally, but I still wondering what was the
>>> reason?
>>
>> It was originally as the information seemed redundant. If the
>> information is needed I'm fine with someone adding it, it just hasn't
>> seemed to be a high priority.

I have a number of patches which adds the "Unit" dbus-property to each of 
dbus-sensors (adcsensor, pwmsensor, etc.),
Also this changes append dependency from phosphor-dbus-interfaces to dbus-sensors recipe. 
Does the dbus-sensors package intentionally lack the phosphor-dbus-interfaces? 
Or can I safely add this dependency?

> 
> Considering we've gone this long with no impact (considering the path
> can be used to lookup the unit) I wonder if we should consider
> removing unit from the sensor Value API?  It doesn't seem used.
> 

Ed, I'm sure that each sensor's unit may be obtained by analyzing a dbus-path in each service, 
but is it really any better than using well-conforming dbus-interface's? 
Setting the Unit once at the single centralized place (I'd suggest it should be dbus-sensors, 
which defenetly knows better about units) we'll prevent any further code duplication and 
re-implementing of this feature in the future.

>>
>>> I noticed that in intel-ipmi-oem units are determined based on object
>>> paths, but that looks ugly since there is well-defined natural
>>> interface for units in dbus.
>>> Lack of the "Unit" property in the interface breaks some existing
>>> logic.
>>>
> 
> Technically the way the interfaces define it, both are valid to use to
> determine the Units, and both would need to be lookup tables.  Is
> using the path any more ugly than using the property?
> 

-- 
best,

Igor Kononenko
