Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CAB104031
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 16:58:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J6mm62fLzDqtr
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 02:58:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J6m21MbnzDq72
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 02:57:53 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKFl79O027380; Wed, 20 Nov 2019 10:57:50 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wd5s0xvkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 10:57:50 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAKFtehs028257;
 Wed, 20 Nov 2019 15:57:49 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2wa8r77jkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 15:57:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAKFvlx343778330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 15:57:47 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD72E7805E;
 Wed, 20 Nov 2019 15:57:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB82378064;
 Wed, 20 Nov 2019 15:57:46 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.80.219.76])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 20 Nov 2019 15:57:46 +0000 (GMT)
Subject: Re: Redfish OpenBMC OEM
To: James Feist <james.feist@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <bec7abfa-8a69-3c8b-7985-dccb80d5c674@linux.vnet.ibm.com>
 <dcfd49c5-48a1-12aa-2f1e-56aef6232cfc@linux.ibm.com>
 <0967abf5-7eb4-8b72-2fe7-d8d4a95ca856@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <5e21e041-aa40-f1a1-e4eb-9aed63db368a@linux.ibm.com>
Date: Wed, 20 Nov 2019 09:57:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0967abf5-7eb4-8b72-2fe7-d8d4a95ca856@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_04:2019-11-15,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911200140
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
Cc: jason.m.bills@linux.intel.com, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/19/19 1:04 PM, James Feist wrote:
> On 11/19/19 10:03 AM, Joseph Reynolds wrote:
>> On 11/19/19 10:23 AM, Gunnar Mills wrote:
>>> Hi All,
>>>
>>> The process seems a little light for adding OpenBMC OEM Redfish 
>>> properties and schemas. Can we establish a little more stringent 
>>> process for adding these? Can we try to upstream these to the 
>>> Redfish standard first before they are added as OpenBMC OEM? Do we 
>>> need a design template or someway to collaborate before the OpenBMC 
>>> OEM schema or properties are added? Are we okay if pretty 
>>> architectural-specific or company-specific properties and schemas 
>>> are under the "OpenBMC" OEM namespace?
>>>
>>
>> I suggest getting started with a survey of what the project has. 
>> Given that we have Redfish Oem.OpenBMC Properties, we should document 
>> them (suggest: docs/designs/Redfish-Oem-Resources.md and using a 
>> format similar to the Redfish spec).  Doing so will help:
>> - users know what to expect from the interfaces,
>> - developers to understand the interface, and
>> - the OpenBMC community to help move these fields into the Redfish spec.
>>
>> The proposed Redfish-Oem-Resources document would serve as a good 
>> focal point for collaboration within OpenBMC as to how we want to 
>> extend the Redfish spec.
>
> There is already schema checked in for everything Oem, refer 
> https://github.com/openbmc/bmcweb/tree/master/static/redfish/v1/schema
>
> OemAccountService
> OemComputerSystem
> OemManager
>
> Redfish uses schema to define these things, I'd rather continue using 
> the schema files instead of creating a new document that could become 
> out of date quickly.
>

James, thanks for that reference.  You're way ahead of me.

Would the bmcweb/static/redfish/v1/schema directory be an adequate focal 
point for collaboration?  I think so:
  - Is it complete?  Does it list all of the OpenBMC Oem resources? Or 
(contrarywise) does OpenBMC have Oem resources which are not represented 
in that collection?
  - It seems like it is easy to search.
  - It would be easy to identify proposed changes to files in this 
directory during a gerrit review.

Gunnar, does that begin to address your concern?

- Joseph

>
>>
>> Reference:
>> Oem Resources are described in the Redfish spec (DSP0266) in the Data 
>> model chapter under multiple section such as OEM Resources and 
>> Resource extensibility.
>>
>> It seems to me that "OpenBMC" should be used for common elements and 
>> "company name" (such as "OpenPower" or "IBM") used when appropriate. 
>> Once again, the OpenBMC community needs to have a focus in this area 
>> to sort this out.  IMHO, having a document like 
>> Redfish-Oem-Resources.md would help.
>>
>>
>>> I think a majority of the OEM properties in the "OpenBMC" OEM 
>>> currently are things Redfish would take. I would like to see us 
>>> engage Redfish first.
>>
>> Agreed.  I understand this statement to mean that we should try to 
>> upstream new Resources into the Redfish spec first, before we accept 
>> them as Oem.OpenBMC resources.  Also, we should try to upstream the 
>> existing OpenBMC resources into Redfish.
>>
>> I think having a Redfish-Oem-Resources document would help provide 
>> focus to that effort.
>>
>> - Joseph
>>
>>>
>>> Some examples:
>>> FirmwareProvisioningStatus, 
>>> https://github.com/openbmc/bmcweb/commit/a6349918ad2c88533c6d09bb876812375a19f2c4 
>>>
>>>
>>> FanZones, 
>>> https://github.com/openbmc/bmcweb/blob/a6349918ad2c88533c6d09bb876812375a19f2c4/static/redfish/v1/JsonSchemas/OemManager/index.json#L248 
>>>
>>>
>>> Thanks,
>>> Gunnar
>>>
>>

