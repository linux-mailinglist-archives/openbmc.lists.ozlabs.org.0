Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E17DE1E7532
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 07:11:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YCMZ17KmzDqcX
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 15:11:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YCLh02GZzDqY3
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 15:10:19 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04T53I5A051597; Fri, 29 May 2020 01:09:11 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1e442c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 01:09:11 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04T55iIG000562;
 Fri, 29 May 2020 05:09:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 316uf8vk5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 05:09:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04T596Un56492244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 05:09:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB99AAE055;
 Fri, 29 May 2020 05:09:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FEC2AE064;
 Fri, 29 May 2020 05:09:05 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.237.3])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 May 2020 05:09:05 +0000 (GMT)
Subject: Re: D-Bus interface to provide data to entity manager
To: Patrick Williams <patrick@stwcx.xyz>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <20200528120331.GC17541@heinlein>
 <0942393e-4475-5249-4918-4125e85ec554@linux.vnet.ibm.com>
 <17ad5a3d-e69b-0005-4bc3-950e590093bb@linux.intel.com>
 <20200528180555.GA1717@patrickw3-mbp.lan.stwcx.xyz>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <fac63254-305a-fea2-36ba-a23597688da8@linux.vnet.ibm.com>
Date: Fri, 29 May 2020 10:39:04 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528180555.GA1717@patrickw3-mbp.lan.stwcx.xyz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_01:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 cotscore=-2147483648 malwarescore=0 clxscore=1015 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290038
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 28/05/20 11:35 pm, Patrick Williams wrote:
> On Thu, May 28, 2020 at 10:12:19PM +0530, Thomaiyar, Richard Marian wrote:
>>
>> On 5/28/2020 5:54 PM, Deepak Kodihalli wrote:
>>> On 28/05/20 5:33 pm, Patrick Williams wrote:
> 
>> Why do we need to have 2 different interfaces to represent the same
>> information for FRU-to-inventory transformational (say ProductName). This
>> will make inventory manager to be updated for every FRU producer?. Many of
>> the properties are common, and we can form a common interface for that, and
>> rest can be maintained in it's specific interface. I understand that current
>> FRU to Entity-manager interface seems to be private, but we must make a
>> common interface to represent like Product Name, PartNumer, Serial Number
>> etc. (instead of maintaining it in different interface saying IPMI / PLDM
>> Source, with different types). How about?

Richard, I have concerns with this approach. Like I mentioned in one my 
earlier emails, and Patrick also alludes to below, if you try to make 
this common (event if it's for a subset of the properties) then you 
basically arrive at the existing phosphor Inventory interfaces (eg 
Inventory.Decorator.Asset).

My question in my earlier mail was, if you do such a thing, then why do 
you even need inventory producers? FruDevice and PLDM could have hosted 
inventory on their own. If they still rely on the inventory producers 
(EM and PIM) with this "common interface" approach, then it's basically 
re-implementation/duplications of the (Inventory.Decorator.Asset like) 
interface by two processes.

The idea is for apps like FruDevice and PLDM, which are aware of a 
specific FRU format, to host data in *that* format, to be consumed 
*solely* by inventory producers (like EM and PIM).

Also note that (as James pointed out in his email), the IPMI FRU format 
distinguishes Board/Chassis/Product areas. PLDM FRU format does not. So 
there are differences. If a new FRU format is introduced, then yes we 
would expect a new interface to show up under Inventory/Source/<FruFormat>


> Yes, I am in favor of common interfaces for this where ever possible.
> 
> Is there someone that knows the existing FruDevice implementation well
> enough that can be included in this work to propose common interfaces
> where it is appropriate?
> 
>> Inventory/Source/General/Fru  (Maintain common things here Product Name.
>> This can be used by Inventory manager to advertise it (instead of searching
>> it in multiple interfaces/properties))
> 
> Minor tweak here of 'Source/Common'?  When we have an existing Inventory
> interface for this information should we mimic what is already in
> Inventory?  At some point are we trying to be too common that we're
> effectively reimplementing Inventory instances under a different name?
> 

