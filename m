Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58515597ACA
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 02:59:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7RP50rKBz3c1M
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 10:59:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTUzx8mq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=wrightj@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTUzx8mq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7KvT1Fnmz2xJS
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 06:52:04 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HKkNS8029403;
	Wed, 17 Aug 2022 20:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XwURsYjIMnoKMC9e/CnyWjZVsqRX8ga05T/l7sIrAww=;
 b=DTUzx8mqHUOUxqrvd6ZZsJRw3vWf5DClwj8XTnsfDVTV4zULYu2Lnc96+l9C4LdlLwCK
 eA0C4gVA7A/ELC7vm3tD0J5sKgvQh2cpUBnGCpYJnrnXueRVVnfzKfZ0Pn9DVXGCCHpE
 WD5dLdZq3vPnSdVHIRsO32C8VJ2NgSJDK17vdvaYr4tL6bUfrGz/dItzWcrDlIWllw2N
 dJVa8ZAuNPpLAEovogxwlsJw8I/JKjMKY+W0FAMzQ6d1yaGQfafhG9wMF3Xm23XF8nFI
 Wx9V1AuXcwxfSfgh6CEMgwEYYpUJp/283niwpw4563C8txovaTMwyl905r+zQ9J9FKQo +g== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j177x0tjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 20:52:00 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HKntkc012921;
	Wed, 17 Aug 2022 20:52:00 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma02wdc.us.ibm.com with ESMTP id 3hx3ka2u3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 20:52:00 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27HKpxh532506214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Aug 2022 20:51:59 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F542BE051;
	Wed, 17 Aug 2022 20:51:59 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFB03BE04F;
	Wed, 17 Aug 2022 20:51:58 +0000 (GMT)
Received: from [9.163.23.149] (unknown [9.163.23.149])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 17 Aug 2022 20:51:58 +0000 (GMT)
Message-ID: <4f7a5027-b928-2803-3a51-21c09faf8d76@linux.ibm.com>
Date: Wed, 17 Aug 2022 15:51:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH linux dev-5.15] ARM: dts: aspeed: Add IBM Bonnell system
 BMC devicetree
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20220816162727.462702-1-eajames@linux.ibm.com>
From: Jim Wright <wrightj@linux.ibm.com>
In-Reply-To: <20220816162727.462702-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NR0TpjIPIsOh4njqLcK0w2nS13Ngez2B
X-Proofpoint-ORIG-GUID: NR0TpjIPIsOh4njqLcK0w2nS13Ngez2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_15,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=891 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170076
X-Mailman-Approved-At: Thu, 18 Aug 2022 10:58:39 +1000
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

On 8/16/2022 11:27 AM, Eddie James wrote:
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
Please add:

	ucd90160@64 {
		compatible = "ti,ucd90160";
		reg = <0x64>;
	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	power-supply@58 {
> +		compatible = "ibm,cffps";
> +		reg = <0x58>;
> +	};
> +
> +	power-supply@59 {
> +		compatible = "ibm,cffps";
> +		reg = <0x59>;
> +	};
> +};
