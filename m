Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C253E9644
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 18:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFz304bVz3g3v
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 02:44:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WLEdh3Mi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WLEdh3Mi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlFLD36hQz3fSY
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 02:16:04 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BGCIL7188947
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 12:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vNhh2GkE1+S2reejEodk106AhWFJD+To6jw511XEZBE=;
 b=WLEdh3Mi1JXq7NC5htAkl0aSarXaYP2g9GKgJwRJ1/eSM2QjiiefjR5f+YVX/4oWudWf
 LLW/xMJzSEnn/prU/is+RssWJQeiu3SqTIEvoNiqV0MP7Ri9SzzRgTXmdoJMXyw8HBA1
 /2Vy6JQLIs3Y4lRZGAQq/t9+1nSyXEXcdsO6DZpWc3IH2d73GNmyltY5/TT07rLKdY7N
 qBGxPE2UmrfyWGK1MdVZHUrPfcIQ1JRiVv7cuNo5KrLmUEOvuHAPTBUT0xAczcNMfSPi
 cbAtt60TdmC+QYZ+pljC8Ap7M8TnNZfVJqzIjq/V1+D1PWz2F1ZSWe/o5cnQptq9Kk5s bg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acby5t3k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 12:16:01 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BGCqBl020599
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 16:16:00 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3a9hteh4wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 16:16:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BGFxnw38338866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 16:15:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78989AC060;
 Wed, 11 Aug 2021 16:15:59 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F376AC066;
 Wed, 11 Aug 2021 16:15:59 +0000 (GMT)
Received: from [9.65.107.65] (unknown [9.65.107.65])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 16:15:59 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.10 09/14] ARM: dts: aspeed: Everest: Add fan
 controller properties
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20210811154232.12649-1-eajames@linux.ibm.com>
 <20210811154232.12649-10-eajames@linux.ibm.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <8152ccd9-ab76-2a3a-9d42-622899de90a4@linux.ibm.com>
Date: Wed, 11 Aug 2021 11:15:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811154232.12649-10-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FzG1OeiYIR-v5VTHttTnEePdFSGISKJv
X-Proofpoint-ORIG-GUID: FzG1OeiYIR-v5VTHttTnEePdFSGISKJv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108110108
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
> Add the necessary Max chip specific fan properties.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Matthew Barth <msbarth@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 28 ++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index 01a0b2b03ddd..83fc29309154 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -2510,24 +2510,52 @@ fan@0 {
>  					compatible = "pmbus-fan";
>  					reg = <0>;
>  					tach-pulses = <2>;
> +					maxim,fan-rotor-input = "tach";
> +					maxim,fan-pwm-freq = <25000>;
> +					maxim,fan-dual-tach;
> +					maxim,fan-no-watchdog;
> +					maxim,fan-no-fault-ramp;
> +					maxim,fan-ramp = <2>;
> +					maxim,fan-fault-pin-mon;
>  				};
>  
>  				fan@1 {
>  					compatible = "pmbus-fan";
>  					reg = <1>;
>  					tach-pulses = <2>;
> +					maxim,fan-rotor-input = "tach";
> +					maxim,fan-pwm-freq = <25000>;
> +					maxim,fan-dual-tach;
> +					maxim,fan-no-watchdog;
> +					maxim,fan-no-fault-ramp;
> +					maxim,fan-ramp = <2>;
> +					maxim,fan-fault-pin-mon;
>  				};
>  
>  				fan@2 {
>  					compatible = "pmbus-fan";
>  					reg = <2>;
>  					tach-pulses = <2>;
> +					maxim,fan-rotor-input = "tach";
> +					maxim,fan-pwm-freq = <25000>;
> +					maxim,fan-dual-tach;
> +					maxim,fan-no-watchdog;
> +					maxim,fan-no-fault-ramp;
> +					maxim,fan-ramp = <2>;
> +					maxim,fan-fault-pin-mon;
>  				};
>  
>  				fan@3 {
>  					compatible = "pmbus-fan";
>  					reg = <3>;
>  					tach-pulses = <2>;
> +					maxim,fan-rotor-input = "tach";
> +					maxim,fan-pwm-freq = <25000>;
> +					maxim,fan-dual-tach;
> +					maxim,fan-no-watchdog;
> +					maxim,fan-no-fault-ramp;
> +					maxim,fan-ramp = <2>;
> +					maxim,fan-fault-pin-mon;
>  				};
>  			};
>  
