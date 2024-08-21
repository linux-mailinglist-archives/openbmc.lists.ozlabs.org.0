Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E69592EA
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2024 04:30:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpVgX4wdZz302c
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2024 12:30:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::723" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=qYegXcv0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::723; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20723.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpVfw5Ffzz2xWV;
	Wed, 21 Aug 2024 12:30:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnNXE4qZZ6LwKb2SHVcQR3ZqL5GKyCWE8AJFHJOmNO7e2qa4jTwc1FYGNm8nl02soGtM71WnYZREaq9Qnv3L0KAr3xFmIimWLzRgzW28vY/LFQykxYIsKX5lkpnyIBZnomCsRFMDNIynbvefH2xX3QFS7OnPd+dfjTcA4Ryw8pN6FVj9sn0bwOFrSH06nSVSpfLc5l9K04Gd+Rxe6geRCqGPcICObY7ZIhlVuIiPgnWbK890n5GxcpZ6/133UPf6tbYmQw9meq0WiU/e0D9nsifaXf0HCccuilLWSgXn8Ij8RsnTzl55o/zIRmJa4xvKYR8hIfS49Gd8+wwPSZ4/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQLBGnZJpodGFC3hGyLoPVOJ1+j9/wKCe8sYuQ/2T7Q=;
 b=B+03hMNnQg8IhdkPJvpUnc2Doc0RtcyChQtuMjz4IfOvH0vViXCKJXqILr6UFL1efE1Frm+O4FMBzqB7TJKEO6OmXlNsS3v0kHrS6UUcqVzKNGibTSra59rjLbkG2zAFSjG82X5nRFmur6TwDnKY1knsY4/j07inVZQU+g6Xj2nI9AmBdVK3aUzXd/BNGQH4WS17vj5uukc6eprvtd4uaKzVPOjS3CIoJsHT4PrbzH6TmzdjDpN8X09PhVD7QXgYgJpHQC8G8NKKREWvVpq+ksCwoHfBOgU5ZG52rpWN4VOjgUeAl2h/huSs8kjMy2fT/zkERkrXzEQF15uRM2cKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQLBGnZJpodGFC3hGyLoPVOJ1+j9/wKCe8sYuQ/2T7Q=;
 b=qYegXcv0sdkqwobhVNuJ6Jv0JLgH5fL93O2zeK02I7yKeu/+aH+sSvyCfJ383zZ6y+6cJU16OTzXBSt+okqXrRz+YU57CRV4N7iGqs1NTznjcPcu46YgP7f09lnvVQoiIYWNVQvUYXecsyIAz2zsQIWMunRqwFUHmJpD5R0tnY8QVJTxEgneUHcx+oBqaQVgFGVW7MJt1txCPOnY8FhOq13zPBGHsZ8yPfb3vV/E6yJos7H/BkHfemM9mF6ufICyh1mP1aaE2tz9ld2/v/hOfUb86fwWtjIoFmqgZiBb7jpN2tFa/4Qamy6UdogkubF/PHQIn59Bwpaw0c03TJMRig==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by PUZPR06MB5849.apcprd06.prod.outlook.com (2603:1096:301:fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 02:29:49 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 02:29:49 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "brendan.higgins@linux.dev"
	<brendan.higgins@linux.dev>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v13 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v13 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHa8ho549HAiRHYiEK49yrqFuaLn7IuYooAgAD5pxCAAFELAIAACBjQgAA2cICAARONwA==
Date: Wed, 21 Aug 2024 02:29:49 +0000
Message-ID:  <OS8PR06MB7541A425EF01573FCBE6735AF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-2-ryan_chen@aspeedtech.com>
 <7237aa34-9821-4ba7-a45b-3b1d598bc282@kernel.org>
 <OS8PR06MB75418A2ACA6693A8163F19E8F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <46a9280d-f4ef-4cfb-83a3-3744e04721f3@kernel.org>
 <OS8PR06MB7541A25AC3A11C51DD57E1B4F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <266f4b55-bddb-4c44-9eb5-3eef35757714@kernel.org>
In-Reply-To: <266f4b55-bddb-4c44-9eb5-3eef35757714@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|PUZPR06MB5849:EE_
x-ms-office365-filtering-correlation-id: 118e9831-0091-409d-6324-08dcc189212e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:  =?utf-8?B?eFFuUCtpSWdvd1FGcXBqUkxJTmZrOWlVUm5HaVU3U2xyVHAyeXRqWWt3TkF5?=
 =?utf-8?B?V3FkYUZQdzRaL1JnSHZXQ0hGa1hVTktHRGFiNW9BQU94RzYrZE8vNXRWWGN4?=
 =?utf-8?B?SHBjM1A3eTU2WG5uN1FSRUY4WTY1ZnlTZS9hUGJNbUdMcHVQd0lwbGhwL3pa?=
 =?utf-8?B?K0R1ZW5ZeEd0T1JUMGJEK0RGcUx3UUtCdXd5L254ajlVbG5HYnpEZ3V0aVNG?=
 =?utf-8?B?eks4cjduTnVkeE92bkVtc0xVRnFYQjc0QWVtcS9ab3FST2tHU2xKYXZ3L2J1?=
 =?utf-8?B?dEsvTlo2ZmxXR2RlYXFSeFQrS1FEZUFuVm1VSWt5aFM4YUtpaGhadGcvVHpH?=
 =?utf-8?B?MXpvbVFQbEZ0alI5aVRoZE8zYWFWYmc4U0YrSXVhQnlZMU9DYURnMUJVVHU1?=
 =?utf-8?B?T2FqVU5LU3dta3Fzak80MkszbmJQQTZGYitMNUJGazNjTEV3YW8xc2hkYUUw?=
 =?utf-8?B?UnpYOEo0dTNibzRpbDl1cFBySXl4RXhXM1BFQzY2RzVNNmRLVDQwVjQxQTJn?=
 =?utf-8?B?RFJRVGpPK01IOUk1MEJidWFmeElHdGNNeGo5STAya1dTK0hUMUt3SWM0bjh1?=
 =?utf-8?B?a1QvUnNic3l4MHMyc1I2VFVCSWd5S2RnNDRmTW05czVUa2VBZ0doOG1XQUc4?=
 =?utf-8?B?eVdsMU9PSDZTS3RxUHBsK01CelZ3Qk9VQjZDTEZPZStXSUZ5Y1RvRFlWUFZ4?=
 =?utf-8?B?d09FOFdSdlBZSVFvOThkRVJVUmFMbFViWUs5eUZCSnRHOWFUQ2ltVGNXNHJX?=
 =?utf-8?B?ZG1QNEFBdk1yWFA0bW0weXRyUEFKRHI4YmRNSk9QQUpnVGNrMkFhdEdYYXZV?=
 =?utf-8?B?VStvcXA2Y2xuY2tVNWJsU3RvNm5TbFY0QThXRE96VjBGbHpkSCt2d1gxUXA0?=
 =?utf-8?B?bE90Ky9RcVpYOHBXYlhyWXZZRzRYWVAxUkljeWNtTWhjaE1zN05mZFlVMk5o?=
 =?utf-8?B?TjAvU3hmUnYrSm1WZFdZZldPUG93NWpvWkVta0pJc0lqS2FCRHpWR280aVd3?=
 =?utf-8?B?bXMyVzM2UU80WDdIUEtYVFY3Q3dDNGpQaHRoQWN3YnBvcHdHRnVvVkt5b1ZN?=
 =?utf-8?B?NGFYUWxKaHkrMkhGTVppUVQwNTV5U3JjRCtMZkgzRlhNQ2M0bjNEaHVvYTRP?=
 =?utf-8?B?cTB1SVdSZjhDR093citSa2FwV2ZrUmlXWjNSQVhPeGoxdWh0RW5Rc1M2bDNp?=
 =?utf-8?B?UjRKR1JxZ0JBbG02Zy9JZDhBckU0LzlzeEZkQnIyZ3NJZFVLVHRpbE13aFVv?=
 =?utf-8?B?WVM2WCtVZ0dNR0FBKzFBN0JpcGRtS2VjVnJrUC9odWgrWlhXb0w4YldWOUVQ?=
 =?utf-8?B?NTJQSkJHTitxMVUzMWoycHBVaGNkSFltMTc1ak5yYTViWldPQ2IvWDRvOXVh?=
 =?utf-8?B?OE9jczE4cHIxb0p4bVl5Q0hkb1VuV0UramxqYkpMTnhEcUkxdSsra3Q0WnA3?=
 =?utf-8?B?MVoyNkhrRkozSWJ1UUdqSjV5NjV0SjdNM1FlblRoMk1TcHdHcUJ4dEFBK2dv?=
 =?utf-8?B?cjZKS1VILzhBZFdva1pha1JQVUNVMjRYNVZNSlorVkc4dXlGQmNmUU1obnRD?=
 =?utf-8?B?ZytGYUY1ZmlUZVJ3d1V2NnZyaHY3N216OGQybEpUOWl5eFNFSVpOSDdESnhI?=
 =?utf-8?B?RDhUc3RXelY0TU9zNytNay9ZVC9MNFptQzRMUzVsM09yK3J0WC9LRmRKUFdj?=
 =?utf-8?B?cE5CQ2dXYUx1S1p6SjJXcWZzenVDdW5uL3Rrdjl2VzVGaWozb1loUjUwTEw3?=
 =?utf-8?B?b1Z6TjlwbWMzNm9IeUc1Z2dnVysyVE9xZWE3K29jTlB1VjYvY2F2YXVpNHlw?=
 =?utf-8?Q?pqiVAoBeX4sLqx/72YtdikMcynZqKtdudMeco=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SUF2WFFsZ1BWUzdneEV6TktUOGFjQ25TV0UxYUNhYXowVTBCUUYyNEdzbEhx?=
 =?utf-8?B?VXVaaHRlR3lHVWhlR0hBc3VtbTQzNUFLRGYvdTArUWF6bXRIS2RzbGxPaVc4?=
 =?utf-8?B?RlZoaWNzUzBoNVA0ZmYvdFM3RjV0S1NsZTRiaGZ0eUZVTTJCcU4zaWs0ZGcy?=
 =?utf-8?B?WjRIZHBzYUhIM040VldaOVRkNVlsZTZnYUNvbWdNaDZWU2NJU1hGS2JzSmti?=
 =?utf-8?B?QjVzY2RRMnQ5ZmN2ZW9RbWplVUd2OC9UQnIvMEQ5YTdsajh4bUx5dTAzQStD?=
 =?utf-8?B?MHR5RnY2cHpQLzVDV2lxbUFrWjdpcjJjRS9aS25tb3pNMHpnM0hqbTZGNnlT?=
 =?utf-8?B?L05WTUlhZ0tzTU1uUERBVzUvMEYvcGpwalpPTlVheTkyV2E4eVMvMzNoOHh6?=
 =?utf-8?B?TVZlZ3Q0cWVTUVlFSU9kYXNMNzVRa1RtaG9SSEhnZ3dsOHgvZmozY2R6TnI3?=
 =?utf-8?B?RmkxaThNZUV3cDQzRE5VUGYxOW54ajNNUXgyVnhMdFhOeE5WT1d5Y2Z6UW54?=
 =?utf-8?B?WE1vSzI4bnk2Ky80WEEzTFViUEoxR0trRUZldVh5R2o1NmxTUEpOaTN1Q0VN?=
 =?utf-8?B?T1dHd2w3S1poUEJrMy82VGt0Z1dtYXI2NU93NlZldzdWdGhpdStSSncrcnRl?=
 =?utf-8?B?MXQyaG1wbjdDQnZqUTdhQzdCajg5aDVQVWR1QTdKU1pWYTI3bUNIaHFjNi9z?=
 =?utf-8?B?aXFKM0FVSHRhMjYydThQVWQ3UWJUODlKajA4ME5OWWJrU2tRbGFWelBEZFdz?=
 =?utf-8?B?R2ZPZU9UNlZ6cWswKzN5U1F4Z3FtZHRzZGtYcmRtNkExcG83dXVoeSs5UlVk?=
 =?utf-8?B?UDQ0em1kTnVnYTB3b2ZBZWk3MTNqQlpLc2NhdmNmb1VBcExpUVZqSGdoT3kv?=
 =?utf-8?B?N1ltSjV6QlRkaVlkUU84T2JjSUsxeEtCMnQzVHdENnB1QnpPLzdDRVB1UEJ0?=
 =?utf-8?B?cFlrOFhqUHUzc3B1M3pQUncwVEU4QXUrRWZTY1BES3kyS3oyS1R0TEtCY3U0?=
 =?utf-8?B?SjE1VE9uTldXdTlSOVJGOFkwSFBWMXYwVXRXUldZRXE1eTUweW1uSGlHTnFP?=
 =?utf-8?B?RzZqcUtKdFN2bFNPaGhQZnhVYk9iL2RXdk9PbFZxa1lJYlVTdURlMkh3SWdK?=
 =?utf-8?B?OVVhdHdTSGQ4Nkh1ckxSUlY0di9hRzRHdFUrcWMwTmNFSE9nbTIyc0pHbjh6?=
 =?utf-8?B?TjlBa1hjT3cwOThFdDdHbFlJemJlYnpQT2ErUXdqL3RxSTgzUUgwQVhuRk5u?=
 =?utf-8?B?ZEk4RG5UL2ZCSk5tUHB0eDZIZFNuOWJwaEo5blBCbGNNZE5YZWZrYkE4c05I?=
 =?utf-8?B?WUhoM2xCMW83NHlTTk1TVExlOHcwTVR5anJhZ1ZkZkMxeXE4SENaME1ZSHlZ?=
 =?utf-8?B?R3VkOXhvUlM3V2htZ3g5OW1TRTdwWVIxcWFhcTR1SWZFT1ZweGJWdlFBU2N6?=
 =?utf-8?B?R3FsZkNBaEp5TWxTT1FqNWZVM1F6dFBkQ1JpSTZhTUJlT2YvTVE0OG54cDNl?=
 =?utf-8?B?ZElOTW9wZFV0RjFuUmkyL2VpMFhxY2ZLV2NCYmZwZEJlQ09vQ1loWVAxY3Rh?=
 =?utf-8?B?aE00aVlmNnE0ZVByOFI1Z01KZDhZMnZiOUc3Y2lWaS9tRlM3YnF3bVFQN0d6?=
 =?utf-8?B?aUwzSlRIVHNMQ01TczlwKzAyRjIvdXEzVFdHN0dhOXQ4Wnd5cFg1cEthM1Vt?=
 =?utf-8?B?c2pvQzlwWExMWjdTZXZPY204R1lKNWxXWUhaaDVETXZJSkxtWnZXWVJiR0pn?=
 =?utf-8?B?R2FORkVtc3NpTUlGMHRWbGZGb0pUQzVZQzJ1R25sbkliRUIzeG5lR0ZnUC8z?=
 =?utf-8?B?MUhuOStjSy93UUN2NHdQN0tIQ05oTXhpOWEycG5pTjdiblNCK0xPYWpMOGpN?=
 =?utf-8?B?TDZKbjNsbEd0OFZseDhuNUtjYU91eFF3TFdhWWs4UGVRWXE0bW1PTWJXTjlh?=
 =?utf-8?B?a05EdURyOGdndWZvS3pkYmZJdHVMSjkxazl2NHUwQUJhR3Bkek9uL2VLSUJv?=
 =?utf-8?B?eGhJRDBsTUZrN1ptVHlnaDN1VStIZXQwY2YvVjIycUZQNVpacjR3c3c1Vktt?=
 =?utf-8?B?RnZlYUU1Q0ozL1pQOFhYVS95cVdIOGpzUUY0YTJxbzVPa2trbGgvNW9KemNn?=
 =?utf-8?Q?oprcCoPh0UjyPzVwqzPahySit?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118e9831-0091-409d-6324-08dcc189212e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 02:29:49.0675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTrcfhpDPxqKZYyJbi95T8474V9WGPb+Y4Y/J6cW1Isb6JAsm7AGzJgC4/fXt8DrUpj9c2lSpbcRu9I4uba8BaI4zy+cLOexDRl3v1v7WBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5849
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMyAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDog
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMjAvMDgvMjAyNCAwODo1MCwg
UnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEzIDEvM10gZHQt
YmluZGluZ3M6IGkyYzogYXNwZWVkOiBzdXBwb3J0IGZvcg0KPiA+Pj4+IEFTVDI2MDAtaTJjdjIN
Cj4gPj4+Pg0KPiA+Pj4+IE9uIDE5LzA4LzIwMjQgMTE6MjgsIFJ5YW4gQ2hlbiB3cm90ZToNCj4g
Pj4+Pj4gQWRkIGFzdDI2MDAtaTJjdjIgY29tcGF0aWJsZSBhbmQgYXNwZWVkLGdsb2JhbC1yZWdz
LA0KPiA+Pj4+PiBhc3BlZWQsZW5hYmxlLWRtYSBhbmQgZGVzY3JpcHRpb24gZm9yIGFzdDI2MDAt
aTJjdjIuDQo+ID4+Pj4+DQo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gQ2hlbiA8cnlhbl9j
aGVuQGFzcGVlZHRlY2guY29tPg0KPiA+Pj4+PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6aytkdEBrZXJuZWwub3JnPg0KPiA+Pj4+DQo+ID4+Pj4gPyE/DQo+ID4+Pj4NCj4g
Pj4+PiBXaGF0IGhhcHBlbmVkIGhlcmU/IFdoeSBhcmUgeW91IGFtZW5kaW5nIHRhZ3M/IT8gVGhh
dCdzIG5vdA0KPiBhbGxvd2VkLg0KPiA+Pj4+IFlvdSBjYW5ub3QgY2hhbmdlIHJlY2VpdmVkIHRh
Z3MsIGNoYW5nZSBwZW9wbGUgbmFtZXMgb3IgdGhlaXIgZGF0YSENCj4gPj4+PiBBbmQgaG93IGlz
IGl0IGV2ZW4gcG9zc2libGUsIHNyc2x5LCBob3cgZG8geW91IGV2ZW4gd29yayB3aXRoIGdpdD8N
Cj4gPj4+PiBHaXQgd291bGQgbmV2ZXIgZG8gaXQsIHNvIHlvdSBoYWQgdG8gZG8gaXQgb24gcHVy
cG9zZSB2aWEgc29tZQ0KPiA+Pj4+IHdlaXJkDQo+ID4+IHdvcmtmbG93Lg0KPiA+Pj4+DQo+ID4+
PiBTb3JyeSwgSSBkb24ndCBrbm93IEtyenlzenRvZiBLb3psb3dza2kNCj4gPj4+IDxrcnp5c3p0
b2Yua296bG93c2tpQGxpbmFyby5vcmc+IGlzDQo+ID4+IHlvdSBvciBub3QuDQo+ID4+PiBPciBz
aG91bGQgSSBzdGlsbCBrZWVwIEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9y
Zz4/DQo+ID4+Pg0KPiA+Pj4gaHR0cHM6Ly9wYXRjaGVzLmxpbmFyby5vcmcvcHJvamVjdC9saW51
eC1pMmMvcGF0Y2gvMjAyMzA0MTUwMTI4NDguMTcNCj4gPj4+IDc3DQo+ID4+PiA3NjgtMi1yeWFu
X2NoZW5AYXNwZWVkdGVjaC5jb20vDQo+ID4+DQo+ID4+IEhlcmUgaXMgdGhlIHRhZyB5b3UgcmVj
ZWl2ZWQuIFlvdSBhZGRlZCBpdCBpbiB2MTIuDQo+ID4+DQo+ID4+IFdoeSBkaWQgeW91IGNoYW5n
ZSB0aGUgdGFnIHN1ZGRlbmx5IHRvIHNvbWV0aGluZyBlbHNlPw0KPiA+Pg0KPiA+PiBEbyB5b3Ug
dW5kZXJzdGFuZCB0aGF0IHlvdSBhcmUgbm90IGFsbG93ZWQgdG8gY2hhbmdlIHBlb3BsZSB0YWdz
PyBJDQo+ID4+IGhhdmUgZG91YnRzIGlmIHlvdSBhc2sgYWJvdXQgcGVvcGxlJ3MgaWRlbnRpdGll
cywgd2hpY2ggaXMgZW50aXJlbHkgaXJyZWxldmFudC4NCj4gPj4NCj4gPiBTb3JyeSwgSSBhbSBu
b3QgdW5kZXJzdG9vZC4NCj4gDQo+IEkgZG9uJ3Qga25vdyBob3cgdG8gc2F5IHRoaXMgc2ltcGxl
ciB0aGF0IHlvdSBhcmUgbm90IGFsbG93ZWQgdG8gY2hhbmdlIHRhZ3MuDQo+IA0KPiBZb3UgcmVj
ZWl2ZSB0YWcsIHVzZSBiNCB0byBhcHBseSBpdCBvciBhZGQgaXQgbWFudWFsbHkuIERvIG5vdCBh
bHRlciBpdC4NCj4gRG8gbm90IGNoYW5nZSBpdC4gRG8gbm90IGFkZCB0aGluZ3MgdGhlcmUuIERv
IG5vdCByZW1vdmUgcGFydHMgb2YgaXQuDQo+IA0KPiBUYWcgaXMgYXMgaXMuIFlvdSBvbmx5IGNv
cHkgYW5kIHBhc3RlLg0KPiANCj4gSXMgdGhpcyB1bmRlcnN0b29kIG5vdz8NCj4gDQo+IA0KPiAN
Cj4gPiBodHRwczovL3BhdGNoZXMubGluYXJvLm9yZy9wcm9qZWN0L2xpbnV4LWkyYy9wYXRjaC8y
MDIzMDQxNTAxMjg0OC4xNzc3DQo+ID4gNzY4LTItcnlhbl9jaGVuQGFzcGVlZHRlY2guY29tLw0K
PiA+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc+IGF0DQo+ID4gdjEwIFNvLCB3aGF0IHNob3VsZCBJIGRvIG5vdyBhdCB2MTM/
Pw0KPiANCj4gRml4IHlvdXIgd29ya2Zsb3cgYW5kIGdvIGJhY2sgdG8gcHJldmlvdXMgdmVyc2lv
biB3aGljaCBoYWQgY29ycmVjdCB0YWcuDQo+IEFuZCBhbnN3ZXIgLSB3aHkgZGlkIHlvdSBkZWNp
ZGUgdG8gY2hhbmdlIGl0Pw0KPiANClNvcnJ5LCBJIHVuZGVyc3RhbmQgdGhlIHRhZyBtZWFucyBu
b3cuDQpJdCBzaG91bGQga2VlcCBvcmlnaW5hbCByZXZpZXctYnkgdGFnLiBBbmQgc2VuZCB2MTQu
DQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
