Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F63558C2E
	for <lists+openbmc@lfdr.de>; Fri, 24 Jun 2022 02:18:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTd522k3xz3brj
	for <lists+openbmc@lfdr.de>; Fri, 24 Jun 2022 10:18:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qchLALtr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qchLALtr;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTd4Z58gVz3bkG
	for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2022 10:18:05 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NNpeNr038039;
	Fri, 24 Jun 2022 00:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cKHvB8kxqvW+Lws1piS1+7o1sMpUxK/cH/Nh2sH5Joo=;
 b=qchLALtrUqbXNu1psYSRBBEGV59t4AI5+Zxbo9OKg20iKIZ+c+2ikTRIgwoTfbOHHH9P
 sNPfNHvG8WY19uzLXAXUDJUTR8OEI1oeo/yjY8eyuWEaZm2BnujqSfRIKbwQJb32fuok
 7FvCgTOwnLtUgsuUXc8ZrYZZ6BVAADV4L9Sk8y7bK/89o/QiKUB5/SSXINkBTD4WDQcZ
 B9nAVUUwmTnXRA9poZuJkQ3rjru7OnA4zSGXghu0HFWiXleo5hLDLTRAid31iZqCE4Qu
 rf1PiW97LHX+lapIOHESSTJqMPS3c+/1ZyOcgt4Arhx0OZgeAHN+oidX24vTrEOFzwSN CQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gw27a0gyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 00:18:02 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25O06hZH007599;
	Fri, 24 Jun 2022 00:18:01 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma01wdc.us.ibm.com with ESMTP id 3gv5ck35hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 00:18:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25O0I0cY14353148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 00:18:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DB287805F;
	Fri, 24 Jun 2022 00:18:00 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 370A47805C;
	Fri, 24 Jun 2022 00:18:00 +0000 (GMT)
Received: from [9.160.179.107] (unknown [9.160.179.107])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Fri, 24 Jun 2022 00:18:00 +0000 (GMT)
Message-ID: <a136f639-ce78-1958-b1d4-e00e7a81f792@linux.ibm.com>
Date: Thu, 23 Jun 2022 19:17:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Security Working Group meeting - Wednesday June 22 - results -
 BMC-attached TPM
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <4ca4257d-58f1-abc7-a85e-34e9904d4602@linux.ibm.com>
 <bda71881-1a64-ad19-6fb1-fbb328975935@linux.ibm.com>
 <YrN6lkOgNMNCoJdM@heinlein.stwcx.org.github.beta.tailscale.net>
 <cd907039-8b9e-51b3-a672-c079f3e49233@linux.ibm.com>
 <YrOUpSSbSjvMkN+m@heinlein.stwcx.org.github.beta.tailscale.net>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <YrOUpSSbSjvMkN+m@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2MBnsaZ9MsnZCH0v0RFbzO7veq6s4CQR
X-Proofpoint-GUID: 2MBnsaZ9MsnZCH0v0RFbzO7veq6s4CQR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=887 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230093
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/22/22 5:16 PM, Patrick Williams wrote:
> On Wed, Jun 22, 2022 at 04:23:41PM -0500, Joseph Reynolds wrote:
>> On 6/22/22 3:24 PM, Patrick Williams wrote:
>>> On Wed, Jun 22, 2022 at 01:20:48PM -0500, Joseph Reynolds wrote:
>>>> On 6/22/22 10:19 AM, Joseph Reynolds wrote:
>>>> 3 Measured boot
>>>>       Enable network agents (like keylime server, possibly the host
>>>>       system) to get measurements from TPM.  Note the measurements are
>>>>       digitally signed by the TPM to ensure their integrity.
>>> Is there any work going on to define some kind of measurement schema in
>>> Redfish?  Last I knew this was absent.
>> Thanks for the reminder.  I started a thread for this:
>> https://redfishforum.com/thread/685/support-bmc-attached-tpm
> Sounds good.
>
> You mentioned there the "TrustedModules" type.  It doesn't seem like
> this exposes measurements currently?  Am I misunderstanding?  That seems
> pretty important for our use case.

Thanks.  I've edited/appended the post to clarify that we need to 
enhance the TrustedModule schema so we can GET the TPM's measurements.

-Joseph

