Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD7886EAC4
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 21:58:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uVd7N91f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmgR05Vqkz3vb9
	for <lists+openbmc@lfdr.de>; Sat,  2 Mar 2024 07:58:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uVd7N91f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2416::601; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmgQT1ng0z3bnx;
	Sat,  2 Mar 2024 07:57:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Js0AOrkEUKjq5JbpUFdzpv/VvabTPpJyGpB2fRqXbv/sDWbURFoVR2/LZY7gbkzgxrtQuO6NR1MoNyHCmAxse6dzAr4VsjHqeen1B74YRFfslyHkDTFbJPYqCT9oPQVlE1wNLbMtq7phDWdvbtYua/Xq3ZW2XtJB3zl7DBaH/5jX0h4TmQudv9pOAsClpgR6YOkhxrq9l4Q+Sf4ENOugaaMDuPbDZeYlbL4e4LIoWoKxiykSHT2lmVr/f6ze6s+B4RxtoXEMT0uMRu3vS5e5ZSMG6YlgUm9Bg0cbEOWubjtc0MwbMPIQwhdDzIibkKedHiKdYEUNFPVae0W/e5D8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAyfhEUcScyUUQT3l8qULkSPFMMO+Cii9ExUn5uge+U=;
 b=b+v8L/+RBVljGG5eCXZy3aa8JjLkE8yCuUMyzkK7xRKSro7n4L/RgufZMLjA3uVvr8YL4lktt4furBqr1r31SgdYxRstyuxXZR2LvbCEg4OM6XyE0aJlRrw+16ZW83bCLCrgA9yPs93Z+gLwuqR12jdv4tacIOiTblZhuiuS2AjZSms6NNTpYkhfObf3yKhiVSkw2vL23Xz/e6yIlkoVM/NX//k3HnUzkkWP66IkjXTRMpWWPDW7LWmp2pg7A0mu2QHPzczGrnIQuwGHmvOC3beDLYdcopqZ1ygJ1erw3OGEIFuL+hx0PRMdNMQiBqsPOHvcuMPWwMls4vFVRCTyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAyfhEUcScyUUQT3l8qULkSPFMMO+Cii9ExUn5uge+U=;
 b=uVd7N91ftja8FPXwRfDkKndc0lhq7GwApCNcVu2Ixc+ztWpIQsK5a6fGsWgghIWfvfMHKcvt8PjXDVgvigVTSTS4dTrMpPrLKL6Xe0L24lwr4Npm3p7+3MNQxxUdBdFxTLQJBl8yv5zAnG6CLgeR7BQWNQf9404vE4pKapZXqC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.34; Fri, 1 Mar
 2024 20:57:15 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::80ac:576:f125:1d72]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::80ac:576:f125:1d72%5]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 20:57:14 +0000
Message-ID: <a29a3906-8c01-4940-9aac-30e6c70df94c@amd.com>
Date: Fri, 1 Mar 2024 14:57:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>, joel@jms.id.au,
 andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org
References: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
 <572d53516dee6db5af7089090056185abb4e78c7.camel@codeconstruct.com.au>
From: Supreeth Venkatesh <supvenka@amd.com>
In-Reply-To: <572d53516dee6db5af7089090056185abb4e78c7.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:805:de::39) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: 83955ed3-aa71-497e-8b74-08dc3a322c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	w51nJHhKf+8ty0QJ6AYZ4QuVziiZRXK6DRzo4WT/mRBqzw5PqsQhaELyFR7tjf9ST96ls7PDhqpkQ/6BDZCU12iOcckT5aisjYI7lEOIBo3aZX2idUXDCRbclw8o22HVwjPoH04T6+XyDQ7fBCuS/LLtbsot7aY88br/9ZTwRwCFWtyaM/M9OBHt24Gucp2evGoNg41Z/1mr2NlXlJdWruvaTgNbH7btnmghIoEdZpt7HuZZnitpe4e3fs8GpOh3ssbTp+4RQxArD/IyDaiuNOZuJlXfm/7a1mJUUc7gG89h4SPtEk8bdlWWnGvi4sOWxOsA4s4nHNHgJecm0TEU6lWp37bJ85DBVchHFtvQ9/xDhoJQ7p6fzEO8asrigJx8RabpE0xROF1/dBCP8O55Mx25gJ4Ql6lQk/q0Yk+cNnCfXPhPREmAiAVwLooOVz2ga9gQxrGjpfw+4QtNmSiQn65m81E+A9hCy3S2REhFJh20qO42iw0r4VIw9sAwsWR8Haz2+UPOWo8vMXm4KmZyEpY7rDb1eMmXGh1bmtuS0hiGBTDOaa2mcCaX7a6446smaeJcwqQ5ubdp3iH+Tqc2yh0ZIEj/RbRAONtkWZL+RD2bkMHR9GmWvDLWmyJkFM5NE9TaQRrYSmjDFWRbcIiLKimwiysgZgYyFZlDglnb4VFkpzkjfnw37fZQbVzA3GsbYufk8YdOio0VdI3J+swfuA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?K2VkWXY5QXV0SnZ2KzZ3N0szU1ZNYXY0ZDhCeVkyOGpmRWVVMStucW9vSDF0?=
 =?utf-8?B?ZWhUZFloYVYyRWRZNkNGa1RTMlpKN2V1Mkw1Y0dIeVAvdjZPQi84OFdmbjcx?=
 =?utf-8?B?RnBHRHlqWS9wUTV1eDhvaURyUjR2WGExbW9iNU5nRUN5OG5nN29rVDRKRnF3?=
 =?utf-8?B?QzBpMnBOSWpyZkNpb29DWU5kN0lRclNsbmE4Q1pqWFJoUlRPdTdGQXFRMVls?=
 =?utf-8?B?ZWV2UitMYmxGejdTWlkvUE5OajhObDFaV29UMloxWkl5NUd3MmE3YnRyOVRU?=
 =?utf-8?B?OXBYNjdjN1dqVkd1ejZTNFRraW54MDA5UytFNXcxMzlTTUNlRU9EV3hPbXVs?=
 =?utf-8?B?M1lwbmRHaFp2RHhteEJRRnh4Zkh0c3IrR045RGpLVnpxTDdubHBzNFROeXE0?=
 =?utf-8?B?eVdIQ1lYSXE5QTVTSENvQ0VKL1luR3gvbGZPdFBydXdwaHVHUzdLVXJGZy9x?=
 =?utf-8?B?d2FlU0N0YjlHb2FOMm9sVXlSbll4cWwxUDhPR3JtblJWdHBsSkJ3b0kwbFhF?=
 =?utf-8?B?SFQyeHFQMk40dUxxNUFKWWx4ZUdrNDRoU1NLZHdWOUhKM1lwWWxNbnFKODR1?=
 =?utf-8?B?bmcvdGE0YmxqYlZ1T0VtN3E5VXJidS9PVFNiSFA1RXJmdXpLQXlJNFNweHFV?=
 =?utf-8?B?MHUzdUZqcTRyUzBtUG9BVWpUV3cxNWczcm5za2RkYkI3dDFEKzRPNnJ3N3RH?=
 =?utf-8?B?d082OHlRcHJPYUdpQlpKb0U2SkhqOTZraUVKQ2prV2oxUGpPQ0xRUkNPLzY2?=
 =?utf-8?B?aVFpUXNqMkZBaXJPUUJKUTkrV1hUbFBjdmVKQkR5Rk56RFV5a2ZkV1BFNWJr?=
 =?utf-8?B?TzNjSHJ5VGxEdkpvNm93M1ZQeWRkZlBxQzd3MFhJd0ZDRnhTRnBWWG5ETW5C?=
 =?utf-8?B?dkRtQ2ZiaFE1UGZ1ZlMwMVRweU04dGtkZCtnYkFKWkIyV0d3NFhrT1ppeUE0?=
 =?utf-8?B?RlZla1QreWRaVTZObVZIVFJGV2NUdW5malBxMDZYdEt5aDZLZU9KdUVlczEw?=
 =?utf-8?B?UDc2S2FuNzU2YS9mTS9Damo3UDRBMTd6elhXZGlWQ1RUR0JvRmFkWm5BN1h1?=
 =?utf-8?B?ZlBzakNRWjBBblZlM0xNU0xMV1o4aWNDUk0yYk9ieWV1cW1ET2JoTk4xb1hH?=
 =?utf-8?B?UFJoR3VabU5TVDJwSmxuQ3RvaEhMYWFZSXNCK0pINzZRZC9IbVR0NFJNd2xM?=
 =?utf-8?B?S00rYlIrcnllZHZuM3JmMnkyRGtSTXhZclRLelY0WHBPY285eWNQaXA1T25w?=
 =?utf-8?B?aG5aVWNVTFp1S1VtOWVhekZNRWNxMU5xTzVJSjByajNhU2ViRnZlRnRpVk1l?=
 =?utf-8?B?NGtvTkxnaHVUZG5zT0pBanBVRTNYSHBWSWtvMmFTN3BxYTE1VWJnNy91NENu?=
 =?utf-8?B?RE9VYk40a2ppUTVySGxnbW84QWtqRy80dFh3WVlocFVVcmMyc1N0cHh4YWFz?=
 =?utf-8?B?OEhxWldaTG9sdWRSL1R2SXNETDZjQ1BlcWNRcnZFU2FDVGZmSW5kYW5weUFk?=
 =?utf-8?B?KytTRGRYMVhOVjFBMG5DUDFXajhCbmd5L0FjRmlROTUybjVTQWpHRy9IcVUx?=
 =?utf-8?B?ZjRieEdSMDZmZ1NwN3ZoZktTbmZ3aUNka1dhYW1CenlMWExheWJiRkt3UllQ?=
 =?utf-8?B?TjNtc00valh5ZjI4SnB3ZElqaVozRk1YTFhuMCtwVWhiSkJrSFlCMlhoSHla?=
 =?utf-8?B?ZzVYejBoYU9KN0JRTnJiQUlJeHdVdmZKN1loSHhzd1ErWlc0WTRaVlgwYmRz?=
 =?utf-8?B?Vm1pZFhST1ZYd3NpV2syMDd6KzBxRXU0U2V6NVlCYW5QY0ZOeGNRMUZBeTZm?=
 =?utf-8?B?TWxCMjR4dzh0RFlmRlJxMytRak1Sd2lsbkg3TFR6QWR1Z0RnNVU2R0dTZ3Z4?=
 =?utf-8?B?V0JvOGFXR2VMbEdQVTczUXdpZnd4RHkxY1g2ekZiSEk3cVZxZ1VxOE5PZ3pQ?=
 =?utf-8?B?OVVpNElkSlJEQWRYd2s1SzlxU3JXWHdtdmljalZJRGNXMHdtc2pQZDRCeisv?=
 =?utf-8?B?ekZVYVIwaTlLcWUxWGxjaC9PNUxJYS84eVRiaXRydGtFcE9TclU2eUFEejF5?=
 =?utf-8?B?SHNoS0o3ZVFlVmZSdGxtUjNpd2w4RlFveTY2Wmk2VzVja0gzN09IUVI4bjhX?=
 =?utf-8?Q?E2FV0T6rAaW+paWDnF5uiH8Bn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83955ed3-aa71-497e-8b74-08dc3a322c22
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 20:57:14.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7T+pn8wgmQHHF/6nhqwhK4ToiPa6XQScPOA4r88bKNETu9ii5QJWycUZ9XyYGmbEJNbQQkwnlOElSAuLWn8Ueg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212
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


On 2/26/24 00:55, Andrew Jeffery wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, 2024-01-09 at 21:35 -0600, Supreeth Venkatesh wrote:
>> This patch adds initial device tree and makefile updates for
>> AMD Onyx platform.
>>
>> AMD Onyx platform is an AMD customer reference board with an Aspeed
>> ast2600 BMC manufactured by AMD.
>> It describes I2c devices, Fans, Kcs devices, Uarts, Mac, LEDs, etc.
>> present on AMD Onyx platform.
>>
>> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>> ---
>>   arch/arm/boot/dts/aspeed/Makefile             |  1 +
>>   .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 98 +++++++++++++++++++
>>   2 files changed, 99 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>> index fb9cc95f1b60..2b27d377aae2 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>        aspeed-ast2600-evb.dtb \
>>        aspeed-bmc-amd-daytonax.dtb \
>>        aspeed-bmc-amd-ethanolx.dtb \
>> +     aspeed-bmc-amd-onyx.dtb \
>>        aspeed-bmc-ampere-mtjade.dtb \
>>        aspeed-bmc-ampere-mtmitchell.dtb \
>>        aspeed-bmc-arm-stardragon4800-rep2.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>> new file mode 100644
>> index 000000000000..a7056cd29553
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>> @@ -0,0 +1,98 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +// Copyright (c) 2021 - 2024 AMD Inc.
>> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>> +
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +       model = "AMD Onyx BMC";
>> +       compatible = "amd,onyx-bmc", "aspeed,ast2600";
>> +
>> +       aliases {
>> +               serial0 = &uart1;
>> +               serial4 = &uart5;
>> +      };
>> +
>> +       chosen {
>> +               stdout-path = &uart5;
>> +               bootargs = "console=ttyS4,115200 earlyprintk vmalloc=512MB";
> Why `vmalloc=512MB`? Can you add a comment explaining the need for
> that?
>
> That said, setting bootargs in the devicetree is generally discouraged.
>
Thank you. will remove in v2.
>> +       };
>> +
>> +       memory@80000000 {
>> +               device_type = "memory";
>> +               reg = <0x80000000 0x80000000>;
>> +       };
>> +
>> +};
>> +
>> +&mdio0 {
>> +       status = "okay";
>> +
>> +       ethphy0: ethernet-phy@0 {
>> +               compatible = "ethernet-phy-ieee802.3-c22";
>> +               reg = <0>;
>> +       };
>> +};
>> +
>> +&mac3 {
>> +       status = "okay";
>> +       phy-mode = "rgmii";
>> +       phy-handle = <&ethphy0>;
>> +
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_rgmii4_default>;
>> +};
>> +
>> +
>> +
>> +&fmc {
>> +       status = "okay";
>> +       flash@0 {
>> +               compatible = "jedec,spi-nor";
>> +               status = "okay";
>> +               #include "openbmc-flash-layout-128.dtsi"
>> +       };
>> +};
>> +
>> +//Host Console
>> +&uart1 {
>> +       status = "okay";
>> +};
> How are you managing the host console? Enabling UART1 for that on the
> BMC piques my interest :)
UART1 [BMC side] <-> UART 4 [Host side].
>
> Apologies for the delay in reviewing.
No problem. Thanks for reviewing. Sending v2 shortly.
>
> Andrew
>
