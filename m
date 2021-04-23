Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A79E369261
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 14:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRYwp1Pl0z2ysw
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 22:47:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pyElJ9x6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pyElJ9x6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRYwY13ZJz2yRW
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 22:47:40 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NCjcm1153511; Fri, 23 Apr 2021 08:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HpHskDMVb3r6PzmhTJtkej7/eHkOdivMCeUry/LGWrk=;
 b=pyElJ9x6zO/1aF7Ch7vdrDyMCI+cQtmdkex2po9SzgCv5bAoBpwqvVu5CPO0QesOa9F8
 AYq3ttRzA7NUYMn601BIvF9j+C6sEshtSFivkeZAwGsjLODFCPQK78/wBGatLC3uVmDk
 fOMLT3fZ04r7yRY2lmNdJZr7vwR+tDHYnS+4ELOYjt4DSMRp0W/UYc+Ejasb4RCBilSG
 85EdtLDz6/LiGxbHvXbctQDpwd7kx5GSauPHZUC4bm1ZcPf1N76O+voD5XRfoYOgKvID
 /HP0E9dh6wPUOewuLvGgQAGV7rmyESWxpxZmvnqAqKOmIwlaHjr4viZ69r3MP4pH4d9H XQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3838bx97t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 08:47:28 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13NCSqhB005577;
 Fri, 23 Apr 2021 12:47:27 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 38311tvf0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 12:47:27 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13NClQ1429032856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 12:47:26 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0D9278069;
 Fri, 23 Apr 2021 12:47:25 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4E3F7805C;
 Fri, 23 Apr 2021 12:47:24 +0000 (GMT)
Received: from [9.160.137.43] (unknown [9.160.137.43])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 23 Apr 2021 12:47:24 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 00/10] Use HACE to
 accelerate sha512
To: Joel Stanley <joel@jms.id.au>
References: <20210420064648.994075-1-joel@jms.id.au>
 <551fbd94-c454-0284-0d8f-3297082c35a4@linux.vnet.ibm.com>
 <CACPK8XeqHysaOVxPLDUSB89MpSGg25x_S3LhAy3h71GVj0kT6g@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <193fec89-1935-e1f5-dd1b-2a5ad5f6db9c@linux.vnet.ibm.com>
Date: Fri, 23 Apr 2021 09:47:24 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeqHysaOVxPLDUSB89MpSGg25x_S3LhAy3h71GVj0kT6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jM38p5jQyBBcGq1AuufFXnTlFGU2Sj_t
X-Proofpoint-GUID: jM38p5jQyBBcGq1AuufFXnTlFGU2Sj_t
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_04:2021-04-23,
 2021-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104230081
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>




>>
>> Looks like you forgot to include 'clk: aspeed: Add HACE yclk to ast2600'
> 
> That patch was already applied to the u-boot tree.
> 
> I've since applied this series to the top of v2019.04-aspeed-openbmc.

Yeah I missed that you merged some of the patches

  
>> It fails pretty instantly even in Qemu without it.
>>
>>
>> Additionally, looks like the spl binary size grew significantly to 59696
>> bytes (around 10KB larger than before). The final SPL size when added to
>> the Device-tree blob with the 4096bits public key is 65058 bytes, which
>> is just a tad over the maximum limit we have of 65024 bytes.
> 
> That's a surprise. Were you able to work out where the size increase came from?
> 
> Here's the size I see with HEAD:
> 
> 44a8c618c1215e0faac0f335f0afd56ed4240e76 49986
> 
> I'm using arm-linux-gnueabi-gcc (Debian 10.2.1-6) 10.2.1 20210110.


Looks like I was also missing some of the patches #ifdef'ing out the
sha512/sha256 implementations when hw sha was available.

I was able to test the tree '44a8c618c1 configs: ast2600: Use non-a1 config for openbmc spl emmc'
both on Qemu and hardware and it works fine, thanks!


-Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
