Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77F273FBB
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 12:36:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwd5Y5CnpzDqxk
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 20:36:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=k5ep4/ft; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwd4Q11xyzDqTD
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 20:35:33 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3B9C157551;
 Tue, 22 Sep 2020 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1600770927; x=1602585328; bh=B2S
 nDbOi8AfCoFO8L4fndKNPKesrTVDT6qyEqWgTMlE=; b=k5ep4/ftvQSg+shLsIe
 WHcCW/yS1Zr2/PN0a1HNrIgVTXPWIeerbcZolIuykTMk9mHnCU+9lHPlM7J8jkTO
 ra4RFBnSO7QGVDjNHdtxATa1/EMeQLG1BFBjaSlz+wun4YeoLpkfyLu/UYgYkLWw
 3QokAbXzs2AkEKWG2zKjYrOg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXJ5DC35gOWn; Tue, 22 Sep 2020 13:35:27 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E87F357547;
 Tue, 22 Sep 2020 13:35:26 +0300 (MSK)
Received: from [10.199.2.218] (10.199.2.218) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 22
 Sep 2020 13:35:26 +0300
Subject: Re: Naming DBus paths of CPU objects
To: Ed Tanous <ed@tanous.net>
References: <65194bdf-93e7-0cf5-6fce-2b5b0aee5c9c@yadro.com>
 <CACWQX80Fj2fiF9fW56meL0kQucKfkQc4QbL5-nC-_amRb8O-zg@mail.gmail.com>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <31453c1b-def5-145a-9bc9-6d621fb9fe1e@yadro.com>
Date: Tue, 22 Sep 2020 13:35:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACWQX80Fj2fiF9fW56meL0kQucKfkQc4QbL5-nC-_amRb8O-zg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.218]
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

Ed, hello
Some time ago I opened discussion about naming of CPU dbus-objects and way to couple of its.
But, my bad, I was missing your answer. So sorry, I'd kindly ask to start discussion again

Bellow are my thoughts about this.

On 01.09.2020 02:39, Ed Tanous wrote:
> On Mon, Aug 31, 2020 at 10:55 AM i.kononenko <i.kononenko@yadro.com> wrote:
>>
>> Hi,
>>
>> I'm working on improving of the OpenBMC RedFISH API. In particular, the endpoint of the Processor.
>> To provide all the properties of the applied RedFISH schema, we need to get from
>> DBus everything related to the CPU object.
>> It can be CPU, Sensor CPU temp, Sensors Core CPU, etc.
> 
> 
> I'm a little confused.  The Processor schema doesn't have a Thermal
> property (did they add one?) so CPU temperatures and core temps would
> need to go under an equivalent Assembly or Chassis.  I think today for
> some platforms they're added under the baseboard, which isn't
> "correct" but is close enough.  Can you talk a little more about what
> you're wanting to accomplish in your improvements?  What would the end
> result look like?

Yes, the Processor schema doesn't have Thermal property, but let's looks to implementation of CPUSensors.
It's be more precise explanation of what I want to accomplish.

The CPUSensors takes the DBus configuration object which is defined at the EntityManager.
This object impls the `xyz.openbmc_project.Configuration.XeonCPU` and `xyz.openbmc_project.Inventory.Item`.
The last one adjust `Present` and `PrettyName` properties. So, known that at least, we can adjust Processor's 
schema fields "Status": "Healf" And "State". 

Moreover, the CPUSensors using data of `xyz.openbmc_project.Configuration.XeonCPU` retrieve the sensors target values from `hwmon`
and define cpu-core dbus objects, in particular. Each one cpu-core object also want have `Present` property. Having this information about
each Core of CPU we can adjust field "TotalEnabledCores".
Summary, if this objects will be couple then we can present the Processor state information at a first approximation.

At next time, when all specific CPU information will be taken from a 3d-party place (e.g. smbios-mdrv2) we would want adds this to the exists CPU item.
For that might been happen we must define way to couple all dbus-object about the same thing physical processor. 
(EM-configuration, CPUSensors-each-sensors, CPUSensor-healf-object, Smbios_mdrv2-manufacturer-data, e.g.)

I'd suggest to do this with object-mapper's associations. I have patch set and I can push it to gerrit,
if anybody interested of the purposes described above.

Thanks!

> 
>>
>>
>> However, some services have different names for the same physical processor.
>> In particular it is about `entity-manager`, `dbus-sensros`, `smbios-mdr_v2`.
>> `Smbios-mdr_v2` (just like `hwmon`) names the processor, indexing
>> it from 0; in `entity-manager` and `dbus-sensor` indexing starts from 1.
>>
>> I want to add dbus-associations between all Processor's object,
>> but for that I think we need to adopt a naming convention for the same DBus objects.
> 
> 
> Can you talk about why you need this?  Keep in mind, there are lots of
> systems that have processors on add in cards, or separate
> accelerators.  Making the statement "all" makes me think you're
> wanting to make a blanket association from system->processor, which
> I'm not sure we can do as a generalization without breaking those use
> cases (which admittedly aren't modeled very well today).  I would hope
> we don't need to rely on a common naming convention to do it.
> 
>>
>>
>> I like to index it from 0, just like doing that the `hwmon`, for example.
> 
> 
> I completely agree that we should standardize the naming convention
> where we can, the only problem here is that the overarching goal is
> that we match the silkscreen mask on the board, some of which zero
> index, some of which one index.  With that said, I know that a lot of
> the existing configs don't currently match the silkscreen.
> smbios-mdr_v2 to my understanding should be using 1 indexing.
> 
>>
>>
>> --
>> Best Regards!
>> Igor Kononenko

-- 
best,

Igor Kononenko
