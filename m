Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8D6BFB71
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 00:49:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fVVH3TVRzDqyl
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 08:49:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fVTT6SyGzDqxf
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 08:48:39 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2019 15:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,553,1559545200"; d="scan'208";a="273618910"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga001.jf.intel.com with ESMTP; 26 Sep 2019 15:48:36 -0700
Subject: Re: Is it required that regulator sensors implement threshold
 interfaces?
To: Shawn McCarney <shawnmm@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <0519f084-a20d-a338-2875-c5a4110e02ff@linux.vnet.ibm.com>
 <1dd65323-231d-8a18-40d4-a0e00c48a184@intel.com>
 <ee061e94-a469-9f1c-b207-86acfbdfbafd@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <b38ab0a4-d34e-0965-f0a4-03ea198e22c9@intel.com>
Date: Thu, 26 Sep 2019 15:48:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ee061e94-a469-9f1c-b207-86acfbdfbafd@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
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

On 9/26/19 2:00 PM, Shawn McCarney wrote:
> Hi Ed.  Thanks for the information and feedback.
> 
> On 9/26/2019 3:07 PM, Ed Tanous wrote:
>> For some implementations, these are used to appropriately scale the SDR,
>> and provide the redfish interfaces for those properties.
> 
> What is SDR?  Sorry I'm not familiar with that acronym.

Section 33 of the IPMI specification.  Type 1 record, M and B values are
what you're looking for.

> 
>> I'm not really following why you wouldn't want to implement
>> those.
> 
> The problem is one of scale.  Some of the systems where my application
> will run may have 30+ voltage rails.  30 rails * 9 sensors per rail =
> 270 MinValues and MaxValues.  I'd rather not ask the hardware engineers
> to provide 540 data values unless absolutely necessary.

You'll already need to ask the hardware engineers for the voltage
scaling for all of these rails, so you already have a scale problem.
The nice thing about voltage is that in most cases, the minimum is 0
volts, and the max is resistor bridge scaling factor X voltage range of
the ADC (in the Aspeed case, 3.3V).  You could pretty easily just do it
that way and have no real issues.

Alternatively, ADCsensor in dbus-sensors does the above math for you at
runtime to build those values, but I'm not sure if IBM platforms are on
that yet.

> 
>>    They don't have to be exact, and there are plenty of cases where
>> they are set to INT8_MAX and INT8_MIN.  Usually you will know based on
>> the spec you're implementing if the values fall into a
>> uint8/int8/int16/uint16 range, and you can just put in the specified
>> range limits.
> 
> That's probably a better approach that setting both min and max to 0.  I
> was just wondering if anything (especially IPMI) would break if I set
> all the sensor min/max values to INT16_MIN/INT16_MAX.

Nothing should break.  That's perfectly legal, but some users might have
resolution issues, because INT16MAX is going to pick a really high M
value, which is going to reduce your IPMI 8 bit resolution.
