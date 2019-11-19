Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E7310282F
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 16:34:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HVHz658KzDqdv
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 02:34:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HVGv5vNfzDqdt
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 02:33:59 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJFTgrF056665; Tue, 19 Nov 2019 10:33:48 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wcf46vn1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 10:33:48 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAJFUAi5059662;
 Tue, 19 Nov 2019 10:33:47 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wcf46vn0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 10:33:47 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAJFUdfO022679;
 Tue, 19 Nov 2019 15:33:47 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 2wa8r6c9kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 15:33:47 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAJFXkwf58851812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 15:33:46 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DF0A6A04D;
 Tue, 19 Nov 2019 15:33:46 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCE8D6A058;
 Tue, 19 Nov 2019 15:33:45 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Nov 2019 15:33:45 +0000 (GMT)
Subject: Re: consolidation of *-dbus-interfaces
To: Lei YU <mine260309@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <8371D980-4DCC-42C3-9BFA-4DB7C9475D80@fuzziesquirrel.com>
 <CAARXrt=UOQiyKdzUHkuLXqh+3oB7c=wq6UtvWaLVmz8v8WAfzg@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <9bffebe0-601c-1b4e-d40b-4f55fd68ac76@linux.ibm.com>
Date: Tue, 19 Nov 2019 09:33:46 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAARXrt=UOQiyKdzUHkuLXqh+3oB7c=wq6UtvWaLVmz8v8WAfzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_05:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911190140
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@gmail.com>, Yong Li <yong.b.li@linux.intel.com>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I took a crack at this with 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/27380.
Please take a look.

Next I will try to build an image that uses meta-openpower using it 
instead of openpower-dbus-interfaces.



On 10/27/2019 9:02 PM, Lei YU wrote:
> On Sat, Oct 26, 2019 at 3:18 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>> Hi everyone
>>
>> I’ve discussed with a couple people off list the idea of consolidating all the dbus interfaces into a single repository.  Today there exist four:
>>
>> phosphor-dbus-interfaces
>> openpower-dbus-interfaces
>> ibm-dbus-interfaces
>> intel-dbus-interfaces
>>
>> The idea is that going forward all dbus interfaces would just go in phosphor-dbus-interfaces regardless of the namespace.  That should cut away a lot of complexity in the bitbake metadata and in other places as well.
>>
> That's great and I would love to see this happen!
>
>> Is there any opposition to this idea?  If anyone is worried about maintainer-ship, I am working on deploying the owners file plugin on our Gerrit install which enables kernel style ownership of different files depending on path, regex matches, etc.
>>
>> I would guess there would be a desire to configure (as in autoconf) in or out different namespaces.  Am I correct in that thinking?  Any thoughts on how exactly that should be done?
> I guess package config seems like a way to configure which parts to build.
>
>> On a somewhat related note I tried migrating phosphor-dbus-interfaces build to meson and failed miserably when I got to generated sdbus++ header file placement.  If anyone has any ideas on how to do that I’d love to hear about it.
> I am OK to keep the existing autoconf tools as it works well.
> For meson, I am not sure what kinds of issues you meet, but we
> probably need to write configs to generate all kinds of server.hpp/cpp
> files by `run_command()`

