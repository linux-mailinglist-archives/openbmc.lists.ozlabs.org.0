Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5168AE031
	for <lists+openbmc@lfdr.de>; Tue, 23 Apr 2024 10:46:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=R3rrNeUr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNwhC51Cfz3dLd
	for <lists+openbmc@lfdr.de>; Tue, 23 Apr 2024 18:46:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=R3rrNeUr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=52.100.159.213; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02hn2213.outbound.protection.outlook.com [52.100.159.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNwgc6Swpz3dBx
	for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2024 18:45:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKZ8KTriojy4tPV1gSc7bqREQuzGZI+HBRjQ5OqJpK8q0/0cgrVycZwzdevEnJSh/OnKvCUF45b/IABuNkqots/Mlde0fxoFXxlFCSSRnLUhNboOHdHRkTH2urVssDp9zOlMQLlPU9W+SCIjmJLTUx04CT01YO9eSUfpNywd/uPoSKx3Xu/ZkB2FMWSPNg5lg2mbuJP0TyF/gE4AgT1JjyIc2NPyUQI8o9I5fsPvZj/maF5gqENhB+Whv0n5TkPOQdsHBwomYJPB7TA4e705Q0cquq5Y6tlKd4wtZXOLJaUyT1ycm9d6+AR4kmqpOeW36tMyPeeUpseRq2b7l92w5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5EzqQZSooulsjkTANisIwV4TevWyZLmJEs1QVuSeJs=;
 b=P5gxPCKBGLDDhD/pZI53H8ZxU+mrdkY95hR0CLsXKSm8Iq9q6pY65ikT3+aKiG9+QWpXGnQ+4/1Obg68W5glgJW/ljuXrPBPiHRn1dwY5wTcACrCHoCo35qMDzo4ZFmupnQbc5ploWwFnRx3B9kjdukQA8iRhvYBWy5OX1a5vhjL9JlYjWVpSagubJlGA3qXgX4RU7zYktXPeD9jXxWQZKHu6Mm81WCIedahZGJO2xMsFQpvvIP5sNsurM8hmpSSqGJpwYNeM0oOmrBbfYao/KXkobeEoR+t2RIQXDNf2e6wywdjDJ5v7GG6sPj2UG02AGngmvfo8QKglmHNDodljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5EzqQZSooulsjkTANisIwV4TevWyZLmJEs1QVuSeJs=;
 b=R3rrNeUrHKhgkq85vTy8MzaBm4JEAvDNhFxvnUkCNG0+wQsq6oYYgyO4Rxyk0kUTYlDA1tPfzui25L5s49f0fpiA4C6h168FWd6rGpm7LNt+jGQW3UW2bk0rBAuGioNqZplMqr11UY7a4dBYUhkKGuODoIaev2S0dPuRhRoslNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 CH3PR01MB8267.prod.exchangelabs.com (2603:10b6:610:17c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.44; Tue, 23 Apr 2024 08:45:24 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 08:45:24 +0000
Message-ID: <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
Date: Tue, 23 Apr 2024 15:45:12 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
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
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
 <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
Content-Language: en-US
In-Reply-To: <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|CH3PR01MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 9917c390-700f-4fa6-ce80-08dc6371b74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?UzdiR3YrR09kRFVOdStMOTNXSm8rNkd4ZkRHUDREOEEzM3JhREQzYjBhd0RW?=
 =?utf-8?B?MnpKdnhGL0NjMzVvMWtrT1VxQWdFcStsQVlsNm9STWVtay9wZ1dHOVZETTBk?=
 =?utf-8?B?SVp6WlFIMFZZd21Ma0pqenZ1cUlWUHVRNmpqTi9laGJWZ3dPUUZqU3BKSFd5?=
 =?utf-8?B?OTlxT0hvT0lUYUZSSjFPOEZKTldNNCt6bEt3YUtJSGFOVGxBSW91a0NoTjBl?=
 =?utf-8?B?ZmtxK3FtTngzd0tRZUMyYlFCVENSb0FpOGl0TjdmVjNIYzBFMlc4QjZtWnEx?=
 =?utf-8?B?MHVvVldqNFRCZmxMYlpXUUwvZ29odFpyTGdxdTY2WVZicFNKalRiS3lxTkZv?=
 =?utf-8?B?b2Z3SHRUMjRCMWtPVlBsUUZkTHM2eWhTWER1YjFwbWlSdFVzZ2FWU1dlRm5h?=
 =?utf-8?B?MWk3bVVqZ1Q3UUF4c0UzalRzelNYM1ltYk5xK1BYWlN6OUdIQ0ttekF5VTJH?=
 =?utf-8?B?cEQ2Q3BCYkk1eXJLYXMxMXZETHpnejlzYmFaZ1U4SkVJV0Y0K1I3cGZrVmVF?=
 =?utf-8?B?SkVNUEl3QTBCd29BbUZHMVFZK2ZWb0t2WlM0ckQzNHBxOUdvdk4zdzhmTFIx?=
 =?utf-8?B?S1l2VzVDdnlTejBPUG5jRmNIZFozN01EK0lyNmVJSC9iYVRyMFRTYlNTcWtV?=
 =?utf-8?B?V2pkdjVmOGpFSkpod2NvN2NuQTV4N0g5UDNTVmtBTENPZFBLTWVQcjdWMkZ4?=
 =?utf-8?B?b09Fdzh4ZWh0YU5ma2dMQzdzeGVpeWp2bmlIeDVpSUpuRld6Y3dnKzg5dTRi?=
 =?utf-8?B?NHBqak1idmQ0UWphWWJucTYyd25kN3QvY2lCOTk0bnJBZzhDZ3g3RTg4RDJn?=
 =?utf-8?B?ak1GU1FiN2RCOGZmcHVpSU41NDQ0WHJIQ2JZaFBwTHl3UGFZYkNQMzhPUUto?=
 =?utf-8?B?M1pjRGVvc1BjcTkySUUwamg2VTR2V1FDMkM0M0ZHdDVoaGJWK1N1NXB1V1c4?=
 =?utf-8?B?TU56NmZyNVpWTHdGMlpLQUdLVnRyaXFiZzQxQkdvYVlMWWFnQ1FVNVZ2eHc0?=
 =?utf-8?B?MS95a2dmVUx1d0ZXRU1Xa0VqTnQvTVhTa2hmb1JKVVR2Uy8rTmxSLy84K3hh?=
 =?utf-8?B?eVAxWjJwWjFYUnAyai9zNWN1SldsK045c3NpSkFNbUppanhGb3dlbVdRR1Ro?=
 =?utf-8?B?Zk8rbUkwdGU5K2pJNTBFRGRqWGZua2s1MW5WaWVqeUNKVE1QSHVPazRnY3lU?=
 =?utf-8?B?UkJxODBFTHVlNm1jNGNudjJZaWFyVkU4U0kwV3dRV1p1UTNiMGJvZ2VmWlBG?=
 =?utf-8?B?N3lsLzNESHRNeXFMME1mUUdJYkxGd2p6dFUvKzZyK2tLNmZQRU1xbzdmcDV6?=
 =?utf-8?B?UjZkUWVpdG8vejZ1dWQyVDBxRlkvT292SDJaNkxrUm9FVmNJZ1N3UDNnN3hE?=
 =?utf-8?B?TUlYb2lWamhjdjBLZjExclRGZmkyYzF2a0Y5UFY1RnBLRmtob3FJalhsMDBW?=
 =?utf-8?B?NUtPRXJvVWI4Vnp5ejZ6N24yS0g5eWRVemR6dXU5R0FUUzA1Q2dYaUtwL3JH?=
 =?utf-8?B?VVBzdDBTWHpUV1JXWjcySmRvLzluNmdJZDNIVHhwZUNkZmpoWTdCMEJWT3hH?=
 =?utf-8?B?RXZ4QlQ1M0RFbUhCaWlPak8zUGFjdGNobHB1eXVJSlluc1c4ajY3djVKMTBw?=
 =?utf-8?B?bSt2eDdleG9YTnViWlF1empwcVB6bkpJcHhoUUU1SDkzcjFnSTNMUGNpejdZ?=
 =?utf-8?B?QytvZHhId3ZuTXZlTm9hSDMrSXdxakVDblNQT3VlQkxoQUVyWUo2SkJXZTZJ?=
 =?utf-8?B?NVhsMkRwWFA0L2lUWkMyM05EU0U5VXFSeFRLTzFWVkE4NVZ3QWRrSlpKMGxM?=
 =?utf-8?B?ZTI1SlBUdGJoMjZlWUkyaDNyZnBMYVpOclBJbE9yenhOOGEvQ3drUkNGTk9U?=
 =?utf-8?B?QXJLQ001c2xzQkc4TEVTbWJzbW90V0xPYnMrV09kU3FlL2Y1ZnVkMGJqWFE4?=
 =?utf-8?B?WlFGZXJ2dkJKaTVIeXBoKzhPeDR6UmR3YldYRlhmNTBBY3BvSnJ0dEt5YzVS?=
 =?utf-8?B?Y3h3UnhlaVp2TlE2UHVuajBhMWI2U213enlkeXFtaEY4SFlVZ2hUeGZXUmpo?=
 =?utf-8?B?cnRNNHBuM1hBSVNndHZLOXpzZGt1bVpjTTUzTTVkem9nMFZxd1dGVFl4VEs0?=
 =?utf-8?B?SWFsenVGSW11UW9pY1FabWZFLzJnVTdkMmdPTDFnb1VJcGtuWjlzV2FjT2Yz?=
 =?utf-8?B?NWFmNm9FS1JvNkFhOHFMR2R4TERSK3p3ZCtZeVJoK3J6aHVNQlptT2RUcDlP?=
 =?utf-8?B?NndxZmFtYXpJQ1A5TGVvaWhBNm9Jci9qMlFOeFFDN0hDTjNrekpzelVjaGJX?=
 =?utf-8?B?dFlPM2tzVGc1YVBUMytiNzFMejB2TmZ4Rm5iVitWSDZrVXJxSzVQUT09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:OSPM;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(34012699006);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?a1JQekFDeUpXbVFWcUw4U1Q0K2I3RzV2cDk3ekhCOVNYWVF6MDlCTktrUVVX?=
 =?utf-8?B?b0UrVW5ZR2ttSXpwRWlNTGZoYTg3TUU5WDVVRWxHck43S2RocWhmazFuODQx?=
 =?utf-8?B?bmQ0Vlh5WWpjQzd4ZlkrNWkySDlBNjlCeEQ1SVZXczRUTWx1WUo4YWZQVm1l?=
 =?utf-8?B?aG1Rb3dUTmhJL0NGSlhDdEJPdjlsR3NBdk81aUtIZ212MThZanh4MnhseEdN?=
 =?utf-8?B?MGx1eFdiYUx2aXl6OWsyV20zbURST01DbFQ0UnhlZ0RuTlBRSjk3TU9YV2RP?=
 =?utf-8?B?OUZtayszSjltVnh2OUpyanlMR3A3RUtFWXQxQURPNEFFVEVTcHJsT2RrVWhM?=
 =?utf-8?B?TEIyTTdRcGhQcE5iRDgrRnBoZkhlRHBOQ2xkbmR4TUJtUTdvaEp6VkRXWUxa?=
 =?utf-8?B?V25SZVlXam9lMHdxME5HOEFpakFydXIxZnRCVHVvdkg4UFFWVkd0ckZmNDI5?=
 =?utf-8?B?M2tSWFN1LzVVNUhMRUVsRUpVa29GRTAxdjhWMVpRRnVqbFJuZXByZ0ozc0dE?=
 =?utf-8?B?V01XWmNWSXhNNDl2WWRUY1hzWmxscS9aWG9rSWpXT0Q4ajE2ejBsU2srQTdB?=
 =?utf-8?B?Uno3czhzTTdHbk9OZ1pidDk4bHhBaUlGWWoxQjJLUDg3WTlsZDJqTXFSeGFN?=
 =?utf-8?B?NFlMUFNPcVlYcjFJcTRKeWVEUWRiZ0RoVFJVdTR4NHhaaVlkdndIMlBscmxK?=
 =?utf-8?B?R3FMSzgzOHBaM3htZlRCa1ROSno2b1A3WCs5UmJpWTFCQXhmU1FsbVJiZkl4?=
 =?utf-8?B?cFhSTHpxRjY4T0xHZDZXRzdIN1ZxcXRBdmhhcUZreWx4dEFPL1N3cVQzMnlU?=
 =?utf-8?B?eTNVd2l3NXF0Q1JEZ2NwNExLQ1p4TzF2MU9wd0J1N0wvSkZXZjlMWk1xV0ZL?=
 =?utf-8?B?Vkt2L1NpakJzSGNkWVR5U2FUWXFESlIra29ORkpEc3N6dmphRkduL1dMdldr?=
 =?utf-8?B?U1EvRk9hZS9ZL1hobTNzNUZvb0ZjelhHcFFyQXpuVDBQeW1pMFV0b0FpTERw?=
 =?utf-8?B?SEgrK2hmR2xuTUwvcmZnOVZDTDRLOU54cHlLZ0h2ZTNhSUp4eG5vUUZBalhr?=
 =?utf-8?B?Wk5uU0R6dkx3SUc0dlB0OW5FdFJacmw3NzlmVkZQUms3WUVpYlk2YUxUZEFk?=
 =?utf-8?B?a0dNS1JNNGNMQng1aENSUzFNTTdYR1FUUmlXTEdvdmRCV3JLVGVoV1FDQkFn?=
 =?utf-8?B?NXNDR0ZzOTFmaGltbVFXSFJvYWwwSkl1R1pKMWJuYUU1MnArL3FKTy93bHor?=
 =?utf-8?B?RFBLakgycmVTME1ZNXNGRGpTUDVTZXNCNjF6VXVZejdsaDF5cy9SaHF6VlJD?=
 =?utf-8?B?enBGNkg5VEx1MnZUbWJjVDdTVzloMmVtRUV4RkY1RzU2TWNhd0ppeHBaR1kz?=
 =?utf-8?B?d3FKVElkTlBNbFVhTThGSnY4d1g4Y21INFdvbGFaeFMvWm5iNDJ0aHdKNzZx?=
 =?utf-8?B?c1pGaFpzNmczTmU1T05UY1NZREVsYlVXbUJKYVJ6ejRpT1lZcjV0NUI3ZUZM?=
 =?utf-8?B?d0FtbEJndldvWjN4MWpoRUVuU1ZoMTFnYS9MOHdGNnMzLy94YWhqTWxxSE9E?=
 =?utf-8?B?RzRlcy9iVHE0eGdxekVjRUJDODJnSVFsalNIOVhPSVlreVh0L0FVa2NxQjJn?=
 =?utf-8?B?VEYrQzcxeERDeDNvcEFuVUYrODR0YWdHdmNzV1N2WjVnY3I3QUVhbG5UazFK?=
 =?utf-8?B?eHcyQ3BpbmlraERnZFdTb1RWbmYwM3ozYWJSNnNQM0ljNDhJVVlablZScHFF?=
 =?utf-8?B?WThaeDMzSGoyMUVtNzQzN3ArVnVJVWhUSFRSTDM5STFLbFVqVlV1elVXRTd2?=
 =?utf-8?B?a2NLUk9CSlQvSDdudjhFT0xnNVBRVHdWZld0VEdYNWM1TWs1NTE2QkRucSti?=
 =?utf-8?B?eHJHVXRCM2pmOEZIa0FZWE92OUJHQmNaaG44Y2VuUUorOWY2Zi80Sk1ESjJS?=
 =?utf-8?B?NGptSjRhY1c3VnNKUVNHSjlTMG9UWWlOYmtqQ2RuUVNlT2t5Z1dYSXZQNVR0?=
 =?utf-8?B?bFFWckYwTDRoUnprS1g5aFpCUnlzaldXb2RSMXpoOG9ld0ZiNENzVDNHWXZi?=
 =?utf-8?B?VktLdkpWemk5YytKcVNBL0JSMHU5SXR5WFp2WnVieFFUL0czNFYyQmF3MUV5?=
 =?utf-8?B?MmNpMWNjQ3B2b1JST20weG92QU5rM3pDZjgxQ3RjZjNzVDVMUXJSN3o3RC8y?=
 =?utf-8?Q?bEoGDkCJDXSiqjTe+0Sej3I=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9917c390-700f-4fa6-ce80-08dc6371b74b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 08:45:24.3817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OS2OddWgDnOcGFp6DaRhHxsG+TCrfdztLGVtMJU+Sz6Y19wgbdtrOB+ah05vKT2zY8EXIp7+F5bjhwyNysVy4HagfeyaOAxWe8lCnjZJPqY1fub5R9Xwr7okhpd94R1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8267
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



On 16/04/2024 11:52, Chanh Nguyen wrote:
> 
> 
> On 14/04/2024 13:07, Krzysztof Kozlowski wrote:
>> On 14/04/2024 06:22, Chanh Nguyen wrote:
>>> The max31790 supports six pins, which are dedicated PWM outputs. Any 
>>> of the
>>> six PWM outputs can also be configured to serve as tachometer inputs,
>>> allowing for up to 12 tachometer fans to be monitored.
>>>
>>> Add a new vendor-specific property, 'maxim,pwmout-pin-as-tach-input',
>>> to allow PWMOUT to become a TACH input.
>>>
>>> An array of six integers responds to six PWM channels for configuring
>>> the PWM to TACH mode. When set to 0, the associated PWMOUT produces
>>> a PWM waveform for control of fan speed. When set to 1, PWMOUT becomes
>>> a TACH input.
>>>
>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>> ---
>>> Changes in v2:
>>>   - Update the vendor property name to 
>>> "maxim,pwmout-pin-as-tach-input"   [Rob]
>>>   - Update commit 
>>> message                                                 [Krzysztof]
>>
>> Please put binding before its user.
>>
> 
> Hi Krzysztof, I'll drop this [Path 3/3] in the patch series v3.
> 
> My patch series will only be two patches. They are "dt-bindings: hwmon: 
> Add maxim max31790" and "hwmon: (max31790): Support config PWM output 
> becomes TACH"
> 
>>> ---
>>>   .../devicetree/bindings/hwmon/maxim,max31790.yaml     | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml 
>>> b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>>> index a561e5a3e9e4..2d4f50bc7c41 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>>> @@ -30,6 +30,16 @@ properties:
>>>     resets:
>>>       maxItems: 1
>>> +  maxim,pwmout-pin-as-tach-input:
>>> +    description: |
>>> +      An array of six integers responds to six PWM channels for
>>> +      configuring the pwm to tach mode.
>>> +      When set to 0, the associated PWMOUT produces a PWM waveform for
>>> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    maxItems: 6
>>> +    minItems: 6
>>
>> tach-ch solves your case. You define which inputs should be used for 
>> tach.
>>
> 
> Agree Krzysztof. I'll use the tach-ch property from the fan-common.yaml 
> to solve my case. So I will not need to define a new vendor property as 
> "maxim,pwmout-pin-as-tach-input". I'll drop this [Path 3/3] in the patch 
> series v3.
> 
> 
>> Best regards,
>> Krzysztof
>>


Hi Krzysztof,

I checked in the
Documentation/devicetree/bindings/hwmon/fan-common.yaml. I found the
tach-ch property, but it seems define the tach channel used for fan.

      tach-ch:
      	description:
        		The tach channel used for the fan.
      	$ref: /schemas/types.yaml#/definitions/uint8-array


In my purpose, I would like to configure the pwm output pins to become 
tachometer input pins by setting bit[0] in the Configuration Register.


I think a vendor property is suitable for this purpose. It is only 
available on specific MAX31790 fan controllers and not on other fan 
controller devices. So I think we can't use the "tach-ch" in 
fan-common.yaml.

I discussed it in the thread
https://lore.kernel.org/lkml/ce8b2b49-b194-42f7-8f83-fcbf7b460970@amperemail.onmicrosoft.com/ 
, but I have not yet received Rob's response.

Please share your comment with me. I hope that will help us make a final 
decision.

Thank Krzysztof very much!
