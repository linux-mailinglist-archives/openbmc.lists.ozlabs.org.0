Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4C64C07A3
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 03:10:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3KJS25sgz30Q9
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 13:10:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aYT1SG35;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aYT1SG35; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3KJ32hysz30LQ
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 13:10:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645582228; x=1677118228;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p+m9SzGszCnmt2gOkAb6IjrUxfpQUFmo4ZzujUB6obY=;
 b=aYT1SG353enmJRHGnJsAy/BLvrpeqxUcz5M6kRrSZqrHoQfKBtzCsM1Z
 KlsOUcej0lPP0RaeNe9IBLO2+cjQ1bQOSVx7qc86x/VjCJs36l+6+GSt0
 nEq+xe54Ch1Tc3xLxs8+dvxfaF4mvAJTeAx/TAbqpgz+svsaVwAZPnJY/
 DxXloxQTWlupStpssTNCnszqEkMw7zDERNdKBNI0i94ZHNIN7yTHNwF/J
 UbQno0S8PqpxQ+X7iBnFMBJ5qflGD29NENVUIbYSjGUDnTDxnF5KucDqp
 hulrEHr+g/g7HaRHq3c6F4X+L1ZvEFMbMH3yUHEB20crmbFwPrq/HZ55d Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338299912"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="338299912"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 18:09:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="508242293"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.30.73])
 ([10.255.30.73])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 18:09:21 -0800
Message-ID: <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
Date: Wed, 23 Feb 2022 10:09:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Checking for network online
Content-Language: en-US
To: Johnathan Mantey <johnathanx.mantey@intel.com>,
 Lei Yu <yulei.sh@bytedance.com>, Jeremy Kerr <jk@codeconstruct.com.au>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I think a solution is to set RequiredForOnline=no (https://www.freedesktop.org/software/systemd/man/systemd.network.html#RequiredForOnline=) in all network interface config. This option skips the interface when running systemd-networkd-wait-online.service. Canonical netplan (used in ubuntu server) also uses this option to skip the online check for given interface (https://github.com/canonical/netplan/blob/main/src/networkd.c#L636-L639).

I'll submit a patch to phosphor-networkd later.

On 2022-02-19 00:11, Johnathan Mantey wrote:
> Reading the --any switch in the systemd-networkd-wait-online man page doesn't look like it would be helpful. That flag permits the service to move on when one of the NICs achieves 'online' functionality. In the case of a NIC w/o a cable connection 'online' never happens. Thus the default 120 second timeout is still going to elapse, BMC ready is going to be held off, BIOS is going to delay completion (in our BIOS), and an error message is still going to be logged.
> 
> It appears, based on comments so far, that my best way forward with the current implementation of wait-online is to assign "--timeout <number-smaller-than-120> -q" to reduce the amount of time for testing the NIC state, and to never log an error because the NIC was unplugged.
> 
> Gating on operational state, and issuing --ignore flags didn't work, leaving a large blunt instrument for a solution.
> 
> On 2/17/22 18:29, Lei Yu wrote:
>> On Fri, Feb 18, 2022 at 8:11 AM Jeremy Kerr<jk@codeconstruct.com.au>  wrote:
>>> Hi Johnathan,
>>>
>>>> Issue: systemd-networkd-wait-online.service stalls for 120 seconds
>>>> when the managed NICs do not have a network connection.
>>>>
>>>> TLDR: Should OpenBMC remove systemd-networkd-wait-online.service
>>>> universally?
>>> Probably not, it's required to implement network-online,target, which
>>> is standard, and may be referred to by arbitrary packages.
>>>
>>> There's some good background on the issues you're experiencing here:
>>>
>>>   https://www.freedesktop.org/wiki/Software/systemd/NetworkTarget/
>>>
>>> in short: most services should be able to start before network-
>>> online.target, and be able to adapt to changes in network configuration
>>> after that point.
>>>
>>> For your specific issue there:
>>>
>>>> Issues: This service blocks entry to multi-user.target.
>>>> phosphor-state-manager uses multi-user.target to report the BMC is
>>>> ready to use.
>>>> This is reported via IPMI Get Device ID.
>>> That sounds like more of an issue of whether that reported state
>>> actually represents the expected BMC state...
>> We have an internal "override" config to start
>> systemd-networkd-wait-online with --any option:
>>
>>   # override.conf
>>   [Service]
>>   ExecStart=
>>   ExecStart=/lib/systemd/systemd-networkd-wait-online --any
>>
>> This is mostly about fixing the QEMU CI.
>> In the real environment the network *should* be up and online so the
>> above makes the systemd-networkd-wait-online starts OK in both cases.
> 
