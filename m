Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4E79489AC
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 08:56:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=p5lCPxxn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdPGx4Tlqz3cl9
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 16:56:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=p5lCPxxn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c10d::; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdPGL5wrXz2yvr;
	Tue,  6 Aug 2024 16:55:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClMs2iO9f5N95uF6UZQBstsYDV4pCG1Xa3a2ksgiWgeX6Pg70o+CCIC7NvcU8M1saCso74B68OZTqZ5qA0+OcWjC6WUFafo5O7RLTFl+sGRm+g8yURJfoGvwXvd7C0wSRlUFppsyqwxIRWLWY2JFsx8lqoTEfJFpLAwjMXLTKjj6b+UWH4dkvNBRqnSCWXgDUmCVIlU6+u3XXyog1PNAlqnCRnbeJ+9XvJyS2uRaSLaHUs8HDrwqiAcCMkpUgSsBqGYfmQq0pQ5Yte6yd3+9isUlHfEAtbxvZsqEwZKYGx9YDsJ4nYiWbef3hhL99oT/XfSXCTea+UwadA58JkJQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYJDD1FKEyWgZMIaaPQk1J/BM4FpGTC0wdy2tznrSO4=;
 b=CZsJ7k1aygujtVc1AzuKVdUmpI4wRBpNaEZiR4zswIGLMG1rJUrrNBYN7IYRvnc6NkU6t/B1PcBjF6ozfBoMBOT1W8eVHseLv/+cpTj4dO3IO+jBixtX2PqI3jFxO4p6Xa8jYkdKE275LubLyWUq8SbjQCMcciBX2b3GdLBBxyIVsYONMzuXLzjpNSzShfj7TpZjq5QPnJt6wG5svhYBevILsRBVSL5x/vbMyaBUONvEpQKJpb5DwyOSrdeSy8udfCQKk6LIODM538MNx0r4Xs9hF/fE5H7aQb8xfvC8Fzydrm/F4SB3uJGkrAgzo+hVxqLrwhq0rs3jrLxZf/7mqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYJDD1FKEyWgZMIaaPQk1J/BM4FpGTC0wdy2tznrSO4=;
 b=p5lCPxxnAKaYLo7hEsVoVgHLIG5BwUOixlqMn8NMJA2wf9oiDgRYkCorslsFqOv2xIOAKzEXl2YlRSrKWmGxQdSVf3FY8talcjsgfiI6hw9a/wNAzR+WvJ1OdFR2czK9tYdGhfkoIwK74UzAdFQF8u8RmllyDKvPrO3ikCOR3hQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 CH7PR01MB8931.prod.exchangelabs.com (2603:10b6:610:24c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.25; Tue, 6 Aug 2024 06:55:24 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 06:55:23 +0000
Message-ID: <23b7e08c-b9eb-408d-ad56-76cce82906e2@amperemail.onmicrosoft.com>
Date: Tue, 6 Aug 2024 13:55:12 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Update the device tree for Ampere's BMC platform
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
 <172252600912.120761.16384387883905749466.robh@kernel.org>
 <1c2dca43-444d-44a7-b304-5fbd59b788a8@amperemail.onmicrosoft.com>
 <6171be101ee10aa2a11e021caafe877eb428412a.camel@codeconstruct.com.au>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <6171be101ee10aa2a11e021caafe877eb428412a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:930:a2::10) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|CH7PR01MB8931:EE_
X-MS-Office365-Filtering-Correlation-Id: 9155ad3e-bf1a-47a3-f9c0-08dcb5e4bdbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?KzJicFkyQjRGV1JLK20vL3MxOHdiVjFVSmxnRTNGbklaR1BWRi83U05XQTFm?=
 =?utf-8?B?RUQxVE1MS1RyTkhLMG9zaFhqd2tWdkdRcG5RcHREVi9zN3Rxc2ZoRU43RmJN?=
 =?utf-8?B?bmU5ZUZuays0ZU9ncUVKdEQvWmRMMzFhNVBLMkJ0MTFvSVZiN1g5WmtMVXc3?=
 =?utf-8?B?cjg0SHNucXhWNThqMVZQYzFNT202VmVPc0pibGtBWURqSDJiVFRmajVPTXhp?=
 =?utf-8?B?U1VjcE41Rm1sdUZoK09OSW1USlljeXVnTHZOQUdaaFYxQUNCUzFNWDY1UGxD?=
 =?utf-8?B?TFVHUFJXV0pxdjJmNmFCNjdYR295U05QQ0oyWWVGN3I1U2ZhUmp1b2FHQmlu?=
 =?utf-8?B?djgyOUlxRVorZFN1Tzc2bVZTUWZqeFBKdzFMa3ZTM2ZTc2E1clptMVorTXhN?=
 =?utf-8?B?cm1xVjJCWTN1a2ZQN1p2bnlzdk1FOStoTE1wTDB5cVR3Ym8wL0VnOXUrVDhn?=
 =?utf-8?B?dWpML3J0ZVJJVHVGNzk4b2h3Q0Y4aGJYWEpGdVEvbnFBZXRzOE1vTDdseFgx?=
 =?utf-8?B?ZG1oRUFpMmszV3pucE5GbURndU4wTVNrVE81djBEVXdITWNrempoamdYTE9p?=
 =?utf-8?B?OXRpeStZa21lY3pKb2Q1V3hiQVFoTmM1eVZnNzhmcjRSWGxnTjRrdjlNcjhs?=
 =?utf-8?B?S3hLcG5CWDl5L2RDb3dwOFk5djJXMG1QRlNmNGZSVVlvckpYWHVJTWxMVnZG?=
 =?utf-8?B?UE9NS01ZSXNQeCszdlpQaXkrbEJHYllSeUdnYzRlRnhsZ3cxQ0lRTnV2bEVX?=
 =?utf-8?B?UnhPZmEraXk3KzB6MmpYcGhzQ0Z1MTFpSElSNDdtcStuSG1HWjRrdllnbEgr?=
 =?utf-8?B?NlkzL3l4ZWpaM2p5T282cHRQRzVLZGtZeGtDYW1WZnVOYmpUa2RqTW1ZMHRO?=
 =?utf-8?B?azZkdEhtT0JJaWdBMTJya25ERkFNL3hJZ05aa0dvSXc1UEFBT2czUlRkc29G?=
 =?utf-8?B?RTdtTU1kVi81M3A5enRDdlpEc0ZVR090M2VWM08wTzJGOHlSbW55WXRCUTBH?=
 =?utf-8?B?L21uTVlXVW1SWDRseC9BOWtlUTNidGMwSHFWeE1ib3BxNFZxcTVDeWZTejI0?=
 =?utf-8?B?MlkxRG00Qzc1em9xdGZ3NVVObXFCYjBxbVYwYjhTWDRHS0dSKzFQNlBjcGN4?=
 =?utf-8?B?TVVNRU1QY1BBNHM1bklHQ1RGcmFvd0EycndiNUI1cXJia3RIRk5ZdXRIQXVO?=
 =?utf-8?B?RjkrTWRjT0NEalBkeC9WVHZOR2V0ZmtkS2taRWhaZk1FSGgzaUpnODd4eVo5?=
 =?utf-8?B?bUppd3FtbkVhK3JTcjA3cmZkRE1YYTFLU0tEcVhRMFRXQUxHSVhoaDlMYldz?=
 =?utf-8?B?Z01iaW5nWVo4VWIwdnBwUjB3WHVvWTZIY0pmWVlSdWJYQVFQNTFTN2w3U25k?=
 =?utf-8?B?YlFQNzlUVzVVVTNMbU1lazA3WTdKS1NxWVMybC91WVRjd3JpZ28rdlZhTjBn?=
 =?utf-8?B?MzBQYnMxMlJRM29mWTFac1lQL1RzRDVDYVE5QlRnN1A0dzFiRHB1MmlsbmNk?=
 =?utf-8?B?d3JFdVhEVXVNZGQ1RktnNmhFMkowQVBXMEhJOG0vTUw3VTE3eElSclUvbVBD?=
 =?utf-8?B?UFVaT2d5dWRiREQ4RmJ6dVZPdHZWYTFvL3Z6S1gvTUpIcktLRXhPR3prSlVS?=
 =?utf-8?B?QXdGdWUweEo0WW9KZFFFUStTRHlrZjVhZTFkd21uaDZQUEprdWVlZUNrQWox?=
 =?utf-8?B?cU8yK0xqeFFScGM1TFNhMFh5c3RNTW1kK0dtaHJQSUFrUU5VaSs3aGJNemQ3?=
 =?utf-8?Q?JLy/cQVlnQE4LKRIqM=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bEsvRm8rNG5WU0REY3hYU05LbWRHUjBWZy9zUXY2ekYxQ1h1NDMvUy9GeUpR?=
 =?utf-8?B?ZzU4UlIzVU9oSmdlZEVDaDY5VFFxajZPOGd0R3ZMNVJDOHQ0VTc1ZFRqYkZ0?=
 =?utf-8?B?N3ZSS2xPbVdaWXdNNVkzTURZcGkxRUxVVThEZUFHb1N2ZjRibXBHNUNrT25j?=
 =?utf-8?B?N0picHl1S1pHNjRlWGhXeVM3d20xelZWL3EyekFTWlp6UG56MTFVTU0xRjE5?=
 =?utf-8?B?aGwxYlFoVHFqUmZ2QTNnbzY5YnRsYS91cEZDeE0vSW1qM3BmTFYzNE1icmlE?=
 =?utf-8?B?Zkw4eGlVYlBLTnVpTXFIVFNnd2sxK2E0M1V6cUswV3NmdWpLdmpoQkp3R0Y3?=
 =?utf-8?B?T2pqNE1sTVZDMHQxUWZORGc0MC80eVNHanRxcmptZnZzRkdSR2E5Nyt4MlBw?=
 =?utf-8?B?U0o0cGFQUmt1dWRLZ0FDcnpmSm1CK1V1bkxqN205djhYMWNFRHhEelhJbHZE?=
 =?utf-8?B?Tzc0WS9aOTh5WnFmbk5zM0R4NDVKZVQ2ZWFaZk9ld0QvM1J1QTBBNmNsM0pR?=
 =?utf-8?B?T2N6UlNkeHNDOStKaGJuTHZoTjkwQ2EzNzEwS2VqYzVnMXkwM3pRbnJocEJu?=
 =?utf-8?B?SDJrVlljamxGS0hRV2R4bEQwa3BCQjRBcFdtcFAyNU91Y1BiSks5b3V6TzRD?=
 =?utf-8?B?QXpHaGdrZlJXRlNIRG5DSUJRTkloV29sYUpsdTQrUmdzdnFKb1U5N0VIU25M?=
 =?utf-8?B?d250cEZTcjc4VkpTNlpybHJvVVA2WE1YRVRIaHdTZzhwajRpdFlDMkRzY09E?=
 =?utf-8?B?S1d4WXVsMzkyc2ZRSG5xdkRMQVkyeU9ZSi9RdEttZERwT25kdDBpNW9JQXRD?=
 =?utf-8?B?RnFNbzZIVWN0Z2RwNHdKVm8rZndRSTdpMEl4ZVB6RkI2azhIL0dZMFYxTCtB?=
 =?utf-8?B?MEs5SjN3N0J4dWZ0b09RdXJnWUR3OFNZUGU2VWF3ZExmWVoxdVZvTEtWcEd3?=
 =?utf-8?B?RVc4aTBRemQwUjUvdGFlV3NiZTZrNnVqM01mL1hJYXNzRWh5RTNFZ2IwdmpJ?=
 =?utf-8?B?blZ6UmMxdHJIY0t0OWhpbTJtVmxVUGFVUkt4WVNUWmtMQ3JCT0srTHdpUWRl?=
 =?utf-8?B?aHA0dC9pbUp1bzlma3hSMlg3VDZkbW9vYzRkeSs5bWJISGtITHhPOTM3SUtz?=
 =?utf-8?B?anRscnpCMDVYODY3M2lNanFQTU0zNmQ2Q1hJYWpBVEJiUzR2cUxIZnVkWERl?=
 =?utf-8?B?bTF6VkI5VGIvczlzaVd3VmRnSDJ6czJNcDU1VDRTMlZWMEphbUxQL1VGNjJ6?=
 =?utf-8?B?c2l6dTROQ1lPQm9UNGt5SXJCSjBLVkxra2xGUDcrLzFxMHA1MC9jUkpwSDFU?=
 =?utf-8?B?UmVQYzdHTmtleVNWKzN6Q3puZHFVcFByWWxKTUo2NG91WnBDeWc1d21zSU9N?=
 =?utf-8?B?bG1WSVYycHJYUllWMGdBNU0xK2tWaUE3ejdqL3VnZVZNV2thRElyZ09OUnZG?=
 =?utf-8?B?a1NJYVBxbVd3UExubFdPWS9YeTNmbE9iOEhveGlLcllBRW1CaFYrL2dIM2Vi?=
 =?utf-8?B?MmZrV09ybWUyTk82Q3VxTHVTY1pwVDBIVVdVRGcvU3ZuejlsTEpmS1hKTHBr?=
 =?utf-8?B?elVSSWtjb0RSSldhbXJHSXpxLzRQVnY5WW5vZUdSNG9TZ3VkTXdMTVlPY0lH?=
 =?utf-8?B?SFlSZWdvallCakszTVlKdjhJWnVDU3FqakU0RG5PMmExS2xGUjAyMUpQZFZr?=
 =?utf-8?B?SXNLd09zbDBQMlNJUWRIRkRmK3NqZDhJZ0U3dEltZnhSbkMvcnFKdUZlYm5J?=
 =?utf-8?B?OUFtak0xckgvaDRFVXVZaTRMd0pRUlZETS9HVHVnQXkzcWdMVlVLUlJYWUxG?=
 =?utf-8?B?cTFKRjZCbERqV2dEQzZDQS85ZllpL3pmbVZiVFJkeEtZZDl5NHA1cDFXRHBn?=
 =?utf-8?B?VHgwa0JRQld6S2VBNURKZ0VqdmhkV2NjeENHek1meGdVRWN1UlZsQWs0bzJz?=
 =?utf-8?B?dzY1dmh2NlI4NmZRS1FnUzlRdWtIQzgxeTU2czlmbUUrZUhldGcwYzYxb1Z6?=
 =?utf-8?B?NmxiT0VqdGoxZzd2clVMSWRJUkpDVkp2bS9hQUUrTHhPdHZ6YzB1a3l1c0hk?=
 =?utf-8?B?a2lHL0IwWE5wSHloOXduUmw4WmpjTngxOW9jSGhhd2NodFE5VHZrSGhXMDFv?=
 =?utf-8?B?aGhxMnI4eFlFRlRaTUxHa2hITUp1Umk3MnRxYzBqSVVKWFd5NCtSNTYvRTU4?=
 =?utf-8?Q?Qsw89X25GBYdxQnNc6Kxayo=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9155ad3e-bf1a-47a3-f9c0-08dcb5e4bdbc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 06:55:23.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MPcBokuqpEZTr+ls1eX8ix9BrttahRUS0/tpWjSzNJZ5qe7njvDe0rMhK0sHJ6kZMgZ6RMJFqWKXdXE5ffgojD3ZVgVr46Fr3y6yyvpB7OI16zwlamIJt5oHwlGwpq7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR01MB8931
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 05/08/2024 10:59, Andrew Jeffery wrote:
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
> 
> 
> On Sat, 2024-08-03 at 10:49 +0700, Chanh Nguyen wrote:
>>
>> On 01/08/2024 22:29, Rob Herring (Arm) wrote:
>>>
>>> On Thu, 01 Aug 2024 09:12:10 +0000, Chanh Nguyen wrote:
>>>> Updates the device tree to support some features on Ampere's
>>>> Mt.Mitchell BMC and Ampere's Mt.Jade BMC.
>>>>
>>>> Chanh Nguyen (6):
>>>>     ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
>>>>     ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
>>>>     ARM: dts: aspeed: mtmitchell: Add I2C Riser card alias ports
>>>>     ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
>>>>     ARM: dts: aspeed: mtmitchell: Add LEDs
>>>>     ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
>>>>
>>>>    .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  16 ++
>>>>    .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 152 ++++++++++++++++++
>>>>    2 files changed, 168 insertions(+)
>>>>
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>>>
>>>
>>>
>>> My bot found new DTB warnings on the .dts files added or changed in this
>>> series.
>>>
>>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>>> are fixed by another series. Ultimately, it is up to the platform
>>> maintainer whether these warnings are acceptable or not. No need to reply
>>> unless the platform maintainer has comments.
>>>
>>> If you already ran DT checks and didn't see these error(s), then
>>> make sure dt-schema is up to date:
>>>
>>>     pip3 install dtschema --upgrade
>>>
>>>
>>> New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ampere-mtjade.dtb aspeed/aspeed-bmc-ampere-mtmitchell.dtb' for 20240801091217.1408809-1-chanh@os.amperecomputing.com:
>>>
>>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@480/fan-controller0@20: failed to match any schema with compatible: ['maxim,max31790']
>>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@480/fan-controller1@2f: failed to match any schema with compatible: ['maxim,max31790']
>>>
>>>
>>
>> Thank Rob for your review!
>>
>> I am aware of the new warnings you mentioned. For more information, the
>> schema binding of "maxim,max31790" is being progressed by other series
>> https://lore.kernel.org/lkml/20240414042246.8681-2-chanh@os.amperecomputing.com/
>>
> 
> For now can you please remove the `maxim,max31790` nodes from your
> devicetree and re-send? As it stands you've been asked to rework what
> you proposed in the thread that you linked, and a quick look at the
> hwmon trees suggests support for the max31790 hasn't been merged.
> 
> You can send a follow-up patch adding the nodes to your devicetree once
> the binding has been merged.
> 
> Andrew

Thank Andrew for your comment!

I'll remove the `maxim,max31790` nodes and send the patch v2

Chanh
