Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7F75F621A
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjkFz4STFz304J
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:53:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qEnLqLvx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.102; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qEnLqLvx;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2102.outbound.protection.outlook.com [40.107.94.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjk7p5yZdz3c6v
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:48:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tao2y5Ghc18gWQ8qm3S+vfyZS4IFSZll4t/X89NRA6txsCaIhdiUtlKxOp5afrdExZVWs/13i6n88Dzz6GCu98JR1Wpv+NtjaHWTgv2Tpq4i+P3cPzf9PLku9wN+0POQd4Zo0OWeFUhZqAjIHqKxcOOYkh6aA16Z8A2IcDRlZcjWzQjDYicIgJF7Dl1HOLpoJLDb//N4pM8jW4F29y2sTFDXcrpz3oDeF9Rec1wKRWtzBD5ztek3C0mcInZdBOIdf15TO9IG/zXCZ8l4D9hgoR1+shm2QVuGi28E7Kt338HAG0fOV2wKzIzlmee+mvVhWR6eLkRR23MU7+kd0hh4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eu8nsreIZ9IGjJDl/7K2/kQz5QWp/sVzhMLKYcqbedA=;
 b=hgp3j1cF5TVyLOqjFPcy/eX/0UJapBo11cB/GATe8MNqMJ8BTITiAWIXlkeIX4Nk9GWYy4BHj/XX1q2GK54+3zuVH49uaha6mOu4Uk5nz/MKIL31YU/dekFMOhoQPY/MOrOxQN+PZhCwuLrR3TTPo90Z1mmLqW+j4xwNLHQ5wWtqvTZuoTvfoQbteF+Cik4W0CTLuRyJUXaE8bZvHSphG7dYYHMTB2jJao8uhkug+zvwp3QrFXJj76vKPGbvURtfrPNRCDbmCpT4geQNl75EAXHuZSzLhG1Lc5ARwWl+yb3woF1h22d4zHYczvE2mYw5Kb4nCBa3oi/jBH/0weqh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eu8nsreIZ9IGjJDl/7K2/kQz5QWp/sVzhMLKYcqbedA=;
 b=qEnLqLvxdcFMdIR1TVqx0FAfLdj6Z+jPzVAkU+cHuLC064uo/lA//xgwUbZ2hcxlTBU8s7r3wEcKIpR38dT4YJ5WGHtAvrw06fNfAaewoixMKR5MRuet7sGEQEZUYp3xvebtd2cvVGh9chXCLWjaP3ZWvthcgqAgOnwiCnP7OaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BY5PR01MB5796.prod.exchangelabs.com (2603:10b6:a03:1be::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Thu, 6 Oct 2022 07:47:48 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:47:48 +0000
Message-ID: <7c0d3614-f501-d398-e023-5754e2ec9528@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:47:36 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 2/9] docs: hwmon: (smpro-hwmon) Add documentation
Content-Language: en-CA
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-3-quan@os.amperecomputing.com>
 <Yzg5GM97kM6/Hw82@debian.me>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <Yzg5GM97kM6/Hw82@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::16)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BY5PR01MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 96fca50a-84f2-418c-20a4-08daa76f105a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	P3fVxQsvSVa+b9SCBPN0fRG8iRUqhph+DhV46nEs+TSyE+FeT3FlAToRSwB+jCpCiVm2SoQTKs3D0VIX9aE4VE5ny2C3PhCTAi2k3Nc3lP/mGMdZq+KLLHNVvgHFdyLipj2CtQERxl5PkcEI7x+Y/0AI0sxdYhDie4PXzCwcAnZg2LV19DleUJpC++1Za7Tik1S4/43QqwWd5SQW5Xnnrby/8DVvVNGH0JlbtaWHQlU5X7ZWW9xKp5ymIJfFJRni+Lwf7J5rDDmfwjXlBbpW/EEkVJJg+ILMfnNrY9vxXf4WqrK/VJ3EYKKI/yARXCGZXfBB2I8GOu3oUJ8fTE+LNBUTkaCETgtyBNE79osbR1p8T0bj7gSW4GGdWPbBiIW95IlwmxRinfW2wl14UMowlzCoarFUycNpNyE46LD5yYC+5+Jj8ibn2R1eDgjjVlHdWOEdNSNQMfQ31K6Lcv5Gg+UBUdZiRRYVvZXHKHJ2z9Qbr3BxRkcH/3CQjT9cOMTqm/cQOUo+vH2c+JCqDcAbLhQE6ujnwVlvzG3pAYdP4BxLfAuHFWAhIoRA/uqLxu1+SrbVeDp53QINDnmG2QLQfs/YDLISz9XAEMrAetb+PQdXFKTMqK1dJci9cvxKUNZvH2y+MyZKaakJeRiaq8w68+4+nWOGY3vlXcg+vjfOCM0el2oe7VKYC7gOulEjf/TFeQVjDtMvOIUN42J3fLtCElhuhfcBFo5NJf7SummKxcjLcYlqW1nAF3JrXYsa7b1KT75VbNzODFN6MaNm4zA9LAsM5S+cB9qWrEfaw3rE+QU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(451199015)(38350700002)(31686004)(186003)(478600001)(38100700002)(6486002)(54906003)(31696002)(30864003)(7416002)(83380400001)(66556008)(41300700001)(316002)(66476007)(2616005)(8676002)(6666004)(6916009)(107886003)(86362001)(6512007)(8936002)(26005)(5660300002)(53546011)(66946007)(52116002)(4326008)(6506007)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SVlKSFQ4NWwwWmM3UWRQdGh0aFQvQXI0Sk5QN09VRVFaZUxLN2lVMW9qQmxS?=
 =?utf-8?B?NkJIWDFHNXdpWEZLRW1Ta29JMS9iNUJIK3BoR3BaSms1cEwxWEw3LzNhLzMr?=
 =?utf-8?B?S1Y0ZldWR0w3aHY3dDBGamNBeklIUjlHY28wMGhMbFM1a3REeFJSTWxvRjRp?=
 =?utf-8?B?cS9Bek5yZ25NeENyaGY1UFZDL0c3Z0dzYjBxRXBDRTBBdjBIQmkxajlqUUFZ?=
 =?utf-8?B?S2VadFNjUitBbXdmMXJyYTNPeC9RWEdoMjBBU1U1bmdFN2VPcEZQdVdMSU5L?=
 =?utf-8?B?RFIwby9QVTN1RDY5clhkQ1hkOTB0NnhyR0pCR3l3NTE5VGhaeWltQUdvMzZ5?=
 =?utf-8?B?SG12WGthRkMwTHd2Mnc0WjJqc2lvOGhLZmgrb3lxdVVrdys0RTZxZ0Iwcmpr?=
 =?utf-8?B?WnhENGkwSllVek1Bc1B0alRiczNaSWJia3E5dG1HQkxSNWVMTkRjc3RJdHJx?=
 =?utf-8?B?bWNtcWtXZlBBM2ZudDZYM01Bdks5MHBwL1RVWC84NGgzcjdCTDU1Z2EvRVNh?=
 =?utf-8?B?ZzRMSFZ2S1drankzTXg1V0Z1ajk4VmFvczZLVnI3bEd2c3dBZGQvMWNIell6?=
 =?utf-8?B?MWx4OGtEa2Y3WHY4b2p6Q3o0Vy9qYkFYdHI5NDB0VFFmUnNWZEo2eTYxZGQv?=
 =?utf-8?B?YW9zcFo1TllDMjZhbHRmbkVOZzFqYnNNcW9NUjJQSHJLRmJsa3pxQU9USVZX?=
 =?utf-8?B?NTlySkgxQm5uOERJblFzdytFV3d0NGYrb2lPdEdEVTFHV1FjRVJGVE9hdk1t?=
 =?utf-8?B?eUtTZ2lZTnlCQ1R1NWcvNktXcFhibUFmdnZXYitqUThmTDdhUFBBZWR4cjlB?=
 =?utf-8?B?WlRUc3dkRC83T0JBMSs4OTg0MDRaNmFSdktKODYxMnJxU2VGcDE1cGo4TGxm?=
 =?utf-8?B?WGFwdnVKRW1nMVRBc2g0a0J1VlQrdUlpc1VoaWU0K3dDSVdXQ0Z3MTNyR1dE?=
 =?utf-8?B?cXhLUHNybmxXOWtWRHVBNmg3RDIwTUtOR1ZZSFNGd1VPeXlHRTRmOVJsdlVv?=
 =?utf-8?B?L3NxNVk5ekpsOCtTaW5mUW04emwyRXNGUGFmRTF3UDdFazgyLytOeDZ3M1VP?=
 =?utf-8?B?WlRBaXhwZkg4UjFiL3UrZnRyN2VLTXFOTDdwY3pvYnhzMVlYZmRtTlFlZHNF?=
 =?utf-8?B?aHRIZ1dsOTFhaGxySHY3QkdhbStKbFUvTGJrUWowdjBHeEh2YjhXcWNTdVV3?=
 =?utf-8?B?QlJvSlpyK09Ld1lKOUpqRXBRTjhOZ3Z2WmxJWlBqNzdxK2hWSnNHTG95bTc5?=
 =?utf-8?B?RGQ5MW5oMVBMUlNrcUluVFhkREN2R2k1Z3ZxMTNFRHFUWVVlNHlrNjVxU01G?=
 =?utf-8?B?ak5lK2lkc0ViSUpuVDlMVGk1aVRDN1JqU0U5QzhrUERtOGpoRkVOdmcydE1u?=
 =?utf-8?B?RTl3blJ2aGR0V0F5Z203L2JVUWJEcUVuTDhSMkd5MFNjUkFPcjV2WkhTc0tX?=
 =?utf-8?B?aVZnenJJallYdHVrUTRjenBIdDNJa3BJM0Z6T3Y5K3dOUHV0R2d6UGxDMm5z?=
 =?utf-8?B?bUhZUlRaUnJiVWJMeVJFNEZsNHNxMnV1ZC9XakVaZk1IMHhnY1J5U2RWclpj?=
 =?utf-8?B?cjB5ek1HbFUxeFZtU0dvOFBQK3hVcGtGMDJLNDJiNHp3M3ZNOTlUalNlT0Y1?=
 =?utf-8?B?SmRqL3hsRHBBait0dDVkeVQ5REJadFczbkcySWc0eGU1WWNFaldOdWV6aHRM?=
 =?utf-8?B?MzJqVzgvSUlHQ3BJUm80M2FCeEZiWkpTU0Z4dHh6TDRPOUw3ZGZmazl4N2F5?=
 =?utf-8?B?WlZZRklDbGJmZXFiU3JTZHcxdnhBRVVzYnp3a2tRNXpOVm81OG5YNk1TaGFj?=
 =?utf-8?B?QzRLOCtJT1d2RWx6QVVwM0Qvb3Nic0l1Q1dEekpnRkNzZ2lmczBXK08zRVVZ?=
 =?utf-8?B?MFhUeUJvWHRQYVA3RElhclVQQmp1RTltNEJzWC9KbktxSGtVcnd3MmNLeVBz?=
 =?utf-8?B?OGJVZ0FqRG5wOHJ5Q0hqcUE3VXlLdVBrNlZkZDF0akJYZktGMVBvU21Zczgy?=
 =?utf-8?B?akJOY1VkZWp3dmhvcHhVQjY3M2xkSW1NSm9PSmlucE44TkhaZENLWlVMd21F?=
 =?utf-8?B?RExKYlpobnRpWngvVkZUMWZDeDcyWTNQeHphZUJwcnJEektla2FoVUFnekhR?=
 =?utf-8?B?ZUxlWGUxSjlsTDU5blhBV1NJZTBFdkNBY3lNMTNxb0FrUG43aWlOSDJ2dmlY?=
 =?utf-8?Q?odWtFQ9Z4HWXxPinVKwx10I=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fca50a-84f2-418c-20a4-08daa76f105a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:47:48.7489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYpP7632uCVbUQ/X1UbsbVspKeO6WUauDJc5rODxtUXqN0rVE+njfo1TB1qyV5v6cmeylzRHYs9/wzZVbBLO8TNIVVz6RNWnExFw+z3Pfec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB5796
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 01/10/2022 19:56, Bagas Sanjaya wrote:
> On Thu, Sep 29, 2022 at 04:43:14PM +0700, Quan Nguyen wrote:
>> diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
>> new file mode 100644
>> index 000000000000..3a9b14dacf89
>> --- /dev/null
>> +++ b/Documentation/hwmon/smpro-hwmon.rst
>> @@ -0,0 +1,101 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +Kernel driver Ampere(R)'s Altra(R) SMpro hwmon
>> +==============================================
>> +
>> +Supported chips:
>> +
>> +  * Ampere(R) Altra(R)
>> +
>> +    Prefix: 'smpro'
>> +
>> +    Reference: Altra SoC BMC Interface Specification
>> +
>> +Author: Thu Nguyen <thu@os.amperecomputing.com>
>> +
>> +Description
>> +-----------
>> +This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
>> +SMpro co-processor (SMpro).
>> +The following sensor types are supported by the driver:
>> +
>> +  * temperature
>> +  * voltage
>> +  * current
>> +  * power
>> +
>> +The SMpro interface provides the registers to query the various sensors and
>> +their values which are then exported to userspace by this driver.
>> +
>> +Usage Notes
>> +-----------
>> +
>> +SMpro hwmon driver creates at least two sysfs files for each sensor.
>> +
>> +* File ``<sensor_type><idx>_label`` reports the sensor label.
>> +* File ``<sensor_type><idx>_input`` returns the sensor value.
>> +
>> +The sysfs files are allocated in the SMpro root fs folder.
>> +There is one root folder for each SMpro instance.
>> +
>> +When the SoC is turned off, the driver will fail to read registers
>> +and return -ENXIO.
>> +
>> +Sysfs entries
>> +-------------
>> +
>> +The following sysfs files are supported:
>> +
>> +* Ampere(R) Altra(R):
>> +
>> +============    =============   ======  ===============================================
>> +Name            Unit            Perm    Description
>> +temp1_input     milli Celsius   RO      SoC temperature
>> +temp2_input     milli Celsius   RO      Max temperature reported among SoC VRDs
>> +temp2_crit      milli Celsius   RO      SoC VRD HOT Threshold temperature
>> +temp3_input     milli Celsius   RO      Max temperature reported among DIMM VRDs
>> +temp4_input     milli Celsius   RO      Max temperature reported among Core VRDs
>> +temp5_input     milli Celsius   RO      Temperature of DIMM0 on CH0
>> +temp5_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
>> +temp6_input     milli Celsius   RO      Temperature of DIMM0 on CH1
>> +temp6_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
>> +temp7_input     milli Celsius   RO      Temperature of DIMM0 on CH2
>> +temp7_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
>> +temp8_input     milli Celsius   RO      Temperature of DIMM0 on CH3
>> +temp8_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
>> +temp9_input     milli Celsius   RO      Temperature of DIMM0 on CH4
>> +temp9_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
>> +temp10_input    milli Celsius   RO      Temperature of DIMM0 on CH5
>> +temp10_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
>> +temp11_input    milli Celsius   RO      Temperature of DIMM0 on CH6
>> +temp11_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
>> +temp12_input    milli Celsius   RO      Temperature of DIMM0 on CH7
>> +temp12_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
>> +temp13_input    milli Celsius   RO      Max temperature reported among RCA VRDs
>> +in0_input       milli Volts     RO      Core voltage
>> +in1_input       milli Volts     RO      SoC voltage
>> +in2_input       milli Volts     RO      DIMM VRD1 voltage
>> +in3_input       milli Volts     RO      DIMM VRD2 voltage
>> +in4_input       milli Volts     RO      RCA VRD voltage
>> +cur1_input      milli Amperes   RO      Core VRD current
>> +cur2_input      milli Amperes   RO      SoC VRD current
>> +cur3_input      milli Amperes   RO      DIMM VRD1 current
>> +cur4_input      milli Amperes   RO      DIMM VRD2 current
>> +cur5_input      milli Amperes   RO      RCA VRD current
>> +power1_input    micro Watts     RO      Core VRD power
>> +power2_input    micro Watts     RO      SoC VRD power
>> +power3_input    micro Watts     RO      DIMM VRD1 power
>> +power4_input    micro Watts     RO      DIMM VRD2 power
>> +power5_input    micro Watts     RO      RCA VRD power
>> +============    =============   ======  ===============================================
>> +
>> +Example::
>> +
>> +    # cat in0_input
>> +    830
>> +    # cat temp1_input
>> +    37000
>> +    # cat curr1_input
>> +    9000
>> +    # cat power5_input
>> +    19500000
>   
> The documentation above can be improved (both grammar and formatting):
> 
> ---- >8 ----
> 
> diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
> index 3a9b14dacf8975..fb7b3665735bba 100644
> --- a/Documentation/hwmon/smpro-hwmon.rst
> +++ b/Documentation/hwmon/smpro-hwmon.rst
> @@ -7,39 +7,39 @@ Supported chips:
>   
>     * Ampere(R) Altra(R)
>   
> -    Prefix: 'smpro'
> +    Prefix: ``smpro``
>   
> -    Reference: Altra SoC BMC Interface Specification
> +    Reference: `Altra SoC BMC Interface Specification`
>   
>   Author: Thu Nguyen <thu@os.amperecomputing.com>
>   
>   Description
>   -----------
> -This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
> -SMpro co-processor (SMpro).
> -The following sensor types are supported by the driver:
> +The smpro-hwmon driver supports hardware monitoring for Ampere(R) Altra(R)
> +SoCs based on the SMpro co-processor (SMpro).  The following sensor metrics
> +are supported by the driver:
>   
>     * temperature
>     * voltage
>     * current
>     * power
>   
> -The SMpro interface provides the registers to query the various sensors and
> +The interface provides the registers to query the various sensors and
>   their values which are then exported to userspace by this driver.
>   
>   Usage Notes
>   -----------
>   
> -SMpro hwmon driver creates at least two sysfs files for each sensor.
> +The driver creates at least two sysfs files for each sensor.
>   
> -* File ``<sensor_type><idx>_label`` reports the sensor label.
> -* File ``<sensor_type><idx>_input`` returns the sensor value.
> +* ``<sensor_type><idx>_label`` reports the sensor label.
> +* ``<sensor_type><idx>_input`` returns the sensor value.
>   
> -The sysfs files are allocated in the SMpro root fs folder.
> -There is one root folder for each SMpro instance.
> +The sysfs files are allocated in the SMpro rootfs folder, with one root
> +directory for each instance.
>   
> -When the SoC is turned off, the driver will fail to read registers
> -and return -ENXIO.
> +When the SoC is turned off, the driver will fail to read registers and
> +return ``-ENXIO``.
>   
>   Sysfs entries
>   -------------
> @@ -48,48 +48,49 @@ The following sysfs files are supported:
>   
>   * Ampere(R) Altra(R):
>   
> -============    =============   ======  ===============================================
> -Name            Unit            Perm    Description
> -temp1_input     milli Celsius   RO      SoC temperature
> -temp2_input     milli Celsius   RO      Max temperature reported among SoC VRDs
> -temp2_crit      milli Celsius   RO      SoC VRD HOT Threshold temperature
> -temp3_input     milli Celsius   RO      Max temperature reported among DIMM VRDs
> -temp4_input     milli Celsius   RO      Max temperature reported among Core VRDs
> -temp5_input     milli Celsius   RO      Temperature of DIMM0 on CH0
> -temp5_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp6_input     milli Celsius   RO      Temperature of DIMM0 on CH1
> -temp6_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp7_input     milli Celsius   RO      Temperature of DIMM0 on CH2
> -temp7_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp8_input     milli Celsius   RO      Temperature of DIMM0 on CH3
> -temp8_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp9_input     milli Celsius   RO      Temperature of DIMM0 on CH4
> -temp9_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp10_input    milli Celsius   RO      Temperature of DIMM0 on CH5
> -temp10_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp11_input    milli Celsius   RO      Temperature of DIMM0 on CH6
> -temp11_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp12_input    milli Celsius   RO      Temperature of DIMM0 on CH7
> -temp12_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp13_input    milli Celsius   RO      Max temperature reported among RCA VRDs
> -in0_input       milli Volts     RO      Core voltage
> -in1_input       milli Volts     RO      SoC voltage
> -in2_input       milli Volts     RO      DIMM VRD1 voltage
> -in3_input       milli Volts     RO      DIMM VRD2 voltage
> -in4_input       milli Volts     RO      RCA VRD voltage
> -cur1_input      milli Amperes   RO      Core VRD current
> -cur2_input      milli Amperes   RO      SoC VRD current
> -cur3_input      milli Amperes   RO      DIMM VRD1 current
> -cur4_input      milli Amperes   RO      DIMM VRD2 current
> -cur5_input      milli Amperes   RO      RCA VRD current
> -power1_input    micro Watts     RO      Core VRD power
> -power2_input    micro Watts     RO      SoC VRD power
> -power3_input    micro Watts     RO      DIMM VRD1 power
> -power4_input    micro Watts     RO      DIMM VRD2 power
> -power5_input    micro Watts     RO      RCA VRD power
> -============    =============   ======  ===============================================
> +  ============    =============  ======  ===============================================
> +  Name            Unit           Perm    Description
> +  ============    =============  ======  ===============================================
> +  temp1_input     millicelsius   RO      SoC temperature
> +  temp2_input     millicelsius   RO      Max temperature reported among SoC VRDs
> +  temp2_crit      millicelsius   RO      SoC VRD HOT Threshold temperature
> +  temp3_input     millicelsius   RO      Max temperature reported among DIMM VRDs
> +  temp4_input     millicelsius   RO      Max temperature reported among Core VRDs
> +  temp5_input     millicelsius   RO      Temperature of DIMM0 on CH0
> +  temp5_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp6_input     millicelsius   RO      Temperature of DIMM0 on CH1
> +  temp6_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp7_input     millicelsius   RO      Temperature of DIMM0 on CH2
> +  temp7_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp8_input     millicelsius   RO      Temperature of DIMM0 on CH3
> +  temp8_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp9_input     millicelsius   RO      Temperature of DIMM0 on CH4
> +  temp9_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp10_input    millicelsius   RO      Temperature of DIMM0 on CH5
> +  temp10_crit     millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp11_input    millicelsius   RO      Temperature of DIMM0 on CH6
> +  temp11_crit     millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp12_input    millicelsius   RO      Temperature of DIMM0 on CH7
> +  temp12_crit     millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp13_input    millicelsius   RO      Max temperature reported among RCA VRDs
> +  in0_input       millivolts     RO      Core voltage
> +  in1_input       millivolts     RO      SoC voltage
> +  in2_input       millivolts     RO      DIMM VRD1 voltage
> +  in3_input       millivolts     RO      DIMM VRD2 voltage
> +  in4_input       millivolts     RO      RCA VRD voltage
> +  cur1_input      milliamperes   RO      Core VRD current
> +  cur2_input      milliamperes   RO      SoC VRD current
> +  cur3_input      milliamperes   RO      DIMM VRD1 current
> +  cur4_input      milliamperes   RO      DIMM VRD2 current
> +  cur5_input      milliamperes   RO      RCA VRD current
> +  power1_input    microwatts     RO      Core VRD power
> +  power2_input    microwatts     RO      SoC VRD power
> +  power3_input    microwatts     RO      DIMM VRD1 power
> +  power4_input    microwatts     RO      DIMM VRD2 power
> +  power5_input    microwatts     RO      RCA VRD power
> +  ============    =============  ======  ===============================================
>   
> -Example::
> +  Example::
>   
>       # cat in0_input
>       830
> 

Thank you Bagas, will apply in next version.
- Quan
