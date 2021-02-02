Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E230D05A
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 01:39:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjWF3mdrzDqNn
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 11:39:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVL405HRQzDqrV
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 21:03:27 +1100 (AEDT)
IronPort-SDR: /6JIKCkhPUy44QCwRDVm0lWvA9mKXHuCEEXcVq3wSNcOw2WchtHUHcoI0GWVsxjk/O3tuquQsQ
 wSHBTSc9rSAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="199745524"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="199745524"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:03:03 -0800
IronPort-SDR: Ff3ekCP+rUAKIVcRtdxYo7hKe69NnFEgBNN/UnELFnvuDw+mA8rmnFwCBXR2isCQdmV845j9mP
 GUNPQHmJEuLg==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="432828782"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.24.236])
 ([10.213.24.236])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:02:57 -0800
Subject: Re: Sensor Value PropertiesChanged Events
To: Ed Tanous <ed@tanous.net>, "Bills, Jason M" <jason.m.bills@linux.intel.com>
References: <31abd546-4538-ecf0-134e-b8e48e75b3ad@linux.intel.com>
 <CACWQX83KhqORsx-Gm4CCEndADO-GEgNHtxPpHR2ptsgzmtU9xA@mail.gmail.com>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Message-ID: <01c540f2-9d7e-b54c-42c0-ed0bf666a090@linux.intel.com>
Date: Tue, 2 Feb 2021 11:02:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CACWQX83KhqORsx-Gm4CCEndADO-GEgNHtxPpHR2ptsgzmtU9xA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

W dniu 2/2/2021 o 01:42, Bills, Jason M pisze:

 > 1. Is this a real concern or are PropertiesChanged signals so 
lightweight that removing them won't help with D-Bus load?
Without proper measurements I don't believe we can be sure. Can we 
reliably benchmark how much CPU time and memory is used by 
PropertiesChanged roaming through the system?

I would be interested in investing some time at profiling existing 
dbus-sensors services, as from time to time we're experiencing 
performance issues with them.

My trust in systemd D-Bus implementation is that signals are implemented 
in optimal way and broker doesn't broadcast it to services without 
proper 'match' defined. It should be checked though
Moving to polling might in fact increase D-Bus utilization by 
introducing message-response communication between producer and 
consumer. In certain cases of sensors which tend to update slowly, 
introducing a getter with faster interval would increase the traffic, if 
the interval would be faster than the sensor update rate.


 > 2. Does anyone need to match on sensor Value property updates or is 
reading them with get-property enough?
TelemetryService specifies 'OnChange' mode for monitoring Metrics - "The 
metric report is generated when any of the metric values change.".

My current experience with TelemetryService adopters, shows that 
administrators and data scientist want to get all the information they 
can (all sensors, possibly with highest rate). With more focus on 
telemetry these days I would expect more (hundreds of thousands) sensors 
to come. Polling each of them individually could be not feasible.

Furthermore - having reliable event-based updates is crucial for 
catching short-lived anomalies (voltage spikes etc). I believe they are 
events of particular interest for data-center admins, while being easy 
to miss with polling-based updates.
Algorithms working based on sensor updates would be also crippled in 
this case, as missing samples means worse accuracy.

To sum up - I believe moving away from PropertiesChanged event would 
limit pretty important use cases for system telemetry. I wouldn't mind 
however on working out more performant solution, while keeping the same 
(or better) features:
- optimal and efficient one-to-many broadcasting,
- queuing multiple updates to be consumed by receiver,
- low overhead of yet another side-band channel.

Regards,
Adrian
