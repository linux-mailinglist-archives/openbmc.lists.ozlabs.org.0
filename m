Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DC6448D8
	for <lists+openbmc@lfdr.de>; Tue,  6 Dec 2022 17:10:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRQP22XM7z3bZk
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 03:10:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h2akPIQ8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h2akPIQ8;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRQMZ3JGYz2xVr
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 03:08:58 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6G6BDk008020;
	Tue, 6 Dec 2022 16:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=BKTeHdJWR6IeXTZpqlS8kek5A33xW7g5NtrLaVF86yg=;
 b=h2akPIQ8rzxmSjLR7Bf5h/b5T96c1RDrbWI8ICd6qZ5Z2sve0cg4yO7qUDhV8A7LZkZ/
 HzvwA8d8m+ww7SNo2LbHdeyd5u3oddtV4HgomCBBqqwFF97foIYTZZFeMn3aMCnsWNao
 VG11Ie7U2GovlktSqM5NtUnLpmYfpq7GzxtFzS+/cmgPvhWHr0dpGPRmk2/8jhf3XLel
 9oTilQQ1aG8rKVZvh5BTyLMMDrm/Kh3UIonkhYO8tdriUiFtY3okVMA8+CrnUB5IwjQP
 SjyHgvBP4lM7gTz6bAR2/i1+M+jYDQ3TU/XK2GlCNHKOfJZ0KkesrVhdsv2aBM5tafXo PQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m9tqmnede-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 16:08:49 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B6G025x017666;
	Tue, 6 Dec 2022 16:08:49 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3m9nygp7hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 16:08:49 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B6G8lvB5636718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Dec 2022 16:08:48 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBB135806C;
	Tue,  6 Dec 2022 16:08:47 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36DC958056;
	Tue,  6 Dec 2022 16:08:47 +0000 (GMT)
Received: from [9.65.196.87] (unknown [9.65.196.87])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  6 Dec 2022 16:08:47 +0000 (GMT)
Message-ID: <b3a14275-1c66-4d54-5a91-4ddf73d16992@linux.ibm.com>
Date: Tue, 6 Dec 2022 10:08:46 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: Potential high risk for readonly/operator users on BMC console
 access
Content-Language: en-US
To: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
References: <496697FB-7A80-4F2B-BC4A-8955016082CD@amperemail.onmicrosoft.com>
 <0d89ea81-3f9a-3b59-6b82-5e503596e1a4@linux.ibm.com>
 <1AE3EBA0-0E46-47DE-BEF7-B7A0F4275D14@amperemail.onmicrosoft.com>
 <83f99d00-b72f-8136-2027-c248f2bc7d08@linux.ibm.com>
 <45DFD31D-2961-47B1-BE2D-44ED61B43662@amperemail.onmicrosoft.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <45DFD31D-2961-47B1-BE2D-44ED61B43662@amperemail.onmicrosoft.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -eGBkeIm4_r6480KkcB-uci_Dha-x3MR
X-Proofpoint-ORIG-GUID: -eGBkeIm4_r6480KkcB-uci_Dha-x3MR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_10,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060133
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
Cc: Phong Vo <pvo@amperecomputing.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Phong Vo OS <phong@os.amperecomputing.com>, Nga Nguyen <nga.nguyen@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/5/22 2:55 AM, Thang Nguyen OS wrote:
> On 2 Dec 2022, at 03: 42, Joseph Reynolds <jrey@ linux. ibm. com> 
> wrote: [EXTERNAL EMAIL NOTICE: This email originated from an external 
> sender. Please be mindful of safe email handling and proprietary 
> information protection practices. ] On
> ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
>> On 2 Dec 2022, at 03:42, Joseph Reynolds <jrey@linux.ibm.com> wrote:
>>
>> [EXTERNAL EMAIL NOTICE: This email originated from an external 
>> sender. Please be mindful of safe email handling and proprietary 
>> information protection practices.]
>>
>>
>> On 11/29/22 4:06 AM, Thang Nguyen OS wrote:
>>> Thanks for your feedback.
>>>
>>>> On 29 Nov 2022, at 08:41, Joseph Reynolds <jrey@linux.ibm.com> wrote:
>>>>
>>>> [EXTERNAL EMAIL NOTICE: This email originated from an external 
>>>> sender. Please be mindful of safe email handling and proprietary 
>>>> information protection practices.]
>>>>
>>>>
>>>> On 11/21/22 4:17 AM, Thang Nguyen OS wrote:
>>>>> Hi,
>>>>> I would like to have your comments on below issue which we think 
>>>>> it is high risk security issue which description below:
>>>>>
>>>>> Any user (read-only, operator, administrator), when created, has 
>>>>> BMC console access/login by default. He can login to BMC via BMC 
>>>>> console and do the following actions:
>>>>>  - Write to his /home/<user> folder to full. This will make the 
>>>>> RootFS full and no more operation can be done, unless do A/C power 
>>>>> and reflash the BMC from u-boot.
>>>>> - Write to /tmp folder to full which will make many application 
>>>>> fail to work.
>>>>> It is good for administrator as he should have full privilege. 
>>>>> However, for readonly/operator users, he should not have console 
>>>>> access. No matter if he makes the BMC crashed by mistake or it is 
>>>>> his intention, we should prevent his happens.
>>>>> It is known that many production systems do not support BMC 
>>>>> console but still have some support and some companies allow 
>>>>> remote access via KVM or console server. I think we should disable 
>>>>> shell login for normal users (readonly and operator) by default.
>>>> Thanks for your report.  Here are my thoughts.
>>>>
>>>> You are describing resource exhaustion, sometimes denoted as one of:
>>>> - CWE-400: Uncontrolled Resource Consumption
>>>> - CWE-770: Allocation of Resources Without Limits or Throttling
>>>>
>>>> I agree this will lead to the failure of various BMC functions leading
>>>> to denial of service.
>>>>
>>>> There are two ways to access the BMC command shell:
>>>>
>>>> 1. Access to the BMC command shell via SSH port 22.  The default BMC
>>>> configuration only allows Administrator users to have access. 
>>>> [footnote 1]
>>> No problem with SSH. Operator and read-only users can’t access BMC 
>>> shell over SSH
>>>> 2. Access to the BMC command shell via the BMC's serial port.  The
>>>> typical BMC setup either does not have a console or specifies that
>>>> access to the BMC's physical console port should be protected.
>>>>
>>>> Please see some related build-time configuration options here:
>>>> https://github.com/openbmc/openbmc/wiki/Configuration-guide#bmc-console-shell-access
>>>>
>>>> Also, we can consider adding a check so that only admin users are
>>>> allowed to access to a BMC command shell via the BMC's serial console.
>>>> (And non-admin user will be logged off.)
>>> Do you think we should disable console access by setting from 
>>> phosphor-user-manager during user creation? The alternative command 
>>> from BMC shell is usermode <user> -s /sbin/nologin
>>
>> I believe all non-admin users have their default shell set to
>> /bin/nologin per code in phosphor user manager:
>> https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.cpp
>> Search for "nologin”.
> Unfortunately not. I tried to create new read-only users from WebUi 
> using latest codes from github.com/openbmc/openbmc 
> <http://github.com/openbmc/openbmc> but the users can still login to 
> BMC console.
> from 
> https://github.com/openbmc/phosphor-user-manager/blob/7562658e1fce6e19b55063955a5803e19f8f10b6/user_mgr.cpp#L1354, 
> it is based on sshRequested to set shell to /bin/sh or /sbin/nologin 
> but I wonder how can we configure it.

Thang,

I don't know the right way to configure this behavior.

There is a stub section in an OpenBMC doc which introduces the BMC UART 
serial interface we have been discussing, here:
https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md#bmc-serial
and I would be happy to help with enhancements to describe user access.

IBM's public downstream fork has a custom configuration for SSH and BMC 
console access which does something like you are asking about:
https://github.com/ibm-openbmc/phosphor-user-manager/commit/16ec770914d2be3c407aced14fbca46ac9824f83
I would be happy to change this implementation to a standard way.

Joseph

>>
>> When reading this code, not only priv-admin users will have the "ssh"
>> group role per
>> https://github.com/openbmc/docs/blob/master/architecture/user-management.md#supported-group-roles
>>
>> Joseph
>>
>>
>>> - Joseph
>>>
>>>
>>> Footnote 1:
>>> The effect of the following is to configure the dropbear SSH server so
>>> only users who are in the priv-admin Linux group are allowed to connect
>>> via SSH.
>>> This config parameter:
>>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default
>>> Is configured into the image from here:
>>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear_%25.bbappend
>>> and is used on the dropbear command line from here:
>>> https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-core/dropbear/dropbear/dropbear%40.service
>>>
>>>
>>>
>>>
>>>>> Thanks,
>>>>> Thang Q. Nguyen -
>

