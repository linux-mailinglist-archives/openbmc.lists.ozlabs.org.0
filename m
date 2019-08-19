Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 129EE94B78
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 19:16:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C0vZ6jcCzDqsp
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 03:16:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C0tq3ZdbzDqY6
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 03:15:47 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JHFYNh112969; Mon, 19 Aug 2019 13:15:40 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ufwf1pcv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 13:15:40 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7JHFde3113606;
 Mon, 19 Aug 2019 13:15:39 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ufwf1pcum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 13:15:39 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7JH8h0E020502;
 Mon, 19 Aug 2019 17:15:38 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 2ue976fda8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 17:15:38 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7JHFbx050266606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 17:15:37 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67EA9AC05E;
 Mon, 19 Aug 2019 17:15:37 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3515AC059;
 Mon, 19 Aug 2019 17:15:36 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 19 Aug 2019 17:15:36 +0000 (GMT)
Subject: Re: where to store application json
To: Andrew Jeffery <andrew@aj.id.au>, Matt Spinler <mspinler@linux.ibm.com>,
 Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=pv9GdHmv7ZJOBK+Z1wqAh4DmOzVR8ud=+KefddvEkreg@mail.gmail.com>
 <9ad991fb-13fe-42fa-b5b6-48fd069342f9@www.fastmail.com>
 <e4636a3c-82b8-0f35-ebad-6b23e304dc3d@linux.ibm.com>
 <f459cebc-ab70-08ee-7ea7-2647e41b3c04@linux.ibm.com>
 <96f668f0-9580-44a4-9bbd-ca6324494017@www.fastmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <3645ad01-172f-be62-0531-6d0660fc211a@linux.ibm.com>
Date: Mon, 19 Aug 2019 12:15:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <96f668f0-9580-44a4-9bbd-ca6324494017@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190182
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


On 8/18/19 7:15 PM, Andrew Jeffery wrote:
>
> On Sat, 17 Aug 2019, at 02:24, Joseph Reynolds wrote:
>> On 8/16/19 8:31 AM, Matt Spinler wrote:
>>> On 8/15/2019 6:59 PM, Andrew Jeffery wrote:
>>>> On Fri, 16 Aug 2019, at 07:01, Andrew Geissler wrote:
>>>>> As we start moving more and more of our applications to using
>>>>> runtime parsed
>>>>> json files, it seems like a good time to come up with a standard
>>>>> location to put
>>>>> the json files. I think a requirement is they be in a writeable
>>>>> filesystem
>>>>> (although that may bring security concerns) so that you can edit and
>>>>> restart
>>>>> services that use them on the fly for bringup and debug.
>>>>>
>>>>> /etc seems like the right spot. But if so, where in /etc
>>> While convenient to the developer for testing, to me it doesn't sound
>>> like good practice to put read
>>> only, critical files into a writeable spot?  How could we even trust
>>> data that comes back to us from
>>> the field when a user that can get into their BMC can just change
>>> these?  Or accidentally
>>> delete a file?
>>>
>> One security concern is that config files offer a good way for hackers
>> to get persistent access to the system.  That is, if they are able to
>> get root access to the BMC one time, they may be able to persist their
>> hack across BMC reboots by modifying some config files.  IMHO, to make
>> it harder for them, as much as possible of the file system should be
>> read-only, and read-write config files should not offer the above
>> mentioned service to hackers.
> What are some concrete examples of what you're concerned about here?

I was thinking about config files that specify which plugins to load, 
for example, by absolute pathname.  In this scenario, the hacker would 
write a plugin, and the first time they compromise the BMC, they copy 
the plugin to the BMC's file system, and modify the config file to 
active it.  In this way, their code re-activates even if they lose access.

>
> Are you suggesting hackers are exploiting flaws in the config file parsers?
> Because in that case we should just fix the parsers. Or perhaps configuring
> the system in an unsafe way?

No, but that's a good point.  We can begin to address those 
vulnerabilities with static and dynamic code scans and config file 
fuzzing, and with good design and documentation about config files.

>
> Anyway, having any writable storage provides a place to drop payloads
> and generally wreak havoc, but having an unconfigurable BMC is not a
> direction I think we should go, it seems pretty restrictive. We do need
> to be careful about how we treat the content though, as it can't really
> be authenticated.

Agreed.

>
> Andrew
>

