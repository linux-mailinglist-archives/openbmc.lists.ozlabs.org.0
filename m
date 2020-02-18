Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA81161E44
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 01:49:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M2Lh23mFzDqXv
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 11:49:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M2Kz4WsgzDqXT
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 11:49:11 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01I0j9xZ041815; Mon, 17 Feb 2020 19:49:00 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6af3p8a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 19:49:00 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01I0eNgR023362;
 Tue, 18 Feb 2020 00:49:00 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 2y68965xwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 00:49:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01I0mx0x11338720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 00:48:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9CAD112064;
 Tue, 18 Feb 2020 00:48:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76C32112062;
 Tue, 18 Feb 2020 00:48:59 +0000 (GMT)
Received: from demeter.local (unknown [9.85.150.250])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 18 Feb 2020 00:48:59 +0000 (GMT)
Subject: Re: New Redfish roles for ServiceRep and OemRep
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <a0c457af-88a5-08dd-91fa-357f47dfe93d@linux.ibm.com>
 <6bb93465-ee23-ee6b-3d82-bfd944ea0706@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <209acd02-17ac-a6eb-c11e-0b945db8cf7c@linux.ibm.com>
Date: Mon, 17 Feb 2020 18:48:58 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <6bb93465-ee23-ee6b-3d82-bfd944ea0706@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_14:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002180002
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

On 2/17/20 1:29 AM, Thomaiyar, Richard Marian wrote:
> We need to make sure user account are not getting created in this role 
> by end-user. i.e. when creating a new user, these options must not be 
> provided. We need to have a separate way of selecting this role or 
> instead of not defining as role, we can add this as some mode in redfish.

Yes, I am looking for a solution to this: I don't want a BMC admin to be 
able to create a user account and escalate their privilege to the 
ServiceRep or OemRep role.  Only the Oem and Service organizations 
(which may be different) should be able to access the BMC with these roles.
Redfish offers no help here and simply notes that the BMC admin can 
become whatever role they want.  It's up to us to define what we need.

Some options are:

1. Don't define the role (or disable it in your distro).  ==> This 
doesn't help us.

2. Have a predefined user with that role, and don't give those 
credentials to the BMC admin.  ==> This doesn't let us change the 
credentials, and relies on the credentials remaining secret, which 
violates best practices.

3. Have a special mode that makes additional operations available. ==> 
This requires you to do one of:
(A) Permanently disable that special mode (like FieldMode or some other 
process during the manufacturing process).
(B) Have a way turn the mode back on ... but how to do that securely so 
the OEM or service can do it, but not the Admin.  Maybe have the admin 
install a certificate?
(C) Have a secret way to toggle the mode, which violates best practices.

4. Bake a special OemRep and ServiceRep certificate into the BMC 
firmware image and use that to authenticate the ServiceRep.  I tried to 
explain in an IBM issue 
(https://github.com/ibm-openbmc/dev/issues/1530), with the relevant 
parts cut & pasted & edited here:
 > To ensure the admin cannot assume the ServiceAgent and 
ManufacturerRep roles, I think we would need to:
 >  * Have a certificate baked into the firmware image.
 >  * Use the baked-in certificate to validate the certificate the 
ServiceAgent would have to uploads as part of their authentication. The 
certificate is rejected if it wasn't signed by the baked-in certificate. 
In this way, the service agent could gain access, but the Admin will not 
have access.
 >  * Note the Admin will still have full control over the service 
agent's account. In this way, the admin and service agent would have to 
agree before the ServiceSystem privilege could be used to perform a 
sensitive operation.


Despite the challenges, I think it is valuable to begin to create the 
ServiceRep role, even if we don't have a good way to lock out the admin.

> Note: Currently we are using SpecialMode 
> (https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Security/SpecialMode.interface.yaml) 
> called Manufacturing mode, and certain activity can be done, when we 
> are in this mode (i.e. Administrator role user in this mode will be 
> able to do certain operations).

Thanks for explaining.  I had not considered using a special mode for this.

- Joseph


> Regards,
>
> Richard
>
> On 2/15/2020 1:51 AM, Joseph Reynolds wrote:
>> This is to propose two new Redfish roles:
>>
>> The BMC Administrator should not have access to operations involving 
>> the manufacturing process or servicing the host because these 
>> operations can damage the system or cause unintended operation.
>>
>> Examples of access needed:
>> 1. ServiceRep - Needs to access BMC operations to service the system, 
>> such as re-enabling locked out field replaceable units (FRUs) after 
>> replacing a defective unit.
>> 2. OemRep - Needs to access BMC operations to test the host system, 
>> such as how the system responds to overheating.
>>
>> I believe these roles are clearly distinct from role=Administrator or 
>> any other role.
>>
>> The roles should NOT have access to the BMC's configuration or user 
>> management.  For example, the BMC admin will be able to lock out any 
>> service agent or OemRep using the regular user management functions.
>>
>> Does anyone else need for these roles?  If so, I will try to get them 
>> into Redfish.
>>
>>
>> - Joseph
>>
>> This topic was discussed briefly in the OpenBMC security working 
>> group, 2019-11-27: 
>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>>
>> See also: https://github.com/ibm-openbmc/dev/issues/1529
>>

