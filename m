Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C10A1494004
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 19:36:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfDrD4mgkz3bPB
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 05:36:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ib65WsKK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ib65WsKK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfDqk4s94z2yYc
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jan 2022 05:36:18 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JIBARE023645
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 18:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=K3jzJnVkfbY/7P2qjz9R+c99W9RsmyG/mhWGsOUeBSw=;
 b=Ib65WsKKwkzxMgDI2s/bKNJqeMSdeNBeaw2QTo2abi9t4WXoLcmGFdPvmXPMWxOgYrk9
 sRZsoZkJF5CGOwsGl1UbYwpgU+FFYMF7gQb1jtF+oGr6o95sgeagp0dwv5DSiNj4Sh+d
 4qp06oBotLCxUB2I/5yBFcXJxLh/+TKgZZHFp8T1UmvMF83KLMsiLJ10Bzjgq77bzJjE
 q/WKa/elcVqI7gFbSis104ATf379c/NTd/Gq+4uCek+fl1iCnIDRnMX22K1pP8bvHAZR
 h5kgmmn4j0/GG0VoSHkkS622E0Tu7gb9Pb2rCcJraV+oair5zBSavJYQBvNb+Iah3CyK eA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dpmvhd4ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 18:36:15 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20JII03p032567
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 18:36:14 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3dknwbegr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 18:36:14 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20JIaEWD35455364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 18:36:14 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11A9C6A064
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 18:36:14 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7B0D6A058
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 18:36:13 +0000 (GMT)
Received: from [9.160.122.53] (unknown [9.160.122.53])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 18:36:13 +0000 (GMT)
Message-ID: <7ef1bc65-a7a8-7ac0-f1af-80a929c8f36a@linux.ibm.com>
Date: Wed, 19 Jan 2022 12:36:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: Security Working Group meeting - Wednesday January 19 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <c8c1bdcb-bf8a-c266-53c2-51f53fbe44ea@linux.ibm.com>
In-Reply-To: <c8c1bdcb-bf8a-c266-53c2-51f53fbe44ea@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pr7IWfNRN2jRS6F5Wa6sTgWvOPtta2Pt
X-Proofpoint-ORIG-GUID: Pr7IWfNRN2jRS6F5Wa6sTgWvOPtta2Pt
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_10,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=919 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190103
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

On 1/18/22 10:03 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday January 19 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>
>

Attended: Joseph, Dhananjay, James Mihm, Aviram from Kameleon, Dick 
Wilkins, Daniil, Jiang Zhang.


1 James mentioned two topics from last time: (a) integrate OpenBMC 
Security Response Team (SRT) docs into github, and (2) enhance the SRT 
process (as the OpenBMC CNA) to follow the correct process to write CVEs.

James renewed the call to push to writeup security issues in (private 
repo) https://github.com/openbmc/security-response/issues 
<https://github.com/openbmc/security-response/issues>

We are still working on this, with the limited amount of time we have.


2 Aviram from Kameleon briefly outlined interest in an OpenBMC Root of 
Trust (RoT).

The RoT controls access to the flash for both the BMC and host, 
following WIP standards from OCP: 
https://www.opencompute.org/blog/ocp-security-announces-version-10-specs-for-root-of-trust 
<https://www.opencompute.org/blog/ocp-security-announces-version-10-specs-for-root-of-trust>


-Joseph

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

