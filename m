Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00884FE83E
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 23:46:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47FD3b2KRMzF1Hv
	for <lists+openbmc@lfdr.de>; Sat, 16 Nov 2019 09:46:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FD2g176kzF5k8
 for <openbmc@lists.ozlabs.org>; Sat, 16 Nov 2019 09:45:30 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFMb09a082360; Fri, 15 Nov 2019 17:45:26 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9nse1wqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 17:45:26 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAFMefrQ007321;
 Fri, 15 Nov 2019 22:45:25 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 2w9gy4338w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 22:45:25 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAFMjOtl49938740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 22:45:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42DF3AE071;
 Fri, 15 Nov 2019 22:45:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A13BAE05C;
 Fri, 15 Nov 2019 22:45:24 +0000 (GMT)
Received: from demeter.local (unknown [9.85.156.21])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 15 Nov 2019 22:45:23 +0000 (GMT)
Subject: Re: OpenBMC and https Vulnerable issue.
To: James Feist <james.feist@linux.intel.com>,
 Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <44ddb5d76e734cb8bcc7354e1c0e0081@SCL-EXCHMB-13.phoenix.com>
 <cd9008e5-2501-29d4-57e8-7831eb558160@linux.intel.com>
 <8e3e3633bd1946adbac73657816e049a@SCL-EXCHMB-13.phoenix.com>
 <c4cb53595ede41398aa7ca7086da55ec@SCL-EXCHMB-13.phoenix.com>
 <50bba79d-db07-5ced-23e0-dfe3552b9687@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <2814674f-6cf8-5687-64ff-7b88a39d7d60@linux.ibm.com>
Date: Fri, 15 Nov 2019 16:45:23 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <50bba79d-db07-5ced-23e0-dfe3552b9687@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_07:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150199
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

On 11/6/19 4:43 PM, James Feist wrote:
> On 11/6/19 2:38 PM, Bruce Mitchell wrote:
>>
>>
>>> -----Original Message-----
>>> From: openbmc [mailto:openbmc-
>>> bounces+bruce_mitchell=phoenix.com@lists.ozlabs.org] On Behalf Of Bruce
>>> Mitchell
>>> Sent: Wednesday, November 6, 2019 14:19
>>> To: James Feist; OpenBMC Maillist
>>> Subject: RE: OpenBMC and https Vulnerable issue.
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: openbmc [mailto:openbmc-
>>>> bounces+bruce_mitchell=phoenix.com@lists.ozlabs.org] On Behalf Of
>>>> James Feist
>>>> Sent: Wednesday, November 6, 2019 13:52
>>>> To: Bruce Mitchell; OpenBMC Maillist
>>>> Subject: Re: OpenBMC and https Vulnerable issue.
>>>>
>>>> On 11/6/19 11:31 AM, Bruce Mitchell wrote:
>>>>>   From my investigations on TLS there seems to be 2 issues that 
>>>>> could be
>>>> corrected with OpenBMC's https:
>>>>>     1  Secure Client-Initiated Renegotiation     VULNERABLE (NOT 
>>>>> ok), DoS
>>>> threat
>>>>
>>>> This CVE is disputed https://www.cvedetails.com/cve/CVE-2011-1473/ due
>>>> to CPU consumption issues that might make it easier to cause a DOS
>>>> (which is arguably already not that difficult on a BMC). That being 
>>>> said
>>>> the fix is a 1 liner, so I implemented it and it seems to work, but I
>>>> need to see if there are any consequences.
>>>>
>>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/26992

Thanks for looking at this.  Sorry about my delayed response.  The fix 
looks good to me, and it has merged already anyway.
I don't see any negative consequences.

FWIW, to address the ongoing issue of what ciphers to support, an 
OpenBMC network security considerations document was created to discuss 
relevant standards and the OpenBMC implementation.  Feel free to improve 
it with additional information.  It is here:
https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md

- Joseph

>>>>
>>>>
>>>>
>>>>>     2  LUCKY13 (CVE-2013-0169), experimental     potentially 
>>>>> VULNERABLE,
>>>> uses cipher block chaining (CBC) ciphers with TLS
>>>>>        and xc023 ECDHE-ECDSA-AES128-SHA256         ECDH 521   AES 128
>>>> TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
>>>>
>>>> Based on this https://wiki.crashtest-security.com/prevent-ssl-lucky13,
>>>> we are using the recommended ciphers,
>>>>
>>> https://github.com/openbmc/bmcweb/blob/1f8c7b5d6a679a38b8226106031
>>>> 0b876079d0f8b/include/ssl_key_handler.hpp#L330.
>>>> And based on this comment from the maintainer of test ssl, no tool can
>>>> determine this externally, and it's just a warning:
>>>> https://github.com/drwetter/testssl.sh/issues/1011#issuecomment-
>>>> 372953654.
>>>> Do you have any suggestions on if there is anything to change for 
>>>> this one?
>>>>
>>>> Thanks
>>>>
>>>> -James
>>>>
>>>
>>> Thanks James, I accept your assessment.
>>>
>>> -Bruce
>>>
>>
>> There are Mozilla Recommended configurations as well.
>> https://wiki.mozilla.org/Security/Server_Side_TLS#Recommended_configurations 
>>
>>
>
> I believe that's what was originally copied based on the variable name 
> in ssl_key_handler.hpp.
>
>> - Bruce
>>
>>>>
>>>>>
>>>>> Present standard of practice seems to be to not allow Secure Client-
>>>> Initiated Renegotiation and to not allow CBC ciphers.
>>>>>
>>>>> Is this your understanding as well?
>>>>>
>>>>> Thank you!
>>>>>
>>

