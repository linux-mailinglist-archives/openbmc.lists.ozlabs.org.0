Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E88BBFFE
	for <lists+openbmc@lfdr.de>; Sun,  5 May 2024 12:09:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=M7D0bmi2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXKyY5dVbz3bwL
	for <lists+openbmc@lfdr.de>; Sun,  5 May 2024 20:09:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=M7D0bmi2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2415::700; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXKxy4SmFz30Np
	for <openbmc@lists.ozlabs.org>; Sun,  5 May 2024 20:08:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKZC+8BCUMjhd5wXKiKgo4OW6eMIDlsSpjlM4FIlvbdgrF+xPV9z6VLsFjEVimLDYn3ScvYlpnOJ/Z88mZrxcmDqsPXUXrGM4e0JN2qxqlxKlvHaHrcPwUBcNp7vAMwubRmcVpZ6T3oh2TIArlBWHlk910ghLxk5jyaIDATi8pBTOgwiQQOuVmAcXRc5k+51IH4O7q1aNppzJBd/0MqEKnXu/e5lG3oUnEzuaqOxjNkR7aDqi0heI+UJUUyQa+4vpbWf9HhGFv6HoJmbKjnQgqKrZ1abYrGzlo2kN5ide6vILwDbmHZTBLRPLuZFTIH+Vh6GzsWAD0HqyNPTbk6Tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5pipOz/4xBDRXVq7KDNuBmnPewEO01r0h9MchghJi4=;
 b=apVjAUtCDv2dXYdIs/0dBaSNadKgEm8qiau9KE2r3ng+iBPOcpw9HYB16cXrWPJbUId3t6oh87uVsA+1D2J2I2nIICQX/Wu11ccDa5awY2uvG+SkG8pEkvcoLtVxJOlp5uz3uKMcrQv7V+6TXQYbjjNlNZvYFxsa/bwS5vSI2ORHvdf+6MkaITXw4jR3Im7pHJztwQQQ4rFLieX3uD+HqKVimAH2t+xTWb5w/qGymson9I/AfY0xVkqcjx47DuXGeT0f3D+E0LP4+CLajCyUpW40j+Roljx2jWJQX5+fvPu8ycI+aBp+H54QV9YuSz/6BdbvPV0h81qfHqUZeCspoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5pipOz/4xBDRXVq7KDNuBmnPewEO01r0h9MchghJi4=;
 b=M7D0bmi2ZM0LtbaAkHqbcrn8YyQYveanhx+/JVO4ZT+EWhhFpxQ9zvjGGW2Dhc13KkBQDKoWAmCNX0SRI1BA3IjY7kEZHtjPTclBMujYzTYicXRylhhtGphktOtp/D0F/grb54aZbKKwZ0zT8PCWzLXkelRh+jjikdlibpY/hrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 IA0PR01MB8277.prod.exchangelabs.com (2603:10b6:208:48e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.24; Sun, 5 May 2024 10:08:29 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::919c:7d6a:2069:b0ca]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::919c:7d6a:2069:b0ca%3]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 10:08:28 +0000
Message-ID: <0dcc8788-604a-49c1-8c6b-fdbfa9192039@amperemail.onmicrosoft.com>
Date: Sun, 5 May 2024 17:08:15 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
 <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
 <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
 <20240423-gallantly-slurp-24adbfbd6f09@spud>
 <ab5cfd8c-0e88-4194-a77e-5ffbb6890319@amperemail.onmicrosoft.com>
 <396b47f5-9604-44ab-881f-94d0664bcab8@roeck-us.net>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <396b47f5-9604-44ab-881f-94d0664bcab8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:610:4c::31) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|IA0PR01MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: dc41bc7d-d0bf-4389-a396-08dc6ceb4e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?dzdzL0p0dTVXUFJTTXVUT2RzdmZIdmd3b0pWWm8zTWxIOTFSOWU4c3RaOE5y?=
 =?utf-8?B?S2lGcGxSd2REQUYxalo5VFluTWxFV2Q2UWhPdEpVWXAxQXhTeTJaNzdKWFk1?=
 =?utf-8?B?NVpOeG1DYmFkN2h0SlFDa3lVd2tPUDRwNFVocUFXZXVoN1k1cCtnV2g4emNr?=
 =?utf-8?B?VUtGZDA3d1ZZeC9lSlJ0UkhTM2pOU1JoeUQ3RE9XdnBKT3N2VzBSUS9IN29I?=
 =?utf-8?B?Ump3Qm5DZjdPMXM0MGZoUFRQekhhem5hUXg0aG9BbGlQLzY5U3ppUkZwbHBM?=
 =?utf-8?B?OVdZcjgzSFd1MXlvcUN2c0lHbmVKZTBSb2pZM0R1ZzJBd1JBYzNvbkJLb1Qz?=
 =?utf-8?B?NmV4OTIzbU5VTGoyMU1NSHJudUc0MjQzZzRKSlo3aDhSYldMZDhHRld5TlpJ?=
 =?utf-8?B?a0VNOW1sam9nZS9pOHBONDVHOERrVmZRMXNJakFoMFVwU1Q3SUdveWF0cHQv?=
 =?utf-8?B?RXFNOGFHU1RwUlZwS1dDQ0lQb1N5SlZvcDBGQzdYQkoxOEJOV0gwemg5WTBK?=
 =?utf-8?B?WUNNMVdvM0xEcFAzUnpmZ1pwYlNaL25CNmIyQzNNdkFGVytOOVU5anM3VGNX?=
 =?utf-8?B?bDVEV3g0ZW5menN3cWRjNUx4UVd4RFUxTWlua3BBa1dYQTFSYjFLUmFaempM?=
 =?utf-8?B?YXFKc3YyaE91VVhJNXM0RSs5MUZjS1Zzd1BwVE42MkhMNEd1d0kvbFNydjNa?=
 =?utf-8?B?M1haOFJFcXRTcHluNG0zNDlWVmNvZjdxSHgyYitzSU93UmF5ZVU5MVFNUnF6?=
 =?utf-8?B?TWpTV3QwdVN3ekNtc0xibFg2VVJUTDBWQ0NoZUtvYWxFYXUxcS84NmNRWUFD?=
 =?utf-8?B?UDc0Vkl3aS9MYlF4eXdpTklDR1p6OW9EaTVsSjFrdDVqOHlnby9QbVloVTNo?=
 =?utf-8?B?QjYybnh1SVBmZ1FORVBqck42N3NuZTVuR3JDOFlhZUFTNFVTU2tZRzl0SzUy?=
 =?utf-8?B?YURQWE9LNHQ1Ry9CczhzUFl4M2JQaWpjS29WMDZDdTNXanllWVMrM1lrbGhk?=
 =?utf-8?B?b3RlNkdvQ2cwZnIwWTdzMDZZczNSajloeWhnRnBGbnc0bXduZ3ZmTmFWNFNI?=
 =?utf-8?B?a3R0OXpYOVluZlZBR3haZ3JvNUM0NmRBOG9FTk54YVRRRXJuMmsyQmRGMGg5?=
 =?utf-8?B?NWFWRzJ1Y0xqd3RSSHp1RWpvaXdNZkNYdXhXeGpIMS9rVGpjQXFyS1MrSnEy?=
 =?utf-8?B?VGpiVVVLeFFGeDNsRzVkS1FLdG1wak1JVFh2Vmdyd0RFTWNYaDJBemo3aVh3?=
 =?utf-8?B?ZXhqY1NFaFJ2YjYrc2NZR01Ocks3c1VoU2xGdjV4ejB0MlV2UUhzWTFUWHJj?=
 =?utf-8?B?dmh4SXhpQ3U4MlpDYmNvbng3dDBLU25tdFJnbmhudXBLQ0xabDVlVFRsdXZ1?=
 =?utf-8?B?bW9lbzlySDMxZXJ2Tnh2bFJVd3VRWTU4bXlyTkREVTZtOUdZTmVaZTNGVWwv?=
 =?utf-8?B?RDlYWFVnVjl5c0N5UWwwalJVcjJ4UTl6YUsyT1lTR0FMR2RuaFlyMDJrK2pw?=
 =?utf-8?B?T213Q3U4MTE3cXgwY2I4RlJyRThiR3ZmNHkxNUQyTDJsbERCaURGR0FMZU9y?=
 =?utf-8?B?RDBPam11eXZGemFYajlBblJMUUwvSHN1ajRmWitZM1g0NlA2Tk5TVjBTM3Zj?=
 =?utf-8?Q?DzaKnmZ/9hpO4+NJ0n4HXrH1BAjG6FCMAhKM3B7vmrvM=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TmMzanhzVXU1TWpxcDJVZWJ6eTJETitSdXFFeUpoM1YwMFBTTEZMWit4SkhB?=
 =?utf-8?B?TnR4c1FrSjFBaWl0Y1FlZndsdjloTDVsOW1wZEdzS2VIVHFtTEp3ZTB0L2FK?=
 =?utf-8?B?bERxOUZGclhxQ0k3Ni9ZY1UydktUYkVqeFNEZG0yTGE5L3lmV2oya29ObmNw?=
 =?utf-8?B?alRQalFxWVpjZytqRGRwUk9yQWtwM2h3S2ZSSlVnM25qK0ZDQnN6WHdOY005?=
 =?utf-8?B?R0xRV1E4M2tmSnZsOTdhcE4yN1JwbTNjR21oMHFtY1VXMGJQMzErb1FUdHRu?=
 =?utf-8?B?N1VqeFpUejlqNzZ5TWJPd3ZQbVhxT2xvRnpvbUF6bSt3dktaazZtOWJ4OW5y?=
 =?utf-8?B?UENxclcwZEUrN3ZHdHc2TkZlT2RNWllDanROdWErSDJWOGxzY1VSaDY4anA5?=
 =?utf-8?B?RmduSmMzbkRxNmZQbzlNbExEMmZQdEFhYVR1UXVjQ0dOUWI5WHQ4Q1NkOHJQ?=
 =?utf-8?B?ZTBIajBMVTM3NlBrV1V6eTdrMTBPL2FmZ25WYk1CeEd0SnQ4T0pCaCtrOUg2?=
 =?utf-8?B?L1dVRjhzZnJjbVp2ZVB0QU5SempRZzJIdFJjem5oaklLc05Eem9QS2JMSUt4?=
 =?utf-8?B?U3UzV3RES09vdloycjVOcVM5Y1JNT211cTBlVmdHWHJtWmZ4Rzl3TjZvaElz?=
 =?utf-8?B?MW5pWFNnL2NFek8vT3hEbytNYmFTTjg0YVJ1UkNvR0JpVSs5bkJRTEUrVzRU?=
 =?utf-8?B?YUpLWTRGbW5NU3REZ2dGZGRVdUFLdEhreS83M25qRTQ1REpkaVZBZWMzelhB?=
 =?utf-8?B?OHlBWXVOWVBqY1VaeW53TnJuak5ZM2hDQTFjR0hkQXROeXVpQi8wdDFHb1pr?=
 =?utf-8?B?TDhRcHpXR3dZaUExdjliK0o1aS8rbGRHYVJwM1UxSnNyalcxeHQ0MEdoZVc3?=
 =?utf-8?B?dm1uMnV4Ym4vS3FqMnNWOXdnV2VSbk5sNWtwQVE5QURaQ0hSVzlTTXBDMGky?=
 =?utf-8?B?TGR5S3lmVGtRd0FPWTFvcWlNSXZzZUw1N2dKYXZUZytxUHg5amZqR2htVFdO?=
 =?utf-8?B?MUJIeTc3eFhjVWpOTWhEVjZCaFUxT0J5UGkrOW9ENmtxenBmZ1REQUozRnBN?=
 =?utf-8?B?WHhUSndZRUxVTWxpU1Y5Vk1PWWgyUFBHejhWKzlhYzJVcjBIQ1ZibkQwVXZv?=
 =?utf-8?B?dHM1YkllUndFZWdIdzFsR1AwYVpjRkJpQnZJQVZJSVJUb1NyMk5wWExYVlhE?=
 =?utf-8?B?ZVM3SUJJekJrbmRWd01KMjNyWDFrekYrYlNJNnk0UkFvV2Jxb24rKytHY25n?=
 =?utf-8?B?THVnVnhJN0ZlcVhOdGlLVVZQYVluSXBBL1F6eFZEemk4T3RGSFRjUGVpcXBz?=
 =?utf-8?B?QmtrZzdwUVFabWk0dGd5VU9PcStsMjFMek5qRmZlUUZSWVY1V09XbWc3NlV6?=
 =?utf-8?B?aE9rN3FmRUYxSVE5REk4ZVpIZ3E0MHpOR1pIejYvTmhZNFExN1YwOFozMUVR?=
 =?utf-8?B?V3lSZkN5SGpXdzV5U2IwenovMElaY0VPNUIwVGsxNzF1MUYyTStFcWVpZmY2?=
 =?utf-8?B?WkpjYVJRU3hPVVd1NGo2dkMzcTRrZzZUaERuM2tTTXJUemVDTnpxVzFTOEJl?=
 =?utf-8?B?SzJ2anM1anp1cTNJVEg1eEtUcEVOQUFDejlCZzF4QUhmYkoydEhYWGVmV1hk?=
 =?utf-8?B?NytQZThXbkt0MjJqM2U0d2c2U25PRk5rb3B4dk1SNUsxMktub3pJN0hYNUZu?=
 =?utf-8?B?bVhpaEo5TnFKdkZ2VGszWXZtYUVDM1FtaFQ1bE14MkxERWpiQzJ5RmE3dkZ5?=
 =?utf-8?B?dm9RUGF4L0pVY292d3pSTEMwNWV5WmFYRnA0REhmblh0bFFxZDB3ZUhyVmlT?=
 =?utf-8?B?STNFWnZGZ3lMNkRvdW0vdm1uTnFTUWRqWCtrdzNwS1VsNysvLzZzTlpCZVF6?=
 =?utf-8?B?b0hlaTRWSVdrekw0eHgvcHJqZER0bGdoRDVCeGtZOCtNVlBTT2VhOTh3TW9m?=
 =?utf-8?B?L0wrK3p3cVMyVG9aWS8xM2hRZkZ4L2QxZURMejdYNGJXS00yMXZaTjR5NWZO?=
 =?utf-8?B?d1l3QnhpVm1uYmFtSG9QN2VlV3dLckZtK1BDU1k0cU1tMlljSXJMRUhmY0xz?=
 =?utf-8?B?Ny8rY3lZeUw2c2w2VE5EcTdicUgveVFqcktOTVQ2V2ZVM3B6Y29VcWFmZjVL?=
 =?utf-8?B?SEtMNGMzcEZlb3RYM3BPejlqVzhsMHFNdWJDZ3duL012Zm93ZEF0QktMZS9l?=
 =?utf-8?Q?gH9gwa8YrnWFTvnMMGOOOR4=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc41bc7d-d0bf-4389-a396-08dc6ceb4e8c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 10:08:27.9796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUwV3jVBx+UIybofd8tnez0e5asdcVLxG4/s11EQOWu8hgdD5IN/KzvM+bBnWQpPVlSY2NKq0cfTVFSMNoU/SWyqSUYsyB9gwIZjx7y9UqqcGQIvMakBR0FvsykJwFCD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8277
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Justin Ledford <justinledford@google.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 25/04/2024 21:05, Guenter Roeck wrote:
> On 4/25/24 03:33, Chanh Nguyen wrote:
>>
>>
>> On 24/04/2024 00:02, Conor Dooley wrote:
>>> [EXTERNAL EMAIL NOTICE: This email originated from an external 
>>> sender. Please be mindful of safe email handling and proprietary 
>>> information protection practices.]
>>>
>>
> 
> The quote doesn't make much sense.
> 
>> Sorry Conor, there may be confusion here. I mean the mapping of the 
>> PWM output to the TACH input, which is on the MAX31790, and it is not 
>> sure a common feature on all fan controllers.
>>
> 
> I think the term "mapping" is a bit confusing here.
> 
> tach-ch, as I understand it, is supposed to associate a tachometer input
> with a pwm output, meaning the fan speed measured with the tachometer input
> is expected to change if the pwm output changes.
> 
> On MAX31790, it is possible to configure a pwm output pin as tachometer 
> input pin.
> That is something completely different. Also, the association is fixed.
> If the first pwm channel is used as tachometer channel, it would show up 
> as 7th
> tachometer channel. If the 6th pwm channel is configured to be used as 
> tachometer
> input, it would show up as 12th tachometer channel.
> 
> Overall, the total number of channels on MAX31790 is always 12. 6 of them
> are always tachometer inputs, the others can be configured to either be a
> pwm output or a tachometer input.

Thank you, Guenter, for your explanation. That is also my understanding 
of the MAX31790 feature.

So, I think we should introduce a vendor property to configure the pwm 
output pins to become tachometer input pins. We shouldn't use the 
tach-ch property. Because they are completely different, I think.

What's your idea ? Please help share me, Guenter


> 
> pwm outputs on MAX31790 are always tied to the matching tachometer inputs
> (pwm1 <--> tach1 etc) and can not be reconfigured, meaning tach-ch for
> channel X would always be X.
> 
>> I would like to open a discussion about whether we should use the 
>> tach-ch property on the fan-common.yaml
>>
>> I'm looking forward to hearing comments from everyone. For me, both 
>> tach-ch and vendor property are good.
>>
> 
> I am not even sure how to define tach-ch to mean "use the pwm output pin
> associated with this tachometer input channel not as pwm output
> but as tachometer input". That would be a boolean, not a number.
> 

Thank Guenter,

I reviewed again the "tach-ch" property, which is used in the 
https://elixir.bootlin.com/linux/v6.9-rc6/source/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml#L68 
and 
https://elixir.bootlin.com/linux/v6.9-rc6/source/drivers/hwmon/aspeed-g6-pwm-tach.c#L434 


That is something completely different from my purpose.

> Guenter
> 
