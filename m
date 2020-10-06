Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08028438C
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 02:53:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4zTj5qG1zDqHW
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 11:52:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LFFkbgA2; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4zSv1cvfzDqGn
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 11:52:14 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0960gm7T117850; Mon, 5 Oct 2020 20:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n6FPmZePB/Mx2VTf1i9QJxLm0qYdUz7E+8AmFJXBSn0=;
 b=LFFkbgA24FDVxBXZykbUkC1q4tSCc6DRnryLEPXyzwO9kTyWvVotuc9FXYRdZkQ315AL
 D245X9iUoVFv0AET47pTcc+euViA2vKaLWcn5A20BbqcpYP24Gf73D5cxeGc0L4gJcfh
 5a4WI9dJWJVo3so9PsJLlbNHKHWr/nNhTeIj91V+J1rBphdVn78a/z+Aw0lUWm7lvgdc
 HMn9zAH42/ifM1X4RQfe/wn+8iYew18WmdpEkmWf8TVS9+vU1Epq65RACBE8eeeDM67E
 NQmZvVZw+7xuzb6bb6HPlTDJVOLQXVCu1dOx65BYYpf1R14qALjepIkPs7tf026rTCih ow== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340e9dg646-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 20:52:10 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0960WOv2000859;
 Tue, 6 Oct 2020 00:52:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 33xgx98fqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 00:52:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0960q4wA59769088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Oct 2020 00:52:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A00A78060;
 Tue,  6 Oct 2020 00:52:08 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6A7A7805C;
 Tue,  6 Oct 2020 00:52:07 +0000 (GMT)
Received: from [9.80.207.130] (unknown [9.80.207.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Oct 2020 00:52:07 +0000 (GMT)
Subject: Re: Redfish: Supporting deprecated properties
To: Ed Tanous <ed@tanous.net>, Gunnar Mills <gmills@linux.vnet.ibm.com>
References: <1a66bd6f-4095-2357-c860-80435c63bbe5@linux.vnet.ibm.com>
 <CACWQX80ZxZuvzLzCoEvENYPSHd0yFiR8O=eu0oovptw4zYgzxQ@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <68eb3222-c775-ff34-778b-d41561979ed5@linux.ibm.com>
Date: Mon, 5 Oct 2020 19:52:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CACWQX80ZxZuvzLzCoEvENYPSHd0yFiR8O=eu0oovptw4zYgzxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_19:2020-10-05,
 2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010050169
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/5/20 4:35 PM, Ed Tanous wrote:
> On Mon, Oct 5, 2020 at 1:34 PM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>> Felt this needed some broader discussion. Although Redfish tries to
>> avoid, it does deprecate properties. In the future, Redfish plans to
>> deprecate whole schemas. One of these deprecated properties was the
>> IndicatorLED property, replaced by the LocationIndicatorActive property.
>> More information on this can be found at (Slide 11):
>> http://www.dmtf.org/sites/default/files/Redfish_Release_2020.3_Overview.pdf
>>
>> On https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36886, it was
>> proposed supporting both the deprecated and new property for some time.
>> This would introduce a new Redfish Validator warning about implementing
>> a deprecated property. We have other warnings today so maybe not a big deal.
>> How long do we need to support both properties?
>> Based on releases? 6 months? That feels too long.
...snip...
>
> In this specific case, what if we did this:
> Now;  Upstream backward compatible LocationIndicatorActive property to
> bmcweb.  Upstream changes to OCP schema to also deprecate
> IndicatorLed.  Time starts counting once both patches have been
> accepted into their respective mainline branches.
> N+1 release;  Implement returning a deprecation warning to the user
> attempting to use the IndicatorLED PATCH API.
> N+2 release; Remove the IndicatorLED property from GET requests, but
> continue to accept the property for PATCH requests (we've done this in
> other cases).
> N+3 release; Disallow PATCH to that property entirely, and continue
> with new implementation.  Ideally hold the deprecation warning, but
> use judgement about technical debt.
>
> ?????
>
> Profit!

Can we discuss this without referencing South Park, season 2, episode 
17, please?

- Joseph

