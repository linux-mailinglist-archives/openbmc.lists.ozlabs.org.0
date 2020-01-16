Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8200B13FC42
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 23:41:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zK1c3fmGzDr99
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 09:41:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zK0C2wdTzDr42
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 09:40:26 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00GMXBWW069728; Thu, 16 Jan 2020 17:40:22 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qsg3x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 17:40:22 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00GMXM9T070157;
 Thu, 16 Jan 2020 17:40:22 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qsg3jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 17:40:21 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00GMbB58023471;
 Thu, 16 Jan 2020 22:39:19 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 2xhjdvcawh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 22:39:19 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00GMdIn549742308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 22:39:18 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C64E28068;
 Thu, 16 Jan 2020 22:39:18 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD41C28066;
 Thu, 16 Jan 2020 22:39:17 +0000 (GMT)
Received: from [9.163.94.187] (unknown [9.163.94.187])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jan 2020 22:39:17 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4] ARM: dts: rainier: Remove regulators
To: Matthew Barth <msbarth@linux.ibm.com>, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Shawn McCarney <shawnmm@us.ibm.com>,
 Brandon Wyman <bjwyman@gmail.com>
References: <20200116154638.1865820-1-msbarth@linux.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <b777ba08-26f4-ba55-ab99-c3b33d01857c@linux.ibm.com>
Date: Thu, 16 Jan 2020 16:39:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200116154638.1865820-1-msbarth@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_05:2020-01-16,
 2020-01-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001160180
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


On 1/16/20 9:46 AM, Matthew Barth wrote:
> Regulators will be dynamically configured and monitored from userspace.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 60 --------------------
>   1 file changed, 60 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 4d8b3cc5f291..c63cefce636d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -468,21 +468,6 @@
>   &i2c9 {
>   	status = "okay";
>
> -	ir35221@42 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x42>;
> -	};
> -
> -	ir35221@43 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x43>;
> -	};
> -
> -	ir35221@44 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x44>;
> -	};
> -
>   	tmp423a@4c {
>   		compatible = "ti,tmp423";
>   		reg = <0x4c>;
> @@ -493,21 +478,6 @@
>   		reg = <0x4d>;
>   	};
>
> -	ir35221@72 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x72>;
> -	};
> -
> -	ir35221@73 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x73>;
> -	};
> -
> -	ir35221@74 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x74>;
> -	};
> -
>   	eeprom@50 {
>   		compatible = "atmel,24c128";
>   		reg = <0x50>;
> @@ -517,21 +487,6 @@
>   &i2c10 {
>   	status = "okay";
>
> -	ir35221@42 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x42>;
> -	};
> -
> -	ir35221@43 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x43>;
> -	};
> -
> -	ir35221@44 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x44>;
> -	};
> -
>   	tmp423a@4c {
>   		compatible = "ti,tmp423";
>   		reg = <0x4c>;
> @@ -542,21 +497,6 @@
>   		reg = <0x4d>;
>   	};
>
> -	ir35221@72 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x72>;
> -	};
> -
> -	ir35221@73 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x73>;
> -	};
> -
> -	ir35221@74 {
> -		compatible = "infineon,ir35221";
> -		reg = <0x74>;
> -	};
> -
>   	eeprom@50 {
>   		compatible = "atmel,24c128";
>   		reg = <0x50>;
