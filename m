Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6205B7E22
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 03:11:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MS2NM2P4yz30Bb
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 11:11:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jRwPwmol;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jRwPwmol;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MS2Mv625dz2yxd
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 11:11:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663117868; x=1694653868;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4hhTqP0/V+vCzPJZLXM7LRMMWx5tpU/aTziqBSnlTo8=;
  b=jRwPwmolaZeEtAw8Fh+C8nF+RogeEcdjXLq04BIGxsRXFUGkSca6Ogwp
   PQdoOhcNPMhGK7A2xv1dJDkJN+qkOUA4jSb+r22YlMJoMxFPmtMxzt1q7
   tipykv0s/o/2BmnrDAXheW3USOkcGhOZEUZfl0ial1bSU/uq7bE0YCUSn
   fqMzc3Ta5RL/bQCS75HajSeQuvKd9iRnVwcUC6iQB9npYxHFeM+38DDlq
   gkmtCkHMAyW+l2Q7+o78RXNJcC/TUPLfm8dr0n1bHgCFLm4MiTxIpTDe8
   HM5RS9VlxRQ4bUFDEiVyTaWn2JzqDJ7DEOY9XOnh4qa4jKOTajGAptri7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="285341489"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="285341489"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 18:11:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="567809005"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.29.56]) ([10.255.29.56])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 18:10:59 -0700
Message-ID: <5346c9f6-1b7e-3c65-80a7-b06408bd95f3@linux.intel.com>
Date: Wed, 14 Sep 2022 09:10:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] net/ncsi: Add Intel OS2BMC OEM command
Content-Language: en-US
To: Sam Mendoza-Jonas <sam@mendozajonas.com>,
 Paul Fertser <fercerpav@gmail.com>
References: <20220909025716.2610386-1-jiaqing.zhao@linux.intel.com>
 <YxrWPfErV7tKRjyQ@home.paul.comp>
 <8eabb29b-7302-d0a2-5949-d7aa6bc59809@linux.intel.com>
 <Yxrun9LRcFv2QntR@home.paul.comp>
 <36c12486-57d4-c11d-474f-f26a7de8e59a@linux.intel.com>
 <F7F5AD32-901B-440A-8B1D-30C4283F18CD@mendozajonas.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <F7F5AD32-901B-440A-8B1D-30C4283F18CD@mendozajonas.com>
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2022-09-13 21:35, Sam Mendoza-Jonas wrote:
> On September 13, 2022 3:12:06 AM GMT+01:00, Jiaqing Zhao <jiaqing.zhao@linux.intel.com> wrote:
>>
>>
>> On 2022-09-09 15:43, Paul Fertser wrote:
>>> Hello,
>>>
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
> If so, that would be a bug :)

Yes but I haven't found the root cause so far, it only panics with some specific
NICs I remember.

>>
>> Why I prefer the kernel option is that it applies the config to all ncsi
>> devices by default when setting up them. This reduces the effort and keeps
>> compatibility. Lots of things in current ncsi kernel driver can be done via
>> commands from userspace, but I think it is not a good idea to have a driver
>> resides on both kernel and userspace.
> 
> BMCs are of course in their own world and there's already some examples of the config option, but how would a system owner be able to disable this without reflashing the BMC?

Given that ncsi driver is a driver binding to the PHY driver, it seems to be unable
to make it a module and have some module options. So far build option seems to be
the only way. Maybe in future sysfs entries can be added to make it configurable at
runtime.
