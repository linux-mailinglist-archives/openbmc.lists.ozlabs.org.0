Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EF1316C08
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 18:04:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbR2S3YtWzDwjK
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 04:04:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbR1d1ksNzDvWp
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 04:04:03 +1100 (AEDT)
IronPort-SDR: o8lC/R2NLmZBI4JaYIhgEY4htd4a17VOfl2I+a4hO1H6jRUTlysMv4gUH9yRaduCIN2J9ASru8
 af+uDZ2a4+pQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="169237103"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="169237103"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 09:03:15 -0800
IronPort-SDR: COhltNBq578t0O54NEP0fAcABfCxYCrJyh8wqKAOdywCdAlm4fjqMHGnF/tGIX9NQo6GqGPAz2
 cHuANpsm+YGA==
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="578473856"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.143.190])
 ([10.212.143.190])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 09:03:08 -0800
Subject: Re: Kernel moving to Linux v5.10, dropping PECI
To: Andrei Kartashev <a.kartashev@yadro.com>, openbmc@lists.ozlabs.org
References: <CACPK8XcCVmibRzOvrca87pzWzg0K5=ZBMeFQE7xorcLN8gxQdQ@mail.gmail.com>
 <fd4a04a5c1cc11589413fc44a27c863d600f9896.camel@yadro.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <155fb63f-539b-db7f-e513-d025d64cf3b3@linux.intel.com>
Date: Wed, 10 Feb 2021 09:03:07 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fd4a04a5c1cc11589413fc44a27c863d600f9896.camel@yadro.com>
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

On 2/10/2021 5:40 AM, Andrei Kartashev wrote:
> On Wed, 2021-02-10 at 12:43 +0000, Joel Stanley wrote:
>> The openbmc kernel will move to a 5.10 based tree for Aspeed and
>> Nuoton machines.
>>
>>      linux-openbmc: Move to Linux 5.10
>>
>>      This moves the OpenBMC kernel to a v5.10 base for both Aspeed and
>>      Nuvoton. There are 125 patches in the tree, with 80 of those
>> patches not
>>      yet queued for merging in v5.11.
>>
>>      Notably the PECI patchset has been dropped as the author, Intel,
>> has
>>      elected to develop it out of tree instead of submitting it for
>> mainline
>>      inclusion.
>>
>>      https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40404
>>
>> Regarding the PECI situation, I raised it on the list back in August.
>> The conversation finished up in October with a commitment that the
>> work would be done as soon as possible.
>>
>> This kernel config option is enabled by machines from Facebook,
>> Bytedance, HPE, Lenovo, Quanta and Supermicro. (Surprisingly Intel
>> doesn't enable it on their platform?). It would be great for someone
>> from one of those teams to step up and submit the PECI patchset
>> upstream.
> 
> Intel enable PECI in their downstream port
> https://github.com/Intel-BMC/openbmc , where they do have downstream
> fork of the kernel with PECI patches:
> https://github.com/Intel-BMC/linux
> We used to branch from the fork for our x86 platform, so now it's
> really tricky for us to follow upstream. We will very appropriate if
> one will push PECI patches upstream, but this is still Intel's code
> under development and this sounds a bit risky if someone but Intel do
> upstreaming.
> So I'd like first to see Intel's position about not to upstream the
> patches: what is the problem there?
> 

Intel will continue trying to upstreaming the PECI subsystem
implementation but the next spin isn't prepared completely yet.
Meanwhile, the patch set will be provided through the
https://github.com/Intel-BMC/linux fork and it will move to 5.10
soon as well with rebasing the PECI patch set.

Thanks,
Jae

>>
>> In the meantime these in-tree systems will regress their PECI support
>> until the patchset is submitted to mainline.
>>
>> Cheers,
>>
>> Joel
