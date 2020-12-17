Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB82DD63F
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 18:32:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxfFh4L9YzDqVk
	for <lists+openbmc@lfdr.de>; Fri, 18 Dec 2020 04:32:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AXdwtC1k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxfDr2rX2zDqRR
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2020 04:31:39 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHHVbPm070850; Thu, 17 Dec 2020 12:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=P2OERsSgI1E3MlEYcCqzb/dF1O0iZvc22llEeaEGoyY=;
 b=AXdwtC1kNyazaWS5fYol+XoVZmnW2EJ+HgSgkAM5QRdT1RmOzUeVHYD7TxYwAC5Sk+mu
 wG4VByb8/X/+AIwgd6tdIJW54XUDql+ThCH8TQjDTw26HpsH9rTa/XNC+2sjcTrnbJXM
 //sZk6/5NMIOGsLTh+AbyOhNa0qUTtODmKhJzg9QYs8pYOsE2VHp4qBp6j/3fMfV1eSy
 RiUjSSMIaalB9cw0K+NSMVfnLBYrUmF0rwW8IjWAvLI2Vb1lrMXVghpmrQfNtkXo8xg5
 w0cPs8WsuxfC7LVPrOC1P5ZIDM5HLvOd8DN2XdcfmedtLgYN3KYB8zCo0L4fbZNWoR4C zw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gbkk89yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 12:31:37 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHHSRNv017495;
 Thu, 17 Dec 2020 17:31:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 35cng9um8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 17:31:22 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHHVKfC14483790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 17:31:21 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0AE5C6057;
 Thu, 17 Dec 2020 17:31:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B202C6061;
 Thu, 17 Dec 2020 17:31:20 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.152.17])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 17 Dec 2020 17:31:20 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Proposal add PerformService privilege
To: Ed Tanous <ed@tanous.net>
References: <1bfe87ea-9fc5-8664-d1de-d3138616a427@linux.ibm.com>
 <CACWQX83Rc1pTmPbv9xhca-mMyGHenrVbj0a9oikOxHPy=XFxQA@mail.gmail.com>
Message-ID: <83f68884-9e4a-7d5f-18b9-f054de0ab4ed@linux.ibm.com>
Date: Thu, 17 Dec 2020 11:31:19 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CACWQX83Rc1pTmPbv9xhca-mMyGHenrVbj0a9oikOxHPy=XFxQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_11:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170117
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/9/20 12:25 PM, Ed Tanous wrote:
> On Fri, Dec 4, 2020 at 12:13 PM Joseph Reynolds<jrey@linux.ibm.com>  wrote:
>> This is a proposal to add an OemOpenBMCPerformService privilege to BMCWeb.
>>
>> Seehttps://redfishforum.com/thread/397/redfish-direction-update-eeproms
>> As mentioned in the Redfish forum thread, the use case is that some
>> OpenBMC use cases require isolating manufacturing and service functions
>> away from the customer/admin (including updating FRU serial numbers, and
>> updating a permanent MAC address), and this is a Redfish compatible way
>> to do it.
>>
>> The work items would be like:
>> - Add this OEM privilege to the base BMCWeb implementation.
> Can you talk through how you would do this mechanically?  Today, we
> rely on privilege registry (published from DMTF) to guide these roles
> and urls.  Now that you've invented a new role, how do you plan on
> fitting that in?  Will it be required for all systems?  Will it be
> optional?  Will it only apply to OEM schemas?

Note: Around the same this this email was sent, we discussed this in the 
Security working group 2020-12-09, with minutes here:
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI

Here are the basics of the low level design:
#. Enhance redfish-core/include/privileges.hpp -- add the new 
"OEMPerformService" privilege.
#. Enhance redfish-core/lib/roles.hpp -- add OEMPerformService to thje 
existing Administrator role && add the new "ServiceAgent" role #ifdef's 
by a new config option.
#. Modify the privilege map for individual operations as appropriate to 
require the OEMPerformService privilege.

However, you are correct that this may not be the best approach. See below.


>> - Identify URIs that we need to be able to isolate away from
>> customer/admins.  Then modify the privilege mapping to require this
>> privilege to PUT to those URIs.
> What URLs have what privileges is already defined by DMTF in the base
> privilege registry.  What you're talking about would require a
> customizable privilege registry, which definitely needs some
> significant thought, as the current privileges mechanisms in bmcweb
> are very static today.  Just "customizable privileges registry" is
> probably a design on its own, and would likely need to land before
> adding OEM privilege levels.

That makes sense.  However, some URIs are outside the scope of Redfish 
including:
- The URI named by the Assembly BinaryDataURI property.
- Various manufacturer-specific REST APIs.

>> - Add this privilege to the Administrator role (but not Operator or
>> ReadOnly).
> If we're adding this privilege to the Administrator role, how does it
> differ from ConfigureManager role?

The main idea is that the Redfish-defined Administrator role *by 
default* has all Redfish standard privileges.  But I don't think this 
applies to OEM privileges, so I am re-thinking this point.
My point remains that I need a separate OEMPerformService privilege; 
having this privilege enables my Enterprise Server system to remove this 
privilege from admins, and give it to my service agents.
I'm not sure if I understood or answered your question.

>> - Document how to isolate these operations.  Specifically, remove this
>> privilege from Administrator, and create a custom OEM role that has this
>> privilege
>>
>> What do you think?
> I think we've got a couple designs that would need to land ahead of
> this before we'd have the infrastructure and documentation to build
> something like this.
>
>
> The designs I see coming before this are:
> Static PrivilegeRegistry implementation
> modifiable/dynamic Per-URI privilege registry implementation
> modifiable/dynamic Per-property privilege registry implementation
> OemOpenBMCPerformService registry added.

Yes, we discussed this in the workgroup call.

Specifically, we discussed making a better privilege registry 
implementation.  Redfish (DSP0266) defines an operation-to-privilege 
mapping and is represented as a Privilege Registry.

BMCWeb currently implements the Redfish authorization model as a mapping 
from URI -> HTTP verb -> privileges.  The privilege overrides are 
hard-coded in C++ in each operation handler.

If I understood this correctly, the first step is to enhance BMCWeb to 
directly use the published Redfish PrivilegeRegistry (such as 
Redfish_1.0.4_PrivilegeRegistry.json).  Elements includes:
- Add new build step to convert the PrivilegeRegistry file into C++ code 
that implements the authority checking.  The main ideas are: a 
downstream implementation can easily customize their PrivilegeRegistry 
and it will automatically build into the code. And performing the 
authority check must be fast and efficient.
- The set of privileges is part of the Privilege Registry, and its 
implementation should be enhanced accordingly.
- Handling the basic "privilege and and or syntax clauses" is 
straightforward.  Handling Resource URI overrides seems 
straightforward.  Handling property overrides I need to think about 
more.  And I am not aware that BMCWeb has any Subordinate overrides
- All the overrides can be build-time configurable; I do not need 
dynamic changes to the privilege registry.

I plan think about this over break,and have a proposal in January 2021.

Thanks!
Joseph

>> - Joseph
>>

