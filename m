Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF2A3554DF
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 15:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF7TX4hFDz30B4
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 23:21:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qC+sQs3L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qC+sQs3L; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF7TJ1DsMz2yYx
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 23:21:23 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 136D53I7104256; Tue, 6 Apr 2021 09:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=k2jns/F88LeSyodYkbox75sZ+cQPdV8uQxHh4yoWJlU=;
 b=qC+sQs3Le0Qqp3cl1KHayMsW2mAo+wgQD3YyXifF6+/S64XFj+lZ5MgVXBjKDYZiV/r8
 HP6P/c6XCFZ8xRciOua63kK4lGoarLkhrk47qXVa/yELjzsRGwrZF70NEKQrJa4mzfXn
 xjqkD2luBhUsmXGP98Q5licQkdoc8arZpAp3xXh4saOli5A6Osr4v7glEp50mA+vJL8n
 7p76nZ4CGbVEmAH4S3a3ldxag+jZIF9gD3JIFkvNII0iDsnL99nkY2+Vb0YBzQavxExv
 8n65r6ZE5pIm8JHOefT6mgUgpqgCXa7BsT6qArxO8Gs/mCthUHVTTDKAi9LsuHY5Dbrx 7g== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37q605b2xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 09:21:11 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 136DHeuv016945;
 Tue, 6 Apr 2021 13:21:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 37q3293u3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 13:21:11 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 136DLAh431588862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 13:21:10 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74457AC05F;
 Tue,  6 Apr 2021 13:21:10 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ADF9AC05E;
 Tue,  6 Apr 2021 13:21:09 +0000 (GMT)
Received: from [9.80.197.108] (unknown [9.80.197.108])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  6 Apr 2021 13:21:09 +0000 (GMT)
Subject: Re: [OE-core] [PATCH v2 0/4] u-boot: Support for SPL verified boot
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
 <f303476a66be3cc3beea01d3a71e2db1ef1d44c4.camel@linuxfoundation.org>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <c6e39587-2a84-fe75-5311-81be9f5fae84@linux.vnet.ibm.com>
Date: Tue, 6 Apr 2021 10:21:07 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <f303476a66be3cc3beea01d3a71e2db1ef1d44c4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -mbGHgxatpX_t03fD6ESbt51c0knIeJl
X-Proofpoint-GUID: -mbGHgxatpX_t03fD6ESbt51c0knIeJl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_03:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060090
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 4/6/2021 7:57 AM, Richard Purdie wrote:
> On Fri, 2021-03-26 at 17:14 -0300, Klaus Heinrich Kiwi wrote:
>> This patch series aims at extending U-Boot's verified boot support to
>> also include SPL.

>> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> 
> I've merged this, I wanted to say a big thanks for writing some test cases
> for these code paths. It should start to help a lot in this area in the
> future. I'm going to be asking that future fixes in this area add/improve
> test cases to cover issues too.
> 


Thanks Richard.

FYI, there's a patch I sent recently with relatively important fixes (for some
corner cases) that should apply on top of the patches above:

Subject: [PATCH] uboot: Fixes SPL verified boot on corner cases
Date: Mar 31, 2021

I'd recommend applying that patch as well, before yocto / other projects start
pulling from oe-core.

Thanks,

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
