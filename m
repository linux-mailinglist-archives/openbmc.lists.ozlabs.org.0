Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 031A71E4826
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 17:48:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XFbl02zdzDqFZ
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 01:48:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s62zGKez; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XFYq4J43zDqQK
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 01:46:38 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04RFXYjf024960; Wed, 27 May 2020 11:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qqRFSNI/ARCEUOzjkslHhiG9SQFfh/UhyBDOmBaYbvI=;
 b=s62zGKez47BewuNkZ04WfYMEMAXNJ70iFY3Z+bhYRaqUYsF/GEzu2vtJIbqjUtokQdxV
 LYnHg0aXnlkNZSybZ52rh6+jUrm3sMt7XWsq2A0HWnnuLhIKvAof5gmXiU5s7bBdUqlG
 BcBz2fh/TLo8RucTGt1VQ2SJGPWFF3MSY8aVNseQTmSfyX2gVvIrUmlAWm/7ttRg91MD
 g53lEUWPkdqnU5P1fQ9R+EHN7XcGojE6HL6IIDp+IPWEFWoxCeuCwmxuTP6smjwlowzm
 YksgHlQG3tDXwI9SUGTE4UHJOU5EdrPlkEN+TwP1/buN5tFchlpq1yg44kRyL4r5mtuz Qg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 319shhbvjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 May 2020 11:46:30 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04RFfJf5020053;
 Wed, 27 May 2020 15:46:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 316uf885b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 May 2020 15:46:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04RFkPsH60948612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 May 2020 15:46:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B289611C058;
 Wed, 27 May 2020 15:46:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F09511C052;
 Wed, 27 May 2020 15:46:23 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.237.76])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 May 2020 15:46:23 +0000 (GMT)
Subject: Re: D-Bus interface to provide data to entity manager
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <0a9b8934-a3be-aaa0-90c0-134f286df951@linux.intel.com>
 <c2872079-ffba-1788-69b5-50350e21f1a3@linux.vnet.ibm.com>
 <55702d05-66c0-275e-880b-06e6c7c1203e@linux.intel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <531a5ace-1537-dcc1-33c7-427470dada8b@linux.vnet.ibm.com>
Date: Wed, 27 May 2020 21:16:22 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <55702d05-66c0-275e-880b-06e6c7c1203e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-27_03:2020-05-27,
 2020-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 cotscore=-2147483648 mlxscore=0
 mlxlogscore=974 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270118
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27/05/20 8:55 pm, Thomaiyar, Richard Marian wrote:
> 
> On 5/27/2020 7:28 PM, Deepak Kodihalli wrote:
>> On 27/05/20 7:20 pm, Thomaiyar, Richard Marian wrote:
>>> I always view D-Bus interface as a specification / API which can work 
>>> with different producers / consumers (correct me, if that's not what 
>>> we intend with D-Bus interface here). Problem with Option 1 is, it 
>>> will end up in having multiple producers exposing different 
>>> interface, and thereby consumers(user interface facing applications) 
>>> of D-Bus must be aware about all the D-Bus interfaces and always 
>>> requires change.
>>>
>>> Consider, we want to expose ChassisType, then irrespective of PLDM 
>>> FRU / IPMI FRU / Proprietary FRU, Consumer applications must read it 
>>> in the same manner. Having different interface / property types, 
>>> requires update in both the end. PLDM FRU / IPMI FRU can be in common 
>>> form (except few nit's /OEM's). We need to make sure it is 
>>> represented in that angle. As of today phosphor-dbus-interfaces 
>>> doesn't have FRU interface, but it has inventory related interfaces 
>>> (exposed by Entity-Manager), which is what Redfish uses (i.e. 
>>> Indirectly the FruDevice exposed interface is hidden by 
>>> Entity-manager, and inventory interface exposed by entity-manager is 
>>> used).
>>>
>>> As of today, entity-manager doesn't add Inventory interface 
>>> automatically for Add-on cards (which doesn't have any json 
>>> configuration), but needs exposure (say PLDM based Add on card 
>>> devices will be of this type), but shouldn't be hard to add it anyway.
>>>
>>> Now the question is do we want to expose FRU as a separate interafce 
>>> to be used in User facing application, or shall we just use Inventory 
>>> based interface itself ?If inventory itself can be used, then let's 
>>> go ahead and add more fields to those if missing anything / correct 
>>> the same accordingly.
>>>
>>> James, Deepak, Patrick - your thoughts ?
>>
>> I guess there is a difference between FRU and inventory. If inventory 
>> interfaces could be used directly, why wouldn't the FruDevice or PLDM 
>> apps directly host inventory objects, why even use EM?
>>
> [Richard]: Inventory.Decorator is used in Redfish. i.e. Today Frudevice 
> & it's interface exposed is consumed by Entity-Manager alone & Entity 
> manager exposes all the needed configuration along with 
> Inventory.Decorator.Asset interface. (As you stated, inventory does more 
> than what FRU has to expose, but i am trying to see can we use 
> Inventory.Decorator itself to expose these needed FRU information?). 
> James F ? (Maintainer of both EM & bmcweb)
> 
> Current Behavior:
> 
> Say - Baseboard fru information is exposed by FruDevice, and Entity 
> Manager exposes the sensor or any configuration required for platform A 
> or Platform B (based on fru device data). Entity-manager also expose 
> Inventory interface which hides the manufacturer name exposed by FRU, 
> but exposes the it as Manufacturer in the Inventory interface and 
> Redfish uses this).
> 
> In case of exposing the PLDM FRU
> 
> Option 1:
> 
> If we need to rely on PLDM FRU, then Entity-Manager will probe the 
> FruDevice data exposed by PLDM FRU daemon, and expose the inventory 
> (both for sensor configuration and decorator Asset), we don't change any 
> upper layer application. We can follow the same design for the PLDM FRU 
> daemon.

Yes, the question remains as to what kind of D-Bus interface does the 
PLDM daemon use. Make it's own, similar to xyz.openbmc_project.FruDevice 
(which the FruDevice daemon makes), or use a PLDM specific one (for 
which I have a patch on Gerrit), or use a common interface that can be 
used by both FruDevice and PLDM.

> Note: Currently, it doesn't have a mechanism to expose all the FRU 
> devices as Inventory.Decorator interface automatically when there is no 
> json configuration for it in EM. This needs to be fixed (say for PLDM 
> based Add-on card).
> 
> Option 2:
> 
> Define new FRU interface (common for both PLDM, IPMI etc.), similar to 
> inventory and this itself will be used by both Entity-manager & user 
> level interface application (say Redfish).

I didn't intend this to be something that describes inventory, but 
rather a common (to PLDM, FruDevice, other apps) alternative to 
xyz.openbmc_project.FruDevice, which is what the FruDevice daemon hosts 
on D-Bus today. EM can continue to make objects that implement 
xyz.openbmc_project.Inventory.Foo interfaces, since they represent 
inventory information.


> (Problem with option 2 is it requires changes in Currenr behavior, and 
> redfish etc, may need to update it's code to use the common FRU 
> interface rather than inventory.Decorator).
> 
> Regards,
> 
> Richard
> 
>> I believe these apps (FruDevice, PLDM daemon) operate at a per FRU 
>> level, and rely on something like EM to make one or more inventory 
>> objects based on the FRU data. So that was my option 2, a generic FRU 
>> properties interface. I'm just not sure at the moment the 
>> impact/interest of doing something like that and then aligning 
>> FruDevice and EM to the same.
>>
>> Thanks,
>> Deepak
>>
>>>
>>> regards,
>>>
>>> Richard

