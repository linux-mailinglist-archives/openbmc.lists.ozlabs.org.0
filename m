Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B70511CC1
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 20:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpRZH1ywrz3bZY
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 04:08:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QVlQbYIR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QVlQbYIR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpRYm1tclz3bZN
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 04:07:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RHLfEq008548
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 18:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=82SXrh4Hbduf/BIqakpEa22qN/vipp30lWoXlmatsr8=;
 b=QVlQbYIRl80bOa5GrRoMzKSeqeUHhL9f2bOPYI1k0DZts+7cHJDgrQTSeMJs7qGXxtql
 g2XUzp+70Xx3Mt65bJoSlpc11DwJmpVKCm3HBUkBuBY2lvFT0SsNlI6JpXAArc8rJOtu
 bIWN8XFT8XomH+OZmi+/N2hXBZ4NjMsAzP6idUm6W16RBmlVrvyXkdX0tvvPH4aZUJ9Q
 sM1IDEN5HDoEEKnk6DYKK2Ago5EmLQFXZAT1zjqFQOHARRLS5vZEvjBV5pInM/jCjs8J
 xN21lVbwzGyGKhRL/Eajp8DyRCVs9XVLQni0htCNel5A2M2GS6FtXDLLIC2wtg0XvARG Dg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fq7tqcer9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 18:07:53 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23RI2elF013716
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 18:07:52 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3fm93a57ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 18:07:52 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23RI7plf11731228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 18:07:51 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A7466A04D
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 18:07:51 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 375886A04F
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 18:07:51 +0000 (GMT)
Received: from [9.65.238.111] (unknown [9.65.238.111])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 18:07:51 +0000 (GMT)
Message-ID: <8f2429cb-bf11-44c8-cbef-9425dfa93481@linux.ibm.com>
Date: Wed, 27 Apr 2022 13:07:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: Security Working Group meeting - Wednesday April 27 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <0b3f41c1-476b-bd94-3351-69faf93b2e82@linux.ibm.com>
In-Reply-To: <0b3f41c1-476b-bd94-3351-69faf93b2e82@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b96geu-kq_O0alNKKTyJtiE3iut2S88U
X-Proofpoint-ORIG-GUID: b96geu-kq_O0alNKKTyJtiE3iut2S88U
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204270113
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

On 4/27/22 7:31 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday April 27 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>

Attendees: Joseph Reynolds, Ruud Haring, Dhananjay, Jiang Ziang, Daniil, 
Nirav Shah, Mark McCawley, Terry Duncan.


1 Followup to SELinux discussion from last time.

TODO Joseph: post the session recording and the presentation.

Note design in gerrit review 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/53205 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/53205>

We clarified the goal of the design is to make it easy for a system 
integrator to add SELinux to their BMC firmware image, and to set some 
basic SELinux policies which do not create “too many” denial event log 
entries when SELinux is switched to permissive mode.  The usefulness of 
this design is to collect data for policies needed to switch SELinux to 
enforcing mode.  It remains an open question what policies are generally 
useful to the OpenBMC community.


Dhananjay mentioned a SELinux policy analysis tool:

https://ossna2020.sched.com/event/ckpF/selint-an-selinux-policy-static-analysis-tool-daniel-burgener-microsoft 
<https://ossna2020.sched.com/event/ckpF/selint-an-selinux-policy-static-analysis-tool-daniel-burgener-microsoft>

https://www.youtube.com/watch?v=Gx5bxwvzN_Y 
<https://www.youtube.com/watch?v=Gx5bxwvzN_Y>


2 Is there a tie-in between Penetration testing and SELinux?

Note: Pen testing is performed by individual platforms, and the testing 
effort is not shared: only  vulnerabilities and fixes are shared.  Help 
wanted at the community level.

The idea is that the same kind of analysis is needed for both Pen 
testing and to make SELinux policy.  Can we share that analysis or 
develop it in the OpenBMC community?


3 Nirav Shah - Alternate idea: Use D-Bus session buses (vs the system bus).

Note that all OpenBMC applications use the D-Bus system bus, which only 
the root user is allowed to access.

Nirav presented an idea to change some applications to use a session bus 
(and away from the system bus).  Doing so allows BMC applications to run 
as non-root and makes it easier for different applications to 
communicate via D-bus APIs.

We believe this work is relatively independent of SELinux policy 
configuration.



Joseph

>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

