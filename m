Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6931B325B
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 23:55:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496HS84wGVzDqyc
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 07:55:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496HQp4fdWzDqpd
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 07:54:25 +1000 (AEST)
IronPort-SDR: UWJe8tDWyPOjX0oZ891pv/ulR2ojspuyR0YLCgsKPvsbFKw26bdl+ryjWNwOsLM/PWO5945Grq
 ekwkBUF7vq9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 14:54:21 -0700
IronPort-SDR: R7pb2ziWpicn6PsRJGnvAmxJGWbylYoyW3uxN799qYUBNVsXam+K2UzVtMiNOSYwClfabpT98Q
 PteCXyJbZ+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; d="scan'208";a="291733016"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.251.3.169])
 ([10.251.3.169])
 by orsmga008.jf.intel.com with ESMTP; 21 Apr 2020 14:54:20 -0700
Subject: Re: dbus-sensors
To: Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
Date: Tue, 21 Apr 2020 14:54:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
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

On 4/21/2020 12:35 PM, Matt Spinler wrote:
> Hi James,
> 
> We're looking into using dbus-sensors(HwmonTemp and PSU) in the future,
> but would need to make a few changes to fit our requirements.  Was 
> wondering
> what you'd think of the following:
> 
> 1. Check if a sensor has a _fault sysfs file, and if it does and it
>    is nonzero, set the Functional property on the OperationalStatus
>    interface to false (and/or maybe 6 below)
Sounds ok.

> 
> 2. After the 10 failed reads, instead of just setting the sensor to 0
>    also make a D-Bus call to create a phosphor-logging event log and set
>    the OperationalStatus sensor to false.

Sounds ok.

> 
> 3. After creating this event log, make sure not to do it again until
>    main power is cycled.

I'd rather this be until the status goes OK again.

> 
> 4. If not already supported (was unsure), be able to find an
>    _input file based on a value it has in the corresponding _label file.

PSU sensor does this, hwmontemp does it by index.
> 
> 5. We have a case where a driver isn't loaded with power off, so somehow
>    we still need the sensors to stay on D-Bus when off (and show them
>    as not available).

All sensors are on d-bus all the time, its based on the EM config.

> 
> 6. Maybe add a new property to Sensor.Value on the validity
>    of the value property, for when driver is unloaded or there is an
>    error or the sensor reading is otherwise not valid.  We could add
>   this to phosphor-hwmon at the same time.
>   (I think this was mentioned on the list before).

Yes, this is where we've used std::nan, I'm not sure if that made it to 
all sensors as it's not tested very much. I know the fans do this.

> 
> We would definitely of course work with you on the best way to
> accomplish these, and I know #6 needs more discussion on if
> this is something we want to do in OpenBMC, though I thought
> I remembered an earlier discussion where it was popular.
> 
> Thanks,
> Matt
