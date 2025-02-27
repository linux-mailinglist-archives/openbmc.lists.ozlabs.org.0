Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF1BA47794
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2025 09:19:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3PQY2fV1z3cb0
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2025 19:19:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200f::706" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740644384;
	cv=pass; b=VkMFNrlH0RRShNOAFRnOtIl5CBmytiCaHth7ixsQ99yisymS9d7zYPNPiBtaVioG9YOuM/Qd2gDA97jLMt7ZIbxWGGhxAGli09Ujq3ulxKFlz7wgEeR2mRgkJIorxsmpmBUglGPTnVE6VBtRzlHiHXnK5+OCaxQTcBrSbxg1KCVUwftyqbibtwHH26vqt1bLOMPAWks8mJNxpP6mWzHtTHF6hXWxGJP27uTR7E14tAwi50c542MzJdjTKLJENIQOOcT/LEG8im5ea2WouPDUzSPXtS/V3rnmrvhmcbj/2OxVSjD5kwAa63PkJIzn/ITkj6kh4jHbs5r2bTLZt/VAQg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740644384; c=relaxed/relaxed;
	bh=R6KB9yhhsn1eLxt9GclavNw0gmjb7GfjAzj/eUv2ASo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jhSu2WrAJmwwqK5acxyFCxgWZUI/6U5NdVnWgC02L0ZrsKcLPLD1PjbqVaoIZ5RkDWQECtbdmWogS8MW7te2vBfhbo/IdX1ZS2xUUtSQPrTfoYKMKBX9JfOiFFH4IX+wIGgEFLGNoGhXDgp7diaolbYsEZvRSCZak1Qlkrlh3HhoSbXPyJCnpH2LS7aJ5i5S5V5r3RAhGcDS5UOziGk3taQOSLmQkfb1hR3Kd8/gBNJ5r5zi9xrsneWJ6HP/x6Bz7K/T6AB5HIEZfWOQQdhlLk4zo0ft3QYrE9QbD3H6AJifUaoXByyva/c1HhDlqNZeFSeC3lRFzyoDffdZbM9coA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=pS7TBPGM; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200f::706; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=pS7TBPGM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:200f::706; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on20706.outbound.protection.outlook.com [IPv6:2a01:111:f403:200f::706])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3PQR4Zvgz30NF;
	Thu, 27 Feb 2025 19:19:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLP73wu7Gd1Gg8Wmw0kju56TMdXWZfC7gxn9O/nVsQeafs/l/F4dG8dHwBmpxL41qaJBx7ZCL4cyBACONdUb27CZiUzXQChCvdmYItuafIZQb4V1KX1LcofJP2bIwtYp633Albp1pRLHJqVAtvK6Gg1AFGk1fDfFCooFAoRRrCyjhLsEd4H6pZNSQmtXa5EErKwD4OA61veZKHMcNDJPRvesS9jZ4turJCmWOPDvOBDPzQcBFbKqEbreD/NReT4LhVfStK4hWi2yXyLDahC5uF4CYEAFGwiV83A50ljC5UiM1Ir834ih4ET1/cq4DenUbSI69+pfx6DYOXLdV/7d3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6KB9yhhsn1eLxt9GclavNw0gmjb7GfjAzj/eUv2ASo=;
 b=hAr19PhJurZNFWqYqDLeOoJbiC2uRCanb/pEXkW14hC+7pG7JHez751xWNtQnZUHhMoAclRazcM4RCh9Q815G2z8A1X5GKBXDyDO6fdgz9FOdoZmUJJcduFWPgCIvv1PcMszk57J1lbaWDRd9tCxjIli9JpFmjzRsSW+ttn66EMqtczjnGk2xOtdULsSr26DKFbvYIug36cwzx4OGf/mft5Om0ci3B1G+yEArUj39d42mG6DPRD+0eZG1RgQex5pFZFlfX4KMk152tInsbmlCSXvG1f6JAuhkzn8mv3mryFZ5dVzPm6hXgtKUm1Uvhu2s/535odGvqonv6DWQYzE1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6KB9yhhsn1eLxt9GclavNw0gmjb7GfjAzj/eUv2ASo=;
 b=pS7TBPGM0df8qDB78zw3ftaUXV7hTRzmEbbltQVVqp+xPs29PxaZHQT0D3stdfJrvTsUBqSSOBMqw/24F4Y6+sEmDdTyGvqjhdnCeuhQ2PRurxevrEZoHCPjQLwJ4iALWK2+Ix9zgazriAjgYa8mrPEz97Htj6fTX0ddyytr8XGyACUSNfTmM7rx5AWUGDWcM7P8TUiv7ARBYDOAzKmwfVVvMNoiTLrM4aSRb2A2zvC5t/uj4sWw0KtPQ19xsm/XsDUv/4d1SlAi9/bg2k9jcccXtrwME9drlmlRIJziM2abwd2UQ/bKdn8pElGby1HxEm9u2FcdzqnLJmuIFKJKgQ==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SEYPR06MB5158.apcprd06.prod.outlook.com (2603:1096:101:5a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 08:19:20 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%7]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 08:19:20 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHbhoFMYr1F1iCu706pUdZbmBz0BrNWKwmAgAMnDQCAAApCgIABc/fg
Date: Thu, 27 Feb 2025 08:19:20 +0000
Message-ID:  <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
 <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
 <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
In-Reply-To: <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SEYPR06MB5158:EE_
x-ms-office365-filtering-correlation-id: c9a090ed-778b-4165-a11d-08dd57076f72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?UEJhOUtBUWlhdmxwdGkvUDFCMGx5SVlHNVZmcEVKNEsvajlsN1psaG9EQ1BQ?=
 =?utf-8?B?R0lqTWZtaU8rVHhXblMvQTFWVUJ5QSs0ZDBxaHFTRE44Z05GNmRtYU5NbmpX?=
 =?utf-8?B?NTBtQ0IyeFpOK2JxT2ZqT1pNcGxXV1VwOGppK3MwaGpWQWhKYUR6aGxha1F5?=
 =?utf-8?B?T09MSWFCbWtkbjNCbFMyS2ZzNEJFVzBCYzVmalhXMGQ1UGtyU3N0SmFSMzlT?=
 =?utf-8?B?TjdJMGpTV0YzY0hMWGhlNzdyR05HYlJ2UkF0MHZWbEp3TEMyM1RzWHZOZFA1?=
 =?utf-8?B?T2hUbmJaRHBRa1ZVcXVGNkpTSDZGbGU1MDhTRStySElDdmpjbnA0M2MyOVFk?=
 =?utf-8?B?dVpHeVJSQkJzSjMwcHZ2VDBza0F6R0hQUkJvN3ZMbnBHdFZPeDM2Y0kvQU10?=
 =?utf-8?B?d0hwREs5czZ2cWs0ZFcrcEdLSndNdUhkUCtYNWZYS3c4cFdneDlocWtzSTFK?=
 =?utf-8?B?aWo0U2FYKzYxYk1zdXVwK252bjdFRTNwVlZvS1dkd2hpWWFwV1BnYXNKcitq?=
 =?utf-8?B?QUwxYTVSLzhocjlqVWs1NmFzYUV0aStWNmJSRG04SkNid3N5QmxoY1RLS3F2?=
 =?utf-8?B?UDB3aFVHQ1lqV3hkY2NXTWNHQUh2RUtNZU5QV2VqbGJoalNmYm44RDFOanU0?=
 =?utf-8?B?ZTNscFJqVk1uSU1OY0JpS0s1VXpEUG9tcjFGZG1DRy9mTmNrMzFQTm15bmY1?=
 =?utf-8?B?ck42TGZyYWkvODh0cUN0WGN1d2ZpdWhpMkpJSWRvK2JpWVNadWZhclpLNHFP?=
 =?utf-8?B?dkVqRHlGb0U1M2cvZTM0bEtYaFcyc2JxcFpzblArYk1ULzZpSDI2cG5MdW1j?=
 =?utf-8?B?N1F3bkFxMEJjU09zOE94aTdDS2ZWY2dYVEJGWmlGRmJMdUdZeUNPWVlJQU5K?=
 =?utf-8?B?VjBUQW53eXQxSEhjYXRjTVJRNmZkSUxlMndHQ0s1amhqSmhXaWhUWEdsekdx?=
 =?utf-8?B?MWh1QlNNS0tLRm94UGI2ckZuRi9oNnZlYmRGSjRlaDVzMU1KUnh0cmFUdGxZ?=
 =?utf-8?B?L3ZJaDVjakt4VG9wWUJZMXFzYnJXaVZlMUF5TjBLWDFPTEJQay9VVVB1YmlK?=
 =?utf-8?B?TUh0eE9EZUlYZkUxcXJDdVRuYy9JRFJ5ZjdOeGhEQWpnTDlsUmUxZUtUVVpr?=
 =?utf-8?B?RHQveEQwTklCRWlNUGJBbFV2eXRMeDNFZ1JjLzVkTlY5bWVvQVlocm1VcTFv?=
 =?utf-8?B?R1VOVDJwRTA4ZGNSbnZqbmgyT1dIQ1FkRFhrd2tIZDBOa3NsVmxiRUNtdC9q?=
 =?utf-8?B?cVNPZGJZb2NodUZWUlI3ak5MNG1qQWc3NFg4VFBpQXVTS0xZMTJBeEhSL2RY?=
 =?utf-8?B?MkFDbTZDOGtVL0lyR214UlkvTjM0Ym1aMlB2MEVSdEt0N1VGSVh6WGRDT2JU?=
 =?utf-8?B?bUJaSlJBR1hBMzBsMndEMllrS1ZOVGxBd1NZSS9heFVnWVMyTUFyeVlIaENh?=
 =?utf-8?B?WDA4VFZtblBRUW5XcnJVUmhEbnhFeGpKL1RMVXN0bVVncGlPaTNRNDVCWWZF?=
 =?utf-8?B?czJ3WTJ1ZGNTVFBqQkQ3MXdvZmNmb0hzaFdIcDJiSUtmTWt6aExaREh5USs5?=
 =?utf-8?B?QU9mUnRWV1NoOUlucUZEUEZIejRlNXJqMjlHUXhzeTI5K1pFQS9QbytORity?=
 =?utf-8?B?c2ZQMlMzeUNnUVg4eHEzTWVJbnBybllFWTQydG5ndUI3U3ZtNTRQZ0VFaUNM?=
 =?utf-8?B?dGp0MHhBR3ZWMlZvOVVxWUNEVWZTVURBandzanBkcTlXUmlSRzliVmMvTlAw?=
 =?utf-8?B?cnpmaVpCdnc0S2JOcHY0NFpsYS8xUm9vV3JFaTJWclVONDUwY2RWbnc3dXN4?=
 =?utf-8?B?Y093RkE1V3RqWFdxSTIyUWpiMjVJcldpY1g5Nk9ZMUVDNEM1SXh4eCtTL2ZZ?=
 =?utf-8?B?VTRDM2l3R3BhVkh4QTdCZ2loYmdtSzZRYkpoTG1UWE1aK0E9PQ==?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WVZEbFppNnQxKy94S05URWZCU0F1RStJL2Nqc21kZ1lLeU4xclA4S0x1ZUhS?=
 =?utf-8?B?blh4WmRKYi96QkVKdk05UEhuQ0pTVlZ3QUdha3FzZWtmc0puRkRSUCt3REtE?=
 =?utf-8?B?NWNmNHY3a1NaVzVQZ2hwblpSOXd6K2doOHhmbDlHeDBIR2hQTjBxd2hsNCtW?=
 =?utf-8?B?bGVqdFhRalRnVDVhREJTOUxQR0h2YmY5a1hQQVU2d1dmRVRZWVB6dUsza3JM?=
 =?utf-8?B?aDFQZE9QMENHdU5WNWxjMXd4OUVuYytDempEdmtsY0lEK3REMjdibG9OZmFl?=
 =?utf-8?B?NXdCMWd6Y2xtZDRPVnpMcTVuMXNwVk9GcWF4VlgwQXgzNm1vSHJkY2JTdkFS?=
 =?utf-8?B?M1liZmVnTU9lY0JFUDdtN1NoRlRubGJlOXhyMVoxTFJwS2k0dTg2ZkxzT3R0?=
 =?utf-8?B?QldheXZhVmZOT3prdG8xTFRKNGtPVDBoNVovMnRWMUxoMzU5MU9MRkt1aFdG?=
 =?utf-8?B?emdmMFQrRnRyTGxWWDBTUVcrakwzWmRqRHNKb0Z4TjhYT3kwbG5SeHI0amIr?=
 =?utf-8?B?dE9RNDUwT3NJcVhERTErM2VlQVZMSWF5SXVtcHkrQ0xUZlMvM1ZONUhScnF5?=
 =?utf-8?B?S3hqeTVFNlRGeHg1N1RlUWJmcUlrcFlFR0R0MGhxUktsRWx6aSswZjg4aVRK?=
 =?utf-8?B?eVBhS2ZNV2tYelFtTDVEZlB4NklDUjNOUGNOekZXaW9pc1ZuTlE2TENVMktI?=
 =?utf-8?B?dFVSK0ZEZExkdnlkUGtXaGpENjBiTFd2VXE4aXVwakt3NzZIOG1tMUFlSFNs?=
 =?utf-8?B?QnZ2ZUdWcTlaL1d4b010dkd1VXZMUE5QYVVjYVNSS09meldYUS80TTJsVHlC?=
 =?utf-8?B?UkV6cEdJOFBSc0ZDMkpKejZhdC9FdHMxekcrZXVNc0hiNElETkNpOTZobTlE?=
 =?utf-8?B?RWpsUE9FeUJHWndwMWpoVWV2VUZ0R1Jvd0VqTTV3UzluS2ROa3BOb05WL3I3?=
 =?utf-8?B?UDNoYlhRTmI5cHlBUC9IZXBVSjh5Vm96WGZIZENpWjdsQXg2U1pkU3Y5T3Nk?=
 =?utf-8?B?UEVpT3ZWeWdGS0NIQTZCOG5qV2JGcWF1QlJiZTlicFhtTDcwOXlOenErSzYw?=
 =?utf-8?B?dUlWa2NDMkVtNmFlKzd2UHlPVGJxTWhPWVVjV2NuOEtSQk5UazA1SjRGT09I?=
 =?utf-8?B?NFEvM3NqemxtdUw4NjJPNGpwNVdIK0JTaVVuYS9QZzJzMXdPdVlmUnRZUm5u?=
 =?utf-8?B?RlNXUGtHTCtNOER3Zm0vUE9YYloyZEVEMzNlMzBvRkp2ajhGUjhrWllGNjI4?=
 =?utf-8?B?UW9VOWU4S2ZNRHk2Y3F4MDh5OSt6RXZ3QThENTFJa296aUFoUkw4VlZ3ZnVt?=
 =?utf-8?B?T2xRZmI5Y2NaWVc0bjkyUVBBUmVBcklNMDNLYmhKUGtaV3lwZ0VycENQSTIr?=
 =?utf-8?B?aFhRMmc5WmFjNEVmdXBRYk9qMEJoNllkOU83Q1hneXhFY3pRbHdLaTY3NlZM?=
 =?utf-8?B?c1llMS9TRlRVQXhjNkYyOUwrelczUUNZMVRYWEIzVEYvU1M5RG16eWxKZWg3?=
 =?utf-8?B?NmtteEVSVVpLbnEzS3YzbUZTM2FuS0hFZHUvbHZxMEVFemlzVWxsbVhoRGJD?=
 =?utf-8?B?c1pmZW5FTUNGTUVYYmVNZjhVcmQ3U1RMVk5ZS0trODMwRjRFMzJ3c2VQbHF6?=
 =?utf-8?B?YlBTNGJXaGcrRTQxMEk1ZTZEbElLRlpwWFBPSjFDVFFVRGJEUXZ3V2NhUkVT?=
 =?utf-8?B?OU42TTF2WXRUYTRxa1lISkM0RlpyVHBEYitaSFdyZkxCbDl1eExnMDJjOERR?=
 =?utf-8?B?K2JVSDRsSXpTazBnZ1RwMlhRTGUrVGhRUDY1K3NwQndPVkQ1Ry9YTjJZREpV?=
 =?utf-8?B?cFE1SzlEL0xVeStuVHUrdkhDVkxJZUZCUG5tbWtINWpyM0xkdW10TWp5cTg0?=
 =?utf-8?B?ME5tckhHbFdRRVJxQUc3NnE1VnBlNkJ3OGN4TlJtVU55aVNLNGx0V2tacWt0?=
 =?utf-8?B?S3VRTWJ3a1BydkQzOHdBNnBwT01RQVlmVVllZHNJeVo2Y1UyWlZhS0lYWDZU?=
 =?utf-8?B?Z1o0OVYwUW5mcWNDQS9HRXpWdldwV25VdlpBV1FxamRtbndVaVlMZVFXY3hW?=
 =?utf-8?B?K2hsOHA2aE1rRjhYS2JVUldpWUVhY0tzVkNtZkhFWVAyWG4yVXErRUwwZHRR?=
 =?utf-8?Q?+e2uEH9MIKy42AAhkNITNWDvd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a090ed-778b-4165-a11d-08dd57076f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 08:19:20.2193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K6jXhCGjfg7u0iln6S9sNicKC6w2B9qYcyLKlFHniIW3D+KUMbaCMx6nwCJhtfkP6bYsmDc7ICWzkUV9J6XmrKNWzCZ1SkETJhA1oXlnzto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5158
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDog
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMjYvMDIvMjAyNSAxMDoyOCwg
UnlhbiBDaGVuIHdyb3RlOg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJp
bmRpbmdzOiBpMmM6IGFzcGVlZDogc3VwcG9ydCBmb3INCj4gPj4gQVNUMjYwMC1pMmN2Mg0KPiA+
Pg0KPiA+PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwMTo1OTozNFBNICswODAwLCBSeWFuIENo
ZW4gd3JvdGU6DQo+ID4+PiBBZGQgYXN0MjYwMC1pMmN2MiBjb21wYXRpYmxlIGFuZCBhc3BlZWQs
Z2xvYmFsLXJlZ3MsDQo+ID4+PiBhc3BlZWQsZW5hYmxlLWRtYSBhbmQgZGVzY3JpcHRpb24gZm9y
IGFzdDI2MDAtaTJjdjIuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUnlhbiBDaGVuIDxy
eWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy55YW1sICAgfCA1OA0KPiArKysrKysrKysrKysrKysr
KysrDQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3Bl
ZWQsaTJjLnlhbWwNCj4gPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9hc3BlZWQsaTJjLnlhbWwNCj4gPj4+IGluZGV4IDViOWJkMmZlZGEzYi4uMzU2MDMzZDE4Zjkw
IDEwMDY0NA0KPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9hc3BlZWQsaTJjLnlhbWwNCj4gPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pMmMvYXNwZWVkLGkyYy55YW1sDQo+ID4+PiBAQCAtNDQsMTIgKzQ0LDYwIEBAIHBy
b3BlcnRpZXM6DQo+ID4+PiAgICAgIGRlc2NyaXB0aW9uOiBmcmVxdWVuY3kgb2YgdGhlIGJ1cyBj
bG9jayBpbiBIeiBkZWZhdWx0cyB0byAxMDANCj4gPj4+IGtIeiB3aGVuDQo+ID4+IG5vdA0KPiA+
Pj4gICAgICAgIHNwZWNpZmllZA0KPiA+Pj4NCj4gPj4+ICsgIG11bHRpLW1hc3RlcjoNCj4gPj4+
ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPj4+ICsgICAg
ICBzdGF0ZXMgdGhhdCB0aGVyZSBpcyBhbm90aGVyIG1hc3RlciBhY3RpdmUgb24gdGhpcyBidXMN
Cj4gPj4NCj4gPj4gRXhjZXB0IHRoYXQgdGhpcyB3YXNuJ3QgZXZlciB0ZXN0ZWQuLi4NCj4gPj4N
Cj4gPj4gRG9uJ3QgZHVwbGljYXRlIHByb3BlcnRpZXMuIGkyYy1jb250cm9sbGVyIHNjaGVtYSBo
YXMgaXQgYWxyZWFkeS4NCj4gPg0KPiA+IEkgd2lsbCByZW1vdmUgaXQgdG8gYXZvaWQgZHVwbGlj
YXRpb24uDQo+ID4+DQo+ID4+PiArDQo+ID4+PiArICBhc3BlZWQsZW5hYmxlLWRtYToNCj4gPj4+
ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+Pj4gKyAg
ICAgIEkyQyBidXMgZW5hYmxlIGRtYSBtb2RlIHRyYW5zZmVyLg0KPiA+Pj4gKw0KPiA+Pj4gKyAg
ICAgIEFTUEVFRCBhc3QyNjAwIHBsYXRmb3JtIGVxdWlwcGVkIHdpdGggMTYgSTJDIGNvbnRyb2xs
ZXJzIHRoYXQNCj4gPj4gc2hhcmUgYQ0KPiA+Pj4gKyAgICAgIHNpbmdsZSBETUEgZW5naW5lLiBE
VFMgZmlsZXMgY2FuIHNwZWNpZnkgdGhlIGRhdGEgdHJhbnNmZXINCj4gPj4+ICsgbW9kZQ0KPiA+
PiB0by9mcm9tDQo+ID4+PiArICAgICAgdGhlIGRldmljZSwgZWl0aGVyIERNQSBvciBwcm9ncmFt
bWVkIEkvTy4gSG93ZXZlciwgaGFyZHdhcmUNCj4gPj4+ICsgbGltaXRhdGlvbnMNCj4gPj4NCj4g
Pj4gc28gd2hhdCBpcyBieXRlIG1vZGU/DQo+ID4gSSBleHBsYWluIGluIGNvdmVyLCBJIHdpbGwg
YWRkIGhlcmUgYWxzby4NCj4gDQo+IENvdmVyIGxldHRlcnMgZG8gbm90IGdldCBtZXJnZWQgYW5k
IHdlIGRvIG5vdCByZWFkIHRoZW0sIGV4Y2VwdCB3aGVuIGxvb2tpbmcNCj4gZm9yIGRlcGVuZGVu
Y2llcyBhbmQgZXhwbGFuYXRpb25zIG9mIHByb2Nlc3MgKGxpa2UgUkZDKS4gWW91ciBoYXJkd2Fy
ZQ0KPiBkZXNjcmlwdGlvbiBtdXN0IGJlIGZ1bGx5IGNvbnRhaW5lZCBpbiBjb21taXRzLCBub3Qg
Y292ZXIgbGV0dGVyLg0KDQpHb3QgaXQsIEkgd2lsbCBwYXN0ZSBpdCBpbiBjb21taXRzLiANCj4g
DQo+IA0KPiA+IGFzcGVlZCxlbmFibGUtYnl0ZToNCj4gPiBGb3JjZSBpMmMgY29udHJvbGxlciB1
c2UgYnl0ZSBtb2RlIHRyYW5zZmVyLiB0aGUgYnl0ZSBtb2RlIHRyYW5zZmVyDQo+ID4gd2lsbCBz
ZW5kIGkyYyBkYXRhIGVhY2ggYnl0ZSBieSBieXRlLCBpbmxjdWRlIGFkZHJlc3MgcmVhZC93cml0
ZS4NCj4gDQo+IElzbid0IHRoaXMgc3RhbmRhcmQgRklGTyBtb2RlPw0KWWVzLCBpdCBpcy4NCj4g
DQo+IFdoeSBhbnlvbmUgd291bGQgbmVlZCB0byBlbmFibGUgYnl0ZSBtb2RlIGZvciBnaXZlbiBi
b2FyZD8NCkJ5IGRlZmF1bHQsIGl0IGlzIGJ1ZmZlci1tb2RlLCBmb3IgcGVyZm9ybWFuY2UsIEkg
ZG9uJ3Qgd2FudCB1c2VyIGVuYWJsZSBieXRlLW1vZGUsIGl0IHdpbGwgaW5jcmVhc2UgQ1BVIHV0
aWxpemUuDQpCdXQgc29tZW9uZSB3YW50IHRvIGJlIGZvcmNlIGVuYWJsZSBieXRlLW1vZGUsIHNv
IEkgYWRkIHByb3BlcnRpZXMuIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2xpbnV4LWFzcGVlZC9wYXRjaC8yMDI0MTAwNzAzNTIzNS4yMjU0MTM4LTMtcnlhbl9jaGVuQGFz
cGVlZHRlY2guY29tLw0KPiANCj4gPg0KPiA+Pg0KPiA+Pj4gKyAgICAgIG1heSByZXF1aXJlIGEg
RFRTIHRvIG1hbnVhbGx5IGFsbG9jYXRlIHdoaWNoIGNvbnRyb2xsZXIgY2FuDQo+ID4+PiArIHVz
ZQ0KPiA+PiBETUEgbW9kZS4NCj4gPj4+ICsgICAgICBUaGUgImFzcGVlZCxlbmFibGUtZG1hIiBw
cm9wZXJ0eSBhbGxvd3MgY29udHJvbCBvZiB0aGlzLg0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgIElu
IGNhc2VzIHdoZXJlIG9uZSB0aGUgaGFyZHdhcmUgZGVzaWduIHJlc3VsdHMgaW4gYSBzcGVjaWZp
Yw0KPiA+Pj4gKyAgICAgIGNvbnRyb2xsZXIgaGFuZGxpbmcgYSBsYXJnZXIgYW1vdW50IG9mIGRh
dGEsIGEgRFRTIHdvdWxkIGxpa2VseQ0KPiA+Pj4gKyAgICAgIGVuYWJsZSBETUEgbW9kZSBmb3Ig
dGhhdCBvbmUgY29udHJvbGxlci4NCj4gPj4+ICsNCj4gPj4+ICsgIGFzcGVlZCxlbmFibGUtYnl0
ZToNCj4gPj4+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjogfA0K
PiA+Pj4gKyAgICAgIEkyQyBidXMgZW5hYmxlIGJ5dGUgbW9kZSB0cmFuc2Zlci4NCj4gPj4NCj4g
Pj4gTm8sIGVpdGhlciB0aGlzIGlzIGV4cHJlc3NlZCBhcyBsYWNrIG9mIGRtYSBtb2RlIHByb3Bl
cnR5IG9yIGlmIHlvdQ0KPiA+PiBoYXZlIHRocmVlIG1vZGVzLCB0aGVuIHJhdGhlciBzb21lIGVu
dW0gKGFzcGVlZCx0cmFuc2Zlci1tb2RlID8pDQo+ID4NCj4gPiBUaGFua3Mgc3VnZ2VzdGlvbiwg
SSB3aWxsIHVzaW5nIGFuIGVudW0gcHJvcGVydHkgbGlrZSBhc3BlZWQsdHJhbnNmZXItbW9kZQ0K
PiBpbnN0ZWFkLg0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gKyAgYXNwZWVkLGds
b2JhbC1yZWdzOg0KPiA+Pj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy9waGFuZGxlDQo+ID4+PiArICAgIGRlc2NyaXB0aW9uOiBUaGUgcGhhbmRsZSBvZiBpMmMg
Z2xvYmFsIHJlZ2lzdGVyIG5vZGUuDQo+ID4+DQo+ID4+IEZvciB3aGF0PyBTYW1lIHF1ZXN0aW9u
IGFzIHVzdWFsOiBkbyBub3QgcmVwZWF0IHByb3BlcnR5IG5hbWUsIGJ1dA0KPiA+PiBzYXkgd2hh
dCBpcyB0aGlzIHVzZWQgZm9yIGFuZCB3aGF0IGV4YWN0bHkgaXQgcG9pbnRzIHRvLg0KPiA+Pg0K
PiA+PiBzL2kyYy9JMkMvIGJ1dCB0aGVuIHdoYXQgaXMgIkkyQyBnbG9iYWwgcmVnaXN0ZXIgbm9k
ZSI/IFRoaXMgaXMgaG93DQo+ID4+IHlvdSBjYWxsIHlvdXIgZGV2aWNlIGluIGRhdGFzaGVldD8N
Cj4gPj4NCj4gPiBJIGRvIGRlc2NyaXB0IGluIGNvdmVyLCBzaG91bGQgYWRkIGludG8gdGhlIHlh
bWwgZmlsZSA/DQo+IA0KPiANCj4gQWdhaW4sIGNvdmVyIGxldHRlciBkb2VzIG5vdCBtYXR0ZXIu
IFlvdXIgaGFyZHdhcmUgbXVzdCBiZSBleHBsYWluZWQgaGVyZS4NCldpbGwgYWRkIGludG8gY29t
bWl0LiANCj4gDQo+ID4NCj4gPiBhc3BlZWQsZ2xvYmFsLXJlZ3M6DQo+ID4gVGhpcyBnbG9iYWwg
cmVnaXN0ZXIgaXMgbmVlZGVkLCBnbG9iYWwgcmVnaXN0ZXIgaXMgc2V0dGluZyBmb3IgbmV3DQo+
ID4gY2xvY2sgZGl2aWRlIGNvbnRyb2wsIGFuZCBuZXcgcmVnaXN0ZXIgc2V0IGNvbnRyb2wuDQo+
IA0KPiBTbyB0aGlzIG1lYW5zIHlvdSBpbXBsZW1lbnQgY2xvY2sgY29udHJvbGxlciB2aWEgc3lz
Y29uPw0KTm8sIGl0IGlzIGp1c3QgbW9kZSBzd2l0Y2guIEl0IGFsc28gZXhwbGFpbiBpbiBjb3Zl
ci4gSSB3aWxsIGFkZCBpdCBpbiBjb21taXQuIA0KVGhlIGxlZ2FjeSByZWdpc3RlciBsYXlvdXQg
aXMgbWl4IGNvbnRyb2xsZXIvdGFyZ2V0IHJlZ2lzdGVyIGNvbnRyb2wgdG9nZXRoZXIuIFRoZSBm
b2xsb3dpbmcgaXMgYWRkIG1vcmUgZGV0YWlsIGRlc2NyaXB0aW9uIGFib3V0IG5ldyByZWdpc3Rl
ciBsYXlvdXQuIEFuZCBuZXcgZmVhdHVyZSBzZXQgYWRkIGZvciByZWdpc3Rlci4NCj4gDQo+ID4N
Cj4gPj4NCj4gPj4+ICsNCj4gPj4+ICByZXF1aXJlZDoNCj4gPj4+ICAgIC0gcmVnDQo+ID4+PiAg
ICAtIGNvbXBhdGlibGUNCj4gPj4+ICAgIC0gY2xvY2tzDQo+ID4+PiAgICAtIHJlc2V0cw0KPiA+
Pj4NCj4gPj4+ICthbGxPZjoNCj4gPj4+ICsgIC0gJHJlZjogL3NjaGVtYXMvaTJjL2kyYy1jb250
cm9sbGVyLnlhbWwjDQo+ID4+PiArICAtIGlmOg0KPiA+Pj4gKyAgICAgIHByb3BlcnRpZXM6DQo+
ID4+PiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+Pj4gKyAgICAgICAgICBjb250YWluczoNCj4g
Pj4+ICsgICAgICAgICAgICBjb25zdDogYXNwZWVkLGFzdDI2MDAtaTJjdjINCj4gPj4NCj4gPj4g
TkFLLCB1bmRvY3VtZW50ZWQgY29tcGF0aWJsZS4NCj4gPg0KPiA+IFNvcnJ5LCBJIHNob3VsZCBh
ZGQgd2hhdCBraW5kIG9mIGRvY3VtZW50IGFib3V0IHRoaXMgY29tcGF0aWJsZT8NCj4gDQo+IFlv
dSBjYW5ub3QgYWRkIG5ldyBjb21wYXRpYmxlcyB3aXRob3V0IGRvY3VtZW50aW5nIHRoZW0uIERv
Y3VtZW50YXRpb24NCj4gaXMgaW4gdGhlIGZvcm0gb2YgRFQgc2NoZW1hIGFuZCBlYWNoIGNvbXBh
dGlibGUgbXVzdCBiZSBsaXN0ZWQgKGluIHNvbWUNCj4gd2F5KSBpbiBjb21wYXRpYmxlIHByb3Bl
cnR5IGRlc2NyaXB0aW9uLg0KDQpTb3JyeSwgZG8geW91IG1lYW4sIEkgYWRkIGZvbGxvd2luZyBp
biB5YW1sIG9yIGNvbW1pdCBtZXNzYWdlPw0KDQpUaGlzIHNlcmllcyBhZGQgQVNUMjYwMCBpMmN2
MiBuZXcgcmVnaXN0ZXIgc2V0IGRyaXZlci4gVGhlIGkyY3YyIGRyaXZlciBpcyBuZXcgcmVnaXN0
ZXIgc2V0IHRoYXQgaGF2ZSBuZXcgY2xvY2sgZGl2aWRlciBvcHRpb24gZm9yIG1vcmUgZmxleGlh
YmxlIGdlbmVyYXRpb24uIEFuZCBhbHNvIGhhdmUgc2VwYXJhdGUgaTJjIGNvbnRyb2xsZXIgYW5k
IHRhcmdldCByZWdpc3RlciBzZXQgZm9yIGNvbnRyb2wsIHBhdGNoICMyIGlzIGkyYyBjb250cm9s
bGVyIGRyaXZlciBvbmx5LCBwYXRjaCAjMyBpcyBhZGQgaTJjIHRhcmdldCBtb2RlIGRyaXZlci4N
Cg0KVGhlIGxlZ2FjeSByZWdpc3RlciBsYXlvdXQgaXMgbWl4IGNvbnRyb2xsZXIvdGFyZ2V0IHJl
Z2lzdGVyIGNvbnRyb2wgdG9nZXRoZXIuIFRoZSBmb2xsb3dpbmcgaXMgYWRkIG1vcmUgZGV0YWls
IGRlc2NyaXB0aW9uIGFib3V0IG5ldyByZWdpc3RlciBsYXlvdXQuIEFuZCBuZXcgZmVhdHVyZSBz
ZXQgYWRkIGZvciByZWdpc3Rlci4NCg0KLUFkZCBuZXcgY2xvY2sgZGl2aWRlciBvcHRpb24gZm9y
IG1vcmUgZmxleGlibGUgYW5kIGFjY3VyYXRlIGNsb2NrIHJhdGUgZ2VuZXJhdGlvbiAtQWRkIHRD
S0hpZ2hNaW4gdGltaW5nIHRvIGd1YXJhbnRlZSBTQ0wgaGlnaCBwdWxzZSB3aWR0aC4NCi1BZGQg
c3VwcG9ydCBkdWFsIHBvb2wgYnVmZmVyIG1vZGUsIHNwbGl0IDMyIGJ5dGVzIHBvb2wgYnVmZmVy
IG9mIGVhY2ggZGV2aWNlIGludG8gMiB4IDE2IGJ5dGVzIGZvciBUeCBhbmQgUnggaW5kaXZpZHVh
bGx5Lg0KLUluY3JlYXNlIERNQSBidWZmZXIgc2l6ZSB0byA0MDk2IGJ5dGVzIGFuZCBzdXBwb3J0
IGJ5dGUgYWxpZ25tZW50Lg0KLVJlLWRlZmluZSB0aGUgYmFzZSBhZGRyZXNzIG9mIEJVUzEgfiBC
VVMxNiBhbmQgUG9vbCBidWZmZXIuDQotUmUtZGVmaW5lIHJlZ2lzdGVycyBmb3Igc2VwYXJhdGlu
ZyBjb250cm9sbGVyIGFuZCB0YXJnZXQgbW9kZSBjb250cm9sLg0KLVN1cHBvcnQgNCBpbmRpdmlk
dWFsIERNQSBidWZmZXJzIGZvciBjb250cm9sbGVyIFR4IGFuZCBSeCwgdGFyZ2V0IFR4IGFuZCBS
eC4NCg0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
