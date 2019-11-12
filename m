Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAF3F92D9
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 15:39:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C9Pj1bYVzF3s2
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 01:39:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C9LS5NCGzF52c
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 01:37:03 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xACEX8w3125927; Tue, 12 Nov 2019 09:36:39 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w7wqk2grg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 09:36:39 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xACEXL8s127025;
 Tue, 12 Nov 2019 09:36:38 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w7wqk2gr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 09:36:38 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xACEUr3s018350;
 Tue, 12 Nov 2019 14:36:38 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 2w5n35yd7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 14:36:38 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xACEab1249414652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 14:36:37 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 261E1BE053;
 Tue, 12 Nov 2019 14:36:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59739BE054;
 Tue, 12 Nov 2019 14:36:35 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.41.74.115])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 12 Nov 2019 14:36:35 +0000 (GMT)
Subject: Re: multiple telemetry designs
To: vishwa <vishwa@linux.vnet.ibm.com>,
 "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 Paul Vancil <pwvancil@gmail.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
 <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
 <c3dd56aa-b9e2-1efd-1da6-70b0e056446f@linux.intel.com>
 <053009AE-890C-4650-9096-D4E8ABF707AA@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9DFD@IRSMSX101.ger.corp.intel.com>
 <9ECD367E-6573-4DA8-815E-E117AD8DF56C@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30FA694@IRSMSX101.ger.corp.intel.com>
 <C6A744EB-AB05-481F-AC96-09D4DE6ABE57@fuzziesquirrel.com>
 <76cf53a7-9b1f-f724-356a-28ac97c918cc@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A31034F7@IRSMSX101.ger.corp.intel.com>
 <1db5a5bd-6be6-cb93-5865-99416cc31646@linux.vnet.ibm.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <6474a709-fa41-2dd5-538e-e04fb6e25431@linux.vnet.ibm.com>
Date: Tue, 12 Nov 2019 08:36:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1db5a5bd-6be6-cb93-5865-99416cc31646@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-12_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911120130
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
Cc: "Mihm, James" <james.mihm@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/5/19 10:58 AM, vishwa wrote:
> Thanks.
> 
> So, looks like we are getting zeroed in on Intel's proposal ?. I see Kun 
> approving Intel version.
> 
> Paul: Did you have anything ?
> 
> !! Vishwa !!
> 
> On 11/5/19 2:26 PM, Matuszczak, Piotr wrote:
>> Hi,
>>
>> I looked at this design briefly and it seems to be focusing on Redfish 
>> Telemetry Service implementation, which our design 
>> (https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357) also 
>> covers. Dell's design assumes using collecd for gathering sensor 
>> readings.
> 
>> -----Original Message-----
>> From: vishwa [mailto:vishwa@linux.vnet.ibm.com]
>> Sent: Tuesday, November 5, 2019 8:31 AM
>> To: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> Cc: Mihm, James <james.mihm@intel.com>; Justin Thaler 
>> <thalerj@linux.vnet.ibm.com>; openbmc@lists.ozlabs.org; 
>> neladk@microsoft.com; James Feist <james.feist@linux.intel.com>; 
>> apparao.puli@linux.intel.com; Matuszczak, Piotr 
>> <piotr.matuszczak@intel.com>
>> Subject: Re: multiple telemetry designs
>>
>> There is also this version from Dell:
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/23758/. Was this 
>> considered in this discussion ?.
>>
>> Also, from IBM's standpoint, Justin Thaler was mentioning that we 
>> wanted a "true subscription" model, in that, clients can pick and 
>> chose the specific sensors.
>>
>> Justin: Could you add here please ?
Sorry for the slow response. Piotr was kind enough to walk me through 
how the proposal works and it does allow for a true subscription model. 
I still have a to do to determine how much data we will be using with 
this model so I can understand how well it scales. This is a concern for 
us as we are shifting from receiving sensor updates in an "on-change" 
model to updates every second, regardless of change. There's also 
changes in the data format that's sent, which will likely make this less 
of a concern.

Thanks,
Justin

>>
>> !! Vishwa !!
>>
>> On 10/28/19 10:12 PM, Brad Bishop wrote:
>>>> On Oct 28, 2019, at 12:35 PM, Matuszczak, Piotr 
>>>> <piotr.matuszczak@intel.com> wrote:
>>>>
>>>> I would like to make the code opened from the very beginning.
>>> Glad to hear it - that sounds like the best way to me :-)
>>>
>>> FWIW, whenever you are ready to share it, I’d still like to see 
>>> whatever code Intel has for the monitoring service.  It will help me 
>>> understand your design better.  It is fine if it has bugs or it isn’t 
>>> polished.  Thanks Piotr.
>>>
>>> -brad
