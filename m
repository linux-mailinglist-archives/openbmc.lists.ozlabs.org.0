Return-Path: <openbmc+bounces-836-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC585C1E77D
	for <lists+openbmc@lfdr.de>; Thu, 30 Oct 2025 06:54:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxtbm1Fg6z2yvv;
	Thu, 30 Oct 2025 16:54:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761803668;
	cv=pass; b=m1BAuJjslHbGMWFycPNAtrl8PkdYSOtsG0DHmvUrHMRg0ooMZDB1YBCbSzmJsMv+z3w7TwLykoeWYeK8PJtb+DGy3U6smee46DnDfjL59dt9iYCCYCFGg+qHcsVIJPpcRFoL/zupspr3EoZGQ55rfgWb9meYPQlLWOqDth92F48hZgCvQX9/gZXOFSide+FybA2TMOcPRCqam3mKiHVYubw4QI9k0ZE8w5yr4f5PpOLLk1KEx1KnzHKhVe2VzoaSV9NCvzc7gPczlDTNb7tALaDaSRwhbTHG4EmILkttnJLxLzZLtJ+xwLizgt0ZK6oZ9/1STnEdjgNAfWVBarpu5w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761803668; c=relaxed/relaxed;
	bh=B+Rute5EbUI5miTKWp/5rVHJjzKz9Gq1NiJ4bCqlJcU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dEPwEvTrRxWE4338P0n/qQVZ54uXNTXMqGlac0FRDZ1w5QUlPp1yP3tAveFsiJjTTteGdEAs6cMKrYpQD7mDfY7f4hRbdEK2tX24fyvZ8AulNtrqHo+1ezPNq+M7bIbbx1qwab3Joor6cQI4JP8qj0mUUXIY6GCBc9lNBaoCjNoBrcZVNbD9cnAo1CSB4eiNpRKOAYxPTFeGaNEaQmQsxbbTRSJSLwBVpBdC1J/z8dP/XsS6dcuXETjDrpc2pTHqyL/fyrOpz7hyZM3k1BJZxpePu22ZcVE1+BqxD5ntmyuSXqqEC/Tb3hUKQcCRQz5P4jk9apNNkg8jOX5yts3c2A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=WH7rHAIl; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=WH7rHAIl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxtbk3YWnz2xsq;
	Thu, 30 Oct 2025 16:54:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCcIq4U19mRXKxNYE0ymzVfwoUGej2m2kaDpmd3dXov7jjZkZpfoWVMZOOVyAEKQjyK9ZKyCAL2q6VrsUpjuKDRBzx8T2P7WapQ5wKwIApQrwX2EHVWGK9P+CSp/5Q+PTdDCYmVHONkGtYpLvVXu/D7yNwLgWfEA2UZcJzjzzD3r4Jr/SB83lK6y/Q/1UxVFo+6mrsQw454cpDxWydxDmwZKproh1APTfmunT3q9CTA6ldbAoxPn9jy1Ghs7PGa72W7CjO/JNukxiqIS6aTKymmHP+BZjOjIYlLe89ZcVPEGFIlmAMSJhLAkpTNPK6keTGEn+Vd3CC+tm9OIjhKtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+Rute5EbUI5miTKWp/5rVHJjzKz9Gq1NiJ4bCqlJcU=;
 b=WbT1BoltzI9VIEYAcgisbAxiW2LFvqnWzMzQl4I/02vhRv5jST3p2l/NsycTKzKT0wnO0CwINMLflySBDxZiiOssvLQOCeFoRb4VLdKoGNgppNvOyCPfE5uu+edNtV9bJdRnq+pNhKPZvCzhVe7DwJWnLFYPgV7B1aCIH3FFlhgt2fBjQv459CwMhrL4p4J3cUgxSmFFAFJJhHWVaUctUNkFjscvOZh27p9gSlT6jb8BNiWeA85SCQWyDERKCex6DCyVl11q+XN3PT5DAjjJL0VaaKP2ixlM6fgx+lz0QoWjx6FlzoY+C1v0sn6775Wz+5qrHhAY5eMw1hWEzRs3Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+Rute5EbUI5miTKWp/5rVHJjzKz9Gq1NiJ4bCqlJcU=;
 b=WH7rHAIli65A8zn5Y/K7RxSnqTEnZU7T/IU/bLutdmkxsNMJjGCMXuAmzJxjbzMJ2QlXGgSosD2ZmVoAcDPvQislUueJzMCVrLI8xe3rwSH/x3xuedLm9G4/vFKr94nwS4wplEFmu/646UrhS/g7fNmkf61eHykeSB1wusgM+gjHGL9oQ2+GxJCoN9+g68lPIEiBr6CzhwxWvXghWxCk751A4CutVupTQPV9m7v13/Hrt/2qroiFT51yP6ZRQWWibco0SkQK6ILr/4e19XrdZGOhjvXBWzpARxBkFy4/iyBrkSMxW8IJL2oN6ofCfdmNBxJXN0xpUpFl9UBLRymdUw==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KL1PR0601MB5598.apcprd06.prod.outlook.com (2603:1096:820:9a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 05:53:55 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9253.018; Thu, 30 Oct 2025
 05:53:55 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject:
 =?big5?B?pl7C0DogW1BBVENIIHY0IDgvOV0gUENJOiBhc3BlZWQ6IEFkZCBBU1BFRUQgUENJ?=
 =?big5?Q?e_RC_driver?=
Thread-Topic: [PATCH v4 8/9] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Index: AQHcRyhCH7zDOQXtTkOMFWnp6NUXRbTXzgwAgAJk+tA=
Date: Thu, 30 Oct 2025 05:53:55 +0000
Message-ID:
 <SEYPR06MB51340DD75653EAC61D724F589DFBA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251027095825.181161-9-jacky_chou@aspeedtech.com>
 <20251028171330.GA1506282@bhelgaas>
In-Reply-To: <20251028171330.GA1506282@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KL1PR0601MB5598:EE_
x-ms-office365-filtering-correlation-id: 391a1223-4275-4a3a-c27d-08de1778b64c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?big5?B?M3BrMXM0YmhWb21XTi9TOGkxVWRtQSt6djdPR2EzWnUrVDVNRng2QXlVZXBuZ2tu?=
 =?big5?B?akNVTFp3S2VCTE12dUcySXdueVRsNHRwSWtEMDlKYzg4enplWlg2Tm5ITDJMM3Jo?=
 =?big5?B?ZTAzNzhaTC9XbTMxY25vQ2EyUGEva1lGSTFDNVAvL29OWnRwcVdFMHNMSTBBTmlv?=
 =?big5?B?MmlUNXAraktJWGFtTU9JaEI2aWZvdjZ2YmxXR2VYQjEyZzlLdHdhVnZ6NlRuQ0cz?=
 =?big5?B?bHpydktScVpQVEt5M0tVb1JzVm1KZzVDU3h0NDJjZXhiOGg3N1NtdnBUcFRNQUE0?=
 =?big5?B?OVYxaCtQbGxBUk80QUJ5OVppNzNHdjBnWlhjaThmS25NQnZwR3A2ZVdtQ29OczNO?=
 =?big5?B?akc4eFQwOHUzbDVSSkVCSVc2SmpZZVNGSHA3cjd5eENKK2g4NThhTXdyOXV4V0lm?=
 =?big5?B?TzVodFYvcUFVMEJVNS9OZElVcWkxMmVzcEQyc1pVazVWSjBaOWNjcXpzOU1qV011?=
 =?big5?B?d2U4c3NtR2Y3ZkZRS2hzZEVvSnFaUnBFU0lTaVJkMlA5RGVpam9GVkpsNU9rSkVJ?=
 =?big5?B?bk92SWNFemNvWTdjNVFCVnBqRU5GSXhzdFZ5ZWVxL1dsaVMveWh4MElMRG9seU80?=
 =?big5?B?U2J6dzdnczBMMDgyMDhjSEt0YmtJYmhpa3YrL3pUWHlsRm5VbUJkZWM2bUtDY3B0?=
 =?big5?B?MDNqcGc4dlZ0bHNkYjFPWHk5N3AvMFR6MkVHcDFhb0VTSUdVWDM5TFpTWENZaE9M?=
 =?big5?B?Tlp3UnBKMTkxRzhyaGlXNE1GMWVjUUhiQVl2M2p6MXY0M2IzQnAya2pqRVRBVGRx?=
 =?big5?B?UERCUnk4OUJDT0Y4UjZWSWluYkJSY1dxT0NsNDArMStwMTcweG9hVDhOTC9meUhh?=
 =?big5?B?UERnckxPZkR2R3RZdU4vVlhmTUJqVHlvWWFWcy9KejQ5Rk1hcURYNzQ3WnB6emEw?=
 =?big5?B?RlJaRjVPRjRTSTY1amRBSkZ0T282ZHdRamJhQTJ4bThlZnoyNi9vRnBlZjhTeVU0?=
 =?big5?B?bmFCd21LVkZzUlR4L2UwV0Z1NnRJM0xydjNZTHRMaDYyRVFGRzFJd2Q1R2ZkM2JW?=
 =?big5?B?cGd0ME5rSTVyamF2WmIvalRJYURzTEVZWlN0eU9NM2p5YlkyUDRsTGVkaGZoM0lG?=
 =?big5?B?Z0V2WEtQWVByZVVmY3V3OEhmaWM3Z2Rkc3p0MlVXVXREMXo0KzNQTVNGQmZYaHdP?=
 =?big5?B?NVVaV2c4S1pxdlN2T1JOWjNrWjUwRWRIb2ZOK2I3M1J0cWhya3NVVStjbmdQZ0JW?=
 =?big5?B?akNVWUpXNDIxY25VRGNiNkcyVC9hZTk4SkR3eXNQbXJhTnpxckhwU3Z6ekNiSzJl?=
 =?big5?B?cTRkWVd6NC9UUEFvTlRKUUhqajJPSVJOUEVCZFJHYWtaRmZQMnM3ajZFVHR6dUdm?=
 =?big5?B?cmVTbTMvWG43d3J6QTY5ZGthYXRiajdDRFR6ZHFSWGdYSDZFeldpT09rS1dvYXFB?=
 =?big5?B?cE9HOUc1N2E3UVA2V0cwN3ovaEJFSW54VmdvTFphKzh2ay9TblNTNk1qcjFIQkUz?=
 =?big5?B?M3RoTzNmUEhYMXFWOW1EVmdaRTN2OG8vWmg5Yjg0R2tXZ1QrNzJPcDJYbDBWcjV2?=
 =?big5?B?QWJvZkl5cVNJTEdqVG1EZWxXMG1naEhIeXR6VWpoVEsrYmZQZmpiT2g5MVIwYzI5?=
 =?big5?B?cGVXL2V2czNCYmorbCtqdkhZTURIV203RE00eUJ0UEQrSU1KSE14Y0oyVGUwc1Zz?=
 =?big5?B?ZTZkSFV3RkE3cHliQzRtbG1PTC8xQXBnajFFWFhSRjlpYSs5Tm9BL1hNRndOTUJo?=
 =?big5?B?ZlRWRnhVNXdsWm82M0prc2lQTHg2NHlQYnBOK0ttVHFVaXRZV1J5V3hKL2ZvSEZZ?=
 =?big5?B?MmZJdnNBNURTYmtSNVJzQ2s0RUYxcVUzam5teG4rVnMvVWJYSGxzc0dhbXduYTZP?=
 =?big5?B?L3EzV1hVdlByU0tEOTBjQTcyRG1CR3EwK210WWZiL2xEdUQ2OEJ4REdZTlhPMWpv?=
 =?big5?Q?SiAVjlULAleYYYflFV/zmyXGkZ3swtEEJLpJPhKOGN4F0MAl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?aCtmdm1yd3BhV3VpaUlya2FhZGlzTC9FZk52bW1jWDd4eHhWZDVNNTVzZ1hYdDBX?=
 =?big5?B?VE1QNDR2VHNUOXVUT3cyTUF5YVE0ZWtrdCtVc2pqOUVYRmNkYVQyQjBWeUpYbkM0?=
 =?big5?B?RVFLdFYyemxUeWlRZjRTQ0d2RGx1RlQ2cXVSMkJqZElLQUh0N29EbWRqcll3Q1hE?=
 =?big5?B?OFFFWk5SNUFxaW50UUdVK3dnSE1uV0c4ZnRPb054TVQrVEhFS3U2Um14dDJwMnV0?=
 =?big5?B?akxKZDE5T0JDT0p6VmhoRG9vZWtPSUk1ZFZVU0FYS3AwUHFzb2V2VHpsR0VYUEM5?=
 =?big5?B?UWxGZDJtenc1ck1nWm1ycDUvNkd4bmRwZW5tZzZEZ25iL1dTNVZiWnBZekRJQnJr?=
 =?big5?B?UWpDTE83MStzOTMrQ2xqeGZaanpwdzg1M2pyaHVuRThUL0h1Rlk1NUdoRnRrd0k4?=
 =?big5?B?ajNycWVZNUxVZGVuc21TWEttQXlDKzR3dnFuNi9FV0ZnR3JOZWZpQkVYakVSakF5?=
 =?big5?B?VytrRVF4cyt3M2dHQWFRRHVrMFZtUDA1ZFBMN1k3SUVVbXlERGp2VnNSSTQ5T25n?=
 =?big5?B?N0RjTmxoK3BUcmk5U20zOWJpVksyVVlOYjBCeXpvNkxEc3NVdGM0N1JwRW9xRDI5?=
 =?big5?B?LzFVTmJoZStITTNzL0hRcTVnVUFOMUFCMmRucE5HUmVlN0Z3R3dXUFE3QUIxVFZ4?=
 =?big5?B?Z1M5RXVTWE1RVU5tTUpKRU1MdHRJSGdGemlEQjg3OXppdlM5OTdBL0o3cW5Hd0Zk?=
 =?big5?B?ZXdpdzNCL1QyUDBmbTVDT1AzcG1TdUQvekVYdmZyV0dhL0NieTJYaEI2MFFMV3B1?=
 =?big5?B?blRrVVdFWTYyWnR6aVpPM0tUR2Z2dkRxZ3hoTExKYXQ2MEc4eDNaZVBwMGZCTWpD?=
 =?big5?B?TGJJbzQ2dURXZE5sd2dDNDk3M3JMQkkyZUQrS0ZDenFNcXVFZmd6UXhKbCtzYmN6?=
 =?big5?B?dDh6bjhlZDB2cHEwUGdpMnFQOGhWNlQwb0dHTjN6bVMrMFlHc3BSRFk4WHFTNU1h?=
 =?big5?B?NXdpd1VPMkkrNTdHZVUrVkxqb0tldDRtRlkwRVdkK3E0bFZWZUxLaUJtVjIzZ3hP?=
 =?big5?B?SXN2NVVaVWhubEpBa3N3ODFXYmJ3Qk9pWXZHM3pxYXp2QzJVQTBON2N5dHIrdjFp?=
 =?big5?B?WDFDWU80L1ZIOTFwU09wRW5pNXgxdGFxRzlHWmpNUUZDT1NUdVl6RWg2QmowSzVv?=
 =?big5?B?Tyt5UTRpQkJNSkZIZ3F0SVI0ZHRIVENkWGhwV1B2amgxN2c3TUlZTjlnZnVNb2Q3?=
 =?big5?B?WFNRSytCSUhUY1VBVitTWXBQcklkOHpNL3MxRkFiMmJhYzdDMHJ4TjZWU2NwZjVC?=
 =?big5?B?Y01pSzVHLzR3K1pDZkI0RFpRNnJkUTZzR20xRG9ZanpQRE1FUGJ4blI2aXBoQy9G?=
 =?big5?B?OEpIT0VSamRJT2EyemZzd3FRcG9uZHRHTkUxY3BDeXNNdDQ1R3dzdUgraTlLaGFI?=
 =?big5?B?OGJKREJnaTI4RTlZUXpHNVRKSXFhNTZNeU9HQ0RYMm1VaHVjNlhoMStjUkIwUmhC?=
 =?big5?B?QTRHd29BUDJyTy9sMGN0UUNHSW1OTzFVcTVLOFZoV3E1eTN5dXNLZnBJelVIUzRS?=
 =?big5?B?TnEzK2kzK08xZmFZdUo2Rk5EU1gwaGdad2gxb2UxMXk1a0JrYm83bkxzS2s2cm1B?=
 =?big5?B?NW9FZlAyS2pMU1Rod0ZDWVJySVg5Ny9rQi9UcklSUmRFdkh2QXU5ZHN3cEMxM3J2?=
 =?big5?B?bCt6WEpHUjBhaytlV0NoQSttSTkybUl5MTBvVzFtZDJGSUw0Sk5pY0g1YjJjL0hB?=
 =?big5?B?dGpwRTZJek9IcFNkY1JDR2d0QmVZMmE0amlzMDJoczZQN21kakZKaHQ3Y1JhSTY3?=
 =?big5?B?eDZEM051T2hsZEZacXA4b2UzY0JRNi9ZM1JJa0ZtVGhPWnhLd3RWMGVYaWxrQWxo?=
 =?big5?B?WnIrV1RzLzY2MHZsVWlKTVB2NEtrbjR3ZldoaUU1NWxheG0zUmw2UHRTN1V6UmV4?=
 =?big5?B?RU1wN09CMThsdHdXM3ZwOUE1Wi9YUXVlVlVCa1FQV2ZuRGJwQXFzTHc1Zlg1dmlX?=
 =?big5?B?OEFkUHJJKzQwejBuZmR5UGw5MThkK0llSzVpZFJjYUtDL2xGaTN1NUk5eXV1QnZH?=
 =?big5?Q?aLD43Vm2SLy8Ev/F?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 391a1223-4275-4a3a-c27d-08de1778b64c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 05:53:55.4806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tUYWb67KgUc0PvZTAjYA3jiFi480Q+FScz+ef8T8JdtvpPmdY337qLNeaZIOfHUHQqFyPmvy/GvK79YZG/WUev3g9u0/NI3k8PRyxYwroOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5598
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgQmpvcm4sDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4NCg0KPiA+ICtjb25maWcgUENJ
RV9BU1BFRUQNCj4gPiArCWJvb2wgIkFTUEVFRCBQQ0llIGNvbnRyb2xsZXIiDQo+ID4gKwlkZXBl
bmRzIG9uIEFSQ0hfQVNQRUVEIHx8IENPTVBJTEVfVEVTVA0KPiA+ICsJZGVwZW5kcyBvbiBPRg0K
PiA+ICsJZGVwZW5kcyBvbiBQQ0lfTVNJDQo+ID4gKwlzZWxlY3QgSVJRX01TSV9MSUINCj4gPiAr
CWhlbHANCj4gPiArCSAgRW5hYmxlIHRoaXMgb3B0aW9uIHRvIHN1cHBvcnQgdGhlIFBDSWUgY29u
dHJvbGxlciBmb3VuZCBvbiBBU1BFRUQNCj4gPiArCSAgU29Dcy4NCj4gPiArDQo+ID4gKwkgIFRo
aXMgZHJpdmVyIHByb3ZpZGVzIGluaXRpYWxpemF0aW9uIGFuZCBtYW5hZ2VtZW50IGZvciBQQ0ll
DQo+ID4gKwkgIFJvb3QgQ29tcGxleCBmdW5jdGlvbmFsaXR5LCBpbmNsdWRpbmcgaW50ZXJydXB0
IGFuZCBNU0kgc3VwcG9ydC4NCj4gDQo+IE1heWJlICJJTlR4IGFuZCBNU0kgc3VwcG9ydCIsIHNp
bmNlIE1TSSBpcyBhbiBpbnRlcnJ1cHQ/DQo+IA0KDQpBZ3JlZWQuDQoNCj4gPiArLyogQ29tcGxl
dGUgc3RhdHVzICovDQo+IA0KPiAiQ29tcGxldGlvbiINCj4gDQoNCkFncmVlZC4NCg0KPiA+ICtz
dGF0aWMgaW50IGFzcGVlZF9hc3QyNzAwX2FoYl9yZW1hcF90b19iYXIoc3RydWN0IGFzcGVlZF9w
Y2llICpwY2llKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgcmVzb3VyY2VfZW50cnkgKndpbiwgKnRt
cDsNCj4gPiArCXN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSA9IHBjaWUtPmhvc3Q7DQo+
ID4gKw0KPiA+ICsJLyogQ29uZmlndXJlIEFIQiByZW1hcHBpbmcgdG8gQkFSIG9uIEFTVDI3eDAu
DQo+ID4gKwkgKiBUaGUgQkFSIHJlZ2lvbiBpcyBIVy1maXhlZCBpbiBBU1QyN3gwLCB0aGVzZSBC
QVJzIHdpbGwgYmUgZmlsbGVkDQo+ID4gKwkgKiBpbiB0aGUgcmFuZ2VzIG9mIHBjaWUgbm9kZSBp
biBEVC4NCj4gPiArCSAqLw0KPiANCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgIkhXLWZpeGVk
IiBtZWFucyBoZXJlLiAgSXQgbG9va3MgbGlrZSB5b3UncmUgd3JpdGluZw0KPiBob3N0IGJyaWRn
ZSB3aW5kb3cgYWRkcmVzc2VzICh0aGF0IGNhbWUgZnJvbSBEVCkgdG8gdGhlIGhhcmR3YXJlLiAg
VGhhdA0KPiBzb3VuZHMgbGlrZSB0aGV5J3JlIG5vdCBhY3R1YWxseSAiZml4ZWQiIGJ1dCBwcm9n
cmFtbWFibGUuDQo+IA0KPiBIb3N0IGJyaWRnZSB3aW5kb3dzIGFyZSBub3QgQkFScyB0aGVtc2Vs
dmVzLiAgTWVtIHNwYWNlIGZvciBkZXZpY2VzIGJlbG93DQo+IHRoZSBob3N0IGJyaWRnZSBpcyBh
bGxvY2F0ZWQgZnJvbSB0aGUgd2luZG93cywgYW5kIHRoZSBhZGRyZXNzZXMgYXJlDQo+IHByb2dy
YW1tZWQgaW50byBCQVJzIG9mIHRob3NlIGRvd25zdHJlYW0gZGV2aWNlcy4NCj4gDQoNCkkgY2hl
Y2tlZCBvdXIgZGVzaWduLCBhbmQgdGhlcmUgd2VyZSBlcnJvcnMgaW4gbXkgZGVzY3JpcHRpb24g
YW5kIHVzYWdlLg0KSSB3YW50IHRvIGNvbmZpZ3VyZSB0aGUgIlBDSSBhZGRyZXNzIiBmcm9tIHRo
ZSByYW5nZSBwcm9wZXJ0eSBvZiBkdHMuDQpUaGVyZWZvcmUsIEkgYWxzbyBnZXQgdGhlIHdyb25n
IGFkZHJlc3MsIGhlcmUgd2lsbCBnZXQgdGhlIHNvYyB2aWV3IGFkZHJlc3MuDQpJIHdpbGwgbW9k
aWZ5IG91ciBjb2RlIGFuZCBteSBkZXNjcmlwdGlvbiBpbiBuZXh0IHZlcnNpb24uDQoNCj4gTXVs
dGktbGluZSBjb21tZW50IHN0eWxlOg0KPiANCj4gICAvKg0KPiAgICAqIENvbmZpZ3VyZSAuLi4N
Cj4gICAgKi8NCj4gDQo+IFdyYXAgdG8gZmlsbCA3OCBjb2x1bW5zLCBvciBhZGQgYmxhbmsgbGlu
ZXMgYmV0d2VlbiBwYXJhZ3JhcGhzLg0KPiANCg0KQWdyZWVkLg0KDQo+ID4gKwlyZXNvdXJjZV9s
aXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUod2luLCB0bXAsICZicmlkZ2UtPndpbmRvd3MpIHsNCj4g
PiArCQlzdHJ1Y3QgcmVzb3VyY2UgKnJlcyA9IHdpbi0+cmVzOw0KPiA+ICsNCj4gPiArCQlpZiAo
cmVzb3VyY2VfdHlwZShyZXMpID09IElPUkVTT1VSQ0VfTUVNICYmDQo+ID4gKwkJICAgICEocmVz
LT5mbGFncyAmIElPUkVTT1VSQ0VfTUVNXzY0KSkgew0KPiA+ICsJCQl3cml0ZWwoQVNQRUVEX1JF
TUFQX0JBUl9CQVNFKHJlcy0+c3RhcnQpLA0KPiA+ICsJCQkgICAgICAgcGNpZS0+cmVnICsgQVNQ
RUVEX0gyWF9SRU1BUF9ESVJFQ1RfQUREUik7DQo+ID4gKwkJCXJldHVybiAwOw0KPiA+ICsJCX0N
Cj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gLUVOT0RFVjsNCj4gPiArfQ0KPiA+ICsNCj4g
PiArc3RhdGljIGludCBhc3BlZWRfYXN0MjcwMF9zZXR1cChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgYXNwZWVkX3BjaWUgKnBjaWUgPSBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YShwZGV2KTsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IHBjaWUtPmRldjsNCj4g
PiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJcGNpZS0+Y2ZnID0gc3lzY29uX3JlZ21hcF9sb29r
dXBfYnlfcGhhbmRsZShkZXYtPm9mX25vZGUsDQo+ID4gKwkJCQkJCSAgICAiYXNwZWVkLHBjaWVj
ZmciKTsNCj4gPiArCWlmIChJU19FUlIocGNpZS0+Y2ZnKSkNCj4gPiArCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIFBUUl9FUlIocGNpZS0+Y2ZnKSwNCj4gPiArCQkJCSAgICAgImZhaWxlZCB0
byBtYXAgcGNpZWNmZyBiYXNlXG4iKTsNCj4gPiArDQo+ID4gKwlyZWdtYXBfdXBkYXRlX2JpdHMo
cGNpZS0+Y2ZnLCBBU1BFRURfU0NVXzYwLA0KPiA+ICsJCQkgICBBU1BFRURfUkNfRTJNX1BBVEhf
RU4gfCBBU1BFRURfUkNfSDJYU19QQVRIX0VOIHwNCj4gPiArCQkJICAgQVNQRUVEX1JDX0gyWERf
UEFUSF9FTiB8IEFTUEVFRF9SQ19IMlhYX1BBVEhfRU4NCj4gfA0KPiA+ICsJCQkgICBBU1BFRURf
UkNfVVBTVFJFQU1fTUVNX0VOLA0KPiA+ICsJCQkgICBBU1BFRURfUkNfRTJNX1BBVEhfRU4gfCBB
U1BFRURfUkNfSDJYU19QQVRIX0VOIHwNCj4gPiArCQkJICAgQVNQRUVEX1JDX0gyWERfUEFUSF9F
TiB8IEFTUEVFRF9SQ19IMlhYX1BBVEhfRU4NCj4gfA0KPiA+ICsJCQkgICBBU1BFRURfUkNfVVBT
VFJFQU1fTUVNX0VOKTsNCj4gPiArCXJlZ21hcF93cml0ZShwY2llLT5jZmcsIEFTUEVFRF9TQ1Vf
NjQsDQo+ID4gKwkJICAgICBBU1BFRURfUkMwX0RFQ09ERV9ETUFfQkFTRSgwKSB8DQo+ID4gKwkJ
ICAgICBBU1BFRURfUkMwX0RFQ09ERV9ETUFfTElNSVQoMHhmZikgfA0KPiA+ICsJCSAgICAgQVNQ
RUVEX1JDMV9ERUNPREVfRE1BX0JBU0UoMCkgfA0KPiA+ICsJCSAgICAgQVNQRUVEX1JDMV9ERUNP
REVfRE1BX0xJTUlUKDB4ZmYpKTsNCj4gPiArCXJlZ21hcF93cml0ZShwY2llLT5jZmcsIEFTUEVF
RF9TQ1VfNzAsIEFTUEVFRF9ESVNBQkxFX0VQX0ZVTkMpOw0KPiA+ICsNCj4gPiArCWFzcGVlZF9o
b3N0X3Jlc2V0KHBjaWUpOw0KPiA+ICsNCj4gPiArCXdyaXRlbCgwLCBwY2llLT5yZWcgKyBBU1BF
RURfSDJYX0NUUkwpOw0KPiA+ICsJd3JpdGVsKEFTUEVFRF9IMlhfQlJJREdFX0VOIHwgQVNQRUVE
X0gyWF9CUklER0VfRElSRUNUX0VOLA0KPiA+ICsJICAgICAgIHBjaWUtPnJlZyArIEFTUEVFRF9I
MlhfQ1RSTCk7DQo+ID4gKw0KPiA+ICsJcmV0ID0gYXNwZWVkX2FzdDI3MDBfYWhiX3JlbWFwX3Rv
X2JhcihwY2llKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUo
ZGV2LCByZXQsICJmYWlsZWQgdG8gYXNzaWduIEJBUlxuIik7DQo+IA0KPiBUaGlzIGlzIG5vdCBh
c3NpZ25pbmcgKkJBUnMqLiAgQSBob3N0IGJyaWRnZSBkb2Vzbid0IGhhdmUgQkFScyBpbiB0aGUg
UENJIHNwZWMNCj4gc2Vuc2UuICBJdCBtaWdodCBoYXZlIHByb2dyYW1tYWJsZSBhZGRyZXNzIHJh
bmdlcywgYnV0IHRoZSBob3N0IGJyaWRnZSBpcyBub3QNCj4gaXRzZWxmIGEgUENJIGRldmljZSwg
c28gaXRzIHByb2dyYW1tYWJpbGl0eSBpcyBkZXZpY2Ugc3BlY2lmaWMuDQoNCkFzIHlvdSBzYWlk
LCBob3N0IGJyaWRnZSBkb2Vzbid0IGhhdmUgQkFScy4NCkhlcmUgSSB3YW50IHRvIGNvbmZpZ3Vy
ZSB0aGUgIlBDSSBhZGRyZXNzIiB0byBvdXIgZGVzaWduLg0KV2lsbCBtb2RpZnkgdGhpcyBpbiBu
ZXh0IHZlcnNpb24uDQoNClRoYW5rcywNCkphY2t5DQoNCg==

