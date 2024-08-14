Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D495159F
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 09:33:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=ZCrKHAMA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkKjT6qY4z2yYJ
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 17:33:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=ZCrKHAMA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkKhz0j05z2yGm
	for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2024 17:32:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anNbuVItrqKSghTV3ryvLEktbf1q5oEuDM97pFUrZU3JOHeOFDQzGvKgMxL3nWDThXKs/J4krY1zosTlUlx0T+HrAg18D2DSN/XIlxBLgKV1wGi4HhZl+Dc1OquNx/DBNQUsdjjO3ZyZbX6UiPjZGlRqzz/fUq0LPg10XwY4nu1ImXJ1lCuP38vzKKACdFC7zHqeSIVzgn4Z2/XdIkCQt5hpTh5R2D1ft6Aw6qTFG60ZUmhPz/kLo/2PWK4fBVOXNjxooA+QH4f5yJ62SHnjH1u6sg3l1f3etvMWitM323Vz4nz/ug4JU6AhflxmS8tLlMfNZF08yKSPusvCTNe2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFPzbBgaXzhw1DDrV3P/S3SkecrYGRRp/y6mR3V+0T0=;
 b=dq2qKYuodilJWTMycAfGcU2pCkDJFfKXnsmmLf71KKSmrsTSM1/skkLovlAERepNM67x37g1kRHMFNBmaPzHatKIPMtxaHjdq9v8ep7EMYh4uYUgONBQiBKwo2FqfeqDGWLSy7g7+rDPyqLvtfiZHavL49kTtKbSy3S9aPQ/U2/Tyzib2AnOkoNQXYYx82f4exlHbeQS4vIOa3VuKePgndX1K93WwhwbJRVFTBsEyLAcrJwn5XizHb0A8em0FY8U26w0GKOIktuY95gvlw89OVineprZAC4hYDjQwAn9UDjEtueQhKzmY6+WJCdW+JwOFL5l3oXwtytPCQFNbPaJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFPzbBgaXzhw1DDrV3P/S3SkecrYGRRp/y6mR3V+0T0=;
 b=ZCrKHAMATHtj4Do3CJ/lMNJx29ej9eDbVApqYNVD+v5dzapD1hbhn9IwdBKXyRKskGvbeRVV+OYuylfjA1tpx9rFZbsTGIwrP7aciZNPY7UQnzUjtQo4E0bF6rgh6NfRDePqoBYsDzY19zrqLeaiYjr/WnSzqG/ZXRggidtE4qA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 PH0PR01MB8120.prod.exchangelabs.com (2603:10b6:510:29f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.22; Wed, 14 Aug 2024 07:31:55 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 07:31:55 +0000
Message-ID: <481b00b4-c3b7-49c4-80fe-0c0fb8448673@amperemail.onmicrosoft.com>
Date: Wed, 14 Aug 2024 14:31:43 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: hwmon: Add maxim max31790
To: Conor Dooley <conor@kernel.org>, Guenter Roeck <linux@roeck-us.net>
References: <20240813084152.25002-1-chanh@os.amperecomputing.com>
 <20240813084152.25002-2-chanh@os.amperecomputing.com>
 <20240813-sister-hamburger-586eff8b45fc@spud>
 <10680d13-442d-4f12-a77c-2bd05f11dc10@roeck-us.net>
 <20240813-extruding-unfunded-0e14a5c161e1@spud>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <20240813-extruding-unfunded-0e14a5c161e1@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|PH0PR01MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: d1dafb62-1e8f-4383-896b-08dcbc332c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?cE9WbG1JRFljUys0YTZGQkNQYVNPcm9DTUZSbjg4TS9oTGYyNzdjanNwWW9l?=
 =?utf-8?B?bUVCaEZSbEFSS1hROC9mN3VEVzN1WUh3YVArSzB6ZzRuSy95WlM3MnZMN1Qv?=
 =?utf-8?B?Z0lGZUVxd1F0QkU4NzR1Wk1CUExjdGo5RGovL0FUelRPbmVzYXJrMzhPVHRv?=
 =?utf-8?B?YmpFa3dDUmxZUVBOaS84V0tOZng0VWI2TFlhdzdySDNYTG8rN2wyWWpLQzF1?=
 =?utf-8?B?NmIrOFZvQ096SnVBc3hIdkMxMTFycmRmNEs2QkNGSHF1SytGN08rTEt1RVhi?=
 =?utf-8?B?Y1BkTGhneTNGVUpmRkcwQndza0J5V0NoTGVFY3dMblM3Q1cwZ2p6MEhKbytQ?=
 =?utf-8?B?M0VwZW5TYzJWVVdQeld3c0pEZHNXUGFXeTZXUlcxRTZhNG9GTWVCQ0t1UW45?=
 =?utf-8?B?THdZWVYzZmR0MEtTUHFoY0hwMCtsOUtZNkFHUXFjaVFlNFd2WEpKcUVzWmM1?=
 =?utf-8?B?a1lrWWlGdzVGOWxtT1BSNXBwRkJoaVU2dWI5MnRia0FTWnRjYXAydng1WHl5?=
 =?utf-8?B?U2x0a2xYaGtJVjdScVJsVTNITGxnTEFCR3FFaGIxZTVtYXFQaFBzdDNCT1lz?=
 =?utf-8?B?enhiV1FacWNSNStVajJwVmJacXd5SnU5RnZoYkJwdmVORml1YTNHdGt6S1lF?=
 =?utf-8?B?SDdld08rRkJaVlBVa3VvdUJua1diL0dwYXlFN2NnbzlhUjQrWXM1bnJaeGZz?=
 =?utf-8?B?NTcyQVVwakZ4ekZQamlVYlpnc3FVdkhYRVdLRGtGTks1dnZOekx5dWJsMzRC?=
 =?utf-8?B?ZjdQZmoxRjF3QUY4blBoNlJDVG1RbUovZ3M2dU9jVnZlMWM4VXQ3Nm9nOFRT?=
 =?utf-8?B?ZDJVN2xKWE5SelJxcmhTeGFhbnNsTkdpNDBlcGZKbnpXb2pRczF6ZDYvUmlj?=
 =?utf-8?B?M1pNdGVtYTZhNmF5eXZrcy82eXUzLzdSUTgyaUtoUlRUdzRoSHoxbm9NNCtW?=
 =?utf-8?B?Z1c3M3hSOUMvTStXMjdhZG92ZEcxREtYOXAxNjBsR0xuYzFCZlJFK293L3A3?=
 =?utf-8?B?Wk9YZXhiMGhmRHBVQlRPeEYyNGhmenNUUnorTDZZYkgvSXovSHZnZXAycFFE?=
 =?utf-8?B?MWJXUXBiQ2R5bExzaUxWL1lOWHg0Rk4yY1ZTanhaOElOSFZ0YTlkY3FMYWNj?=
 =?utf-8?B?akl5RTJrTmFqR2daa3lmaE9odXRMNm0rZFg5SkQ3bzB6MnRUZTFHS0puNjMx?=
 =?utf-8?B?aDBZd0ovZkxreDVEdG4zY2VBeWlpb2I1N1l6V25LdEowU3htWjBJeXBraTJB?=
 =?utf-8?B?aDc3UHA0aTZxTXQxSzZrb2gxb3IvNXZNVkhKK2NyUVZOYlVHL3RBNHNEOXJW?=
 =?utf-8?B?Umc5WlRSYmpNcUFRWGtMaE43cEtXdGU1UCtrdmhhbmRJMXV6b21ZTFE0ZGxH?=
 =?utf-8?B?S29BbUZKeUlxWWNBb2R5elZhdytOMFUycDUyL0tMRGRxTlJJQUt6aEQ2U1BV?=
 =?utf-8?B?MUhla3pzNGxWNkdGQUlpRUYrUXlOSGh6RnpXTnhxZnEwMUxMTGJ1Ym9zY0FJ?=
 =?utf-8?B?MnNzbUxLWWs1SFV6UUtqZkJ1S3ZYMXo4d0krRFgvZzNGUkNhNHM2TjRpYkZH?=
 =?utf-8?B?TkgyZjJ6QVJVcmo2QURwUWdSRW9lSWNwOWNxd21NN1VPTVVIeDdwT0NscFVW?=
 =?utf-8?B?VDJIZjR0c1pKVk1lKzBhZFlqVGxCNlREamlZYVBoRUZ2aldkMVNPNW1GTUcr?=
 =?utf-8?B?RFRWWVVOTWdWTkxBR2NJa1kycU84cFZPcDFqcGZUcEdFZmtzNm9YdnVPck9E?=
 =?utf-8?Q?CJCYIVrkxFjkJ8vDh0=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZXJpMDF1VGJVOGowaUN2aDcvdjFRSUI1UFZqSGpMWTArYUVuOGpUeENvVTZT?=
 =?utf-8?B?NWxIM2g0MXBSR290dmp5cjBEdnhrV0plSGJGM05WTFJTaGk4OEpad3d5eFJo?=
 =?utf-8?B?MVZMU1E3M25qWWQ3bTBxQTdWMGJOWDQzTS9TelB2NC9sczlwanAwd3NoMnVM?=
 =?utf-8?B?MUcrSk4xN0RNYklRQ3Rha3VTc010ZWdlOFhYaWRiRlRoYnM4YitsY25lOXFG?=
 =?utf-8?B?Y2xLM1E1RWVXMVRSVlRXUnpleTljY2lybDBsQmtEOW5VbW04SWVrVG5LMzBl?=
 =?utf-8?B?VHZzSTI5RjVUVWRLa29ZRjZKOUtzQ29vT2t4NHFWblZ3eXVZWDh2NWdrTk5s?=
 =?utf-8?B?QU96TEd0cWJHYk1tejRuU1R6Ly9tUUVUa2FyWWw1T2xzZ1gyQ3lzMlArd3J1?=
 =?utf-8?B?WFcxdjZRanJ6RmVCcmdlVFE1bElFY2lXNHpQWExzSUpTOTB3bXNpejdyQzNV?=
 =?utf-8?B?b3JWZzFPSFBpdFFpOENwZnFOckxucVVCRjVTRDlpdUVQKzFzWUdJQ2hQQlJJ?=
 =?utf-8?B?MWg1UHJzTmlHdlBYampWVmx4ZmpJSlNzRDdLa0pXaWVhaWlKT2Z6N1htMWtq?=
 =?utf-8?B?dnh4cFJPVUpobzJIZTVsUVZlTmRDWGt0SFdCczJaRmxSSzF3VVVpQUwzNHYv?=
 =?utf-8?B?M1d3aExXZGR1ZmswUWtkamxBVnl0OGZSMThabHl1cnNROHRhWjVDZFJWWU54?=
 =?utf-8?B?K2pqYklQcCt0Zm0yZUllWVArSE9Rdm5SQ2JmZmJmc1NwTnRFMTBQNWZpTnJ3?=
 =?utf-8?B?U243cHk5SmRWQjNDZmpUNnJnbk1uZ3VNaGhmTFNUdkpZQ1E3UnJsYVdwL1Yv?=
 =?utf-8?B?OHFqTkdUeUlvdkUrSmRTQTVtMWJRN004Z2Y1eS9DNmRtYnYvVHhuRnhXOGl3?=
 =?utf-8?B?MURFN2daSlB3d0ZycTh2MGJTMERjUlZVMzVkNDVlZ2pYeHlJd2lrM3hsWkRo?=
 =?utf-8?B?L3h0OGZkUG5OdWx4VzczUkN2WEJJTktZbzkxaUFpZjBMazU0eUQraUdUWGt4?=
 =?utf-8?B?UTM0VTlORitXR1lGakVqZE51clJnclB0UzBKT01OYUFHRlVjSS96VEJjbmMr?=
 =?utf-8?B?eTlqcnFGVDVrQUVtTjJKajZvcU5UR2k3aUVBWjdJcnJ4aFJoZVZNMjc3ZDBU?=
 =?utf-8?B?alllWWRNN200bzhlR1ZTbWIrMzZmdnEvUnJGNERIRytoR0ZUMzUyYXFDaDlv?=
 =?utf-8?B?bFExcnEzUnZKWXF0WmdiYTlVajFONTdabkk2c1hUMFdoNW1LR1EvQ1JQMFQr?=
 =?utf-8?B?ZnhndVczVDRNVlQyU1gvVVBPU1NQS00vSkRoRkNpTGxIdGZNMEZXUmRyUGk5?=
 =?utf-8?B?NHJ5TG1NdDg4ZnNLQTArbzVoSXpvQ2hqSnZVd0JYQmc4SzZvb2trVWMvbE1N?=
 =?utf-8?B?NkZiUDl4ZURtcVBDUTRsQ0pYMEpDMU1sRHh5dE1ZT0VlT2l0Z00xZGMrSnY4?=
 =?utf-8?B?REtsaE53RVpxMGZ2L1JDOXA0c2dXMkZCRG1GNksybVdOL1VQQnNYaEZZUWNp?=
 =?utf-8?B?aDR2VlF1U01kTWJ1WVZ5dHJwSXlmYjVWVisrYlV6RWVMMDRHaHIrb3FNT2Vo?=
 =?utf-8?B?MUF6b3dZSkxRdEVOUTIwN1pCR2g2YjJneEFuSE1DdmhUYVBQMmM5SXpWbzhW?=
 =?utf-8?B?RFBwWDIzb1U3bGhsQ2FlL2Iyc3hWZ0F6cWM3eXN0WFR3bXJWUTQrcmZWMWZZ?=
 =?utf-8?B?bDFYUlJmNjhCa1FuL21rVmwyakJHWWRRUmZuZVRZT3pRUUtWcGszTyt1U0VO?=
 =?utf-8?B?VDloSzRBemt4Q1NvcHdoQzdaNUdCZXBoNlJ1L29JYUptSW9FdXJnLzJiRlNT?=
 =?utf-8?B?b2NGSWxiZGRqRU82R3F5QjlWTjQ4cnR4OHRCSFpocm50YURmYUc1ZTR1OERP?=
 =?utf-8?B?YzdMSkF4TzZSeVZGZjFOMFRRK3lkRHZkSUtNYTA5TllsNlFyWmkyU1h5cDNP?=
 =?utf-8?B?UnlqazkwUW5VK1Z0TjEzV2NlaGxYQlNPMDZ0T0IwWWEvUVY3TGg1c25BT1hQ?=
 =?utf-8?B?dG9MYktpc3UzcDdQNVhJZUVPdzFzYmJ2RkFYK0h6S1ZIVWkvL1NVR01ucTFJ?=
 =?utf-8?B?ZGVGRXUzWFJTOEFEcGhoNHNEcEpZaS93VWRIckttcllITkJKaGZxcS9DWjBH?=
 =?utf-8?B?VHQ3N2RDVFJzdVUwRjF6VFg3c2JnSFhKeW1XUjhsMmtjc2YrM0czZGtKcHQ4?=
 =?utf-8?Q?pA2nSqJAdRv5WQvNT2Y8u+4=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dafb62-1e8f-4383-896b-08dcbc332c08
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 07:31:55.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nka2QwLH7wGvbWw1+H4kyflcXm7ow+bco4hb7CeBik41orkgYQQVE1LvXv6B1TQB4yyGHNDSLkC7V80Il38MzjB9LCsBe2DTxvynVNNKRbrTmpAINgZF6k0OZkOK4OXo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB8120
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



On 13/08/2024 23:16, Conor Dooley wrote:
> On Tue, Aug 13, 2024 at 08:52:22AM -0700, Guenter Roeck wrote:
>> On 8/13/24 08:33, Conor Dooley wrote:
>>> On Tue, Aug 13, 2024 at 08:41:52AM +0000, Chanh Nguyen wrote:
>>>> Add device tree bindings and an example for max31790 device.
>>>>
>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>> ---
>>>> Changes in v2:
>>>>    - Update filename of the maxim,max31790.yaml                        [Krzysztof]
>>>>    - Add the common fan schema to $ref                                 [Krzysztof]
>>>>    - Update the node name to "fan-controller" in maxim,max31790.yaml   [Krzysztof]
>>>>    - Drop "driver" in commit title                                     [Krzysztof]
>>>> Changes in v3:
>>>>    - Drop redundant "bindings" in commit title                         [Krzysztof]
>>>>    - Add the clocks and resets property in example                     [Krzysztof]
>>>>    - Add child node refer to fan-common.yaml                           [Krzysztof, Conor]
>>>> ---
>>>>    .../bindings/hwmon/maxim,max31790.yaml        | 81 +++++++++++++++++++
>>>>    1 file changed, 81 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>>>> new file mode 100644
>>>> index 000000000000..d28a6373edd3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>>>> @@ -0,0 +1,81 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: The Maxim MAX31790 Fan Controller
>>>> +
>>>> +maintainers:
>>>> +  - Guenter Roeck <linux@roeck-us.net>
>>>
>>> Why Guenter and not you?
>>>
>>
>> Fine with me, actually. We don't expect individual driver maintainers
>> in the hardware monitoring subsystem, and this chip doesn't have an
>> explicit maintainer. Forcing people to act as maintainer for .yaml
>> files they submit can only result in fewer submissions. I prefer to be
>> listed as maintainer over having no devicetree bindings.
> 
> Sure, if you're happy with it. Having someone that knows about how the
> particular model works is usually preferred however!
> 

Thank Guenter and Conor for your comments!

I will add me to maintainers list. I'm going to push the patch v4 with 
this update soon. It will be as below:

  maintainers:
    - Guenter Roeck <linux@roeck-us.net>
    - Chanh Nguyen <chanh@os.amperecomputing.com>

I think I can support to reviewing any max31790 binding update later.

Thanks,
Chanh

>>
>>>> +
>>>> +description: >
>>>> +  The MAX31790 controls the speeds of up to six fans using six
>>>> +  independent PWM outputs. The desired fan speeds (or PWM duty cycles)
>>>> +  are written through the I2C interface.
>>>> +
>>>> +  Datasheets:
>>>> +    https://datasheets.maximintegrated.com/en/ds/MAX31790.pdf
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: maxim,max31790
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#pwm-cells":
>>>> +    const: 1
>>>> +
>>>> +patternProperties:
>>>> +  "^fan-[0-9]+$":
>>>> +    $ref: fan-common.yaml#
>>>> +    unevaluatedProperties: false
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    i2c {
>>>> +      #address-cells = <1>;
>>>> +      #size-cells = <0>;
>>>> +
>>>> +      fan-controller@21 {
>>>> +        compatible = "maxim,max31790";
>>>> +        reg = <0x21>;
>>>> +        clocks = <&sys_clk>;
>>>> +        resets = <&reset 0>;
>>>> +      };
>>>> +    };
>>>
>>> What does this example demonstrate? The one below seems useful, this one
>>> I don't quite understand - what's the point of a fan controller with no
>>> fans connected to it? What am I missing?
>>>
>>
>> Just guessing, but maybe this is supposed to reflect a system which only monitors fan
>> speeds but does not implement fan control.
> 
> Even without any control, I would expect to see fan-# child nodes, just
> no pwms property in them. Without the child nodes, how does software
> determine which fan is being monitored by which channel?
> 
> Cheers,
> Conor.
> 
>>>> +  - |
>>>> +    i2c {
>>>> +      #address-cells = <1>;
>>>> +      #size-cells = <0>;
>>>> +
>>>> +      pwm_provider: fan-controller@20 {
>>>> +        compatible = "maxim,max31790";
>>>> +        reg = <0x20>;
>>>> +        clocks = <&sys_clk>;
>>>> +        resets = <&reset 0>;
>>>> +        #pwm-cells = <1>;
>>>> +
>>>> +        fan-0 {
>>>> +          pwms = <&pwm_provider 1>;
>>>> +        };
>>>> +
>>>> +        fan-1 {
>>>> +          pwms = <&pwm_provider 2>;
>>>> +        };
>>>> +      };
>>>> +    };
>>>> +
>>>> -- 
>>>> 2.43.0
>>>>
>>
