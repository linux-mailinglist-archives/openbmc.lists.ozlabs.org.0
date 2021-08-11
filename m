Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C733E964D
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 18:45:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFzp4RKGz3f6Z
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 02:45:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eefDHmWI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eefDHmWI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlFPK4xkVz3fjw
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 02:18:45 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BG2kGh124578
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 12:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=y9tTVvl174ibLPLIouM7Foawliu72G11/H+sG6Lq19M=;
 b=eefDHmWIa1QwRLH0N3jj60cIz/BipTxgct0wQWRiE2LVSlvsDToyd+FlYu/P/bcLhMaT
 aO/iTjPLq6pIrrIu4RrrBneRKut/ZbnLaSCweh0GM3Hy/ZbdFWGHTA9YP+Wz+uTvzQgb
 8xaUyHvOS2ycS4m7MxvmXCLBvc4qFBdPqsmD+2tAfDavdldd/PEgISAXIo9PmdidUIiV
 xohY9p17yYLdqLPo8/P4RQtQbP7ybJH7P5qGM1KaWylAabutP64xGPLyrv/PjUCkNKk9
 FVRBztNd/HeXP3t9LWJZYFymi/bDZimgwP4phlflZEFy10A1WrDOQ7jd45EnZGnN2iTT rw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab8kmf67q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 12:18:43 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BGDcZF023993
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 16:18:42 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3a9htdfwmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 16:18:42 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BGHfJh10945320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 16:17:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00E59AC065;
 Wed, 11 Aug 2021 16:17:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FE95AC05E;
 Wed, 11 Aug 2021 16:17:40 +0000 (GMT)
Received: from [9.65.107.65] (unknown [9.65.107.65])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 16:17:40 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.10 10/14] ARM: dts: aspeed: Rainier 4U: Delete
 fan dual-tach properties
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20210811154232.12649-1-eajames@linux.ibm.com>
 <20210811154232.12649-11-eajames@linux.ibm.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <c3d47e45-9373-1238-27b8-71c3206f9d3b@linux.ibm.com>
Date: Wed, 11 Aug 2021 11:17:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811154232.12649-11-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yXmMXSklyjXuOwTyqK4XI_DITfZQCuP8
X-Proofpoint-ORIG-GUID: yXmMXSklyjXuOwTyqK4XI_DITfZQCuP8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110108
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

On 8/11/21 10:42 AM, Eddie James wrote:
> The fans in the 4U chassis do not have dual tachometers, so remove those
> properties in the device tree.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Matthew Barth <msbarth@linux.ibm.com>
> ---
>  .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> index 342546a3c0f5..24283cc3d486 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> @@ -19,3 +19,27 @@ power-supply@6b {
>  		reg = <0x6b>;
>  	};
>  };
> +
> +&fan0 {
> +	/delete-property/ maxim,fan-dual-tach;
> +};
> +
> +&fan1 {
> +	/delete-property/ maxim,fan-dual-tach;
> +};
> +
> +&fan2 {
> +	/delete-property/ maxim,fan-dual-tach;
> +};
> +
> +&fan3 {
> +	/delete-property/ maxim,fan-dual-tach;
> +};
> +
> +&fan4 {
> +	/delete-property/ maxim,fan-dual-tach;
> +};
> +
> +&fan5 {
> +	/delete-property/ maxim,fan-dual-tach;
> +};
