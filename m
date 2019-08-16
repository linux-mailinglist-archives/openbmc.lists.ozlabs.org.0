Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B11090734
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 19:49:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699mc4vp6zDqDh
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 03:49:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698Yk63GCzDqnf
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 02:54:34 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7GGpXsC002753
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 12:54:31 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udxf2d24q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 12:54:31 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Fri, 16 Aug 2019 17:54:30 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 16 Aug 2019 17:54:28 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7GGsREE50266560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 16:54:27 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D111FB2065;
 Fri, 16 Aug 2019 16:54:27 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EF19B2066;
 Fri, 16 Aug 2019 16:54:27 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 16 Aug 2019 16:54:27 +0000 (GMT)
Subject: Re: where to store application json
To: Matt Spinler <mspinler@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=pv9GdHmv7ZJOBK+Z1wqAh4DmOzVR8ud=+KefddvEkreg@mail.gmail.com>
 <9ad991fb-13fe-42fa-b5b6-48fd069342f9@www.fastmail.com>
 <e4636a3c-82b8-0f35-ebad-6b23e304dc3d@linux.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Date: Fri, 16 Aug 2019 11:54:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e4636a3c-82b8-0f35-ebad-6b23e304dc3d@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19081616-0052-0000-0000-000003EB74D3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011599; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01247728; UDB=6.00658537; IPR=6.01029238; 
 MB=3.00028203; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-16 16:54:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081616-0053-0000-0000-0000621E150B
Message-Id: <f459cebc-ab70-08ee-7ea7-2647e41b3c04@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160173
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


On 8/16/19 8:31 AM, Matt Spinler wrote:
>
> On 8/15/2019 6:59 PM, Andrew Jeffery wrote:
>>
>> On Fri, 16 Aug 2019, at 07:01, Andrew Geissler wrote:
>>> As we start moving more and more of our applications to using 
>>> runtime parsed
>>> json files, it seems like a good time to come up with a standard 
>>> location to put
>>> the json files. I think a requirement is they be in a writeable 
>>> filesystem
>>> (although that may bring security concerns) so that you can edit and 
>>> restart
>>> services that use them on the fly for bringup and debug.
>>>
>>> /etc seems like the right spot. But if so, where in /etc
>
> While convenient to the developer for testing, to me it doesn't sound 
> like good practice to put read
> only, critical files into a writeable spot?  How could we even trust 
> data that comes back to us from
> the field when a user that can get into their BMC can just change 
> these?  Or accidentally
> delete a file?
>

One security concern is that config files offer a good way for hackers 
to get persistent access to the system.  That is, if they are able to 
get root access to the BMC one time, they may be able to persist their 
hack across BMC reboots by modifying some config files.  IMHO, to make 
it harder for them, as much as possible of the file system should be 
read-only, and read-write config files should not offer the above 
mentioned service to hackers.

My 2 cents,
- Joseph

>
>
>>> ?
>>>
>>> Adriana pointed me to the FSH guidelines[1] in a review which has 
>>> the following:
>>> "It is recommended that files be stored in subdirectories of /etc 
>>> rather than
>>> directly in /etc.".
>>>
>>> /etc/opt ?
>>> /etc/opt/phosphor/ ?
>>> /etc/opt/phosphor/<repository name>/ ?
>> Where did the "/opt/" bit come from? Please lets drop that.
>>
>> IMO we should be using /etc/<application name>. Be mindful that one 
>> repository
>> can produce multiple applications, but what application sits in which 
>> repository
>> is a code organisation problem and not something that we should tie 
>> into system
>> configuration.
>>
>> Andrew
>

