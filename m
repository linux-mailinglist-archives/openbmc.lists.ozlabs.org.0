Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29564397B66
	for <lists+openbmc@lfdr.de>; Tue,  1 Jun 2021 22:48:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvklZ2vJSz2yyj
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 06:48:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KaLkZIh8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KaLkZIh8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvklF5dgwz2yjJ
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 06:48:25 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151KhRDB012705; Tue, 1 Jun 2021 16:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=418JZw3xLtbAIMFjeriXg4mQ7UJDzo0VGdybBOAFyyc=;
 b=KaLkZIh8u6WoPxcX44P9si+WO7qn6xXT4n5Z1stbZQwTnoFRtDTnGREFIFTSEH6ODtIU
 taQ8obccWhizByTyLiRTnnQe0x6GDyhUL4zkEzDEuNktHQZfPEZPDGIqowmdBGpo+NRR
 cXV7ZWwhPVMv6914C9UvtPjrAo6FDe9ywfQyWTt7IetXGHo3Xt9a1f6o60wUI8DZU8mo
 b6t7cQnnubQYHcAFe5I9P2Jsi9zhuQ6xDeQuwoaGEmby0y0f6NvyftTNIzKL4ycQ5fuT
 AeHbI49+TVL2Lss1izX5wJ2tzYNcQXLT7CC9+zq169ecM4iwqaRtzLN2Sw22gJd9MIWH ZQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wv66r4kd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 16:48:20 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151Kgfj1017674;
 Tue, 1 Jun 2021 20:48:19 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02wdc.us.ibm.com with ESMTP id 38ud89jdxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 20:48:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 151KmI7n31851006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 20:48:18 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 630FDBE04F;
 Tue,  1 Jun 2021 20:48:18 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 299CABE051;
 Tue,  1 Jun 2021 20:48:18 +0000 (GMT)
Received: from [9.211.138.111] (unknown [9.211.138.111])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 20:48:17 +0000 (GMT)
Subject: Re: Request for debug-trigger repository
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Jeffery <andrew@aj.id.au>
References: <fb9071bf-f2ad-417b-b9a6-d0baeed67e06@www.fastmail.com>
 <20210601202613.7o3kplhw2z7mrdvw@thinkpad.fuzziesquirrel.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <0f0408a1-45f4-9c10-59ad-ca9428260c79@linux.vnet.ibm.com>
Date: Tue, 1 Jun 2021 13:48:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210601202613.7o3kplhw2z7mrdvw@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y2TOv331F4timA432X_t9Nc2qnmAqQYw
X-Proofpoint-GUID: Y2TOv331F4timA432X_t9Nc2qnmAqQYw
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_10:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106010137
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/1/2021 13:26, Brad Bishop wrote:
> On Tue, May 25, 2021 at 09:03:31AM +0930, Andrew Jeffery wrote:
>> Hi Brad,
>>
>> A recently merged design document[1] outlines the need for a daemon to
>> translate in-band indications from the host that the BMC is
>> unresponsive into recovery actions on the BMC.
>>
>> [1] 
>> https://github.com/openbmc/docs/blob/da726aad0d204a8c8a04d6230ea61aa15e357653/designs/bmc-service-failure-debug-and-recovery.md 
>>
>>
>> A tentative implementation of the daemon lives at:
>>
>> https://github.com/amboar/debug-trigger/
>>
>> With the design document accepted, this could live under the openbmc
>> org. Can you make a repo for it?
> 
> done!
> 
> -brad
Hi Brad,

I think Andrew has is default branch as main, and it looks like you 
created a branch called master.  Do you want that changed to match what 
Andrew has done prior to him making any commits on it?

Thanks!

-- 
Bruce

