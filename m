Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F26116BEC
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 12:09:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WgSv2KL7zDqQj
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 22:09:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WgRD3VMbzDqPQ
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 22:08:23 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB9B860e039591
 for <openbmc@lists.ozlabs.org>; Mon, 9 Dec 2019 06:08:21 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wskn9b097-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 06:08:21 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 9 Dec 2019 11:08:19 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Dec 2019 11:08:16 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB9B8F0v41877750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 9 Dec 2019 11:08:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4DCD42041
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 11:08:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62DCB4203F
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 11:08:15 +0000 (GMT)
Received: from [9.122.210.117] (unknown [9.122.210.117])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 11:08:15 +0000 (GMT)
Subject: Re: BMC Operating Mode [Manual / Normal]
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <fa89fca6-8b4a-030d-7268-8a97958909f4@linux.vnet.ibm.com>
 <de8d57a1-dbd1-2d29-741a-e265e4fc6f7b@intel.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Mon, 9 Dec 2019 16:38:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <de8d57a1-dbd1-2d29-741a-e265e4fc6f7b@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19120911-0008-0000-0000-0000033F1385
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120911-0009-0000-0000-00004A5E3FCC
Message-Id: <1505e06c-65c8-c953-9cd1-f47989a64255@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_02:2019-12-09,2019-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090096
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

Sorry, resuming the discussion only now. Had to keep the discussion on 
back burner due to other things.

Ed, I am not sure if you are still watching this space..

On 8/14/19 2:33 AM, Ed Tanous wrote:
> On 8/9/19 12:13 AM, vishwa wrote:
>> Hi All,
>>
>> IBM systems have a need to run BMC either in Manual or Normal Mode. What
>> it means is this:
>>
>> Manual: It's mostly a lab / debug mode, where in the system would be
>> booted with recovery disabled.
>> For example: If we enter Quiesce state as part of power-on, then BMC
>> remains in Quiesce state and would *not* attempt to re power-on and
>> reboot the system.
>>
>> Normal: This is the default customer mode with recovery enabled in BMC.
>> For example: If we enter Quiesce state as part of power-on, then an
>> attempt will automatically be done to re power-on and boot the system.
> We have a very similar mechanism in our non-OpenBMC stack.  We would
> likely be interested in a generic interface for it, although the details
> are different, as the BMC doesn't really monitor Quiesce, but the state
> of the boot through ACPI and power rails.
>
How about having a policy defined in "xyz/openbmc_project/setting/" ?.

>> There are other use-cases, where BMC does a Automatic power-on after
>> coming back from an AC loss. Manual / Normal would influence this.
> This is classically a separate setting called "power restore policy".  I
> suspect you likely want to keep these separate as well, as the power
> policy is something that a user is likely to set independent of
> lab/debug/manual mode.
>
Yes.. 2 different things. However, if the user has set "power restore 
--> yes" and then set the mode to "Manual", then "power restore" will 
behave as if nothing was set.

So, this proposed mode [Normal/Maintenance] is sort of a gate-keeper for 
any of these recovery actions.

>> My current thought is to make this a settings in phosphor-settings.
>> Looking to see if others have any use-case like this.

