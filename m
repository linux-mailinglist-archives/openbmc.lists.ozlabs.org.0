Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC423A050
	for <lists+openbmc@lfdr.de>; Mon,  3 Aug 2020 09:32:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKqNK2K8YzDqVP
	for <lists+openbmc@lfdr.de>; Mon,  3 Aug 2020 17:32:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKqMW0SyWzDqSK
 for <openbmc@lists.ozlabs.org>; Mon,  3 Aug 2020 17:31:50 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0737OASD168609; Mon, 3 Aug 2020 03:31:47 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32pe5p05q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 03:31:46 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0737Thc7008248;
 Mon, 3 Aug 2020 07:31:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 32n01895en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 07:31:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0737UENU55247132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Aug 2020 07:30:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 262004C040;
 Mon,  3 Aug 2020 07:31:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 023564C044;
 Mon,  3 Aug 2020 07:31:39 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.227.221])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Aug 2020 07:31:38 +0000 (GMT)
Subject: Re: OpenBMC : FRU Inventory management
To: Andrei Kartashev <a.kartashev@yadro.com>, openbmc@lists.ozlabs.org
References: <BN8PR12MB32822ADFBBC19F6B2FB08F52C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <e00d409b-a845-85ee-16d7-0bb53f1e013e@linux.vnet.ibm.com>
 <BN8PR12MB32820389DABEE2E32ED84E57C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <3b6f8a090359d4ffebf3ef98a9aeb7e77df7b10f.camel@yadro.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <9a43f76f-0e19-428b-8e79-292c37e6f8f9@linux.vnet.ibm.com>
Date: Mon, 3 Aug 2020 13:01:37 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3b6f8a090359d4ffebf3ef98a9aeb7e77df7b10f.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_04:2020-07-31,
 2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008030051
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

On 31/07/20 2:30 pm, Andrei Kartashev wrote:
> Hi Deepak,
> 
> Saying about inventory management for non-BMC accessible resources like
> CPU/DIMM with EntityManager: is there good example demonstrated
> preffered way to do so?

Hi Andrei,

I don't think there is code today that does this. We intend to do this 
on IBM systems (using PLDM/MCTP). I had updated the PLDM design doc to 
do something like this using entity manager : 
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/32532/.

Regards,
Deepak

> Trying to bring up system based on that Intel's fork, but looks like
> they have own way to do things ).
> 
> On Thu, 2020-07-30 at 13:55 +0000, Vasant Patil wrote:
>> Thanks Deepak.
>> Yes, This help. We will go with entity-manager option.
>>
>> Regards,
>> Vasant
>>
>> -----Original Message-----
>> From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
>> Sent: Thursday, July 30, 2020 12:22 AM
>> To: Vasant Patil <vasantp@nvidia.com>
>> Cc: openbmc@lists.ozlabs.org
>> Subject: Re: OpenBMC : FRU Inventory management
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 30/07/20 8:37 am, Vasant Patil wrote:
>>> Hi Team,
>>>
>>> We are enabling OpenBMC on x86 system. We would like to know the
>>> recommendation on FRU inventory management and corresponding
>>> pointers.
>>>
>>> There seems to be multiple options available
>>>
>>>   1. described in  "Adding new system to OpenBMC
>>>      <
>>> https://github.com/openbmc/docs/blob/master/development/add-new-system.md>
>>> ;"
>>>      with  Yaml files (meta-romulus/recipes-phosphor/ipmi
>>>      
>>> <
>>> https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus/
>>> recipes-phosphor/ipmi>)
>>>
>>>   2. Entity manager <https://github.com/openbmc/entity-manager> with
>>> JSON
>>>      schema
>>
>> Hi Vasant,
>>
>> The commonly used option for this now is entity-manager. The entity-
>> manager config JSONs enable entity-manager to monitor/probe FRU
>> config information (FRU information read off of an EEPROM for eg) and
>> then transform that to an inventory D-Bus object that implements an
>> xyz.openbmc_project.Inventory.Item.<Type> interface. The webserver
>> (bmcweb) then can relay this into a Redfish inventory representation.
>>
>> To make the FRU EEPROM content available on D-Bus, anther app
>> typically reads the EEPROM and then hosts the info on D-Bus. For eg
>> the FruDevice daemon (which sits in the entity-manager repo) scans
>> I2C connected EEPROMs, and can read IPMI FRU format data off of them.
>> Now this info can actually be coming in via EEPROMs that the BMC
>> can't access (and for eg the host CPU can) - in that case I would
>> expect the FRU information to be transported over IPMI/PLDM, and then
>> apps like host-ipmid or pldmd can place the FRU information on D-Bus,
>> for entity-manager to consume.
>>
>>> We are looking to enable below inventory (Both FRU and non-FRU):
>>>
>>>    * CPU
>>>    * DIMM
>>>    * M.2
>>>    * U.2
>>>    * Motherboard FRU EEPROM
>>>    * Chassis FRU EEPROM
>>>    * Add-on PCI cards
>>>    * FANs
>>>    * PSU
>>>    * Etc.
>>
>> You can look at
>> https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Inventory/Item
>> and define types that you don't find here.
>>
>> Regards,
>> Deepak
>>
> 

