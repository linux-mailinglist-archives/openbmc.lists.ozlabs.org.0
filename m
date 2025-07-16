Return-Path: <openbmc+bounces-367-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01915B0818C
	for <lists+openbmc@lfdr.de>; Thu, 17 Jul 2025 02:41:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjDd65jdfz3bby;
	Thu, 17 Jul 2025 10:41:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752637977;
	cv=pass; b=mlD3dudbG3OWIsS7uVMhepAqNk2/qDVBn6wdfoC7mGDHXHeAfmB7HQ6IcQh21t7tC8pfBUDmFtlI0PQbaBX4CDG7BrTwZ4Nic3Gs3ptVB0hC6rhRJtTxAH9fktwqU7tAnQDosfo3xhJvQrP47WqTAKULaF39MWzlTACH6b/sb1f1XvzLHG7P/ek+quyVM5/s5mvDV/V7W6uWV3mhPWD0FR8T3gk383gG5jXDWwMoYP86hkcVJNzPVPXxsHEHuwPY0ng9yPFbHzLK1izxx1+I09YVCKJGBax4sNhfYbS+v8bSVJTOUVXm/7EMwr0HRc4AeEL7ikewhXsH04kpqu5DHw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752637977; c=relaxed/relaxed;
	bh=KCfc+Ec3kwLMT3pydvZcSgoZImur0kb7Mtejl7DwIPQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QZbJefYwRZYGLr03bLHeHRkfU+YZNgml+m0RtyqiQbe79Yk0PD5dn1V8/PqFNQAL+Noenhy8rhxVMVafAwUOxEKn2rSTDbQdRe9MpgI83q1NHqLTQzdTooWR+eB6MTfrkfXgrleHwmoua8Y1KAekQBTVtzCCZaSgHxYorm12OkzwGkK6zQq6K5xQKcifLBGU6BTD8hrgGGWwAZKNzF3lc9vLZ7Wo3ajO7ShRdFvcV9o2SDhbnXhDQBX7U6l5k3lwmLjQb8pDXHg1qXPl101jwoUcWjfkoQzed4BRriWwVg/OrA/GU/ouqgPE6VyI+uacK5HHBmYDnGlAyBp5dksNTQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com; spf=temperror (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhhwF0nQRz2y82
	for <openbmc@lists.ozlabs.org>; Wed, 16 Jul 2025 13:51:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDpcneSVFvuB7QnZ59oz8nXBkAR8JBDyksQ/VvOsN5dTwvHu4L2BXIYJdgaXW46UnOBSUbWB8VOYUuPqiX3zxrNHoy4dg9RLELSGU2BAOCAkPH+fzzS8B6jBkTPCtqfY0M1n7FHtwXDlMirLz/lYk2jDdgEAhwQ6GQMimJ1Edy+LgSoc6lN6TbmA6iiJPg7+n4Y15ZAIRzh4YsrqHgO2+1Obgu9tg+NlD8UVnySO6GMqFeZ/Y7AiVKeXmNM7W0vX53U0oQNxuozz0W082KmYepfuEMjbrj+859Ugad3RfWwtQAvlSoVocA35mtbeEE/1GLOTzpWw8m0UhxL7Gup4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCfc+Ec3kwLMT3pydvZcSgoZImur0kb7Mtejl7DwIPQ=;
 b=F+6ZpULfni+2rY9y6av9wwFVLmDR5b8qRBYOK3rnFjn8XZW12hkIzJim1H/++XRTJQsXm1ftBcO1xKcxAazexfbDOkTobBN5BN01YCSGtZHTlpK9/WyYghU8b2GVJclddBNktyN2npZpVgHk6QG9sCYh5CcEqgGdQyRHsO6R2LvvCLz1l++o9K8000m6yTzyVylbh7xSzPNwE+25+JijWwgqwTjG28bpClJaHF/uicq1RqKUc4HKXV9BOHp8PXES9fFZtZBFger52Tc5vA/0+S42WGwEkMOd8QF/WDko4IC2frwr5IEB6xNNNhGJl4SeiOzRoMTHH35I1CLt0Vnx0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCfc+Ec3kwLMT3pydvZcSgoZImur0kb7Mtejl7DwIPQ=;
 b=qZTumzMlXHHVrDM4PVHDZb30vnFsw+WV8hm4IZJrkP/kq/eBaTDVRUrGkWVlaRIRbsr1IDOcammsYjFD/Yez1cvvgnXuBsrIQvf1CYpTyBfxIAg8d0JOkI8ubDELf9vrG0OnJV3DbU+kPkKxj4pM1LH88NUMA8QRy+0v3tPi4rJJl6/SG3JdmDbt8L6cDXwcLeXqGBOCtbdKHf85g3ba7QBxGlD6baSwNJgspjdyA+ZVYc3I7UtQJ2VtarC0xbYPA1+ApirCtOtqf2AOC4dEbvR3rsY2Gesb47Qw8na5SdZVmgc5/2mY5TLidvucMbOc4mVUqZXcpqCQaKsaVms9Vg==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEZPR06MB7291.apcprd06.prod.outlook.com (2603:1096:101:256::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 03:51:12 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8880.030; Wed, 16 Jul 2025
 03:51:11 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 06/10] ARM: dts: aspeed-g6: Add PCIe RC node
Thread-Topic: [PATCH v2 06/10] ARM: dts: aspeed-g6: Add PCIe RC node
Thread-Index: AQHb9TqkQDR8o2SUn0W5qxLHkZJlFLQzTswAgADEMrA=
Date: Wed, 16 Jul 2025 03:51:11 +0000
Message-ID:
 <SEYPR06MB5134EB5D018F8518E88495FF9D56A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-7-jacky_chou@aspeedtech.com>
 <CAL_JsqJ4yeYGAyCwHi=4CBurxGOc5oAqTQqun+5+Ps4hxwDU9Q@mail.gmail.com>
In-Reply-To:
 <CAL_JsqJ4yeYGAyCwHi=4CBurxGOc5oAqTQqun+5+Ps4hxwDU9Q@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEZPR06MB7291:EE_
x-ms-office365-filtering-correlation-id: d6966588-e361-437e-aedb-08ddc41c0164
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cHRvcXFYbU14V3VpbzZJeDc3L0lZdDg1SWpGRkhYYWJXQnIyQ0VVT2RoaU1G?=
 =?utf-8?B?YUY5aUQyTDliVzdLYjE5ZW9NNkRYTDF5ZkJjem5UYWVHZ3IrLzBoT2FaQVl3?=
 =?utf-8?B?YThucCtTSEp2QWR4ZU9jS2J0aDZRdW9jVGhiaGZ2NHk0a0FkOHZDV0FabFVT?=
 =?utf-8?B?bjBWK0ZuRXhnRk5JRFZLNVY4b1JWMmtqYWNvNGcvVEFZVkZpbzMxdi9aMEdN?=
 =?utf-8?B?QmEyUHFiOHJNUzgvR3B4T0dmamJRRDRwWjhHTVQyWEtzelZiaG1MNk5jWkJP?=
 =?utf-8?B?RlQ2K2o1VnpIdnl5akUwVW5odEJFQkhYN2dwdGNhZG96TkRXMEluN2JicmZU?=
 =?utf-8?B?ZlpzZGJFNG5RQVpudmhKRXVKdHBhVjlENGJzdUxsdUg0UkpaSjlQdEk3VytY?=
 =?utf-8?B?eDB5Q1JhRGRITnowSDNRUWJRamg5UzI1a2Zqbkt1Z2cybmt6YWhuWGlJTjFO?=
 =?utf-8?B?c05JTzdvL1g0NEpSYzdQMlI1YXhrSDdyRjc1YURFUENETGwvR3BEemh2MDRC?=
 =?utf-8?B?TTJMOEpWbmNhVnVrZmtaTkdqYTNnSVMyTXNNVGJSdEkvTVRySHNVNkdYNlJy?=
 =?utf-8?B?SUFMa1ZvV0YxL3VmSUVlaTFSMkNHeStPU2hVWkRZenUrZW84V1Y0eVEzL3k1?=
 =?utf-8?B?dTZJWkZFNXJmQ3cvZDFiUko2MWkzNmpiNkE2U2k2Sk8zU2FGSDlUNndlbmdq?=
 =?utf-8?B?MjlKZVJOb1ZvdjZlT0lRNGUwZFB5TEMzL3hmcVd3Ky9DcGhoYXBWQ0FSajFs?=
 =?utf-8?B?Y1FJYWRiVTZJcnJJeE5lWlV3Q2NXU081UENYWFJ2RmROVEpweHp6amt0aUMv?=
 =?utf-8?B?QTZ0dlhSMWxxSjcxUW8zclJZNktpSHFFVmQwRmR1cWU3MnU5Tk54bkt2bGlJ?=
 =?utf-8?B?Uk9RaExTYU8wSkFCWU1JS0cwQWJvdnlTejd4RHNoU2Fsd1BTem5kVFoydE9Y?=
 =?utf-8?B?eDRyUXJWV1JrOTFxK1VpNHhTeWxJU3poQnAyNVZSTFVDejhDaHYyR3N1K08w?=
 =?utf-8?B?MmJyTE0xbHdUMStnQ1VWNENNeEZndUhhNzhxcWlOeUJldHNJYUJYRE5ZeFgr?=
 =?utf-8?B?WWN5TS91akw5UG11MHdyUXJ4RjhPYmxqdlE5T2ZBazNqTlVaTnE1dnRzbCsw?=
 =?utf-8?B?MjJYYXREZDN5a0pNemFTcjRjRWFZTDRQWmtCeUF0aFBZSGMzWDViTnBrQVFl?=
 =?utf-8?B?NXBHNGJVc2R0OGd1NEZZU1A2aWNmS1JSUFBrN1ovbXRLZTRoNCtTSXBvc0J4?=
 =?utf-8?B?cGc2Nnord2FxaklUVlI3dU4xRjNvRjZuRWVmQkxQYXJpUS85M1ZZNDJ1d2Vr?=
 =?utf-8?B?Wm8rY0k5VkZnU3VaV0JWRkZ0MWFDNU1EaTNzbHJQWGt6WUJyakd6UG1qZWo2?=
 =?utf-8?B?OU4xSmR3RWhPckpRQkZ4YzE3cE1JT01TYTZRSUw1RmxrZEljZisxV0YxSmJT?=
 =?utf-8?B?dUVtMkQ4M3hjOXJGT3J1bmJPTDFxOWlvc3ozWmxMYjdGSlpCQXdwNnZBVlVi?=
 =?utf-8?B?Q3FuZW5DK0QwS2NKWU1hd3NHRnFpWnAwZDBROXB2UXE0c01IaW5GSXZHd1Rw?=
 =?utf-8?B?Tm4ycUl3ekxyN3dkU2FYcG82Tk1TZEhRWjE2Q0lUQ0NqNTFidDNzOHgzcDZ0?=
 =?utf-8?B?bXY4ZTBWMVFZalNqRzR5eDJJWmtIQmJkenlxWlZWeDRkVXRmekZIWVJSelFX?=
 =?utf-8?B?TXVkMlZJZ1BJUkZzQTBjQmZZRDNhTHFlRDVrZmdTczBuT2NzTElURmdLZi90?=
 =?utf-8?B?UFJXR0VZU1hSNHpoTVRYQ0VJM0hHNXFIZEVuR21pN2VSWXRtaHFjTGREcFVi?=
 =?utf-8?B?dHJuTThldjN3TmFFZEY4MzlhSExmSG94RkIzUURpcXlkNE90c0x1RGRXK2tw?=
 =?utf-8?B?OGpsZHM1RSs5dWduZHpkS0VJVlRhZlhucHcyRnF3Q1A2WDU3RnZUcURTOWV5?=
 =?utf-8?B?OW5kdWJvL0M0QkVucTN3MzBmVTd0MjNLOVFycGFIWmpmaDhHQStHMjJUUjY0?=
 =?utf-8?B?Q2pBL01USk9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2oxazhZSnVQZ2d4aFlBNURCd0hBN0pSK1BqWndvZmtEbVFPc2JTakZqL3Vt?=
 =?utf-8?B?MGFPUUkrcVpnSW5HYWNUZ004aEJLcDFpMFVDOVdDUTRtSnpzN2VSNnZZUk4w?=
 =?utf-8?B?ODBPODRIMmFRNDdqTTl4RU9qTjhkVU1KdC9GaFRKK2orbWNpckRzOW1aZTZp?=
 =?utf-8?B?QWJxdEo4S2xpOEtBVXZDUzBpOUdkeWxBOHRJNXBJVU03d2pNVUFtZmN3N1du?=
 =?utf-8?B?a3VQSEhxUUQ1UTUvVnl1U3o2aExUMFpCQWV6YVF5aU9vbTZvMUYzMW0rakVl?=
 =?utf-8?B?WDV0NmkyelhsYWdPVWRqUVo4aFI1Z2Vja0E3Rnl6NzRkeWZMeXhRazMvWWJq?=
 =?utf-8?B?TWk4Yy9IbG5tZ1hza1M3ZDljcU9GVXBpS091dmQzRVgyMWxweUZrcTd5enRm?=
 =?utf-8?B?cXp4L0ZMLzBpQTJkdDkwdmt2bWdQcEJkKzNWNXlxT1ZSKzlXOFNKRjNUemhy?=
 =?utf-8?B?dGVLeWVHVzFSOFFueDYzYlhkQXppUFdnUTdZbWl1dzV1OXhhUGpodnJOV3pO?=
 =?utf-8?B?ZHh0bUlLZjZXZWdXSkZuWnpCbDVkZ0ZLcUMza0ZKZG1wRktHaUxST3JRNXNF?=
 =?utf-8?B?THB6TUtVOWFWSEZTNHVPZ1FsVzdCa3U3bnE1UWFmTWxNNXkxR3dJUFh6emRJ?=
 =?utf-8?B?VE5kME1GUStraGpWV3c4NVVGMkllRjBHczArNG1jLzhZYTFaMkdDaEo4R2VQ?=
 =?utf-8?B?UDFyTWI0TXhtR1ozMnhzZTRjYzNjMlp3UnBZcHlOaW5XZDB4bVE2WUZiTzhG?=
 =?utf-8?B?eWdKRVhmaDYydjBROXc4SEF4NktRaE90TkJlc2paTmFib3hOLzFNYm1KQVkr?=
 =?utf-8?B?bXQ4VDRTNlZmck1veWZ3UmpXVG5RYmVaS0xhVkZaWG9BWDFjb0lJREpQdXdX?=
 =?utf-8?B?MzRSbmN2NDVJdzZrSDRwVWRQSlJzckU1V3F3S1NvRWhHRWkyTVJoWHJuK29T?=
 =?utf-8?B?UkJva2RpaXpCS0kwTnZuYlF0TEF5U3g0OHNEWC92cStVTkY0VUlFL1ZwK1Rp?=
 =?utf-8?B?N2d0YmRxNXJUK0d5bS9TUmhRZXQyU3RmcXVBMDc0Y09zWGY3ODdteXplWS80?=
 =?utf-8?B?RENSM3ZSUkJ4T0NEcFhmRDJ1WGFwbGdLZTM2ZXk2V2ZoTGlFU0Zkd0V3Y0hH?=
 =?utf-8?B?R0Jybi9RZXhqbHZiY1cyY1gwenlXaG9nNVdQQmsvdWpqRGpxMFN2NCt1SEZi?=
 =?utf-8?B?TkNOZTZZa2RGYzhJa1A0TE5pY1FCTHM0aHA3SjFZTTRDY0h0Yng3Nnk0b3B5?=
 =?utf-8?B?Z1dybjlBUGRKVzhVTFAydkdJS2o1TnFnblZHby83YkRNVWdoemFlMmViWTll?=
 =?utf-8?B?L3krNVpUZkNZVFdqMlhUMVVsUXhmeXR2WmtONFVxamtFVXE2VnBldmlrZnh4?=
 =?utf-8?B?aWxJZ2JRMzhlMVJMUEkzY3dPYm1IaUZGNG9BVkkwWTlYTXB3YXJtQ2FRU0xq?=
 =?utf-8?B?dmhZOFBtb3ZCakFPMlFHaTVncnhlb0xUc2hKSXk3WXlVdElYd3ZCVUk0RmNG?=
 =?utf-8?B?RFVpMDE3VzRvL3ZjVlRuTUpMYW9IbnFrTlJ5dERlVnZxMHZvdGlNV1dzSzNa?=
 =?utf-8?B?TVhuNGZ4RDRXYWVVY3VWblVzRjVPSG03SG56MlgyWFdLa2NmOEpUQTFUL2ZH?=
 =?utf-8?B?Y1ZaVFRhSXdJajRscEZONVh4ZmpUdmJJY045U3REUXl2SDJhWFQxd1M3NHNk?=
 =?utf-8?B?bFU3VjBHbkNKWkR2WnE0L1VLTGpvMVNySis2RkUrSHdLTWZkMm9XNFFHKzNy?=
 =?utf-8?B?ZmdySGNYZytnMkw3b0c3ampYeFRvLzNzNTAzTHFmc2ZlSVAxNDNsSDlodEp6?=
 =?utf-8?B?eGpWMk8xUnFkUkdmMjZXMC9oVmtHVVpqaU13NlRIN2l3K1laVTNlaFRSZ01n?=
 =?utf-8?B?Q282VWNrWDg3eTk4Z0ROYy95cmV5bU0vdHhFcnF3ZGZUR1ZKRWhwblJLblJa?=
 =?utf-8?B?aXZSb3pJWU4rbVhUTFZSUHIzbXIwYkthbzdTU1BSR0J5T0hJVkhkekJEd05M?=
 =?utf-8?B?MGxXdXZKNkE5QThqNEJBb3lnTVl6Y3piaktJMG5xeERxNm1IZEUwY2M5WWxy?=
 =?utf-8?B?RDhSbWl1MTJ2a1djek43Z1RvUWJKa0VjeHdJVjgxSkpYN3o3Ylc3dG1hcWZt?=
 =?utf-8?Q?tG6IpCaOuhBmsifWvYEFFW43A?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d6966588-e361-437e-aedb-08ddc41c0164
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 03:51:11.7600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4mGR5mGoKB/sEDUU8vbXiiNyXPqlp+VXGPCEMVaCDg2mOm5a+QH4FpgY9+LtAxqbONUR/wGJ8GaQGhe0MnO0u5h/+NzUuvZWS6zNCNyGgAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7291
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgUm9iLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHF1YWxpdHkgPSA8MTAwPjsNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICB9Ow0KPiA+DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGNpZV9waHkxOiBz
eXNjb25AMWU2ZWQyMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJhc3BlZWQscGNpZS1waHkiLA0KPiAic3lzY29uIjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDFlNmVkMjAwIDB4MTAwPjsNCj4gDQo+IFRo
aXMgbG9va3MgbGlrZSBwYXJ0IG9mIHNvbWV0aGluZyBlbHNlPyBJdCBzaG91bGQgYmUgYSBjaGls
ZCBvZiB0aGF0Lg0KPiANCj4gSWYgdGhpcyBpcyB0aGUgY29udHJvbHMgZm9yIHRoZSBQQ0llIFBI
WSwgdGhlbiB1c2UgdGhlIFBIWSBiaW5kaW5nIGluc3RlYWQgb2YgeW91cg0KPiBvd24gY3VzdG9t
IHBoYW5kbGUgcHJvcGVydHkuDQo+IA0KDQpPdXIgUENJZSBkZXNpZ24gaGFzIG11bHRpcGxlIGZ1
bmN0aW9ucy4gQW5kIHRoZSBzZXJpZXMgb2YgcGF0Y2hlcyBhcmUgc3VibWl0dGVkIGZvcg0KUENJ
ZSBSQy4gVGhlIG90aGVyIFBDSWUgZnVuY3Rpb25zIGFsc28gdXNlIHRoaXMgcGh5IG5vZGUuDQpJ
IHRyYWNlZCB0aGUgUEhZIGRyaXZlciBpbnRlcmZhY2UsIGl0IGNhbm5vdCBtZWV0IG91ciB1c2Fn
ZS4NClRoZXJlZm9yZSwgdGhlIFJDIGRyaXZlciB1c2VzIHRoZSBwaGFuZGxlIHByb3BlcnR5IHRv
IGNvbmZpZ3VyZS4NCkFuZCB0aGlzIHN5c2NvbiBhbHNvIGlzIHVzZWQgYnkgdGhlIG90aGVyIFBD
SWUgZnVuY3Rpb25zLg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGNpZV9jZmc6IHN5c2NvbkAxZTc3MDAwMCB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxw
Y2llLWNmZyIsDQo+ICJzeXNjb24iOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4MWU3NzAwMDAgMHg4MD47DQo+IA0KPiBMb29rcyBsaWtlIHRoaXMgaXMgcmVh
bGx5IHBhcnQgb2YgdGhlIFBDSWUgYmxvY2sgYXMgYSBoL3cgYmxvY2sgaXNuJ3QgZ29pbmcgdG8g
c3RhcnQNCj4gYXQgb2Zmc2V0IDB4YzAuDQo+IA0KPiANCg0KQWN0dWFsbHkuDQpUaGVyZSBhcmUg
dHdvIFBDSWUgYnVzIGluIEFTVDI2MDANCldlIHVzZSB0aGUgb3RoZXIgb25lIFBDSWUgdG8gRVAg
bW9kZSwgaGVyZSBJIGNhbGwgUENJZSBBLg0KSSBjYWxsIHRoZSBwY2llMCBub2RlIGFzIFBDSWUg
Qi4NCldlIGRvIG5vdCBwcm92aWRlIFBDSWUgQSB0byBSQyBtb2RlIGZvciB1c2FnZSwganVzdCBF
UCBtb2RlLg0KQnV0LCB3aGVuIFBDSWUgQSBpcyB1c2VkIGFzIFJDLCBpdCByZWcgbWFwcGluZyBp
cyBzdGFydGluZyBmcm9tIDB4MWU3NzAwODAuDQpJIGxpc3QgdGhlcmUgbWFwcGluZy4NCg0KMHgx
ZTc3XzAwMDAgfiAweDFlNzdfMDA3ZiA6IGNvbW1vbiB1c2FnZQ0KMHgxZTc3XzAwODAgfiAweDFl
NzdfMDBiZiA6IFBDSUUgQQ0KMHgxZTc3XzAwQzAgfiAweDFlNzdfMDBmZiA6IFBDSUUgQg0KDQpT
bywgaXQgaXMgd2h5IHdlIGNyZWF0ZSBvbmUgbm9kZSB0byBkZXNjcmliZSBjb21tb24gdXNhZ2Ug
Zm9yIFBDSWUgQSBhbmQgQi4NCkFuZCwgd2h5IHRoZSBwY2llMCByZWcgbWFwcGluZyBpcyBzdGFy
dGluZyBmcm9tIDB4MWU3N18wMGMwLg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsN
Cj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGNpZTA6IHBjaWVAMWU3NzAwYzAg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhc3Bl
ZWQsYXN0MjYwMC1wY2llIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRl
dmljZV90eXBlID0gInBjaSI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgxZTc3MDBjMCAweDQwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpbnV4LHBjaS1kb21haW4gPSA8MD47DQo+IA0KPiBObyBuZWVkIGZvciB0aGlzLiBZb3Ug
b25seSBoYXZlIDEgUENJIGhvc3QuDQo+IA0KDQpBZ3JlZWQuDQpXZSBvbmx5IHByb3ZpZGUgb25l
IFJDLg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwzPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxz
ID0gPDI+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDE2OA0KPiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJ1cy1yYW5nZSA9IDwweDgwIDB4ZmY+Ow0KPiANCj4gRG9lcyB0
aGlzIGgvdyBub3Qgc3VwcG9ydCBidXMgMC0weDdmIGZvciBzb21lIHJlYXNvbj8NCj4gDQoNCkxp
c3Q6DQpQQ0lFIEE6IDAtMHg3Zg0KUENJRSBCOiAweDgwLTB4ZmYNCg0KSXQgaXMgb3VyIGRlc2ln
biBvbiBQQ0llIEIgdG8gdXNlIGJ1cy1yYW5nZSAweDgwLTB4ZmYuDQoNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByYW5nZXMgPSA8MHgwMTAwMDAwMCAweDANCj4g
MHgwMDAxODAwMCAweDAwMDE4MDAwIDB4MCAweDAwMDA4MDAwDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMjAwMDAwMCAweDANCj4gMHg3MDAwMDAwMA0K
PiA+ICsgMHg3MDAwMDAwMCAweDAgMHgxMDAwMDAwMD47DQo+ID4gKw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JnN5c2Nvbg0KPiBBU1BFRURf
UkVTRVRfSDJYPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc2V0LW5h
bWVzID0gImgyeCI7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
I2ludGVycnVwdC1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1zaS1wYXJlbnQgPSA8JnBjaWUwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG1zaS1jb250cm9sbGVyOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGFzcGVlZCxhaGJjID0gPCZhaGJjPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGFzcGVlZCxwY2llY2ZnID0gPCZwY2llX2NmZz47DQo+ID4gKw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LW1hcC1tYXNrID0gPDAgMCAw
IDc+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LW1hcCA9
IDwwIDAgMCAxICZwY2llX2ludGMwDQo+IDA+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwwIDAgMCAyDQo+ICZwY2llX2ludGMwIDE+LA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwwIDAgMCAz
DQo+ICZwY2llX2ludGMwIDI+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwwIDAgMCA0DQo+ICZwY2llX2ludGMwIDM+Ow0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGNpZV9pbnRjMDogaW50ZXJydXB0LWNvbnRyb2xsZXIg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQt
Y29udHJvbGxlcjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBjaWVAOCwwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4ODA0MDAwIDAgMCAwIDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gInBjaSI7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmc3lz
Y29uDQo+IEFTUEVFRF9SRVNFVF9QQ0lFX1JDX08+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZXNldC1uYW1lcyA9ICJwZXJzdCI7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmc3lzY29uDQo+IEFTUEVF
RF9DTEtfR0FURV9CQ0xLPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGluY3RybC0wID0NCj4gPCZwaW5jdHJsX3BjaWVyYzFfZGVm
YXVsdD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFzcGVl
ZCxwY2llcGh5ID0NCj4gPCZwY2llX3BoeTE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByYW5nZXM7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGdmeDogZGlzcGxheUAxZTZlNjAwMCB7DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLWdmeCIs
DQo+ICJzeXNjb24iOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDB4MWU2ZTYwMDAgMHgxMDAwPjsNCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=

