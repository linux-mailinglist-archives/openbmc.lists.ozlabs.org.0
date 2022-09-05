Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BBB5AD957
	for <lists+openbmc@lfdr.de>; Mon,  5 Sep 2022 21:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLyWp1S2Dz300l
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 05:00:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oXoB6doM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oXoB6doM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLyWP6gCgz2xG4
	for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2022 05:00:01 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285Ik6iD031650;
	Mon, 5 Sep 2022 18:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=bLmTZkskQkcKRVEnktkevyGTjpj9l/IuEEuqHZNJT38=;
 b=oXoB6doMz4bPz6kxpir9l104V6a4x2Mgl05/YzetzpMNlGZxiWKb2DcS1yVEMAXSfoHf
 ta1harRdCw5/f7o/HcDKkxxCCMgy3sXN3T8TjzCZobBhA/hyZGWFIHjbaMFGU3HX3gzP
 A7/23Hg02YGYcCklNKIpaFIxmS6RN1Yth0LIvCgZodB2O5J9PFNe8PFsoMJESp6D/woO
 0OARdFl1Z/cl/BtkenwzrLabvOB7iZCef50xOCt7WKDZJxwSyC4vPXs3BKgxkFYptlPM
 AfJmdD4fzRkR6Jxnfxn9UawQdAcLbs3G9AsecyCLox1zXvduhmEsBo9hR+6R105k9dPq 6g== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdpp9g86y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 18:59:59 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285Iq3ax014349;
	Mon, 5 Sep 2022 18:59:58 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma04wdc.us.ibm.com with ESMTP id 3jbxj9ejt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 18:59:58 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 285IxwI766060712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Sep 2022 18:59:58 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 046DAAE060;
	Mon,  5 Sep 2022 18:59:58 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9B04AE05C;
	Mon,  5 Sep 2022 18:59:57 +0000 (GMT)
Received: from [9.160.52.140] (unknown [9.160.52.140])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon,  5 Sep 2022 18:59:57 +0000 (GMT)
Message-ID: <3ffc663e-82d9-1ba8-9a47-9b5876ab2dc7@linux.ibm.com>
Date: Mon, 5 Sep 2022 13:59:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCXBocd0Uz0u1D7@heinlein.stwcx.org.github.beta.tailscale.net>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <YxCXBocd0Uz0u1D7@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BZzHkdxFRws8tFEo4fH0RXMreLUIDucs
X-Proofpoint-ORIG-GUID: BZzHkdxFRws8tFEo4fH0RXMreLUIDucs
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_14,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209050090
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

On 9/1/22 6:27 AM, Patrick Williams wrote:
> On Wed, Aug 31, 2022 at 01:09:10PM -0500, Joseph Reynolds wrote:
>
>> 2  Proposal for dynamic changes to Redfish authorization rules
>> https://gerrit.openbmc.org/c/openbmc/docs/+/56401
>> <https://gerrit.openbmc.org/c/openbmc/docs/+/56401>
>>
>> No discussion.
> Does "no discussion" mean?
>     - This topic was not covered.
>     - Nobody present seemed to have an opinion.
>     - Everyone present was onboard with it as-is.
>
> I'm trying to gauge where consensus is at.

I use "no discussion" when the topic was introduces and described, but 
nobody expressed any interest or asked any questions.  I think someone 
asked for the review link, which was already in the agenda. <-- Is there 
a better way I could say this in the meeting minutes?
When an agenda item is skipped or omitted from the meeting, I'll put 
something like "the following topics were not covered" with the reason why.

Joseph
