Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F59A347
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 00:49:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46F08l0PQRzDrfV
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 08:49:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F0872brWzDrTG
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 08:49:10 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MMg4Rm097963
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 18:49:07 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uj3b59g86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 18:49:07 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7MMeHE3028305
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 22:49:06 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 2ue976dm5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 22:49:06 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7MMn5vO47251760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 22:49:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55DF4C6055;
 Thu, 22 Aug 2019 22:49:05 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11063C6057;
 Thu, 22 Aug 2019 22:49:04 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 22 Aug 2019 22:49:04 +0000 (GMT)
Subject: Re: Initial expired passwords - low level designs
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <b15904b6-aeaa-f3b1-1a62-ba7217727b79@linux.ibm.com>
 <38b5f461-98d8-4152-3795-cfa3e975d178@linux.vnet.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <3a5d8de0-bb39-f2de-ffbc-b1900d864f88@linux.ibm.com>
Date: Thu, 22 Aug 2019 17:49:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <38b5f461-98d8-4152-3795-cfa3e975d178@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220199
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


On 8/21/19 10:19 PM, Ratan Gupta wrote:
> Hi Joseph,
>
> On 19/08/19 10:32 PM, Joseph Reynolds wrote:
>> This is an attempt to over-communicate progress on the [Initial 
>> expired passwords design][], currently in review.  This email has the 
>> significant and tricky work items needed to implement the design. 
>> Emails about the BMCWeb pieces that need to be changed are [here][]; 
>> in contrast, this email attempts to decompose the overall design.
>>
>> [Initial expired passwords design]: 
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849
>> [here][]: 
>> https://lists.ozlabs.org/pipermail/openbmc/2019-August/017625.html
>>
>> The "initial expired passwords design" includes the following work. 
>> An understanding of that design is a pre-requisite to understand the 
>> items here.
>>
>> 1. Implement the new EXPIRED_PASSWORD image feature (initially off).  
>> This ensures the password is expired for all local users. The right 
>> place to do this piece is in Yocto/OpenEmbedded; see 
>> https://lists.yoctoproject.org/pipermail/yocto-security/2019-July/000114.html
>>
>> 2. Enhance BMCWeb to handle Redfish PasswordChangeRequired 
>> (reference: 
>> https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.7.0.pdf 
>> ("Redfish Specification" version 1.7.0 or later) section 13.2.6.1).
>> This further breaks down into:
>>
>> 2a. Add the PasswordChangeRequired field to 
>> /redfish/v1/SessionManager/Sessions/<session>.  This new field comes 
>> from PAM_NEW_AUTHTOK_REQD.
>   Are you mentioning the OEM filed in the session schema ? I think 
> that we should define a new error message that will tell that password 
> change required during creation of the session.
>>
>> 2b. Add the PasswordChangeRequired field to 
>> /redfish/v1/AccountManager/Accounts/<account>.  Does this require 
>> D-Bus changes?
>   I understand that PasswordChangeRequired filed is supported by the 
> redfish in the account schema, but how it would be useful.
>   Suppose we have the implementation for the above then how does user 
> knows that his password has been expired.
>   He has to create the session which should tell that his password has 
> been expired.

I understand.  Perhaps we do not need this new field.  Let's drop this 
change.

>
>  2c. Tweak the authority model to handle privilege ConfigureSelf which 
> applies only to *your* Session or Account and is intended to encompass 
> all the privileges needed change your own expired password.  I am 
> pursuing this question in private Redfish forums (issue 1986).
>
> My suggestion is to allow the session to be created with the expired 
> password and the session with expired password only allow to change 
> the password for that account.
> Other redfish interfaces should be restricted to access.

That was the same as my idea.  This is also the same idea as the Redfish 
PasswordChangeRequired spec.  With that spec, the flow to change your 
expired password is:
1. User signs into Redfish with an expired password.
2. Redfish creates a Session which has the a @Message.ExtendedInfo 
object in the response containing the PasswordChangeRequired message. 
That's how the user knows their password needs to be changed.  The 
session carries only the Redfish ConfigureSelf privilege, which 
restricts the session to only changing that user's password.
3. The user PATCHes the new password into their Account.
4. The user DELETEs their Session.

Any other attempted use of that session would get HTTP response code 403 
with a body that includes a @Message.ExtendedInfoobject containing the 
PasswordChangeRequired message from the Base Message Registry.

Most of the detail above is directly from the spec version 1.7.0, 
section 13.2.6.1.

The details about using the Redfish ConfigureSelf privilege are given in 
the Redfish Schema Supplement, version 2019.1a, 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0268_2019.1a.pdf

The detail about having a property override for the ManagerAccount 
Password property is given in the Redfish privilege registry (such as 
https://redfish.dmtf.org/schemas/v1/PrivilegeRegistry.v1_1_3.json) 
although the current spec is less clear on this topic.

>>
>> 2d. Tweak the authority for the 
>> /redfish/v1/AccountManager/Accounts/<account> "Password" property as 
>> a Redfish "property override".  The Password property needs to have a 
>> different authority than the other ManagerAccount properties in that 
>> same account.
> Why do we need property override for the same? User can change it's 
> own user configuration eg password etc.  why different authority for 
> the password?
> Seems I am missing something here.

This is following the Redfish spec (override for the ManagerAccount 
Password property) and the example in section 13.2.10.5 ("Property 
override example") of the Redfish spec 1.7.0.

The idea is that you must have the Redfish ConfigureUsers privilege to 
PATCH any account data, and the ConfigureSelf privilege only lets a user 
PATCH their own Password (and no other properties of their own 
account).  That's the definition of a Redfish property override.

>>
>> 3. Enhance phosphor-webui to handle the expired password dialog at 
>> login.  This will use the enhanced Redfish APIs. See 
>> https://github.com/ibm-openbmc/dev/issues/1048
>>
>> 4. Enhance Dropbear SSH so a user can change their expired password.  
>> See 
>> https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2016q2/001895.html 
>> This piece is optional, but I would like this to be available. The 
>> alternative is to use the OpenSSH server instead of Dropbear. The 
>> right place to do this piece is in Dropbear.
> What about IPMI? As you mentioned we need to support this through IPMI 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849/3/designs/expired-password.md#98
> How does user knows that his password has been expired via inband 
> access IPMI?

I don't know so much about IPMI.  I was told the IPMI RAKP+ spec does 
not allow access from an account which has an expired password.  At this 
time, I have no way to know  the password is expired via the IPMI 
interface.  Is there a way to do it?

If you have unauthenticated access to IPMI, I think you could do 
something like: `ipmitool user set password 1` to change the password.  
I'll add this test case to my design review.

- Joseph

>>
>> - Joseph
>>
> Ratan
>

