Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4F77BF148
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 05:20:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PA4u26tZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Lky48FBz30PJ
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:20:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PA4u26tZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2HCW15bXz30f8
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 05:34:46 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396HuXOD024161;
	Fri, 6 Oct 2023 18:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DW6ASFT6tEhDdBHGYEsS/ds2/R0Tuv1Fgj2RheMSbVQ=;
 b=PA4u26tZ1YvAc/PnHupklOnfEKiOSOH7qHmD87QESWCz2kt5lrg2b0MWxeMWxKvXuD4o
 MGIDk/aV16vyCPd8Yk8BQVqgPsEXZFAKioYMfQd/hP3HA4L/y1BCFasXWg73Y3Gg9UHr
 084V1q2dqLQshqJJ02m+9gjwAWmvSP/PvdFDzgU8RzFZ5r7VQu24ttVofCjrsVwbYuL7
 /gQf8QC1mc66qvG/tr2gIB5ovIhc3ymDx632RqLLfh4fVqZPWIczK2atZsZqlYcMmbSs
 OlDtOUpM4lzZtxnNcmBzZGQdGzLs6cQfLAkEzTcBedZw9tDOoujTW6sYAZoDPykWtvBs Mg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjq328x0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 18:34:40 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396IRIhr017592;
	Fri, 6 Oct 2023 18:34:26 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tey0pv3s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 18:34:26 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396IYKhq3342868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 18:34:20 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 190895806A;
	Fri,  6 Oct 2023 18:34:20 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD50B5805F;
	Fri,  6 Oct 2023 18:34:19 +0000 (GMT)
Received: from [9.61.27.175] (unknown [9.61.27.175])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 18:34:19 +0000 (GMT)
Message-ID: <21233b2b-a7c9-4556-a681-a97643179d33@linux.ibm.com>
Date: Fri, 6 Oct 2023 13:34:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.5 3/4] ARM: dts: aspeed: Bonnell: Add fan
 controller properties
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20231006172735.420566-1-eajames@linux.ibm.com>
 <20231006172735.420566-4-eajames@linux.ibm.com>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20231006172735.420566-4-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jaz2bVArofWr7IwGIXypvwknEfKCSIJG
X-Proofpoint-ORIG-GUID: Jaz2bVArofWr7IwGIXypvwknEfKCSIJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060140
X-Mailman-Approved-At: Tue, 10 Oct 2023 14:15:18 +1100
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
Cc: Eddie James <eajames@us.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/6/23 12:27, Eddie James wrote:
> From: Eddie James <eajames@us.ibm.com>
>
> Bonnell uses the same dual rotor fans as Rainier 2U.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
> index cad1b9aac97b..29d68d7e876f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
> @@ -280,12 +280,26 @@ fan0: fan@0 {
>   			compatible = "pmbus-fan";
>   			reg = <0>;
>   			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
>   		};
>
>   		fan1: fan@1 {
>   			compatible = "pmbus-fan";
>   			reg = <1>;
>   			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
>   		};
>   	};
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
