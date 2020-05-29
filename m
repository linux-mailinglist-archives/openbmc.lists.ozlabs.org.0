Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B71E7535
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 07:12:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YCNz0wHNzDqc5
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 15:12:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YCMs75dzzDqcN
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 15:11:21 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04T52ABm018000; Fri, 29 May 2020 01:11:17 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1wc09r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 01:11:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04T55Yv8023890;
 Fri, 29 May 2020 05:11:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 316uf93851-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 05:11:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04T5BC5n47644882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 05:11:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54C51AE053;
 Fri, 29 May 2020 05:11:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9565AE045;
 Fri, 29 May 2020 05:11:10 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.237.3])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 May 2020 05:11:10 +0000 (GMT)
Subject: Re: D-Bus interface to provide data to entity manager
To: James Feist <james.feist@linux.intel.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <20200528120331.GC17541@heinlein>
 <0942393e-4475-5249-4918-4125e85ec554@linux.vnet.ibm.com>
 <17ad5a3d-e69b-0005-4bc3-950e590093bb@linux.intel.com>
 <20200528180555.GA1717@patrickw3-mbp.lan.stwcx.xyz>
 <6f19c866-6fb5-49f8-da25-7d218f6267ad@linux.intel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <6c8f27a5-d5c0-8e32-254b-8bc35f08e83e@linux.vnet.ibm.com>
Date: Fri, 29 May 2020 10:41:09 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <6f19c866-6fb5-49f8-da25-7d218f6267ad@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_01:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 malwarescore=0 cotscore=-2147483648 priorityscore=1501 mlxscore=0
 clxscore=1015 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290034
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/05/20 12:01 am, James Feist wrote:
> On 5/28/2020 11:05 AM, Patrick Williams wrote:
>> On Thu, May 28, 2020 at 10:12:19PM +0530, Thomaiyar, Richard Marian 
>> wrote:
>>>
>>> On 5/28/2020 5:54 PM, Deepak Kodihalli wrote:
>>>> On 28/05/20 5:33 pm, Patrick Williams wrote:
>>
>>> Why do we need to have 2 different interfaces to represent the same
>>> information for FRU-to-inventory transformational (say ProductName). 
>>> This
>>> will make inventory manager to be updated for every FRU producer?. 
>>> Many of
>>> the properties are common, and we can form a common interface for 
>>> that, and
>>> rest can be maintained in it's specific interface. I understand that 
>>> current
>>> FRU to Entity-manager interface seems to be private, but we must make a
>>> common interface to represent like Product Name, PartNumer, Serial 
>>> Number
>>> etc. (instead of maintaining it in different interface saying IPMI / 
>>> PLDM
>>> Source, with different types). How about?
>>
>> Yes, I am in favor of common interfaces for this where ever possible.
>>
>> Is there someone that knows the existing FruDevice implementation well
>> enough that can be included in this work to propose common interfaces
>> where it is appropriate?
> 
> Yes, I wrote it. I can review the changes, however if you read the ipmi 
> fru spec, which is what fru device is based of, there are many optional 
> fields based on the type of the fru. You'd probably at a minimum need an 
> interface per region supported as phosphor-dbus-interfaces does not 
> allow optional fields. I'm not sure how you'd deal with custom fields 
> either. You'd probably need everything as a superset of the fru spec, 
> and have blanks where its not populated.


I don't think it is worth trying to make a FRU device/properties 
interface that is common to PLDM and IPMI. The two FRU formats are 
different (pls see my previous email about the same).

Thanks,
Deepak


> https://www.intel.com/content/dam/www/public/us/en/documents/specification-updates/ipmi-platform-mgt-fru-info-storage-def-v1-0-rev-1-3-spec-update.pdf 
> 
> 
> 

