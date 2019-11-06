Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B78F2202
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 23:43:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477hQh5d5tzF3SN
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 09:43:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477hQ055XHzDr5T
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 09:43:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 14:43:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="402534469"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 06 Nov 2019 14:43:00 -0800
Subject: Re: OpenBMC and https Vulnerable issue.
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <44ddb5d76e734cb8bcc7354e1c0e0081@SCL-EXCHMB-13.phoenix.com>
 <cd9008e5-2501-29d4-57e8-7831eb558160@linux.intel.com>
 <8e3e3633bd1946adbac73657816e049a@SCL-EXCHMB-13.phoenix.com>
 <c4cb53595ede41398aa7ca7086da55ec@SCL-EXCHMB-13.phoenix.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <50bba79d-db07-5ced-23e0-dfe3552b9687@linux.intel.com>
Date: Wed, 6 Nov 2019 14:43:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <c4cb53595ede41398aa7ca7086da55ec@SCL-EXCHMB-13.phoenix.com>
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

On 11/6/19 2:38 PM, Bruce Mitchell wrote:
> 
> 
>> -----Original Message-----
>> From: openbmc [mailto:openbmc-
>> bounces+bruce_mitchell=phoenix.com@lists.ozlabs.org] On Behalf Of Bruce
>> Mitchell
>> Sent: Wednesday, November 6, 2019 14:19
>> To: James Feist; OpenBMC Maillist
>> Subject: RE: OpenBMC and https Vulnerable issue.
>>
>>
>>
>>> -----Original Message-----
>>> From: openbmc [mailto:openbmc-
>>> bounces+bruce_mitchell=phoenix.com@lists.ozlabs.org] On Behalf Of
>>> James Feist
>>> Sent: Wednesday, November 6, 2019 13:52
>>> To: Bruce Mitchell; OpenBMC Maillist
>>> Subject: Re: OpenBMC and https Vulnerable issue.
>>>
>>> On 11/6/19 11:31 AM, Bruce Mitchell wrote:
>>>>   From my investigations on TLS there seems to be 2 issues that could be
>>> corrected with OpenBMC's https:
>>>>     1  Secure Client-Initiated Renegotiation     VULNERABLE (NOT ok), DoS
>>> threat
>>>
>>> This CVE is disputed https://www.cvedetails.com/cve/CVE-2011-1473/ due
>>> to CPU consumption issues that might make it easier to cause a DOS
>>> (which is arguably already not that difficult on a BMC). That being said
>>> the fix is a 1 liner, so I implemented it and it seems to work, but I
>>> need to see if there are any consequences.
>>>
>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/26992
>>>
>>>
>>>
>>>>     2  LUCKY13 (CVE-2013-0169), experimental     potentially VULNERABLE,
>>> uses cipher block chaining (CBC) ciphers with TLS
>>>>        and xc023   ECDHE-ECDSA-AES128-SHA256         ECDH 521   AES         128
>>> TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
>>>
>>> Based on this https://wiki.crashtest-security.com/prevent-ssl-lucky13,
>>> we are using the recommended ciphers,
>>>
>> https://github.com/openbmc/bmcweb/blob/1f8c7b5d6a679a38b8226106031
>>> 0b876079d0f8b/include/ssl_key_handler.hpp#L330.
>>> And based on this comment from the maintainer of test ssl, no tool can
>>> determine this externally, and it's just a warning:
>>> https://github.com/drwetter/testssl.sh/issues/1011#issuecomment-
>>> 372953654.
>>> Do you have any suggestions on if there is anything to change for this one?
>>>
>>> Thanks
>>>
>>> -James
>>>
>>
>> Thanks James, I accept your assessment.
>>
>> -Bruce
>>
> 
> There are Mozilla Recommended configurations as well.
> https://wiki.mozilla.org/Security/Server_Side_TLS#Recommended_configurations
> 

I believe that's what was originally copied based on the variable name 
in ssl_key_handler.hpp.

> - Bruce
> 
>>>
>>>>
>>>> Present standard of practice seems to be to not allow Secure Client-
>>> Initiated Renegotiation and to not allow CBC ciphers.
>>>>
>>>> Is this your understanding as well?
>>>>
>>>> Thank you!
>>>>
> 
