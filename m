Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE862EC5F0
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 22:58:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB3C16DvPzDqZC
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 08:58:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB3B91ycYzDqGX
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 08:57:16 +1100 (AEDT)
IronPort-SDR: Qh3su6O3CY0jLNOXoyx9cpqXckW8OSd5RXeAAcxr9wbYON6LwiPdiorNbnuzuQTm96lehYAi0E
 Db6++4e5kpDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="156529248"
X-IronPort-AV: E=Sophos;i="5.79,328,1602572400"; d="scan'208";a="156529248"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 13:57:12 -0800
IronPort-SDR: bDc1opVAtzLBQe9KQg13d16bX4N0AVt9r0V/llsEiJy1uVO1JtWw7Nv4ipJWJExpruynlyaj1u
 6FeTkHkZaaJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,328,1602572400"; d="scan'208";a="351013828"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jan 2021 13:57:12 -0800
Received: from [10.212.242.96] (jmbills-MOBL.amr.corp.intel.com
 [10.212.242.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 20E04580409
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 13:57:12 -0800 (PST)
Subject: Re: GPIO pin is reset to default value after release.
To: openbmc@lists.ozlabs.org
References: <6ab96a24-70b6-c6a0-39f4-ab1d439aca9c@amperemail.onmicrosoft.com>
 <0ff1c69a-a6c8-462e-86d4-a08d981b80d2@beta.fastmail.com>
 <a25a3990-b180-9579-b934-62f4d3a53e3b@amperemail.onmicrosoft.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <a2a28e57-7335-92cf-35da-bfd24223826a@linux.intel.com>
Date: Wed, 6 Jan 2021 13:57:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a25a3990-b180-9579-b934-62f4d3a53e3b@amperemail.onmicrosoft.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/5/2021 6:14 PM, Thu Nguyen wrote:
> On 1/6/21 08:12, Andrew Jeffery wrote:
>>
>> On Wed, 6 Jan 2021, at 02:57, Thu Nguyen wrote:
>>> Hi,
>>>
>>>
>>> Current I'm using two difference GPIO libs gpiod and gpioplus to setting
>>> GPIO pins.
>>>
>>> I can set the GPIO pin to expected value in a service. And GPIO keep
>>> unchanging when the service is running.
>>>
>>> But when the service is exited, the GPIO handler is released then GPIO
>>> is reset to default value.
>>>
>>>
>>> Do we have any gpio lib which don't reset the GPIO when the handler is
>>> released?
>> No. This is a property of the GPIO chardev interface provided by the 
>> kernel. libgpiod makes the kernel interface a bit nicer to consume in 
>> user space, but isn't where this behaviour is contracted (i.e. any use 
>> of the chardev interface might result in this behaviour, libgpiod or 
>> otherwise).
>>
>> At the moment the way to get the behaviour you desire is to keep the 
>> line handle open.
> 
> Yes, This is what I did at this moment to keep the GPIO pin unchanged.
> 
> But the GPIO pin will be locked and no service can read that GPIO pins 
> when is is locked.
> 
>>
>> The deprecated approach is to use the sysfs interface instead, but 
>> that's strongly discouraged.
>>
>> That said, your problem is something I have on my to-do list to 
>> address with upstream. I'll Cc the openbmc list whenever I get to it.
> 
> I thought about a GPIO service which will create DBus servers and Dbus 
> method to set/get/release the GPIO pins and keep that GPIO pin unchanged 
> until next setting.
The approach that I have used is instead of treating the pin as a 
generic GPIO, treat it based on its function.

For example, if you have a GPIO that indicates something like a button 
press, instead of having a generic GPIO service that exposes that GPIO 
state on D-Bus, have a button service that exposes the state of that 
GPIO on D-Bus as the button state.

This can be easier to read from the D-Bus perspective and will let you 
keep the GPIO management in the applications that care about that GPIO.

Thanks,
-Jason

> 
> That service will handle and keep the gpio line. All of others openBmc 
> services will access GPIO thru that service.
> 
> It can use the same ways which phosphor-sel-logger do to provide 
> xyz.openbmc_project.Logging.IPMI service and function IpmiSelAddOem.
> 
>>
>> Cheers,
>>
>> Andrew
> 
> Cheers,
> 
> Thu Nguyen.
> 
