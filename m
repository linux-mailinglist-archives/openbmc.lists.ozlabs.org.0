Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE0E7BF151
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 05:21:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NbEt0glj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Llz6T8Fz3cD0
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:21:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NbEt0glj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2HLK0JZXz3cB7
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 05:40:40 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396HuWCD031528;
	Fri, 6 Oct 2023 18:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qc8q2tQkpisCajR/cQ2RPypvPUL51KBZKrc6n342mRo=;
 b=NbEt0glj7BZ9xcTWFTQdKDM78W7kkkTKC70H8BaIMvJSBcZzouIminxo8oozc7s/Pjgz
 knqThTpCcf5dQNivwxcvH4iHilY8sFghQQ1H52KMlrGnnfnMP1pl1EBWWwyNjcH0EzPN
 8zn1suQsqEiZJ5JfZ755RSbFHQjc3nr4VmzjT4XHnazczrdEtN8dKuQCtd7VlCg4dC4/
 mIJ5jjsDgbyA2LHGzUrmCsYQPlw/pJrIC5yT40swbjumWufN5OBQiLhQZLk2WKvy2biB
 zn9gnOYyshytRrZ9M8sIE4MrD0iH7lv/oI22GIIgtfGJ46Ay2sNmAaHuGcr7dRWoSPxx vg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjq31sc6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 18:40:35 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396IEnnc007456;
	Fri, 6 Oct 2023 18:40:34 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3teygn44mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 18:40:21 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396Idb1Z10944824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 18:39:37 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BE8558059;
	Fri,  6 Oct 2023 18:39:37 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E71505805C;
	Fri,  6 Oct 2023 18:39:36 +0000 (GMT)
Received: from [9.61.27.175] (unknown [9.61.27.175])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 18:39:36 +0000 (GMT)
Message-ID: <5f9d1bfb-bc5a-4a70-ab66-a9ea1cc25c3a@linux.ibm.com>
Date: Fri, 6 Oct 2023 13:39:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.5 4/4] ARM: dts: aspeed: Rainier 4U: Delete
 fan dual-tach properties
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20231006172735.420566-1-eajames@linux.ibm.com>
 <20231006172735.420566-5-eajames@linux.ibm.com>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20231006172735.420566-5-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3n9AOMuK445rF7fElJMVewbXVh7kMoeO
X-Proofpoint-GUID: 3n9AOMuK445rF7fElJMVewbXVh7kMoeO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=977
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/6/23 12:27, Eddie James wrote:
> The fans in the 4U chassis do not have dual tachometers, so remove those
> properties in the device tree.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   .../dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts  | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts
> index 342546a3c0f5..24283cc3d486 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts
> @@ -19,3 +19,27 @@ power-supply@6b {
>   		reg = <0x6b>;
>   	};
>   };
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
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
