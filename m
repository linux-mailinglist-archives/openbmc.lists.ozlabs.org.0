Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB59A1D217A
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 23:51:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MpK210RFzDqWH
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 07:51:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MpJF4HMtzDqNy
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 07:50:37 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04DLX6eq074361; Wed, 13 May 2020 17:50:32 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31016mv197-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 17:50:32 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04DLjT3v002331;
 Wed, 13 May 2020 21:50:31 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 3100ub9snm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 21:50:31 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04DLoUGN49349086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 21:50:30 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D9FAAE064;
 Wed, 13 May 2020 21:50:30 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6E4FAE062;
 Wed, 13 May 2020 21:50:29 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.153.254])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 13 May 2020 21:50:29 +0000 (GMT)
Subject: Re: Security workgroup meeting times
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 openbmc <openbmc@lists.ozlabs.org>, Manojkiran Eda <manojeda@in.ibm.com>
References: <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
 <27d0f3fb-98b9-0a5b-f682-40f95142748c@linux.ibm.com>
 <3a5d85c078c64a0e9bd57a31b9096207@SCL-EXCHMB-13.phoenix.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <80674629-3a0f-3bca-d5c6-5a0efba7323c@linux.ibm.com>
Date: Wed, 13 May 2020 16:50:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3a5d85c078c64a0e9bd57a31b9096207@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_09:2020-05-13,
 2020-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 suspectscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 cotscore=-2147483648 phishscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005130183
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



On 5/13/20 1:43 PM, Bruce Mitchell wrote:
> If you want to include Silicon Valley it seem like 22:00, 23:00, 00:00, 01:00, and 02:00 UTC/GMT are the only real options.

I think the current time (10:00am PDT) works for most Silicon Valley 
folks.  I am looking for a second meeting time good for others not in 
the Americas.  For example, we've has security collaborations from folks 
in Switzerland Poland Russia India China and Australia, and I want to 
find a time that work for those regions.

- Joseph

>
>> -----Original Message-----
>> From: openbmc [mailto:openbmc-
>> bounces+bruce_mitchell=phoenix.com@lists.ozlabs.org] On Behalf Of
>> Joseph Reynolds
>> Sent: Wednesday, May 13, 2020 11:31
>> To: openbmc; Manojkiran Eda
>> Subject: Security workgroup meeting times
>>
>> Re-sending this email to refresh this topic.
>>
>> Looking for a specific time and ideally someone to run the meeting.
>> See the replies in the archive here:
>> https://lists.ozlabs.org/pipermail/openbmc/2020-January
>>
>> - Joseph
>>
>> -------- Forwarded Message --------
>> Subject: 	Security workgroup meeting times
>> Date: 	Mon, 27 Jan 2020 11:42:04 -0600
>> From: 	Joseph Reynolds <jrey@linux.ibm.com>
>> To: 	openbmc <openbmc@lists.ozlabs.org>
>>
>>
>>
>> Team,
>>
>> Let's try again to establish another OpenBMC Security Workgroup
>> meeting
>> time.  The current meeting time (every other week 10am Pacific Daylight
>> Time) is working for some, but not for others. To be clear, we would use
>> the same workgroup, just have alternate meeting times.
>>
>> First, let's find a time that works for Australia, Asia, and Europe.
>> I've seen participation and continued interest from folks in those time
>> zones. Because the current meeting time is bad for them, let's establish
>> alternate times.
>>
>> Second, I am thinking we could establish alternating meeting times. We
>> will not find a time that works for everyone.  I try to accommodate
>> folks who cannot attend by writing a summary of the topics and
>> conclusions, and by pushing the work back out into this email list.  But
>> that is not the same as attending a meeting.  I feel that the meetings
>> foster better responses and more participation than using the email list
>> alone.  For that reason, I want to continue to meet.  Hence, I am
>> proposing alternating meeting times.
>>
>> Third, I have been running the meetings.  I plan to continue to handle
>> the Security workgroup meeting agenda, and can help set up the initial
>> workgroup meetings at alternate times, I would not plan to run them.  I
>> hope you will solve all the security problems while I am sleeping.
>> Fortunately, running meetings is easy: just go through the agenda,
>> introduce each item, wait for people to talk, and summarize the
>> outcome.  We need a volunteer leader for that.
>>
>> Send me your ideas,
>> - Joseph
>>
>> ...snip...

