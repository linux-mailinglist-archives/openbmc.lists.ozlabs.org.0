Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9B2C30C4
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 20:33:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgZ2P3pNGzDqTD
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 06:33:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GoY/f0gp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgZ1Q2CH7zDqWZ
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 06:32:58 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOJWrcY113615; Tue, 24 Nov 2020 14:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=iOhdMywmg7SrFD1hiKivTp5msyg84EnwPxcrvKhQaH4=;
 b=GoY/f0gpjI9P01PB7hW9+UKSFCAXxEhQ6bLURNr3J/OzVE62Ln/hrbAxZIpe6YNMccTB
 kkZkLAYDw4TuYjhs4M/6wDRpR19/kTH3CBVv/D5oOO9J0aQISdctVDxHNYutYUkf2zD5
 4IQ1VQJ836GG6O95gtc0knn1xNCGMpV3Hd3N3pWsGGRS7NKmeoB7ehlnHfK/CnDdN6l6
 UTOxOjqrTwiSiOIQruY7oB0VTdiAw/sFrk/u0oUssHJ8MDK0kWl85PyKbp/8Phoeclzr
 bqDrWuyj3AEd/zO0Jx2vWG0QbxduWZcPg+9+pH4FQdfJphv/RWyd0o7SKDUolGpRCUJa HQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350n10v0hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 14:32:54 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AOJW4k5025527;
 Tue, 24 Nov 2020 19:32:42 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 34xth91vcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 19:32:42 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AOJWXTD40829318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 19:32:33 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F1FB13604F;
 Tue, 24 Nov 2020 19:32:40 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F28B3136051;
 Tue, 24 Nov 2020 19:32:39 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.93.247])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 19:32:39 +0000 (GMT)
Message-ID: <4d404ce62d93da96183dc13a7dd908767b13c83c.camel@linux.ibm.com>
Subject: Re: [PATCH linux dev-5.8] ARM: dts: aspeed: rainier-4u: Update fan
 config
From: Eddie James <eajames@linux.ibm.com>
To: Matthew Barth <msbarth@linux.ibm.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Date: Tue, 24 Nov 2020 13:32:39 -0600
In-Reply-To: <20201124045512.2008095-1-msbarth@linux.ibm.com>
References: <20201124045512.2008095-1-msbarth@linux.ibm.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_06:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240116
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

On Mon, 2020-11-23 at 22:55 -0600, Matthew Barth wrote:
> Rainier 4U systems has single rotor fans with a tach pulse of 4.
> 

Reviewed-by: Eddie James <eajames@linux.ibm.com>

> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> index 291f7d6c9979..f7fd3b3c90d0 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> @@ -22,16 +22,30 @@ power-supply@6b {
> 
>  &fan0 {
>  	tach-pulses = <4>;
> +	/delete-property/ maxim,fan-dual-tach;
>  };
> 
>  &fan1 {
>  	tach-pulses = <4>;
> +	/delete-property/ maxim,fan-dual-tach;
>  };
> 
>  &fan2 {
>  	tach-pulses = <4>;
> +	/delete-property/ maxim,fan-dual-tach;
>  };
> 
>  &fan3 {
>  	tach-pulses = <4>;
> +	/delete-property/ maxim,fan-dual-tach;
> +};
> +
> +&fan4 {
> +	tach-pulses = <4>;
> +	/delete-property/ maxim,fan-dual-tach;
> +};
> +
> +&fan5 {
> +	tach-pulses = <4>;
> +	/delete-property/ maxim,fan-dual-tach;
>  };

