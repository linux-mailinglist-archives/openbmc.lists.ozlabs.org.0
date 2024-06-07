Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E608D900AB8
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2024 18:48:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=wafvOiCX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwnGF0H9vz3cXR
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2024 02:48:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=wafvOiCX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2412::728; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20728.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwnFR31lXz3cFN
	for <openbmc@lists.ozlabs.org>; Sat,  8 Jun 2024 02:48:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJ7H2ZP9KWxMKi96drrREq1jwEvsTLztcfie/QPXZNOLu/+8PfAv4CKC6ei/G4nNj/Sz32BQWX3Cne2KmMVCT1a0IvJu6vCJfW6U6W8Enyrmu4EMaL2C7xL2gqtwGsbaFAOdKFB8XCYPZ4jecJKPjtIT2P71sioXJCpWOWIqr8yiyMwyCXl/shFb1hjLZROVSWeowygv7ijTsDynVzkSptoWFr5VjWoVAelem6obApqwlBzS/0o2SbS0XWxmIYnu9RNgm/m9N54wh/mYZ76zvpCT5nl5rXaM1CeFO92lTWvmyWtpA0S5uF8Tb1bzmKhTzaLas0LP82of45ammxTrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CC8+WZ2qDUoV97sFTXJS9LY3VcfKKCug1RP6VoiOtNA=;
 b=OHKwX3TJQQxGAGdl+0PaLqCqTo6ow/zZ2lh6i81OAAlfDgxBxq+h/dz4qIBeCbnZAjEfWvz85QBLUPu562W5P28Kb8lgE/Kmm7ndqmjWLEahu4UupJxFbCsc/kJl97+LEOzNIUgo72qLPkK4AwnOIjcnFW6Uzh6BCCpR8gKWYhkY8cuQe0Y3s0vCgntXFbZcxWZdyqyVApcO4Z0AFCEVuv6wqHEcJiT3/tLQSTkHXoBMILtmDWPg0wWIwVs3Q5GubSuJG7rwpbdp1JZQyRRyMkSZiIsLI9iqH7Cov6IUQAZ6HGYN+5kjHTKbm5m1DA5cjwJGNFaDezF0favGAhWH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CC8+WZ2qDUoV97sFTXJS9LY3VcfKKCug1RP6VoiOtNA=;
 b=wafvOiCXZuHWOjwBGtHH8fb9S1khjyxtupKda8UNeAmoNtY0QN4m31CABcLweSVr7ZmS4PqxZDe6ZMSw1pFPNGjyfr1ftw4M6Z0Xil2Xe2p/K+ADhsFGpxRTwH0KwPzg2SUewiZQQ89I9gFl+tWxnwnJDuipeiAP2JpWABI3EFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 CH0PR01MB7051.prod.exchangelabs.com (2603:10b6:610:10c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.34; Fri, 7 Jun 2024 16:47:51 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::919c:7d6a:2069:b0ca]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::919c:7d6a:2069:b0ca%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 16:47:51 +0000
Message-ID: <e15695d6-b1b1-472a-8288-dcdfba5d619d@amperemail.onmicrosoft.com>
Date: Fri, 7 Jun 2024 23:47:42 +0700
User-Agent: Mozilla Thunderbird
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
To: Conor Dooley <conor@kernel.org>
References: <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
 <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
 <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
 <20240423-gallantly-slurp-24adbfbd6f09@spud>
 <ab5cfd8c-0e88-4194-a77e-5ffbb6890319@amperemail.onmicrosoft.com>
 <396b47f5-9604-44ab-881f-94d0664bcab8@roeck-us.net>
 <0dcc8788-604a-49c1-8c6b-fdbfa9192039@amperemail.onmicrosoft.com>
 <da94fde6-3286-44eb-a543-c2ac4d11cd32@roeck-us.net>
 <8fb38eb3-bb94-49cc-b5bc-80989d7876b9@amperemail.onmicrosoft.com>
 <20240508-onward-sedation-621cc48fa83f@spud>
Content-Language: en-US
In-Reply-To: <20240508-onward-sedation-621cc48fa83f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|CH0PR01MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c30221b-62e4-4224-7fa7-08dc87119206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?cGxhLzF1ME1mVUgyMURrS2pwa29PZ1dqRTYvOW9pTnVqdTRoZnJheVFHMzRo?=
 =?utf-8?B?UFBtSFRCYnlQNmhrL3NFNmZXZnpWL3d0bncxaVIzTld3UlJQcE5jS2prMGQy?=
 =?utf-8?B?YzhRbjJSQmNxR0NNdjNhVWVHVGNvTG42Qm5wdUdUa21LbC95MEV4T1RQeFJ0?=
 =?utf-8?B?SlhRV2VrVVp0UU8yTE9ZcU81ZzBKV1BFVE1RWXBod3hzdnJ2YjkwSWhzbXZB?=
 =?utf-8?B?ODJZVSswdExGVU52L2xNaVF3WDI3Qys0RTF2ZUdJU1V0c1lWUUUvTHhORkZ2?=
 =?utf-8?B?SFR5OFhLSFB0WjU5VEVncWFVSitlUit1OVdMZDVnbFZ3bmNJbWhCWGR4a2l5?=
 =?utf-8?B?QmxsY2lyWnFUbTU4NU1CRUZpUGk5WHd3Vjd5dkZXRjFSUUoySGI5THEwRGor?=
 =?utf-8?B?cFFOeFdCY1NQME9nNUpDOGhMSlk2S2hTZjY5d1RwQzZhbHRDcjk5T0E3T0hZ?=
 =?utf-8?B?SXk5Z1k0eFp3R2JDKzl1K0oraTQrUVFXV3RoVVpLZ3FuTEl6d09Eb1RhOXdK?=
 =?utf-8?B?OVR6bTBOWFd1RisvNjVYSERkalBjRERIc0dRUEorSXdMMVh6V1RLZHZlWnR6?=
 =?utf-8?B?TmpnZDlOV1llYzBramM0OGcvdzZGVEFMVnNZYmM4cWltZW9uYVY4R1lHb3Z4?=
 =?utf-8?B?M3ppQncrWjU0b0VDNVZOakxubEpxb0h6OHRCeUJvYURDQ2RJeFV4c1VYK0ZN?=
 =?utf-8?B?Q3U4NEt6V0h1S0E0dXZXa055MjMzSUk2dnRNN3U0UHdVczA0RlVkQ0ZTRmhK?=
 =?utf-8?B?emVZWnZlbk5sVEh3WmZNb2lZYXlLN042Zm50QmMwcXltZEdrOFFkTU9BYnRm?=
 =?utf-8?B?Q25aSkFTQi9DT3hzM01zYUhJcUFxVGltQkpiK0NlamFBaHM3WVZ0cXNyT1NK?=
 =?utf-8?B?OWtYbDhrYlBPZTNkRWxrd1V2Y0NZODhKTk1YcWIycEN1eWtVNG1rd1ZsS3lC?=
 =?utf-8?B?OVFHOVlWK28vL0xwU2tSYnRnYzZpSWdTR2YzZVV6eDI0SnBSVkQ5aGEwbUJV?=
 =?utf-8?B?UTBmb3d5NE80U1ZTQ29Wa1p6WStCT1liS29NQWVMS05ETmJkaWtjdWo3RHhG?=
 =?utf-8?B?cXVJb2ZYSE9ScC91bW9WQjNCcS8wckNMUlU2bmxlQThMUzc3VFloUXljMXdK?=
 =?utf-8?B?KzBVS2lia2k3b00wUU1GVmlrSGdlRm5DLzJacVdJamhDQlNDMzNMU2tTeTJZ?=
 =?utf-8?B?M2FucWVuc29sdUVpRU1DS1g3b0RVRkFUZFhsRGJzU1RtY1M5akF0dVhxQnNu?=
 =?utf-8?B?OXE5cUF1TjlSYmEvSG04UjFQdmJnS0pUMzgrL2xLMDFwa0RQNW4xOG8xRGVY?=
 =?utf-8?B?TjFLaWRQbFc4ZzN4WnMxclFSZnd5dm1XZ296T1R4aFphZUFJZ0dOQjY3VGxP?=
 =?utf-8?B?TTJVYi95U2UzZXdKZDlQTzNWY0dLS2htay9IZWRPdXBvSFlTenlnZjRxSCtN?=
 =?utf-8?B?T0dCMFlaU0t5MXUyNHp4VVNWeWtJVWNqRDhVQzM5blRBdUFmeEpPekNHc2ww?=
 =?utf-8?B?WFd5cmJ1ajVYWUxCQnlyTk5QVEN4b2ZyM210QkcxT2t2eno4NS9UOGsxcmhm?=
 =?utf-8?B?V0xycFJYS3QzTTFCYVplN3FmWG5Hc09kMGcyeVk4c0dIT3lWcDh0OFB5Uzdz?=
 =?utf-8?B?RENVdnRXR2VBSmdMQUYzaXFyOFhVaVVhVHRpMnQrSUtQKy9oeVJJQmI5b1N5?=
 =?utf-8?B?MHBTcnBVUXg2R2lEV2ozTmtJa3YxSDhHNU1ldnlhVWJQYkVONEt2NEZ3PT0=?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NTgxaTV6RU1DV3FkS1hyR0tsbDBiTjc1bFV2NXJQdWNHWVNQbDc4RFBIaUVT?=
 =?utf-8?B?dzRDcHN0Z1dZaWt1UzlXR09ZcEJNb0FZeDVyQ3FqN2MyVWJQMC81eG9aNEtz?=
 =?utf-8?B?L3R2UW4xQXF3VHo0WXNEbEcyTXp4U3lFM3VwMGV5TlZQZDRrL1NFeDV2MmVn?=
 =?utf-8?B?ZFdlcTYvNXUvbGRvYkVPYW9TOWxVOE0wREpQNHNLZzl1c0FLajBZNkdhMHRJ?=
 =?utf-8?B?VExZbzZLTnRqTlUvQkZ6RTcxWjhKMGZ0enV3NUdoKzlRbmF0cXRldEJ1Q2I3?=
 =?utf-8?B?dDNNcHNwalVGZzZOWjB2TjdlSlhGczVrTDFCZnRKdWMzRitGL3lqNnovMVBa?=
 =?utf-8?B?QkxhNHlJc1ZXaU43U3IrNnJmaDQ1UmFvenc3RWI5V0lLeDBXTW9IL2ZTOHJB?=
 =?utf-8?B?bGQvUFIxckRsSFRzNzNpaGhOMUlwVEpEdnpLbDQvd0tOM2dDMkhHeEI0c0lo?=
 =?utf-8?B?SUp2K2wxMnQwUjQ4UGRBdmROT0kvcU16MnhLR2hJdllSRnQvUEJnZnJwTUVW?=
 =?utf-8?B?ZVlCLzNpVFVGZDJJZFI1NFRacGhGSzVQM3lxdEtyYUdKTGg0YUZzc2lXdWpU?=
 =?utf-8?B?NTg0TmhDTjF2Yy92RTgxWlBTdTd0ZDZQNEppdUQxajZzeVVKUUpDN1J4UGVF?=
 =?utf-8?B?K0N0VTJrcmRpTk0wZjh3bjhEVkN6aWhBVHg0Y3MvU3ZYV1JXeVhlRG02b3pJ?=
 =?utf-8?B?eEZvc0dlMFUzZVl6S1NabmhwZGN0cFpzVWMrZVRvdG9EUnV6Sk1PWHFqS2pB?=
 =?utf-8?B?Z2lxRHY1WWt3cUowdkNIMGV3UGJaTXhtQUZqSlY2OXhhbjB3dnJPZ3lpMm8w?=
 =?utf-8?B?QXk3NGRnUXlXM3cycGxZUXBqaEEzRDJ4UjZXeVJ1U0JOSjJENEFpeGo0OGRF?=
 =?utf-8?B?RjVYaCtzSGNtdUFQMlFaVHFnaXdIRlMvNmJjNEY1N2lRRGdnY2tQNkZ6MnVq?=
 =?utf-8?B?cVVadFF6OHhUUGdlNm1HQTFPemM5bVAwNUFsODVjV3RkSUsvKzZjQXd3eG15?=
 =?utf-8?B?dWR4VjcvZkJWT0VLa1N4ay9seWpZSm55RmdoSk5SN254SlFLeVBXQldBMENF?=
 =?utf-8?B?elJnSGVzNjUvT1hvOHJURmFtQkRkNGlDei9xNVgwK2Jwa3crQVZFL1hheXNu?=
 =?utf-8?B?L3NNK0hWWjRyY3VTQy9PU2EzYm40NWlRNXBrSDV0dUNVNDd3NFk0dmR5azla?=
 =?utf-8?B?NzIvakFFVnNmaTdXamZseHhGNEdndEROMjdYSExqQnBjeWFpU3FqOFlaQmZM?=
 =?utf-8?B?bFZEdjllMWhMWUp2ejQwZjJKQTdvd0Rob3RONm1lZlFtT1RuQzFOc1VreFlu?=
 =?utf-8?B?SHRkUkpGNk1PMUtVYkVpMmcwbnNTakx0cjY1dkZZcjB3UWs2V0VsQnhtaXla?=
 =?utf-8?B?YXBDTW52NFg1TnF0RytYcSs1Q2FSeFZmWlJvQjZteUVpZzczUmtYUDZUMmEy?=
 =?utf-8?B?ejlFa0YxeEFSWm94YW8yRUhncmt3L1hhTmd3UzlWTGlUUzlEVG1lZjRFZmFF?=
 =?utf-8?B?RUJCOGZzUzNGem9FS2twcWY2alF1YmQxYlJ1OWsxUHowdWNRTDRyS3NyTkls?=
 =?utf-8?B?TjVqVWR1RXJiMkFGc09wUnN2aFlFL09yOGVyVHZVYTRyYi91S0pZWURTRm9u?=
 =?utf-8?B?QWpKTnZFeXIwb2NQeXNMQ1JzRmRtYitLblFFbXNpYWFhMi8yakluWlpJaHNT?=
 =?utf-8?B?bTFod3VoNkJ5eUhjbkhqUXBRcnpRTVBhU0RJOGNHdHZrK3g2MkFHRzZBbTE5?=
 =?utf-8?B?L0ZQemJmc0l1ME96aklUL3BmYjRGSkczYVZtZE9iejAwbFE5ZkZFckFRd1VP?=
 =?utf-8?B?UVY1MzFoN1dxSm9nbDZPZmRvdm8zR1pzSWhXR1ppTGlGWE9hZTgyd0ZCbjRB?=
 =?utf-8?B?cCtvcVVGenJhUnVCZkY2MXlmUGdXOXg1aHZBeExoNG9Hcm5MN1BaOTlzd2p1?=
 =?utf-8?B?NlFMb1ZCVXdhUEZBbUQyQ0xpbEExQ0htcnprbWFzS01iVXB5VEhjcXpSOXAw?=
 =?utf-8?B?NW13Vi9ObEp5eTJMNUlWRzVKczFDN285blZDTlRML1FVakRPYlZNMmM4Wjll?=
 =?utf-8?B?U2hDekZQTEZTZHViUWRVN09LbG9CL2tKZ1RCQjMzRkZOcG5ObjFrSlBOWWk3?=
 =?utf-8?B?QjFVcWd5OUdnakRROUNhVnVaUTVCdUdwcVhrcHBhUVZlWEZaR0YxejJyYnl4?=
 =?utf-8?Q?ldicyhm0Fveks1QwUkpYh9s=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c30221b-62e4-4224-7fa7-08dc87119206
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 16:47:51.7019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDIKC3S6b5jiQJrHO4PI65tRRNmvPMcGlX4pDbBYwB+3N9fTjNrAp0iwHbAL6X1JVV/wCVM92IUDcwoU4URNjKnw2N6UrRDU+m+q0ziFTVOIb6HMjNk5J1bNW92PdnsP
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Justin Ledford <justinledford@google.com>, Guenter Roeck <linux@roeck-us.net>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 08/05/2024 23:47, Conor Dooley wrote:
> On Wed, May 08, 2024 at 10:44:34AM +0700, Chanh Nguyen wrote:
>> On 05/05/2024 22:40, Guenter Roeck wrote:
>>> On 5/5/24 03:08, Chanh Nguyen wrote:
>>>> On 25/04/2024 21:05, Guenter Roeck wrote:
>>>>> On 4/25/24 03:33, Chanh Nguyen wrote:
>>>>>
>>>>> pwm outputs on MAX31790 are always tied to the matching
>>>>> tachometer inputs
>>>>> (pwm1 <--> tach1 etc) and can not be reconfigured, meaning tach-ch for
>>>>> channel X would always be X.
>>>>>
>>>>>> I would like to open a discussion about whether we should
>>>>>> use the tach-ch property on the fan-common.yaml
>>>>>>
>>>>>> I'm looking forward to hearing comments from everyone. For
>>>>>> me, both tach-ch and vendor property are good.
>>>>>>
>>>>>
>>>>> I am not even sure how to define tach-ch to mean "use the pwm output pin
>>>>> associated with this tachometer input channel not as pwm output
>>>>> but as tachometer input". That would be a boolean, not a number.
>>>>>
>>>>
>>>> Thank Guenter,
>>>>
>>>> I reviewed again the "tach-ch" property, which is used in the https://elixir.bootlin.com/linux/v6.9-rc6/source/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml#L68
>>>> and https://elixir.bootlin.com/linux/v6.9-rc6/source/drivers/hwmon/aspeed-g6-pwm-tach.c#L434
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
>> I applied the patch [2/3] in my patch series (https://lore.kernel.org/lkml/20240414042246.8681-3-chanh@os.amperecomputing.com/)
>>
>> My device tree is configured as below, I would like to configure PWMOUT pins
>> 5 and 6 to become the tachometer input pins.
>>
>>         fan-controller@20 {
>>           compatible = "maxim,max31790";
>>           reg = <0x20>;
>>           maxim,pwmout-pin-as-tach-input = /bits/ 8 <0 0 0 0 1 1>;
>>         };
> 
> Why are you still operating off a binding that looks like this? I
> thought that both I and Krzysztof told you to go and take a look at how
> the aspeed,g6-pwm-tach.yaml binding looped and do something similar
> here. You'd end up with something like:
> 
>          fan-controller@20 {
>            compatible = "maxim,max31790";
>            reg = <0x20>;
> 
>            fan-0 {
>              pwms = <&pwm-provider ...>;
>              tach-ch = 6;
>          };
> 
>            fan-1 {
>              pwms = <&pwm-provider ...>;
>              tach-ch = 7;
>          };
> };
> 
> You can, as tach-ch or pwms do not need to be unique, set multiple
> channels up as using the same tachs and/or pwms.
> In the case of this particular fan controller, I think that the max31790
> is actually the pwm provider so you'd modify it something like:
> 
>          pwm-provider: fan-controller@20 {
>            compatible = "maxim,max31790";
>            reg = <0x20>;
> 	  #pwm-cells = <N>;
> 
>            fan-0 {
>              pwms = <&pwm-provider ...>;
>              tach-ch = <6>;
>          };
> 
>            fan-1 {
>              pwms = <&pwm-provider ...>;
>              tach-ch = <7>;
>          };
> };
> 
> I just wrote this in my mail client's editor, so it may not be not
> valid, but it is how the fan bindings expect you to represent this kind
> of scenario.
> 

My apologies for the late reply.

Thank you, Conor, for your recommendation!

I spend more time checking the aspeed,g6-pwm-tach.yaml . Finally, I'll 
support the child nodes by having different tach-ch values. My system is 
designed similar to Figure 6 (8 Tach Monitors, 4PMWs).

I'm going to push the patch series v3 soon.

This is a brief binding.
....
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


As your example, I saw the #pwm-cells = <N> . Please let me know, what's 
the purpose of this property?

Thanks!

Chanh Ng


> Cheers,
> Conor.
> 
>>
>> The sysfs is generated by the max31790 driver are shown below. We can see
>> the PWM5 and PWM6 are not visible, and the fan11 and fan12 are visible. And
>> all FAN devices are on my system, which worked as expected.
>>
>> root@my-platform:/sys/class/hwmon/hwmon14# ls
>> device       fan12_input  fan1_target  fan2_target  fan3_target fan4_target
>> fan6_enable  of_node      pwm2         pwm4
>> fan11_fault  fan1_enable  fan2_enable  fan3_enable  fan4_enable fan5_enable
>> fan6_fault   power        pwm2_enable  pwm4_enable
>> fan11_input  fan1_fault   fan2_fault   fan3_fault   fan4_fault fan5_fault
>> fan6_input   pwm1         pwm3         subsystem
>> fan12_fault  fan1_input   fan2_input   fan3_input   fan4_input fan5_input
>> name         pwm1_enable  pwm3_enable  uevent
>>
>> Please share your comments!
>>
>>> Hope this helps,
>>> Guenter
>>>
