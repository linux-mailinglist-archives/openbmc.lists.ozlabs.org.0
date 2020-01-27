Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F2D14A92E
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2020 18:42:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485xsd4B61zDqJV
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 04:42:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485xrx5hPfzDqHF
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 04:42:09 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RHfCYI060370
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 12:42:06 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xrgqe0ssw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 12:42:06 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00RHe2Qg030976
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 17:42:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 2xrda6jy13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 17:42:06 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00RHg5Eq50856230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 17:42:05 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AAC528060
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 17:42:05 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DF352805A
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 17:42:05 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 17:42:05 +0000 (GMT)
Subject: Security workgroup meeting times
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
Message-ID: <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
Date: Mon, 27 Jan 2020 11:42:04 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_06:2020-01-24,
 2020-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001270142
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

Team,

Let's try again to establish another OpenBMC Security Workgroup meeting 
time.  The current meeting time (every other week 10am Pacific Daylight 
Time) is working for some, but not for others.  To be clear, we would 
use the same workgroup, just have alternate meeting times.

First, let's find a time that works for Australia, Asia, and Europe.  
I've seen participation and continued interest from folks in those time 
zones. Because the current meeting time is bad for them, let's establish 
alternate times.

Second, I am thinking we could establish alternating meeting times. We 
will not find a time that works for everyone.  I try to accommodate 
folks who cannot attend by writing a summary of the topics and 
conclusions, and by pushing the work back out into this email list.  But 
that is not the same as attending a meeting.  I feel that the meetings 
foster better responses and more participation than using the email list 
alone.  For that reason, I want to continue to meet.  Hence, I am 
proposing alternating meeting times.

Third, I have been running the meetings.  I plan to continue to handle 
the Security workgroup meeting agenda, and can help set up the initial 
workgroup meetings at alternate times, I would not plan to run them.  I 
hope you will solve all the security problems while I am sleeping.  
Fortunately, running meetings is easy: just go through the agenda, 
introduce each item, wait for people to talk, and summarize the 
outcome.  We need a volunteer leader for that.

Send me your ideas,
- Joseph


On 1/22/20 3:23 PM, Joseph Reynolds wrote:
> Notes from the security working group meeting 2020-01-22:
> Highlights below; details in 
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
>
> 1. Discuss BMCWeb’s site identity certificate handling, specifically 
> intermediate certificates.  See 
> https://github.com/openbmc/bmcweb/#configuration  
>
> Other web servers have directives to concatenate the intermediate 
> certificates (excluding the root CA certificates) and send that. What 
> does BMCWeb do? 
>  - What is BMCWeb's default default?
>  - Need better docs, for example: How can a BMC admin replace 
> theBMCWeb site cert?  Is it okay to concatenate intermediate certs? 
> Can we document this for BMCWeb?
>
>
> 2. Design discussions about aggregation broached the security topic : 
> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020142.html  
>
> We are not sure what security help is needed. at this point.
>
>
> 3. Revisit "Daemons should not run as root" - 
> https://github.com/openbmc/openbmc/issues/3383
>
> There is definite interest.  Who can work on this?  Possible initial 
> goal: convert bmcweb so it runs as a non-root user. BMCWeb is selected 
> because it is higher risk because implements a network interface. 
>
>
> 4. Merged BMCWeb commit to allow slower image uploads: 
> https://github.com/openbmc/bmcweb/commit/2b5e08e2915d886655a78aaabff40745dca6b517 
>   See also commit: 0e1cf26b1cd98e0ec069e6187434fcabf1e9c200 “Make the 
> max http request body size configurable”. 
>
> Minimal discussion. 
>
>
> 5. Merged BMCWeb commit that added new messages for security events: 
> https://github.com/openbmc/bmcweb/commit/8988dda41319950476ebb146df06c2e7b3fbf44d 
>
> Minimal discussion. 
>
>
> 6. How do we bring security assurance work into the OpenBMC project?  
> Is there interest in considering Protection Profiles that apply to 
> OpenBMC?  We can use these as a systematic way review security 
> topics.  For example, the Operating System Protection Profile (OSPP) 
> talks about cryptographic functions, audit logging, network security, 
> secure boot, etc.  The Virtualization Protection Profile (VPP) 
> considers the BMC to be part of the platform management system. 
>
> There was agreement that these security schemes are good starting 
> points to use as a guide.  DONE: Joseph added new “Security Assurance 
> Workflow” section to guide future work in this area - 
> https://github.com/openbmc/openbmc/wiki/Security-working-group#security-assurance-workflow 
> .
>
>
> - Joseph
>

