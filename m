Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F252303876
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 09:58:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ0xq73PPzDqpM
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 19:58:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jozef.wludzik@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ0ws4G35zDqPC
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 19:57:16 +1100 (AEDT)
IronPort-SDR: OSLpNVZtgsQRe381HeFpqob2HW2DKWSzB7DUg7telsVjQRzRuWkYFS42h/SBeNCZxlh3MeckU9
 iMYAKE0I9qiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198655752"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="198655752"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:57:02 -0800
IronPort-SDR: CV/9DAcI1tDjMFFtnNQA5To3GMbnhs/GDwKw+sgYqLLPEnWtiZFTVh/YIeAmFsYItwBbNauE5H
 gft4DplGk6eg==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="387751516"
Received: from jwludzik-mobl.ger.corp.intel.com (HELO [10.252.32.40])
 ([10.252.32.40])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:57:00 -0800
From: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
Subject: Re: Discrete Sensors in OpenBMC
To: openbmc@lists.ozlabs.org
References: <9d53ed62-7d4f-6c0a-a52d-34ae690d84e8@linux.intel.com>
 <CAH2-KxCY4bHin6yQELB9dKPcSZsJUMM61k2FLSs+hVcYG6TzgA@mail.gmail.com>
Message-ID: <5bf89d84-663a-45ad-4891-ce29d07830ae@linux.intel.com>
Date: Tue, 26 Jan 2021 09:56:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAH2-KxCY4bHin6yQELB9dKPcSZsJUMM61k2FLSs+hVcYG6TzgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Thanks for responses. It sounds reasonable. As initial implementation
discrete threshold/trigger will allow to monitor sensor without
differentiate between type of sensor (e.g. thermal, power, voltage,
...). If anyone will require additional type of resource to be monitored
by Telemetry (e.g. intrinsic sensor to check if chassis is closed), than
it is possible to extend the implementation.

I liked the idea to stream resource events. It seems that it is the same
as discrete threshold but threshold allows to commit an action on
specific value of a resource/sensor. One of the trigger actions is
logging a Redfish Message that can be streamed as Event.

Thanks,
Jozef

On 1/21/2021 17:46 PM, Ed Tanous wrote:
> On Tue, Jan 19, 2021 at 6:23 AM Wludzik, Jozef
> <jozef.wludzik@linux.intel.com> wrote:
>>
>> Does anyone use or implement discrete sensor in OpenBMC? Redfish defines
>> discrete triggers that use discrete values to detect that threshold is
>> crossed and trigger action should be commited. Redfish does not mention
>> about discrete sensor/values in other topics/schemes than Telemetry
>> (e.g. MetricDefinition, MetricReportDefinition and MetricReport). I am
>> asking about it because we are trying to find an example of discrete
>> sensor to proceed with DiscreteTriggers implementation (aka Discrete
>> thresholds) from Triggers scheme.
> 
> A "discrete" sensor is terminology that's only used in IPMI.  The
> equivalent in Redfish would be an enum type property, of which there
> are many examples.  The most obvious discrete-like sensor that we have
> an example of today would be the Systems PowerState parameter, which
> changes state based on the power state of the system.
> 
> If you're looking to stream events through redfish, generally you
> would implement some kind of property, then you would implement a
> Resource Changed event that someone could subscribe to from here:
> https://redfish.dmtf.org/registries/ResourceEvent.1.0.3.json
> 
> We don't have the subscription part implemented yet, but there was
> some talk about getting that going.
> 
>>
>> Ref.:
>>
>> Redfish Telemetry White Paper -
>> https://www.dmtf.org/sites/default/files/standards/documents/DSP2051_1.0.0.pdf
>>
>> Thanks,
>> Jozef
>>
