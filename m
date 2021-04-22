Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58236882F
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 22:47:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR8c73QJYz3018
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 06:47:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j3OY91pR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j3OY91pR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR8bs3MrHz2xZg
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 06:46:48 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13MKaMEj115941; Thu, 22 Apr 2021 16:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=I7VBDq5gsly3z5fB1WwpJgfVRGJBTtGV+v+bhM2QqVE=;
 b=j3OY91pRyN6xRPJ7hOZCKaWyOQ7tx4cffJnE6OkDjdzSikirZhifp3Jmj2VshF1veSFV
 oRPiZCXy5iywUqgI/xeHstWkNPabkvt9QX/IcCX65EUWzhvYXVqN3IJyy2o8tCrZp9Dt
 D3yBVTZOogotkdEHpLMixumTJeCKO9t3OXHmZWXxV0SLnSYvKc23VJfvb6d2Zy7+KWin
 iUnaBVabLuwUErcSJtqCR1V9fKSSwLRQeO9QTJQ1l4SP1EP9ZQgV2h0LQOetZKVg/rLR
 Tk2S2ey8KGdRCbPQaVMZe0kPR3STBRDgVydWPzyhwiwop9oFgenUFrtNxL8S/4eIwWiN UQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3838bwq13t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 16:46:34 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13MKgrB9019269;
 Thu, 22 Apr 2021 20:46:33 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 37yqaafc2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 20:46:33 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13MKkW1M30343610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 20:46:32 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D09B6112061;
 Thu, 22 Apr 2021 20:46:32 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1010B112062;
 Thu, 22 Apr 2021 20:46:32 +0000 (GMT)
Received: from [9.65.87.109] (unknown [9.65.87.109])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 20:46:31 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 00/10] Use HACE to
 accelerate sha512
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210420064648.994075-1-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <551fbd94-c454-0284-0d8f-3297082c35a4@linux.vnet.ibm.com>
Date: Thu, 22 Apr 2021 17:46:30 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420064648.994075-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PliOdrcIsptNVpEwCPSFGPVaOcLZ5DJI
X-Proofpoint-GUID: PliOdrcIsptNVpEwCPSFGPVaOcLZ5DJI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_14:2021-04-22,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104220153
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 4/20/2021 3:46 AM, Joel Stanley wrote:
> Joel Stanley (10):
>    configs/ast2600: Make early malloc pool larger
>    crypto: Add driver for Aspeed HACE
>    ast2600: Enable HACE probing in SPL
>    ast2600: Add HACE to device tree
>    ast2600: spl: Remove SECBOOT BL2 kconfig option
>    ast2600: spl: Add ASPEED_LOADERS option
>    ast2600: spl: Support common boot loader features
>    config: ast2600: Configure common MMC SPL loader
>    configs: ast2600: Enable FIT SHA512 support
>    config: ast2600: Disable SPL raw image support

Looks like you forgot to include 'clk: aspeed: Add HACE yclk to ast2600'

It fails pretty instantly even in Qemu without it.


Additionally, looks like the spl binary size grew significantly to 59696
bytes (around 10KB larger than before). The final SPL size when added to
the Device-tree blob with the 4096bits public key is 65058 bytes, which
is just a tad over the maximum limit we have of 65024 bytes.

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
