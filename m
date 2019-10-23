Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4BEE231A
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 21:07:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z0HF4LzszDqRw
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 06:07:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z0GL16nxzDqHm
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 06:06:15 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9NIqpmQ035523; Wed, 23 Oct 2019 15:05:56 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vtsx3pby1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:05:56 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9NJ3pp4022493;
 Wed, 23 Oct 2019 19:05:55 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 2vqt47tej8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 19:05:55 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9NJ5tvG46203238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2019 19:05:55 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EBED124058;
 Wed, 23 Oct 2019 19:05:55 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 014D112405A;
 Wed, 23 Oct 2019 19:05:54 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 23 Oct 2019 19:05:54 +0000 (GMT)
Subject: Re: Feedback on documentation philosophy requested
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <507D4043-19B5-43ED-B28B-408D4BC504E6@fuzziesquirrel.com>
 <DEAFC8E2-2995-4298-89FD-B3A4635A51CD@fuzziesquirrel.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <c3b78069-e204-6b4c-e4ca-3448c824c556@linux.vnet.ibm.com>
Date: Wed, 23 Oct 2019 14:05:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DEAFC8E2-2995-4298-89FD-B3A4635A51CD@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-23_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910230175
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


On 10/7/2019 3:15 PM, Brad Bishop wrote:
>
>>
>> Some of the new features we’ll be documenting will -not- be 
>> interesting to some/many/most/all in the OpenBMC community.  For the 
>> features that fall more towards the most/all end of that spectrum, I 
>> ask for your thoughts on a couple points:
>>
>> - Should these docs and designs be segregated somehow?  Would they 
>> become a burden on the rest of the community if not?

If these documents do end up in the docs/ repo, they still need to be 
written in a way that can be consumable by the community.
Examples
  Avoid internal names/acronyms when something widely known exists
  Try to engage the community, maybe parts of the feature could be more 
common
  Any names/acronyms need to be explained if not widely used and not 
possible to avoid
  Look to upstream, e.g. instead of a new OpenBMC only interface, engage 
the DMTF and look to get that feature added to Redfish


>>
>>
>> - My observation is that the project is headed away from micro 
>> services and towards larger applications - highly configurable at 
>> build time.  bmcweb and phosphor-logging are great examples of this.  
>> Think Linux/KBuild (but without modules).  What this means is that 
>> code with relatively few users (or even just one) goes in the same 
>> codebase as the code with many users.  This seems counter to 
>> segregating documentation and designs of the code with few users.
>>
>> - An example of an un-interesting feature might be the support we’ll 
>> add for the hardware management console.  The HMC is a management 
>> appliance we sell and it has a custom REST API [1], which we’ll 
>> implement in bmcweb (tucked behind cmake flags that compile the 
>> support out of course, as described in the previous bullet).
>>
>> A couple simple ideas that have been thrown around…
>>
>> - put vendor subfolders in openbmc/docs/designs
>>
>> - document vendor specific features in meta-<vendor>/docs
>>
I would like to hear what others in the community think. :)

  If nothing more though on this topic going to take this as it is okay 
to allow features, like the HMC, that are probably not interesting to 
most the OpenBMC community into docs/
  https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23419 would be an 
example.

- Gunnar

>>
>> -brad
>>
>> [1] 
>> https://www.ibm.com/support/knowledgecenter/TI0003N/p8hat/p8hat_partitioningwithanhmc.htm
>
