Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1822B131
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 16:23:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCF0z1tpqzDrR5
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 00:22:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCDlt157mzDr37
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 00:11:37 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NE3VQk101414
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 10:11:35 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32face38y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 10:11:33 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NE09iS027570
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 14:11:32 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 32d5dqntme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 14:11:32 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NEBTSo53674304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 14:11:29 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43A6F6A054
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 14:11:31 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 059306A051
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 14:11:31 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.172.74])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 14:11:30 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday July 22 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <b8ec220b-56ca-45f7-99be-5ab197c4d881@linux.ibm.com>
Message-ID: <b5f1c04f-eb6c-7dac-2945-cff9815a7ca6@linux.ibm.com>
Date: Thu, 23 Jul 2020 09:11:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b8ec220b-56ca-45f7-99be-5ab197c4d881@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_06:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230105
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



On 7/20/20 8:57 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday July 22 at 10:00am PDT.
>
> We'll discuss current development items, and anything else that comes up.
>
> 1. The OpenBMC interface overview is merged into the docs repository 
> here: 
> https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md. 
> Is there interest in building a threat model on top of this?
No discussion.

>
> 2. A gerrit review merged. It is a rework of BMCWeb authorization 
> flow: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/30994
>
> and tweaks some security settings.  Is there interest in reviewing the 
> code or changed settings?  (Please note: This changed was introduced 
> Months ago and it went unnoticed in the security workgroup.  Better 
> late than never.)
No discussion
>
> 3.Gerrit review: Firmware minimum ship level (can help with host 
> firmware anti-rollback protection) 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/29914
> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
No discussion

Topics added after the meeting notice was sent:

4 Question: If BMCWeb finds an unusable HTTPS site identity certificate, 
it DELETES it and self-generates one.  This has caused problems for 
certificates that are not valid until a future date. In general, what 
certificate management support should we have for BMCWeb?  What is needed?
ANSWER:
There were two discussion threads: The BMC’s notion of time of day 
(TOD), and how BMCWeb should handle certificates.

Does the BMC have a battery backed TOD clock?  Depends on BMC model.  
Can it validate if it has access to its NTP server (when configured)?  
Does the BMC know if its time was set correctly?

How does the BMC know if the BMC has the correct time?  Have a BMC flag 
that says, “Look like the BMC TOD clock is not working.”  Does the BMC 
know if we got a good time from an  NTP server?  Can we read the GPS 
signal?  What is the industry solution?
Should the BMC store its idea of what date it is?  So it can report if 
the time changes significantly.  Or will this lead to a bigger problem?  
Is it better/simpler to check for TOD = beginning-of-era-1/1/1970?  → 
start an email thread

BMCWeb configuration?  Configure option: delete cert and generate 
self-signed -vs- use defective certificate.  What is the purpose of 
deleting the unusable cert?  Should “out of date” not be part of the 
“unusable” definition? ⇒ Ideas: 1. If bmcweb finds a usable cert but is 
out of date, that cert can still be used.  2. Leave the defective 
certificate (do not delete it) and log an error.

The group consensus was that BMCWeb should treat its HTTPS site identity 
certificate like this:
1 certificate is perfectly good - Use the certificate
2 certificate is good but expired or not yet valid - Use the certificate 
and log a warning
3 certificate is missing or bad format or algorithm too old - Use 
another certificate or self-generate a certificate (and log that action)
There are no cases where BMCWeb should delete any certificate.

Next steps: discuss on email list, write patch.

5 Fuzzing.  We briefly discussed the existing test infrastructure 
https://github.com/openbmc/openbmc-test-automation/ and previous calls 
for fuzzing.
If someone wanted to perform fuzzing, where would they start, what tools 
should they use, etc.

6. Can we fill out the information in 
https://github.com/openbmc/openbmc/security ?


- Joseph

>
> - Joseph

