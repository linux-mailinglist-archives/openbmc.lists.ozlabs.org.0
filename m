Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D27202B46
	for <lists+openbmc@lfdr.de>; Sun, 21 Jun 2020 17:10:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qbb034v3zDqc6
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 01:10:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qbZ62hcSzDqZj
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 01:10:04 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05LF2pA9114905; Sun, 21 Jun 2020 11:09:59 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31shwu0uya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 21 Jun 2020 11:09:59 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05LEnOJD012712;
 Sun, 21 Jun 2020 15:09:58 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 31sa38kwhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 21 Jun 2020 15:09:58 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05LF9udL13238678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 21 Jun 2020 15:09:57 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC7D5136055;
 Sun, 21 Jun 2020 15:09:56 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 659AE13604F;
 Sun, 21 Jun 2020 15:09:56 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.159.135])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sun, 21 Jun 2020 15:09:56 +0000 (GMT)
Subject: Re: New ServiceRep role and privilege
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <5bc3f00a-208d-e21f-9707-0a569c2d8971@linux.ibm.com>
 <6652b824-7c46-c5c6-dec9-ef0584a086b4@linux.ibm.com>
 <e85bd1b8-c095-3314-e123-b2cf63db9d25@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <e6e23c4e-a9b8-5896-435d-f254f45c851e@linux.ibm.com>
Date: Sun, 21 Jun 2020 10:09:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e85bd1b8-c095-3314-e123-b2cf63db9d25@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-21_06:2020-06-19,
 2020-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 cotscore=-2147483648 mlxlogscore=999 suspectscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006210116
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

On 6/21/20 1:52 AM, Thomaiyar, Richard Marian wrote:
> Hi Joseph,
>
> I have added some more points on the use case,
>
> https://redfishforum.com/thread/333/proposed-new-servicerep-role-privilege?page=1&scrollTo=1178 
>
>
> have you made any proposal on it? Last time in security workgroup, i 
> didn't see much interest, but i am interested in getting it defined 
> and propose it to Redfish TF ?
>
> Let me know ?

Richard,  +openbmc

Thanks for your comments on thread/333 above.  I have some of the same 
questions as you.  I think our use cases have very much in common.  I 
had originally formulated ServiceRep and ManufacturingRep roles, with 
different privileges, but we converged them into the ServiceRep role 
that I am taking forward to Redfish.  First, I want to get a direction 
from the Redfish forum for how to handle our use cases.

I created a Redfish issue (https://github.com/DMTF/Redfish/issues/4057) 
to get a direction for adding the ServiceRep role and privilege.  This 
issue is readable only to DMTF Redfish members because the DMTF works 
privately.  I understand this issue will be discussed at the (private) 
Redfish forum meeting planned for this Tuesday June 23, 1-5pm CDT.  Can 
you attend or send a rep from your company?

- Joseph

>
> Regards,
>
> Richard
>
> On 6/4/2020 8:19 AM, Joseph Reynolds wrote:
>> On 6/3/20 9:31 PM, Joseph Reynolds wrote:
>>> This is a proposal to add a new ServiceRep role and a new 
>>> PerformService privilege to Redfish.  The motivation for this is 
>>> given in the "Isolate service privileges" email, as archived [1].
>>>
>>> To be clear: This email is asking the OpenBMC community for input 
>>> before approaching Redfish with a formal proposal. Would you be okay 
>>> with the changes described here, or do we have more considerations?
>>
>> I posted this topic to the Redfish forum to get their input: 
>> https://redfishforum.com/thread/333/proposed-new-servicerep-role-privilege
>>
>> - Joseph
>>
>>> The proposal
>>>
>>> 1. Add a new PerformService privilege with description: Can perform 
>>> service operations on components that this service manages.
>>> Reference: Update DSP2046 Redfish Resource and Schema Guide > 
>>> PrivilegeRegistry > Property details.
>>>
>>> 2. Add a new ServiceRep role with the same privileges as Operator, 
>>> plus the PerformService privilege.
>>> ServiceRep - Login, ConfigureComponents, ConfigureSelf, PerformService.
>>> Reference: DSP0266 Redfish Specification > Security Details > 
>>> Privilege model and authorization.
>>>
>>> 3. Update the Administrator role to optionally have the 
>>> PerformService privilege.  Make this an implementation decision 
>>> based on use case:
>>> - As an Administrator of a system that does not have dedicated 
>>> service personnel, I need the PerformService privilege so I don't 
>>> have to create a service account just to perform service operations.
>>> - As the OEM of a system that has dedicated service agents, I need 
>>> the Administrator to NOT have the PerformService privilege so they 
>>> cannot interfere with the service personnel.
>>>
>>> 4. Change various operations to require the PerformService 
>>> privilege.  For example, allow PATCH to an EthernetInterface 
>>> MACAddress.
>>>
>>> 4a. Reference: DSP8010 Redfish Schema > EthernetInterface.
>>> Change the MACAddress.readonly property to false.
>>>
>>> 4b. Reference: DSP8011 > Redfish PrivilegeRegistry > EthernetInterface.
>>> Add a PropertyOverride to target MACAddress for the PATCH operation: 
>>> require PerformService.
>>>
>>>
>>> Discussion points
>>>
>>> I believe this would be straightforward to implement in the BMCWeb 
>>> Redfish server [2].  For point 3 above (optionally assigning the 
>>> PerformService privileges), we can have an BMCWeb configuration 
>>> option or image feature.  I believe we need both use cases.
>>>
>>> Note that ServiceRep may need the ConfigureManagers privilege 
>>> depending on your service model.  Note also that a ServiceRep with 
>>> the ConfigureUsers privilege is really an Administrator with 
>>> additional powers, as discussed in the OpenBMC security working 
>>> group minutes [3] from 2019-11-21 and 2020-03-04. That may or may 
>>> not be what you want.  All kinds of fun here, we could even make 
>>> this configurable by the BMC admin. [4]
>>>
>>> To address how to protect against DSP2045 > "AccountService roles 
>>> allow an escalation of privileges", see discussion in the "Isolate 
>>> service privileges" email [1].
>>>
>>> The proposal described here does not fit neatly into the existing 
>>> Redfish model.  The PerformService privilege should optionally be 
>>> assigned to the Administrator role, depending on the use case. 
>>> Perhaps the Redfish spec could make that an implementation option. 
>>> Otherwise using a custom Role and OemPrivileges (as shown in the 
>>> DSP0266 > OEMSysAdminPriv example) would work.  We'll need to work 
>>> that out with Redfish.
>>>
>>> The alternate proposal using a custom Role & OemPrivileges would be:
>>> - Custom ServiceRep role, as above.
>>> - OemPrivilegePerformService, as above.
>>> - But with no changes to the Redfish spec.
>>> - A configuration option that determines whether or not 
>>> Administrator contains OemPrivilegePerformService.
>>>
>>> Is this the right way to think about alternate role and privilege 
>>> schemes, or is using custom roles and OemPrivileges the way to go?
>>>
>>> - Joseph
>>>
>>> [1]: https://lists.ozlabs.org/pipermail/openbmc/2020-June/021927.html
>>> [2]: https://github.com/openbmc/bmcweb
>>> [3]: 
>>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>>> [4]: Just joking.  That's extra works we don't need.
>>>
>>

