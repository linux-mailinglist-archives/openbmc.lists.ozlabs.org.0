Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1B212FCC4
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2020 19:57:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47qDfg1MM5zDqDN
	for <lists+openbmc@lfdr.de>; Sat,  4 Jan 2020 05:57:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=wrightj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47qDdm50XyzDqCs
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jan 2020 05:56:27 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 003IqcaI139792; Fri, 3 Jan 2020 13:55:23 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x9dr6fwqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jan 2020 13:55:23 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 003Ir2Le006908;
 Fri, 3 Jan 2020 18:55:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2x5xp72xwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jan 2020 18:55:22 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 003ItKSN63373720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jan 2020 18:55:20 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D770BE056;
 Fri,  3 Jan 2020 18:55:20 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22964BE04F;
 Fri,  3 Jan 2020 18:55:20 +0000 (GMT)
Received: from [9.10.101.151] (unknown [9.10.101.151])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Jan 2020 18:55:19 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4] ARM: dts: aspeed: rainier: Remove duplicate
 i2c busses
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20200102234451.301828-1-joel@jms.id.au>
From: Jim Wright <wrightj@linux.vnet.ibm.com>
Message-ID: <a263f8db-0ffc-3884-1f9e-e9f7e7dda682@linux.vnet.ibm.com>
Date: Fri, 3 Jan 2020 12:55:18 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200102234451.301828-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-03_05:2020-01-02,2020-01-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001030171
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
Cc: Derek Howard <derekh@us.ibm.com>, Jim L Wright <jlwright@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 1/2/2020 5:44 PM, Joel Stanley wrote:
> This is a revert of "ARM: dts: aspeed: rainier: Add i2c devices", which
> was already applied to the tree.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Hi Joel,

Looks good to me.

Reviewed-by: Jim Wright <wrightj@linux.vnet.ibm.com>

I built this patch into an image and ran it in the simulator. Verified 
that the UCD device driver worked as expected.

Tested-by: Jim Wright <wrightj@linux.vnet.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 365 -------------------
>   1 file changed, 365 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index e1d931a0907b..1edeb8a415b5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -591,371 +591,6 @@
>   	status = "okay";
>   };
>
> -&i2c13 {
> -	status = "okay";
> -};
> -
> -&i2c14 {
> -	status = "okay";
> -};
> -
> -&i2c15 {
> -	status = "okay";
> -};
> -
> -&i2c0 {
> -	status = "okay";
> -};
> -
> -&i2c1 {
> -	status = "okay";
> -};
> -
> -&i2c2 {
> -	status = "okay";
> -};
> -
> -&i2c3 {
> -	status = "okay";
> -
> -	power-supply@68 {
> -		compatible = "ibm,cffps2";
> -		reg = <0x68>;
> -	};
> -
> -	power-supply@69 {
> -		compatible = "ibm,cffps2";
> -		reg = <0x69>;
> -	};
> -
> -	power-supply@6a {
> -		compatible = "ibm,cffps2";
> -		reg = <0x6a>;
> -	};
> -
> -	power-supply@6b {
> -		compatible = "ibm,cffps2";
> -		reg = <0x6b>;
> -	};
> -};
> -
> -&i2c4 {
> -	status = "okay";
> -
> -	tmp275@48 {
> -		compatible = "ti,tmp275";
> -		reg = <0x48>;
> -	};
> -
> -	tmp275@49 {
> -		compatible = "ti,tmp275";
> -		reg = <0x49>;
> -	};
> -
> -	tmp275@4a {
> -		compatible = "ti,tmp275";
> -		reg = <0x4a>;
> -	};
> -};
> -
> -&i2c5 {
> -	status = "okay";
> -
> -	tmp275@48 {
> -		compatible = "ti,tmp275";
> -		reg = <0x48>;
> -	};
> -
> -	tmp275@49 {
> -		compatible = "ti,tmp275";
> -		reg = <0x49>;
> -	};
> -};
> -
> -&i2c6 {
> -	status = "okay";
> -
> -	tmp275@48 {
> -		compatible = "ti,tmp275";
> -		reg = <0x48>;
> -	};
> -
> -	tmp275@4a {
> -		compatible = "ti,tmp275";
> -		reg = <0x4a>;
> -	};
> -
> -	tmp275@4b {
> -		compatible = "ti,tmp275";
> -		reg = <0x4b>;
> -	};
> -};
> -
> -&i2c7 {
> -	status = "okay";
> -
> -	si7021-a20@20 {
> -		compatible = "silabs,si7020";
> -		reg = <0x20>;
> -	};
> -
> -	tmp275@48 {
> -		compatible = "ti,tmp275";
> -		reg = <0x48>;
> -	};
> -
> -	max31785@52 {
> -		compatible = "maxim,max31785a";
> -		reg = <0x52>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		fan@0 {
> -			compatible = "pmbus-fan";
> -			reg = <0>;
> -			tach-pulses = <2>;
> -		};
> -
> -		fan@1 {
> -			compatible = "pmbus-fan";
> -			reg = <1>;
> -			tach-pulses = <2>;
> -		};
> -
> -		fan@2 {
> -			compatible = "pmbus-fan";
> -			reg = <2>;
> -			tach-pulses = <2>;
> -		};
> -
> -		fan@3 {
> -			compatible = "pmbus-fan";
> -			reg = <3>;
> -			tach-pulses = <2>;
> -		};
> -	};
> -
> -	pca0: pca9552@60 {
> -		compatible = "nxp,pca9552";
> -		reg = <0x60>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -
> -		gpio@0 {
> -			reg = <0>;
> -		};
> -
> -		gpio@1 {
> -			reg = <1>;
> -		};
> -
> -		gpio@2 {
> -			reg = <2>;
> -		};
> -
> -		gpio@3 {
> -			reg = <3>;
> -		};
> -
> -		gpio@4 {
> -			reg = <4>;
> -		};
> -
> -		gpio@5 {
> -			reg = <5>;
> -		};
> -
> -		gpio@6 {
> -			reg = <6>;
> -		};
> -
> -		gpio@7 {
> -			reg = <7>;
> -		};
> -
> -		gpio@8 {
> -			reg = <8>;
> -		};
> -
> -		gpio@9 {
> -			reg = <9>;
> -		};
> -
> -		gpio@10 {
> -			reg = <10>;
> -		};
> -
> -		gpio@11 {
> -			reg = <11>;
> -		};
> -
> -		gpio@12 {
> -			reg = <12>;
> -		};
> -
> -		gpio@13 {
> -			reg = <13>;
> -		};
> -
> -		gpio@14 {
> -			reg = <14>;
> -		};
> -
> -		gpio@15 {
> -			reg = <15>;
> -		};
> -	};
> -
> -	dps: dps310@76 {
> -		compatible = "infineon,dps310";
> -		reg = <0x76>;
> -		#io-channel-cells = <0>;
> -	};
> -};
> -
> -&i2c8 {
> -	status = "okay";
> -
> -	ucd90320@b {
> -		compatible = "ti,ucd90160";
> -		reg = <0x0b>;
> -	};
> -
> -	ucd90320@c {
> -		compatible = "ti,ucd90160";
> -		reg = <0x0c>;
> -	};
> -
> -	ucd90320@11 {
> -		compatible = "ti,ucd90160";
> -		reg = <0x11>;
> -	};
> -
> -	rtc@32 {
> -		compatible = "epson,rx8900";
> -		reg = <0x32>;
> -	};
> -
> -	tmp275@48 {
> -		compatible = "ti,tmp275";
> -		reg = <0x48>;
> -	};
> -
> -	tmp275@4a {
> -		compatible = "ti,tmp275";
> -		reg = <0x4a>;
> -	};
> -};
> -
> -&i2c9 {
> -	status = "okay";
> -
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
> -	tmp423a@4c {
> -		compatible = "ti,tmp423";
> -		reg = <0x4c>;
> -	};
> -
> -	tmp423b@4d {
> -		compatible = "ti,tmp423";
> -		reg = <0x4d>;
> -	};
> -
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
> -};
> -
> -&i2c10 {
> -	status = "okay";
> -
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
> -	tmp423a@4c {
> -		compatible = "ti,tmp423";
> -		reg = <0x4c>;
> -	};
> -
> -	tmp423b@4d {
> -		compatible = "ti,tmp423";
> -		reg = <0x4d>;
> -	};
> -
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
> -};
> -
> -&i2c11 {
> -	status = "okay";
> -
> -	tmp275@48 {
> -		compatible = "ti,tmp275";
> -		reg = <0x48>;
> -	};
> -
> -	tmp275@49 {
> -		compatible = "ti,tmp275";
> -		reg = <0x49>;
> -	};
> -};
> -
> -&i2c12 {
> -	status = "okay";
> -};
> -
>   &i2c13 {
>   	status = "okay";
>
