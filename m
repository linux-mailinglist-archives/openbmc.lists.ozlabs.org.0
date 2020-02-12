Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B673D15B30C
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 22:48:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HtYp6MzjzDq62
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 08:48:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HtY21DMKzDqNk
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 08:47:49 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CLiRuN094176
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 16:47:47 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y3wxtb7hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 16:47:46 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01CLkkue028098
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 21:47:46 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 2y1mm8fh8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 21:47:46 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01CLljom54198578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 21:47:45 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 625BC124055
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 21:47:45 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EC0F12405B
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 21:47:45 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.41.74.115])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 21:47:45 +0000 (GMT)
Subject: Re: anti-pattern: unexpected errors and exceptions
To: openbmc@lists.ozlabs.org
References: <4642cc29-f1c5-7b33-ae06-6a734cbb3484@linux.ibm.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <bd3a8341-513a-f1c0-f010-bd7943d6f296@linux.vnet.ibm.com>
Date: Wed, 12 Feb 2020 15:47:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4642cc29-f1c5-7b33-ae06-6a734cbb3484@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_10:2020-02-12,
 2020-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002120149
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

On  high level, I think this is a pretty good start. If there was 
anything I'd add to it an audience section. Is it going to a human, or 
intended to be run through an analyzer? What's the human's skill set?

Adding in some comments below

On 2/10/20 10:36 PM, Joseph Reynolds wrote:
> We're addressing a new anti-pattern "handling unexpected error codes and 
> exceptions" to address code that just logs errors and continues.  The 
> idea is to think about what diagnostic data to capture, when the 
> application can and cannot recover, using core dumps to debug and 
> improve BMC code, how the BMC recovers from failed services, cascading 
> service failures, and having to reboot the BMC.  It's about balancing 
> the benefits of a core dump against keeping the BMC running.
> 
> The anti-pattern (draft below) is only addressing the first part of 
> that: capturing data and recovering vs crashing.  I plan to push it for 
> review to our [anti-pattern doc][].  Please take a look ... and pass 
> these along to your service strategist.  :)
> 
> [anti-pattern doc]: 
> https://github.com/openbmc/docs/blob/master/anti-patterns.md
> 
> - Joseph
> 
> __________
> 
> Here is the draft anti-pattern: Handling unexpected error codes and 
> exceptions
> 
> Identification:
> The anti-pattern is to continue processing after unexpected error codes 
> and exceptions.
> 
> Description:
> Suppressing unexpected errors can lead an application to incorrect or 
> erratic behavior which can affect a systemd service and the overall 
> system.  Further, merely logging errors may clutter the log and not give 
> "real" problems the attention they deserve, so developers doesn't get a 
> chance to investigate problems and the system's reliability does not 
> improve over time.
> 
> Background:
> Programmers are unsure how to handle unexpected conditions, don't know 
> if it is acceptable for a service to terminate, and may not fully 
> understand the BMC's service strategy.  So they write code to log errors 
> and continue processing when it may be better to terminate an 
> application, restart a service, or handle a situation in ways outside 
> the scope of an application.
> 
> Resolution:
> Several items are needed:
> 1. Check all return codes and account for all possible values.
> 2. Have a good reason to handle specific errors and consider using a 
> default handler to throw an exception.
> 3. Have a good reason to handle specific exceptions and allow other 
> exceptions to propagate.
4. What downstream services are impacted by this service being restarted 
or lost?
5. Should the BMC restarting be left up to the system administrator?
> 
> For error handlers:
> - Consider what data (if any) should be logged.  How will the log entry 
> be used?  For example, log real hardware errors.  Don't log recoverable 
> errors.  For other situations, what data would you need to debug the 
> problem (first failure data capture)?  Would a core dump be useful?
In relation to Andrew's note. Should the log be created for debug only?
> - Determine if the application can fully recover from the condition.  If 
> not, don't continue. 

Audience:
You've decided to create the log entry. Who are you targeting to review 
the log? A BMC developer, Administrator, some analysis program? Usually 
the answer is more than one of these.
For example:
We'll use an ipmi request to set network access to being on, but the 
user input is invalid.

BMC Developer: Reference internal applications, services, pids, etc that 
the developer would be familiar with.
     - Example: ipmid service successfully processed a network setting 
packet, however the user input of USB0 is not a valid network interface 
to configure.

Administrator: They'll be familiar with the external interfaces of the 
BMC such as the REST API. They can respond to feedback about invalid 
input, or a need to restart the BMC.
     - Example: The network interface of USB0 is not a valid option. 
Retry the IPMI command with a valid interface.

Analyzer: Consider breaking the log down and including several 
properties which and analyzer can leverage. For instance, tagging the 
log with 'Internal' is asking to get a defect written as it's not 
helpful. However, breaking that down into something like 
[UserInput][IPMI][Network] tells at a quick glance that the input 
received for configuring the network via an ipmi command was invalid. 
Categorization and system impact are key things to focus on when 
creating logs for an analysis application.
     - Example: [UserInput][IPMI][Network][Config][Warning] Interface 
USB0 not valid.

> 
> Logging and continuing may be appropriate for some errors, but its use 
> must be carefully considered.
> 

Thanks,
Justin
