Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E19951716
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 10:55:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=rsu0hNFz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkMXy04ZTz2yVD
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 18:55:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=rsu0hNFz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c10d::; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkMXP71w5z2xGg
	for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2024 18:55:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3GBK4W1kUJSaYUB8y8gtJxCCEsS2VGhwSNwiGAjhMgxLriV2vxbMTvhEjgstcAFpcxSYBCTH9dH6bf0Huw2N0lU7uEU+CtUyszcDgI/I3A+z84KRLje7ttuo+kiFsakHMx7qfC9BSrWDDeaPaJjzM5kkngCfT4qStl1NJWtYWj+1lrTqWSszqx5Bo+7s3akdtZbrQkrhomN7Skm+YEBQVa4lzYOTM09GNKFiPWwMXFKo4S9HvC6kjBZ2CQ3Wvye0E0HBnVy8DcfsOvwk94clr2s/+dNmR3hl6fzUOq3nwW45I+LN1tCv7Zl0xmh9IKoL46ZbcM4iJzzUfcHLw2Qrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ws/a2UBKl/Wogh7ZchAVwMBuE1wHtMOjpRjYILx4i4=;
 b=lqGpjOfdcGeJK5Tzg2sW5NqX9MzKG8BQS8d93mNlXBDheX8ubZ/KVzD4ZTmpcqpBYqwo6vZvXQsSWoNmsJrPFpjRB+c0rqTORQmx/xOZr1+vUdVCrWz8+cUxuRid27Xzhy2iY0rYvsuOR1VeQXkJQSGcNW6Sz7LHz7CxTfCb/aaKwHqmWLuWa4GT2mGNWgigfnoQVDu1tu2WQRE9Tkmx1fWNHKDzgEkz2PtWwyF9O1EFFXnXh725vcxZCI2JznVPQeIn0aeWJYq0AwHgL7oC0baYQQNcOdkqkdF/4oZeJdCOEW5LX/1YcBv9NDf+JAcNWLSyZPB3dodbXl+IX2+NYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ws/a2UBKl/Wogh7ZchAVwMBuE1wHtMOjpRjYILx4i4=;
 b=rsu0hNFz6gO4P2iF3iCOeH2ICbOAQ/I8+R6U2JZEbVUAxpDxMXUGIIbuLEgCZI8ztTVH8CA0aI8+gRH8X3mfE91gFkmqQxa/mrf3i/1ePqyA8mCkn0K0ZDwRHFB1OGeYPraG9fMTxvkkJDDc90UBmDKStAwzLNVw32emQGqfcfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 MN0PR01MB7611.prod.exchangelabs.com (2603:10b6:208:376::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.22; Wed, 14 Aug 2024 08:54:47 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 08:54:47 +0000
Message-ID: <30517c7c-8b42-4bae-905b-2d0aeee986c2@amperemail.onmicrosoft.com>
Date: Wed, 14 Aug 2024 15:54:35 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: hwmon: Add maxim max31790
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240813084152.25002-1-chanh@os.amperecomputing.com>
 <20240813084152.25002-2-chanh@os.amperecomputing.com>
 <f9f97553-a50a-44c0-b817-3a44f730cfeb@linaro.org>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <f9f97553-a50a-44c0-b817-3a44f730cfeb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0125.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::29) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|MN0PR01MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 796b6709-34f4-494f-dd46-08dcbc3ebf78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?bFIwemlKVW81K0Q5a2ZCWHUvQ25nMVM4eFNYZS9mMnZrNC9yRFI4R25zYnBG?=
 =?utf-8?B?YU8xYUJYdjVWQzhJNlNDTFhXbzhwbUhqNEVSK0NaWkRlbG0xaWJrWVMyNVBH?=
 =?utf-8?B?SXY3YVhVdXlMZWdjQ0Y0T3VYMnV6b3UzQU8vSCtBd011V1RDenBNT0Q4b25s?=
 =?utf-8?B?c2VpdHlkOUEzaHVhbENLL0t2L3h3b1dVS2hQUUpKVUpzVnJqY1pTcXRVbWVX?=
 =?utf-8?B?enpXc1FETWI3MjhnM0N5dDJoZmRZWjdFMGFzZ2hjZHN1Y3locEpEaXRjZkFI?=
 =?utf-8?B?bnpXbjBVYWwxaHhDSjNMTDY1ZWNlbVJVTGxuZmRWalpLQi9BeklzLzdKTStS?=
 =?utf-8?B?UjMyS0xMckpjcGp1UU9GRWRlR0RrLzhoUFpzZi9QdnNSak12Qml6S2hSdEZX?=
 =?utf-8?B?L1FMUWNpYkNQYnNzUHZIRk9Lc1JVNmI5UFdyNlBQSHRKeGY4WGZ6MDM0NUk2?=
 =?utf-8?B?WTg1a084N2pBc2dhcmZWenArUE5TeXgvemJMVzFLRXpJM2xiNzFFZDR6SHhC?=
 =?utf-8?B?VEh5ZVN0aVBQeFZxbHByamxDSTRKWUdJWHB3MG1CN1NneXphOXQ1TDlHQVo5?=
 =?utf-8?B?eWVPdmxnL1g0UVFKUG1rZzlCNWZ0ZDNOaFdncHdGNTFDam5IdFpIU2ExV01T?=
 =?utf-8?B?bDFIb1c4ZFp2MTFIdGpRN0IzemZLakhZZWNyNGdjUFhwUUVoNjhpQnVaYXN1?=
 =?utf-8?B?czlENWhhSmxtTnFvN1ZINnVLbkhaazd4bXdoYi9JcWdFb1hkTm10eld5RUc4?=
 =?utf-8?B?WmhZaER0UTc2RE12ZXVnRjc1bGpEMHkyTUVhNXdhSktBbmRyT0w2UzJydTBp?=
 =?utf-8?B?S2xUblVWdlFJbUFIUStLc0d2SnJJTXh1YzlYekJIckxqT1g3aXE3QTBKUjdR?=
 =?utf-8?B?bTJPOHp4WHNrZkF2WktZbVdZSHRGc0pyNWFhWEJvVkVMSDMzTVhPdFVYMTFt?=
 =?utf-8?B?RWJ4OWh3NTI4SzZhdS9JeU1yNkpEWVBPMU5BblJJZml3UVNPUlBkOU8veEIr?=
 =?utf-8?B?S2xLUkd3blBxTWhSSzFBcGZrczdHbS82NkpBOVFuZS9UZjB5VTQvNVZVdkhj?=
 =?utf-8?B?blJuN2dDaHVoN2tqUk9Gd2ovTm05aCtBVVkzbE81TCtwRUdHWHVwWi9VbU5D?=
 =?utf-8?B?R09FR2xyQXNqc2NMUVdEb0VLdVhRYzBVTEFsSnRFK3U1RTRsNURZNHlHRElU?=
 =?utf-8?B?RmRCYnVMdGNvQkVycjNpWC9lZDNQYWhBODNBK2JQTE5sc1hKS0IrZWQ4VzRu?=
 =?utf-8?B?Q042Z1N1RTZuSkxyclRjODV2Y0NyOTlMeWFSZHFSRHZjckdOWGFET3FkajZW?=
 =?utf-8?B?T09QZUtvcm5zMjlxMnVaSHFSQ21oY2JvTm9LODJQaGpwS3ZwUGlRK1c1bGU3?=
 =?utf-8?B?ZWZDQzVLQ2RzQ1N6K0RCdGVEdXhKK0xvc3pVSFNwejh3UFNkQS9NdWc4djVu?=
 =?utf-8?B?elpOMllHczlxc09BczlKQ2ZTYkhJY0tTRkFRTGdFa2ZPWHlTamZQQnMzWEVK?=
 =?utf-8?B?Sy9CL2U4UWZCdzg3K2MyMTlxWURSUlhDVG1KNXIxNDRQbDAwejJaZ2JIOUt1?=
 =?utf-8?B?dkhBR3FqSE54QjVaNXdwbTVkREZhayszNXVvT1l4S04zTTlZQTlob0k1Qk9K?=
 =?utf-8?B?NENsS2FJS0xiOUxENTFyblJRVVhPcHdjb3gxVjI3Y3dqcEU2TENscXVEY25r?=
 =?utf-8?B?elJCbEt3aXVZVVFsR2MxeVVSOSthWER6Y3pmbkZqclc1anJpd0hqbG8vVzQv?=
 =?utf-8?B?Z0hCWWJmWkVHVkRvZW9VK3czUnNXMVRFckZiZ25YcjR3ekxjVUtzS2tPNE81?=
 =?utf-8?B?WUVzQ2ErM1hzRVJIaWQ1Q2J1QUZueW5ZRDJUZTdOU3h4aVJ1am5DbktIOXpo?=
 =?utf-8?Q?uLIyk3tRjvaUv?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dVF4YnNFL3FlcUxYWlFBZnhrZUVwU283UFc0bkVaTW5La2lOOVNjNWJwaG5x?=
 =?utf-8?B?WWRJQjIySG1WY0Vrd21zUy9mbXhpL0NWUFZUNFJpaTlZSERIcTlmZ2cwek16?=
 =?utf-8?B?RWFPUDN6NG9Yc2w3a3B0OTUxM0JjYTIwRUZKNlUwNXFUZE45OXJoOHB1d0ll?=
 =?utf-8?B?Y3I1K3RKbjd3K1ozdlphV2tjcXdxcndHaERHNzZpclErRVhzUFM2OVVLaEtS?=
 =?utf-8?B?d2ZRZ240NWtCWFlLbk5aQ2JURmk3T1VIWWpVTFVDckhyTFpvenNYL2YvWVNZ?=
 =?utf-8?B?RFRyVUE1akhERzVXN0tFdkJ4ZWVUUWptTllZb29jQ3ZXUkthTWtLS3lwSHAx?=
 =?utf-8?B?UFZVdCtYWVdITkFmSHpwNHgwaXM2UTVvbmUzVTNCdGp1Vmp2MVlVZDhPMXpy?=
 =?utf-8?B?SUwraS9JWVdqVnN2ZGdIaGpzNGxQSHlBQnpBajVtZUVOU1dUT1I4UjB0Q2xz?=
 =?utf-8?B?elBFbi9GMkZKNzRGQlhQeDZobWYyVm5QVUdZYXp1NXV1cis0bkhIRFB1M3FI?=
 =?utf-8?B?OW0rMVlYcmNXUnU0c2JYaGRtUmpsbXl1ekZGaW1ONFo2RmFwLzROVC9UYVd0?=
 =?utf-8?B?N2N6Z0FBS0t0WnBGS2trVjkvbWtaaDZOK1pjMGY0d3NaV1FPYWw3YzlVTnZD?=
 =?utf-8?B?bDBTeFcxZEYyeUZKMkRqWjRwS1RYVkM2MHNXNXF0bmRneDFYVm9PTU9QY2hV?=
 =?utf-8?B?SXhLZi81bzdQdlZTM2g0UHB5YjdVU3RtY2FINFZMWEppVW9pc0pFbVhwT04w?=
 =?utf-8?B?T1k1L3JrclBmam1UVVAzaHlsYS9sVXM5cFdxQmJpNm9CaXNuVTRjd3JkTUhU?=
 =?utf-8?B?L0RCdURBZGVXVFZWRjBkdDV0cjZyWm1zYlA3WFJFZEdISkRZTjM0cUhVc2xK?=
 =?utf-8?B?V2x2em9YRGllQVNyZlZUWTBJWXQ0Wmd2Y2lSRld5b0tMQTVnQVN6OFltTTlE?=
 =?utf-8?B?U2F3TDdLM3ZuUjVZR3VwWm9mNFdOWmw4cmZzZGkzNkwrOHN4S1FYZ1FHUW4w?=
 =?utf-8?B?RW8rRWRLcGxNVlR2WUhTeHhkU1UwcGhGR2VUWm54T0pYYU4vTFhrWGNDWmsz?=
 =?utf-8?B?YXpnK3hMazY0ZlBxMXV3L3dqeCsrRFdkYndCU1daS3pHQnBwaEwvYW85SVZn?=
 =?utf-8?B?eUp3VFJFaitnZlRHaCtSMTZhSTJObnZ6RlcwRXMvTkEvTjA0NGZ3QWlyUUdV?=
 =?utf-8?B?dlFlcVUxTTFuUkpjL0RZc2xrMnJjNHlJbUYvY2xLUGtsSUEyb1dmN0JwL29L?=
 =?utf-8?B?bFYrWTlkZ0ZPb0diSS8rN3ExR1dwdk1Tb3NkUjNCQ2JseldMS0U0NUxRSFBC?=
 =?utf-8?B?emJrRFB1WVRkb1lpNnRkUUFQY0pXaUdMdmNNQVNSZy96RDN2aWlMK1BaS0lR?=
 =?utf-8?B?WGhEM3lFeFRpemdJajlVa3lSL3pEcFdoSS9PTDhoTGU5NnlCNFpUeGp3WjJP?=
 =?utf-8?B?RWI5UkxnMTZqdWdUZUdUZ2sweXRaYzRUWEd1UTlhbkhNV0hLT205UGdWN0Fn?=
 =?utf-8?B?VjgzOXVhZGN1QjhMUjFnUjMvSnI5MTd3blFBY282Vm1UcG1LbDFrMnh1cTVX?=
 =?utf-8?B?OHBsdzF0T2VnaWc1aEZFZlB6bUMzMDFwczBLbXZreVowY2pQdDFYczFzbTEw?=
 =?utf-8?B?K3RPR2xFYi9PU0xGL0dSVDRZWGJmM0FrQ1BHOHU2OEkvWUNLRjEvVDR2bERn?=
 =?utf-8?B?TjR3L1lCaHZML2RQSVF0TEVKQjd6Tm9PaXoyV0VFYWNxSFF6YUZZUC8zOWxV?=
 =?utf-8?B?T1FtZ1E4ckRFRmpvc0QrQ3EwSmJaQ2FncHZaUmZtZVI4cmJNV01ZMmdEOXdx?=
 =?utf-8?B?aEhVei83TEhpcFVYdDU4cERQMTB5bGthSGR6RXlwUHVYakNDWUQ1TDBhVmhM?=
 =?utf-8?B?dENjTnJ4Qk9vVm1ZOTdIV2Fkb29zOFJod2FhcFZhMWpncnFtVGd2S2tBZW1m?=
 =?utf-8?B?cStua2pqUm1KVzJvdWRZWXJRaGdaMTh3R3FOZFJhTWVNOUdVMzdhZlg1VU91?=
 =?utf-8?B?MUtncVo0ZEorYU5DU0QxTWsxcFdzTEtWdm5xa01rRG9YUGJhTXNJQjJlakJX?=
 =?utf-8?B?VDZkUFNOVUIvbk4wYnJlWHVaNkFBcXN4SmdYSC9nMTNkck5zdnkvY3JEUlVj?=
 =?utf-8?B?a0R5dDV2YWxzb04wdml2Qm92Yk1FN1FKN1lzUy9XZHB4ZFpKaDRyeDc3QjZP?=
 =?utf-8?Q?TLWEwnkrSbsHEt2+9cuPmT4=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796b6709-34f4-494f-dd46-08dcbc3ebf78
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 08:54:47.2084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWmIKc12NkYwDt53hr/EX7782uMQLZr1lX/q7aB/RWvtXKskfMztP9JyHOY7ZbAL3ZPnz8PPX3iWk4Eb0wxqhXIg+woJxYYtdV4ds3mRNi4/aKL+o2mF2tF8w+2OaJpL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7611
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 13/08/2024 23:20, Krzysztof Kozlowski wrote:
> On 13/08/2024 10:41, Chanh Nguyen wrote:
>> Add device tree bindings and an example for max31790 device.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> 
> 
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      fan-controller@21 {
>> +        compatible = "maxim,max31790";
>> +        reg = <0x21>;
>> +        clocks = <&sys_clk>;
>> +        resets = <&reset 0>;
> 
> This node is incomplete. I asked to make the example complete, not by
> adding two incomplete examples or other ways... The binding description
> says this device controls fan. If so, where is the fan here?
> 
> IOW, keep only one, complete example.
> 
> Rest looks good. With this addressed (and optionally with maintainer
> change, which Conor asked):

Thank Krzysztof for your review!

I'll keep only complete example. I'm going to push patch v4 in the 
coming days.

Thanks,
Chanh

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 
