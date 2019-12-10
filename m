Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 105B9118430
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 10:55:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XFm54Db9zDqXY
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 20:55:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XFlQ72WPzDqB0
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 20:54:26 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBA9puTc087575
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 04:54:21 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wsmfu167u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 04:54:20 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Tue, 10 Dec 2019 09:54:04 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Dec 2019 09:54:02 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBA9s1uu52297846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 09:54:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63DE54204B;
 Tue, 10 Dec 2019 09:54:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E437E4203F;
 Tue, 10 Dec 2019 09:54:00 +0000 (GMT)
Received: from [9.122.210.233] (unknown [9.122.210.233])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Dec 2019 09:54:00 +0000 (GMT)
From: vishwa <vishwa@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: BMC Operating Mode [Manual / Normal]
References: <fa89fca6-8b4a-030d-7268-8a97958909f4@linux.vnet.ibm.com>
 <de8d57a1-dbd1-2d29-741a-e265e4fc6f7b@intel.com>
 <1505e06c-65c8-c953-9cd1-f47989a64255@linux.vnet.ibm.com>
 <9DCFD6EC-430D-426E-9227-508B3D25AF52@fuzziesquirrel.com>
Date: Tue, 10 Dec 2019 15:24:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9DCFD6EC-430D-426E-9227-508B3D25AF52@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19121009-0016-0000-0000-000002D36CFE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121009-0017-0000-0000-00003335831F
Message-Id: <21e88c1f-5dfe-f48f-05e2-bde8327c5bc9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912100087
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/9/19 6:24 PM, Brad Bishop wrote:
>
>> On Dec 9, 2019, at 6:08 AM, vishwa <vishwa@linux.vnet.ibm.com> wrote:
>>
>> Sorry, resuming the discussion only now. Had to keep the discussion on back burner due to other things.
>>
>> Ed, I am not sure if you are still watching this space..
>>
>> On 8/14/19 2:33 AM, Ed Tanous wrote:
>>> On 8/9/19 12:13 AM, vishwa wrote:
>>>> Hi All,
>>>>
>>>> IBM systems have a need to run BMC either in Manual or Normal Mode. What
>>>> it means is this:
>>>>
>>>> Manual: It's mostly a lab / debug mode, where in the system would be
>>>> booted with recovery disabled.
>>>> For example: If we enter Quiesce state as part of power-on, then BMC
>>>> remains in Quiesce state and would *not* attempt to re power-on and
>>>> reboot the system.
>>>>
>>>> Normal: This is the default customer mode with recovery enabled in BMC.
>>>> For example: If we enter Quiesce state as part of power-on, then an
>>>> attempt will automatically be done to re power-on and boot the system.
>>> We have a very similar mechanism in our non-OpenBMC stack.  We would
>>> likely be interested in a generic interface for it, although the details
>>> are different, as the BMC doesn't really monitor Quiesce, but the state
>>> of the boot through ACPI and power rails.
>>>
>> How about having a policy defined in "xyz/openbmc_project/setting/" ?.
>>
>>>> There are other use-cases, where BMC does a Automatic power-on after
>>>> coming back from an AC loss. Manual / Normal would influence this.
>>> This is classically a separate setting called "power restore policy".  I
>>> suspect you likely want to keep these separate as well, as the power
>>> policy is something that a user is likely to set independent of
>>> lab/debug/manual mode.
>>>
>> Yes.. 2 different things. However, if the user has set "power restore --> yes" and then set the mode to "Manual", then "power restore" will behave as if nothing was set.
>>
>> So, this proposed mode [Normal/Maintenance] is sort of a gate-keeper for any of these recovery actions.
> This sounds like settings controlling other settings.  Do you have a list of all the settings that get ignored when this setting is active?
Setting controlling other operations. At this moment, I don't have a 
list of things that are influenced by this setting.
> Rather than make all the code look at another setting, one idea for implementing this would be to turn on/off all the associated settings.  Would that work?
This works on some and may not always be possible. For instance, Time at 
which the BMC should do PowerOn ( Timed Power On ) is not an external 
settable entity. The Host sends down the 'seconds since epoch' to BMC. 
However, as an external policy, Manual/Normal will override that behavior.

!! Vishwa !!
> thx - brad

