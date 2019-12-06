Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F8F1151DA
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 15:04:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TvV227MpzDqd3
	for <lists+openbmc@lfdr.de>; Sat,  7 Dec 2019 01:04:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TvSq0VDNzDqcX
 for <openbmc@lists.ozlabs.org>; Sat,  7 Dec 2019 01:03:37 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2019 06:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,284,1571727600"; d="scan'208";a="214441217"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.245.179])
 ([172.22.245.179])
 by orsmga006.jf.intel.com with ESMTP; 06 Dec 2019 06:03:31 -0800
Subject: Re: BMC update via TFTP
To: openbmc@lists.ozlabs.org
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
 <20191205223708.GC9613@mauery.jf.intel.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <1c75671d-904e-8a06-07f5-c93fcf0e5e50@linux.intel.com>
Date: Fri, 6 Dec 2019 15:03:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205223708.GC9613@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

On 05-Dec-19 23:37, Vernon Mauery wrote:
> On 05-Dec-2019 12:05 PM, Alexander Tereschenko wrote:
>> On 04-Dec-19 22:36, Vernon Mauery wrote:
>>> Even if the BMC only accepts signed images, we want to make sure 
>>> that the signed image the BMC fetches is the one that the 
>>> administrator *wants* to be fetched. With tftp or http (or any 
>>> insecure transport), one possible MiTM attack would be to substitute 
>>> an alternate valid image. Let's say the admin wants to go from 1.18 
>>> to 1.20, bu the attacker wants to go to 1.16, which has a known 
>>> vulnerability. The image would be authenticated by the signature, 
>>> and will be accepted.
>>
>> Thanks Vernon for raising this one - I think this is indeed a valid 
>> concern.
>>
>> So there are essentially two things that we are talking about here, 
>> if we peel it a little bit:
>>
>> 1) an additional authorization by the BMC admin of specific images 
>> they want to run
>> 2) plain integrity protection of the file being sent over insecure 
>> channel
>>
>> The first one is a bit different from the second one (and frequently 
>> solved by co-signing these days), but in thise specific use case I'd 
>> say these two indeed overlap.
>>
>> In this case, I'd rather suggest us to look into asymmetric crypto, 
>> so that no secret sharing/storage (with accompanying additional risk 
>> of compromise) is necessary. An admin would sign the image being sent 
>> + some context information (like time, to provide replay protection - 
>> also applicable to MAC case, otherwise the attacker can trivially 
>> replay the file/MAC) and the BMC would check the admin's signature 
>> using pre-provisioned public key (send over HTTPS, same as MAC key in 
>> your proposal - but only for integrity protection, con 
>> confidentiality is necessary) + verify that the context is "fresh" 
>> and then use the file.
>
> I am not convinced that it needs to be this elaborate. I don't see 
> what it adds over the simple case of sending the key/hmac/uri 
> encrypted with TLS to the BMC. There will be no replay attacks because 
> TLS prevents it.
> Maybe I am missing something?

We may be talking about slightly different contexts indeed. I meant to 
suggest something that doesn't require

1) any "out-of-band" channel for each file being sent (signature can be 
appended to the file itself, one-time/infrequent public key updates at 
the BMC side are discounted as arguably negligible). I use the 
"out-of-band" here as "channel different than the one where the file 
itself is being sent";
2) any symmetric secret generation/storage/distribution upon sending 
files (which is an additional burden and risk);

plus

1) provides replay protection;
2) doesn't require major infrastructure modifications (here I'm assuming 
that signing and checking the signature in this flow is less change than 
generating key, MAC and sending them over "out-of-band" channel);

I read your proposal as that the key will be a longer-term one + that 
the MAC will be sent along with the file (as it's not a secret and 
typically it's sent together with the data in such schemes). If you 
meant that both the key and MAC are generated on the fly, are one-time 
and are sent via that "out-of-band" TLS-protected channel, then I'd say 
you don't even need a keyed MAC at all and a plain cryptographic hash 
would suffice. You're sending the key along with the MAC and file 
channel itself is unprotected - so if the adversary can break the TLS, 
they can compute the MAC as easily as a plain hash and if they can't, 
they anyway can't substitute the hash value, so IMHO keyed MAC is 
surplus here.

Maybe outlining a flow (maybe as a sequence/flow diagram) in more detail 
and defining which specific adversaries (and their capabilities) we're 
talking about here would help? I agree we surely don't need a more 
complex scheme if a simpler one suffices, it's just that we may be 
talking about slightly different flows and adversaries right now :)

regards,
Alexander


