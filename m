Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788EE249C
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 22:31:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z28F5m5pzDqS3
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 07:31:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z27Y42vrzDqM5
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 07:30:32 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9NKRCXo074650; Wed, 23 Oct 2019 16:30:25 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vtvc83by2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 16:30:24 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9NKSEVd084092;
 Wed, 23 Oct 2019 16:30:24 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vtvc83bxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 16:30:24 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9NKU4HG023279;
 Wed, 23 Oct 2019 20:30:23 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 2vqt47tx37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 20:30:23 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9NKUMef41157086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2019 20:30:22 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F8E9BE054;
 Wed, 23 Oct 2019 20:30:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80074BE04F;
 Wed, 23 Oct 2019 20:30:21 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.41.74.115])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 23 Oct 2019 20:30:21 +0000 (GMT)
Subject: Re: multiple telemetry designs
To: James Feist <james.feist@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, piotr.matuszczak@intel.com,
 kunyi@google.com, apparao.puli@linux.intel.com
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
Date: Wed, 23 Oct 2019 15:30:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-23_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910230187
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
Cc: james.mihm@intel.com, openbmc@lists.ozlabs.org, neladk@microsoft.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/23/19 12:47 PM, James Feist wrote:
> On 10/23/19 10:39 AM, James Feist wrote:
>> On 10/23/19 9:38 AM, Brad Bishop wrote:
>>> There are two telemetry / metric designs under review right now:

There's a fourth option that can also be used, but more than just sensor 
readings. This isn't redfish compliant and relies on secure websockets 
however.

https://github.com/openbmc/docs/blob/master/rest-api.md#event-subscription-protocol

> 
> I've been informed there are actually 3:
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749
> 
> Added Appu to this conversation as well.
> 
> 
>>>
>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257
>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357
>>>
>>> I would like to see one or both of them merged.  Neither seem to have 
>>> any support….there is a single +1 on the latter review from Shawn 
>>> McCarney.  If you support one of these designs, please go review it 
>>> and indicate your support.
>>
>> It looks like Kun has +1ed Piotr's design as well, not sure if that 
>> means we can go with one design?
>>
>>>
>>> I also can’t figure out what the path forward for OpenBMC is.  Maybe 
>>> to start with, we could all level set on where we are at with our 
>>> thinking:
>>>
>>> Kun: How far along are you in the implementation of your proposal?
>>> Piotr: How far along are you in the implementation of your proposal?
>>> James: OpenBMC can support one or both proposals.  If we support 
>>> both, this means multiple implementations for the same thing in 
>>> bmcweb.  One that gets data from dbus objects, and another that gets 
>>> it from librrd.  As the maintainer of bmcweb are you open to 
>>> accepting one or both of these options?
>>
>> With 0 previous knowledge, I would suggest using a way that works with 
>> previous OBMC practices, and that is using dbus. If there has to be 2 
>> separate designs, then if both produce the same d-bus interfaces, it 
>> shouldn't matter to bmcweb which one is being used. That being said, 
>> if this doesn't work for some reason, we've used compile switches in 
>> the past, although this would be the least preferable option. 
>> Truthfully I haven't looked at these designs yet as I've only recently 
>> taken a larger role in bmcweb reviews, so I'll try to look at them soon.
>>
>>
>>>
>>> Without any discussion and resolution, I’m afraid both of these 
>>> proposals are just going to sit here, unmerged, indefinitely.
>>>
>>> thx - brad
>>>
