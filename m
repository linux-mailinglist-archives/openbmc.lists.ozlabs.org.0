Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A7A961F06
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 08:05:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtv600zJ6z30Vv
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 16:05:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::716" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724825123;
	cv=pass; b=XN4qgFXMVSS8gwJL2isN4bQQhXpptq2iIUIJYatih2GfmBhEb+ihQGkmP+cOO5nznYQRzdLjhXH+zT+967cudXskA9MZcN74VGFedDIMz3X+m9+ksx6wey36WWKmJ46fns3TMfllqgN+2lTifFqjbXL2FvhS+fbbRsSApJZZ++knEjPOdcsmrAL3C7jnNCH5beVE4jZkaa1n+wXgNSiIBsUV1EAhuOqLOU83fEVWdZXQdeuKAPObLwIKWCU7xnV1c7/eB6l6nAXyyS+xjXGzyfIRC4rUa/jzoT68CQ9AGRQGD0XdfUPeNZRP/oYdJ2DGmqjEjnR29eJt/nrJEGh8Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724825123; c=relaxed/relaxed;
	bh=JsPCGJp1mM630I6pE2nAguAkVGbq+F2UM46Re8h9ni8=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-C
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=AStcIYr0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::716; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=AStcIYr0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::716; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20716.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtv5v5YZpz2xs8;
	Wed, 28 Aug 2024 16:05:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vO4ONhfZwhJHSPV1K6nqr878oBuqFuluaE5I1mO2VzwbR+S+FVb+/4ZACT9KLpYxhCtZ8g97NicNDbz+lHqausdUkmNL6taoKWnYyvPbk/xpkA25TxewxeNOcxQcaJZ6cRcMkauet+XwLw/b/9ToX9o75RYTZVzGeqV0x0PLXizlY8lgOq+smdRJRQTjRT9iOlJSpKFsea7tdO2MGnSo6s2gY4p4ePxi0mRWEQa+F5NHuhTk18aAzVb/FxrcwAlkTjKi0WUkQ+gd4lVHKmttXHO0tXz9ztrD1JJ9+U4FEdT1MtF/Nf5hMnB8lU0obdwGZ3cX3Rd847vlF3OhbyRAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsPCGJp1mM630I6pE2nAguAkVGbq+F2UM46Re8h9ni8=;
 b=eOvEFoZz+D5NLt9VllJYCA1m6ItyFC/44wECVk58w8GLXMhph2EDIyx4+mD0MgAWFM7Y0Rxax4LQ6vrnMzYygrfAIk8nP4SHPbMK/FWWjZcyCaHWE6c1peSQ6upIpVUFB20oSlxRJ+YiiiCpA48gr3lNY4P+7R1no7VCUnBIlhxK3YOcdMCnrypPf5YVwxwy6H+MSQltkCNjtef+UPqcLunmvdtUYRgGlmozVwpwybBBRQYuQPs46j/FeCKCtRJfNRm8TGUGpWgiww+TLhbeEQ5rP2Le5FFM8ArfAVSSnZvuh4bARpj5NzipZ2DwFB/R0Jy+4I0/l+kOwnhdFx1n9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsPCGJp1mM630I6pE2nAguAkVGbq+F2UM46Re8h9ni8=;
 b=AStcIYr0eW6d8V51rJK8UJbc8NjHD8WvLeFJ+DOUkvFBMgkYoITTcqbSXNdpc4+TltPq+F1L2U9+ompu8k5Hu/XAPRxRv/zgfrY6Ym1rBYspwuDc/MxL/w94twDPL82kOmliaYAIjZJy9dfiATMdNgPXe3fXu5CNCGPXF097L5bxhWHh+ckiPbO2hbEM6ZnUMqzszyW3RQKrvdeK29EFupHMvukK79c2ZcggNkWAQ7ILpCi338uboG1FXDYZwqzWNpBf3iMIXtYASVlnx1EahXLhJDp4VA6tVW889clQsJXARQaWJ+ETx7JvxFyxlr4TUX9aHnPnDqZbMNZePbwxlw==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by TYZPR06MB6167.apcprd06.prod.outlook.com (2603:1096:400:341::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Wed, 28 Aug
 2024 06:05:01 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 06:05:01 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add aspeed,video binding
Thread-Topic: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add aspeed,video
 binding
Thread-Index: AQHa8hE3AXMd5LvxBkaIX1mCaxtGp7I0DHIggABWjwCAB9hrYA==
Date: Wed, 28 Aug 2024 06:05:01 +0000
Message-ID:  <TYZPR06MB6568A38AD08F72EC637EFA7BF1952@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
 <20240819080859.1304671-2-jammy_huang@aspeedtech.com>
 <nnjcjt2kuplsy5bbxujuubkn2xdtpifjeiqt5qfvktdmaorzuz@x444p5ezcoch>
 <TYZPR06MB6568AB9E260263DBB1ED474DF1882@TYZPR06MB6568.apcprd06.prod.outlook.com>
 <a17f963e-0e6d-4132-817f-2e663268ee2d@kernel.org>
In-Reply-To: <a17f963e-0e6d-4132-817f-2e663268ee2d@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|TYZPR06MB6167:EE_
x-ms-office365-filtering-correlation-id: 0a516b03-ed9d-4ff4-f486-08dcc7275a68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?cUR3QTMybk9wY1hYNlBpdzRLLys0N2orWmxhVlB0N3Exc1Q1Vzg0YkNKSDI1?=
 =?utf-8?B?MFBkUzZmNVZoeWthcm42b1ZNWjVHMHpmam9GTWpSOG1RTG1mYld2dGtWL2E0?=
 =?utf-8?B?QWdhbWhCUUx1TnJVRTJNMkppV1FneDNsWUNwZGpMZDJaTHVFZ0tLcUIvN3A0?=
 =?utf-8?B?RG9HZ0RSckZib2JQeTYxNERmaFRYeWdGdXdHYjRnTEJMcVBZR0EzQU0zaTh5?=
 =?utf-8?B?TEh0cEJWVE5DUVJIUWR3Ym1TaDl6N2lZT0htc1R6S1Nvb2hObkM5N2J5MklS?=
 =?utf-8?B?RmdLUE51YVVsajllWW94eCsxeWFrQm11OG43bWpWeVl4RHBRanBkQkYrK3px?=
 =?utf-8?B?N1MvbGdhWFlpNzBYSFdDbkk1V0p6QkQ2d0gxeU11ZmNLV2hNdUt3S2dFTUdp?=
 =?utf-8?B?SVM5OWl1OHFjVXhxaGhZa3ZidTZWeGR6QVkxcU9wREE1U1dvMEt1R0c0U1NJ?=
 =?utf-8?B?Y2tsOUc2R0QyZG5vNVFLTzNyMzJ5QWhodWVOV1c4U0RzMmIyZ1J5VlZFMHdO?=
 =?utf-8?B?a0w2OWc2dGVxWHk5THRJT25IL25mRk9nTXh6VHBaODNVbXF6Yng0VG8wdnZU?=
 =?utf-8?B?R1F3VVQ1cTIrUkhOZEVlUUI3QkxiZjhyUW01QnZqc2t2UDhORWxLU0pQcHp4?=
 =?utf-8?B?UzBNWmlnVDltL0Jzb3lCeE4xZ3NvajJtWXdQUTRCRktXUTRFSEQ2dm1LVEtK?=
 =?utf-8?B?YVJxcEF3cHZkT1pCVG9qRE15Y0o4L1JOaWpxZTQrMHJYQ2xnYytwMlZUWnJw?=
 =?utf-8?B?K3dRTDlST0FmRE5xeEdvR1E5d1V6N2hGNGRQTlVXb0xieGpTbHVrR0RLUTdj?=
 =?utf-8?B?Tno2MXZGZ3Y2VVpWbTF3MUVUMjZmK0FNV1YvVVdTTEZHa25MUHBSeTIyTXJJ?=
 =?utf-8?B?blc4T1lQd3lpdjBRaFd6WmUxWXZaMG4xdXNjam9JL3dFc25aRDcra2dUWnpP?=
 =?utf-8?B?Z25HWXB3Y3kyZ3hObTlTdUZkWXJmVXNnVElmTDBSYUFTc3pRV3FKUDhScnpZ?=
 =?utf-8?B?THJCVkMzV3JZaVYwbDNaRk9ON2RidVNrRkxXUVVDTTFqTXRjcWV2UGQyY1l3?=
 =?utf-8?B?d01zU09aRHZ4K2h4bjNpZGxhVXlHMkIzVWh3enNWZU1WQnhNUFdwM01zdVlC?=
 =?utf-8?B?NmUvKzRYNFFQcFNLZmpUSjNya3JjQTdNZzBkL1ZmZ2JRdDNPQjlGa0pOWElJ?=
 =?utf-8?B?UkZZTGxzTk1FeWhwc1FSMVNMdnY4QU9qb1hLZlVLVkNDaE9aRHZncEhDYjJy?=
 =?utf-8?B?TkE3NTdzNTZFTlFTQzIvRkN5OEVCZ1BJZjIrMVZBQitSSEpVcEhIc1FXQmlO?=
 =?utf-8?B?MWxUaWdzTTNaRnF3RHcxL2lKOHVCTGlCWnQ0QmJlSzEwTElzQkUxc2JYa1hr?=
 =?utf-8?B?T0FVVW1RaCtUUVJmNWkzbjY0T21jSDMzY2NmazRuK1psMEozVE5veUlpa2xM?=
 =?utf-8?B?NWdCaVFKK3E3eWZZZ3JxTTBHMWJVRXBDeFZDRDVFSkhRN0hjVUF4bDBONUdt?=
 =?utf-8?B?dXlIUGQwVDBqalR5UVh5YkNXZzY4aElqeTFJWFRkYVdnR0FNeUVQaW9EaVZM?=
 =?utf-8?B?VVBMUHluY1JGeWhGR3FIY2R4dHJIR2M5SU1XSVBKVE1heWFTMzR1dEI3VHBw?=
 =?utf-8?B?cTVkY3RLNFNJR3FHdUFLVEcwZ05MZkNFWW9wZjMzNjR2NDc2R1hhMG8ydG9M?=
 =?utf-8?B?TklMVWFvNHpmendtSDBZK3lFSTRZdEcrTktkd1FMcU9zeEQ1WElqY2dKUDhJ?=
 =?utf-8?B?Q3BjOUVPRlZ3UE02Z3BsYXJzMFV0alhreGNjNU5rK0RSY3JEUkxNaUIveXFS?=
 =?utf-8?Q?y4bbBfHcR3Gy+q3SECZuh5vHZCMtiZmCMMyuE=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RnkxY00vVkZ2a3BXeDZDYzlMVkNuTGlyMnRpL3N0MFJlcVBKWFEvbDlLN1hz?=
 =?utf-8?B?Z09EOERRU2U3MnhjWGJIQVVIN05lWjNNbFozVFBDc2ZoKzgyQWNxN3cyT3U3?=
 =?utf-8?B?dENXS0VwVmdaeWFCYnZhL2wzYUZSMnUxaHY1RzRCK3ZHNXFsWE5pQXlyb1Nr?=
 =?utf-8?B?SExqbHhSMWRtdmsrd1BOVFVnMnNLS2lVNTkxcGUyWVJtWThVODlDUS9FMThi?=
 =?utf-8?B?eTZ5WnkyNVhla3NoaUhaUEUvemltRC9hZEZGdEcxYUQ1cVJQbFVXVlZBcjB2?=
 =?utf-8?B?Yjcvc21LTjZwVElLSitqbjlIRXNMRzZnNXA2YlN5L3pJTzBGVmZYZFkzZnR5?=
 =?utf-8?B?VmRmbXN6SVplbytwdGNaSWNOcVBQQ0ZQNVdYQjNKWEE2Ymo2alRnTVcyNktl?=
 =?utf-8?B?Q1JUN05oQzhiSzJhb0ZSMjF1OTMycFZTMEE1eCtkLzdWd3oyOFI2VEk4bll6?=
 =?utf-8?B?SG9PTXh2MmF2V0R2Mk1RMDQ4anpEOEQ1YzNOTGdOdHdZZ1U2UkxvRHlKcEFX?=
 =?utf-8?B?RmdWYUw5c1VTVlRwanp4UHBKVEwvQjhncXpEbjAxcjBaQ0pIMWw0a2pjd1Br?=
 =?utf-8?B?NXRENC8vVDEyNE02aDhZVzh6MmFGRVlwdGpyU2pLV3c1YmZvMWRzWFFsMXRY?=
 =?utf-8?B?bElWMUNYUjFCMWtzMUUwRFZYekI3NGhBVVFRczNGRkEraTdINnBKbDFvZjRT?=
 =?utf-8?B?a1lHd3h6L2MvRHNNU3pRUDdhd29wSVdmUjF4QVcwTzhFZ0lLcDB5Ky85OStp?=
 =?utf-8?B?bzBpMEZrY3JIN211Vm1tRnE2M0FydnBtZFJvNzFiZEpYSTJhUlZwcjFTdkh1?=
 =?utf-8?B?MCtEWnYxcjFlb0E2UEIrM1U2MktIUGJmM3hVRmF1a0dFL0tYK3JkTkU5UHlv?=
 =?utf-8?B?d3VOV2xSM0hnUXlYOFRMSGtsQ0tvbDJPVVZ3MEtmejJ1OEtxT2w2aDJuaHNi?=
 =?utf-8?B?NXppaU8vUy9vdkFNRlY5eFlkeE80bUpyWWUyc2xYQUhzbW1BMUcyVmNzdlJs?=
 =?utf-8?B?dzcxM3F2RHQ3VFNTWXl1UGU0RG5JSWR3UzVmWjFXaU9YWGxUM3JaWVFUQWJP?=
 =?utf-8?B?MWw5bERqSVMrQUI3Z0k0TGZOWVpJOTFTNHNha050Sks0U29SWUpGNU04SWdx?=
 =?utf-8?B?cHhiUm9vSm9SZEpycFZQWmY4bC9qZit1UXU4T0kzaTdvWm5vdHdzZ0Y2elVJ?=
 =?utf-8?B?c2xlMjhyeUxIY3pPRFdzaTJiYlB6NFFQT3pCTHlCOXlxU29oWHB2T2JQWTk1?=
 =?utf-8?B?MVpodk1KdldXUG92eDZ5RDBVSkNzYVZBWDIwSmI0WmJRamcrS3lrUDNHVkpJ?=
 =?utf-8?B?SlhZekVqV2RsQU5oTGZjbE1xTkltZVZtNk43Q003QndRL09jUUZiRWVLanlj?=
 =?utf-8?B?ZmE3a0I1aXBjdC84elp0WVBOWlVCdXNYOXE1QWMxTStBL1BqcStZbWJXdTlO?=
 =?utf-8?B?RmVEZHQ2UlNCeVEvaVlLckFzM1FBRlNsN2Z5dldBeFJITmRzVDdlNmRMbWFu?=
 =?utf-8?B?ZzV0TUtjNGxYWFdUdjJnalh1cTEwT3VWWWZGcFJDb3h6RE51S2NRRG8vK0x5?=
 =?utf-8?B?RWEyWVhFaDF1dGIxUjM4RGlwZVQyQWdDaENBZzlEditrYUxEYzd2NkYrMWJ1?=
 =?utf-8?B?dXZnbVVjaVF5WmE1ekY2ZHdKaFhhWXBXRm1ZMU5tcURDdm51U2lndHVNSVZ3?=
 =?utf-8?B?TnhnZFYzS2tyUDBxWlJiRkRWM1RwVXk5U3l6T25tdW85YXVlZWk4VFROdlpU?=
 =?utf-8?B?RkFiT2c2b3lEaGxGekxoZTRnbW12RkRuZXgvZjl4M2h1bGhXQlIybVJIOEJX?=
 =?utf-8?B?UjFyRlNORVhjRWFndjFqREtQMEJIS3JlMTF1eUhyMkZUeXUrMmZidnE5elJm?=
 =?utf-8?B?eitybU5jUFBhcjlTOFB5RENBT0JFcGN4cnFLbm9qTTBuRklydEtiamhKclNS?=
 =?utf-8?B?RDZINjlaMWZITENTTVMydlpvRG1RNFBCaHVVVjFFb3dlNGpqaVAxRjNJODdl?=
 =?utf-8?B?Ylc3NDQ1aEU2VUZBUDZ0NjRhZDBUellNZnNINHlEN1E3KzBIbHRtWmgvcTB2?=
 =?utf-8?B?eEhUd3d1d1lLSnAyNGlxTGNKaTFaejhuZzRCWG0zSVhEOTA3eVVXbUdxRU44?=
 =?utf-8?B?WVBQUHR2R1ArdkhsbFJKZzRWMzZ5UWFrRDBETGlySjQySUozYVRvL0N6SFdQ?=
 =?utf-8?B?R2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a516b03-ed9d-4ff4-f486-08dcc7275a68
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 06:05:01.3901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cookyWLn0qStDcURA4KAA5SzeA0zp5IFV+Db05nJs0GCwjENZYv86djRjC9rQZaOur6xjp4BLRAUkNql2ppdbF3Deg66VB2rFGlEmAViprM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6167
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgS3J6eXN6dG9mLA0KDQpTb3JyeSBmb3IgdGhlIHRyb3VibGVzb21lIGUtbWFpbCBub3RpY2Uu
IFdlIGhhdmUgaW5mb3JtZWQgSVQgdG8gcmVtb3ZlIGl0Lg0KDQpPbiAyMDI0LzgvMjMg5LiL5Y2I
IDAyOjEzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiAyMy8wOC8yMDI0IDAzOjEx
LCBKYW1teSBIdWFuZyB3cm90ZToNCj4gDQo+ID4NCj4gPj4NCj4gPj4+IEBAIC0wLDAgKzEsODEg
QEANCj4gPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4+PiArLS0tDQo+ID4+PiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9hcm0vYXNwZWVkL2FzcGVlZCx2aWRlby55YW1sIw0KPiA+Pj4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0K
PiA+Pj4gKw0KPiA+Pj4gK3RpdGxlOiBBU1BFRUQgVmlkZW8gRW5naW5lDQo+ID4+DQo+ID4+IEFT
UEVFRCBvciBBc3BlZWQ/DQo+ID4gSSBwcmVmZXIgQVNQRUVELg0KPiANCj4gV2hhdCBpcyB0aGUg
bmFtZSBvZiB0aGUgY29tcGFueT8gSG93IGlzIGl0IGNhbGxlZCBpbiBhbGwgYmluZGluZ3M/IElz
IGl0IGFuDQo+IGFjcm9ueW0/DQpJdCdzIEFTUEVFRCBUZWNobm9sb2d5IEluYy4gWW91IGNhbiBm
aW5kIGJyaWVmIGludHJvZHVjdGlvbiBoZXJlLCBodHRwczovL3d3dy5hc3BlZWR0ZWNoLmNvbS9h
Ym91dF92aXNpb24vLg0KSSBkaWQgY2hlY2sgaXQgaW4gYmluZGluZ3MsIGJ1dCBib3RoIEFTUEVF
RCBhbmQgQXNwZWVkIGNhbiBiZSBmb3VuZC4NCklmIHlvdSBoYXZlIHN1Z2dlc3Rpb24sIHBsZWFz
ZSBsZXQgbWUga25vdy4NCj4gDQo+ID4NCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICttYWludGFpbmVy
czoNCj4gPj4+ICsgIC0gRWRkaWUgSmFtZXMgPGVhamFtZXNAbGludXguaWJtLmNvbT4NCj4gPj4+
ICsgIC0gSmFtbXkgSHVhbmcgPGphbW15X2h1YW5nQGFzcGVlZHRlY2guY29tPg0KPiA+Pj4gKw0K
PiA+Pj4gK2Rlc2NyaXB0aW8NCj4gDQo+IA0KPiAuLi4NClR5cG8uIFdpbGwgYmUgZml4ZWQuDQoN
Cj4gDQo+ID4NCj4gPj4NCj4gPj4+ICsgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLGFz
dDI2MDAtdmlkZW8tZW5naW5lIjsNCj4gPj4NCj4gPj4gRml4IGluZGVudGF0aW9uLCB0aGlzIGlz
IHN1cHBvc2VkIDQgc3BhY2VzLg0KPiA+IE9LDQo+IA0KPiBFdmVyeSBkYW1uIHRpbWUgZnJvbSBB
c3BlZWQuIFBlb3BsZSwgZml4IGl0IGZpbmFsbHkuIElmIHlvdSBrZWVwIHNlbmRpbmcNCj4gY29u
ZmlkZW50aWFsIGRhdGEsIEkgd2lsbCBiZSByZWplY3RpbmcvTkFLaW5nIGFuZCBkZWxldGluZyB5
b3VyIG1lc3NhZ2VzIGFzDQo+IHJlcXVlc3RlZC4NCj4gDQo+IDxmb3JtIGxldHRlcj4NCj4gTWF5
YmUgSSBhbSB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHlvdXIgbWVzc2FnZSwgbWF5YmUgbm90
LiBJIGRvbid0IHdhbnQgdG8NCj4gaGF2ZSBhbnkgbGVnYWwgcXVlc3Rpb25zIHJlZ2FyZGluZyB1
cHN0cmVhbSwgcHVibGljIGNvbGxhYm9yYXRpb24sIHRodXMNCj4gcHJvYmFibHkgSSBzaG91bGQg
anVzdCByZW1vdmUgeW91ciBtZXNzYWdlcy4NCj4gDQo+IFBsZWFzZSB0YWxrIHdpdGggeW91ciBJ
VCB0aGF0IHN1Y2ggZGlzY2xhaW1lcnMgaW4gb3Blbi1zb3VyY2UgYXJlIG5vdCBkZXNpcmVkDQo+
IChhbmQgbWF5YmUgZXZlbiBoYXJtZnVsKS4NCj4gSWYgeW91IGRvIG5vdCB1bmRlcnN0YW5kIHdo
eSwgcGxlYXNlIGFsc28gc2VlOg0KPiBodHRwczovL3d3dy55b3V0dWJlLmNvbS9saXZlL2ZNZUg3
d3FPd1hBP3NpPUdZN2lnZmJkYTZ2bmpYbEomdD04MzUNCj4gDQo+IElmIHlvdSBuZWVkIHRvIGdv
IGFyb3VuZCBjb21wYW55IFNNVFAgc2VydmVyLCB0aGVuIGNvbnNpZGVyIHVzaW5nIGI0DQo+IHdl
Yi1yZWxheTogaHR0cHM6Ly9iNC5kb2NzLmtlcm5lbC5vcmcvZW4vbGF0ZXN0L2NvbnRyaWJ1dG9y
L3NlbmQuaHRtbA0KPiANCj4gUGxlYXNlIGJlIGluZm9ybWVkIHRoYXQgYnkgcmVzcG9uZGluZyB0
byB0aGlzIGVtYWlsIHlvdSBhZ3JlZSB0aGF0IGFsbA0KPiBjb21tdW5pY2F0aW9ucyBmcm9tIHlv
dSBhbmQvb3IgeW91ciBjb21wYW55IGlzIG1hZGUgcHVibGljLiBJbiBvdGhlciB3b3JkcywNCj4g
YWxsIG1lc3NhZ2VzIG9yaWdpbmF0aW5nIGZyb20geW91IGFuZC9vciB5b3VyIGNvbXBhbnkgd2ls
bCBiZSBtYWRlIHB1YmxpYy4NCj4gPGZvcm0gbGV0dGVyPg0KPiANCj4gQmVzdCByZWdhcmRzLA0K
PiBLcnp5c3p0b2YNCg0K
