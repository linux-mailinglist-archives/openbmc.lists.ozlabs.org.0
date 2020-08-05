Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BEA23D42B
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 01:28:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMSTl4bZ4zDqjj
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 09:27:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMSSR4xwNzDqJV
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 09:26:46 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 075N326l005135
 for <openbmc@lists.ozlabs.org>; Wed, 5 Aug 2020 19:26:43 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qcf2pkug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 19:26:43 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 075NPhP9009609
 for <openbmc@lists.ozlabs.org>; Wed, 5 Aug 2020 23:26:42 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 32n019crrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 23:26:42 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 075NQde458720560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 5 Aug 2020 23:26:39 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A72D5136053
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 23:26:41 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6110613604F
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 23:26:41 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.201.74])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 23:26:41 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday August 5 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <cf68b3d3-9f1d-0f2e-cfa2-98afde52e243@linux.ibm.com>
Message-ID: <e736ad6d-66fd-f24f-b1e5-74cc2c71e856@linux.ibm.com>
Date: Wed, 5 Aug 2020 18:26:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <cf68b3d3-9f1d-0f2e-cfa2-98afde52e243@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_18:2020-08-03,
 2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008050169
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

On 8/3/20 4:09 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday August 5 at 10:00am PDT.
>
> We'll discuss current development items, and anything else that comes up.

Bonus topic discussed before the meeting:
We discussed the "security working group" email notices intended to get 
folks to attend this meeting.  Parth volunteered to send these emails 
beginning next meeting.
We discussed the "security working group - results" email (this email) 
that summarizes the discussion and may contain a call to action.
See example emails archived here:
invitation: https://lists.ozlabs.org/pipermail/openbmc/2020-July/022296.html
results: https://lists.ozlabs.org/pipermail/openbmc/2020-July/022330.html

>
> 1. Review/create OpenBMC security policy: 
> https://github.com/openbmc/openbmc/security
Sounds good.  Joseph to follow up.

>
> 2. Make OpenBMC security advisories available under: 
> https://github.com/openbmc/openbmc/security
Sounds good.  Joseph to follow up.

>
> 3. Do we need a followup discussion for the recent HTTPS certificate 
> email threads?
No. The consensus from the email thread sounds good.

>
> 4. Is there interest in enhancing OpenBMC firmware image update 
> uploads using the Redfish-specified multipart HTTP push updates (that 
> is, support the MultipartHttpPushUri property?
Sounds good, but nobody is working on it.  We also discussed use cases 
for golden/primary/active/alternate images.


New topics after the invitation email was sent:

5. Call for BMC hardware vendors (like ASPEED and Nuvaton) to 
collaborate with OCP security - 
https://lists.ozlabs.org/pipermail/openbmc/2020-July/022413.htmlto help 
define platform root of trust.

6. The Google GLOME project was introduced; this can be a way to 
authorize BMC users.
See https://github.com/google/glome/blob/master/docs/glome-login.md
A GLOME talk is scheduled for the next meeting: Wednesday August 19.

7. Can we add new “security” label for GitHub issues and for Gerrit? 
ANSWER: Yes. Joseph to followup.
8. The CSIS (Cloud Security Industry Summit) wants feedback on improving 
BMC security. ANSWER: Joseph volunteered to attend the meetings.
>
> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph

