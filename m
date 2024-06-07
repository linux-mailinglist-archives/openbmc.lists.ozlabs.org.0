Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F3900AB5
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2024 18:48:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=JnRZ9yv8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwnFH4yZJz3cRK
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2024 02:48:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=JnRZ9yv8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2412::702; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20702.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwnDl39z0z30VP
	for <openbmc@lists.ozlabs.org>; Sat,  8 Jun 2024 02:47:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2yLKJuuUe+jXg6kZXpeabekORZzQ0X29+zqT3+P77nlowgEyHIJUt2GWp4+Qma9Ic6Cxe1sHmNQqRrJwfRsmSXuhXCsxCviK3snZkFCvBs8anS8gXrj5ovY+44XjXqngci36/A68FsOoe5PtSM1UyZbAy+VHk20QXhsmqsBTvnVyruGPnkWsB+r3bqVWbcrGs9BkYWSowdy3TPMCmT/KcHg44aHv13vZ3xMQD8vttwub1GvItdYYMHhqeW+JG8Cw1fLEHL9d4ZklR8v1wUyL2I/NsEq+Xu7HFj0Fn2m7MfhfbjOarKFbxE07BRfIHb9h5BRY7qYdx1Cbs6Gmom8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4AF+CrlQjOSIXynNGm/bkA1U7ShpesIpF9FHHt6/Bw=;
 b=BpRNGU8eXzdFZIRvDBALjBtSPwLL2wYGcl0Ehi+LGP5r4RDwDGawYqKQUuoo/k695oBLA2P8spbVvwwo6m0FMgx1zRk9TmYhW7D1xBpKd2m0Am1v+KWpvi9SgMJRWcpKTyMhejo1VlxheNBltC4zruyrASjK2Cal4RvRgc7OvCeiAbvZYKfU4H8kOCZEmGvgU6tm3VXvKySqFM1LprBsu54K0C1VqOM8UQv4uWB7p6ZMRydJmjyF4fZYSZL1s1Uvkf8H4rPND8dWS4H9cPIW9HQ/gFVzfbn3Wr4sVWCd77B0QY3VouzbG+qNLCNDz/WQksjBLtfSrvaZfqH1abasrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4AF+CrlQjOSIXynNGm/bkA1U7ShpesIpF9FHHt6/Bw=;
 b=JnRZ9yv8mkkUjtj/xwD/aiHmwVYJEDprRS/Rie/r+vQAvwGjLRxl3OSJLi3bpFgt0JYteIeENsytK1JI64V0ADqxxLSbUhzlsX7T13jPb1YumXUzz6Oa1CDsrE5jboIuFfFBc4i8BLTWbtJOnzxBd6rGQP3d5/2AEC2dQlVPrBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 CH0PR01MB7051.prod.exchangelabs.com (2603:10b6:610:10c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.34; Fri, 7 Jun 2024 16:47:03 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::919c:7d6a:2069:b0ca]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::919c:7d6a:2069:b0ca%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 16:47:03 +0000
Message-ID: <a69b0e95-f89e-46b6-bf25-98984e95c751@amperemail.onmicrosoft.com>
Date: Fri, 7 Jun 2024 23:46:52 +0700
User-Agent: Mozilla Thunderbird
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>
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
 <8fb38eb3-bb94-49cc-b5bc-80989d7876b9@amperemail.onmicrosoft.com>
 <a20479be-a4cf-4fb5-8d37-277d14a93224@linaro.org>
Content-Language: en-US
In-Reply-To: <a20479be-a4cf-4fb5-8d37-277d14a93224@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|CH0PR01MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8dcf05-e880-4725-74d8-08dc871174e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?VkxsWERtdDlPL292azFQSzdTYVQ1aUE0UjA4bFcxUjZiT0tNUDdPTExBNjBX?=
 =?utf-8?B?TCtPVGdXZWJVaTNna29mOVJkeFFRWFBsem1xaHNqRXJNc1U4UzlrOFVlT3Fz?=
 =?utf-8?B?bENkdDVQOFlGWkpYZEZUK0xhZUE0T1g3ck9SOTBsMDV1aUNqSmFlMW5GeWtx?=
 =?utf-8?B?VGkxamNSVHdCekEyWXVqdGVyRFpnaEdBNE4rMnV3bklDRzJySWVaaUxNZEk0?=
 =?utf-8?B?SVZmZ1ZvNGsydGR2TDM5NUUyRGtjVXBCWHZPenptRnJhMm5na0ZhLytoVWlD?=
 =?utf-8?B?ZDltV2h2eFE5d2gvUk9acFpWMWhHSnhmS2d5MmFpbVpXWGI4eXVUcGZCWE9q?=
 =?utf-8?B?SE9GQTBnencrMnZjTzJPZmFlU1pJNllrbXA1UHUrNVh1UExTOFMwV0lHc0Vx?=
 =?utf-8?B?eWNXeDloTThhelV4STBYSGFHTm9kTTlxQUFIendRN3AyN05HSHVJZUlWZDFr?=
 =?utf-8?B?RUNRY0t6U2UweFloV2NMRzhSOXR3c21hNDM0QXg0N3BFM2pLZW9jdkQxeDRW?=
 =?utf-8?B?d09aMERObExkanRRRDNadzJVaWZOcDVSNXZkMVZNSHZpc2p0dWRValpqdEU1?=
 =?utf-8?B?MkVrNHNMVWJOVDN0SlBQeVBMQTZJaXlmVXVqYXZFbFM4UmZMTnlNcTFoUHEw?=
 =?utf-8?B?bWtNVTBuR0EzSk9FUTVnaHdQVzdzRzlwUnA2Z0FyT0JweGJpbW9BditzK3J1?=
 =?utf-8?B?UTRiVTd0WmFUZ0JwMlNGSVk1UnR2K3JBOStobUJTMVVUaDkyaGVNZ1B6cllu?=
 =?utf-8?B?R2s4K05kN3BpRzdILzlReHdiWlNYeVZ5bENYSk9Gdkh3UVZOU3ZjUVN2TVZK?=
 =?utf-8?B?azQ2MTFoSk5vK05CM3A3bXQyTlJZNEZBdHpGbDlGOU9lUmZYbDYyTzNTbUNG?=
 =?utf-8?B?V0piZHp1SjV5NVhmTlZhU2xkM2dRcFRwcXVleWVVbGxIYlh4anpVT0JvejJp?=
 =?utf-8?B?MWRKV201NXUyYzlXOVRkMnJiSDZuTmRmMWMvQjdTUTVjWVVoWWFiUFpUTStW?=
 =?utf-8?B?SnZ3eTRUeVVET2w5blJqV1E0T3d3ZVJPTk00RU9zdURvLzgrMSt3TW1UcGo5?=
 =?utf-8?B?dWZmMzlrWGovcTk4bDBnWU1zK0c1RGlxRFh1QUpXeEY0U1d6czY3S1pIRjVV?=
 =?utf-8?B?eFIxNlJ2QXlxV01KZXU3UEVYWEp1cmxEbVpFTlZGTlh2SEx3eUhyenNhbkg3?=
 =?utf-8?B?d21hamRTNjRvUnZHb1NiLysrd0NDbFR2M0RSMmVLb2xxQkN1a09DaVJ0RUlV?=
 =?utf-8?B?NEtGSk9ETmtYY3BqRU84N3prZFVLU2g0QmdxWFVqbGhMYXMvWnFlZHJXbk5O?=
 =?utf-8?B?Q1U3bXBxbmRvMnhMUldXQ2lLR01RMklLRUt4WUFHOFgwd2huSXNOTnI5QVVh?=
 =?utf-8?B?dk9HRm5iL0VkMmxUK091SnIvd041eFdaZjcyalFMM09OZXFUUnBoMi84V1Mv?=
 =?utf-8?B?cUY0aTRPd1lKR2luT2hMbzlPWTlQc0ZZbnRxczA2elBleVZpb2p4ME1VTi9R?=
 =?utf-8?B?eEI4UUhMUTEySmZtSGE5bEVNVFhPYWF1OTducWRTNDRRWTd2aDROWVhHKytK?=
 =?utf-8?B?ZWErc0J2TEFjNDJkMkFJZW1mK0cvSE1MT3cyVTdDQlRtRDd3VzFCR1dLWXp2?=
 =?utf-8?B?a3NFVGsvSUhJTmhUekdEWkk3ZjJ1TXhDMDVqanZONFhRaVRqOXY2dHJWeE93?=
 =?utf-8?B?YlFuZWpsMWVTNW5yT0dvR3U1VU9BdTFJOG0wa3phS2tsV0dhRmxVVkVnPT0=?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Qnc0SGcyTlEzL25PakpuNXlVNDdPREFjdnZTVld1NStNQmIvenUrMHdSTmg0?=
 =?utf-8?B?QXR1TjdQWUIwdGtVdTlXU0Y1bStwOFFXMk5uRXBQTTdmRi82QVY2TldDcml4?=
 =?utf-8?B?UWhncm0rTzNVNGoxcktBKzk0eDlUMUxEMkE1TURiZk1UaUF3b3ltQzk1c0dq?=
 =?utf-8?B?M0xTdThDRFQ5dlpSNE9hL1RFNmwrOEtGdnMxVVZGeHZjd2hhNjFiQ0h4M2lp?=
 =?utf-8?B?aFRpOUk1VUpyRC83dTZ2WDlqb1JVdWVJemZKL0VkU1k0VHBWVnJYcW5mQ3do?=
 =?utf-8?B?c3pQNC9aQmlqVlEwWHgybGlUMDJMUzBQRUYxdkhDbFRoQ0ZMMzRxdzgyclp1?=
 =?utf-8?B?VGpNdG5ZU2VzRmhuVHJsZWw4ayt3dEl3Q0xTaFp4enRNemFtZStJeDZSY0po?=
 =?utf-8?B?VmtsTEZ4cWNuRVQwb2hqbjBHTFp0eGFvRG1OTkV2L1Zjd01WVG9heEVzcDZ3?=
 =?utf-8?B?T0tCZHNnN3B4U3pKK2hsNnU4LzBpOFlmbVJJbDdpaFZNS1BuUlFzbitjV09q?=
 =?utf-8?B?VkFMMGZrZ0duQU4vSXlRVDRuaUR1czRscGdSak9FU0NXUkpydVg4MnNaWStz?=
 =?utf-8?B?NzlCa0s5KzVTUlAzWUQyR25tVDd4Y3hCaU41c1MxaVlHVCtmNmordk1mSHEw?=
 =?utf-8?B?SG5IRlV5ZTNvTkg1QjZ5Y2F1dlJzY0FVWVhCd2ZpR1dwbk40T2pQdndwVkFu?=
 =?utf-8?B?TnZHcHNyNUFTdFFIVVo0bWFwSzlVVVRmU2QxbUNUWnNUV0U3RjJFVHduYmZC?=
 =?utf-8?B?Z0J4S3hrVERqWnJpOE4xdHlvMjFDK213MVQzRHc4aW1DNlpoaUlPRHpOb1lw?=
 =?utf-8?B?N29BZGJmWTJDL1F6TEJhZmRzMmlZVXBnWDNxbXYrbytUR0Z0MU9GM1grQ0pP?=
 =?utf-8?B?dXRBeFFLb1I0dXVmdTAyVmZrdndaQzdvMy9sNXc1WlRqTCtQUDNYeVBrUzFt?=
 =?utf-8?B?UnZ1NWQ3c1JsUVZaV3JZTXBybTJzdVBmYk1nZ25VN2owR3YwNTY3UkV4ZnJq?=
 =?utf-8?B?ZE1Sa0lKUExWNWowUWY5WVBZWE96aWpSS1VjV3lUUGxEZkZyVFVFazl5Y1FZ?=
 =?utf-8?B?bGx5SlJGU055SjhMNEg3VGs0VEtXaVh6WmZiK0lubDI3TEV5Zzg1eDlYSG1Q?=
 =?utf-8?B?UVhkRmgxVWRwTDgyNHR3WlcyZVVtMTNab05qenUrcWxjN1g2cVk3cDEvUHFt?=
 =?utf-8?B?QjBlSmtBS3BJdWhUTW5wWDczVE9zaWxYdjcybUd0WlRSd0pKUEFnR3ZZS09u?=
 =?utf-8?B?aFoyUjFHa0xtcFhkMHhRdHMxZ05SQWJlbEFHNDdtanVhWk9MLzJtRHJaWitl?=
 =?utf-8?B?U2oxSDg1S01TR1doWm5MWldLWlE3eVF4bTkvRnhYeWZCamdnQ2dITHJWNzFR?=
 =?utf-8?B?bnN4NGJCSjhyNGVxRy8yZy85RzVPNzZGK1BBamdVcGhXa2o1V1pXYjQxdVJL?=
 =?utf-8?B?ZkJ6eWVjUE1qV052eHZwT0svTUlkYWdLRWNwbkZOQVB2SnJDOHhDNEJnYlFs?=
 =?utf-8?B?SXc1OHVhQ1hxV1h4MUZMc3lobGlEZzBtMHlNYWZ4ZGtoL2pZNWVQb2xnTFow?=
 =?utf-8?B?aXFsUkYzdWI2UUQzQ3dVaWhBbEU0VVFVVWZ0QXVjdU14MmlMNXh4RXREWUN5?=
 =?utf-8?B?VC83K1BqZTNOVmUrN3IwbHJ3NmJmYlM3UUhlUlBKS3diUE0zaWhTWDVLVms0?=
 =?utf-8?B?ZnBvRFpONVNaN0hpbXhkRnlWamVLTzdLdjlVcEx0eXZ5cEZXUHFFZ2VVbVBu?=
 =?utf-8?B?bFZXaFJKY0RRaVpTY29JNTkwVlVpRHN2TDhPQ0Zwd0txUmhacktJdWo2NE1v?=
 =?utf-8?B?UjlPMERDOERZdEM1RVpnSTZNM1RsOFluM21sV2k2MlRnaTIwTjFDRWhkYlFE?=
 =?utf-8?B?RXRaYnlhM0RjMDRCVGZnbnlpYjRVdy9GSlV2RDF5SHF5MnFyWVMvanl6TWYy?=
 =?utf-8?B?SllORTIzM3lxMTk5TTJkWjVsSEluKzYzcTNsOXVzdkt0Q3BpeW9wVTBFT2ts?=
 =?utf-8?B?SzlCRXFIYXBQYzM3VFJrWDVqeW03UlNIczhCekdlUVpEdzJ1SUlpVWxHRTBx?=
 =?utf-8?B?dkxIVnR1b2h0ek9hZjRwUHloRlVFNGZUa3FERWlpcnhhcjE5aDYvSDZRV1Aw?=
 =?utf-8?B?dnRjd1RYK3hIbFE0cUlQN0pzWTIzSllxYTNQUkg1d3lpRHEwZXc4ZFBnUTZT?=
 =?utf-8?Q?16w5E93uBu/V14HDC8JU55Y=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8dcf05-e880-4725-74d8-08dc871174e6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 16:47:03.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+BHTRgK3wjU3RbdgXnRvnPmlg/Oo7OmA6eG9D91XtzXgpkYzE2lxsKZ9ReBd7SbUnMCflsuq/2ptEDnsfALTyOmkD4v1RxqsIgyeUGZC8uhPvMdrkP3lMqOGMo03/6+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7051
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Phong Vo <phong@os.amperecomputing.com>, Justin Ledford <justinledford@google.com>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 09/05/2024 15:29, Krzysztof Kozlowski wrote:
> On 08/05/2024 05:44, Chanh Nguyen wrote:
>>>>>>
>>>>>
>>>>> I am not even sure how to define tach-ch to mean "use the pwm output pin
>>>>> associated with this tachometer input channel not as pwm output
>>>>> but as tachometer input". That would be a boolean, not a number.
>>>>>
>>>>
>>>> Thank Guenter,
>>>>
>>>> I reviewed again the "tach-ch" property, which is used in the
>>>> https://elixir.bootlin.com/linux/v6.9-rc6/source/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml#L68 and https://elixir.bootlin.com/linux/v6.9-rc6/source/drivers/hwmon/aspeed-g6-pwm-tach.c#L434
>>>>
>>>> That is something completely different from my purpose.
>>>>
>>>
>>> Based on its definition, tach-ch is associated with fans, and it looks
>>> like the .yaml file groups multiple sets of fans into a single
>>> fan node.
>>>
>>> In the simple case that would be
>>>       tach-ch = <1>
>>> ...
>>>       tach-ch = <12>
>>>
>>> or, if all fans are controlled by a single pwm
>>>       tach-ch = <1 2 3 4 5 6 8 9 10 11 12>
>>>
>>> The existence of tachometer channel 7..12 implies that pwm channel
>>> (tachometer
>>> channel - 6) is used as tachometer channel. That should be sufficient to
>>> program
>>> the chip for that channel. All you'd have to do is to ensure that pwm
>>> channel
>>> "X" is not listed as tachometer channel "X + 6", and program pwm channel
>>> "X - 6"
>>> for tachometer channels 7..12 as tachometer channels.
>>>
>>
>> Hi Guenter,
>>
>> I applied the patch [2/3] in my patch series
>> (https://lore.kernel.org/lkml/20240414042246.8681-3-chanh@os.amperecomputing.com/)
>>
>> My device tree is configured as below, I would like to configure PWMOUT
>> pins 5 and 6 to become the tachometer input pins.
>>
> 
> And what is wrong in described common tach-ch property? I think we
> explained it three times and you did not provide any arguments, what's
> missing. Instead you say "I want something like this in DTS" which is
> not an argument and does not help discussion.
> 

Hi Krzysztof,

Apologies for any inconvenience caused by the delayed response.

I'll to support the child nodes by having different tach-ch values. I 
suggest the child nodes and the "tach-ch" is optional, it will not be 
added to "required:". Do you have any comments? Please help me share!

This is a brief binding
...
properties:
   compatible:
     const: maxim,max31790

   reg:
     maxItems: 1

   clocks:
     maxItems: 1

   resets:
     maxItems: 1

patternProperties:
   "^fan-[0-9]+$":
     $ref: fan-common.yaml#
     unevaluatedProperties: false

required:
   - compatible
   - reg

additionalProperties: false

examples:
   - |
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;

       pwm_provider: fan-controller@20 {
         compatible = "maxim,max31790";
         reg = <0x20>;
         clocks = <&sys_clk>;
         resets = <&reset 0>;

         fan-0 {
           pwms = <&pwm_provider 1>;
           tach-ch = <1 2>;
         };

         fan-1 {
           pwms = <&pwm_provider 2>;
           tach-ch = <7 8>;
         };
       };
     };


If it's OK, I'm going to push the patch series v3 soon.

Thanks,
Chanh Ng

> Best regards,
> Krzysztof
> 
