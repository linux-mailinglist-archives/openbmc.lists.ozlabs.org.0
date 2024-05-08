Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B23298BF50C
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2024 05:45:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=kxXhRseP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZ1Jh1Xqmz3cSH
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2024 13:45:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=kxXhRseP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:200a::701; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZ1J628f6z30W2
	for <openbmc@lists.ozlabs.org>; Wed,  8 May 2024 13:45:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EI7oWgikU1TUupROG4onmRBF08jo7KQZ6/4LquHO5ymTkh3sMeK56lH/bTlyI5qnvB4353Y63PrBj7Y+5CNsSEFhccOIA8h/o5yP0M4i/Nhe0dhTA3zgSMMU03pBlWgWGf5+rtVslXY8UN18kfzWtBcTQVWqu7kZ1IuFGoMmKQq9KgyDIo0fQPk0q/X9d4RW2Ut9FKQBv0JPF2ariPP3gxW1mAzoe92+DAZzhhSH/HDegP67qNkb/8DF4PgiQTc8GsETsk7wkOm2YyL74UIA9WWw2INo29JqXA2TIqy9vn+cAD+R/PHzoxu0ByPAosTfsCiAbqW4Xpb/xEcrBw8gUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8RcYaEhikUoeCvpPEECP6qhrkeydziPkD3rYN6+o/c=;
 b=f9LPj2VSI8xsXXPG9ZaD3x1nWUri/1SFzuuRn3iuiGEtfGBlGqknxWHmCrtYvE5zpcfY172TqRMOadh+K0gYkApyr376n6UzL3EllE03m5lRTU5vUxkdgUH7PCAxultctBJy3pwAgQnLJqr/V/XbkLSfhQzSUzp9/8u1CtFBcXoeV6n1qqKDD9weXlVkJ9hrC9dlmTxwi/+rI/X0bhmmWY4/XLTuJoHiOVWxSUmY+f0iIU01XjA1F1d6/xK+1FG2VZc3PnSZIk9lXCfOadFm8AstEGWRAQFOCGIbl7fyHNypT4RJ9Dyi1F0lZ1ienVhU4ThpPkodaM0qZPnsv2U8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8RcYaEhikUoeCvpPEECP6qhrkeydziPkD3rYN6+o/c=;
 b=kxXhRsePJaXIzVA694ls+50NZRgbbZahqx/UDVZVzW1xdJY2qwi1v1EA2JW1A1V26xVoFBmxM4rmVAzaercMenW5YK7MixMaOvLTXMgK/yzzVTl1HYOX1s0Ekn3EFUj76/aIsQm9AHK5+YlSWrI8hQwRg7xufnUgDydLXFVUYLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 SJ0PR01MB6477.prod.exchangelabs.com (2603:10b6:a03:29b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.43; Wed, 8 May 2024 03:44:55 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::919c:7d6a:2069:b0ca]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::919c:7d6a:2069:b0ca%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 03:44:46 +0000
Message-ID: <8fb38eb3-bb94-49cc-b5bc-80989d7876b9@amperemail.onmicrosoft.com>
Date: Wed, 8 May 2024 10:44:34 +0700
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
 <0dcc8788-604a-49c1-8c6b-fdbfa9192039@amperemail.onmicrosoft.com>
 <da94fde6-3286-44eb-a543-c2ac4d11cd32@roeck-us.net>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <da94fde6-3286-44eb-a543-c2ac4d11cd32@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|SJ0PR01MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 55455886-7ce9-4945-cf2f-08dc6f113440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?U1h2d2tTSXA4amxjbkR6ZjBOUXYxaU5yMjVrdVhBSnVaaG5TaGVaL0xkVktu?=
 =?utf-8?B?blZTcTBmWmNvNmExQnJCZFhYZTB1dmxtdUVuNHEvNUtkL3ZwbnJGalcxS0w5?=
 =?utf-8?B?NTIrRmhUeWVLTWF3QlRWcExNRkZiaCtjWjdEd3FjNlB3Q1NiN3JPcnNnR2xx?=
 =?utf-8?B?cVZ6MEFnZmc4QVBOWTViY2lxYndsTS9wUkREQ0s5MTdWU2MwQjFVVURZbVNJ?=
 =?utf-8?B?ZmRlNkh0OGk0c0hySHFGSnBUS3NlT2dNSWpiS01UanVFVFNLT1k0b0czZFdo?=
 =?utf-8?B?TWlpTFlWcXBDeU9kaGI2UzVXUzBQZEJUWit4dUdYaS9SVEFKOTBzUnlDdks5?=
 =?utf-8?B?K3M0R29VcFJWQTBTZjZMOUc0K0hxdndqdVdOUTcrbStYWjZ1OEdsWlhBaFBM?=
 =?utf-8?B?Q015MWpvRGlOSFhhVitHUGJ4cUdKN3pOQ082czZ5alVGWFlGZ3hlK2FLWHBr?=
 =?utf-8?B?dXVJVnlLanl5WEhUSjJUR1FETWpZZmRrTHVWdWFEaWNUYVBJRDVSYnU1dGht?=
 =?utf-8?B?eHAwZzBISE5ZYlpmUzdyK1NhUlMzMGJ2eXhMU1lzRjBzRzlNd0d4YU90QjNs?=
 =?utf-8?B?OG01UGRyQ1pDeWxNRWNocUZkb0hFYUdiS2NReDRCbjhsNzUzNHZHYzhlbG1U?=
 =?utf-8?B?MUUrRVU2U0dRQk9HRmNKOEs4ekljbEJVOXR1M25IUS9YNEJjczVoWk5VMHl4?=
 =?utf-8?B?OTY0Z1c4aURTam9HaFJPNi84Z1V0K2lDa0pkNVlnbllXa3NEclhrU1gyT3I2?=
 =?utf-8?B?V3RWRkM0R0QwWXMrQ0dSSlZPWnE1R2lRYldwMkcrOEQrQmJCY29OVm1VRVJq?=
 =?utf-8?B?L1cvaHFCVWlWd2ZVTVF2WlhsMnB1WjdlK1ZJZmNrWHVCeGNIUG5qSFJrc3ZJ?=
 =?utf-8?B?Rkc2YkRXYWY1aHpucjdXYmpMbVNNdXJFY0crdlk4aWh0SmMvOXFrK001M1Rt?=
 =?utf-8?B?UDduYVArL0llMk1ia2U4NUxieG5tc1N2eEZ2M200V08zRTkyTnZaeTVid0R1?=
 =?utf-8?B?VWZIZS9vRElxWWR3ZHJyTVpZcU15c1dSZ2pMV3NPWDkzNjIyWG9URThlMG9z?=
 =?utf-8?B?c0xlL3VCMWl0L0kyRHQ5S0kzVE9ObXlaMEFGQUltR2UxUk1ONWNpb1ZuYUJh?=
 =?utf-8?B?OTROWllTM1M1MkErMkNkQ0I2UEVYQzZBM0h3WTNHL1c3a0tvTkE0MFViY0s1?=
 =?utf-8?B?MzdobCtYRG1FWm0vaWFpY3lmYUptWlRnMXA4SE9jb3NJNUhkd0VIaE1YU2JS?=
 =?utf-8?B?TzZmRnQxaGoxc1FDTU1ZV3FwRWZpdXhiekh3MjdmY1B6QWV0QUFDdWFNK1Jr?=
 =?utf-8?B?YjBzM08vUTVzaWFzRys0d2V1cDBoaExQdXJwMFE1RE9XTHErTXRkWEVEUlg1?=
 =?utf-8?B?ZXNkSzFkWFk2aWZpN29LVVl5cXduNWlUSlR1eFJCZDEvUTJvMU5aQk1LWkJs?=
 =?utf-8?B?NmVQS0Jrd2FEekRMZ3I4RHpTcmZWRVJsNC9uNEJqYURxVENBZEp4VWVwdVEy?=
 =?utf-8?B?UHpzeHJvL0hmR3dyTjUrZkFna2pKS2ZSRkNjR05nU2xPZDlWN3dqbGpaL2ha?=
 =?utf-8?B?N2pUZ005TnEveisrdmZzN2lWRjM3NXVXT0dIQ1Q2MnQ2d3RNZjYrWWZ0UmR3?=
 =?utf-8?B?azFLNi95ekp4cEIyWTZ4eCs3aUI4NWc9PQ==?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?am1WSlo3N3NSK05hS2ZiN0tqTWhHTEVQMVZmMzBhWXAxK0VBa1hLMG5qTkUx?=
 =?utf-8?B?NFl0K3E3a2g5K09mNmNTMU94RnFRdlVMWDJGWm5xS0Q0a0IxRWFSR0xHUW1O?=
 =?utf-8?B?MmwrYWhBOHAweVptRC96aGdRWGQwZjZSQks2T2NIN2c2WGpYb1hTa2FCWmZE?=
 =?utf-8?B?NDlZU0JlcXlEdytQQWhSeWFTN29xWjJ4WmE1VUMyR2pvR3BVbkFkbjdkb2h6?=
 =?utf-8?B?U1BOaXVpUnAxVVdjdlF1OUQyR3Rhc29UQ1ZwbWJGR0dqSk40TWpDNmZSOUxr?=
 =?utf-8?B?bzZpdnFHQmxXblJOZ3Z0aDlsOWNEckx4NE10UGRsc3lvcVBQakhtUHpNdUYz?=
 =?utf-8?B?Vjh3bExlWjh1ZFNaSXdpcUMxc3U3ZXlvaVlvT09MNGpmMDdBbkhFUjYxYTlC?=
 =?utf-8?B?c3pRWlRBVDF6cUV2NStqL0t5Z1Q5UmpFZGVoZHhmUmRVSEF0SzJMdDBVOVN4?=
 =?utf-8?B?V0FvR2ErUDRGZ0Mwa1VxSStoWFJzYTFIYXJvOEYxcCtiS1cwZkFEUDNFSUtt?=
 =?utf-8?B?M0ErUHJSeWZYaTBIQkMxdXZoTnBYL0NaVUo4K1U5SUsrcklMUEVKTG1aazFN?=
 =?utf-8?B?M2oyTklUS1BpVkMyZm9aWWU3YUMybVI1SVlRWjRpSmZza29EYU1ZS1diZkYw?=
 =?utf-8?B?cFdMeTlhQ0NVNnNvS0pWbzB5YlQvdnBRS1RLT3J1NFVncFgxYW1iU1VnVDZE?=
 =?utf-8?B?NTNrYmduanJTMU8xOWdjalo2MExuQzRVV3Z1WGJJZDBacFNNN2FHdStkUUNa?=
 =?utf-8?B?M3FlTG1ZTDlrZ0duSjlZUm1rWndmTk5wdGVvcGdCVmtYaDhwMEM2SWh0a0tD?=
 =?utf-8?B?Q05DMTJqMGtVdE0yUDdCVFFJNnNNYndkcmdZWmUrTFc4MS9mdzBrbnVzSi93?=
 =?utf-8?B?L1dKYzA2L2tWK3BzOEZKTm9FRGRCNzBrQVM3VW1MR3d2bTVZZFd4c2hzdlNG?=
 =?utf-8?B?QVg3ekU0TTlkalZXL3RRbnZKbkdFeTdRNWhoN2hnRzdRUW9TaGVTa0cwQURO?=
 =?utf-8?B?N2JOUUpJWU9DSHg4YnRCK0ZJcG5VVkJKR0VqMU5PUFQ0UUVIdjg2bGY5Wmkv?=
 =?utf-8?B?K0xiTzBDRHFpL0ZnVXNKK2RYaGRvd3F0WlBzNlZ5bkRjVzMvOFhTdXhDRTY1?=
 =?utf-8?B?Wm5vVTNJYVlVNmJkVVFFR2xYR0xzaDZxbVhTb2tOZkVJaStVOFp0aHl3bThx?=
 =?utf-8?B?b2JQUEFLOGZNU3ZxR0VEd1hCb1pLdUtaKzVjYmJpcDN4Q3FLTksvQzF4YUZr?=
 =?utf-8?B?MVZjUkY4aEYrcTFoY3NGenZtVHhzSDMxakZQZDU2U3IxMkRselZsTHNUT09F?=
 =?utf-8?B?dytxYmFLN3dYaC9UWEhKTjB6N2FsalNnUEZGUzJpWU9UdHBib0ZqeWtzVTBI?=
 =?utf-8?B?UU1ieGJKSXRhT3BWOG5DWG52bzl5SDQyMFh0aXJiVFBtWDBPayt0dkJlM0E0?=
 =?utf-8?B?NnNaK05ZUk9QUTNOSStRQ01hL2VUZlVXcGJOM0k4RWFzZTN3aWdBTzFaU29l?=
 =?utf-8?B?d0dadEY2WWY1TjB5eFVKazJUVkFQd3l4aDIrYzNIaGxhSFhZY252K0JhOVVr?=
 =?utf-8?B?d251YW95YWYwTldvK3FHR1dtUmFyOXo2YS9iKzg0aGorQ2cxSDZQc2diNlFa?=
 =?utf-8?B?WEVwMUR0bHNlSWN4TmU5SlI1RVl2R0ZnUTRqTFhIVlV6UnB2OHZHTldkR0VQ?=
 =?utf-8?B?clFzMkRGZStTYVBMSzAyOVQ2dktxdjdqdWFUcUwwVHNrY0xaak8rUVVsSmlB?=
 =?utf-8?B?SGx3T2kwb3QyUUVUQkRMdThHZ3FCZCtPQXVXa0xUNDFFYm5OZVRVV1U0NUh6?=
 =?utf-8?B?VVFteHp6MHN2TklSd0RRbFh6TGU3RXBqTFdPMGlsdlN5ZUx1RGlMRjFiR3dW?=
 =?utf-8?B?UGM1cDZMd1dsUEs0NG9FMW10OU9JVjhBTzhBVGhPQlpGOVY3YUZrQXdIZUhV?=
 =?utf-8?B?TEVZL2hka0tFcjJScHVpNTNuWUdRUFNIcHpNbTZ6c1FHaG1zYWFGOUpLTTBY?=
 =?utf-8?B?Yzhaa0JwN3VGOVpyNUl5UUs2eFBSUTdIUXVzbW9KYVNVZ1RFVm84SllRNXVO?=
 =?utf-8?B?dEV2UDBjNTI5MUVjSjY3aERyS3UyNkRqK1N4VTRIQWJoQStNZlkzRkVIOXR0?=
 =?utf-8?B?NEh5cmM2QzYxTDc0Vy9PU1c0UXUyRnhxd0lyc1RIc3JzODkyZ2x4YXJ0MFdS?=
 =?utf-8?Q?nVdNRjKda1RatMMpMoN69R8=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55455886-7ce9-4945-cf2f-08dc6f113440
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 03:44:46.8150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsYwhlfb3MlzVLgkj0UiV/O3fbwx2HUICEZtkbe6tggEEIQq4PYjyvsQdmhB6LyWBKxKGgQRs9lYWwBT1Q7rT4nB+yF0CXEvX8bsXtu/CfqzPRZJhQCuM2quTQuQ56bp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6477
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



On 05/05/2024 22:40, Guenter Roeck wrote:
> On 5/5/24 03:08, Chanh Nguyen wrote:
>>
>>
>> On 25/04/2024 21:05, Guenter Roeck wrote:
>>> On 4/25/24 03:33, Chanh Nguyen wrote:
>>>>
>>>>
>>>> On 24/04/2024 00:02, Conor Dooley wrote:
>>>>> [EXTERNAL EMAIL NOTICE: This email originated from an external 
>>>>> sender. Please be mindful of safe email handling and proprietary 
>>>>> information protection practices.]
>>>>>
>>>>
>>>
>>> The quote doesn't make much sense.
>>>
>>>> Sorry Conor, there may be confusion here. I mean the mapping of the 
>>>> PWM output to the TACH input, which is on the MAX31790, and it is 
>>>> not sure a common feature on all fan controllers.
>>>>
>>>
>>> I think the term "mapping" is a bit confusing here.
>>>
>>> tach-ch, as I understand it, is supposed to associate a tachometer input
>>> with a pwm output, meaning the fan speed measured with the tachometer 
>>> input
>>> is expected to change if the pwm output changes.
>>>
>>> On MAX31790, it is possible to configure a pwm output pin as 
>>> tachometer input pin.
>>> That is something completely different. Also, the association is fixed.
>>> If the first pwm channel is used as tachometer channel, it would show 
>>> up as 7th
>>> tachometer channel. If the 6th pwm channel is configured to be used 
>>> as tachometer
>>> input, it would show up as 12th tachometer channel.
>>>
>>> Overall, the total number of channels on MAX31790 is always 12. 6 of 
>>> them
>>> are always tachometer inputs, the others can be configured to either 
>>> be a
>>> pwm output or a tachometer input.
>>
>> Thank you, Guenter, for your explanation. That is also my 
>> understanding of the MAX31790 feature.
>>
>> So, I think we should introduce a vendor property to configure the pwm 
>> output pins to become tachometer input pins. We shouldn't use the 
>> tach-ch property. Because they are completely different, I think.
>>
>> What's your idea ? Please help share me, Guenter
>>
>>
>>>
>>> pwm outputs on MAX31790 are always tied to the matching tachometer 
>>> inputs
>>> (pwm1 <--> tach1 etc) and can not be reconfigured, meaning tach-ch for
>>> channel X would always be X.
>>>
>>>> I would like to open a discussion about whether we should use the 
>>>> tach-ch property on the fan-common.yaml
>>>>
>>>> I'm looking forward to hearing comments from everyone. For me, both 
>>>> tach-ch and vendor property are good.
>>>>
>>>
>>> I am not even sure how to define tach-ch to mean "use the pwm output pin
>>> associated with this tachometer input channel not as pwm output
>>> but as tachometer input". That would be a boolean, not a number.
>>>
>>
>> Thank Guenter,
>>
>> I reviewed again the "tach-ch" property, which is used in the 
>> https://elixir.bootlin.com/linux/v6.9-rc6/source/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml#L68 and https://elixir.bootlin.com/linux/v6.9-rc6/source/drivers/hwmon/aspeed-g6-pwm-tach.c#L434
>>
>> That is something completely different from my purpose.
>>
> 
> Based on its definition, tach-ch is associated with fans, and it looks
> like the .yaml file groups multiple sets of fans into a single
> fan node.
> 
> In the simple case that would be
>      tach-ch = <1>
> ...
>      tach-ch = <12>
> 
> or, if all fans are controlled by a single pwm
>      tach-ch = <1 2 3 4 5 6 8 9 10 11 12>
> 
> The existence of tachometer channel 7..12 implies that pwm channel 
> (tachometer
> channel - 6) is used as tachometer channel. That should be sufficient to 
> program
> the chip for that channel. All you'd have to do is to ensure that pwm 
> channel
> "X" is not listed as tachometer channel "X + 6", and program pwm channel 
> "X - 6"
> for tachometer channels 7..12 as tachometer channels.
> 

Hi Guenter,

I applied the patch [2/3] in my patch series 
(https://lore.kernel.org/lkml/20240414042246.8681-3-chanh@os.amperecomputing.com/)

My device tree is configured as below, I would like to configure PWMOUT 
pins 5 and 6 to become the tachometer input pins.

        fan-controller@20 {
          compatible = "maxim,max31790";
          reg = <0x20>;
          maxim,pwmout-pin-as-tach-input = /bits/ 8 <0 0 0 0 1 1>;
        };

The sysfs is generated by the max31790 driver are shown below. We can 
see the PWM5 and PWM6 are not visible, and the fan11 and fan12 are 
visible. And all FAN devices are on my system, which worked as expected.

root@my-platform:/sys/class/hwmon/hwmon14# ls
device       fan12_input  fan1_target  fan2_target  fan3_target 
fan4_target  fan6_enable  of_node      pwm2         pwm4
fan11_fault  fan1_enable  fan2_enable  fan3_enable  fan4_enable 
fan5_enable  fan6_fault   power        pwm2_enable  pwm4_enable
fan11_input  fan1_fault   fan2_fault   fan3_fault   fan4_fault 
fan5_fault   fan6_input   pwm1         pwm3         subsystem
fan12_fault  fan1_input   fan2_input   fan3_input   fan4_input 
fan5_input   name         pwm1_enable  pwm3_enable  uevent

Please share your comments!

> Hope this helps,
> Guenter
> 
