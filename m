Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0730641D
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 20:33:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQv0X4w0PzDqWv
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 06:33:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fGo/Ciyn; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQtw24sjYzDqWv
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 06:29:37 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RJApfd096995; Wed, 27 Jan 2021 14:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=27PslggmrkwtP0VRlmgnuFQiqNZS4hnTEi1zo+AA1A8=;
 b=fGo/CiynOCySstJdJdOP0jQ+xXJusJ86BV4u0O/S76Qyp64aXWegVzS5K3rwN9Rri9L6
 W1DMHYobqgvnk7w0/LkOTe90teVezYQ5ecOMYPrv/ybrpgwNDG1e3jOaDHJMgg0eqkQn
 OKOvlPmRAbNNOtkns9xEqWyzB86MMoHoSaxEaf014gpvX5f9eNI5rFfVAM/6896ulsSq
 mA6yv0fpxOtpy1UsHSbM7MjslAu4basgTvyiSUOMHQgurFI5rLVY0kZGXHVLnotz5YhZ
 loGaHGNNI8ig9bDsYY5vjFX+WvrL8C/wLHPqJwGESp7Aj5RssBOiu/4PvHX0JwQZgbte GQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b5t4ebb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 14:29:26 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RJQumV002685;
 Wed, 27 Jan 2021 19:29:23 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 36adttxq88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 19:29:23 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10RJTMdU35652082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 19:29:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 745F8AC059;
 Wed, 27 Jan 2021 19:29:22 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3C02AC060;
 Wed, 27 Jan 2021 19:29:21 +0000 (GMT)
Received: from [9.80.207.30] (unknown [9.80.207.30])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 19:29:21 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 4/6] config: ast2600:
 Disable unused features
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
References: <20210127070054.81719-1-joel@jms.id.au>
 <20210127070054.81719-5-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <ef379e54-f039-07f6-fef9-d0ee83009cd3@linux.vnet.ibm.com>
Date: Wed, 27 Jan 2021 16:29:20 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127070054.81719-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_06:2021-01-27,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Hi Joel,

> +# CONFIG_SPL_DOS_PARTITION is not set
Sounds good.


> +# CONFIG_MMC_VERBOSE is not set
>   CONFIG_SPL_MMC_TINY=y
>   CONFIG_MMC_SDHCI=y
>   CONFIG_MMC_SDHCI_ASPEED=y
> @@ -128,6 +130,7 @@ CONFIG_DM_SPI=y
>   CONFIG_SYSRESET=y
>   CONFIG_WDT=y
>   CONFIG_USE_TINY_PRINTF=y
> +# CONFIG_REGEX is not set
Are those influencing the SPL size or just U-boot proper?

At any rate, I don't have objections.

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
