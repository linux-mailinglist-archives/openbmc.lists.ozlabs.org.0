Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C478219B679
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 21:40:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sxPX2BVWzDqv3
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 06:40:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sxNT3tjTzDqXV
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 06:39:37 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031JY52T167877
 for <openbmc@lists.ozlabs.org>; Wed, 1 Apr 2020 15:39:34 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304mcbpq7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 15:39:34 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031Ja7UF016219
 for <openbmc@lists.ozlabs.org>; Wed, 1 Apr 2020 19:39:34 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 301x77c6u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 19:39:33 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031JdWCu56230352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 1 Apr 2020 19:39:32 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E9906A063
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 19:39:32 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D28D6A05F
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 19:39:32 +0000 (GMT)
Received: from [9.163.16.235] (unknown [9.163.16.235])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 19:39:32 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4] ARM: dts: Aspeed: Tacoma: Remove bmp280 and
 add iio-hwmon for DPS310
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
References: <20200401190606.20580-1-eajames@linux.ibm.com>
Message-ID: <b3f29c9b-e3f6-ff7a-4168-6e36755e5526@linux.ibm.com>
Date: Wed, 1 Apr 2020 14:39:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200401190606.20580-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=1 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004010156
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


On 4/1/20 2:06 PM, Eddie James wrote:
> The BMP280 was replaced by the DPS310 on Witherspoon, which needs an
> iio-hwmon node to connect to the hwmon subsystem.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 044011bb8a04..846a8a2e1a78 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -88,6 +88,11 @@
>   			linux,code = <7>;
>   		};
>   	};
> +
> +	iio-hwmon-dps310 {
> +		compatible = "iio-hwmon";
> +		io-channels = <&dps 0>;
> +	};
>   };
>   
>   &gpio0 {
> @@ -442,12 +447,6 @@
>   &i2c3 {
>   	status = "okay";
>   
> -	bmp: bmp280@77 {
> -		compatible = "bosch,bmp280";
> -		reg = <0x77>;
> -		#io-channel-cells = <1>;
> -	};


Nope, oops, the device is physically there so we should keep it in the dts.


> -
>   	max31785@52 {
>   		compatible = "maxim,max31785a";
>   		reg = <0x52>;
