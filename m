Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA28536143A
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 23:38:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLt4g4FXWz3bvP
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 07:38:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kXaGFRTI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kXaGFRTI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLt4Q4KLzz2yxT
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 07:38:13 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FLYKCS070514; Thu, 15 Apr 2021 17:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/PjbW0uDWsIQkZXf0mFbo4GPPQBQi4XMWBI8o7b02nY=;
 b=kXaGFRTIeHIdL7cUZA6rzKRLuMl1HCQDyec1TLVA+3cxf7Gri2ci4XiuPjmNFhwaGQhd
 rc2ZPgg7FCw7Q1bZyzyf4zM9XBzPBfzw27wqO8nLz23WJRABixk2cd8sRllpXPBMu46D
 Q8Z1xtGY8TikW9ki3tsHOKwYYVTOfJcvu0DD4rKqtT5qKkf1swvia7k4ABQ6o0bdW79Z
 CAedQv1pMipqY/FWVhoVcjc64tmu5HU73CxjItrkFqVAM+ZS8AwRvNMoy7G8HeSX9Hyk
 JoHsCgCg8P9zO3YbRE3a5Fyp/IwROq2Hk0oBMyqDWGnN3jKxQB37Xk2MOpp1q49oIPEi Tg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xvte15j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 17:38:04 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FLWOwa029285;
 Thu, 15 Apr 2021 21:38:03 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 37u3naftbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 21:38:03 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FLc2KM31260992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 21:38:02 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B85BAE05C;
 Thu, 15 Apr 2021 21:38:02 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FB30AE05F;
 Thu, 15 Apr 2021 21:38:01 +0000 (GMT)
Received: from [9.85.162.97] (unknown [9.85.162.97])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 21:38:01 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 10/11] crypto: Add driver
 for Aspeed HACE
To: Joel Stanley <joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-11-joel@jms.id.au>
 <cacf13c1-91b2-ad51-606e-bb208d13ec36@linux.vnet.ibm.com>
 <9779de4a-6985-8b94-9fb6-55c74a7a722f@linux.vnet.ibm.com>
 <CACPK8XcNyXUhe=43NCR1RzrexJGYWw2S-kXWsYDzNYAJujnmpg@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <001cda88-6e0f-cd48-d274-3764d0ceb18d@linux.vnet.ibm.com>
Date: Thu, 15 Apr 2021 18:37:59 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XcNyXUhe=43NCR1RzrexJGYWw2S-kXWsYDzNYAJujnmpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jxGc8s_2a4mC_GROMIZAebNEQVY4czfk
X-Proofpoint-ORIG-GUID: jxGc8s_2a4mC_GROMIZAebNEQVY4czfk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_10:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150133
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



On 4/14/2021 11:32 PM, Joel Stanley wrote:
>> Another interesting thing is that the SPL tries to boot from UART, but neither
>> my fitImages, Legacy images or even RAW images are working.. Not sure if we need
>> some special handling of those images before feeding them to the spl ymodem loader?
> I wasn't able to get the SPL to load any images - raw binaries or FIT
> - from eMMC either. Something is going wrong, but I am unsure what it
> is. I will continue to debug.

I was able to make it work on real hardware (rainier100) with the following changes
(in addition to the other fixups already mentioned in this thread):

 From a2a2819455ec5de689fd0702cce20bfb18ec11b1 Mon Sep 17 00:00:00 2001
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Date: Thu, 15 Apr 2021 15:16:37 -0300
Subject: [PATCH] HACE fixups:

  * The AST2600 workbook mentions that the list structure passed to
    ASPEED_HACE_HASH_SRC needs to be 8-byte aligned. Normally, glibc's
    malloc() would always align memory to (at least) 8-bytes, but that's
    the case with u-boot's pre-sdram malloc() implementation. So we need
    to explicitly align the context to 8-bytes with malign().

  * The __atribute__ ((align 8)) doesn't have an effect in struct
    elements. Remove it.

  * Since the struct aspeed_hash_ctx->list element is what we need to
    make sure is aligned to 9-bytes, move that to the first element of
    the array, and call-out the fact that this needs to be aligned in
    the declaration.

   * Clear HACE_HASH_ISR before issuing new command

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
  drivers/crypto/aspeed_hace.c | 15 +++++++++++++--
  1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/aspeed_hace.c b/drivers/crypto/aspeed_hace.c
index 473d4d7391..0551fe6c83 100644
--- a/drivers/crypto/aspeed_hace.c
+++ b/drivers/crypto/aspeed_hace.c
@@ -51,12 +51,19 @@ struct aspeed_sg {
  	u32 addr;
  };
  
+
+/*
+ * Note: element 'list' below needs to be 8-byte aligned,
+ *       keep it as the first element so that we can always
+ *       guarantee that when allocating the struct (that should
+ *       also be 8-byte aligned)
+ */
  struct aspeed_hash_ctx {
+	struct aspeed_sg list[ASPEED_MAX_SG];
  	u32 method;
  	u32 digest_size;
  	u32 len;
  	u32 count;
-	struct aspeed_sg list[ASPEED_MAX_SG] __attribute__((aligned(8)));
  };
  
  struct aspeed_hace {
@@ -85,6 +92,9 @@ static int digest_object(const void *src, unsigned int length, void *digest,
  		return -EINVAL;
  	}
  
+	/* clear any pending interrupt */
+	writel(HACE_HASH_ISR, base + ASPEED_HACE_STS);
+
  	writel((u32)src, base + ASPEED_HACE_HASH_SRC);
  	writel((u32)digest, base + ASPEED_HACE_HASH_DIGEST_BUFF);
  	writel(length, base + ASPEED_HACE_HASH_DATA_LEN);
@@ -145,12 +155,13 @@ int hw_sha_init(struct hash_algo *algo, void **ctxp)
  		return -ENOTSUPP;
  	}
  
-	ctx = calloc(1, sizeof(*ctx));
+	ctx = memalign(8, sizeof(struct aspeed_hash_ctx));
  
  	if (ctx == NULL) {
  		debug("Cannot allocate memory for context\n");
  		return -ENOMEM;
  	}
+	ctx->len = ctx->count = 0;
  	ctx->method = method | HACE_SG_EN;
  	ctx->digest_size = algo->digest_size;
  	*ctxp = ctx;
-- 
2.25.1





-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
