Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F385973D9
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 18:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7Ckj5TrMz3c3N
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 02:14:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bYzzIiP4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bYzzIiP4;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7CkD6M5tz3bXg
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 02:13:40 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HG6Gqv032884;
	Wed, 17 Aug 2022 16:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lxcR5souPcWZiz7uCElVyH2LrSnxWDnJee1xWo7IKg4=;
 b=bYzzIiP4XT16vdTSV99ABvwrOOW6sMhu7Vxqo/n8hrXHJZePlWgeGyxdKRcud3ZM8Jnu
 YoJ5pAASqJ2QzJDP8sZ4lyxQOHWSjfJNrs4bi4NuQIVQbv9U6HckjaBK/3YvePfdjayN
 5MLJnNsePcIIIR6K+emb2rKUMqmhIhA8z7DicdWNCAOHUNjzheoOkVpms99t6EbE35yX
 uh/YzpZnFd7o2s741NJ/PSijlsiwxa3JrF5eDoEwq70gKiLWaJCvkU6jqX/LpxVyNXPb
 XcAQ5YePp0UGYtIozfAwGnI4wI2ZuHGP/Smn6JqYp2WhLAdhfTm92es2wpNUL/crKjAi wA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j13baream-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 16:13:34 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HG6dWI032094;
	Wed, 17 Aug 2022 16:13:33 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma04dal.us.ibm.com with ESMTP id 3hx3ka7v8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 16:13:33 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27HGDWbe6881968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Aug 2022 16:13:32 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DB78124053;
	Wed, 17 Aug 2022 16:13:32 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52068124052;
	Wed, 17 Aug 2022 16:13:32 +0000 (GMT)
Received: from [9.160.40.68] (unknown [9.160.40.68])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed, 17 Aug 2022 16:13:32 +0000 (GMT)
Message-ID: <7f7f8fb1-0bb0-d453-e96c-8f8e40f7b3d7@linux.ibm.com>
Date: Wed, 17 Aug 2022 11:13:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Security Working Group meeting - Wednesday August 17
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>
References: <772c9b0d-c06e-e4bc-b114-45a413926092@linux.ibm.com>
 <61158439-f152-4399-86f8-a4f730dd967b@www.fastmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <61158439-f152-4399-86f8-a4f730dd967b@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MkbpOd9eshM6W8mOGcOyE8LlW0ed_38c
X-Proofpoint-ORIG-GUID: MkbpOd9eshM6W8mOGcOyE8LlW0ed_38c
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_11,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170061
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

On 8/17/22 12:11 AM, Andrew Jeffery wrote:
>
> On Wed, 17 Aug 2022, at 12:37, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting
>> scheduled for this Wednesday August 17 at 10:00am PDT.
> Given the discussion from last meeting, is this on Discord?

No.  The meeting access for Aug 17 is the same as before:
https://ibm.webex.com/meet/joseph.reynolds1

I wanted to give a couple of weeks notice (A) for attendees to firm up 
any objections to moving, and (B) to announce the change.

Joseph

>
> Andrew

