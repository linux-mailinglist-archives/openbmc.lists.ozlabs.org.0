Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E71B49A0
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 18:08:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496lhk2NymzDqg1
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 02:08:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 496lYm1JcSzDqrn
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 02:02:03 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MFfm5a045941; Wed, 22 Apr 2020 12:01:54 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30gc2ygbxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 12:01:54 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03MG0l2W018567;
 Wed, 22 Apr 2020 16:01:54 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 30fs673a08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 16:01:54 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03MG1rAh52691274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Apr 2020 16:01:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FC92124052;
 Wed, 22 Apr 2020 16:01:53 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBBB6124054;
 Wed, 22 Apr 2020 16:01:52 +0000 (GMT)
Received: from [9.85.155.31] (unknown [9.85.155.31])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 Apr 2020 16:01:52 +0000 (GMT)
Subject: Re: dbus-sensors
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
 <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
 <ED37CD16-CFB6-4D78-BF6E-062849051D02@fuzziesquirrel.com>
 <20200422121131.GE196148@heinlein.lan.stwcx.xyz>
 <56790A50-40DE-44F5-A043-A91E1C48C8C2@fuzziesquirrel.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <672387da-09f5-dc7a-3822-8e9af9c745ca@linux.ibm.com>
Date: Wed, 22 Apr 2020 11:01:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <56790A50-40DE-44F5-A043-A91E1C48C8C2@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_06:2020-04-22,
 2020-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004220120
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
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 4/22/2020 7:24 AM, Brad Bishop wrote:
> at 8:11 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>
>> On Wed, Apr 22, 2020 at 07:56:14AM -0400, Brad Bishop wrote:
>>> at 5:54 PM, James Feist <james.feist@linux.intel.com> wrote:
>>>>> 3. After creating this event log, make sure not to do it again until
>>>>>    main power is cycled.
>>>>
>>>> I'd rather this be until the status goes OK again.
>>>
>>> We have user-experience requirements that the server administrator 
>>> must be
>>> “nagged” in this fashion when something is broken like this. Could the
>>> behavior be selectable via build switch?  Any other ideas on how to
>>> accommodate both behaviors?
>>
>> This sounds like a form of error filtering.  Shouldn't that decision be
>> done at a much higher level in the stack than down in the entity that
>> reads the hardware sensor?
>
> Thats an interesting thought.  When the error reporting code sees the 
> error for the first time, it could maintain a list of errors that it 
> needs to “replay” at different system events, like when the server 
> powers on.

It isn't really nagging, it's more like error throttling.  At most, only 
log one error per power cycle.
I have to check still, but we may also need to still log the other 
errors, just with a
different severity (for debug purposes).

I kinda like this filtering idea too.  It is flexible and we would only 
have to do it in one place as
opposed to in all the sensor applications we end up using, and could 
also be used to change the
event log severities as mentioned above.  We will have to make sure when 
creating the event log
that it contains enough information to recognize the device that is 
failing so that we can filter
appropriately.


>
> This is certainly more flexible and I like the idea - but one down 
> side though is the logging code becomes stateful and the complexity is 
> slightly higher.

