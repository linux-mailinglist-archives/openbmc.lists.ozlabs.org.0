Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226A5A733E
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 03:16:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHR925ldxz3bcc
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 11:16:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oXBZ/TLG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oXBZ/TLG;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHR8c00yYz2xs1
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 11:16:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27V0iQjK032449
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 01:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=eiLp+Boy87+vHIITeTOtlStg1dCN8z0dG+dh4ApMOWA=;
 b=oXBZ/TLGMQNgZfPx1xTd+nAQCuMo2HvJkbFum89O6Ep2D/PoAP7IkqRtLDLIGm4L2Lqn
 7TosHUiyVxT6MGxT/wEEvVUjFe+i8CC0qc3RvusrOYZQrjQq3IrjpDB2lPi2dEBW+1oh
 ApFulYs3L4TPa94XYjKpvEvbjtg4FipxTR+WYwCWdQRJDENYPCqgBJ3nAghVAQcXkz6G
 VynRyfPlNc6pKXTXpRFFpuDKRY4d0B4D/6Oh9Bqnzr7tztpuROPcKn27yGzT6Pos5BVW
 54uEIYOZJCR1EriEU8XzAyFVYyMLPNt3pk3zWLkIXrVQ3Y54QsyhVbjbZjxGlXl9rNU+ Yg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9wc48n3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 01:16:28 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27V165qh016401
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 01:16:28 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02dal.us.ibm.com with ESMTP id 3j7aw9n3re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 01:16:28 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27V1GR8n59638050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 01:16:27 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA8D1136055
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 01:16:26 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 817E913605D
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 01:16:26 +0000 (GMT)
Received: from [9.160.68.28] (unknown [9.160.68.28])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 01:16:26 +0000 (GMT)
Message-ID: <ecfd428f-8c96-4b99-e5d2-ec97e6608c7e@linux.ibm.com>
Date: Tue, 30 Aug 2022 20:16:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: Security Working Group meeting - Wednesday August 31 - new venue
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
In-Reply-To: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5ym1SrGAFqr_8iHosT5HJhFq1-es5uvm
X-Proofpoint-GUID: 5ym1SrGAFqr_8iHosT5HJhFq1-es5uvm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_12,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=956 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310001
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


Effective immediately, the Security Working Group meeting access is on 
Discord voice.  Please update your calendars.   The meeting date and 
time is unchanged.

Discord > OpenBMC > Voice channels >  Security:
https://discord.com/channels/775381525260664832/1002376534377635860


On 8/30/22 8:08 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday August 31 at 10:00am PDT.
>
>
> ATTNTION - Venue Change.  The meeting moved to Discord voice, 
> beginning with this meeting.  Please update your calendars.
>
> === MEETING ACCESS ON DISCORD VOICE starting on Aug 31, 2022  ===
>
> Discord > OpenBMC > Voice channels >  Security ~ 
> https://discord.com/channels/775381525260664832/1002376534377635860 
> <https://discord.com/channels/775381525260664832/1002376534377635860>
>
>
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>
> 1. Continue Measured Boot discussion.
>
> 2. Gerrit review: Proposal for dynamic changes to Redfish 
> authorization rules https://gerrit.openbmc.org/c/openbmc/docs/+/56401
>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

