Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA63063F2
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 20:20:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQthv6qcjzDqCq
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 06:19:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qZXO+12/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQtgv0n5NzDqB0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 06:19:06 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RJ46PR038154; Wed, 27 Jan 2021 14:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ldVyiZ+O4MlCqGMbuJyWd9w77MB87cmn3l6OJvl+v+o=;
 b=qZXO+12/NtpVgJ5dAaqhDrbptffG+xJ6bZ3lVbH6mL+J4Kr59sbXlAATSucafigiZPHZ
 xEYs3LpNp9yk2pd6XS7kXYmjQxrrCN1S99yrdwEvWb+/C/vt5bMuzgBOZD1N1hxmMuFF
 jk6dAC5FRq8U0x7fi9xGgSUMt5wSm5Zq0wvdfib9BVCy5hh5oQsy/lBwyM2r4LsHYOHu
 a2u+daCAzPQ/l30OpGIQ/cf44WhpqIGJSkpb/L5aRWPLxjJJNVRFpAt7Gy0LWQRG8a2Z
 qj5Jiy1SqnseXXtPvDnDR2tEBCLYdAmV2rYtMjO+6CpFEfSkEszyT/5yb7pD7ru3jRV5 5g== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36b5awf60n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 14:18:55 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RJGr2M021686;
 Wed, 27 Jan 2021 19:18:55 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 36adttxn4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 19:18:55 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10RJIsMS7996112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 19:18:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E767AC05E;
 Wed, 27 Jan 2021 19:18:54 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AAE4AC059;
 Wed, 27 Jan 2021 19:18:53 +0000 (GMT)
Received: from [9.80.207.30] (unknown [9.80.207.30])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 19:18:53 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 3/6] ast2600: Allow
 selection of SPL boot devices
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
References: <20210127070054.81719-1-joel@jms.id.au>
 <20210127070054.81719-4-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <aa11b003-dda0-4f1c-47f5-fe49c319d95f@linux.vnet.ibm.com>
Date: Wed, 27 Jan 2021 16:18:52 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127070054.81719-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_06:2021-01-27,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270092
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/27/2021 4:00 AM, Joel Stanley wrote:
> The AST2600 SPL can boot from a number of sources, with or without the
> AST2600 secure boot feature. It may be desirable to disable some of
> these, so put them behind the defines for the drivers that are used.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>


-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
