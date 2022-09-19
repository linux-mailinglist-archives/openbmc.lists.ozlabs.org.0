Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9F5BC3FA
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 10:06:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWHM55VfHz304n
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 18:06:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N1ys1HJZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N1ys1HJZ;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWHLh4cgKz2xJ8
	for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2022 18:06:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663574780; x=1695110780;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xCWOlIVedeUSMrJDrVauyFgN/2kkkiDl5exTSJm4CdI=;
  b=N1ys1HJZfiwP99H4HenCKe5UaxDz/8Wo/UXxQPkYDXQxIbbNyb1uzm0m
   hK6TCz+30uD7pjH+S7OCwfNcEN7JAl6NxKHQ0zhyZYn/+hVpUC09j60sd
   WVaO1+eVZfnMDjquo94f4br83IcJVO84sicJhA5u2fq0aoY2m+9Enc9BR
   tGhJw+GkSzaC9mGX7VApsDeJ1MQAGS7CArZ6+lhHgfYZxo6YT/GpuvJlA
   yHGe1+uDNzwPoqoP8Znf6TuOq0JbHgMDJKuqtR5NEPRZGYGQP4S1We+hq
   X8hk9sBUrAW26Bb2RcrwUtj/yWzhI6hddqmED4H8T+p3mHKdCoSYyumjQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="279066023"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="279066023"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 01:06:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="707473135"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.30.38]) ([10.255.30.38])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 01:06:12 -0700
Message-ID: <dbf54143-b514-5155-ac2a-9f934e9dd8bc@linux.intel.com>
Date: Mon, 19 Sep 2022 16:06:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] net/ncsi: Add Intel OS2BMC OEM command
Content-Language: en-US
To: Paul Fertser <fercerpav@gmail.com>
References: <20220909025716.2610386-1-jiaqing.zhao@linux.intel.com>
 <YxrWPfErV7tKRjyQ@home.paul.comp>
 <8eabb29b-7302-d0a2-5949-d7aa6bc59809@linux.intel.com>
 <Yxrun9LRcFv2QntR@home.paul.comp>
 <36c12486-57d4-c11d-474f-f26a7de8e59a@linux.intel.com>
 <YyNIPjNX9MCI3zkK@home.paul.comp>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <YyNIPjNX9MCI3zkK@home.paul.comp>
Content-Type: text/plain; charset=UTF-8
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
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2022-09-15 23:43, Paul Fertser wrote:
> Hello,
> 
> On Tue, Sep 13, 2022 at 10:12:06AM +0800, Jiaqing Zhao wrote:
>> On 2022-09-09 15:43, Paul Fertser wrote:
>>> On Fri, Sep 09, 2022 at 03:34:53PM +0800, Jiaqing Zhao wrote:
>>>>> Can you please outline some particular use cases for this feature?
>>>>>
>>>> It enables access between host and BMC when BMC shares the network connection
>>>> with host using NCSI, like accessing BMC via HTTP or SSH from host. 
>>>
>>> Why having a compile time kernel option here more appropriate than
>>> just running something like "/usr/bin/ncsi-netlink --package 0
>>> --channel 0 --index 3 --oem-payload 00000157200001" (this example uses
>>> another OEM command) on BMC userspace startup?
>>>
>>
>> Using ncsi-netlink is one way, but the package and channel id is undetermined
>> as it is selected at runtime. Calling the netlink command on a nonexistent
>> package/channel may lead to kernel panic.
> 
> That sounds like a bug all right. If you can reproduce, it's likely
> the fix is reasonably easy, please consider doing it.

It cannot be reproduced stably and varies on NICs, I'm still investigating it,
it might be some NIC firmware issue. 

>> Why I prefer the kernel option is that it applies the config to all ncsi
>> devices by default when setting up them. This reduces the effort and keeps
>> compatibility. Lots of things in current ncsi kernel driver can be done via
>> commands from userspace, but I think it is not a good idea to have a driver
>> resides on both kernel and userspace.
> 
> How should the developer decide whether to enable this compile-time
> option for a platform or not? If it's always nice to have why not
> add the code unconditionally? And if not, are you sure kernel compile
> time is the right decision point? So far I get an impression a sysfs
> runtime knob would be more useful.

Disabling Host-BMC traffic ensures the isolation between Host network and BMC's
management network, some developers/vendors may prefer disable it for security
concerns. Though having a runtime knob in sysfs would be useful, setting the
default behavior in kernel config is also useful from my point.
