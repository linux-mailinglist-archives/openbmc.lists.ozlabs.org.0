Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6C15B283
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 22:11:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HslS0MZ5zDqSc
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 08:11:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hskr67TVzDqRS
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 08:11:15 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CL4TiX113539; Wed, 12 Feb 2020 16:09:12 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y4qys222n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 16:09:12 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01CL59uT000986;
 Wed, 12 Feb 2020 21:09:11 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 2y1mm7fpjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 21:09:11 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01CL99ta57147900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Feb 2020 21:09:10 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 994B86E054;
 Wed, 12 Feb 2020 21:09:09 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A4DC6E05B;
 Wed, 12 Feb 2020 21:09:09 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.142.217])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 12 Feb 2020 21:09:09 +0000 (GMT)
Subject: Re: Redfish security questions
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <fe46c534-7e23-bc54-2ae9-0057866d6be0@linux.ibm.com>
 <a1b54026-444b-5693-a2af-bbd43b0a95d2@linux.intel.com>
 <084d6c01-092a-c026-d504-34cfe89f5ebf@linux.ibm.com>
 <6c396e46-6942-15e2-ec71-f8387037783e@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <64e4420e-ae3f-0943-4200-d07166914955@linux.ibm.com>
Date: Wed, 12 Feb 2020 15:09:07 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <6c396e46-6942-15e2-ec71-f8387037783e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_09:2020-02-12,
 2020-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002120145
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

On 2/12/20 12:18 AM, Thomaiyar, Richard Marian wrote:
> This is on next week right? I will attend (it will be late, but i will 
> try to manage). We can discuss about this and also about pam_abl 
> related to blocking users based on IP address issue.

Yes, both topics mentioned in this email are on the Wednesday 2020-02-19 
security work group agenda.  We can discuss them early in the meeting if 
you wish.

I am trying to push the conversation back out onto the email list (as a 
general principle).  I'll cut/paste the forum topic into a separate 
email thread to get it going.

I briefly looked at using pam_abl (Linux-PAM module(8) and its 
corresponding command(1)).  I am interested in using its "automatic 
black listing IP addresses" function.  It is GPL3 license which I think 
OpenBMC can use.  I am also interested in rate-limiting authentication 
attempts as a complementary solution.  I'll continue that email thread 
as I have time to do so.

Thank you!

- Joseph

>
>
> regards,
>
> Richard
>
> On 2/11/2020 11:01 PM, Joseph Reynolds wrote:
>>
>> On 2/10/20 10:37 PM, Thomaiyar, Richard Marian wrote:
>>> On a different note,
>>>
>>> Let me know your  thoughts on this too 
>>> https://redfishforum.com/thread/279/channel-privilege-support-direction-redfish
>>>
>>> I am trying to get the direction of the redfish  spec, whether they 
>>> want to consider channel based privilege restriction or just single 
>>> privilege.
>>
>> Richard,
>>
>> Thanks.  I've replied to your thread with questions of my own. Please 
>> reply to my questions on the Redfish forum.  I think we (OpenBMC) 
>> need to have clear requirements.  I've added your topic to the 
>> OpenBMC security working group and plan to stir up any interest.  
>> You're welcome to attend, but it is not necessary.
>>
>> OpenBMC security working group:
>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI 
>>
>>
>> - Joseph
>>
>>>
>>> regards,
>>>
>>> Richard
>>>
>>> On 2/10/2020 11:05 PM, Joseph Reynolds wrote:
>>>> The Redfish spec recently changed to allow users with the Login 
>>>> privilege to enumerate all BMC users. Previously only the admin 
>>>> user could do this.  I disagree with this change and believe it is 
>>>> an unnecessary information exposure.  Details are in the Redfish 
>>>> forum post.
>>>>
>>>> https://redfishforum.com/thread/281/manageraccountcollection-change-allows-account-enumeration 
>>>>
>>>>
>>>> Are we okay with this?  Do we ask Redfish to change it back? Please 
>>>> reply to this email or to the forum with your thoughts.
>>>>
>>>> Thanks,
>>>> - Joseph
>>>>
>>>> References:
>>>>
>>>> The change was made to Redfish version 2019.4 > DSP2046 > 
>>>> Redfish-1.0.4-PrivilegeRegistry > ManagerAccountCollection > GET:
>>>> https://www.dmtf.org/standards/redfish
>>>>
>>>> OpenBMC has the corresponding implementation change pending here:
>>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881
>>>>
>>>> This was discussed in the 2020-02-05 OpenBMC security working group 
>>>> meeting as agenda item 3.  Minutes:
>>>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI 
>>>>
>>>>
>>

