Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F68158930
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 05:36:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Gqjt1LmDzDqKj
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 15:36:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gqj829SdzDqJh
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 15:36:11 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01B4YWDS109134
 for <openbmc@lists.ozlabs.org>; Mon, 10 Feb 2020 23:36:08 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y1tndsqgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Feb 2020 23:36:08 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01B4ZhwK006689
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 04:36:08 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 2y1mm77y5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 04:36:08 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01B4a7x930736658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 04:36:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 347A9AC060
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 04:36:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AE11AC05F
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 04:36:07 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.162.62])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 04:36:06 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: anti-pattern: unexpected errors and exceptions
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <4642cc29-f1c5-7b33-ae06-6a734cbb3484@linux.ibm.com>
Date: Mon, 10 Feb 2020 22:36:05 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_08:2020-02-10,
 2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110031
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

We're addressing a new anti-pattern "handling unexpected error codes and 
exceptions" to address code that just logs errors and continues.  The 
idea is to think about what diagnostic data to capture, when the 
application can and cannot recover, using core dumps to debug and 
improve BMC code, how the BMC recovers from failed services, cascading 
service failures, and having to reboot the BMC.  It's about balancing 
the benefits of a core dump against keeping the BMC running.

The anti-pattern (draft below) is only addressing the first part of 
that: capturing data and recovering vs crashing.  I plan to push it for 
review to our [anti-pattern doc][].  Please take a look ... and pass 
these along to your service strategist.  :)

[anti-pattern doc]: 
https://github.com/openbmc/docs/blob/master/anti-patterns.md

- Joseph

__________

Here is the draft anti-pattern: Handling unexpected error codes and 
exceptions

Identification:
The anti-pattern is to continue processing after unexpected error codes 
and exceptions.

Description:
Suppressing unexpected errors can lead an application to incorrect or 
erratic behavior which can affect a systemd service and the overall 
system.  Further, merely logging errors may clutter the log and not give 
"real" problems the attention they deserve, so developers doesn't get a 
chance to investigate problems and the system's reliability does not 
improve over time.

Background:
Programmers are unsure how to handle unexpected conditions, don't know 
if it is acceptable for a service to terminate, and may not fully 
understand the BMC's service strategy.  So they write code to log errors 
and continue processing when it may be better to terminate an 
application, restart a service, or handle a situation in ways outside 
the scope of an application.

Resolution:
Several items are needed:
1. Check all return codes and account for all possible values.
2. Have a good reason to handle specific errors and consider using a 
default handler to throw an exception.
3. Have a good reason to handle specific exceptions and allow other 
exceptions to propagate.

For error handlers:
- Consider what data (if any) should be logged.  How will the log entry 
be used?  For example, log real hardware errors.  Don't log recoverable 
errors.  For other situations, what data would you need to debug the 
problem (first failure data capture)?  Would a core dump be useful?
- Determine if the application can fully recover from the condition.  If 
not, don't continue.

Logging and continuing may be appropriate for some errors, but its use 
must be carefully considered.

