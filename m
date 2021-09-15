Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C239D40CF0C
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 23:51:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8v7X4wBPz2yPv
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 07:51:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K4F54XHG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=K4F54XHG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8v3l21nQz2yQ9
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 07:48:35 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18FIgNeO011769;
 Wed, 15 Sep 2021 17:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=D10X8xTK4l7pTHhskIRHyNIezmaoGM1z5RmgbEKmc4s=;
 b=K4F54XHG02dAREebe4BF5HdSUyUbBoVUPHc2fq/ku+dnAuRNjoUNIbsTm9xkm6HrBEDx
 afQAIcifILvB1i9orNilngCan7XL4A/6WOhy+MNNHIzCy3IVfgZvNllKxDuZOoxxt/vf
 jcynADG97bq37CL5jG+37WosM2cBptZLtXeOPnBRVqRLfzQWgS7HFYJAn7KK//okuvew
 G8BQVXP1/GS6OpLvNnxYZ1JO0PKCa1KecBP9pFiI4rBSTsmCOWCr/iqFdoan8h6nSLvT
 YS93krlJFYdvq0SaUogx2X11s+lI67uNcgLijhEwmZJAuWqzbjl1LvnWA7yIXGAVQruE mw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b3gypmp39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 17:48:29 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18FLb7pb021442;
 Wed, 15 Sep 2021 21:48:28 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 3b0m3c3x2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 21:48:28 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18FLmSEx37945780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 21:48:28 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FA89124052;
 Wed, 15 Sep 2021 21:48:28 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEA02124055;
 Wed, 15 Sep 2021 21:48:27 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.152.249])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 15 Sep 2021 21:48:27 +0000 (GMT)
Message-ID: <2ae3fe66da1e688e1779ab5f5c6788cdef75606f.camel@linux.ibm.com>
Subject: Re: [RESEND linux dev-5.10 0/2] ARM: dts: p10 i2c and leds
From: Eddie James <eajames@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, Andrew Jeffery
 <andrew@aj.id.au>
Date: Wed, 15 Sep 2021 16:48:27 -0500
In-Reply-To: <20210903072724.316336-1-joel@jms.id.au>
References: <20210903072724.316336-1-joel@jms.id.au>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0Vtjx6C1dPdi__panSgJhPbJBzNW0M-K
X-Proofpoint-ORIG-GUID: 0Vtjx6C1dPdi__panSgJhPbJBzNW0M-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-11_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxlogscore=887 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150102
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

On Fri, 2021-09-03 at 16:57 +0930, Joel Stanley wrote:
> This is a resend of Eddie's patches, with the diff reformatted so it
> can
> be reviewed.

Thanks Joel. I just sent a v2 actually since I was missing a gpio
expander, and had a couple more fixes to go in.

Thanks,
Eddie

> 
> Eddie James (2):
>   ARM: dts: aspeed: rainier: Add system LEDs
>   ARM: dts: aspeed: everest: Add I2C bus 15 muxes
> 
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts |  158 +++
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1133
> +++++++++++++++++-
>  2 files changed, 1279 insertions(+), 12 deletions(-)
> 

