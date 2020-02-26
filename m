Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F6170B5A
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 23:19:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SVbF5TPfzDqlL
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 09:19:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SVZd2pXRzDqVc
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 09:19:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 14:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,489,1574150400"; d="scan'208";a="317568529"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga001.jf.intel.com with ESMTP; 26 Feb 2020 14:19:01 -0800
Subject: Re: [PATCH dev-5.4] hwmon: peci: change label strings to reflect
 natural numbers
To: Joel Stanley <joel@jms.id.au>
References: <20200211234950.4010-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf5qcyBv3yZ7BRu-v4PGmqsvbXnMqoQEhsPyq_JC-wUZQ@mail.gmail.com>
 <1564f185-93e8-9ad0-9bfa-16f2a9af814e@linux.intel.com>
 <CACPK8XfztgpY-D1rcFrELU+hS28H3wpFR02MKfavtpW4RP6WLA@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <baa9ebf6-7d54-7229-0df0-362466b0a5f4@linux.intel.com>
Date: Wed, 26 Feb 2020 14:19:01 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XfztgpY-D1rcFrELU+hS28H3wpFR02MKfavtpW4RP6WLA@mail.gmail.com>
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

On 2/26/2020 2:11 PM, Joel Stanley wrote:
> On Wed, 26 Feb 2020 at 22:07, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Hi Joel,
>>
>> On 2/26/2020 1:54 PM, Joel Stanley wrote:
>>> On Tue, 11 Feb 2020 at 23:47, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>
>>>> This commit changes label strings to reflect user friendly natural
>>>> numbers like 'Core 1' instead of 'Core 0' and 'DIMM A1' instead of
>>>> 'DIMM A0'.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>> ---
>>>>    drivers/hwmon/peci-cputemp.c  | 2 +-
>>>>    drivers/hwmon/peci-dimmtemp.c | 2 +-
>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>    mode change 100644 => 100755 drivers/hwmon/peci-cputemp.c
>>>>    mode change 100644 => 100755 drivers/hwmon/peci-dimmtemp.c
>>>
>>> I don't think this was intended.
>>>
>>> I fixed it up for you, but please try to figure out what went wrong so
>>> it doesn't happen in the future.
>>
>> It happened while upstreaming it. I changed the static label string
>> table as a dynamic table to address review comments, and I missed
>> this mismatch. My bad. It'll be fixed in the next upstreaming spin.
> 
> I was just referring to the files becoming executable :)

Yeah, I was aware that just after sending my previous email.

> I am surprised by the code that makes string allocation dynamic. As
> you know the number of strings (one per sensor), and you're allocating
> a fixed size for each string, I would suggest you're better off
> allocating all of the strings at once.
> 
> Regardless, I suggest you change the calls to snprintf, as if a
> machine has more than 999 DIMMs it will overflow the string :)

The machine wouldn't come in the near future but I agree with you. Let
me replace the sprintf with snprintf. Will submit a new patch.

Thanks! :)

Jae

> Cheers,
> 
> Joel
> 
