Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F44A4FF825
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 15:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdkSh3RLDz2ymq
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 23:48:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bejg8nUL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Bejg8nUL; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdkS947cJz2xDN
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 23:47:52 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DD7n0A010448; 
 Wed, 13 Apr 2022 13:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=w9/PIdqEdhDVqt8ngwDrZXOboDeb6UDhJKcbhj0eVrM=;
 b=Bejg8nULVp2aPwvqN+gU5CrmRB/83k/1p7dwGGi3AkqiRrtse5jzno5tIWYIx1u0ioY6
 /S1WAscL1sIjoNdtlrWVzt4hPLPduQlyf1yuZ7Dw6ifVShgT9aaTQIoaNSdgyg2EkWx9
 AWvrhkyEtj3pnHUlqS9q9yInhRqunFiUUW0mGXrcurusefr+bJT5IARFkYsPAVtGqY9w
 hE/o+t+kEIvMmzumZGkGSLZRnI/NMKyLIDeIj8NieuQ2AJWUcPOZLTq6dbf0tVXYmk90
 9OgrZJlPwJV8K6OTiUo6isjdocPDkiojSmZSi8NwmIojQ0aklVcx0bSfzjDADo7nBn5F eg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fdv7fmw0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 13:47:46 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23DDlVA5019924;
 Wed, 13 Apr 2022 13:47:45 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3fb1s9rbax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 13:47:45 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23DDljRJ14287530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 13:47:45 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19D706E05D;
 Wed, 13 Apr 2022 13:47:45 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB87B6E050;
 Wed, 13 Apr 2022 13:47:44 +0000 (GMT)
Received: from [9.211.138.192] (unknown [9.211.138.192])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 13 Apr 2022 13:47:44 +0000 (GMT)
Message-ID: <7baf1749-03aa-699f-f2f9-84256ae14f28@linux.ibm.com>
Date: Wed, 13 Apr 2022 08:47:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH linux dev-5.15] soc: aspeed: xdma: Add trace events
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220412215331.42491-1-eajames@linux.ibm.com>
 <306d799f-e145-41b9-b9ec-4eb2a04b4dd4@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <306d799f-e145-41b9-b9ec-4eb2a04b4dd4@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fz1B4IJE6VA8fCBRQOo4yJbweSUdFP5x
X-Proofpoint-ORIG-GUID: Fz1B4IJE6VA8fCBRQOo4yJbweSUdFP5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_01,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 mlxlogscore=957 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130072
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 4/12/22 22:29, Andrew Jeffery wrote:
>
> On Wed, 13 Apr 2022, at 07:23, Eddie James wrote:
>> Trace the flow of the driver to aid debugging after an error.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> The only query I have is whether you considered prefixing the trace
> symbols with 'aspeed_' to match the function symbols in the driver.
>
> Other than that it looks okay.


I thought about it, but the I wanted to be as concise as possible, and 
there is no other variety of XDMA, so I thought I'd leave it at that. 
I'm fine to add aspeed_ if there is a consensus to do so.


Thanks!

Eddie


>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>
