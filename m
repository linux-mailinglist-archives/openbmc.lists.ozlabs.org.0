Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 730AF27B763
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 00:21:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0cSb3LqjzDqNG
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 08:21:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0cRm4xHvzDqNG
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 08:21:07 +1000 (AEST)
IronPort-SDR: zWPd7V0jk/AmOgoJ5LNXVwhvpPZJV900kqVpusf+nEsCm6vOrM6RGQYNy7rNRMaCzHjjgJiTqF
 VUPz7CIuyKmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="159411783"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="159411783"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 15:21:02 -0700
IronPort-SDR: 5U1d/Y+zqdt0drjSRx2UgXH37xuSItGF4tDYSu2NHgL17HD8CyXMmgO7CgASy9tGIyjX++5g6P
 WDI5TQltVjhQ==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="415153519"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.254.88.56])
 ([10.254.88.56])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 15:21:01 -0700
Subject: Re: [PATCH 2/2] peci-cputemp: label CPU cores from zero instead of one
To: Zev Weiss <zev@bewilderbeest.net>
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-3-zev@bewilderbeest.net>
 <51512c43-ee82-17b5-71c4-35849b1f0922@linux.intel.com>
 <20200928195423.3kftebgltdmpronq@hatter.bewilderbeest.net>
 <28b289f1-0ef0-2432-f71b-0ca4420a39e2@linux.intel.com>
 <20200928210917.idrpngkpduwxe2rf@hatter.bewilderbeest.net>
 <b79f8dfb-8257-943b-3c2b-062840aa2515@linux.intel.com>
 <20200928220124.k47kocdvi2ahgtc6@hatter.bewilderbeest.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <ca07b326-f65a-4b59-47a1-15f98a2f3a40@linux.intel.com>
Date: Mon, 28 Sep 2020 15:20:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928220124.k47kocdvi2ahgtc6@hatter.bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 9/28/2020 3:02 PM, Zev Weiss wrote:
> On Mon, Sep 28, 2020 at 04:32:31PM CDT, Jae Hyun Yoo wrote:
>>> Oh I see -- I had thought you were referring to other existing hwmon 
>>> drivers in the kernel.
>>>
>>> As far as I can tell, all those instances appear to be numbering CPU 
>>> *sockets* though -- which as Jason mentioned in a call earlier today 
>>> I gather is done to line up with motherboard silkscreen labeling. But 
>>> in the code in question here we're labeling *cores* within a given 
>>> socket, which I don't see arising anywhere in any existing 
>>> entity-manager configs.  So I'm still unclear on why we want to use 
>>> one-based indexing here instead of zero-based -- I'd think we'd want 
>>> the PECI driver to match the PECI spec?
>>
>> PECI driver uses zero-based index for PECI command handling but label is
>> user facing stuff which shouldn't make confusion to users. We can modify
>> driver like you did in this patch and previous driver also used
>> zero-based indexing but I changed it to natural number based indexing
>> to avoid confusion between driver labels and dbus-sensors names.
>> Any specific reason for the zero-based indexing? Any benefit?
>>
> 
> [Re-adding CCs...]
> 
> Well, as I see it basically just consistency with a larger set of 
> things.  Most other related numbering schemes I'm aware of are 
> zero-based -- userspace tools like 'taskset' and 'lscpu', system APIs 
> like the <sched.h> CPU_SET() routines, and the kernel's own numbering 
> (e.g. what's shown in /proc/cpuinfo) all number processors starting from 
> zero, so dbus-sensors seems kind of like the odd one out there. 
> (Personally I'd be fully in support of changing it to be zero-based as 
> well, though I have no idea offhand about how distruptive a change that 
> would be.)
> 
> It also seems pretty OpenBMC-specific, whereas I'd expect we want to aim 
> for greater generality in things going into mainline.

First of all, it's for labeling of sysfs interfaces in hwmon subsystem
which monitors target CPUs, not for local CPUs you mentioned. As you can
see in hwmon subsystem, property indexing starts from 1. Also, we have
used this natural number indexing traditionally for all Intel BMCs we
made so far, and it's also for keeping product value against
misreading of actual core numbers. If you don't have any critical or
blocking issue, I need to keep the current indexing as is.

Thanks,
Jae


