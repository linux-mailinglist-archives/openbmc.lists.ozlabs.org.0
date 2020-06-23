Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2CB204D62
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 11:06:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rgP86qBhzDqTX
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 19:06:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rgNB3cyzzDqB9
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 19:05:12 +1000 (AEST)
IronPort-SDR: 7dQ4YnpNGavqFU8cfGRvhv6hr+6mSLs6d4rF8E75iLN1wHlB2UxqzCrjf2Jjk4uaRBBuxPzEmY
 U5gfXR6w9g5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="228679234"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="228679234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 02:05:10 -0700
IronPort-SDR: p84GbDDYlIFG28td6OIhs1thOZ1Pezki8EEs46YXjuFqV1dcvKW0EnLpud1w1RhBT5yqTW+ShY
 pbfj7d6f5K0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="384789696"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [10.213.26.51])
 ([10.213.26.51])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2020 02:05:09 -0700
Subject: Re: OpenBMC 2.8 security audit results
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <a31fcd71-460d-86c4-7a07-b7c6800aa7be@linux.ibm.com>
 <2abafb26-29d5-0a0b-7969-19b32556adc5@linux.intel.com>
 <21ebed5c-ad63-84a1-0b0e-8b5fdb83387d@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <e6e6e9fc-ba58-37d7-e0ae-fc4ae4637aca@linux.intel.com>
Date: Tue, 23 Jun 2020 11:05:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <21ebed5c-ad63-84a1-0b0e-8b5fdb83387d@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 22-Jun-20 16:08, Joseph Reynolds wrote:
> On 6/22/20 4:30 AM, Alexander Tereschenko wrote:
>> On 20-Jun-20 03:26, Joseph Reynolds wrote:
>>> Here are the results from my "security audit" on the planned OpenBMC 
>>> 2.8 release.  The results are not intended as a complete analysis, 
>>> but only offer highlights into the BMC's security configuration. 
>>> Contributions are appreciated.
>>> The script to perform these tests was presented here: 
>>> https://lists.ozlabs.org/pipermail/openbmc/2020-April/021186.html 
>>> and was followed more-or-less.
>>>
>>> $ echo "Checking test host openssl version"
>>> Checking test host openssl version
>>> $ openssl version
>>> OpenSSL 1.0.2k-fips  26 Jan 2017
>>>
>> I'm not sure I get this one - is "test host" a BMC or the one where 
>> the test script is being run? If the former, this is really old, no 
>> longer publicly supported by the OpenSSL team and has multiple CVEs 
>> against it [1], so should be upgraded.
>>
>> [1] https://www.openssl.org/news/openssl-1.0.2-notes.html
>
> Alexander, thanks for your reply.  The "test host" is a Linux system 
> used to probe the BMC via network interfaces such as SSH, HTTPS, and 
> REST APIs.  To reflect actual customer use, I used a test host that 
> has an older operating system.  I've included the test host's software 
> versions to help answer questions about the results below, when the 
> host version factors into the results. [I'll update my preamble with 
> this information.]

Got it, in this case that comment is not important, the text host may 
have whatever versions :)

>>> /etc/ssl/certs:
>>> drwx------    2 root     root           160 Jun 10 06:22 authority
>>> drwx------    2 root     root           304 Jun 10 06:23 https
>>>
>>> observation: Certificates under /etc/ssl are protected from reading
>>
>> This actually seems to be surplus - *certificates* are public by 
>> definition, it's the private parts of them (private keys 
>> corresponding to public ones in certificates) that need protection 
>> like that.
>
> Thanks for the clarification.  I've heard a private certificate is 
> improperly being stored along with its public cert in there somewhere, 
> but I don't really know.

Ah, indeed, that reminds me - OpenBMC stores both private key and the 
cert (with the public key) in one file, concatenated. That's how bmcweb 
consumes that (unlike e.g. Apache or nginx, which have separate 
settings/paths for private and public keys, though nginx also allows for 
combining) and indeed that in turn necessitates closing down the 
respective files/dirs - so your check is correct and my comment is not 
applicable.

regards,
Alexander

