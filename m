Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3921E0E7C
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 14:33:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VxMM1C9gzDqJC
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 22:33:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VxLP4GSlzDqGL
 for <openbmc@lists.ozlabs.org>; Mon, 25 May 2020 22:32:12 +1000 (AEST)
IronPort-SDR: CJxBHzUZbBBzDYjUC0MIzVBSIqm8AuVykjXPCZRzNrSFyJbiggAas4CF6BKzjwcW9z+xLHL+BP
 TlGgiP2N+gdw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 05:32:10 -0700
IronPort-SDR: N3miJSLW5JXCSa4XnSQUe0xVp1r6dmOrN3uzla1e0F+2sD3vChkvZQEUHsaoNIo+LEA/3yGkJc
 8E2Fk9h2M2aw==
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="441715994"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.213.25.232])
 ([10.213.25.232])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 05:32:08 -0700
Subject: Re: Implementing BMC Health Monitoring
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 Sui Chen <suichen@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>
References: <CAJOps0vP=0sa0R+gNFdrDy9y=e8Qq+LnZX6E2ssJ=5YaWigaeA@mail.gmail.com>
 <ef1c70adf41b465bb29143cbf0b20f63@intel.com>
 <9a86fbeb-7270-8fcd-10a9-a84bd40ea9a7@linux.intel.com>
Message-ID: <6a2274b7-d811-3b1d-f725-54c8c542d47c@linux.intel.com>
Date: Mon, 25 May 2020 14:32:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <9a86fbeb-7270-8fcd-10a9-a84bd40ea9a7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

@Brad, @Vijay

It seems Sui is proposing something highly related to already discussed 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31957 . As a matter 
of fact - requirement for such system metrics availability is also 
highly desirable on our (Intel) side. It seems we need to merge all 
requirements to satisfy the common needs..

Regards,
Adrian

W dniu 5/22/2020 o 10:43, Adrian Ambrożewicz pisze:
> I suppose I could back up Piotr here.
> 
> I believe that in general EntityManager could be leveraged for 
> configuration (enabling/disabling metrics and configuring them). 
> dbus-sensors infrastructure would be beneficial in terms of:
> - familiarity (already used for monitoring physical sensors, new 
> synthetized sensors to come)
> - flexibility (EntityManager could provide runtime configuration of the 
> metrics in the system)
> - availability - both configuration and metrics would be exposed using 
> D-Bus interfaces as easy to consume and 'standarized' way.
> 
> If dbus-sensors would be used then feature mentioned by Piotr 
> (TelemetryService) could almost 'out of the box' support storing and 
> exposing metrics snapshots, send them to external databases 
> (EventService) etc.
> 
> Of course dbus-sensors (xyz.openbmcc_project.Sensor.Value) could be only 
> one of the interfaces for the data, so it's not limiting any other use 
> cases you've mentioned.
> 
> Regards,
> Adrian
> 
> W dniu 5/21/2020 o 12:47, Matuszczak, Piotr pisze:
>> Hi,
>>
>> The proposal seems interesting. From what I've read from your e-mail, 
>> you are looking the best way to implement BMC health metrics. My 
>> proposal would be to expose these metrics as D-Bus sensors with an 
>> option to store data to the filesystem. Such solution will ease the 
>> integration with Redfish and support these metrics by the Monitoring 
>> Service 
>> (https://github.com/openbmc/docs/blob/master/designs/telemetry.md) . 
>> This way, you have support for collecting metrics into metric report, 
>> you have support of simple operations, like min/max/average/sum. Also, 
>> using metric reports, you can store historical readings and stream the 
>> metric reports as events.
>> Piotr Matuszczak
>> ---------------------------------------------------------------------
>> Intel Technology Poland sp. z o.o.
>> ul. Slowackiego 173, 80-298 Gdansk
>> KRS 101882
>> NIP 957-07-52-316
>>
>> From: openbmc 
>> <openbmc-bounces+piotr.matuszczak=intel.com@lists.ozlabs.org> On 
>> Behalf Of Sui Chen
>> Sent: Thursday, May 21, 2020 3:37 AM
>> To: openbmc@lists.ozlabs.org
>> Subject: Implementing BMC Health Monitoring
>>
>> Hello OpenBMC Mailing List,
>>
>> It is great to see the proposal on BMC health monitoring! We have 
>> similar efforts in health monitoring in progress, started doing some 
>> implementation, and would like to share some thoughts with the Mailing 
>> List to help get BMC health monitoring started:
>>
>> (1) What metrics have we considered now?
>>
>> We have considered the following metrics on the BMC:
>>    - Memory usage
>>    - Number of open file descriptors
>>    - Free storage space in the read-write file system
>>    - List of processes
>>    - CPU time for a few top processes
>>    Some of these are inspired by various profilers, and some others 
>> are expected to be relevant to the typical workloads running on the BMC.
>>
>> (2) Overall, it appears the design space for health monitoring has the 
>> following dimensions:
>>
>> a) A method to do the collection, which might be:
>>    - Running a program like "df" to get free disk space
>>    - Traversing some folder to compute some statistics
>>    - Monitor some bus for some time and generate some result
>>    - or something else
>>    The collection process might vary from metric to metric, and can 
>> take some time to complete on the BMC, and therefore, the results 
>> need to be staged somewhere and made accessible when it's completed, 
>> so the requestor won't have to busy-wait.
>>
>> b) A way to stage monitoring data on the BMC, which might be:
>>    - Files or databases in DRAM or some persistent store.
>>    - DBus objects, as described in Vijay's document; this is similar 
>> to how sensors work.
>>    - IPMI Blobs (this is what we have implemented right now)
>>    - or something else
>> c) A way to transfer monitoring data out of the BMC, which might be:
>>    - scp
>>    - RedFish
>>    - IPMI (this is what we're using right now)
>>    - or something else
>> d) Format of staged data:
>>    - Raw bytes
>>    - Protocol buffers
>>    - JSON objects
>>    - or something else
>>    - The data may be compressed to save transfer time
>> e) A way to consume the health monitoring data:
>>    - The BMC might do some pre-processing, like windowed average.
>>    - The BMC may perform certain corrective measures when metrics 
>> appear abnormal.
>>    - The host may perform certain corrective measures when metrics 
>> appear abnormal.
>>    - BMC health data might be plugged into some already existing 
>> monitoring framework overseeing a large number of machines, collecting 
>> historical data, and projecting future trends, etc.
>>
>> f) A way to configure the health monitoring system:
>>    - Configuration for which metrics are collected
>>    - Configuration for the choice of staging in b), way of transfer in 
>> c), and frequency of collection in e)
>>    - Some configurations may be build-time and some may be run-time
>>       - I guess we can draw some inspirations from phosphor-ipmi-blobs
>>
>> (3) The requirements and performance/storage impacts on the BMC:
>>
>> a) The collection should not be too taxing on the processing/storage 
>> resources on the BMC
>>
>> b) The data transfer process should not be too taxing on the link 
>> between the host and BMC
>>    - For the metrics we have and the IPMI connection we're using so 
>> far, it took around 10 ~ 100ms for the host to collect a metric. The 
>> time is dominated by IPMI transfer time. The time is considered 
>> acceptable if a metric is collected at a reasonably long interval, 
>> say, every 30 minutes.
>>
>> We hope the above contents help complement the existing design 
>> proposal, and would like to help actually start implementing (and 
>> deploying) health monitoring for the BMC.
>> The question is: we're working on our implementation and we're 
>> wondering what would be a good time for us to send it for review? Do 
>> we need to support both what we have now and what is being proposed?
>>
>> Thanks!
>> Sui
>>
