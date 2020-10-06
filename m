Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70B284390
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 02:54:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4zWp5KWXzDqHR
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 11:54:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ppWM+ac0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4zTG4QzFzDqJC
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 11:52:34 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0960VELT019139; Mon, 5 Oct 2020 20:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xCT5S2upVwn66TrBFpVtZR79VoTi8inPjlBoiZTte08=;
 b=ppWM+ac0o4xO+ANNghbMRSaSHmqDB8G9lzgOsCZYxf3w4TKvyoJ+VM5crZI34AOVYn1o
 feCD26ao4BFgmgv6wntAPsRI/dsXztnnaqvzOpMB4bpNeh/y0sFb6RK03XBnC/TErml4
 O6loQVs32a+2eMr6J8VMkMRTUEdZdkYSAygOTflwQxk3THvjrgqIA691hWFoxSgS2eNo
 l5+bhilyCAjkSNyrmQ+BluIi9kbg10MWPEWMdsRGzc+lKYqB44/qlBGD/m6iiDYKH4QI
 x8xVxQmetBoO9PLntnleQ1g6RV4sfjytGKjIVYXd/EvysCV1jw6p2aWTYGuxcMbtGZBD Vw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 340dfksav1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 20:52:31 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0960qIEp025244;
 Tue, 6 Oct 2020 00:52:30 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 33xgx98fta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 00:52:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0960qNSh31982010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Oct 2020 00:52:23 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3389A7805C;
 Tue,  6 Oct 2020 00:52:28 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC8C77805F;
 Tue,  6 Oct 2020 00:52:27 +0000 (GMT)
Received: from [9.80.207.130] (unknown [9.80.207.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Oct 2020 00:52:27 +0000 (GMT)
Subject: Re: Redfish: Supporting deprecated properties
To: Ed Tanous <ed@tanous.net>, Gunnar Mills <gmills@linux.vnet.ibm.com>
References: <1a66bd6f-4095-2357-c860-80435c63bbe5@linux.vnet.ibm.com>
 <CACWQX80ZxZuvzLzCoEvENYPSHd0yFiR8O=eu0oovptw4zYgzxQ@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <f1e2d3a7-2d72-523e-4141-bf4c8d132046@linux.ibm.com>
Date: Mon, 5 Oct 2020 19:52:26 -0500
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
 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2010050169
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
>> avoid, it does deprecate properties.
>>
>> In this specific case, what if we did this:
>> Now;  Upstream backward compatible LocationIndicatorActive property to
>> bmcweb.  Upstream changes to OCP schema to also deprecate
>> IndicatorLed.  Time starts counting once both patches have been
>> accepted into their respective mainline branches.
>> N+1 release;  Implement returning a deprecation warning to the user
>> attempting to use the IndicatorLED PATCH API.
>> N+2 release; Remove the IndicatorLED property from GET requests, but
>> continue to accept the property for PATCH requests (we've done this in
>> other cases).
>> N+3 release; Disallow PATCH to that property entirely, and continue
>> with new implementation.  Ideally hold the deprecation warning, but
>> use judgement about technical debt.
>>
>> ?????
>>
>> Profit!
>>
>> Clients can use the schema version to determine which properties are
>> available. If needed companies in a fork could maintain backward
>> compatibility for longer.
> In practice, many clients don't check the schema at all.  I really
> wish Redfish had a way for a client to say "I support X version of the
> schema, give me the things compatible with that", but I'm not aware of
> anything like that.
>
>> Thanks,
>> Gunnar

