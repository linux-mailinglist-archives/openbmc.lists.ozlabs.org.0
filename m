Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 848135F6208
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:50:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjkBG21KRz3c38
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:50:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GmNNlRIV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.135; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GmNNlRIV;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2135.outbound.protection.outlook.com [40.107.94.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjk6X3Glyz3bjH
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:47:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGJi3DUmTPERawMAL1eIwdRME+hY8hxsjO7i31+XVCd2nrvjhg2sDUW9aeRN1oVDV9y5N9d9o9XUuN7soqH38l8Q8esyGSYjvOvAAVg4yTUTTVKdzq9OebvRyW3XFJGDXFeNZxBL3ZR49/fSMpUrfjioSjDFfiqilkf9xDtNn42QX2XnPzIKL2LqrahZ78EAEovrwID69YYq4l0ZM1hJz8tiRpd8D7di87Y2AJANIFpxlUVBFL22vRhxyNSiu2ZsJf3YG3tk29FAsL30ZgvlyTAhRoenEnoeA9UfV3w1yM5ExBn5Y0QWeZ3LinT17O4HOSsZVXpVCTT1xW6CwwaaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFKNihARPcKK/KrJCsuGFuKWkO+V2CuuU76bTyfcWpI=;
 b=oar/y8R8SIrXFf5vFNyfJk4Ll7ZDYJpqjazVcVM9gG+O1V1LKJurMIBEpRZHvjD5XaHK8P+jlZ2bCDrScDgBuZYh0OBAdeTmSMATwvz42++36TiLlm6c1QEPxU7tS6k9NimAN3lQoM9aqdD16yubMgFG5KytZ+KyewcHPt6YLwx3lfaRxYGuqXBiBCcjuYMBEb3GNpTqUOvja+1PRDPSNRYMyLU2i6W3Rsez98+pRdqZrsKRA77Izzu7klCMhwYGR7j48xCFJCRz0R8IUMe+LyGanagaVsBZohCyTsBASNqnSp2z/+bpgmqzZhI74YmMOrhgiB7KMAcVabXeiNZJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFKNihARPcKK/KrJCsuGFuKWkO+V2CuuU76bTyfcWpI=;
 b=GmNNlRIVqoAJjp2YcNd98LvzsaMu8/JZ8n94nhT67QO+C2QnUBoBGi7bkMK9G8o/1j8jcvh38xkFiDQucjceNfNbr3xoyfeuunZTQRZRN3KgIuwguWCm/tVE6iwMwT4xJBu9/mKJK3rAixDlTF5pmbvzcjZducDaD29yyPFGAsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BY5PR01MB5796.prod.exchangelabs.com (2603:10b6:a03:1be::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Thu, 6 Oct 2022 07:46:41 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:46:41 +0000
Message-ID: <94b4f0f2-d19e-0574-6a49-3689a7b972b1@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:46:29 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 9/9] docs: ABI: testing: Document the Ampere Altra
 Family's SMpro sysfs interfaces
Content-Language: en-CA
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-10-quan@os.amperecomputing.com>
 <Yza5AyTDyM5yo7HG@debian.me>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <Yza5AyTDyM5yo7HG@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BY5PR01MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 522b46f6-6f96-400f-bb14-08daa76ee826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Tv6suOvTEbzy/Nn4NFzd8Y2mdaYEQcKuSPZ3USOVNluviznoqt0tDYmkw0ThsYh8oW8YUG5lpNDKa6qryWWZBSQd0QV7I/MCCuxA8VJqXTGbASRoOOtwZOyBtjO4NUFmJR0q8JzWbm+ezmjdGJ5IjF57QksFFp1C3zSDSM+Uf51U0FsU6ET1/fFZtnS87lIEQt0KMKTZ0DruSMUoMOsHEDBzipMo7lTWD5+2SmqcmidijdBx2tJCyn4rUTJRCtnPlYIugPb7vRKBZLQe9T84+M+WKNVyEwXtkUWN2N/sv+YePrNNUmWmzp6tKeJ9cs5MKk6JrREG1EDClBm1eYx9diL1j+SpBKTBJxW8xfaGcFypx2kYF5SEhyHp9xl3o+OcCnMcPdIEQ/K69A1bNDpFd2MX1y+Y2S1/fdW+QoE5jc3oMCNGkQ9dgjF0FQ4Ic0mYCBzZUGCNhyWKEPYHlGuRHSNb29/JDD2Kx/f4Nhjp8dTYtBWFpfszwkle4aheXRJQkbYBYzxz8CbAX1mQsL202Qb7FCsfvZwLEN+yWp8flzj/S12KmXJpxlxtg6QRV8Bvq+m3wfYIYsReFXe61Djv7v+XObTL8jJfdY527btzZKiltx2b5MPKhYXCgR1dGGmYNOEJ5TQmv4CrsvlgFPgLMWhAmNLCjJ1tEVgRGw22itnuH7exlrmWRCKY2JTFBIT2DFfXMqkXTDrms/Z/4snkiyZ32RH5/GPCqoePellGba37cEv6skv92Nml92oC+Z9dMIsyTUdmV2UbW8GgM51bLugSvZWaUjGb0C7Vc7Dm/vM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(451199015)(38350700002)(31686004)(186003)(478600001)(38100700002)(6486002)(54906003)(31696002)(30864003)(7416002)(83380400001)(66556008)(41300700001)(316002)(66476007)(2616005)(8676002)(6666004)(6916009)(107886003)(86362001)(6512007)(8936002)(26005)(5660300002)(53546011)(66946007)(52116002)(4326008)(6506007)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?QkljbzFLRCs5Qy9PNG56UCtUcC9VNWcwMGtla0xkTENEQXlTU1NqYitzL2xS?=
 =?utf-8?B?QjN2cjZldWhTOGZjOTZQSXVJWXNjc1VUYlBkRkVISXhNM2VYdThaS1ovd0NS?=
 =?utf-8?B?OHFZZnc0Z0x5bFRBaE1BTEdvcW1PaDV0MWEyTHhjWjFrVTNDWlhIR2c3VkFx?=
 =?utf-8?B?KzQycmxvVU9tNG00Q0ZuNXYxMFdSaVRLdVI4TU9hSS94cHp6ZUg5eTE3SjNY?=
 =?utf-8?B?cThtN3kwWDJrSXppTEk1elhyNmg3c1p4aWJNQWdyQ3d6T3FwM1ZHSG5QRVNZ?=
 =?utf-8?B?VmlVNmtDMFVRZjlOWGd4Ym1oMTFraVhncS9oTWR0YnJHM2loZ1FDVVdIK3Ji?=
 =?utf-8?B?TVZxcnB3Ympwbzl2YnJ3YmlkQ3Q1RUJiRENYVFJNM3F5QTd0ODhrenQvSllE?=
 =?utf-8?B?cTZSUFFCWmdaYkRlLzBjTTduM1FBaGI1Tm9MZFdQMkhhUGdhYnB4TEF2MkRT?=
 =?utf-8?B?MTBsV0Z1UitSUHFvQmcrS3kvNzZPRUtmQ3NxTk4xakZsck95VjFoNy9LNnVq?=
 =?utf-8?B?UDkxc2lHRVpDcmNldk9weDBORTIxMHN5bURRaE82YXNSWmVDc0JnOEhjcWJx?=
 =?utf-8?B?blYrdFF2eFVHREZxUW5vK0RSKytaM05XUm81Z2pxdE1WbTZacGJ6Zm1odTJM?=
 =?utf-8?B?ZjV0RnM0cWxnUGlVU09lSklMdFhjZTF6Y1VhSnNDZ1dBSGtwQkFQQXkrTnFE?=
 =?utf-8?B?eVI4ZW50aVFiOTNlaHNnL2N5bGJMMjNDWWh3REdYc1ptSDhIWTRXMlphVDV1?=
 =?utf-8?B?ZEx6clRKVytwUVhDWHE0L2d4UTdGbU9FTmxyNXlPNFFJcXU0SGVOUlJEaHVm?=
 =?utf-8?B?RVNjS29ZK0xyRWNJS0NxYXhIcGJEQmdXWmhuWXVqVk1acmJPSVNOZnNHaTha?=
 =?utf-8?B?Z2xIeGlsWUFWL1BZd3ltVGtOM1ZVcVg3czR0V0hzSHZCUUd3OXFpYUxTeUxp?=
 =?utf-8?B?dFo5dmp1UkJzNmlkYzBSb2l2YUVlSzlaSE5FTDdNSUU5UlN0SzRkcWh2dVpI?=
 =?utf-8?B?dGthOHM2alJYY1pGNThjaE5iQmx1Ry8wdys1eXFvamdrYkpmN2dHYXRHUVFm?=
 =?utf-8?B?MzZyQk0wZHh0eklRWHVPV3F4cHAxdnJRQnJvZHMrVTdEOUkyM0tiQStoUE1N?=
 =?utf-8?B?S01tNThzRkR0djJOQXlKWk9tRlVIUkpDQ1lsejVJMDN3YnQzanV5dWVWa00x?=
 =?utf-8?B?OWZaVWQwR21rWU14TnU1MTdpZ215TXB1eDZKZ3VzMUUyMUx5Sm8vR1pnVDQx?=
 =?utf-8?B?RGZ2QkNTWU5ZdDdBbUswNVE3NzdrcCtQbkNRT2w3ZEMrOCswWFFQV25Pa0VV?=
 =?utf-8?B?a1lmTzVNNHUrSGR5WmhtS0tFb2k5Ui91bVhBaVpBcmN1b2YzNWRkZDNQbnhK?=
 =?utf-8?B?VlVwVFZ0Mzk5a3dUZGhqR21QMTVlNi9sU1BlYXNmeit5TXYrMnljVDdoN0dk?=
 =?utf-8?B?aGczelZzdmZYWlpyVlNnRW5YZitzbWlka3RnOTB3VS9pTUZ0d0NVMWFuUG9S?=
 =?utf-8?B?WG9MdWVCUHVuV2kwa1hyWXpwbjNjdGthVjFoYW5qOGtodExheDU3cy8rU0cv?=
 =?utf-8?B?UFZ4anhBVG1sZm1mUUloU245aWVoOEM3czB5aUcxTVVuWGl4MDI0TEpYUUUv?=
 =?utf-8?B?T3JXUVFkN1FhVmVUOGZBSzBGY09EbllqZG1MWTUrT214REpVay9VazkxL2lC?=
 =?utf-8?B?TmhrTjlMdjQvV1NPS3JCUmRkNFZSSnlVYmx6WllNOEpsdCtPRVZrQnp0S2hm?=
 =?utf-8?B?dDZHeTlKdG0wQkN4NHRnelBPZmlHeVlmNWlmMTNVUzBocVBmTWpmQi9DRzdJ?=
 =?utf-8?B?NVU3bThxQVN0MFhRWHNvNVlDR3R2NTJtUlFueHRHc09OZkcvUGlvdjZ6a0xL?=
 =?utf-8?B?VUE2WWdMQ2NQYkN6S3ZNZDJxR05CMzlqV01QVWhHODJGY2FtVXFmelFCNGFu?=
 =?utf-8?B?bVZnckQ0clgwcUx2WTkzbTkybEdwTlNScVJpTU81bmE2MkU1VmdQNDU1bFdo?=
 =?utf-8?B?bU9hWHh2a1NhS2hOWnBOZzAxUXNhb3Mvam1IOVBPaEhFQm5UbUJFZVZMVG4y?=
 =?utf-8?B?ZVlBK1JBejc5QTFOZGdSekYrRkFUeWZhbE4yNVVldHV6NkxNRmxwUk10Yjla?=
 =?utf-8?B?OStnV0M0eDRTK1Fhcmh4ck1oS2VPS211NUpEbFpoOTcwbGJzQ0Q0QWp6cmw5?=
 =?utf-8?Q?YaWFsFqsWc41k3UW644SgC8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522b46f6-6f96-400f-bb14-08daa76ee826
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:46:41.1471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BF0pHUAQmYbQlKjy0WNvlex8rngJJY1P72H1LnHAtI58pz5Iq12rgAeqzkxYTjkcAY9Ep5LdmM90sGoYjIyYLuK3A2//GENuIVUQSgbhHJo=
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



On 30/09/2022 16:38, Bagas Sanjaya wrote:
> On Thu, Sep 29, 2022 at 04:43:21PM +0700, Quan Nguyen wrote:
>> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>> new file mode 100644
>> index 000000000000..d8f82a06570d
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>> @@ -0,0 +1,125 @@
>> +What:		/sys/bus/platform/devices/smpro-errmon.*/error_[core|mem|pcie|other]_[ce|ue]
>> +KernelVersion:	5.18
>> +Contact:	quan@os.amperecomputing.com
>> +Description:
>> +		(RO) Contains the 48-byte Ampere (Vendor-Specific) Error Record printed
>> +		in hex format.
>> +
>> +		The detail of each sysfs entries is as below:
>> +		+-------------+---------------------------------------------------------+
>> +		|   Error     |                   Sysfs entry                           |
>> +		+-------------+---------------------------------------------------------+
>> +		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ce |
>> +		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ue |
>> +		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ce  |
>> +		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ue  |
>> +		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ce |
>> +		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ue |
>> +		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ce|
>> +		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ue|
>> +		+-------------+---------------------------------------------------------+
>> +		UE: Uncorrect-able Error
>> +		CE: Correct-able Error
>> +
>> +		See section 3.3 Ampere (Vendor-Specific) Error Record Formats,
>> +		Altra Family RAS Supplement.
>> +
>> +
>> +What:		/sys/bus/platform/devices/smpro-errmon.*/overflow_[core|mem|pcie|other]_[ce|ue]
>> +KernelVersion:	5.18
>> +Contact:	quan@os.amperecomputing.com
>> +Description:
>> +		(RO) Return the overflow status of each type HW error reported:
>> +		  0      : No overflow
>> +		  1      : There is an overflow and the oldest HW errors are dropped
>> +
>> +		The detail of each sysfs entries is as below:
>> +		+-------------+-----------------------------------------------------------+
>> +		|   Overflow  |                   Sysfs entry                             |
>> +		+-------------+-----------------------------------------------------------+
>> +		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_ce |
>> +		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_ue |
>> +		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ce  |
>> +		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ue  |
>> +		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_ce |
>> +		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_ue |
>> +		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_ce|
>> +		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_ue|
>> +		+-------------+-----------------------------------------------------------+
>> +		UE: Uncorrect-able Error
>> +		CE: Correct-able Error
>> +
>> +What:           /sys/bus/platform/devices/smpro-errmon.*/[error|warn]_[smpro|pmpro]
>> +KernelVersion:	5.18
>> +Contact:	quan@os.amperecomputing.com
>> +Description:
>> +		(RO) Contains the internal firmware error/warning printed as hex format.
>> +
>> +		The detail of each sysfs entries is as below:
>> +		+---------------+------------------------------------------------------+
>> +		|   Error       |                   Sysfs entry                        |
>> +		+---------------+------------------------------------------------------+
>> +		| SMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_smpro |
>> +		| SMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_smpro  |
>> +		| PMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_pmpro |
>> +		| PMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_pmpro  |
>> +		+---------------+------------------------------------------------------+
>> +		See more details in section 5.10 RAS Internal Error Register Definitions,
>> +		Altra Family Soc BMC Interface Specification.
>> +
>> +What:           /sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn_fault|vrd_hot|dimm_hot]
>> +KernelVersion:	5.18
>> +Contact:	quan@os.amperecomputing.com
>> +Description:
>> +		(RO) Contains the detail information in case of VRD/DIMM warning/hot events
>> +		in hex format as below:
>> +
>> +		AAAA
>> +		Where:
>> +		  AAAA: The event detail information data
>> +
>> +		See more details in section 5.7 GPI Status Registers,
>> +		Altra Family Soc BMC Interface Specification.
>> +
>> +
>> +What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
>> +KernelVersion:	5.18
>> +Contact:	quan@os.amperecomputing.com
>> +Description:
>> +		(RO) Contains the boot stages information in hex as format below:
>> +
>> +		AABBCCCCCCCC
>> +		Where:
>> +		  AA      : The boot stages
>> +		              00: SMpro firmware booting
>> +		              01: PMpro firmware booting
>> +		              02: ATF BL1 firmware booting
>> +		              03: DDR initialization
>> +		              04: DDR training report status
>> +		              05: ATF BL2 firmware booting
>> +		              06: ATF BL31 firmware booting
>> +		              07: ATF BL32 firmware booting
>> +		              08: UEFI firmware booting
>> +		              09: OS booting
>> +		  BB      : Boot status
>> +		              00: Not started
>> +		              01: Started
>> +		              02: Completed without error
>> +		              03: Failed.
>> +		  CCCCCCCC: Boot status information defined for each boot stages
>> +
>> +		See more details in section 5.11 Boot Stage Register Definitions,
>> +		and section 6. Processor Boot Progress Codes, Altra Family Soc BMC
>> +		Interface Specification.
>> +
>> +
>> +What:           /sys/bus/platform/devices/smpro-misc*/soc_power_limit
>> +KernelVersion:	5.18
>> +Contact:	quan@os.amperecomputing.com
>> +Description:
>> +		(RW) Contains the desired SoC power limit in Watt.
>> +		Writes to this sysfs set the desired SoC power limit (W).
>> +		Reads from this register return the current SoC power limit (W).
>> +		The value ranges:
>> +		  Minimum: 120 W
>> +		  Maximum: Socket TDP power
> 
> The documentation above produces htmldocs warnings:
> 
> Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro:71: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro:117: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro:86: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro:86: WARNING: Definition list ends without a blank line; unexpected unindent.
> 
> I have applied the fixup (with fixes to technical references):
> 
> ---- >8 ----
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> index d8f82a06570d88..39cf222fb6510a 100644
> --- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> +++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> @@ -6,23 +6,32 @@ Description:
>   		in hex format.
>   
>   		The detail of each sysfs entries is as below:
> +
>   		+-------------+---------------------------------------------------------+
>   		|   Error     |                   Sysfs entry                           |
>   		+-------------+---------------------------------------------------------+
> -		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ce |
> -		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ue |
> -		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ce  |
> -		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ue  |
> -		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ce |
> -		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ue |
> -		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ce|
> -		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ue|
> +		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ce  |
>   		+-------------+---------------------------------------------------------+
> +		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ue  |
> +		+-------------+---------------------------------------------------------+
> +		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ce   |
> +		+-------------+---------------------------------------------------------+
> +		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ue   |
> +		+-------------+---------------------------------------------------------+
> +		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ce  |
> +		+-------------+---------------------------------------------------------+
> +		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ue  |
> +		+-------------+---------------------------------------------------------+
> +		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ce |
> +		+-------------+---------------------------------------------------------+
> +		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ue |
> +		+-------------+---------------------------------------------------------+
> +
>   		UE: Uncorrect-able Error
>   		CE: Correct-able Error
>   
> -		See section 3.3 Ampere (Vendor-Specific) Error Record Formats,
> -		Altra Family RAS Supplement.
> +		For details, see section `3.3 Ampere (Vendor-Specific) Error Record Formats,
> +		Altra Family RAS Supplement`.
>   
>   
>   What:		/sys/bus/platform/devices/smpro-errmon.*/overflow_[core|mem|pcie|other]_[ce|ue]
> @@ -30,24 +39,36 @@ KernelVersion:	5.18
>   Contact:	quan@os.amperecomputing.com
>   Description:
>   		(RO) Return the overflow status of each type HW error reported:
> -		  0      : No overflow
> -		  1      : There is an overflow and the oldest HW errors are dropped
> +
> +		  - 0      : No overflow
> +		  - 1      : There is an overflow and the oldest HW errors are dropped
>   
>   		The detail of each sysfs entries is as below:
> +
>   		+-------------+-----------------------------------------------------------+
>   		|   Overflow  |                   Sysfs entry                             |
>   		+-------------+-----------------------------------------------------------+
>   		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_ce |
> +		+-------------+-----------------------------------------------------------+
>   		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_ue |
> +		+-------------+-----------------------------------------------------------+
>   		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ce  |
> +		+-------------+-----------------------------------------------------------+
>   		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ue  |
> +		+-------------+-----------------------------------------------------------+
>   		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_ce |
> +		+-------------+-----------------------------------------------------------+
>   		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_ue |
> +		+-------------+-----------------------------------------------------------+
>   		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_ce|
> +		+-------------+-----------------------------------------------------------+
>   		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_ue|
>   		+-------------+-----------------------------------------------------------+
> -		UE: Uncorrect-able Error
> -		CE: Correct-able Error
> +
> +		where:
> +
> +		  - UE: Uncorrect-able Error
> +		  - CE: Correct-able Error
>   
>   What:           /sys/bus/platform/devices/smpro-errmon.*/[error|warn]_[smpro|pmpro]
>   KernelVersion:	5.18
> @@ -56,61 +77,74 @@ Description:
>   		(RO) Contains the internal firmware error/warning printed as hex format.
>   
>   		The detail of each sysfs entries is as below:
> +
>   		+---------------+------------------------------------------------------+
>   		|   Error       |                   Sysfs entry                        |
>   		+---------------+------------------------------------------------------+
>   		| SMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_smpro |
> +		+---------------+------------------------------------------------------+
>   		| SMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_smpro  |
> +		+---------------+------------------------------------------------------+
>   		| PMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_pmpro |
> +		+---------------+------------------------------------------------------+
>   		| PMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_pmpro  |
>   		+---------------+------------------------------------------------------+
> -		See more details in section 5.10 RAS Internal Error Register Definitions,
> -		Altra Family Soc BMC Interface Specification.
> +
> +		For details, see section `5.10 RAS Internal Error Register Definitions,
> +		Altra Family Soc BMC Interface Specification`.
>   
>   What:           /sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn_fault|vrd_hot|dimm_hot]
>   KernelVersion:	5.18
>   Contact:	quan@os.amperecomputing.com
>   Description:
>   		(RO) Contains the detail information in case of VRD/DIMM warning/hot events
> -		in hex format as below:
> +		in hex format as below::
>   
> -		AAAA
> -		Where:
> -		  AAAA: The event detail information data
> +		    AAAA
>   
> -		See more details in section 5.7 GPI Status Registers,
> -		Altra Family Soc BMC Interface Specification.
> +		where:
> +
> +		  - ``AAAA``: The event detail information data
> +
> +		For more details, see section `5.7 GPI Status Registers,
> +		Altra Family Soc BMC Interface Specification`.
>   
>   
>   What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
>   KernelVersion:	5.18
>   Contact:	quan@os.amperecomputing.com
>   Description:
> -		(RO) Contains the boot stages information in hex as format below:
> +		(RO) Contains the boot stages information in hex as format below::
>   
> -		AABBCCCCCCCC
> -		Where:
> -		  AA      : The boot stages
> -		              00: SMpro firmware booting
> -		              01: PMpro firmware booting
> -		              02: ATF BL1 firmware booting
> -		              03: DDR initialization
> -		              04: DDR training report status
> -		              05: ATF BL2 firmware booting
> -		              06: ATF BL31 firmware booting
> -		              07: ATF BL32 firmware booting
> -		              08: UEFI firmware booting
> -		              09: OS booting
> -		  BB      : Boot status
> -		              00: Not started
> -		              01: Started
> -		              02: Completed without error
> -		              03: Failed.
> -		  CCCCCCCC: Boot status information defined for each boot stages
> +		    AABBCCCCCCCC
>   
> -		See more details in section 5.11 Boot Stage Register Definitions,
> -		and section 6. Processor Boot Progress Codes, Altra Family Soc BMC
> -		Interface Specification.
> +		where:
> +
> +		  - ``AA``      : The boot stages
> +
> +		    - 00: SMpro firmware booting
> +		    - 01: PMpro firmware booting
> +		    - 02: ATF BL1 firmware booting
> +		    - 03: DDR initialization
> +		    - 04: DDR training report status
> +		    - 05: ATF BL2 firmware booting
> +		    - 06: ATF BL31 firmware booting
> +		    - 07: ATF BL32 firmware booting
> +		    - 08: UEFI firmware booting
> +		    - 09: OS booting
> +
> +		  - ``BB``      : Boot status
> +
> +		    - 00: Not started
> +		    - 01: Started
> +		    - 02: Completed without error
> +		    - 03: Failed.
> +
> +		  - ``CCCCCCCC``: Boot status information defined for each boot stages
> +
> +		For details, see section `5.11 Boot Stage Register Definitions`
> +		and section `6. Processor Boot Progress Codes, Altra Family Soc BMC
> +		Interface Specification`.
>   
>   
>   What:           /sys/bus/platform/devices/smpro-misc*/soc_power_limit
> @@ -121,5 +155,6 @@ Description:
>   		Writes to this sysfs set the desired SoC power limit (W).
>   		Reads from this register return the current SoC power limit (W).
>   		The value ranges:
> -		  Minimum: 120 W
> -		  Maximum: Socket TDP power
> +
> +		  - Minimum: 120 W
> +		  - Maximum: Socket TDP power
> 

Will apply in next version.
And thank you a lot for the details changes.

Thank you,
- Quan
