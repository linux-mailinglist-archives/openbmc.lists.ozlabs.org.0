Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 156C995B2CB
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 12:21:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqK4074NXz30PJ
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 20:21:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::711" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=imXIvYFK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2414::711; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20711.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqK3x1Cszz2xJ5
	for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2024 20:21:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4W9rhnyYW+DgcYyGWTzfGF2FYAy4jSskBVVbeEMno70SMe8KUTeejDkZ+0Su8jbbe4jhIJ7TZiF4Fnt17bAOYCkn7XcIQ2BC3A/Sj7B4jYNlHzSJiJ88UtKWFa0F7aGdCfJNwCu6/T3ldbH+6Xqta3m15p7+dXeLj8a3L2rLK7IRSTopezTeg+qhaeebJmvYslQ+/DJKxU7RD8Ptk9F7XDD4q1WxF/ouMwGzx8UaR+nqs7A31jlwR40mXAAQXqOZcl1g7G8sjRgFuqe9AYBodB6l6ci/yB5bPKdfpFNi5fZ/6tEPrjA8dpk3czH9vcT5A+7/65WOi4tfQaqt7uu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2T9/WH5WwyRjEYVJPXsKbu/RW1ChtcUf5IDdZiLw3+c=;
 b=fIFiwyJ7kPHoI0fDxSuJEyLtJ4Fa11SM48VVxxcGeS+q82OGnXrjVtJSV54/VAppux15enOYlwRna4pLmOZj6UGayyPc9A0Iaf1FYdVmkU4/Vy66eb9wLtBiS0bxPnAshVB59LNRHr4nntv2+rhOgKAChekm4EKr7OpK0xUUm6TuoQdoZQNhC5jodtk5dCp/huHv1tZY3XdkzL5RIN3t4E4755biT+PhRT6Fad2mVVh3WAOoBwEGT1O+c538tz/J5klA1HwnQkt5My088qOnanltfpCSKNBwEHvuP/xgp5ZW5rfRuo9Y2ZxX/EgLn6puJh6zWc/bzQclq6DMwX36LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2T9/WH5WwyRjEYVJPXsKbu/RW1ChtcUf5IDdZiLw3+c=;
 b=imXIvYFKlAx93PgfALWawHUsxjvCEZebY+eR0NJUDzTTkyeqV+68wkIWzNzpBhD/dy0AUrHR9Hg5tHtmLuDxceBbcPq28v6R13E5PdJBmkbps0qajUGZFordmblm7KpPxVGDt9lmYRWxpiLndSMinIL8g0SPCEgDypQcSibfYo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 DS1PR01MB8872.prod.exchangelabs.com (2603:10b6:8:21f::21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.17; Thu, 22 Aug 2024 10:20:54 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 10:20:53 +0000
Message-ID: <d1ee66fa-e504-409f-97de-a923123f3d44@amperemail.onmicrosoft.com>
Date: Thu, 22 Aug 2024 17:20:43 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: hwmon: Add maxim max31790
To: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240822084808.299884-1-chanh@os.amperecomputing.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <20240822084808.299884-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR14CA0045.namprd14.prod.outlook.com
 (2603:10b6:930:a0::13) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|DS1PR01MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7f894b-3bc2-45cd-6705-08dcc2941a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?cExQMytjZVVZR0x4a1BmVHJQdTVzZTBTeGRZT2c5M3NGM3RoQTFjUlZDMWVJ?=
 =?utf-8?B?OFZzTDZuaVVzaytpcnpmbWxCeGhEVnNUUzVILzBNanBubElrK0ZtcDhOUjYy?=
 =?utf-8?B?NFBXSW1nNDV5bEtEcFFuUExhYmRRZG45NXJlOU44UVFnaXFlN04rNXFSTkpl?=
 =?utf-8?B?NWhHRnVMdjBSNWxFN2xRcFN0SVl6YXlEaHJGdFFXbUZ3ZVNCNHJLOGVuS2dV?=
 =?utf-8?B?TkR0MU5oVVQ3Z1B2bTR2OTBlOHJaMldFdHlnWDRGK2RoRm4rWUZaRi9hRHZX?=
 =?utf-8?B?c1ZJMGpJNENFT01KUytNRGFCMGNRa1M2UnUrZVZyYWZYeXlSMWNVeGxRRVZz?=
 =?utf-8?B?K0t4eU5IWVN3cDdKQXRYWEp0NThXNHNycWRMOXNrZ2YwcEFhek1nbGVDMmVO?=
 =?utf-8?B?VS9scTNMdzErWEpvUUxkMk9CQUxFRjQzSlFUdHVCTXo4bkNYQTErRXpMMmFK?=
 =?utf-8?B?Z2hlZCs5VUphaTlFeDZnWWJlRi9scTFpdG1LbDFKQ0sxVTRlbE41Vm5iREFq?=
 =?utf-8?B?YXNUaWUxYmJ4U25wTXA2aGd3S3lMTzFSVUMyMWN4RzRLNnlqZGVCOE4xUkI5?=
 =?utf-8?B?bkkwUVVzRjdWN2lEQUh4UE1wWit5aVB0RklONkc3UURZV3h1dVNHR1M1SW1s?=
 =?utf-8?B?REdiOG81MGI1L09JZGtpRkZHTFVsYjUyaUlFME4xeTZrSmdhNzRlT0pSN1ov?=
 =?utf-8?B?QjZOb29SS0UvV1JFd3lYWUNHT0xtakNqb1pyZGE4RWl0WXZ3M3FJWFlha0RS?=
 =?utf-8?B?cEFwcGYzM3ZhMFZBUy95cjZRcWR1QUYyUGpJVXUwQWpBeHJlVENoRWIxTnZt?=
 =?utf-8?B?MS9iWGNhU3FreENYNGlnMEY0V042a1lSdUpVU3d0aWo2citSSVp5ZURxazhJ?=
 =?utf-8?B?RDZTMEdVTG1VWHlPRnRpVUVBM1pRMEpXckVubzNBRGhqellZelB4SXJ4VmYw?=
 =?utf-8?B?dGJRVHVrWXFlSEcyQjliSkZtc3h6ZG5oNzlucFl0VUY0RmpNVjBncDBGSHEz?=
 =?utf-8?B?YURpQVRDWVpvQUM4SWo2NGl5VHMzOTNpekpDMHBjd1d1OHREZlkraU1MczV1?=
 =?utf-8?B?MWJIZ2t2T2ZiTmU2b0JsQXBCNzlNNlhVbGtsd3dJVUN5cXJucGF1OU5pNjZm?=
 =?utf-8?B?L2ovU2xDa0JsWW9uU084V24weGRtSTlsR0NlU3RlUEk4dnBlS3lUeFRDN0Rt?=
 =?utf-8?B?UnllbVBYMHJWZlF6MExkRHkyRVY5QXZLVU1yc1ZVZnR0UzZwazdxaEdqK1FG?=
 =?utf-8?B?WnVFUFpMWkhxU0lzek90dDBjRXk3QlBKVHJZOXNDNDZ6ZVJGSzVjUkRkZVFG?=
 =?utf-8?B?ZWVNWFZsNEF0Q0M1S2hjbWZ6NlJOai95NnpEOGh3dGRwcnh2amsvMDJFTWE5?=
 =?utf-8?B?Wlh1NmxBRE9CbjduMzR5ZDhYYTBaR2Q3bHAxRmdQTmRydmtYYnRvTXg3Rk5U?=
 =?utf-8?B?N3VvMy9FRmFJazhicW5INzhhZjNpTFpndUhteTk0WHUzQWdmV0VIa01EWUp4?=
 =?utf-8?B?a0tETERzMElOb05uZnNBRWpXQzhXWGtEODFLS09NOVI2ZThjbkV0R2lDeE9t?=
 =?utf-8?B?OGlVdlYrWVRURlRKdFFINnhVcmVBajJFbmlveUJYTTZMcGVxQ1RocmxsMFpk?=
 =?utf-8?B?eVprQitYWjBPbzQxQXhvanlvVWxlUmNrOFNvUFF4SVY5RWk5MjJUT1FNQ1JR?=
 =?utf-8?B?Qk1aWk0xbDFHa3B5THB5elFFTlJFWlJpaUhSVG9LQ1U5MTZRQnZ6OGpSNzE3?=
 =?utf-8?B?TGtuQXN4UWEwVmsydjk2OFc2UDR2dFNlZTQ5SGo0Y3hsdVdZZG95M2lPY05B?=
 =?utf-8?B?c0V2REZvam1ZYkFsengrdz09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?b2UwWjMvT09HcVM2TW1vTkVocTJtOEFCWTU5ZHRGQ3F5N0RrS0NoWGwzdDNU?=
 =?utf-8?B?eUpISjhFUVVyRG5KL09rUzZiU1B4OHRBbSs0UXJ4d1k5dHo4NkE0Sis1MHV5?=
 =?utf-8?B?WHlNMTVsZFlYcFRmNGsrVGV0c3kvSm9SNWFiOWFtZ2QwNGZ4UGIxR2FDTWd6?=
 =?utf-8?B?QitGamhtWVcrZUJ2NnpidG9sMnV2N25hQkprUmNESlhXNW1NS282WWhQb3lK?=
 =?utf-8?B?aUhEZjdZeC9EY1Jib0VxNU9wMlJoZFJXMlk3d2VFd05aV1lDOGV2emxPZlpm?=
 =?utf-8?B?RzZZOE1SeFM1SWExdmtvdWRlaDVuUUFVUkN3UllYZVF1VlZGYW84Q3lvWlRV?=
 =?utf-8?B?L2t2WFZyVTZWT3d0MmRiSG9CTEpSWGtOM1kwOUFDYUxKU3dycU1oL0U3UDdx?=
 =?utf-8?B?cDlFb2ErTWhKb3NVVkxZUG81TnNHMXdiVkxhSXcxM3VzRnJmVWttdHB5QWdG?=
 =?utf-8?B?QnVXRnEvRmlBa2cxamIwUFkrUlZEYnllenJQZlA2Wkt5cTczZzFyZjVXVFUw?=
 =?utf-8?B?SE90bzkrcW9hWFJyanROdHg2Rnc1ZDQxMlVRazdUQjR5NG9yN2NCM1pnL04z?=
 =?utf-8?B?ZmovSlhDQ0hNVzdYS1RjSFpXQVlVSThiVVpRcUhtbG4wZTNzVVdNUmI0TnB4?=
 =?utf-8?B?QlVWeXBRNklFZ21VSHNXNlBad0Z1VnRtMi9nLzBjYUFGcUxZMDIrQjI2azNh?=
 =?utf-8?B?dWpGODJFRTY1YjBBMUFlMXlDWGFNVG9MQ1ZTNGhtbTBBTUFzZklNY1RVNXlu?=
 =?utf-8?B?cGVlR01qc3JhNmNoSDk4NFNwa3lrdDVmbHNGMmRWa2dvVHQzSk0vem0yendN?=
 =?utf-8?B?a3JEVkFXYjNzbmlHekNCcitUVG9HSUltM3VLRWZGa3RSa21WSloxVUtnaXpZ?=
 =?utf-8?B?ZWJuRVMyZUZna1VoNDRNM0xiWU1rVnBIU3pTUEhLTEhyZnBYcmFOTlVZMnR2?=
 =?utf-8?B?L0QzK0M0ZTl3T3p5cWIveDFlcERXcUdYQ0hWZUl6ZEJoQTlPT01FUjJ0MDVI?=
 =?utf-8?B?cW5zdjByQkk4dE9nd2xRbU5nY2QzQ0p6V1JyMTRKc0RjdURHa3lyZGZQYmJW?=
 =?utf-8?B?U3dTVCthYlg0eTFTYkJKNGZSRlJsVTA2bStZQ2RmQjQvM3pLZlM3cGJiajdP?=
 =?utf-8?B?V1JGdlB4NXBOUjJrcEhCQVgycFl4RE4xTTh3UnNLbStjRTZsakNLSXFKUHlE?=
 =?utf-8?B?SGhGeHo4Vlp4eUY2R2cxNHJJeXoyWEpMZFhHSXBOeGFsN3NEMS9TelNsNlBD?=
 =?utf-8?B?Mk5BN0pzRVUySEw0VWVybHlQWkdzRTVjTkhNVXlPN1VJNG5NSllwdDY1Nk9a?=
 =?utf-8?B?QWdMVmNOUkVidDhQUFJOc0dvcjRuVDdPRXdzZ3lHOUEvYWFwTmY4VzhrOTVz?=
 =?utf-8?B?ZDJuKzhlajRuZ0M1cmhmc1d4MWliUEV3eWNSdnhRemtNd1VQV2pacVB3ekR3?=
 =?utf-8?B?TTlBM0M3clhUWXJodld4azZOQmh3aXRpNFY2THpXOVdiSUI2NDVhSWtvWVhN?=
 =?utf-8?B?ZXRudXJiNXUwdG1xZ3NJa0grZmxFSmZnTGFSK3U3blczOXhxNWdhaHhGbDNK?=
 =?utf-8?B?QjZlMWhNQ3k4YkJSVmVZbXpnSVZ5WklOemJsZDFReitYTVZIQUsrd241YzJI?=
 =?utf-8?B?akNQQ2c3NXYzL0ZyUGhEYUxIVDV5S1AwWGY0czFOb09xMUIwekFUcXB0bGU5?=
 =?utf-8?B?NHlseEQyOFNzTzVyV1BvclhCYTNGaEltdnhRUGpSSXdFaGx1dEtWakRaYlFq?=
 =?utf-8?B?TG1KK0ZUZHU0aVJWeHRaVzRrSE1aWXdEenN5dzBOUVBTS3ZRd2doNnVDSHYx?=
 =?utf-8?B?cWhudHBUSCt0WGxTalUwQjIxUEg3bkQ5N2lmdzNsVks0QmlBNzRYOUpNVkJV?=
 =?utf-8?B?NW5GTnFZUzNhTm5WNmRsbUltcUtJQUFyODNTa0ZPVVpBVUVuaHJYQmRTRm9i?=
 =?utf-8?B?clFXeDRsUlliUWYrQk5QY1ZiOUtwRncvcXFuSnJ2US92QWtnWEpRYmU3VjRn?=
 =?utf-8?B?SmNBYWVNcFBaV3YxNVdYR0VTVUV2V0xhS2RUbzIvcTRPK3FSdjZLTHdtZUp2?=
 =?utf-8?B?aGJzVXB0T2h4aU5pV2F1eEFUWGNnTDhScHNvdG1HdjNTSXBLcnZ2YlRoM3RW?=
 =?utf-8?B?TkEzS25tU2hQcWRTSmx0dHo1cXRoejZJd05LajVJRFFrUklLSG1MRjltN2l4?=
 =?utf-8?Q?d/5bioS3/zLob8T7Y6pXrSg=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7f894b-3bc2-45cd-6705-08dcc2941a2f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 10:20:53.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CQ5HgnRwPLCMongE2LAb8U0w2yPdg/MUinEB9csWwYmS0SJx8NzbA+hqwR22DREn4teHNXnOk3FoZ6iNBc32yyr++DbmYiYQqy3CO/InAxE8ChtDOQ8y26ZMejPueW8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR01MB8872
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

I only linked to patch v3: 
https://lore.kernel.org/lkml/20240813084152.25002-1-chanh@os.amperecomputing.com/T/#mce666b8184682e4d463d418a294d95512d95c07a 


Thanks,
Chanh

On 22/08/2024 15:48, Chanh Nguyen wrote:
> Add device tree bindings and an example for max31790 device.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes in v2:
>   - Update filename of the maxim,max31790.yaml                        [Krzysztof]
>   - Add the common fan schema to $ref                                 [Krzysztof]
>   - Update the node name to "fan-controller" in maxim,max31790.yaml   [Krzysztof]
>   - Drop "driver" in commit title                                     [Krzysztof]
> Changes in v3:
>   - Drop redundant "bindings" in commit title                         [Krzysztof]
>   - Add the clocks and resets property in example                     [Krzysztof]
>   - Add child node refer to fan-common.yaml                           [Krzysztof, Conor]
> Changes in v4:
>   - Add Chanh Nguyen to maintainers list                              [Chanh]
>   - Drop incomplete example                                           [Krzysztof, Conor]
>   - Drop the cover letter because only a patch existed                [Chanh]
> ---
>   .../bindings/hwmon/maxim,max31790.yaml        | 70 +++++++++++++++++++
>   1 file changed, 70 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> new file mode 100644
> index 000000000000..b1ff496f87f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: The Maxim MAX31790 Fan Controller
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>
> +  - Chanh Nguyen <chanh@os.amperecomputing.com>
> +
> +description: >
> +  The MAX31790 controls the speeds of up to six fans using six
> +  independent PWM outputs. The desired fan speeds (or PWM duty cycles)
> +  are written through the I2C interface.
> +
> +  Datasheets:
> +    https://datasheets.maximintegrated.com/en/ds/MAX31790.pdf
> +
> +properties:
> +  compatible:
> +    const: maxim,max31790
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^fan-[0-9]+$":
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      pwm_provider: fan-controller@20 {
> +        compatible = "maxim,max31790";
> +        reg = <0x20>;
> +        clocks = <&sys_clk>;
> +        resets = <&reset 0>;
> +        #pwm-cells = <1>;
> +
> +        fan-0 {
> +          pwms = <&pwm_provider 1>;
> +        };
> +
> +        fan-1 {
> +          pwms = <&pwm_provider 2>;
> +        };
> +      };
> +    };
> +
