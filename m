Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ADB1B4399
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 13:57:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496f7M302yzDqlD
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 21:57:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496f6B3YxmzDqdl
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 21:56:18 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: dbus-sensors
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
Date: Wed, 22 Apr 2020 07:56:14 -0400
Message-Id: <ED37CD16-CFB6-4D78-BF6E-062849051D02@fuzziesquirrel.com>
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
 <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
To: James Feist <james.feist@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 5:54 PM, James Feist <james.feist@linux.intel.com> wrote:

> On 4/21/2020 12:35 PM, Matt Spinler wrote:
>> Hi James,
>> We're looking into using dbus-sensors(HwmonTemp and PSU) in the future=
,
>> but would need to make a few changes to fit our requirements.  Was =20
>> wondering
>> what you'd think of the following:
>> 1. Check if a sensor has a _fault sysfs file, and if it does and it
>>    is nonzero, set the Functional property on the OperationalStatus
>>    interface to false (and/or maybe 6 below)
> Sounds ok.
>
>> 2. After the 10 failed reads, instead of just setting the sensor to 0
>>    also make a D-Bus call to create a phosphor-logging event log and s=
et
>>    the OperationalStatus sensor to false.
>
> Sounds ok.
>
>> 3. After creating this event log, make sure not to do it again until
>>    main power is cycled.
>
> I'd rather this be until the status goes OK again.

We have user-experience requirements that the server administrator must b=
e =20
=E2=80=9Cnagged=E2=80=9D in this fashion when something is broken like th=
is.  Could the =20
behavior be selectable via build switch?  Any other ideas on how to =20
accommodate both behaviors?

>
>> 4. If not already supported (was unsure), be able to find an
>>    _input file based on a value it has in the corresponding _label fil=
e.
>
> PSU sensor does this, hwmontemp does it by index.

I think the question here was can we change the temp sensor implementatio=
n =20
to do that also?

>> 5. We have a case where a driver isn't loaded with power off, so someh=
ow
>>    we still need the sensors to stay on D-Bus when off (and show them
>>    as not available).
>
> All sensors are on d-bus all the time, its based on the EM config.
>
>> 6. Maybe add a new property to Sensor.Value on the validity
>>    of the value property, for when driver is unloaded or there is an
>>    error or the sensor reading is otherwise not valid.  We could add
>>   this to phosphor-hwmon at the same time.
>>   (I think this was mentioned on the list before).
>
> Yes, this is where we've used std::nan, I'm not sure if that made it to=
 =20
> all sensors as it's not tested very much. I know the fans do this.
>
>> We would definitely of course work with you on the best way to
>> accomplish these, and I know #6 needs more discussion on if
>> this is something we want to do in OpenBMC, though I thought
>> I remembered an earlier discussion where it was popular.
>> Thanks,
>> Matt

