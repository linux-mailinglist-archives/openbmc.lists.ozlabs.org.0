Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CE23AF5DB
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 21:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7zcG6Wp3z306h
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 05:09:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bTA667Bh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bTA667Bh; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7zby5Mlkz2yX3;
 Tue, 22 Jun 2021 05:09:33 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LJ3IN7125148; Mon, 21 Jun 2021 15:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=wA9R2ROkbjWq0XIfzLFQB883uTfDMFuk98dLX2GE9O4=;
 b=bTA667BhKGC0W3Y7unCtBXmqO0vmYYleYMCfdR/iDIImHnsqPHCLZjUS1UFx7Jem5LrL
 Qzw0ZCHYyfUbxuE0/n5Mp9UMx+MNPPDNX0ECE3T1A9T703x5Zmu8KPMuDH4fmgs4kvb7
 XDYq403s1ViYPyCkEu/ATCgu5TsGYlfd9tKowu/ivYsVWCLDdo+HuiK2G33SvKpqVLFk
 wtlKnJNnm5llx2I+pxlsXjNSeTjAWbdxYQWWtNUj7IMgLk5zujDmh0YNYD2x60L1imYG
 sTbB+yCScu3496hiA61L7giL+TCH1WV1buQT7JYM5pQ7SnSuKSWXao3Zllkj5I1YMbAD Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39axjv3mkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 15:09:29 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LJ4BNL128336;
 Mon, 21 Jun 2021 15:09:29 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39axjv3mkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 15:09:29 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LJ1rpQ005871;
 Mon, 21 Jun 2021 19:09:29 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 399878hjtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 19:09:29 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LJ9SVg9699966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 19:09:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BA44AC059;
 Mon, 21 Jun 2021 19:09:28 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DE45AC05E;
 Mon, 21 Jun 2021 19:09:28 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.133.13])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 19:09:27 +0000 (GMT)
Message-ID: <d0e66d10765ae85b1bd939ddacc7f7d861190196.camel@linux.ibm.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Everest PSU #3 address change
From: Eddie James <eajames@linux.ibm.com>
To: Brandon Wyman <bjwyman@gmail.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Date: Mon, 21 Jun 2021 14:09:27 -0500
In-Reply-To: <20210610202940.3650554-1-bjwyman@gmail.com>
References: <20210610202940.3650554-1-bjwyman@gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9x51zH9hzzq7XFPFlEs3eWHq6r4g25C0
X-Proofpoint-ORIG-GUID: Gn70PZloxbp2h9BSLr2fpJQ6fuvxR5no
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_10:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210112
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

On Thu, 2021-06-10 at 20:29 +0000, Brandon Wyman wrote:
> From: "B. J. Wyman" <bjwyman@gmail.com>
> 
> The third power supply had an I2C address conflict with another
> device
> in the system. The device will have the address changed from 6Ah to
> 6Dh.

Thanks Brandon.

Reviewed-by: Eddie James <eajames@linux.ibm.com>

> 
> Signed-off-by: B. J. Wyman <bjwyman@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index 3295c8c7c05c..480cb6604c7d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -536,9 +536,9 @@ power-supply@69 {
>  		reg = <0x69>;
>  	};
>  
> -	power-supply@6a {
> +	power-supply@6d {
>  		compatible = "ibm,cffps";
> -		reg = <0x6a>;
> +		reg = <0x6d>;
>  	};
>  
>  	power-supply@6b {

