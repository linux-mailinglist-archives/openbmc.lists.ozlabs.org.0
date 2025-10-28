Return-Path: <openbmc+bounces-826-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97FC13939
	for <lists+openbmc@lfdr.de>; Tue, 28 Oct 2025 09:42:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwkQC4fDkz3dWG;
	Tue, 28 Oct 2025 19:42:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761640931;
	cv=pass; b=NYhux5IF1U5v0aUcKCyW3j+1QWJF4u8kHh5DGaBWbLSo+jxOhNDvg58vFUin4Qo+oDLO2n6FoHi3S592rzhXgGHf1Yw6DjjUe/Sd/O356uL20GU7OBdmhGi/B9Wss719zgeaWRJJo1Z9R8yVS+df0p6awaPQ5K4SDNdVllFfkPVF2SUBqqa5FHT6/Qo9BvjvD7bhoIZ3lEc/YA/JIjsyhIcyDkQKs40+XEYmGw5A1PZd/bh8saP+Y+ThPhQ3MNj+6KjIAoFsjUlaZUl1DHrTSAuQdAuYZXd0EZStHX2iObymZnxxxxNCXbgSByrBlC5jH8t10u/2SDlVdnRLcvDjPw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761640931; c=relaxed/relaxed;
	bh=iSp6QRrqRlVKZyh6PwKddC8WwDrhRhF4BhXP7AwRzIs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kFVWSu+ZOfQ3uAseg1BLyB7jEUlhMzeS48rkvOxDBSJvheNeKHCrxzZJL+14RWjWzPtIMsiMQhsxpgCL/S7LsyPDX2RwmlVn3kd9NPrsxkMMtEM0LzHhYvtchhK79OBTN1YQGs8Dc7v6uLKQffmzvDiWuX0P6ecAn2akyFr4U1n3zYPm5uIhYNi3KfFqgQdTFCJTg/daOefowI1hn4WnPla5hVznXRBAmZw772sYxwOWWIOJz5ZXZw8NGMC4ROWAzv/f8ZpkHFgLoQXokH67N5qDWbpgKneMCsgrVBESfxh22x+De7q28htH0wXh/dFGxrBP/By1CaO/r/PEkS6XMg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=lAh9t5vZ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=lAh9t5vZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwkQ92WwNz3dWF;
	Tue, 28 Oct 2025 19:42:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piFjuaRAJvOSPnkAxWMY8REXl5rVoD5vEATlz2fQiH1wynvYeqnS3YCQXg+SaIXaNTNQt/xI5MrJ9lu7Y7szMCxRLFxnIRgEreptkT/DsrECzLMQTiEL7UVTUAj1/J97hwCb+GcNw7bX9AqZ0uPrgF+XL9DPeDCKSiCKCA8NGttvCdu99azjVOWzw3hYa0XTu2riuH2HkFruAL5WMm0b5y8wzty/kVREYpKywTcjviwXFdl8Vw7Qn9zS8Cgn2K+yL48JC2DvckpukL7l9iuVoUSx7DxzQtqJ7R8RcXwbeQnM4wCH+3tthzfugnOEJLIB/E/MhtoSsZ9x5Jp031Xatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSp6QRrqRlVKZyh6PwKddC8WwDrhRhF4BhXP7AwRzIs=;
 b=pqs70SnZ6xQdEsVcVwOK0QmLa9S4Vn2kJ4S2eq0wsKlUUHO1lCf9Bgo8pXMZd0IDxpOALcSUODqNjsTRGe1y0ZAvyMuVs9GaMngrie5fUA8CsASIIYISuZHO4QOoq12a2fqcCdRfg72bltXRMPaYravPMSPGTkOmC7lSCn60R4FEOiVqK7O7PU17k/pYsxsmHenTBViJDZc/mdufubUVjUEPIK+xYPnpmc2y+T4ubm5lpjICkIVzxV2BmOEYLmOlrFKQiH4LHhbNcponXOV/Yqh2ZgLa5/rUxmPdmD4qZt46S0ZoO7kdnFxEzViKlwCkhBMQfbbsFqdKFsz8hT2asg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSp6QRrqRlVKZyh6PwKddC8WwDrhRhF4BhXP7AwRzIs=;
 b=lAh9t5vZJMn+NNU3x/Cbheyv9FP0gZJVwXeyMlCAgmcgX2NKJUNaarRif0W3gCZ43fvRDArRO/sSnQQAIqGKWd2l1CCN0vU5VorM4Q5mKPKAgeJ7eaBouMEJge5O3Jpzlye23ywG3EsjM2LmP4RxFHHWV7f8j75jlaMuskz31Py71g3YNhKcPkjJHLXTtMFht51SkevfsVrSHURILFNAn9b96X/9Ok8QUxdKFctLm83Xy/qxyYXRpxUw6toXOimtEU/FZsOjs1AENSA+pK6Cq2OPSdxp81YCA81MEoH9Q9mXl1QdOjKQ0LTMtFyYQzHelcVymedKu4kU67sH+KtBKA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEZPR06MB6959.apcprd06.prod.outlook.com (2603:1096:101:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 08:41:39 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 08:41:39 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: [PATCH v4 4/9] ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST#
Thread-Topic: [PATCH v4 4/9] ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST#
Thread-Index: AQHcRyhBkwdEhUYe506wXhLgpJneR7TXMXOAgAAM4lA=
Date: Tue, 28 Oct 2025 08:41:39 +0000
Message-ID:
 <SEYPR06MB5134DA0859EEACE4B308CD159DFDA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
 <20251027095825.181161-5-jacky_chou@aspeedtech.com>
 <20251028-witty-nickel-pig-5bd4bc@kuoka>
In-Reply-To: <20251028-witty-nickel-pig-5bd4bc@kuoka>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEZPR06MB6959:EE_
x-ms-office365-filtering-correlation-id: 2e04c4cf-ad17-4dfb-7b9f-08de15fdd03c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mjl4aUJPcllTQkYxdERrTXo4V3NoWld0M2hmYmVoa0c1UnhGaStjVFozZTdG?=
 =?utf-8?B?aFZQaG5YYWRYd2J1R0dPMk1PZWp3MGVhbUpVNktSRzRnM0RXNHU4SU5ISStP?=
 =?utf-8?B?VTMvNWJVREtPcFc4VDVpY3JnOWJJNTd0MUJENkUwMHFMaXcvN1BvUTFPeHI3?=
 =?utf-8?B?NzJ5VDNmU1ZxMENoekxMRThkdWhuLy9DSllLT0dEb0ZrNWg4ZTNRU1Y1ZVEw?=
 =?utf-8?B?R3gvbVFxVm1YSDcwVUlPK2pUNDk5KytSUGk4QXhPYm5iMDhvOE1lbUFuZG9K?=
 =?utf-8?B?Yi95aWN2VENmVU9vQmYxRWpBajZ2VjRWaHR1QnUrQWRuQkhxUFdCbllZRHJD?=
 =?utf-8?B?aThnLzFUVGlMWkdwVUttcHZmbHRHai9MUUthVkZtajFWYm44QTZDZEFhMG93?=
 =?utf-8?B?MFEwemNXL3BHL3cwTmlKN3BNV2JYeEk2eVZvV0t4RTFzTHRWZmErdHVsb21G?=
 =?utf-8?B?ZDZjNTdhV3JVZUpFL2thSUxUM1RLY0VtakpYYnljelVXdEpwdGcvYmtMZ3Nt?=
 =?utf-8?B?dzZweWJVSy9vVnV3UW9MK2FzcUJlMUJBVVBtQ1VXbE9nNUtWZmVJZllrZGhR?=
 =?utf-8?B?TzQ5M3V2U3VNOTBWaHVKakRHVXphU3ZvVFhaRXFSYXg4bm5xWVJBRmdPRjVX?=
 =?utf-8?B?WkNneFVLRkp5Zi85bkVPVFBDa2xxdVdkK0RDRUlZK3RRR0JZejFqRUFmTkdM?=
 =?utf-8?B?bHRQQUF4QU5HeVRrZkhTQ0o0VkVmemc0bkpDUXN6czgrT1dNRHFjQ3hXRmlJ?=
 =?utf-8?B?TnorYWhqWXE5TThNNjVNVmxoeFVjRXN3Q3FyVUNvK3pHV3l2YlloNDRCUjhk?=
 =?utf-8?B?Q1BJZ3dNd0xlelQvMjZBWTJYV2dSQldMYnFRYytDSWJZNFQwN2dtT3ZJYnNK?=
 =?utf-8?B?SUN5dUtnbjZMRElpaytRaEJSTTk2Nnl2TkQvd1I0emdPWFI4TWNXQzFXNCs2?=
 =?utf-8?B?ZHZVb04zT0ZPRk5HTUVYUy9GUm8vcEQ2WDFnRG5JOWx5OUgrR2tFSFByeVF5?=
 =?utf-8?B?RFNRcCtHT2llM1JLblZYUTFpVWNaOGZVSHZHQ1d3VUJJWlBJWlVBZ0I4M1JT?=
 =?utf-8?B?TW1ka21xYUgzQ0lDYzROS1dUbjI1SldOcTRwcTZQQ3JCYVFtbHljMDhyQXpI?=
 =?utf-8?B?c3ozenFaZytHY01kMUg5cUFhRXlTZDl6ZnZhb2tCRHhlVFc4N3NIWlc1a2o1?=
 =?utf-8?B?TU0vZGdyVHZ0UHBmNk4xMGs2OExmKzBzSnE1bEpyOHk3UzhNa0IzaGxrcVc4?=
 =?utf-8?B?Slc0QzBvc2pBc1NhRW55RXc1cWtRWU02MmN1cGN3WHRNaWhBc25VZUtaVkN6?=
 =?utf-8?B?WEJzbFp4b2pGUHVYbEpsYnoxeFVDVVVXMlBsRHFFa1pCeVNpRTVDMDBZQkwr?=
 =?utf-8?B?azVyTk1NQTlKZzJWRktoQ1g0S3dyYUZsajErYnJTdElkdW02M1BNWDUvVk41?=
 =?utf-8?B?NVB1MzNTT3FhbFh0Qm9EcWZGWTRRVS85anJ1YUI1RVh2VkxVZDNYU256K1Qv?=
 =?utf-8?B?OC92akZ0Mi9rQmtJbFl6M2YyVDIvdUI0U0d5S3cvSTNIWnhPbjZnWmtmT0dI?=
 =?utf-8?B?REN5WTBEUlBHaXRMakpPdGRQbnpWS0pTb2RzZ2FiRjlCS3hqTjQwNEw5QzNl?=
 =?utf-8?B?L1NxVERCUHFTd003b2xoYnJYMDdCcmNueXB1VUxlcktrT2wwbjYwVjJrK0lq?=
 =?utf-8?B?V1E1ZFZ1QlBkR1pZaGppMUdEV29QM3lDc1JkOGdYWWVmVWc5WVprcTZiWmhI?=
 =?utf-8?B?Y3BoWjRaOStISDRESVFUNVZvdUc0Mk9zS2VLMStwVFFvb0JxT2NOaVRRWFlI?=
 =?utf-8?B?ZWNBT0tmSzlzV2VNd2xDNmFjWjFPMzNWdGhDckE1YXR1RWZPbmxmN3VTM29X?=
 =?utf-8?B?c21hT1JSVFZxak12MkZielE2YTJINGZwVmdPSkczcCtldEFpNmVOV3JyWDRS?=
 =?utf-8?B?bllJNEo0Y2RIV0ZHaEdoYm84d0tudkF1REJUQlNPS0x5QVRHVUFoOXVzKzdP?=
 =?utf-8?B?QlllVThYUjBSNDQ1cHNmeVp4aTE0MDN2aXl0bW84VFcvK2thd0VKTGx3c05Q?=
 =?utf-8?Q?wq2pQU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGF3SUlyQ2ZYVzI3MDdiRjRpVThSZHhzYm56R2lWSjc1VUdIMldVTUh3SnV2?=
 =?utf-8?B?Mnk5TUoxUmFCU2FnbnJPcDBBa2NkdFZZYmZUcmxaaVhEZVUvWEQ0YmxoOHg2?=
 =?utf-8?B?NmUwUi9sMGVIYzdJSHVPTU5sRzdRendGQml1VGNET3JweXNjQzhxdHNTaHN2?=
 =?utf-8?B?eGRKNjBsNlVnVFVBeWlHbjdjaXhMYkFvSGpKUXhTYldVaTI1V1pzampoM1R5?=
 =?utf-8?B?cUFWYXE5emx1NFFpSFFKOEF4QzRhRi92Rm9oeDhjOVZzdDdCMmJpWUNDWXVE?=
 =?utf-8?B?bE0zZHp3ZmV2bDhZV3B2R2hibWgzNEEvbDhKa000VGVuWmJLSEcrbEhveDZU?=
 =?utf-8?B?WHVIeTdmKzRYcTJhT2padDdsSXVKSlZrQllkNnJvMUduN01xR0VLNFVWUHlV?=
 =?utf-8?B?UFppL1gvWFB0RmFsNnVQSlk4TFFKSEUwaURiTTRaSEplT3hab1oxRGNxbG9K?=
 =?utf-8?B?ZzduU0ZLVUFBUHJxWmkvM294K3dGa1dOZDFNZ3Rxa3dXMVR3RnNyYnFtM0hD?=
 =?utf-8?B?SkRlZEdvc0J6M0NZRTlJOTdFWXcvV2dqV3YxUW0wTW5CeU5YaUZ1OEprOXR6?=
 =?utf-8?B?eWlsdFlMaThpK1d2SXZWZWZyOVdtNnpiQ0JueGxQUEhSQXBYdE1aaUZVa3FQ?=
 =?utf-8?B?U25xY3p4bVhSbVpvckdQWVBpdU9mWUZiUmVDN1VVWDBwOWdOYjRJUkdBcXh3?=
 =?utf-8?B?VmozUnlNMlg0WEtjbFRSejYzUEpTUFVMSHVqQVdmNEpqNWdsUEdSbWo2RVg2?=
 =?utf-8?B?RkgyVEl4WnpmQ1dKZCs1SEsvRExGVkxXOXVKU2ZpUDFJd3I3emZYSzVkUk0y?=
 =?utf-8?B?L2hSVTFnQ0doQlpSaVRTak10ckFPWUhBOTF3UHF3eWRNMVZ1d2ZmZGIycXlq?=
 =?utf-8?B?WXRydW5RejE0TVplcWJzQzRwUUdQZUFqemxwbU5YcEhWUUd5eTEzU2lKWTJ2?=
 =?utf-8?B?aG5qQXJhZzVmNnUzRStDeldJS1h3UWd1aDl1YTY3L0NFODI3K09iTHhpQ0cx?=
 =?utf-8?B?R3g5enM3MURBNXZoWnA4d21CNHdweHdEdFpyVXAwSXNIb2d5MGN6S0J3UGZk?=
 =?utf-8?B?NTBtM3puYWVOQzQ5N3BldkxJK1pTZitOMUNjdzh0eVB5VzhVZTloeWwwZlZr?=
 =?utf-8?B?YVdQZjUvekFpVTluYWF1QVlaaUozQjJ6UGxDU0VIY3hWbUxuZSs3RWFQdlly?=
 =?utf-8?B?VndTVzVZejRUZW1FbElOa1hxanFPcmJjZ0dLZVRLZDZ0VGVsK0o1UlVDQmIw?=
 =?utf-8?B?Z0V1MkJSb2pXNW5XUG02U3Q3aERnMVh3b1hLbjNZWmg3THdoRDc1c3BsdXZl?=
 =?utf-8?B?UWtVS1dPSktlL3hrTm9VZ2J6N2xYTkVjYUJSRktZSTZjVlROM3VnNWRsazVK?=
 =?utf-8?B?YVF2bERGdUtlR1JOMmpFYTV2bERab1BYeldRV1Y4STVtV3g1Zm95UHJjaXRj?=
 =?utf-8?B?akE1SUtBVnlrbDZuelB2V1oxNEFGUjlybjBLaGp6QVIwY3RldmJjaUpCVXBP?=
 =?utf-8?B?cUNUdXVWYW1rUEthMXlDZlo5Sjc0SlJXUTdXOWdMUjZwUExuNkJ6TGVqOFJU?=
 =?utf-8?B?a1ZDMGVIUENqQXpyVU8vYnhjeCtnTjJsTTdVZjl2UkR4SnhsaHUzMTArYXdl?=
 =?utf-8?B?ZzIvN3JKM1A3cGdDaEhBSjB3UU4xUFY1SjZ6LzVlY2dwVU5pdmt3dWV0UVNQ?=
 =?utf-8?B?SFBoNGwyVmN5N0k1YVVwbEpBT1R1Z051cjZGdzBpam9Sc1lpTXBGS3R4ZEtw?=
 =?utf-8?B?clMyN25TZ0NlbDdFZlJXbUlSVkhwSmhvb2FPcnVEc2F4aFdPMHVWb1NFZldD?=
 =?utf-8?B?RWVva1orWm5RMXBLMEwyUENqNy9oVTZFZ1VxYStIdFBvVy9Ec2dYRzFYcWNw?=
 =?utf-8?B?QjBQVVlaSHBhMFRuV1J2QXdzdDg4c2xYLzdHOHpMNmROZzNTTGVaaitPZkpr?=
 =?utf-8?B?Tm85MXRXSUhMYUZkVm9rVG1TckJGY3lMUXk4YWh4SEUxWitRN2xMdWMxZDJQ?=
 =?utf-8?B?MzZNc25aL1c0QUM5MzIzVlJJcHgrb2lGelhDSXZaUXFDOTZpUVdDUnZKOVJi?=
 =?utf-8?B?SUQ4ZEFWUmNjQjRkU1VUdGhwRUFiR2JUWWVxcTFaN0NrNGNPTFd5Uk83Qmxo?=
 =?utf-8?Q?EVFPcQ+GBViW/p0R7i9dhOO8L?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e04c4cf-ad17-4dfb-7b9f-08de15fdd03c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 08:41:39.7502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTje9earqnBuB0eEbzDU5BNA0eGoMURxa1KHumwhHe8JV595rfCGARz64fwxiCegYp5QdYWEz1GdgX/WXfkwhWHpUEsbMfYnCoTIgBD+z50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6959
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgcmVwbHkuDQoNCj4gT24gTW9uLCBPY3Qg
MjcsIDIwMjUgYXQgMDU6NTg6MjBQTSArMDgwMCwgSmFja3kgQ2hvdSB3cm90ZToNCj4gPiBBZGQg
cGluY3RybCBzdXBwb3J0IGZvciBQQ0llIFJDIFBFUlNUIy4NCj4gDQo+IFRoaXMgaXMgcGFydCBv
ZiBQQ0kgY29tbWl0LiBNYWtlcyBubyBzZW5zZSBvbiBpdHMgb3duLg0KPiANCg0KQWdyZWVkLg0K
SSBtZXJnZSB0aGlzIHBhdGNoIGludG8gDQoiQVJNOiBkdHM6IGFzcGVlZC1nNjogQWRkIFBDSWUg
UkMgYW5kIFBDSWUgUEhZIG5vZGUiIHBhdGNoIGluIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLA0K
SmFja3kNCg0K

