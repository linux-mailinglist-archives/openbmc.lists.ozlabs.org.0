Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB6285152
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 20:02:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5QKn2FlMzDqJL
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 05:02:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5QJv0BF4zDqDP
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 05:01:49 +1100 (AEDT)
IronPort-SDR: DHTaKvKtGWpGGbniQgkAhb1kJtI1+TsUZYLsUCzi/v4i1LO/xqDo2eMCR4otpg+iyZzDJInnzN
 Dy7o/XJhdEDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161990548"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="161990548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 11:01:39 -0700
IronPort-SDR: xRME3X+wvdQ8tnZ1YA8YpIwMIfqq1f5fohlOR2RUD331a0cZ2B20U+v3fCOVKCSeCejrbWqIvF
 z2IG/TToYuMg==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="315767136"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.255.228.213])
 ([10.255.228.213])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 11:01:39 -0700
Subject: Re: [PATCH 2/2] peci-cputemp: label CPU cores from zero instead of one
To: Joel Stanley <joel@jms.id.au>, Zev Weiss <zev@bewilderbeest.net>
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-3-zev@bewilderbeest.net>
 <51512c43-ee82-17b5-71c4-35849b1f0922@linux.intel.com>
 <20200928195423.3kftebgltdmpronq@hatter.bewilderbeest.net>
 <28b289f1-0ef0-2432-f71b-0ca4420a39e2@linux.intel.com>
 <20200928210917.idrpngkpduwxe2rf@hatter.bewilderbeest.net>
 <b79f8dfb-8257-943b-3c2b-062840aa2515@linux.intel.com>
 <20200928220124.k47kocdvi2ahgtc6@hatter.bewilderbeest.net>
 <CACPK8XdzjEhxKHbajMXbMpktOAhm_xFqUW7rY67WdmQ4p8PXPg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f4185310-6695-75ee-df3b-41b89b0baac3@linux.intel.com>
Date: Tue, 6 Oct 2020 11:01:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdzjEhxKHbajMXbMpktOAhm_xFqUW7rY67WdmQ4p8PXPg@mail.gmail.com>
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
Cc: Jason M Biils <jason.m.bills@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

On 9/28/2020 11:00 PM, Joel Stanley wrote:
> On Mon, 28 Sep 2020 at 22:02, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> On Mon, Sep 28, 2020 at 04:32:31PM CDT, Jae Hyun Yoo wrote:
>>>> Oh I see -- I had thought you were referring to other existing hwmon
>>>> drivers in the kernel.
>>>>
>>>> As far as I can tell, all those instances appear to be numbering CPU
>>>> *sockets* though -- which as Jason mentioned in a call earlier today
>>>> I gather is done to line up with motherboard silkscreen labeling.
>>>> But in the code in question here we're labeling *cores* within a
>>>> given socket, which I don't see arising anywhere in any existing
>>>> entity-manager configs.  So I'm still unclear on why we want to use
>>>> one-based indexing here instead of zero-based -- I'd think we'd want
>>>> the PECI driver to match the PECI spec?
>>>
>>> PECI driver uses zero-based index for PECI command handling but label is
>>> user facing stuff which shouldn't make confusion to users. We can modify
>>> driver like you did in this patch and previous driver also used
>>> zero-based indexing but I changed it to natural number based indexing
>>> to avoid confusion between driver labels and dbus-sensors names.
>>> Any specific reason for the zero-based indexing? Any benefit?
>>>
>>
>> [Re-adding CCs...]
> 
> Thanks. Please keep the discussion on the list.
> 
>>
>> Well, as I see it basically just consistency with a larger set of
>> things.  Most other related numbering schemes I'm aware of are
>> zero-based -- userspace tools like 'taskset' and 'lscpu', system APIs
>> like the <sched.h> CPU_SET() routines, and the kernel's own numbering
>> (e.g. what's shown in /proc/cpuinfo) all number processors starting from
>> zero, so dbus-sensors seems kind of like the odd one out there.
>> (Personally I'd be fully in support of changing it to be zero-based as
>> well, though I have no idea offhand about how distruptive a change that
>> would be.)
>>
>> It also seems pretty OpenBMC-specific, whereas I'd expect we want to aim
>> for greater generality in things going into mainline.
> 
> Agreed. The hwmon numbering varies; some attributes are zero indexed
> and some start at 1. More commonly we start counting from zero in the
> kernel, so I would expect PECI to do the same.
> 
> If there's some userspace that depends on the behaviour of these out
> of tree PECI patches, then that userspace will need to change. This
> reminds us why the project prefers patches exposing userspace ABI are
> merged to mainline first.

Okay. Not a big deal. The coretemp module for local CPU also uses zero
starting label index for core numbers so better match up. Thanks for
your patch.

Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

