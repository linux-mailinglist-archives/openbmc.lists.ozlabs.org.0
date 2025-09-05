Return-Path: <openbmc+bounces-596-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 944A7B44B02
	for <lists+openbmc@lfdr.de>; Fri,  5 Sep 2025 02:43:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHyJ909Jbz2yyd;
	Fri,  5 Sep 2025 10:43:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757033000;
	cv=pass; b=iDkhtTopJvyTDPi1+hzDouBhVR10Ivr2u9EAXC4Hddj2jTog4GxpRr8oplD3I/BV5UFwtyND8UtAxi36jTIa3GXJutUsHHo0iyaqOjVtPvyj7HW6LLae8KNrMegcGTZyPpAIOALGv4GqFKVJV+GUVNgr4Z/aleJQAGNanENbrwBR8LF8Z67QrMLl8NbxrHFASyc81PSmKiH1d8A/6QAzuOPKdcFOImU+BX7oBKZoTVwxNFPDG4sSflEeA3XVPzBXqQ5s5iQHzLIs2MieYYto4DbOb+N7C5hi3RuIvoBaDb4WbT/2LNIo312KqdPJ68z4HdNq7y+sQE4aTbZp8iSMbw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757033000; c=relaxed/relaxed;
	bh=cQmCoE5fU3a2J8F9lTTThT7I9/7Ng5Mo13F21Lu/zzo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YSuP5oGvjLfiVvVAhCVyMbzbFOQgX5zw7iPaT9CnUPEsu0jIrxWGRq+enpWtJ9WLZnDT0uBQ/JMiYEx9t2Btw8xSlr9DF/8DL76SAFFELa5jUeGdGql6JJDg1d9N20jKy7e+kaDvFN6hCALqih2RE+OF9+KmrBIsbr8Eu29QKbB0KhaoYs084rCfWZw6RSXXcDG5Vylw1K13+usQlejVbXYWDHZ3k4z4RFu5SKvR5ysi3j85qLZaqX4c/uY72pqoJxlnG1pwvHRyrrF8LjAD4Srql0Bhax9qVwOJrvAlmbVVTB9oTTtVtzWRFL1RsRaHeL4lFBYa4IwU0aReHOCh/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Css0R7dj; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Css0R7dj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHyJ66gJyz2yql;
	Fri,  5 Sep 2025 10:43:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXaywiIoJkBkBEKPYGAdqbbUtoN2zNBEWWtHCVLzXLi0WcaPowkyZGkME08ZayR4pM9zCH2h3lAOpDsdCPZ3JPrU3carTVL3a3aGex55ANnFE+4+XMKmN6tmXpHLgdMM7kPkTHOKYvUZhhVr/wS+IP1k66yDEVz1VEXuAfW11gCkOBx64ouFsvSMYxfqjkP8cOoMXAA/n/Sqx9ONpBeYfrJKNHOVbgv8NzjUGukq8qBsJZ1NgtzQkFsFbm+2yKr+6AA1eK1xEeFzdfBzVeVGt1vtZ5LZAFx5e0z7h6oR0WT/VhT5o9fx8AUUtdXKv0Gg5bR5P3kJGVOoMYSKGeSEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQmCoE5fU3a2J8F9lTTThT7I9/7Ng5Mo13F21Lu/zzo=;
 b=r0kUIMqnUDxXkDoQVTBlZd5vzcRoXodvheWiumxI3N/3uBf4xh4mFBRIL52uG/sFyaGAf7tg80JETH9ZVfyxLrki2LM14HqmIrvxaNugZtIYyoGsIu1iTNBM+8MOsQKN8wstR+B8AlNFyYwrjHd31o+WsWjVSr2gY+OFEJS5LuvgHq5xAhE3hcDoc+ZKMKEkvduKNl2o54xblnVMHjV817XLQFBPEOIAIrGQq9ouwC69KSYPW3FlQ+/lPnWFSLftm1cMEtTpbrxItjWh54tyzoIcPQ1zG19NjYSq+GfJG557WScSit3KP3YRFAHjUmePNrcSrE/1Mily4n4GJHJKfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQmCoE5fU3a2J8F9lTTThT7I9/7Ng5Mo13F21Lu/zzo=;
 b=Css0R7djt2e4+aHr+RMzazs03Vwei9jf72JlJysSkozP3RzSrm22v7WpbGWUCmgKAJ+psBtxon5Jpxxfq1OoPD6InNRxNjtubvwtU+vxj+BolvcuJk4oYBW9Zq6zeDOSZW3Hm0D+2IGD3TeVkEKlf+pGHHvJTGYINqbEyP1TQGu0FVGbA8K7qnXnM5yBly8hNFRaMs8kUQi84bS+JRFMSX9BitUip8fmPe8N5QQcpOJsPCYYgU1VrlHwj1HMNxuQPZ6lkl6+SnnJrBj/ziVC3Nuk6R4lrVHJtpKXZDje2PSHCK+xeiE26ENi9aMkIEpUOWFTLmOc2AdIjDBwwg0BNA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEYPR06MB6862.apcprd06.prod.outlook.com (2603:1096:101:1a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 00:42:55 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 00:42:55 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject:
 =?big5?B?pl7C0DogW1BBVENIIHYzIDA4LzEwXSBQQ0k6IEFkZCBGTVQgYW5kIFRZUEUgZGVm?=
 =?big5?Q?inition_for_TLP_header?=
Thread-Topic: [PATCH v3 08/10] PCI: Add FMT and TYPE definition for TLP header
Thread-Index: AQHcGwWZ7trgU+RIp06LGvatVToprbSCDxcAgAG2knA=
Date: Fri, 5 Sep 2025 00:42:55 +0000
Message-ID:
 <SEYPR06MB51345BF3DAAB8D55B06E2D679D03A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250901055922.1553550-9-jacky_chou@aspeedtech.com>
 <20250903223202.GA1235935@bhelgaas>
In-Reply-To: <20250903223202.GA1235935@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEYPR06MB6862:EE_
x-ms-office365-filtering-correlation-id: e2888a5c-5acc-403a-74c9-08ddec152745
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?big5?B?T0FzQlFOYkl0c1I0WGhIeEpMS0p4a1VnMmc1TTRDY3p3dFhEUG1JV3UrbDVrV01i?=
 =?big5?B?VlpldTF2OGdNT2RqamVPaXJDQWFNQzJETjhVR0lZWkQrNHlrZVovbllDM3pLMFZL?=
 =?big5?B?SEpNbE83NW5aWXFRY2dHQmxQRVhPb1RBTTQ3ZzlhN3VRWnVvaGU3aW95Z2dFUHQw?=
 =?big5?B?RG9QUHRKdHUzVWR1ZURlY25QSFl5K09iYmFoVTZMdkRWN21ReXQ2V0ZHMjcrVWZn?=
 =?big5?B?K2xRM0dWU2hld2Ezc0hRWnFRcEJlelhaY1BCWlZiYWM0Tm9HSDBxMTBxdUxoYnRR?=
 =?big5?B?RWhWajhmSWtJMVpWQ1AzKzN2OEUwdEwwQXhGVHpCZDFnQzBhNXZNbWpVSXhrYk5B?=
 =?big5?B?dkk5cnV4cWlHT25BdXRlbmlzNGQ0QmxBRkdlT1pNNFRnQWttODhGbmFZVUFCcXlT?=
 =?big5?B?cnVGdEtVMThmSzE1bStpL2FLT2s4QkptSmZJR0FFQ3NtSlRRb2tGWGFhejBIRzlQ?=
 =?big5?B?eVpidGVBNWpXcW1pZFdpdzA2cGVYR1FsaTZuN0NBdlczT2lOZm55L1BMU2g2RVhm?=
 =?big5?B?bUIzdDJIKytGdEc3ZVpPUFV3c0R3Y2VWZHRXS2tsUW4wZUUvU1JVMm9ZQXc3SzRt?=
 =?big5?B?UTJJZFE3TXhIVDRVR1VSNkFZZ2tuQ2o5M0NLakNnUitvSUZLYXRqVVRpdmFWS1p5?=
 =?big5?B?bmNnQS9rMkVjRlBNQmthbmR1emlHRlFvS2RzTmhvQzErb2x2M0JaK2dJQXNxRmFx?=
 =?big5?B?MlJ1MEk0Y0hzYjJnbG12bC9iV2ZnZCtwS0dtNTNHV3ZraXFWbytzMlBrRDRWK21I?=
 =?big5?B?MkpFSDRjTVI2bXM3S3JhdGFVSEpZTnFxY09leTEvdXpmdFhZOW5UT1NtL3lIek03?=
 =?big5?B?N2lUdXh1TElvL1lwU005T04xUWJPUE1HT0pJM3RqVjh4azA4TXNZbmpnRjZPT1ph?=
 =?big5?B?VSt2SjZ2NHN3M1MzYzNJempNeHRscHZtK0YzUi8zZDhKV25KeEZONDhTbDVjVUF4?=
 =?big5?B?MUwrYzVFd3VhOTluR3pZaWg5a3NRMGFTVGFRWnl2akxvdHQ0clMvMkR5U2pTQlhw?=
 =?big5?B?NG9lY0haSkRIOHlBMW5lZm5xNWxMSzUyUGVxK0ZNUkMxRTRWNXJOb1B0dFB6NTBw?=
 =?big5?B?bkxtOW5ma3VSb1JNU0ovQ1hVVVpSV05yQ1lYNGdFNCt3Rys5dEszWnBGTlF4ckkx?=
 =?big5?B?Y1ZTaTlhblA3TmsxL2dPa085TkpzaXpaclNsTCsrYnBqTDB3MDZmMFZNdHA5N2gz?=
 =?big5?B?TFhUWlJXd2FDaVpUVEhHN2FNSUkySU8rVEh0SWZsVHF4NlNsZmZialBuMkh4RTZX?=
 =?big5?B?azlHMVhMV3h4d1J5OTZ1Q3dxdnBUTWVPK0hIbzVCVjVvaHhCWW5oa2d2NU13TjIz?=
 =?big5?B?djI5VVNLaTFDa3V4S2hSWDVROWNuZ2pEZlBHaHlNMzVidUxnODVVWGdQbDByajcx?=
 =?big5?B?SmJoV1RvMHFIMjA4MGs2L29XY0R5QTBBaXlaaEphb3NHTmg5d05nZTA1a0c1YzRv?=
 =?big5?B?bnRQNjJnejZkWmNMejRYd25BdjdLeENLUnpQSWVQMDRZcGp5Ny9xVmc5cTR0MmV1?=
 =?big5?B?ZmkxNm1QRFZrTXRsUjV0cEx5Q1Z1REd0MXROY1prUTRqQ2VwWklkaHQ5ZEx2Zi9a?=
 =?big5?B?YWhLTWJ1R0Y2Uk1sdUNmc1JycmMxNnNUZnJoT09XcnFzZXpyd0hLOHVOZktUQUhV?=
 =?big5?B?VlQ5ZjdMRW5KMUNOQWFWM2xKVkFsUktYZ1lQOTUvZWpDRlZNMENCdjR4VjdhYnk0?=
 =?big5?B?ZnM2ZGM1VHp4Sk1ZazdIYk5Kam84cmtoR1N2RlVERDk0WWY3eTF2ZytiS1BaKzZH?=
 =?big5?B?cUtweGV6a3hrcE0xOElYb2tYT2FNWDF1T2g1ZWtlU0VZU1VzaEVKc29nU09MSGg5?=
 =?big5?B?a1d5aXA3NEpIcElibVNxWnVKTEdzSGF4aVJaeHJxYVZRQytLa29JbEU0RFBmemlM?=
 =?big5?B?elpYL3pnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?Qnh4NDhvNHVmUmxUY3RMQjE4WmVGd2xneko2S2gwb3YyZGlHVmhKYmlZZUhQd0Na?=
 =?big5?B?aEp1VDhvQlBiK2x6RFErd1krbTFDUnhPeC9zSmkxM2d4RStEcnFVeXYxVGNxKzFq?=
 =?big5?B?a0lEaHlNUFQzempIQ25DN3B4YTZpN3hkbjFlTGhzNFJ1b1o2S0V3bGpNZzFZYnNQ?=
 =?big5?B?am1VYzJsVW1UTGtDbVFPYVJBeDkvT3gzeXVkZklPaGk0UlFsV0NmZVIvQ2liZUJ1?=
 =?big5?B?R2pZQ1dqdFpQKy93RWRST1RoU01mdnNBU1NMZUNGMHhUL1psSC8zM2UreEFmUU9Q?=
 =?big5?B?bGxGSG9ueUhPRXQyaDZBQXZDR0phWjA4NitkZDJ1YXprb2E0d1hheDExTEdKKzZK?=
 =?big5?B?YlRTZ3ZrazZzK0MwQUFxR3ZnNjVMbWtxZFFxZGg1N2pQWDB0cnJ1Y0c4UHpVYjhK?=
 =?big5?B?cDBQN2hGVUY3c1YxSGVhTURpN2pFY01nSWU0NWowUjAraEFoYTZsN1pxaFhVakdL?=
 =?big5?B?UTVKN0JENUd6V0xWL0VQZmQzcER5bER6aThrM1QycmRYM3VJcXF6OTBQRklvcTlS?=
 =?big5?B?WHNUQ29ZaVREMXdEZHlESkZnM0ZJbi9lSTVVeGs3bnJkNDAwMk9sRUxYU1VjcW9W?=
 =?big5?B?T0NQTis0RG9tUmUrNmxYbUgzWFFCWmo1SFViRnJ1VTQvc1d5QXA3VUNaMG16RFVM?=
 =?big5?B?aUYrK1NqL3VnTWZyZVdLYjJFaFRtRmhsYnhLVlk3cHVYdFNtUzV1QW81cS9qVVBy?=
 =?big5?B?Q3diU0Y5OHA3STJlVlRZTXhLTXlZOHh2c2JGQkF3WXFIR1hsclBrZXc5RjVLTUtU?=
 =?big5?B?WkgxSkZJVjlLYk5jV3NWdG1mZmw2MHhhYUpyK2xGZDQrY0wvdncyRUhXSEhMU1NP?=
 =?big5?B?V2xtVlRjUmJ1M0RpMkJyMzdMQ3JzcVFpK1dFMDFCRWUrcHduMk9LR3RPQXJ1RE9T?=
 =?big5?B?cWFFaDZaRE1QdkxXWUsvM21SQU4zMWRXQ0tFeXR4U1FjYWdMRklLQ3I4K3N3OXRv?=
 =?big5?B?aUZnMTlzUnBNeHZJcTJCNEl3QjRIUnF1S2tGMmthU1IwZnlOcy9uN0ozeEZqaUs0?=
 =?big5?B?bHlFV3ViSG1WYzRyb0Z1amF1V2svVkkwWS9RTDZ2YmNpYzk3ajlsSnhaenNJMDcx?=
 =?big5?B?YTBzUWdEWkpDTUdnQmlIVGFTbEkydFVVT0YrNXVZS2RvMzRKMnFUR3d0dmFvdERi?=
 =?big5?B?Mm1BSkJwN0diOTd1dW9mRXlVdTUyQlF4TDhwNVVJUFRXa1MzZHdHeDBnRStISVVN?=
 =?big5?B?eEZoNC8rWlhLWU1CRFJHVldLZUlsRUJmRVFzQUpHYXVQNU1uMzlXZTc0cmxKVm01?=
 =?big5?B?aHdLNnRRbGY2VFhPNGZWQ3FEYmJPS0pMU3o0TlVsa1Q2dmtwRk5MVGdCSUMxY005?=
 =?big5?B?TTFsem9GUUtreWIwZXFCTDFBQmloWVNpVmlGQ1diUmVwYWx5RGs3cDZoUjFCckNF?=
 =?big5?B?YmxwVFlxSWVGNnMyT0kvTS9SdndERHBOSVltak41djg1NjJjVTVYWWxjNFd2MU50?=
 =?big5?B?YjBTVXNHWGdJVUxqeFd1QUF5Rmh4T0xGOUFENmZDT3hFNlUzN1ltaUY1bUdJdlB0?=
 =?big5?B?YndnWE9UaG10dlJDTkFHN1BJSm9jUDEvMktacWZteWw1emdhdHViTi9haDloS2lk?=
 =?big5?B?blQ2cG1UdUVKZ2Z6Ynlidjk1Y1ZCTmxydVJpM044ejNyanFIUGdGVmUxc1JYTTBK?=
 =?big5?B?UG1EbkI3L1gyRHpaeXRZVHJIWjByRitjRkU3RU5tc1pJb1ZXRk1IczJqZTUxM3pw?=
 =?big5?B?aGlHQmxPRnQvUlZuRUpxOHJTQ1V3U1E3RVJTcXJ4WFllSGQ3emdIU3g2SkdSUTJE?=
 =?big5?B?TzI4V0RlWVlkbG40SzRLenRKZ0YzaFpPcVhVVHlVNmRHcE5IWndvdHBwZXpTOVlG?=
 =?big5?B?cnpDd1g4OU53d1JRajEvOHV1dTBUZWxKQkdnVjVFQ1FFY1EzUXhnWU1peG1LRWx5?=
 =?big5?B?cG95RFpQc085ZFcyYjZ4ajQvSUxjRDVoTzZvWHM3aWJ1akJoQmErYzkrZzJZNUpB?=
 =?big5?B?ZWhWdmZWWXcrNjBiS2t3TC81aEhyT3puTWJIeXNiTVAycHgrdVJmTXVmeHMvcXlO?=
 =?big5?Q?FfYrfkmHu8IFtsod?=
Content-Type: text/plain; charset="big5"
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2888a5c-5acc-403a-74c9-08ddec152745
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 00:42:55.3765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YzTASUzIGvmaHRHjiBHWglRQ+NvTgRpffc8i+CggIONtIz6m4eIAwIU+k0eyS0pfUlk+PXIh/YA9g/VQI9qUO+6BSzEwgyvhS7TYdAKPNKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6862
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgQmpvcm4sDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4NCg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BjaS9wY2kuaCBiL2RyaXZlcnMvcGNpL3BjaS5oIGluZGV4DQo+ID4gMzRmNjVk
Njk2NjJlLi40NWQ0N2Q2YzRmNTMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvcGNpLmgN
Cj4gPiArKysgYi9kcml2ZXJzL3BjaS9wY2kuaA0KPiA+IEBAIC04MSw2ICs4MSwxOCBAQCBzdHJ1
Y3QgcGNpZV90bHBfbG9nOw0KPiA+ICAjZGVmaW5lIFBDSUVfTVNHX0NPREVfREVBU1NFUlRfSU5U
QwkweDI2DQo+ID4gICNkZWZpbmUgUENJRV9NU0dfQ09ERV9ERUFTU0VSVF9JTlRECTB4MjcNCj4g
Pg0KPiA+ICsvKiBGb3JtYXQgb2YgVExQOyBQQ0llIHI1LjAsIHNlYyAyLjIuMSAqLw0KPiANCj4g
UGxlYXNlIHVwZGF0ZSB0byBQQ0llIHI3LjAuDQo+IA0KDQpJIHdpbGwgdXBkYXRlIHRoaXMgaW4g
bmV4dCB2ZXJzaW9uLg0KDQo+ID4gKyNkZWZpbmUgUENJRV9UTFBfRk1UXzNEV19OT19EQVRBCTB4
MDAgLyogM0RXIGhlYWRlciwgbm8gZGF0YSAqLw0KPiA+ICsjZGVmaW5lIFBDSUVfVExQX0ZNVF80
RFdfTk9fREFUQQkweDAxIC8qIDREVyBoZWFkZXIsIG5vIGRhdGEgKi8NCj4gPiArI2RlZmluZSBQ
Q0lFX1RMUF9GTVRfM0RXX0RBVEEJCTB4MDIgLyogM0RXIGhlYWRlciwgd2l0aCBkYXRhICovDQo+
ID4gKyNkZWZpbmUgUENJRV9UTFBfRk1UXzREV19EQVRBCQkweDAzIC8qIDREVyBoZWFkZXIsIHdp
dGggZGF0YSAqLw0KPiA+ICsNCj4gPiArLyogVHlwZSBvZiBUTFA7IFBDSWUgcjUuMCwgc2VjIDIu
Mi4xICovDQo+ID4gKyNkZWZpbmUgUENJRV9UTFBfVFlQRV9DRkcwX1JECQkweDA0IC8qIENvbmZp
ZyBUeXBlIDAgUmVhZA0KPiBSZXF1ZXN0ICovDQo+ID4gKyNkZWZpbmUgUENJRV9UTFBfVFlQRV9D
RkcwX1dSCQkweDA0IC8qIENvbmZpZyBUeXBlIDAgV3JpdGUNCj4gUmVxdWVzdCAqLw0KPiA+ICsj
ZGVmaW5lIFBDSUVfVExQX1RZUEVfQ0ZHMV9SRAkJMHgwNSAvKiBDb25maWcgVHlwZSAxIFJlYWQN
Cj4gUmVxdWVzdCAqLw0KPiA+ICsjZGVmaW5lIFBDSUVfVExQX1RZUEVfQ0ZHMV9XUgkJMHgwNSAv
KiBDb25maWcgVHlwZSAxIFdyaXRlDQo+IFJlcXVlc3QgKi8NCg0KVGhhbmtzLA0KSmFja3kNCg0K

