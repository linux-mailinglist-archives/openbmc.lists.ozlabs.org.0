Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C553EC952E
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 01:48:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kCWr3vXKzDqXY
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 09:48:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kCRB2T9hzDqWH
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 09:44:37 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x92Nfv90004297; Wed, 2 Oct 2019 19:44:30 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vd1sg5u93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 19:44:30 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x92Ne5en018398;
 Wed, 2 Oct 2019 23:44:31 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 2v9y57qu2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 23:44:31 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x92NiS6P57541090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 23:44:28 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D8C0BE051;
 Wed,  2 Oct 2019 23:44:28 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C723BE053;
 Wed,  2 Oct 2019 23:44:28 +0000 (GMT)
Received: from [9.211.121.154] (unknown [9.211.121.154])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 23:44:27 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.3 3/4] ARM: dts: tacoma: Remove incorrect i2c
 buses
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20191002102328.5196-1-joel@jms.id.au>
 <20191002102328.5196-4-joel@jms.id.au>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <3cc56c4c-2fdc-48d9-7572-adc9e1882492@linux.ibm.com>
Date: Wed, 2 Oct 2019 18:44:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002102328.5196-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020193
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/2/19 5:23 AM, Joel Stanley wrote:
> When adding the Tacoma system a number of I2C buses were enabled that
> according to the schematics are either tied to ground (i2c8, i2c6) or
> used as GPIOs (i2c14, i2c15).


Whoops, thanks!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Fixes: 4fde000c9b28 ("ARM: dts: aspeed: tacoma: Enable I2C busses")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 16 ----------------
>   1 file changed, 16 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 183a8349e181..02eeea6a9bd2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -298,18 +298,10 @@
>   	};
>   };
>   
> -&i2c6 {
> -	status = "okay";
> -};
> -
>   &i2c7 {
>   	status = "okay";
>   };
>   
> -&i2c8 {
> -	status = "okay";
> -};
> -
>   &i2c9 {
>   	status = "okay";
>   
> @@ -448,14 +440,6 @@
>   	status = "okay";
>   };
>   
> -&i2c14 {
> -	status = "okay";
> -};
> -
> -&i2c15 {
> -	status = "okay";
> -};
> -
>   &ibt {
>   	status = "okay";
>   };
