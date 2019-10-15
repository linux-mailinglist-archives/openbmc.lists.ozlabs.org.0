Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB22D8460
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 01:20:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tBH60z4RzDqP1
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 10:20:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tBGV6fSVzDqP1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 10:19:45 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 16:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,301,1566889200"; d="scan'208";a="370622844"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 15 Oct 2019 16:19:43 -0700
Subject: Re: The type of sensor value in redfish should be double or int64?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed.tanous@intel.com>
References: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
 <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
 <818E67A7-4D22-4E13-AD37-99E846E7E17B@fuzziesquirrel.com>
 <5e8c2ba2-5e82-f1e3-6524-46278c631553@intel.com>
 <6E7F040B-0DCA-480F-89A1-5CA197C1FCC4@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <efcd3e38-5ec8-3f3b-460d-df14c3144ff6@linux.intel.com>
Date: Tue, 15 Oct 2019 16:19:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <6E7F040B-0DCA-480F-89A1-5CA197C1FCC4@fuzziesquirrel.com>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/15/19 4:15 PM, Brad Bishop wrote:
> at 6:19 PM, Ed Tanous <ed.tanous@intel.com> wrote:
> 
>> On 10/15/19 12:04 PM, Brad Bishop wrote:
>>> Is it possible to get bmcweb supporting patch with double and int?  On
>>> the surface this seems like the shortest path to enabling Carol.
>>
>> Unless phosphor-hwmon is patched to support settable sensors, I don't
>> think there's a good reason to add support to bmcweb.
> 
> Ok.  A couple different questions then.
> 
> What does it mean to be settable?  phosphor-hwmon implements 
> Sensor.Value and, (in violation of the interface documentation), doesn’t 
> prevent an external application from writing to the properties in it.
> 
> I assumed the assertion that phosphor-hwmon doesn’t provide settable 
> sensors is because the value set by an external application doesn’t 
> stick?  The phosphor-hwmon application logic will write over it the next 
> time it polls the hwmon device.
> 
> So what does dbus-sensors do for hardware sensors?  Does the application 
> ignore the hardware state after being patched via Redfish?

Yes until the sensor is reset.


> 
>> With that said,
>> it's just software, it could certainly be done.  Someone would need to
>> sort out how to manage the scale factor, as a Redfish PATCH request
>> doesn't have a concept of scale, and operates on a float, so you'd have
>> to do some software handholding to convert the value to something
>> appropriate before it was scaled to the int64.
>>
>> With that said, all of this seems like a lot of work.
> 
> I don’t know of any alternatives that are less work.  If there are some, 
> I’d love to hear about them.  There were several years of OpenBMC 
> development against the integer interface signature before double became 
> a problem - as Patrick mentioned - undoing all that will not be trivial.
> 
>>
>> Just to clarify in case anyone isn't clear, the /xyz/* and /org/* type
>> REST handlers do support SetProperty for int and double, and introspects
>> the daemon to determine which one should be used.  So far as I'm aware,
>> the only thing non-functional is a Redfish patch of a sensor, as it's a
>> bit more complex to do properly.
> 
> I had a look at the Sensor schema in the latest Resource and Schema 
> guide and the sensor reading property is read only.  Why do we even 
> allow it to be patched?
> 

The intention was for this to only be in manufacturing test mode (not 
sure if that is true today or not). So under a normal user, it would be 
read only.

>>
>> -Ed
> 
