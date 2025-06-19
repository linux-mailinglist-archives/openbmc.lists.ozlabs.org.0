Return-Path: <openbmc+bounces-262-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC55AE1019
	for <lists+openbmc@lfdr.de>; Fri, 20 Jun 2025 01:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNcft3bkmz30RJ;
	Fri, 20 Jun 2025 09:45:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750316254;
	cv=pass; b=B89fOHKtkZ43w2HMxtZ2cSUd8jBqaU/g5f4IgBTgeowpYt6ovBdKH0FupJJ6bKrFYVl7Lsb5oUQrgqCPIsk7okjc2Y88XMH9ySroc4XsnTbyslhrnAoJlS1qqP7okdM281Qbjdlibmv3emoP5vEJHT8iGTmA/IMYGDDUcXZ09Fko59i3KJ0113ZG5SrOLRQViup+pGVHPImohQds3hHCyabcH718s3pgZB53xgZe9984qSb2PtgK1jOMgV6bo9zWFi0g5Rn5GjLF2FiMdOBUTgpM/OdvHgnAq3Mi9WO21aZHRf/PTB1fXilRw4O5OpzOWpz5WhO/aFOYuK43/EYoew==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750316254; c=relaxed/relaxed;
	bh=GYVEhjaa1OimZQNO7BUlVCKyswumKaM9NWdaYGCcdcU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LDgbsbw59qo3P9ymYmQY1+0AinywUvhdiIlkF/U8XOKLMla/Q618cOGZLCUSSX6Re+JtBMw+eEak7V4i58jAId4REh2zSI0BolNEp5KzxAizG7TwEA28YMqlPT+v5skIAHhIuV6/uUcPqpB/uvJuTooEVdGD8/CW7FI2mLjF70KU8U5WPWfs9dOHgIyK4lGa6FPhTCgXgp6znJitu8UiGVMnc52+qzDJe37GpdUQsX10QXfCon1xxInGmRv5ray38WSrDC596BA/wvOyV7si442btmFPk8/uaWxN50H6MBgpwi9ULKPLpTt4qKvyhALsEdvsZmSdzENL7EkRkuhwEQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=WelDVVUq; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=WelDVVUq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNBHy1G49z2xS2;
	Thu, 19 Jun 2025 16:57:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnJhhv6k6Kb3NX91GYoNiyn47F8s1as+S97ei1aSWkr5lSiUG1JFpDM5cwCKWqM6ZaXjcBYBSjtHgb6KfBxyMnvAw/R4M1AfKV8GMCcuTZdgp35evvYEu9tWRCnylSPa9AfeR05h7Ich14tWTUgCjMTGpQwrqczMDPPeyDmUEJB7a5krtGsCQEZdCKgqw98lC235DGopeaUe9JheZJ+NxO1JPfepLs83efXsu4PmBfV02sF4Hq+bXkYHWN4q50fE22SLcgupb6TgT0655EMBq6Ot7O58DBo4VRL6GA/0b2wLJY0JB8RtEPckG9hyeMwpJU1YXnfBJCrPDD1/y5Jpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYVEhjaa1OimZQNO7BUlVCKyswumKaM9NWdaYGCcdcU=;
 b=QXI3+H4g76cPNINtCyFPZkMW0yNyaioiGrLzdhgcRVm47aiHIfQhhK9gjU7uWBt6Br6FOi6aTI3rsD/CHz9Jw56o56XjFvXysrMXrXaI0J0C1JPSieY+u2SQRBTtWGIFQrE+LvVfUKA4cRMf8ty8wHJxGVLypIE441D5kYO2TjlhcwyM0N/qS48nIMhXUpYeUJ0iUrJ8qOP99f/OgdQCCfxsh3gQa7xHnV6lffLuXRtWtsX6ONDLgBwkmtDNQhLw8hY4QmvEBvZ19CbFNJUhb3UUhipNrFr8DXHsOjjuJvsIbBcU6Fs9VEYIgBkXk4TH1XrH8X4zf8nbouwNsmu89g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYVEhjaa1OimZQNO7BUlVCKyswumKaM9NWdaYGCcdcU=;
 b=WelDVVUqlU2tvcWNLBTwDI4F9DEjJl1k/zP7H3HAOdkcZFdyPydIJZzIJrypY09sGFSPzmNHDqstmI6I4iXqQzFQ6L+xkNC3G3HikS6G4Mmdznj4PxVQL5nT12kSofWcsyaIXn22R5SZX9Mw+RLLwQgaIjhGdX7oGwLtyOkDXvZ3iNrjftp+aIOFE0bqSe5eXpXdLU2VqHoMsOy03RQoDe2BTSpgYewZvfudq/6ZJOcjCMxKx3mOhCa2TdSXZwbwU1oDvH9gCmK3eDImrYiVMGYVVD++ACQ7vAZYxHFFTvTcVh+stYkeDqIf+Tv2iwD0ca1cEzEJJhiKAlS8EJXs+A==
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com (2603:1096:400:466::8)
 by SEZPR06MB6206.apcprd06.prod.outlook.com (2603:1096:101:e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Thu, 19 Jun
 2025 06:57:11 +0000
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed]) by TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed%4]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 06:57:11 +0000
From: Cool Lee <cool_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 2/8] mmc: sdhci-of-aspeed: Add runtime tuning
Thread-Topic: [PATCH 2/8] mmc: sdhci-of-aspeed: Add runtime tuning
Thread-Index: AQHb3/ktkntdN1OydEqg7ke5WU8Bq7QKDd7Q
Date: Thu, 19 Jun 2025 06:57:11 +0000
Message-ID:
 <TYSPR06MB7068FCC2A69BB13A2465DB79957DA@TYSPR06MB7068.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-3-cool_lee@aspeedtech.com>
 <750e6e51e0943e50162851ca8df2befcea3e9bbe.camel@codeconstruct.com.au>
In-Reply-To:
 <750e6e51e0943e50162851ca8df2befcea3e9bbe.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR06MB7068:EE_|SEZPR06MB6206:EE_
x-ms-office365-filtering-correlation-id: 250683e9-2191-4c8a-5c74-08ddaefe83f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b3E5NHl0RXdyK1JYb0hnVXlVS1hNQ2IzL2lqNlVBT0ZBSGxocDM3dUdYbmR4?=
 =?utf-8?B?bXJheXpWbGtaMEh0akZJZWpXL0lXeVd1L0FkOFlCc2R4V0FjMkZFOGh5YkhW?=
 =?utf-8?B?dmJtM1R2SHhHTmoxeXpPdU5aTGhoYThVc1g3UVJaaUVPZUVCTFlvbW1YakU1?=
 =?utf-8?B?R1I3WHQ2aE81NzlwRXdGTUMxWlNWNVdScWlGOU93em55eDVWSmlXTFpOcXps?=
 =?utf-8?B?Y3RXdDAreHFQZjltNThoajV6Nk52NHRpREZORkRBa2tsU1dqSEU1b093K1Fo?=
 =?utf-8?B?emd2alRUS0R3bnkzeVg0bDBmdVBNUmVUQ3RQU2JHMFdDSTcyeVBlYWNlNmJw?=
 =?utf-8?B?K0xremV0eVJxaEY2Q003Qytocys4bVRlM3pSY2FIa05STURJVXc2ZE0ySDJZ?=
 =?utf-8?B?djB4K1d1SkkzMCtNVVFwL0wxRUIvMWcremJSajNQSGNKbkJhQXBJZXdEdFN3?=
 =?utf-8?B?YWh5YXduRGpsdEQ3N3llOXpEWHZTYlhHMmxzcVpWS2FHQWxlSTBDY0t4WnpG?=
 =?utf-8?B?MC9xek1yU3FaY3l2TllSajE4T3M4TXNYd1pvZ3UvNUhrRUxlOVJKUnRETmxs?=
 =?utf-8?B?U1AvOFNoczZBaWprUTI0WXFWZmNuUTg0TWdEY2dDcENqMkF0YkJMUDhma1hk?=
 =?utf-8?B?dW5CK3lMOFhDa2x2Z1EydzkvR0xWL3VoK0F4UTNnVXBEVHZSeFN5RkZSSlVn?=
 =?utf-8?B?ZGNCNjZoS1FteVlOTjN2SkdBall3dEFJc0prUHNBbnJpRWppdnc3ZURQQlN5?=
 =?utf-8?B?aXd3UGp6L2pDQmUvdkdaWk1GZHpHZkJ2QVBXQzlzbjV1aWpabzNhVjdYQ3Jw?=
 =?utf-8?B?b2RKdzFMdVdRbmV5WGxxVUIzL3hGdGh1MFpXU2JTWjQzYkFwNUVQc25Bb2J5?=
 =?utf-8?B?THNUbFIwbTB4ZXl0TkNyd2NjMGNSMlFWaFZkSkUzUHcvbmVzTGZjNkJuei93?=
 =?utf-8?B?RWJHekhwbVNnR2cwZXNqM1lJcTlSVlNJZk1CZ1hHOEZ3K3BvT2NiMjhZeGlE?=
 =?utf-8?B?Sks0Nkl3ZUlSSElIR3ZNdHhsV3ZYOVNEMVpNam4wMmxsbUF2N1ZNLzBwVkFl?=
 =?utf-8?B?aDRRRTA1RDVESFdwTEg1czR1VzJxNmhWbVIyTDJFc2RYdE15N05xb2VZbW92?=
 =?utf-8?B?b0V5OVYxUkJCZjNiTWp3UVNzNHJrZ2JIaU5nY1ZwandnVjhONUpocklrYnNs?=
 =?utf-8?B?TkVRTGlQd3JrcVlkTUgyOHRjSzNVSWdVM2QrRGlKRmRYdnQwQXFoTGdDbmxs?=
 =?utf-8?B?QXE2Z1hxREY5eE1GSkc5b1BZQTJiSUMzQ2xZQ0krNElDNGxRZk9uNFRVNWo1?=
 =?utf-8?B?cjdmbHZMZVd0LytlRTQxQ0x1TFhsYmFIbGowajVodklJWXc1ditDakZCdzl0?=
 =?utf-8?B?N1p6MDBmRktibGhqRWZkZmhOZFFlUDliNHRsM2lIb3o0bUtzNjRmUERDWUw3?=
 =?utf-8?B?UEhaSE5VZnVPQXFxV0pjK3pXcGIzTGxjaEJZS3VVb2IvNm5sYjdvSEUyTnJm?=
 =?utf-8?B?b05EeHdBVWpOWEhNTVRJL1YxMFF1bTlNdCtnOWFCTTloVFJrWEZTeUtZSlhP?=
 =?utf-8?B?dGRxQk0xa2hLaXpadHpjWjJhSGhwTUZzWGt3UW5CeEFCeURHajIrckdLdWRV?=
 =?utf-8?B?VVBuVDlFZHVJYU1mVXBrbGVzdTU1S0s4YnYzRW1QOXU4TlJzVHMrL2hrOEpy?=
 =?utf-8?B?bXNTZUJ2ZjRDRkF6VlY1NEYycTErMmluYjZvUlVtREs1WmlxMldhc2NMZGd3?=
 =?utf-8?B?ZTlQL3ZTUjZzUStpL2EwTC84VFgyR3BHaENFaGQzV3Nxci80Q2xOcytNcXYv?=
 =?utf-8?B?YTN5eFdEelRiYXErR25ZbDhmSkQ4dmVsckZ4WnJBTXEyRXMrNFprOVZnZVM1?=
 =?utf-8?B?bUVNMklpMmwzblFxZlB3VDJmQnRrMVJGUzRuakdtM1UrKzhYeVYvekpuNHVI?=
 =?utf-8?B?c1NnOEJ1TkxUSWVSeDJIZ3hQZzFFOXQ4NnR5cG01RXFjV3JvSVBhTEplS2Jl?=
 =?utf-8?Q?VgrTzBSXgdxgScFR7qLE2jJd7N5X08=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR06MB7068.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDk2VHBmcDJHU2VjNXBuSCtjSXYzZ1V1NWRjeEFoYzYranpxMlFtTlJYNjdZ?=
 =?utf-8?B?V0FOaERXU2VrQjM0Z24xNWF6cmx4N2t5c3pVb3VWVnUwQkZLcmgxcFdkcDYw?=
 =?utf-8?B?QXpvQzVQN1poZ1ZnVmtJOHl3bDdiVmtRZGZ1UFpGTzUxaDJDL3ZRZk9ZYXFK?=
 =?utf-8?B?LzNuM09FbGtsalE3ZjNNL1A0d1dzK1Y5REJrTlBibytMNzBHSGRzWmoxZzJC?=
 =?utf-8?B?ZkFyT2lsMmRMYmpvZ3JEaU53UVoxN1FQNm5iWUxvZFQ0eVRqdThGWDZjN0Jy?=
 =?utf-8?B?SzdQVnl5c2REcnRBVzVUTktHbUNhU3pqd09wY0w1WnF2SzJVd0dKcGh1TDRY?=
 =?utf-8?B?RDV1T2JTeVNaazJCa0x5bWhmY3JmYjh1cWcwcnBhbkJHZks5SVVDRFlTUlJE?=
 =?utf-8?B?ZkQ5RmFhSmxJaVNBSXFrVEZZWnY4VXZVUFg5Y01oUjRsYkMveUV3Uy9DUlpu?=
 =?utf-8?B?WWRpa0Q5K3M3ZmloQm1zb1pObmtTWXhZZTRPN1VTU0tpaHRGMXQwY29va3Nj?=
 =?utf-8?B?SlUzd25icXZlTWFMeHpkcGxNcWFIaHltNjRPSlh4bWU1WXp0NmtoV3RQb0Rn?=
 =?utf-8?B?elRCWkdTamE0N1hWRE5nQjhvbGF0bCtwckNmV2FRaXNnRCtzdGx4SWlaRUl6?=
 =?utf-8?B?SThNSGFFd0NETXpvU21tSWw1bythV1lQVHY5cW4zT3lJZDBUVFBhTFFjdGRJ?=
 =?utf-8?B?VFB5VDJLOW9udmtzVGR5eGZBU2lZNUVEZU9CbkZDWlp4a2s5cXNQQzRiaVhy?=
 =?utf-8?B?ZXA3eDIxamQxOXFRZkplR3FxazdMODl5blhZYVFIOVdVSksrNTZUaFhacTVz?=
 =?utf-8?B?OVZoWHNkQ05reThFclM1SG5iVXRxSHlNZ3J4aVY5MUtKRDdxbkp4bDBDdDBo?=
 =?utf-8?B?RlBoeElvME9YTmN1TC9Ja1h0amdoSnppaXFZcXI0cWs2Q01PYS9lZFJlSDE2?=
 =?utf-8?B?N0QyZ000czl3RVd5WmN4QTVCM1VlRTRQS3VrRXpYSzJFRFQ3bncveVRqcUZT?=
 =?utf-8?B?T2xsNE9TWjlnekxqYzBGd3ovQ1FLM21LcWNhdnZ3Rk9UWU1tTTRVQzVSc2JT?=
 =?utf-8?B?MHIvWFd5Yndlc0pRM0FkQmc1ZlV4Zi84VmNvZjFHbWxVTDZYc3VwWm1EUGtJ?=
 =?utf-8?B?NnJhUkU4V25ReTBvMnBuejdvd0VMNmx1WHNQQ0FXeHRGTXZPVTFCdFJjV0V5?=
 =?utf-8?B?MlZrV1ZEMlNWZUhwRjA2bVZNM0QxVyt3SFJrL2t2MzlydzVUZFBndXBLTnBj?=
 =?utf-8?B?bUM2T1A2eE43bTYwZ25kWVBRd3g5bWh2ZkN4b1hJek5vWHFTVThBN2tzUVZG?=
 =?utf-8?B?NUVQTUd4ZjVaem1sY25sQ0YxZ015UHdpdUJhaC9oenNEdlRTOXZvREtZbktU?=
 =?utf-8?B?UUFzUlNUNGZreTFJeXp5aHEzMjlpMEk1cXg0NE1XZCtpQVVFanNIOUwvc0s4?=
 =?utf-8?B?WnpNRUpRdHZyU0s0aXpTVjg1M3prUit1ZDVINSt3UmJ1YTkzWngrcGFsVEdM?=
 =?utf-8?B?Z1ZJR1p0TlBHM0tud1ZzVFltMTJPeG0vMXBDRE43eUJtdy9vaGRSYW14K09x?=
 =?utf-8?B?OW1GcC9VMVRSV25rU3JHNGpGZFpsVzY1cm81QTR0bHpXZDF2Q281VWpNYm5n?=
 =?utf-8?B?bUxsNDhiTkxEd2tFNlNaUHFVdHdkRWFWUnQ5WWl6K2pCdEVqWjc2cG91UEtM?=
 =?utf-8?B?WWtka0dzbzQwd3lHejYyZVpxZjlvN0tuK05oYjNSbjZpYndTUVdIRDZzOEpQ?=
 =?utf-8?B?bFBaT2Q2TnBiSnJWbTZRZm12MzI0WnkycDQ1djdCelI1aEwvd3g4Z3hkbW5q?=
 =?utf-8?B?Z3A1aFZrZm50enRKa3Q0UjMrZzRjOFhTYWcrQTk1NTJqdjdzczl1VC93MGQ4?=
 =?utf-8?B?d2FOMGhJam9zaXAzUlYxR0tINEpwZnNka2dkNDJvLy8zcFRUL2dNY0g3Ynlq?=
 =?utf-8?B?a0RoNTNrbGZreXF4bm10ZjBZUnMrN3Qyb3ZTZ3NhMk1VUkY4T1NuMFlsUFVO?=
 =?utf-8?B?WXZvK3liSzVZWDFuZnRuMUZHTXlnZ2s1WjlnOGI4cEFyV1lUdUowcUg4dTRU?=
 =?utf-8?B?a3B1TnZ6L05UWGdRWXBvNUZtUjkzZzZaM0p0eC9WcmM3M1NkdEk3RnNOUzBK?=
 =?utf-8?Q?LhocB8BacOnlzIuTDULrbgJ7y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYSPR06MB7068.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250683e9-2191-4c8a-5c74-08ddaefe83f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 06:57:11.5419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11eDpDQk82/8QnZqJlr2s7JXgmuOACVooioxUnZ+RcQ5r6eIn4UCoK9HAGJYGR8XusfXS/OFWdSBKHTAlE+Mcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6206
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHJ1bnRpbWUgdHVuaW5nIGluIHRoZSBBc3BlZWQgU0RIQ0kg
ZHJpdmVyLg0KPiA+IFVzaW5nIHRoZSB0aW1pbmcgcGhhc2UgcmVnaXN0ZXIgdG8gYWRqdXN0IHRo
ZSBjbG9jayBwaGFzZSB3aXRoIG1tYw0KPiA+IHR1bmluZyBjb21tYW5kIHRvIGZpbmQgdGhlIGxl
ZnQgYW5kIHJpZ2h0IGJvdW5kYXJ5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ29vbCBMZWUg
PGNvb2xfbGVlQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9tbWMvaG9z
dC9zZGhjaS1vZi1hc3BlZWQuYyB8IDY4DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXNwZWVkLmMNCj4gPiBiL2RyaXZl
cnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXNwZWVkLmMNCj4gPiBpbmRleCAwMWJjNTc0MjcyZWIuLjVl
NWFlMTg5NDQ1NiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFz
cGVlZC5jDQo+ID4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYw0KPiA+
IEBAIC0yNCw2ICsyNCw3IEBADQo+ID4gwqAjZGVmaW5lIEFTUEVFRF9TRENfUEhBU0XCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweGY0DQo+ID4gwqAjZGVmaW5lwqDCoCBBU1BFRURfU0RD
X1MxX1BIQVNFX0lOwqDCoMKgwqDCoMKgwqBHRU5NQVNLKDI1LCAyMSkNCj4gPiDCoCNkZWZpbmXC
oMKgIEFTUEVFRF9TRENfUzBfUEhBU0VfSU7CoMKgwqDCoMKgwqDCoEdFTk1BU0soMjAsIDE2KQ0K
PiA+ICsjZGVmaW5lwqDCoCBBU1BFRURfU0RDX1MwX1BIQVNFX0lOX1NISUZUwqAgMTYNCj4gPiDC
oCNkZWZpbmXCoMKgIEFTUEVFRF9TRENfUzFfUEhBU0VfT1VUwqDCoMKgwqDCoMKgR0VOTUFTSygx
NSwgMTEpDQo+ID4gwqAjZGVmaW5lwqDCoCBBU1BFRURfU0RDX1MxX1BIQVNFX0lOX0VOwqDCoMKg
wqBCSVQoMTApDQo+ID4gwqAjZGVmaW5lwqDCoCBBU1BFRURfU0RDX1MxX1BIQVNFX09VVF9FTsKg
wqDCoEdFTk1BU0soOSwgOCkgQEANCj4gLTM3NSw2DQo+ID4gKzM3Niw3MiBAQCBzdGF0aWMgdm9p
ZCBhc3BlZWRfc2RoY2lfcmVzZXQoc3RydWN0IHNkaGNpX2hvc3QgKmhvc3QsIHU4DQo+ID4gbWFz
aykNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc2RoY2lfcmVzZXQoaG9zdCwgbWFzayk7DQo+ID4gwqB9
DQo+ID4NCj4gPiArc3RhdGljIGludCBhc3BlZWRfc2RoY2lfZXhlY3V0ZV90dW5pbmcoc3RydWN0
IHNkaGNpX2hvc3QgKmhvc3QsIHUzMg0KPiA+ICtvcGNvZGUpIHsNCj4gPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3Qgc2RoY2lfcGx0Zm1faG9zdCAqcGx0Zm1fcHJpdjsNCj4gPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgYXNwZWVkX3NkaGNpICpzZGhjaTsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
YXNwZWVkX3NkYyAqc2RjOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkZXZpY2UgKmRldjsN
Cj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHZhbCwgbGVmdCwgcmlnaHQsIGVkZ2U7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHdpbmRvdywgb2xkd2luZG93ID0gMCwgY2VudGVyOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoHUzMiBpbl9waGFzZSwgb3V0X3BoYXNlLCBlbmFibGVfbWFzaywgaW52
ZXJ0ZWQgPSAwOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBkZXYgPSBtbWNfZGV2KGhvc3Qt
Pm1tYyk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgcGx0Zm1fcHJpdiA9IHNkaGNpX3ByaXYoaG9zdCk7
DQo+ID4gK8KgwqDCoMKgwqDCoMKgc2RoY2kgPSBzZGhjaV9wbHRmbV9wcml2KHBsdGZtX3ByaXYp
Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoHNkYyA9IHNkaGNpLT5wYXJlbnQ7DQo+ID4gKw0KPiA+ICvC
oMKgwqDCoMKgwqDCoG91dF9waGFzZSA9IHJlYWRsKHNkYy0+cmVncyArIEFTUEVFRF9TRENfUEhB
U0UpICYNCj4gPiArQVNQRUVEX1NEQ19TMF9QSEFTRV9PVVQ7DQo+ID4gKw0KPiA+ICvCoMKgwqDC
oMKgwqDCoGVuYWJsZV9tYXNrID0gQVNQRUVEX1NEQ19TMF9QSEFTRV9PVVRfRU4gfA0KPiA+ICtB
U1BFRURfU0RDX1MwX1BIQVNFX0lOX0VOOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAvKg0K
PiA+ICvCoMKgwqDCoMKgwqDCoCAqIFRoZXJlIGFyZSB0d28gd2luZG93IHVwb24gY2xvY2sgcmlz
aW5nIGFuZCBmYWxsaW5nIGVkZ2UuDQo+ID4gK8KgwqDCoMKgwqDCoMKgICogSXRlcmF0ZSBlYWNo
IHRhcCBkZWxheSB0byBmaW5kIHRoZSB2YWxpZCB3aW5kb3cgYW5kIGNob29zZQ0KPiA+ICt0aGUN
Cj4gPiArwqDCoMKgwqDCoMKgwqAgKiBiaWdnZXIgb25lLCBzZXQgdGhlIHRhcCBkZWxheSBhdCB0
aGUgbWlkZGxlIG9mIHdpbmRvdy4NCj4gPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiArwqDCoMKg
wqDCoMKgwqBmb3IgKGVkZ2UgPSAwOyBlZGdlIDwgMjsgZWRnZSsrKSB7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChlZGdlID09IDEpDQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnZlcnRlZCA9DQo+IEFTUEVFRF9TREhD
SV9UQVBfUEFSQU1fSU5WRVJUX0NMSzsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHZhbCA9IChvdXRfcGhhc2UgfCBlbmFibGVfbWFzayB8IChpbnZlcnRlZCA8PA0K
PiA+ICtBU1BFRURfU0RDX1MwX1BIQVNFX0lOX1NISUZUKSk7DQo+ID4gKw0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBmaW5kIHRoZSBsZWZ0IGJvdW5kYXJ5ICovDQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAobGVmdCA9IDA7IGxlZnQgPCBBU1BF
RURfU0RIQ0lfTlJfVEFQUyArIDE7DQo+ID4gK2xlZnQrKykgew0KPiANCj4gQml0IG9mIGEgbml0
LCBidXQgbWF5YmUgYGxlZnQgPD0gQVNQRUVEX1NESENJX05SX1RBUFNgIHJhdGhlciB0aGFuICsg
MT8NCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpbl9waGFzZSA9IHZhbCB8IChsZWZ0IDw8DQo+ID4gK0FTUEVFRF9TRENfUzBfUEhBU0VfSU5f
U0hJRlQpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgd3JpdGVsKGluX3BoYXNlLCBzZGMtPnJlZ3MgKw0KPiA+ICtBU1BFRURfU0RDX1BIQVNFKTsN
Cj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAoIW1tY19zZW5kX3R1bmluZyhob3N0LT5tbWMsDQo+IG9wY29kZSwgTlVMTCkpDQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgYnJlYWs7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiAr
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIGZpbmQgdGhlIHJpZ2h0IGJv
dW5kYXJ5ICovDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAocmlnaHQg
PSBsZWZ0ICsgMTsgcmlnaHQgPCBBU1BFRURfU0RIQ0lfTlJfVEFQUw0KPiArDQo+ID4gKzE7IHJp
Z2h0KyspIHsNCj4gDQo+IDw9IGFnYWluIGhlcmUgaWYgeW91IGFncmVlLg0KPiANCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGluX3BoYXNlID0gdmFs
IHwgKHJpZ2h0IDw8DQo+ID4gK0FTUEVFRF9TRENfUzBfUEhBU0VfSU5fU0hJRlQpOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgd3JpdGVsKGluX3Bo
YXNlLCBzZGMtPnJlZ3MgKw0KPiA+ICtBU1BFRURfU0RDX1BIQVNFKTsNCj4gPiArDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAobW1jX3NlbmRf
dHVuaW5nKGhvc3QtPm1tYywNCj4gb3Bjb2RlLCBOVUxMKSkNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ICsNCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgd2luZG93ID0gcmlnaHQgLSBsZWZ0Ow0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfaW5mbyhkZXYsICJ0dW5pbmcgd2luZG93ID0gJWRc
biIsIHdpbmRvdyk7DQo+IA0KPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIGRldl9kYmcoKSByYXRo
ZXIgdGhhbiBkZXZfaW5mbygpLiBUdW5pbmcgZGF0YSBpcyBub3QNCj4gc29tZXRoaW5nIHRoYXQg
c2hvdWxkIG5vcm1hbGx5IGJlIHByaW50ZWQuIEknZCBhbHNvIHByaW50IHRoZSB2YWx1ZXMgb2Yg
bGVmdCBhbmQNCj4gcmlnaHQsIGZvciByZWZlcmVuY2UuDQpPaywgdGhpcyBzaG91bGQgYmUgZGV2
X2RiZygpIGRlZmluaXRlbHkuIEkgd2lsbCBjaGFuZ2UgdGhpcy4NCg0KPiANCj4gPiArDQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh3aW5kb3cgPiBvbGR3aW5kb3cpIHsN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9sZHdp
bmRvdyA9IHdpbmRvdzsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGNlbnRlciA9ICgoKHJpZ2h0IC0gMSkgKyBsZWZ0KSAvIDIpIHwNCj4gPiAraW52
ZXJ0ZWQ7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiArwqDCoMKg
wqDCoMKgwqB9DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHZhbCA9IChvdXRfcGhhc2UgfCBl
bmFibGVfbWFzayB8IChjZW50ZXIgPDwNCj4gPiArQVNQRUVEX1NEQ19TMF9QSEFTRV9JTl9TSElG
VCkpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHdyaXRlbCh2YWwsIHNkYy0+cmVncyArIEFTUEVFRF9T
RENfUEhBU0UpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBkZXZfaW5mbyhkZXYsICJ0dW5p
bmcgcmVzdWx0PSV4XG4iLCB2YWwpOw0KPiANCj4gZGV2X2RiZygpIGFnYWluLg0KT2ssIEkgd2ls
bCBjaGFuZ2UgdGhpcy4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gQW5kcmV3DQo=

