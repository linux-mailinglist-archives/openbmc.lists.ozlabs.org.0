Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD2159CB4
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 23:57:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HJ816DFKzDqLT
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 09:57:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HJ7L5B0JzDqCR
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 09:56:59 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 14:56:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="251710487"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga002.jf.intel.com with ESMTP; 11 Feb 2020 14:56:54 -0800
Subject: Re: [PATCH dev-5.4] peci: fix license identifier
To: Joel Stanley <joel@jms.id.au>
References: <20200211224345.3624-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xdb+gMZgEo-kCOBnjQtEMiPWoc5QJ7fF5W7ZeAOWzP6Og@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8bfd6c3a-f5d1-254d-25d0-efcea5ff7886@linux.intel.com>
Date: Tue, 11 Feb 2020 14:56:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACPK8Xdb+gMZgEo-kCOBnjQtEMiPWoc5QJ7fF5W7ZeAOWzP6Og@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/11/2020 2:52 PM, Joel Stanley wrote:
> On Tue, 11 Feb 2020 at 22:41, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This commit fixes license identifier to prevent an error while
>> doing 'make headers_install' that says:
>> error: include/uapi/linux/peci-ioctl.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
>>
>> Reported-by: Tao Ren <rentao.bupt@gmail.com>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Thakns for the patch.
> 
> How's the upstream submission of PECI going?

I'm still trying. I'll update you if any progress.

Thanks,

Jae

>> ---
>>   include/uapi/linux/peci-ioctl.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/uapi/linux/peci-ioctl.h b/include/uapi/linux/peci-ioctl.h
>> index 843930f9fedd..c74b3cde52e8 100644
>> --- a/include/uapi/linux/peci-ioctl.h
>> +++ b/include/uapi/linux/peci-ioctl.h
>> @@ -1,5 +1,5 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> -/* Copyright (c) 2018-2019 Intel Corporation */
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/* Copyright (c) 2018-2020 Intel Corporation */
>>
>>   #ifndef __PECI_IOCTL_H
>>   #define __PECI_IOCTL_H
>> --
>> 2.17.1
>>
