Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FEA13160C
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 17:29:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s1F01zfnzDqGt
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 03:29:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s1DJ095mzDqFs
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 03:29:02 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006GOx8F091602; Mon, 6 Jan 2020 11:28:55 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb94y7yag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 11:28:55 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 006GSEYQ014775;
 Mon, 6 Jan 2020 16:28:54 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 2xajb63h0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 16:28:54 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 006GSrm459703726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 16:28:53 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E74B6E052;
 Mon,  6 Jan 2020 16:28:53 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0F2C6E053;
 Mon,  6 Jan 2020 16:28:52 +0000 (GMT)
Received: from [9.41.103.158] (unknown [9.41.103.158])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 16:28:52 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4] ARM: dts: aspeed: rainier: Add host FSI
 description
To: Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Popple <alistair@popple.id.au>
References: <20191223133554.537395-1-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <902d50b1-6d8c-4db5-2ca9-6454fc880d7f@linux.vnet.ibm.com>
Date: Mon, 6 Jan 2020 10:28:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191223133554.537395-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_05:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060147
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 12/23/19 7:35 AM, Joel Stanley wrote:
> This adds the description of the Power CPUs that are attached to the
> BMC.
>
> Without this userspace will see the '/dev/scom66' style layout.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


Thanks!


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++
>   1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index dad5233efba3..e1d931a0907b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -72,6 +72,88 @@
>   	status = "okay";
>   };
>   
> +&fsim0 {
> +	status = "okay";
> +
> +	#address-cells = <2>;
> +	#size-cells = <0>;
> +
> +	cfam@0,0 {
> +		reg = <0 0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		chip-id = <0>;
> +
> +		scom@1000 {
> +			compatible = "ibm,fsi2pib";
> +			reg = <0x1000 0x400>;
> +		};
> +
> +		sbefifo@2400 {
> +			compatible = "ibm,p9-sbefifo";
> +			reg = <0x2400 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			fsi_occ0: occ {
> +				compatible = "ibm,p9-occ";
> +			};
> +		};
> +
> +		fsi_hub0: hub@3400 {
> +			compatible = "fsi-master-hub";
> +			reg = <0x3400 0x400>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +
> +			no-scan-on-init;
> +		};
> +	};
> +};
> +
> +&fsi_hub0 {
> +	cfam@1,0 {
> +		reg = <1 0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		chip-id = <1>;
> +
> +		scom@1000 {
> +			compatible = "ibm,fsi2pib";
> +			reg = <0x1000 0x400>;
> +		};
> +
> +		sbefifo@2400 {
> +			compatible = "ibm,p9-sbefifo";
> +			reg = <0x2400 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			fsi_occ1: occ {
> +				compatible = "ibm,p9-occ";
> +			};
> +		};
> +
> +		fsi_hub1: hub@3400 {
> +			compatible = "fsi-master-hub";
> +			reg = <0x3400 0x400>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +
> +			no-scan-on-init;
> +		};
> +	};
> +};
> +
> +/* Legacy OCC numbering (to get rid of when userspace is fixed) */
> +&fsi_occ0 {
> +	reg = <1>;
> +};
> +
> +&fsi_occ1 {
> +	reg = <2>;
> +};
> +
>   &ibt {
>   	status = "okay";
>   };
