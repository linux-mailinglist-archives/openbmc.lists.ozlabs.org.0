Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9095173A
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 10:59:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=4HdOuBvF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkMcn1KqPz2yXf
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 18:59:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=4HdOuBvF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c10d::; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkMcF4Z54z2xGp
	for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2024 18:58:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnWqDodDBohS4wNE1DvO/NYwVPy3pGHzDVtaPDuWGQoAwVaRMjnEvrA1OSU0+H5b4G/Vpx3y1kEKo0WGhTxfcOO/YJovwGS7hyYPQy1xYaqw1tK7XS7ob/zzhAC7jEfUp5W7QELZKowiI9beSVfV8ZHn9ZZ1pd8IYpYYgGbRxaQ7z2ho+PoNDWDdFIOyCwgDLcTRMWZ34/B+0a47bShVpdb5HvXDdAKRLQnv92PGVp/+hXpY4DnFlA+XnushSNZp5crVmj/enW1K4X8PQrgsjRkAZs7PtmE/dm5dIdKlKi+H+Is2Se826yOgIFevLNyU9WmqATT4/KgSG/9t3xgZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96cmG06uvFDYQemSDeZYuqDVXCnvM8jHlOh8EnLK8ZY=;
 b=eGcD8jCMSOUknc5ywU5oepd1uWMX0U6LzrRFyn15Nk1IImWjsP5Ychw9FjRFDhZs0EPuSbMOdhBJVQmqVhh0o9RUhRe2iPrT3gZB32VUD/HApm7cx5Cg130qoBsH3G3QcCCtybtLTSnHNtjGfac/Gs+b45u+CMZnGxkp/3z+cl5hrFzrY21S/tNmq+59GXEomP1EnaNZ1SB+gJY6ncsRPwFXs3AtJlr623SaQRzayT0xufVmCIVGMiEIh/o+zFVHbKceLUhY+AURJeW7oBAw9+Ls/veBh18zoYkp1BIfN9lX4OSy1LFobh1F8ZfQXW055l9EHLwVWAQyUPTXlBsgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96cmG06uvFDYQemSDeZYuqDVXCnvM8jHlOh8EnLK8ZY=;
 b=4HdOuBvF8qHL1G5rVlqOxRg5ZBbssxyOTP8lDQjqz6wpMj5PL3DJyoo747xNHaNWwfk0BEU5j2bzxoYips+GM8g07zbuuRpfC1d/q4gXnF/sVZD6L78sOB2RicvnElMclirVz9xObDnWm6YyLCyLosaO/FmGrqZd+oqTSaqgSSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 MN0PR01MB7611.prod.exchangelabs.com (2603:10b6:208:376::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.22; Wed, 14 Aug 2024 08:58:14 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 08:58:14 +0000
Message-ID: <8e7f8ca4-4596-464a-a307-0f726863f776@amperemail.onmicrosoft.com>
Date: Wed, 14 Aug 2024 15:58:02 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: hwmon: Add maxim max31790
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor@kernel.org>, Guenter Roeck <linux@roeck-us.net>
References: <20240813084152.25002-1-chanh@os.amperecomputing.com>
 <20240813084152.25002-2-chanh@os.amperecomputing.com>
 <20240813-sister-hamburger-586eff8b45fc@spud>
 <10680d13-442d-4f12-a77c-2bd05f11dc10@roeck-us.net>
 <20240813-extruding-unfunded-0e14a5c161e1@spud>
 <cff4a562-2ed7-4dbc-9e2f-68ff1a601ef3@linaro.org>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <cff4a562-2ed7-4dbc-9e2f-68ff1a601ef3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|MN0PR01MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: f357eb0c-0e27-40ce-d088-08dcbc3f3b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?UElmZnF2SGZqZU9xUmlvWTN1biszcFRralJiM2M5b0JJc3pJNkRWazdMZ0Nm?=
 =?utf-8?B?dU10ZHhKRW44RVJ5amJrYUVBTXBJc2I3T2k4T2QzbUVBQmF5b0ovTXcvYjRG?=
 =?utf-8?B?ZlFwWS9kVktuQk1iMDhyd3NzalVoMmxyVzJ0ZjcvclRlWEZsY3QxKzc2eG8y?=
 =?utf-8?B?aVBkKzlrazU4bENRMDJnZUpZOS90QW85SzlrV2VsdWRJMWpKQ2xRdGE3cVpx?=
 =?utf-8?B?Y3VnYkZjUlEyL0xUS3F0dE1UTzF4WG1XWmMxVnNsVU05U251V0d2Unl1Rm9R?=
 =?utf-8?B?QXUxQ290NlpZbXU1S01TTE13R3ZHUTBkbjV2Mzhmci9GVCtvSFl4Vk1OOUpJ?=
 =?utf-8?B?NTcwMzRSSlgwZnl5MGFOMU5BU3BxNEVMUUVmWEQ0TUtoL0hKY2VVaXczQWZG?=
 =?utf-8?B?b1lSK3FiVDZVcU1MTjZSUlAwbStYUFB4V1JyNkQvbGtTcStXYXdBbzVEM3ZS?=
 =?utf-8?B?MEFvWkRBNVB1TGFoenRGZDNtS3RvZ0UxS090U1I3L0F2bEV4NVQxWGJ4Vno3?=
 =?utf-8?B?OWVaOUQ1MFdjdko3T0N1QzZublNOYkN0L25VT1ZUcmNiTW1pZ2RvY3hMa2Ry?=
 =?utf-8?B?ZHMveHpoLzgzdnNSSnRuelJIVUxmNlJTeEpia0hxZlk0dG9wNlAvUmk5cnpC?=
 =?utf-8?B?R1NsZzRWaEkrSlRTN3RvWW84cUVvUXozd1lSdXBpcnBFNkx6a20zWjczek5G?=
 =?utf-8?B?N2VLL3NnTlpFY1lWZXpKTHpiZFFUc2ZoM3A3cGZtd2NwQVRZTFJLK3VxZGsw?=
 =?utf-8?B?bXdjeTl1OEIvRWRRekE0ZUsvc0ZyKzdCRU9yYkZvTzFIejJoYi95bVdCbTkr?=
 =?utf-8?B?d0o1YU1BdllJdHZ2ZlZzR3pVb0hNTE5ET0ZzWXRNSm15aC9XZUNMbk8zcllL?=
 =?utf-8?B?QkVnZ1N0Wk1pWHZQZkM1c1JhUHlPQWlvdVRiKzh3dnJlZjMyM1RSN0J4dGVx?=
 =?utf-8?B?SFowRkw4eWptZ2F6cEtqaWpEZU9WYmlxNjVkeUVlZDZrUVR6b0tUWjcrODhs?=
 =?utf-8?B?NHFRMmJWWXZCOU85YWxzdkR6MlI2L2xDdVAvMlJrQlBiZHdDRDJzVEJmRVZP?=
 =?utf-8?B?TlQvZ2JPZzRlSkZCVW1KRmhqcmZXbzVCckdZMWY2b3ZTQndDalFSQW5jOXFS?=
 =?utf-8?B?VjVlZDkyRnVoNHQ5L1VFQkdsWFFRdHE2UDczaFM0N2tnSTc4WlhDS0lwZXB5?=
 =?utf-8?B?ZTI5UUhvVHpnSnR4QTBSZWNIT3M4RFBhcy9iZ0ZNb20xeTVKTWRiRVovb0Fk?=
 =?utf-8?B?cllGbWZlOExHOHBzMjllYUNrNEhZTjh1SUVxQXVMVktSclUzY0tEV25Pcjcv?=
 =?utf-8?B?M2VETzZDMlZhVnhEWWRQS1lQdFVCVmtSTnM0aTRxUTAzV3Z3SkZVNjhvRXB5?=
 =?utf-8?B?bnQ2elo1endmb0NTZHExVG1iTnZhL2ovV0xyaUEramNJSnRVZ0ZnNk1lSGZx?=
 =?utf-8?B?Y1h4b3ZOa0tqNTgzVHgxdXRQdngwcy9nWHpNNU9tbXVTYXlsNFZUMHNqZ3pJ?=
 =?utf-8?B?Y2hmRlFlM2UrdTJkbzQyN0dxNEI3ekpnbVdHSVEvcXFKeEp5d0ZiSkpYT0hI?=
 =?utf-8?B?U0dnSHJweC9Kc0FCNEtTRG10T0dmYzdyYXdoSy8zeVc4dnVDSklhbkFrTlp0?=
 =?utf-8?B?SkJxdEtLZkVnaGdNRGhYTXhZUE5iTjdMbWl4Sm5YSWxVcTk1MG1wVHpDa25D?=
 =?utf-8?B?RVFzS3A3S1FWMlhuTkxoT1dld2tKZ3EyS2hGbmdnOUFIeEM2UTdoNSs5MVBW?=
 =?utf-8?B?eE9YdGVENDNKQnlKT0tpWVlTNTBMNnErZkpsUStlYXpuV1VsY3FkZkRQSXNt?=
 =?utf-8?B?MFJtazRPYmpmd2p2a2kydz09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RXIwdG5KMEtwaU1qYmZtUXMrRTNMUjd6c1R6ZGE1N1pOSzM0OFVYSVd3S0kx?=
 =?utf-8?B?a2ZjaFJVd1YwRUh6NEFXMWJ6N1VHVkppRzBkbFVabU1OUHlXVS9HcVhwWWt2?=
 =?utf-8?B?RjNpeGcwZnhwZUhhOENPVDljUzh5TVBFejM5NXhrWFhjSHhoaTErYURKaE9q?=
 =?utf-8?B?TlJGTjlOUVo4bVMzS04zYUhtWmZ6T28xRVhabGNFVldYd0l2S0hpaWlwNWJV?=
 =?utf-8?B?L2ZwSW5CQ2lycEFMZFhGcEdLdERSYnJ3R1ZNd1RXOEt3bkk3ZnpmUTQvczdk?=
 =?utf-8?B?blBwMU9HQWZUM05iWmNBU1VGQ0Noanh6Q3dzK1VGRnlNdktHanpPaVpSbE5P?=
 =?utf-8?B?c2pnNXBBa0FRS3BOMitjeEx1WndDQ3Q1NU1MQ200ZkI1M0Zwa3N3K1BRelI2?=
 =?utf-8?B?TnNsRmhsc2Nyb0FKN1Q4MlRIeldDb3VzZzkwZEtseHNrdnFzQ1kvTUZFRU1U?=
 =?utf-8?B?czcvNVhRMUtOYXFqeTV2bENVT0VxcDZhMXkvNzJ6UUpiNm5nNW5LSWI1ZmNl?=
 =?utf-8?B?elJsc0xpdlk4Q0paZ3lXbFRNblN3ekV5VGhPekRpcGYvQnJTUkgwRlQ5YnYr?=
 =?utf-8?B?djB5UlExUk9zSVpTS3BRcW5NV3AzQjZuNnB5em93U1laWm5aanNrWkZvL1VZ?=
 =?utf-8?B?S25yYmRyYXhxemNTbGppM1hPSVZ1WElLeDE0d21ib2FLODJKSmNQclNNdFZn?=
 =?utf-8?B?Z2xoVzFSeHN0TTJvQkRvQnpXZXFEMCtCN21VWitaK2RLeTFWQ0FyakEvV01S?=
 =?utf-8?B?OWZBc3E0ZFNoL09Vc25mM2pKcXc4bW9vQS9LTjNuVkNGYXpUZ0JGR1RKMkcz?=
 =?utf-8?B?UWN4a0lwc2lpRURnRldoSjJGNldhQWFQSGJlRzJNYk1xU0lxZ2QwNGVYMjZ0?=
 =?utf-8?B?Y2NaTlVOVlpxWnNtRGJaaDVpTUVEY2xocmJKanBVcGdMdXZKMFo0aHdTR29O?=
 =?utf-8?B?MVNleEpySSsrallWMVpTNjIyaERudE1mSmcwMndZTE81OFF6MVVhSXVnNTVo?=
 =?utf-8?B?WnhUQWViUGF3OVczTmgzNk9aK2thU0UrNGMxWDBUSHE2VWdHek9JWlFWY2cw?=
 =?utf-8?B?MG1nNHplKzRLZ1poQ2RZZUV2YzJ1UW51UUpHSEladW1LRDF6TWpwYUZuQnoz?=
 =?utf-8?B?OXlqcXo0Tm1MNmNjcFpHc0pGTU15UEt5R2pkUG9BdjIrd3BoeklVYVhDS1VP?=
 =?utf-8?B?aENiQ2NkQ0M0QitXTDQ2OTVEOUhwWEwvblZuMVdYR0ZWazUrb2M4amNQeEk4?=
 =?utf-8?B?d2V5aDBoT3VKNkduQWFNaTVZUmRNYnUzaU1TWmdxblhlbEtGV0FOaC9keWRt?=
 =?utf-8?B?VmpKOGNmeVJSdGpoM3ZucURrNno4b09Vek5ZTVZBNjFJMGMyM3E3M3U3NlpG?=
 =?utf-8?B?Q2FJUE55dlgzbmRaVUI2bkFxNXNkd3FxMHFPOHhhR3krajhDQzNwSlg2NWNl?=
 =?utf-8?B?S3REYTZOMHFGL29tZXZPcVp3bG5GeVFFbS9YNU5STkJhZEJ3Wk1seWMzR2lC?=
 =?utf-8?B?WXdWTlk2bXB1TnQxeVpVSDQ3cGszQWsyT0RIeVh2eXp4bnE2ZFQ5L2gxbWJn?=
 =?utf-8?B?Y3N0SXR5eWc3bkRJbDc3dldjb21YQkNMNDJwcVc3MW96bGVubUNPY1FoZ2pa?=
 =?utf-8?B?TXVpRjRKSzhDRnFHTzJIZkxONi96Y25ZQ1VHZURkT3BzdHk1TzdpSU12Q21Y?=
 =?utf-8?B?cjE3VjlGNDA1RmxTa0NTR0YrTk9QRXZZNEhoNDFZUXZ0NDUwOVBkTDZWU2Jj?=
 =?utf-8?B?eFh4alorNWdLVndLOWFYQTJMd1lOdnZJVlZXc0hKUFV5TGZ3dDV5bEJzQ1F5?=
 =?utf-8?B?bXcwYndOelV2N1hxUlByRmJiQ0FTdHhET2lkVHNveU0yVXNIdXRFSjUzdkor?=
 =?utf-8?B?RGRYQnZnMWFlUjQrdWIyVWFSdGEyV2JSL3A0Q3RDdER4cmQ0Z3lnQWVFRnFw?=
 =?utf-8?B?eFEvelUrOEM2UlNjTkJGTC9GNDRmdlFURUhuSWdxWDMxa2x5TlBBZUdTUktH?=
 =?utf-8?B?VHJSQllHdG04UW4wU0t5WFhEZ0FLQVdOMUpWTER4ZitMVitrQkdrTW1zNUlQ?=
 =?utf-8?B?TzE4cDVCanFQSnJUa2dqdWJ1YjgxNWxuQ293SWRxdXBtQkUvYm05NVpmR1Fj?=
 =?utf-8?B?eGVvZlhITUtvcmplQ1NSTlJNSURCaW1ESEltRkZHTG1oVVQzdnh3VDJ4emd2?=
 =?utf-8?Q?2kKdzr+giWT1a/eNBT8iY1g=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f357eb0c-0e27-40ce-d088-08dcbc3f3b24
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 08:58:14.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8htAkMptcanGuPqdvddR0bU/ojfpi+elIdgjBCwU8kDkCxxirVjlrPJ84hYQ5I1sIxSY8dp/muI+NheqqHRNSEvFPdOK8KCnISvgYZeFDUIvVT6N7BUOXBVPtccXCkqN
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Phong Vo <phong@os.amperecomputing.com>, Justin Ledford <justinledford@google.com>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 13/08/2024 23:21, Krzysztof Kozlowski wrote:
> On 13/08/2024 18:16, Conor Dooley wrote:
>>>>> +examples:
>>>>> +  - |
>>>>> +    i2c {
>>>>> +      #address-cells = <1>;
>>>>> +      #size-cells = <0>;
>>>>> +
>>>>> +      fan-controller@21 {
>>>>> +        compatible = "maxim,max31790";
>>>>> +        reg = <0x21>;
>>>>> +        clocks = <&sys_clk>;
>>>>> +        resets = <&reset 0>;
>>>>> +      };
>>>>> +    };
>>>>
>>>> What does this example demonstrate? The one below seems useful, this one
>>>> I don't quite understand - what's the point of a fan controller with no
>>>> fans connected to it? What am I missing?
>>>>
>>>
>>> Just guessing, but maybe this is supposed to reflect a system which only monitors fan
>>> speeds but does not implement fan control.
>>
>> Even without any control, I would expect to see fan-# child nodes, just
>> no pwms property in them. Without the child nodes, how does software
>> determine which fan is being monitored by which channel?
> 
> Yeah, to me this example is confusing. If device's purpose is to also
> monitor, then hardware description in "description:" field should be a
> bit extended.
> 
> Best regards,
> Krzysztof
> 

Thank all for your comments!

I'll keep only complete example. I'm going to push patch v4 in the 
coming days.

Regards!
Chanh
