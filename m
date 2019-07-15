Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E8969B4F
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 21:23:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nYMy4jpKzDqTJ
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 05:23:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nYMJ4w1tzDqSB
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 05:22:35 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6FJLwDt140173
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 15:22:27 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2trw43eym8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 15:22:26 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Mon, 15 Jul 2019 20:22:25 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 15 Jul 2019 20:22:23 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6FJMMG650200892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 19:22:22 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BF922805A
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 19:22:22 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07FB628065
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 19:22:22 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 19:22:21 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday July 10 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <178abb88-594e-1c23-bf09-3636e6e9ec2b@linux.ibm.com>
Date: Mon, 15 Jul 2019 14:22:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <178abb88-594e-1c23-bf09-3636e6e9ec2b@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071519-0052-0000-0000-000003DF49FB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011434; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01232652; UDB=6.00649440; IPR=6.01013953; 
 MB=3.00027728; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-15 19:22:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071519-0053-0000-0000-000061B3E97F
Message-Id: <95f5155c-f320-f7bd-8bbc-d093769ee3f8@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907150221
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

On 7/9/19 10:20 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday July 10 at 10:00am PDT.
>
> * * * The call-in access is new/changed for this meeting - details 
> below * * *
>
> Current topics:
> - Development work (including approved network security considerations)

We talked about the BMC initial setup, aka provisioning.
We also discussed ideas about how to secure the BMC against having a 
default password. The top two ideas were:
1. Have the password be expired, so the BMC admin has to change it to 
use the BMC.
2. Have the BMC start in a new "setup mode" which encourages its admin 
to change its password.

> - BMC use cases

We went around the room, and several folks mentioned interest in the 
DMTF's Security Protocol and Data Model (SPDM ~ 
https://www.dmtf.org/content/spdm-spec-feature).  I've added that topic 
to the agenda.

> - Release planning input

Only I stated an interest in providing security-related input to the 2.7 
release process.  So I will send that email with only my name on it..

>
>
> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph
>
> The Security Working Group meeting access is changing.  The old access
> will not be used.  The new access is given in the wiki and in this
> email.  This is effective immediately, so please update your calendars.
> Here is the information for the web video conference and telephone 
> access:
> - Join via Web:https://ibm.webex.com/meet/joseph.reynolds1
> - Join via Phone: Use access code: 927 034 486 -- United States Toll
> Free: 1-844-531-0958. Click here for other phone numbers
> <https://ibm.webex.com/cmp3300/webcomponents/widget/globalcallin/globalcallin.do?siteurl=ibm&serviceType=MC&ED=756982637&tollFree=1> 
>
> - Visit the Webex web site for more ways to join or for an updated
> access code.
>
>

