Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9CC64BA1
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 19:45:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kRRb3jt3zDqMw
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 03:45:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kRQd3qlVzDqJk
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 03:44:41 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6AFvQl3104353
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 12:01:37 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tnjkusqyn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 12:01:37 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Wed, 10 Jul 2019 17:01:33 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Jul 2019 17:01:30 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6AG1TCZ54329672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 16:01:29 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5181FB2068;
 Wed, 10 Jul 2019 16:01:29 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20EF5B2066;
 Wed, 10 Jul 2019 16:01:29 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 10 Jul 2019 16:01:29 +0000 (GMT)
Subject: Re: Questions about changing default username or password
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 =?UTF-8?B?U2ltb24gWmh1KOacseiLsea+jSk=?= <zhuysh@inspur.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <FF401BD5-4C8A-4F01-8B6B-3138E4A458DB@inspur.com>
 <680f0ea6-c986-42f2-1185-dcd62c7db1ba@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Date: Wed, 10 Jul 2019 11:01:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <680f0ea6-c986-42f2-1185-dcd62c7db1ba@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071016-0064-0000-0000-000003F96590
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011405; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01230220; UDB=6.00647963; IPR=6.01011489; 
 MB=3.00027667; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-10 16:01:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071016-0065-0000-0000-00003E351171
Message-Id: <4b6dd8b3-a191-7b35-11e2-6986f5d78018@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907100181
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

I believe we share the desire for network access to the BMC to be secure 
by default, specifically to move away from the model where a well-known 
userid has a default password (#1 below).  I understand an [OpenBMC 
Security modes 
design](https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21195) 
document, currently in review, addresses host access to the BMC. 
Although that design addresses a related topic, am I restricting myself 
to the BMC's network operations.

Here are several models -- with my comments:

1. The userid has a default password. -- This is what we have now and it 
is not secure.  Note that merely changing to a different default 
password in your customized firmware image is also not secure because 
that password will become known to attackers

2. Each BMC device has an unique password. -- This may be difficult to 
consume for large scale deployments

3. The userid has a default expired password which does not let you use 
the device until you change the password.

4. The device has an initial setup which challenges you to change the 
password. -- Example: 
https://projects.raspberrypi.org/en/projects/raspberry-pi-setting-up/6

5. The userid has no password access, and uses only certificate-based 
authentication.

These models have different security characteristics.  For example, the 
expired password model  (#3 above) and the initial setup model (#4 
above) work by reducing the time window an attacker has, with the 
explicit assumption that the BMC is configured soon after powering it 
on.  The unique password model (#2 above) and the certificate auth (#5 
above) requires a way to generate and set the credentials, and then 
communicate them to the new device owner.

Which model seems best to you?

It may be that we support multiple models.  Whatever happens, I would 
like to eventually move away from supporting the default password model 
(#1 above).

I am exploring the "expired password" model (#3 above) and plan to push 
a design for review.

A challenge to make this work is to tie together BMCWeb, IPMI, and SSH 
access.  For example, it won't help to secure BMCWeb and network IPMI 
but leave a default SSH password.  Also, some installations enable a 
subset of the function (example: disable network IPMI and SSH, leaving 
only BMCWeb), so the function to let you change the password has to be 
on the interfaces which are still enabled (example: BMCWeb).

Please let me know your thoughts.

- Joseph


On 6/2/19 1:25 PM, Thomaiyar, Richard Marian wrote:
>
> For #1 --> you can inherit extrausers class and override the users 
> accordingly, and the password
>
> For #2 --> There is no direct way to update /etc/ipmi_pass, but once 
> this image is flashed, login to bmc serial console, then try to 
> execute passwd and update the password to the desired one (during this 
> scenario, the new password is stored back in /etc/ipmi_pass). Now copy 
> this /etc/ipmi_pass from your BMC to your development environment, and 
> override it using bbappend.
>
> Note: Our ultimate goal is to get rid of the default user name and 
> password from the system (to whichever project it is feasible for 
> security reason -- 
> https://github.com/openbmc/docs/blob/master/user_management.md#deployment---out-of-factory) 
>
>
> Let me know if you need any further clarifications
>
> Regards,
>
> Richard
>
>
> On 5/31/2019 5:56 AM, Simon Zhu(朱英澍) wrote:
>> Hello ,
>>
>>     I want to change default username and password in local.conf.sample.
>>
>>     But caused an invalid username error.
>>
>>     I fixed it in the following way in 
>> /openbmc/openbmc/meta/recipes-extended/shadow/shadow.inc:
>>     I moved the patch shadow-relaxed-usernames.patch from 
>> SRC_URI_append_class-target to SRC_URI.
>>
>>
>>     And If I changed the default username or password, I failed to 
>> use IPMI through lanplus interface because of authentication failure.
>>     I need to generate my own ipmi_pass and install it to 
>> /etc/ipmi_pass。
>>
>>     Do these two issues need to be fixed?
>>
>> Best regards,
>>
>> Simon
>

