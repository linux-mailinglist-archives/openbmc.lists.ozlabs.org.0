Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9653125B83
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 07:37:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dhxn0M5nzDqnD
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 17:37:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dhx46lSrzDqmf
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 17:36:39 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBJ6W6A8110284; Thu, 19 Dec 2019 01:36:33 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x00sfpcks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 01:36:33 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBJ6X4RQ112763;
 Thu, 19 Dec 2019 01:36:32 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x00sfpckg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 01:36:32 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBJ6ZKOn009870;
 Thu, 19 Dec 2019 06:36:32 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 2wvqc6v4wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 06:36:32 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBJ6aVTX58589640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 06:36:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDA72C6057;
 Thu, 19 Dec 2019 06:36:30 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EB15C6055;
 Thu, 19 Dec 2019 06:36:30 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.157.51])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 19 Dec 2019 06:36:30 +0000 (GMT)
Subject: =?UTF-8?Q?Re=3a_Re=ef=bc=9a_How_can_I_add_a_user_for_openbmc_and_re?=
 =?UTF-8?Q?move_the_default_root_user=3f?=
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, =?UTF-8?B?5Y2X6YeO44Og44Or44K3?=
 =?UTF-8?B?44Ko44Op44K0?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <tencent_BBCBA6D64E821CDC3E0AD497B3C0FD77E509@qq.com>
 <4b32b6d0-da99-62c1-52f2-c2a7d4221dec@linux.intel.com>
 <tencent_74FD2ECBC3FF44DE65AAF884C881E0C34D05@qq.com>
 <a0e57fe5-e616-a0c2-a07a-a58407bebdfd@linux.intel.com>
 <7ff949ae-3292-09cf-071b-99385232e637@linux.vnet.ibm.com>
 <57829175-6ea3-8ed0-7e63-a36aa919f035@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <0899a69e-ee7f-2fed-557b-5d2f1eca5066@linux.ibm.com>
Date: Thu, 19 Dec 2019 00:36:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <57829175-6ea3-8ed0-7e63-a36aa919f035@linux.intel.com>
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_08:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912190054
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

On 12/18/19 6:42 AM, Thomaiyar, Richard Marian wrote:
> Hi Gunnar,
>
> Yes root user can't be deleted (basically uid 0), can't be deleted. 
> The method works for other users only, like in case Liu, he wants to 
> delete the newly created user.

FWIW, I am interested in moving the OpenBMC project away from having 
root login access enabled by default, and specifically disabling SSH 
access in general, and root access to the BMC's shell.  I also want to 
have a secure way to re-enable this when needed.  See 
https://github.com/ibm-openbmc/dev/issues/1528   Please let me know if 
you have any ideas on this topic.


I had understood the original question in this email thread as a request 
to "disable root access" so "root cannot login".  (Note that one 
consequence of disabling root login is that once you remove root access, 
it is hard to get back.  You'll have to use the sudo comand or su 
command from another user account, and I don't think sudo is present on 
OpenBMC systems.)

I understand that deleting the root user is not advisable because the 
system will break.  Instead the alternative is to disable access to the 
root account, for example, by doing one of:
- Change root's login shell to /sbin/nologin
- Change the root password to empty or lock the root password
- Change Linux-PAM to deny root account access
- Expire the root account (chage -E0 root)

Any idea which approach works best for OpenBMC?

- Joseph

>
> Regards,
>
> Richard
>
>
> On 12/18/2019 2:38 AM, Gunnar Mills wrote:
>>
>> On 12/16/2019 7:44 AM, Thomaiyar, Richard Marian wrote:
>>>
>>> Delete interface is exposed as part of the user object itself. 
>>> Sample busctl command to do the delete of an user under 
>>> phosphor-user-manager
>>>
>>> busctl call xyz.openbmc_project.User.Manager 
>>> /xyz/openbmc_project/user/<username> 
>>> xyz.openbmc_project.Object.Delete Delete
>>>
>>>
>>
>> I am missing something here.. This does not work for me. I didn't 
>> think we allowed removing the root user, which is why it is disabled 
>> on the WebUI? If we do allow deleting the root user, should this be 
>> allowed from the WebUI?
>>
>> When sshed as root:
>> busctl call xyz.openbmc_project.User.Manager 
>> /xyz/openbmc_project/user/root xyz.openbmc_project.Object.Delete Delete
>> Call failed: The operation failed internally.
>>
>> In the journal I see
>> Dec 17 20:57:56 w37 phosphor-user-manager[220]: userdel: user root is 
>> currently used by process 1
>> Dec 17 20:57:56 w37 phosphor-user-manager[220]: The operation failed 
>> internally.
>> Dec 17 20:57:56 w37 phosphor-user-manager[220]: User delete failed
>> Dec 17 20:57:56 w37 phosphor-user-manager[220]: The operation failed 
>> internally.
>>
>>
>> When sshed as an "Administrator" role account,  with the same call:
>> Call failed: Access denied
>>
>> NOTE: As an "Administrator" role I can't delete a user using "busctl 
>> call" only from the Redfish/WebUI, am I able to.
>>
>> Thanks!
>> Gunnar

