Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6D815B1DB
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 21:29:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hrpt3SVfzDqRy
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 07:29:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hrp94kk6zDqGJ
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 07:29:04 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CKSetX061565
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 15:28:43 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y3u51pc3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 15:28:43 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01CKPCaZ028534
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 20:28:42 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 2y1mm8f1yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 20:28:42 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01CKSfia59769118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 20:28:41 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C7EFBE053
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 20:28:41 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA127BE051
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 20:28:40 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.41.74.115])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 20:28:40 +0000 (GMT)
Subject: Re: Enabling OpenBMC Debug
To: openbmc@lists.ozlabs.org
References: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
 <27a538db-96e4-f83f-6541-93e974f78ead@linux.ibm.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <c012602f-281a-0cc7-961d-67599cf679be@linux.vnet.ibm.com>
Date: Wed, 12 Feb 2020 14:28:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <27a538db-96e4-f83f-6541-93e974f78ead@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_09:2020-02-12,
 2020-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002120141
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

This is a really good set of information! I must say I think the 
obmcutil command is a good idea, for development purposes.

On 2/11/20 11:58 AM, Joseph Reynolds wrote:
> On 2/11/20 9:51 AM, Andrew Geissler wrote:
>> I find myself running a lot of different commands to enable a variety of
>> debug data on OpenBMC when debugging different issues (usually BIOS
>> communication issues). I also end up giving these commands to a lot of 
>> people
>> when recreating issues for me. Stuff like this:
>>
>> # enable debug logs in journal
>> sed -i 's/info/debug/' 
>> /lib/systemd/journald.conf.d/journald-maxlevel-policy.conf
>> systemctl restart systemd-journald.service
>>
>> # Enable BIOS communication service debug
>> sed -i 's/mboxd/mboxd -vv/' /lib/systemd/system/mboxd.service
>> sed -i 's/btbridged/btbridged --vv/' 
>> /lib/systemd/system/org.openbmc.HostIpmi.service
>> sed -i 's/ipmid/ipmid -d 0xff/'  
>> /lib/systemd/system/phosphor-ipmi-host.service
>> sed -i 's/0/1/' /etc/default/pldmd
>> systemctl daemon-reload
>> systemctl restart mboxd.service
>> systemctl restart org.openbmc.HostIpmi.service
>> systemctl restart phosphor-ipmi-host.service
>> systemctl restart pldmd.service
>>
>> I was contemplating wrapping the above stuff in a obmcutil command so 
>> instead
>> of telling people to do all of the above (and dealing with situations 
>> when
>> those commands change), I could say something like run "obmcutil 
>> debugon".
>>
What about a REST API command tied to this? It could help when dealing 
with external to BMC problems.

>> Any thoughts out there? Would finer granularity of the debug be useful?
>> Are there other forms of debug people would like enabled?
Sometimes we have to recreate issues that occur on a system, a rather 
unfortunate situation in and of itself. I'll have to counter with a 
question of my own. Do you think this would be good to enable during a 
recreate, and we don't risk flooding the useful info?


> 
> Thank you for the information.  I keep learning all the time.
> 
> These settings factor into service scenarios and also deployment 
> readiness.  For example:
> - I want to turn off debug.  For example, I want a debug-off command.
> - I would want a way to validate (or at least show) these settings when 
> testing firmware image release candidates.  For example, another 
> obmcutil command "debug-show" which uses "grep -H" instead of "sed".
> - I would want some documentation added the BMC administrator's guide to 
> make them aware of OpenBMC debug support.  Draft: The obmcutil command 
> can control debug settings for a variety of the components running on 
> the BMC.  For more information, see 
> https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil
> 
> The obmcutil tool is a shell script, so folks can take just the pieces 
> they need.  That is, don't be more granular at this time.
> 
> In summary, it seems like a good idea.  It seems like we should ask our 
> service architects to weight in.  I'll go ask mine....
> 
> - Joseph
> 
>>
>> Andrew
> 
Thanks,
Justin
