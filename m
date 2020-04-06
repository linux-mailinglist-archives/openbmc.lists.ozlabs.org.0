Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E11A2CE3
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 02:31:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yMXP1SWbzDr8p
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 10:31:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bentyner@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x0n42nGXzDqm6
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 05:23:04 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036JKCQT049164; Mon, 6 Apr 2020 15:22:59 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306n24md9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 15:22:58 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 036JKW39001161;
 Mon, 6 Apr 2020 19:22:43 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 306hv6q0ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 19:22:43 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 036JMgRc59834786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 19:22:42 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A4117805C;
 Mon,  6 Apr 2020 19:22:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D359078064;
 Mon,  6 Apr 2020 19:22:41 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 19:22:41 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 06 Apr 2020 14:22:41 -0500
From: bentyner <bentyner@linux.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: [PATCH] Remove checkstop GPIO from gpio-keys definitions
In-Reply-To: <4FB1C77E-3FD5-4D56-AD67-BB4A57BE45C1@fuzziesquirrel.com>
References: <d51f1a31994d36b1dd98f1bd56260cc3@linux.vnet.ibm.com>
 <4FB1C77E-3FD5-4D56-AD67-BB4A57BE45C1@fuzziesquirrel.com>
Message-ID: <201a8252c5cf8d7af5f31075a52fd4c4@linux.vnet.ibm.com>
X-Sender: bentyner@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_09:2020-04-06,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060145
X-Mailman-Approved-At: Thu, 09 Apr 2020 10:31:15 +1000
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

The description does not match the content because I did what was 
recommended:

"Apply the 0001-ARM-dts-Aspeed-Add-witherspoon-128-machine.patch to a 
kernel tree, make whatever edits you need to the device tree and then 
regenerate the (original) patch, and check this file back in."

The original patch added the device tree. My changes "subtract" from the 
device tree that only exists because of the original patch.


On 2020-04-06 12:35, Brad Bishop wrote:
> at 8:16 AM, bentyner <bentyner@linux.ibm.com> wrote:
> 
>> From: Ben Tyner <ben.tyner@ibm.com>
> 
> Hi Ben.  How did you invoke git format-patch?  I wasn’t expecting
> this  line.  Have a read through
> https://github.com/openbmc/linux/wiki/SubmittingPatches#use-the-git-tools
>  and see if that procedure gets rid of it.  Also "linux dev-5.4” is
> needed  in the subject prefix so patchwork knows where to put this
> (when submitted  correctly, you should be able to see your patch here:
>  https://patchwork.ozlabs.org/project/linux-aspeed/list/
> 
>> 
>> Attention handler will monitor the checkstop gpio via the character
>> device interface so it needs to not be defined.
> 
> This description doesn’t match the content - an entire device tree
> has been  added.  Also I think you’ll need to rebase because I see
> that this DT was  recently added with
> 0d8c8d99358588164430b3d89312ecea775a57f1.
> 
>> 
>> Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
>> ---
>> 
>>  arch/arm/boot/dts/Makefile                    |  1 +
>>  .../dts/aspeed-bmc-opp-witherspoon-128.dts    | 99 
>> +++++++++++++++++++
>>  2 files changed, 100 insertions(+)
>>  create mode 100644 
>> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
>> 
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index fcd607ffe8d9..d6dfdf73e66b 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1303,6 +1303,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>  	aspeed-bmc-opp-tacoma.dtb \
>>  	aspeed-bmc-opp-vesnin.dtb \
>>  	aspeed-bmc-opp-witherspoon.dtb \
>> +	aspeed-bmc-opp-witherspoon-128.dtb \
>>  	aspeed-bmc-opp-zaius.dtb \
>>  	aspeed-bmc-portwell-neptune.dtb \
>>  	aspeed-bmc-quanta-q71l.dtb
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts  
>> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
>> new file mode 100644
>> index 000000000000..701d58b7f0dc
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright 2019 IBM Corp.
>> +/dts-v1/;
>> +
>> +#include "aspeed-bmc-opp-witherspoon.dts"
>> +
>> +/ {
>> +	gpio-keys {
>> +		/delete-node/ checkstop;
>> +	};
>> +};
>> +
>> +&gpio {
>> +	gpio-line-names =
>> +	/*A0-A7*/	"","cfam-reset","","","","","fsi-mux","",
>> +	/*B0-B7*/	"","","","","","air-water","","",
>> +	/*C0-C7*/	"","","","","","","","",
>> +	/*D0-D7*/	"fsi-enable","","","","","","","",
>> +	/*E0-E7*/	"fsi-data","","","","","","","",
>> +	/*F0-F7*/	"","","","","","","","",
>> +	/*G0-G7*/	"","","","","","","","",
>> +	/*H0-H7*/	"","","","","","","","",
>> +	/*I0-I7*/	"","","","","","","","",
>> +	/*J0-J7*/	"","","","","","","","",
>> +	/*K0-K7*/	"","","","","","","","",
>> +	/*L0-L7*/	"","","","","","","","",
>> +	/*M0-M7*/	"","","","","","","","",
>> +	/*N0-N7*/	"presence-ps1","","led-rear-fault","led-rear-power",
>> +		        "led-rear-id","","","",
>> +	/*O0-O7*/	"","","","","","","","",
>> +	/*P0-P7*/	"","","","","","","","presence-ps0",
>> +	/*Q0-Q7*/	"","","","","","","","",
>> +	/*R0-R7*/	"","","fsi-trans","","","power-button","","",
>> +	/*S0-S7*/	"","","","","","","","",
>> +	/*T0-T7*/	"","","","","","","","",
>> +	/*U0-U7*/	"","","","","","","","",
>> +	/*V0-V7*/	"","","","","","","","",
>> +	/*W0-W7*/	"","","","","","","","",
>> +	/*X0-X7*/	"","","","","","","","",
>> +	/*Y0-Y7*/	"","","","","","","","",
>> +	/*Z0-Z7*/	"","","","","","","","",
>> +	/*AA0-AA7*/	"fsi-clock","","","","","","","",
>> +	/*AB0-AB7*/	"","","","","","","","",
>> +	/*AC0-AC7*/	"","","","","","","","";
>> +};
>> +
>> +&fmc {
>> +	status = "okay";
>> +
>> +	flash@0 {
>> +		status = "okay";
>> +		label = "bmc";
>> +		m25p,fast-read;
>> +		spi-max-frequency = <100000000>;
>> +
>> +		partitions {
>> +			#address-cells = < 1 >;
>> +			#size-cells = < 1 >;
>> +			compatible = "fixed-partitions";
>> +			u-boot@0 {
>> +				reg = < 0 0x60000 >;
>> +				label = "u-boot";
>> +			};
>> +			u-boot-env@60000 {
>> +				reg = < 0x60000 0x20000 >;
>> +				label = "u-boot-env";
>> +			};
>> +			obmc-ubi@80000 {
>> +				reg = < 0x80000 0x7F80000>;
>> +				label = "obmc-ubi";
>> +			};
>> +		};
>> +	};
>> +
>> +	flash@1 {
>> +		status = "okay";
>> +		label = "alt-bmc";
>> +		m25p,fast-read;
>> +		spi-max-frequency = <100000000>;
>> +
>> +		partitions {
>> +			#address-cells = < 1 >;
>> +			#size-cells = < 1 >;
>> +			compatible = "fixed-partitions";
>> +			u-boot@0 {
>> +				reg = < 0 0x60000 >;
>> +				label = "alt-u-boot";
>> +			};
>> +			u-boot-env@60000 {
>> +				reg = < 0x60000 0x20000 >;
>> +				label = "alt-u-boot-env";
>> +			};
>> +			obmc-ubi@80000 {
>> +				reg = < 0x80000 0x7F80000>;
>> +				label = "alt-obmc-ubi";
>> +			};
>> +		};
>> +	};
>> +};
>> —
>> 2.20.1
