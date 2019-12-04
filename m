Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8F1131AC
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 19:01:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SmrL48NKzDqV3
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 05:01:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SmpZ6wG3zDqG0
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 05:00:05 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 10:00:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="361646395"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga004.jf.intel.com with ESMTP; 04 Dec 2019 10:00:01 -0800
Subject: Re: Dropping PECI patches
To: Joel Stanley <joel@jms.id.au>
References: <CACPK8XffZqTq3YqEEcA7mm4d1k0V30o1TLE79nBOGrVcEBCjog@mail.gmail.com>
 <be709e4f-1215-3d88-9974-1989b9867e60@linux.intel.com>
 <CACPK8XcvBTj=AxaREQuLpi6=YZdU03ajW1nXKhnvud_jP8Ez_g@mail.gmail.com>
 <cb401668-703b-9745-c022-44b8bdb2c07f@linux.intel.com>
 <CACPK8XdcoYMMYGJdxnafBiHkRpQt17w4maXUwOvfMf+NqF7Njg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <fe2c84dc-4a35-ed7e-d017-18c91fb94d5e@linux.intel.com>
Date: Wed, 4 Dec 2019 10:00:01 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdcoYMMYGJdxnafBiHkRpQt17w4maXUwOvfMf+NqF7Njg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/2/2019 6:47 PM, Joel Stanley wrote:
> On Tue, 3 Dec 2019 at 01:25, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> On 12/2/2019 1:54 PM, Joel Stanley wrote:
>>> On Mon, 2 Dec 2019 at 18:09, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>
>>>> Hi Joel,
>>>>
>>>> Thanks for letting me know this. Also, thanks a lot for carrying the
>>>> out-of-tree PECI patches in OpenBMC kernel tree so far.
>>>>
>>>> Can I submit updated PECI patches to OpenBMC upstream if I'm gonna add
>>>> it back? Linux upstreaming isn't ready yet because configfs support
>>>> should be implemented to address subsystem maintainer's comments but it
>>>> needs at this moment in OpenBMC kernel tree to keep developing
>>>> dbus-sensors support.
>>>
>>> This was the status back in January. I think it's time to find someone
>>> to complete the work on PECI so it can be merged upstream.
>>>
>>> Once those patches have been posted, we can merge them into the
>>> openbmc tree while we wait for them to be merged into mainline.
>>
>> I've made lots of update in Intel downstream PECI to address
>> maintainers' comments except the configfs thing so I agree that PECI
>> codes in OpenBMC kernel tree need to be updated. Can you give me a week
>> for submission of new patch set into linux upstream? In the meantime,
>> I'd like to keep the out-of-tree PECI patches if possible to avoid build
>> breaks in dbus-sensors repo.
> 
> The build break of dbus-sensors has already held up moving to 5.4 for
> a week. I think this situation is a clear demonstration of how
> carrying out of tree patches for a long time slows down the
> development of the entire project.
> 
> I will hold off moving to 5.4 for another week. Please keep us up to
> date with your progress.

Thanks for your understanding and for your effort on carrying the
out-of-tree patch so far. I'll submit updated patch set into upstream
within a week.

Thanks,

Jae
