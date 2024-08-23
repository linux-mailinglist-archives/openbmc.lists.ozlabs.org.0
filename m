Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2575895C2BA
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 03:12:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqhrW2M7hz30TT
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 11:12:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724375550;
	cv=pass; b=JlL8kXhqP8zvePTtzYgoSNF9UpXM0vSuKxcDdtYpvTZEc2kU+NZzSty6J4hVDAOTFsDZd9Q8cUgj6HKAp/iOwnVylC7Hzc+2V9BhRTjRhm4uv8KnG8m4Epbv+3cTSxvg0q7fltS0wIQOJqb/p1bn9unuK4lCJZ6hRARzOPVwlNmF8k//7f/u/v9T9jG2uHS3bWLk/W2EnwdYysUr0H0PARTWd3DrvrXFg+TEHwtWsmRaCf9HYB1aX45mPPCBsT+NFwXuCPwc8fzJQRA0cdvPmhLQwVQ2DA9PIr3Js58/X7pv0D22yyeQ0bEQwdTDcQQQNhf2AmpFfGKG8jKAQuc3AA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724375550; c=relaxed/relaxed;
	bh=oscYSzSvVTJjhz6uIl5+G5B0UtBpcah3kcFSHnvtL+g=;
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
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com; spf=temperror (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqhqz5cz6z2xxx;
	Fri, 23 Aug 2024 11:11:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ow5mvf+FBzFkGgDcyOEz0BDpT0hTgsi6f/THNTbYaPculfEvDh69Vqj3IrTeclUrIGTGbe182pjIuBcqWYA2cy1z/pmxMuLSJO6G8TNad94LuYrQMpuBRQcZ5uB7vC1vjeHPTmbbfHRdhrfn7oa8LUsrA7PbWFNRzxsZB3e1ZuJWKxYe6qRCHrL/IB5AVStuxei/Mt4XcfKZsM+OXCMRFvzSIOrZRIHbj5NLnmgPYNFhUx3yO18nSFlQhtx8u7mJUdi7ILWvhvttNlEIkWs9bPs/TOMeqIWWunocMpb5nWCGMf3D5WGOnR8j9wE66Z2/IVoCKgrtXqa6hJeavp7sDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oscYSzSvVTJjhz6uIl5+G5B0UtBpcah3kcFSHnvtL+g=;
 b=Amnck3jv3sTGSzpO/7u7g1Zh7xGVKwdqCGmzdb1qZYfXUTc3vzw54Tu6mXSajYsqTaQFK4lprol4Z/HDx1P8XovkD7hPUcYhUlHeKli611zEtRe1Wv0IeONTlAIejx7KAZMp/UGK9KTUS3mLq34+gRFREVO8lkrDj2MFeeznrQnhr1IG628z5L+xYXKjBZfV3ojzVvKwMMEHAEpLZ138EmSOZH68b/Ayr6KHSWORh9PBS1hGPCoDPJEIvxNSRZs9n7+oIyiM/mbMGSS5nzSeUAnB+PLc0bQgr+6VD5cXSZ6WIf93YWA0VFm8WyxFwcE5NBtcFuFZgM2jT2pMNlFn0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oscYSzSvVTJjhz6uIl5+G5B0UtBpcah3kcFSHnvtL+g=;
 b=A30MnmDKEToaPXKl9T+l34MFXZs3HReKrjG63oe+gzlyFnVzMmy+sEfoJV09VteC+1f2MOX6gwCNOes16cOq/UQtm8O4k2HwFSoSTtJxMV1Uj113E4RSJFlXCALFtUKtG5G3nhkhGZpmQLvCw+Tyc1lDhEhTN001v+mRKgj4BSkpZuaNReFRA2F5tV6+CN4Nm+NI08qIfpLqy5CJZ8s7nFNcYh2ETcJRTO1tTc/s889UErfIOBN9sEXhGqt5Wy1O/HY3hLZuBF+RpDqA128OtxBgWElenGQu6S3wWk6lnzZBzhoBBxrLLy0PahnBunxvsNNDL/TokpeVEr6MJynUOQ==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by PUZPR06MB5652.apcprd06.prod.outlook.com (2603:1096:301:fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:11:27 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%4]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 01:11:26 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add aspeed,video binding
Thread-Topic: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add aspeed,video
 binding
Thread-Index: AQHa8hE3AXMd5LvxBkaIX1mCaxtGp7I0DHIg
Date: Fri, 23 Aug 2024 01:11:26 +0000
Message-ID:  <TYZPR06MB6568AB9E260263DBB1ED474DF1882@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
 <20240819080859.1304671-2-jammy_huang@aspeedtech.com>
 <nnjcjt2kuplsy5bbxujuubkn2xdtpifjeiqt5qfvktdmaorzuz@x444p5ezcoch>
In-Reply-To: <nnjcjt2kuplsy5bbxujuubkn2xdtpifjeiqt5qfvktdmaorzuz@x444p5ezcoch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|PUZPR06MB5652:EE_
x-ms-office365-filtering-correlation-id: b4f3553d-fad2-497c-3742-08dcc3108319
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?Zm5FV09PVEY0TEJyZ1Yxd1haUkhRa0ZBY1lQNElrNUFqN1ZHUGNWZTlzbWtRTnhV?=
 =?big5?B?ME9LMlgrSytrYVhsSEU4Vy9GR01wd3BaNkl4NGhOb0V6bkszODlJZTJVdlB1aytS?=
 =?big5?B?bXJhMFcxak4weDVrNk1mNWhld0RiZWxSQkVUcU9aQ2xzc0RiQ2RHK2ZWbSsvOGlB?=
 =?big5?B?cTVmeHdtR1F2V3FZeEZ4aGpiNUpNQjZCZkdRMXFXV0Q2bE1PSUZTYWY2U2FlN09q?=
 =?big5?B?ZzJ6SUNyWTUxNnBXL3gzY2NEN21ZaFlieW9pY1RSb2o0NlU4NzUzYmFOaU9lZ1FD?=
 =?big5?B?a3VId0ZqSThuQktsZktzUG9lMVh4Qlg3Uy9BaDJGMWtHMkFubUtKWk14bUEyK0tB?=
 =?big5?B?NDZzTmlnVlY2ckVQVVpFL283UTZXZDlVd3BaVjIrd0QxK3Y5QjlUNjlKVEViWm1O?=
 =?big5?B?YU81czNDUGVUdGsybTc1d3dUL05WeUgzcGZYQ0VPZ3VieGs4MFdqdnBVZ2F2TEJn?=
 =?big5?B?VUlpS3kwTzdZeFJTZ3oxTTUzcytnNjdpU2c0RFVxa0tlSXE0OGRySmRabnIxKzIy?=
 =?big5?B?RlFVREVUM0l2Y0RIdXIrVHd2bGU5VDBXTWZPQ2o2c1UySGZvZ3doR2RKRmxuUml4?=
 =?big5?B?bC9SSzNxUlRoREw3L3VKN252OGF5aS9RaWhNVkxtamp4M0JZSlI0TEtCaDFrWWlw?=
 =?big5?B?c20zZmdPR2MxcFV3b3pWWXNkcU12bVFjSmFnRVZDZmcwNWVDS0Y5QnBoY21sWUs1?=
 =?big5?B?ZTJQYnJRS29oLys3T2kvSW9qNFI5dnRPU1VNbWgyUy9kV2FBZzdnZEpFQXNodFR1?=
 =?big5?B?UDduN24wcmJtcTJjOGJNM1lxeHRqNWpqMHpOajUwZUFlMmV2dFBidXFyZHZmWFlt?=
 =?big5?B?KzZyVUtQMkZPVkpXaTRPVHNZa0ZseXlJK2NqNlpmTy9sZ0NnUUR6ZE9Xb20vdld5?=
 =?big5?B?VC9pVTRNUStsU1NkcWVaT2VpQ3g2eG9xY29yZUpRREpzaytUZVFrSFFVZ0g4b3Qv?=
 =?big5?B?M0U4ZVMwYld5ekZOYjNReStBVnZnUXhIeDhGeThRODNDR3ZQUWpUMDVmcjZHcy9r?=
 =?big5?B?TjFqbWZaVXMxTjhsZlBkRDRlT1NNNExBSWJuVm05elhtcnhvdnlGYUdIZTJzNER6?=
 =?big5?B?Q3picVhXRGdDaDZ5Zkk4L1FMVTRpS3JBNWdscy9BaVJocFRkMlVQV2NwcVFjSUJt?=
 =?big5?B?QWhFYUgzSGQ3Z05yV3pFYklVbkxZMjlHMkxkZ0k3QUh1UGdiTlgyUFFLcll6WDlF?=
 =?big5?B?NGVYT1JGclpKeStFcFJyVUtDaDE4VnJLRWJNUjI2dndWcUtnaStvYmNGbHJSNFhJ?=
 =?big5?B?WnBVWVN1cW1iZEtPYVFvR1I1NUtsb3JjTnBKWlpZcmpSYjYvamRCU3U3Z1MrM3oy?=
 =?big5?B?U2YvRFM4MmNUM0EyYjYwMFJkam84aXpvK1AwQXdTQXRZR2tqUG5ISTZ6eGRqSEJE?=
 =?big5?B?Rm5DRllJUkErOWpzL0h3NkpZa0lSN0RXVG53Um5JU25tbGVJQ1QySmExck9sbThq?=
 =?big5?B?bjFQNlFCemJUVi93Q214cUpwL2QwOStZeExBQnFRSnEyNVp1OE5DYlVRRkowQTJi?=
 =?big5?B?QURnR1JzdGdoNXpvSndRSjc1dHk5MWZ0Vklia2FJRzg3UXZCZVpyc2RobERYVWQ0?=
 =?big5?B?SzNYSDBmb1JobnRlckVZSmJla0R4UnJqNkdsNzV1c2tPZHcxUmFBaUlBVUlVRTM1?=
 =?big5?B?VjRTeGpkZzZXK1lqMEFsOHpYMmRMMUxJc3lOYVo1Wmh4VTVQdUc2b1hNVE5yeXpt?=
 =?big5?B?czkvWTlSM01pcE9jc0RmcU9JTjJWdz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?SFFrRjZBT3hEaXo0dTNEcGZjV3prNjcwa3J1Tm4rNnBNM3BjRnAzMzhRQXJwOFpt?=
 =?big5?B?TkxsQk5RZlIvZ2c0ZS91TXErSU9SbXJYSUV2YnFXYUtvLzE0dThCeUg4RWplV0JS?=
 =?big5?B?SjVHK1liTlJLaGIvcEg1REo3TDdncCtjNy9hMUZXT3MxQzZTaXNTR3I0T09pdEM2?=
 =?big5?B?b3k4dk9YMG4vL1JURGY5VUZRR2kwOVRYQk9zVkE5K2tjdE1aeDdxc2pjYjRrRm1V?=
 =?big5?B?Q3dTdU5qalZtOHU5UHA5d1NaMUc1WXBCUzRERis2S1k2NmFtcXFFc28vYlF6M25p?=
 =?big5?B?SDE5eEU5VzlkczF2c3JYTlV4VS9uMjUwSk9hUlFKbXdIblVaN1hqcGhPa2F2YVdU?=
 =?big5?B?T1NUWUxxc25mRlB3NFNVZC9LbUVxMjNIQmoxMW5TOEdMMysxRERBWW5yZnp5UGhr?=
 =?big5?B?M01ucWpmcG1LVFFLL3QwTzZuTjdoR2pTa0RqOHBYa05naFpsWlFqQWdZYzlPcEZF?=
 =?big5?B?VnowdWUzL0FnZndCaTF5WHdoNVlpandaZmJicmVDdGc5akpBeVJXTnQ4cUZlQ2lv?=
 =?big5?B?bnRLajRoT3liOHhZUEtuc3dmVXpQTHRGbEtYQUtJYUxWTllRWG80d2NsajRNV1lT?=
 =?big5?B?dzh6TVkzNXQzREgxMitSLzlJcTdqSXIxUlN6ODhUM3g1WS9MN0E1UTZlOWdLc0Fl?=
 =?big5?B?RXgrejNnOWtvR0ZBZ0NFL0kxdmVLQkFPVVltSHM0dlU0WlR3Y2wxOFJYazQ5bUxH?=
 =?big5?B?b0NqcUVBOExUdFRpc3Z3U29kWFcveWdQVFp1RWUySElZdDVNVlRzZnBzVlM4MHBZ?=
 =?big5?B?eWlBU1V2Y2drYWNMZnRLbUZqVDdqREJvdCtTNHZseCtjc1hiWDJXQWlDUjJPZmhn?=
 =?big5?B?WGZYWExtc0doeC9SRXJrWDNJNEpKMmZuajNkdmY3MmRROHBNVWIySDdqcXFLajBa?=
 =?big5?B?WEx3R0NYaTJwSTE3WXV5MXRlZXlkbnhPeExsLy8rWExNU2cvdEVGRm4vTUlWRWF3?=
 =?big5?B?RXZyRm80cENKNE16WmJ2RHJpOUlpeDZjZmpIcXU0cUZ4MXdVQlBjdzcwWVVkYWRp?=
 =?big5?B?ZmlkZyt3My9RTkFOTmdId3lUdEkrUi9xV0djT3RUZTV4UDRBWVNYUURnS24yL0Jk?=
 =?big5?B?VHFGaHFOYnEyeEFLT1Bnb3hySkxJMFBOem9wSlFJc3FsdzVuREw4enROSDBnNXRk?=
 =?big5?B?TzFvclVXdHlodmRWeXRYL1FzSlVPRkRYWWVWaWIwVlZPZEpZUlBhZkRneWFobHVr?=
 =?big5?B?SW1iWTdVKytKeHBBNS9NSnVKNlAzMFZEQWZyWU9vODcyN3psOHBhODVKcitNTzB1?=
 =?big5?B?b0lwV3NBYjNtRkVMYmxTZ1Z2R0dxODlHT1hNZDhXbnhqSGxISHZQeXN0ZzlncGpj?=
 =?big5?B?OFdJRUVvazNPVEpmWVNESHRwd1o2RUE4QlJReXpvaGIwU3QyUnZWUWtqeTM1dEZx?=
 =?big5?B?RFRQWFBYc2dvTGRZV05ydlovcGkwRytoQnZhRjN3T3IyNTlQZGJ4WHUwQTVMakR0?=
 =?big5?B?dEFjNGhIZk9QUzIvNkJkNy9yR2Q0Q3lhNndrR29SenI0T1Q5emR4dUJpM3o3SmtT?=
 =?big5?B?UlRaS1k0Wnl2SDE1UUtSZmh0RVY3a3JxNXgvZFMvalByYTh4SzhpOGl6VGJiQWNv?=
 =?big5?B?Y2pLcmRULzl4RnZSYlZoY1g0bUl4OWU3VTM0TDkyZmkxclJCRjZKdEcyM2NEbyta?=
 =?big5?B?UUN1enZ6K0I2dVRRYWpNVFgvUnpzbjBFc2R2dVhpZnEwWDc0MXczcW11SmwvVzRM?=
 =?big5?B?TFJFOU1FZzNwamJyY0tiYm1YVDVmcXJITUg2NmF4V3NxeUJnR0lzR3U3RElGQ3JO?=
 =?big5?B?a2FHUUFUa1BxOWc4S1REOFhHU0l4NEhYd1gxOWhhN0Rsc2IzL0NJekVqOUMzMTgv?=
 =?big5?B?WXdIZTMzcGVhc3A4Y1lkRi94am1wM3hIcElrdzBlZ0tLOW1qaEF5bll3cHNiaWtt?=
 =?big5?B?a01vTHRBSUdQeHM2UUxDOU9MV201Ty9nbEdsZTlGdVNrWUY2cDhXTGZSeTJrSlFC?=
 =?big5?B?WkRUeStVQTBxN0ZsOVAvZm96REl3V1c3dGpISzZ5anhQditLT3JjZURYRDFTYlli?=
 =?big5?B?dU5OeEVjZzdGL0laSkRVaHkyUGZBQWRRUlh4QkpGWkZXVi9TWWc9PQ==?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f3553d-fad2-497c-3742-08dcc3108319
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 01:11:26.6021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PkpVO3IbHagXe4aRIyC2z/S7ioAW6yO68yPdp/kMTkyBw4szuiSnmB2MDon05L2fI7JIfYAQJo/lfggzmLhLu2Jrx3+HuhptBvSVX52vskM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5652
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

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgaGVscC4NCg0KT24gMjAyNC84LzE5IKRV
pMggMDQ6MjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+DQo+IE9uIE1vbiwgQXVnIDE5
LCAyMDI0IGF0IDA0OjA4OjU4UE0gKzA4MDAsIEphbW15IEh1YW5nIHdyb3RlOg0KPiA+IFRoZSBW
aWRlbyBFbmdpbmUgYmxvY2sgaW4gQVNQRUVEIFNpbGljb24gU29DcyBpcyByZXNwb25zaWJsZSBm
b3IgdmlkZW8NCj4gPiBjb21wcmVzc2lvbnMgd2l0aCBhIHdpZGUgcmFuZ2Ugb2YgdmlkZW8gcXVh
bGl0eSBhbmQgY29tcHJlc3Npb24gcmF0aW8NCj4gPiBvcHRpb25zLiBJdCBjYW4gY2FwdHVyZSBh
bmQgY29tcHJlc3MgdmlkZW8gZGF0YSBmcm9tIGRpZ2l0YWwgb3IgYW5hbG9nDQo+ID4gc291cmNl
cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbW15IEh1YW5nIDxqYW1teV9odWFuZ0Bhc3Bl
ZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVk
LHZpZGVvLnlhbWwgICAgIHwgODENCj4gKysrKysrKysrKysrKysrKysrKw0KPg0KPiBXaHkgYXJl
IHlvdSBhZGRpbmcgZHVwbGljYXRlZCBiaW5kaW5nPyBQbGVhc2UgcmVhZCB0aGUgZmlyc3QgY29t
bWVudHMgLSB5b3UNCj4gbmVlZCB0byBmaXJzdCBjb252ZXJ0IFRYVCB0byBEVCBzY2hlbWEuIFRo
ZW4geW91IGFkZCBuZXcgcHJvcGVydGllcyBpbiBhIG5ldw0KPiBwYXRjaC4NClNvcnJ5LCBJIGRp
ZG4ndCBub3RpY2UgdGhlcmUgaXMgYWxyZWFkeSBhIFRYVCBpbiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEuDQoNCj4NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDgxIGluc2Vy
dGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLHZpZGVvLnlhbWwNCj4gPg0KPiA+IGRp
ZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNw
ZWVkL2FzcGVlZCx2aWRlby55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2FzcGVlZC9hc3BlZWQsdmlkZW8ueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5iZWY3YmQyZjMxMGENCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3Bl
ZWQvYXNwZWVkLHZpZGVvLnlhbWwNCj4NCj4gRmlsZW5hbWUgbWF0Y2hpbmcgY29tcGF0aWJsZS4N
Ck9LLCByZW5hbWUgdG8gJ2FzcGVlZCwgdmlkZW8tZW5naW5lLnlhbWwnIGluIG5leHQgcGF0Y2gu
DQoNCj4NCj4gPiBAQCAtMCwwICsxLDgxIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvYXJtL2FzcGVlZC9hc3BlZWQs
dmlkZW8ueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogQVNQRUVEIFZpZGVvIEVuZ2luZQ0K
Pg0KPiBBU1BFRUQgb3IgQXNwZWVkPw0KSSBwcmVmZXIgQVNQRUVELg0KDQo+DQo+ID4gKw0KPiA+
ICttYWludGFpbmVyczoNCj4gPiArICAtIEVkZGllIEphbWVzIDxlYWphbWVzQGxpbnV4LmlibS5j
b20+DQo+ID4gKyAgLSBKYW1teSBIdWFuZyA8amFtbXlfaHVhbmdAYXNwZWVkdGVjaC5jb20+DQo+
ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPg0KPiBEcm9wIHwNCk9LDQoNCj4NCj4gPiArICBU
aGUgQVNQRUVEIHZpZGVvIGVuZ2luZSBjYW4gYmUgY29uZmlndXJlZCB0byBjYXB0dXJlIGFuZCBj
b21wcmVzcw0KPiA+ICsgdmlkZW8gIGRhdGEgZnJvbSBkaWdpdGFsIG9yIGFuYWxvZyBzb3VyY2Vz
Lg0KPiA+ICsNCj4gPiArc2VsZWN0Og0KPiA+ICsgIHByb3BlcnRpZXM6DQo+ID4gKyAgICBjb21w
YXRpYmxlOg0KPiA+ICsgICAgICBwYXR0ZXJuOiAiXmFzcGVlZCxhc3RbMC05XSstdmlkZW8tZW5n
aW5lJCINCj4gPiArICByZXF1aXJlZDoNCj4gPiArICAgIC0gY29tcGF0aWJsZQ0KPg0KPiBEcm9w
IGVudGlyZSBzZWxlY3QuIE5vIGNsdWUgd2hhdCBpcyB0aGlzLg0KT0sNCg0KPg0KPiA+ICsNCj4g
PiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgb25lT2Y6DQo+ID4g
KyAgICAgIC0gZGVzY3JpcHRpb246IFByZWZlcnJlZCBuYW1pbmcgc3R5bGUgZm9yIGNvbXBhdGli
bGVzIG9mIHZpZGVvDQo+IGNvbXBvbmVudHMNCj4gPiArICAgICAgICBwYXR0ZXJuOiAiXmFzcGVl
ZCxhc3RbMC05XSstdmlkZW8tZW5naW5lJCINCj4NCj4gPz8/DQo+DQo+IE5vLCBkcm9wLg0KT0sN
Cg0KPg0KPiA+ICsNCj4gPiArICAgICAgLSBlbnVtOg0KPiA+ICsgICAgICAgICAgLSBhc3BlZWQs
YXN0MjQwMC12aWRlby1lbmdpbmUNCj4gPiArICAgICAgICAgIC0gYXNwZWVkLGFzdDI1MDAtdmlk
ZW8tZW5naW5lDQo+ID4gKyAgICAgICAgICAtIGFzcGVlZCxhc3QyNjAwLXZpZGVvLWVuZ2luZQ0K
PiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPg0KPiBObywgbWF4SXRl
bXMuDQpPSw0KDQo+DQo+ID4gKw0KPiA+ICsgIGNsb2NrczoNCj4gPiArICAgIG1pbkl0ZW1zOiAy
DQo+DQo+IE5vLiBtYXhJdGVtcy4NCk9LDQoNCj4NCj4gPiArDQo+ID4gKyAgY2xvY2stbmFtZXM6
DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogdmNsaw0KPiA+ICsgICAgICAt
IGNvbnN0OiBlY2xrDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtaW5JdGVt
czogMQ0KPg0KPiBtYXhJdGVtcw0KT0sNCg0KPg0KPiA+ICsNCj4gPiArICBhc3BlZWQsc2N1Og0K
PiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0K
PiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgU3BlY2lmaWVzIHRoZSBzY3Ugbm9k
ZSB0aGF0IGlzIG5lZWRlZCBpZiB2aWRlbyB3YW50cyB0byBjYXB0dXJlDQo+ID4gKyAgICAgIGZy
b20gc291cmNlcyBvdGhlciB0aGFuIEhvc3QgVkdBLg0KPiA+ICsNCj4gPiArICBhc3BlZWQsZ2Z4
Og0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRs
ZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgU3BlY2lmaWVzIHRoZSBTb2Mg
RGlzcGxheShnZngpIG5vZGUgdGhhdCBuZWVkcyB0byBiZSBxdWVyaWVkIHRvIGdldA0KPiA+ICsg
ICAgICByZWxhdGVkIGluZm9ybWF0aW9uIGlmIHZpZGVvIHdhbnRzIHRvIHVzZSBnZnggYXMgY2Fw
dHVyZSBzb3VyY2UuDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUN
Cj4gPiArICAtIHJlZw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSBjbG9jay1uYW1lcw0KPiA+
ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUN
Cj4NCj4gTkFLLCB0aGlzIGNhbm5vdCBiZSB0cnVlLiBXaGVyZSBkbyB5b3Ugc2VlIGFueSBkZXZp
Y2UgYmluZGluZyBoYXZpbmcgaXQgdHJ1ZT8NCk9LDQoNCj4NCj4NCj4gPiArDQo+ID4gK2V4YW1w
bGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgdmlkZW86IHZpZGVvQDFlNzAwMDAwIHsNCj4NCj4g
RHJvcCB1bnVzZWQgbGFiZWwNCk9LDQoNCj4NCj4gPiArICAgICAgICAgICBjb21wYXRpYmxlID0g
ImFzcGVlZCxhc3QyNjAwLXZpZGVvLWVuZ2luZSI7DQo+DQo+IEZpeCBpbmRlbnRhdGlvbiwgdGhp
cyBpcyBzdXBwb3NlZCA0IHNwYWNlcy4NCk9LDQoqKioqKioqKioqKioqIEVtYWlsIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNCqdLs2TBbqn6Og0KpburSKXzKKnO
qOSq/qXzKaVpr+ClXad0vvexS7jqsFShQajDqPyqa6vfq0/FQKFDpnAgpXi63atEq/ypd6Snpqyl
86rMoUG90KVIuXGkbLZspfOzcaq+pbu5caRstmyl86SntW+wZarMLCCow73Qpd+nWadSsKOlu7lx
pGy2bKXzpM6o5Kr+pfOpTb5Qt7Sp0qazvcamTKXzoUPBwsHCsXqquqZYp0AhDQoNCkRJU0NMQUlN
RVI6DQpUaGlzIG1lc3NhZ2UgKGFuZCBhbnkgYXR0YWNobWVudHMpIG1heSBjb250YWluIGxlZ2Fs
bHkgcHJpdmlsZWdlZCBhbmQvb3Igb3RoZXIgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uLiBJZiB5
b3UgaGF2ZSByZWNlaXZlZCBpdCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5
IHJlcGx5IGUtbWFpbCBhbmQgaW1tZWRpYXRlbHkgZGVsZXRlIHRoZSBlLW1haWwgYW5kIGFueSBh
dHRhY2htZW50cyB3aXRob3V0IGNvcHlpbmcgb3IgZGlzY2xvc2luZyB0aGUgY29udGVudHMuIFRo
YW5rIHlvdS4NCg==
