Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66218426ACC
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 14:28:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQnY02nPfz305W
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 23:28:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nzy4Vjyi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nzy4Vjyi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQnXR5TSZz2xY9;
 Fri,  8 Oct 2021 23:28:06 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198BBlHd011068; 
 Fri, 8 Oct 2021 08:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6QKE88D7YdB5OIMaiFEhbBlDW4KfdVPDi050mXXmbTQ=;
 b=nzy4Vjyi7Z+Ynmju+wWbMAxhMVZ7HE+QY3T+h1kO4CzpEVcOWNCy/IFSwQ+VRf7EIh3/
 0gZA7mUyaaEyTNMd4h6kyBbfUGqGgzBD9RwrppAZO5VGVLARZR0EuU4gFIuVLqhNvZ4+
 OAdUXepYFHlyi40fCZds+lK7v4mRnujQPExJgaQhnn1JsTYRw/7B3JPmxkN7S6HQ/wKc
 +IFOT0zD3TzQYrivu2MfQy69CiX2qyiK/8WcAo+I9C94EHKVweESmGmh003XzbvUnOe2
 UIk5weyZXv3eNNlPYneT1xzhVsWAqTmK60VIZEpc+SCabXsSWFoKjaccyRr0fYOPX/6f Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bjmw59p1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:27:58 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 198CMZdJ029055;
 Fri, 8 Oct 2021 08:27:58 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bjmw59p1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:27:58 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 198CDxEd008376;
 Fri, 8 Oct 2021 12:27:57 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3bef2d3j3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 12:27:57 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 198CRpc732768292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Oct 2021 12:27:51 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41DD7B2066;
 Fri,  8 Oct 2021 12:27:51 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D46B9B2064;
 Fri,  8 Oct 2021 12:27:49 +0000 (GMT)
Received: from [9.211.32.126] (unknown [9.211.32.126])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  8 Oct 2021 12:27:49 +0000 (GMT)
Subject: Re: [PATCH v3] ARM: dts: aspeed: rainier: Add power-config-full-load
 gpio
To: Adriana Kobylak <anoo@linux.ibm.com>, joel@jms.id.au,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
References: <20211005192226.213539-1-anoo@linux.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <897fb30d-966a-f2e0-cf9d-0275f1f1f630@linux.ibm.com>
Date: Fri, 8 Oct 2021 07:27:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211005192226.213539-1-anoo@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0aVTurGi7WacGLGoQDl2Ek11PCg1RItY
X-Proofpoint-GUID: FwwbxNNcNYN7dl7qpQ_zxgd5hrVGoaBL
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_03,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080072
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
Cc: spinler@us.ibm.com, derekh@us.ibm.com, openbmc@lists.ozlabs.org,
 Adriana Kobylak <anoo@us.ibm.com>, bjwyman@gmail.com, shawnmm@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/5/21 2:22 PM, Adriana Kobylak wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Add the power-config-full-load described in:
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md#power-config-full-load
>
> The power-config-full-load gpio is designed to be used to specify how
> many power supplies the system should have, in rainier it is 2 or 4.  If
> enough power supplies fail so that the system no longer has redundancy
> (no longer n+1), the hardware will signal to the Onboard Chip Controller
> that the system may be oversubscribed, and performance may need to be
> reduced so the system can maintain it's powered on state.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>
> v2: Update commit message.
> v3: Updated gpio name to power-config-full-load to match design doc.
>
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 33fae8ad1305..10bde77fb847 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -1998,6 +1998,19 @@ eeprom@51 {
>   		reg = <0x51>;
>   	};
>   
> +	pca_pres3: pca9552@60 {
> +		compatible = "nxp,pca9552";
> +		reg = <0x60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names =
> +			"", "", "", "", "", "", "", "",
> +			"", "", "", "", "", "", "power-config-full-load", "";
> +	};
> +
>   	pca_pres2: pca9552@61 {
>   		compatible = "nxp,pca9552";
>   		reg = <0x61>;
