Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D404372E8
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 09:39:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbGSW6j6kz3bmk
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 18:39:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=GY2tE09M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=GY2tE09M; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbGS83dKXz2xY2
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 18:38:47 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id BBD643F5;
 Fri, 22 Oct 2021 00:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634888325;
 bh=kLThclivvucdLvqBkWXzBYC9PcfYiKpUKEDKsLyPwD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GY2tE09MyBfvWd3WTZAsuQi6XkbgwBKuEkwCUxl1EWLlDdEoIm+gkWpZI4QvDQ0WJ
 ON2/OtO9q3/7K+sPG8xvQBUu30Uj0bYfAISTDmpOgKWuNQpM9ASBJHx7iyvG1UodCX
 kGMU27vb/jvcgQHwu2A6F8DF2P6gIxLW4kXFtrK0=
Date: Fri, 22 Oct 2021 00:38:40 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/5] of: base: add function to check for status =
 "reserved"
Message-ID: <YXJqgNDOaNLzTg0T@hatter.bewilderbeest.net>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <20211022020032.26980-2-zev@bewilderbeest.net>
 <YXJdi3IBzaqmSZ9b@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YXJdi3IBzaqmSZ9b@kroah.com>
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
Cc: devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 21, 2021 at 11:43:23PM PDT, Greg Kroah-Hartman wrote:
>On Thu, Oct 21, 2021 at 07:00:28PM -0700, Zev Weiss wrote:
>> Per v0.3 of the Devicetree Specification [0]:
>>
>>   Indicates that the device is operational, but should not be used.
>>   Typically this is used for devices that are controlled by another
>>   software component, such as platform firmware.
>>
>> One use-case for this is in OpenBMC, where certain devices (such as a
>> BIOS flash chip) may be shared by the host and the BMC, but cannot be
>> accessed by the BMC during its usual boot-time device probing, because
>> they require additional (potentially elaborate) coordination with the
>> host to arbitrate which processor is controlling the device.
>>
>> Devices marked with this status should thus be instantiated, but not
>> have a driver bound to them or be otherwise touched.
>>
>> [0] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  drivers/of/base.c  | 56 +++++++++++++++++++++++++++++++++++++++-------
>>  include/linux/of.h |  6 +++++
>>  2 files changed, 54 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 0ac17256258d..3bd7c5b8a2cc 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -580,14 +580,16 @@ int of_machine_is_compatible(const char *compat)
>>  EXPORT_SYMBOL(of_machine_is_compatible);
>>
>>  /**
>> - *  __of_device_is_available - check if a device is available for use
>> + * __of_device_check_status - check if a device's status matches a particular string
>>   *
>> - *  @device: Node to check for availability, with locks already held
>> + * @device: Node to check status of, with locks already held
>> + * @val: Status string to check for, or NULL for "okay"/"ok"
>>   *
>> - *  Return: True if the status property is absent or set to "okay" or "ok",
>> - *  false otherwise
>> + * Return: True if status property exists and matches @val, or either "okay"
>> + * or "ok" if @val is NULL, or if status property is absent and @val is
>> + * "okay", "ok", or NULL.  False otherwise.
>>   */
>> -static bool __of_device_is_available(const struct device_node *device)
>> +static bool __of_device_check_status(const struct device_node *device, const char *val)
>>  {
>>  	const char *status;
>>  	int statlen;
>> @@ -596,17 +598,35 @@ static bool __of_device_is_available(const struct device_node *device)
>>  		return false;
>>
>>  	status = __of_get_property(device, "status", &statlen);
>> -	if (status == NULL)
>> -		return true;
>> +	if (!status) {
>> +		/* a missing status property is treated as "okay" */
>> +		status = "okay";
>> +		statlen = strlen(status) + 1; /* property lengths include the NUL terminator */
>> +	}
>>
>>  	if (statlen > 0) {
>> -		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
>> +		if (!val && (!strcmp(status, "okay") || !strcmp(status, "ok")))
>> +			return true;
>> +		else if (val && !strcmp(status, val))
>
>
>Ick, where is this string coming from?  The kernel or userspace or a
>device tree?  This feels very wrong, why is the kernel doing parsing
>like this of different options that all mean the same thing?
>

Which string do you mean by "this string"?  'status' comes from a 
property of the device tree node; 'val' will be one of a small set of 
string constants passed by the caller.  Accepting either spelling of 
"okay"/"ok" has been in place since 2008 (commit 834d97d45220, 
"[POWERPC] Add of_device_is_available function"); using NULL as a 
shorthand for those two strings was a suggestion that came up in review 
feedback on a previous incarnation of these patches 
(https://lore.kernel.org/openbmc/CAL_Jsq+rKGv39zHTxNx0A7=X4K48nXRLqWonecG5SobdJq3yKw@mail.gmail.com/T/#u).

>
>>  			return true;
>>  	}
>>
>>  	return false;
>>  }
>>
>> +/**
>> + * __of_device_is_available - check if a device is available for use
>> + *
>> + * @device: Node to check for availability, with locks already held
>> + *
>> + * Return: True if the status property is absent or set to "okay" or "ok",
>> + * false otherwise
>> + */
>> +static bool __of_device_is_available(const struct device_node *device)
>> +{
>> +	return __of_device_check_status(device, NULL);
>> +}
>> +
>>  /**
>>   *  of_device_is_available - check if a device is available for use
>>   *
>> @@ -628,6 +648,26 @@ bool of_device_is_available(const struct device_node *device)
>>  }
>>  EXPORT_SYMBOL(of_device_is_available);
>>
>> +/**
>> + * of_device_is_reserved - check if a device is marked as reserved
>> + *
>> + * @device: Node to check for reservation
>> + *
>> + * Return: True if the status property is set to "reserved", false otherwise
>> + */
>> +bool of_device_is_reserved(const struct device_node *device)
>> +{
>> +	unsigned long flags;
>> +	bool res;
>> +
>> +	raw_spin_lock_irqsave(&devtree_lock, flags);
>> +	res = __of_device_check_status(device, "reserved");
>> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>
>Why is this a "raw" spinlock?
>

devtree_lock being a raw_spinlock_t appears to date from commit 
d6d3c4e65651 ("OF: convert devtree lock from rw_lock to raw spinlock"); 
"required for preempt-rt", according to Thomas Gleixner's commit 
message.

>Where is this status coming from?
>

This would be specified in a DT node, e.g. via something like:

   &somedev {
     compatible = "foobar";
     status = "reserved";
     /* ... */
   };

>> +
>> +	return res;
>> +}
>> +EXPORT_SYMBOL(of_device_is_reserved);
>
>EXPORT_SYMBOL_GPL()?
>

Its closest existing sibling, of_device_is_available(), is a plain 
EXPORT_SYMBOL(); if we want to convert things more broadly that'd be 
fine with me, but having one be GPL-only and the other not seems like 
it'd be a bit confusing and inconsistent?


Thanks,
Zev

