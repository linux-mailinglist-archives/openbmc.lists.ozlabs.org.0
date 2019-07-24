Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6B73CBA
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 22:11:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45v61S6BFxzDqKs
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 06:11:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45v606381ZzDqKZ
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 06:10:13 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6OK7QsS096742; Wed, 24 Jul 2019 16:10:10 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2txv5umnqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jul 2019 16:10:10 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6OK9iom009199;
 Wed, 24 Jul 2019 20:10:09 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 2tx61n122s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jul 2019 20:10:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6OKA7Fh39256406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2019 20:10:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FC60BE059;
 Wed, 24 Jul 2019 20:10:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60B84BE05A;
 Wed, 24 Jul 2019 20:10:07 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jul 2019 20:10:07 +0000 (GMT)
Subject: Re: Creating event logs for blackout power losses
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
References: <77618bc2-0725-c104-1744-7ceca51e2d09@linux.ibm.com>
 <fc74bffa-ca1b-1d3d-cb54-1f4be0cae11b@linux.intel.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <4b906a0b-0750-c724-2864-88589821b0e3@linux.ibm.com>
Date: Wed, 24 Jul 2019 15:10:09 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fc74bffa-ca1b-1d3d-cb54-1f4be0cae11b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240216
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



On 7/24/2019 2:53 PM, Bills, Jason M wrote:
> On 6/28/2019 8:26 AM, Matt Spinler wrote:
>> Hi,
>> We've been asked by field support to create an OpenBMC event log when 
>> we detect that
>> we suffered a power blackout, by which I mean the system is up and 
>> running, and then the
>> BMC suddenly reboots and when it comes back up main power is off. The 
>> issue for it is
>> https://github.com/ibm-openbmc/dev/issues/677.
>>
>> I have a proposal in there for how to detect it in the chassis state 
>> manager code, which
>> basically just consists of persisting the chassis power state and 
>> then checking it against
>> the actual value on startup, and an error proposed at
>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/22791. 
>>
>> Does anyone have any other ideas or thoughts?  Is it OK if we make 
>> this the default behavior, or
>> would it be preferred we enable it with a compile flag?
>
> Sorry for the late replay as I have been out of the office.
>
> In my testing on this type of failure, I found that there is a race 
> condition between the Chassis and BMC losing power after the blackout. 
> If the Chassis loses power while the BMC is still active, it can 
> sometimes detect it, change the Chassis State to Off, and persist it 
> before losing power.  When this happens, the next boot will see only 
> the Off state persisted and not detect the blackout.
>
> To work around this, we have added a delay when persisting the Chassis 
> State.  In a normal Off, it will be persisted after the delay; in a 
> blackout off, the delay will prevent the BMC from persisting the Off 
> state allowing the blackout to be detected.

Hi, thanks for the response.
Did you do this in a downstream phosphor-state-manager repository,
or somewhere else?  If in phosphor-state-manager, would you consider 
sharing it?

>
>>
>> Thanks,
>> Matt
>

