Return-Path: <openbmc+bounces-460-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96480B27891
	for <lists+openbmc@lfdr.de>; Fri, 15 Aug 2025 07:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c39pP1jQNz3cPG;
	Fri, 15 Aug 2025 15:36:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755236205;
	cv=pass; b=TWkd29PaOybp/95DLQNyYl4fEumf44rb84ry+R3AJaGFMbdqxFcWKZBz07iExlQWiATFZcN/ds8acDUcpaxIwID+zblyMYlGWkPo0j2d3YKZ2PvPmjLE9z+foQ6A2W/lYhV1CMFa7gxes+hQ54ZZ15SMGnqNks9F1i1iVJEU+RYo4Vv8pd0CrMaMTzR4X0VwCGSGwjko/HM3W1KEHuO0KdHI1FQfWrbb7WuTWAvbP9b4inzTg7YzecgKMk9H7zPfd2F5AXgUZ3YOvHyW8aIO3WNWB1o9TfDQp3g8PFJl452VHEiF1IVezwb/0RqhixxCTgvwsHGCR9OfDpDLhlDswQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755236205; c=relaxed/relaxed;
	bh=+YA09sxfUpXXpscAFDXDjlKAqzgMBHAy7gdRLu/z8kA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R+9B2kMH9UkHY1xp2wLnFVVGcmDv+micbJyLxnGQLikC+lP/cUDOyRGKbzA5IPvm2BxsfRuAYUEw7VIvziEJRECpwmT/NSVI+gxGNQlOIdNnG9YqSwOj/vyhjdClO0mYrjzGrSZU5ukSFMb/HSBAxNrRFuapkm/XWvBk99Ajad1s2+Q+DfYhLkzGWeFf3j+87NC7q0fiqkQfyoMJOPeAzo/qWlUZGl8eSjKccpC2YL0v8i87vJj80HfdSjbcya9WgbqG8wTLZFezJsvNXjaGt997E94SY6DCrIsATMF4X22sLH7d1dgNFIcofBeNeMFs7LrOTlAWjiRU+NzEIDtzwA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=HY/seowt; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=HY/seowt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c39pM1cHnz30RK;
	Fri, 15 Aug 2025 15:36:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZdnrFz3mwaelxlvrLJhlPRpZZcUa/ovPvjAqZq8im7udn4qgK71s9QtrAAnTyajFHYpqUarDyyRTApqdpSVPXn9qsARmuk51h2pWjexSoxDubhtBBjQD9ru8GObJSeEIrTICJbqn1n0/3P+XIw0dgI8QkdXw1kZUzK87OaTTTycnIce2hCt7OavZWIyZ9tTGdDIyGdxXKARBsJ1OSOebuFQPDkpt/cjTlzgnSoxl3iQjQTaK+prvvpTmXUaVzCMsPQgoGJQbuO3Yp6cXoI+qEZu44/Hd+kxYLZBeYHVhiVsP91ArD6Y6ByWOcd67qLskxFagsscDFesCf/cSXSaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YA09sxfUpXXpscAFDXDjlKAqzgMBHAy7gdRLu/z8kA=;
 b=HbHWp3pjf+ZZ1vN1NrPG55OEDRgNSJ45Diy97oZqIsomxZm3IOICxy8m/D1U4SygcMT2V9sSpiXtO6VrDveMYk1o0sXH9NNKkwi+Sp8XxEolWjz9VWPt6jcl6NkQskuhgkPCaPuDP8KFcdgErqD1R2gzv3cyvRuaSP0rQm3rt1GveeSv7pq4AqLdIyMibivCbAYZSfySewvdZHrBNeP2iwy4kRcNPdXFSfjO1go8yUdwiv5TE4OpnKMiTOwYyHslO0nRw+G3cb8/V3tXCGQHdoc+h8phmm7sDfIXrlF8XmDYkFdhrfOsH3FtWmrJRC8p5/0aHF6KbjJya69eQM3vTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YA09sxfUpXXpscAFDXDjlKAqzgMBHAy7gdRLu/z8kA=;
 b=HY/seowtk0o58+NaenzsAbVZzo+MIZ9cZ65Qss2EBQP5sjzDaKt+N0vbRxh/sfx99tyqiaCP27K2jgmXNuBhxURn/RGPsntIpMObkbqKuJU1ZLGnWj6Spf9MY6kdp2+oRzyhYhTyfJ4Zghhl8UDLnf4oHot1dznjm6cuprycIR7FS1fRhxOB8HoN6/nAPei7OY5UquY8yaJ2pkKKTbCPOc9wfbpXoKAkbJAyJ0Wrx3VDxBa/MFD+T95+Snz+VZ1ySLOluGI6eQykSyYSSmphv8/2+5VKcmwVX7JOXf7w2HFQDuF0ab2YhPCAhskbFNg09jHBMAq8x9tWlTolgOqDLA==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SE2PPFDCBF4279B.apcprd06.prod.outlook.com (2603:1096:108:1::7f0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 15 Aug
 2025 05:36:17 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 05:36:17 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v17 2/3] i2c: ast2600: Add controller driver for new
 register layout
Thread-Topic: [PATCH v17 2/3] i2c: ast2600: Add controller driver for new
 register layout
Thread-Index: AQHcDPdQSpjY2QMXdk2AcYd55zqPprRh9lmAgAE8b5A=
Date: Fri, 15 Aug 2025 05:36:17 +0000
Message-ID:
 <OS8PR06MB754191DE999F3834EC1FC4A9F234A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
	 <20250814084156.1650432-3-ryan_chen@aspeedtech.com>
 <bf5a4aa0fc1a324a17c25e8ed5acbfd94d240251.camel@pengutronix.de>
In-Reply-To: <bf5a4aa0fc1a324a17c25e8ed5acbfd94d240251.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SE2PPFDCBF4279B:EE_
x-ms-office365-filtering-correlation-id: 5b01b39f-19bd-4346-12d7-08dddbbda825
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WXZNQldyZjE1MmlrbE1Vdm84ZlA4SSs0QjdkSVJHL3Vkc05mTFA0QmdXTDJx?=
 =?utf-8?B?RDlrbjM2RVo0OTdDcDRwWlY1c2c0WHpyVC9zck1OMVI0YjVXNUlmRTgzczB3?=
 =?utf-8?B?K2NLakQzaUZVbW1xenhaSndyZWZiazM0a3FEWEVhUFNORUE2WVdsalRiUDBG?=
 =?utf-8?B?dWZybU5JendGOEI1SXkybnJwTzRIK0p3T2ZrQTVOdnkrN0EvQ24xbCtkakRm?=
 =?utf-8?B?TjZRRE1sZXNoTzdLRk5vSlh4WExQL2xZYlU1TTJIZ1R2R2Y2cGFCYmluTXB2?=
 =?utf-8?B?WmpnOFZMYXNlOS9Cam41cmdaYTd1T0R1V28rMUI0Ujc2bFhjazhxK3lmR2po?=
 =?utf-8?B?M1p1N0JvWjJCa1F2U2IrRmJNRVZacWtVS29ENkhLbW5YY1dJUFIweVlPZjVD?=
 =?utf-8?B?bTRDNXBBVnJDZTloazkzajMvZGxKc3Q2T2x6QTVWMVJMSGlObzBGWWsyMFhj?=
 =?utf-8?B?Q25LNGkzSEQ4Q05RMmg4WEZSdXd5bEZ0eUVzMDBxM0JPcGpyd2FUeXJkZ2Np?=
 =?utf-8?B?NnZuOHhsRFNOb09RSVordkxING9FVGR6V0VZNjJ5ZXpWaE91TVdkKzM5Z1lp?=
 =?utf-8?B?Y1dHYmFkQXZRSVduelZGaFVHSG1PYThsYXB1ODhiSFpZY3ExMkRySDZIbEMv?=
 =?utf-8?B?bWNrdDB3bkpZUC9xTWtiKy9teUhPYVlCSGVacHJ5L3RjMzMycWdoRzVxYXRj?=
 =?utf-8?B?cFF5eFp0aEtCeE1LTlkvUFdndTIrL296ZTdXR3dycmhqV2pzcFRCN0NHRG9I?=
 =?utf-8?B?MkJwU0Z3MjlvcnkrMjlZUkZrV1NadmFMTjlXRGtRazVWakhpTVN6TVlBREFM?=
 =?utf-8?B?Z0dIQmpITWwzYzJlL3hMMmZwbzdlbFU4TnU1UytaUlZxUUNNeHVJVTlwbFVF?=
 =?utf-8?B?RjNDZ2t2VlNIcmpnYjFTbktKejRydkNJeXRJU2tKYkZlRmdscm5ENDBUQ0VR?=
 =?utf-8?B?T0l0TlpJR2ZGRVFENHFuaHFFQ1Y2eGk3MmVEbUg0MnFUeWhZdjluU3hFUEw2?=
 =?utf-8?B?K2s0MVNnOXp3WHQ1cXk4U29mQUVNdlNYeVJzaWhMVXlucXorS0JidENYbmlF?=
 =?utf-8?B?c3p4UjEwZ2pjQldzanZ5RDcvd1NkQTIvYTJaT0k3RGVTaCtBWUphU3ZZS0Nu?=
 =?utf-8?B?S2x5anpRREJMUjNmelo3K3EvdlZqV1pEUUh2Uys3eVVQbjR2d2pSeDN6MFZM?=
 =?utf-8?B?MzRBS09zVUtkdDBhak9CcjFDbHRDbHJuRVRGMVVEMEUwK05UTHFXLy9UOHNj?=
 =?utf-8?B?U2pnWVFFVm11aVNaTWFRU1dsT25WbVF6TXZLN0RZMSs0RSt3TzBBLzFqNFlY?=
 =?utf-8?B?Mnc1MlNKdUxSYkh2OTFtNEtIWGdsTGllRVRrSndMRWF4eG1uVUhtQlA3eFhZ?=
 =?utf-8?B?eko2MTBxKzg1QnFBWmZUQWxYS0RuckVPN0pET3ZnVVVZRXFGdjBycUhNektP?=
 =?utf-8?B?TmYzbHNxdnIvdEw3RWJVaENMZmUwNVlsRVdJSmVsV2tNQTNaKzU5YTV2eS9R?=
 =?utf-8?B?VW15bUR2ZDJwMDJsZFBGQ3BOMGg4UHJlQVdXL3JjcGJ0cUlPUFNmZEh2QjV6?=
 =?utf-8?B?OUIxMFRVVnQrbHBZNGhSZFA4NkZzeE9tSEZZWmRVMHIyNVJwVzdadGhRblNk?=
 =?utf-8?B?RTZESFF3cllsVjU3a0NRRlgxWjErdzV0RVp5ZHNYZmg1NWhmMmx6MVRhZmRB?=
 =?utf-8?B?Y0VMOXNwZzFNeFExSVN1Q2dQb1pKNU1CQXM2Q2FhMUxLaGdTSGVjcVFGa1Fz?=
 =?utf-8?B?c1hXYVFVQm1lNFFEUk5BdjN4L2Qxc2szbEQyVEdyRFdPSXNFb3NkT0FJcHdo?=
 =?utf-8?B?VXhRNzlhVkdIVVhsYTVqVlI2Q0p0cjR6S29ja0phdUR5QXN3dlZwZ3NKaGZH?=
 =?utf-8?B?UUpqTlQ1MzNJOUhLaWRZUk9KTlg0YkZrVmlzSFJVNExBK2VLNGxxcVo5NVlk?=
 =?utf-8?B?VW4rMkFCeHNmVVE0NkNnQW5IcWx2Yzg2WXFLNHdWMjl1NFQvamtLVGErOVRC?=
 =?utf-8?Q?x7mozBx9f3grxwBhfJMEqvmVFzwewQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWF6ZzVWZlZaQ2t1eno1bUM5amtyQnJhVmNTNFd1N0N2M1E5UW9zUlgwZlRT?=
 =?utf-8?B?aW95MHZMU0dnOVEzdnBOZ1hRYkY1L1MzSVBsczNNRU4vOEJkYkJXN1pUQVVB?=
 =?utf-8?B?QmN4NXVkKzZXem1KNk1maTJUSWRmSmI1NFZEeERlTXFpRFZHRSsyb000d21Y?=
 =?utf-8?B?QUNQRUIyaEQ2Q0NlNXNSd3h5Vkh0Nmh1VDNZMnBMeFlMQk13NmtscDRob1Yr?=
 =?utf-8?B?OG5uRWY4ejBJYkpLWkU1dVp4NEV5TWRzMTFzOU92Q3dydytZSHNwNTVSSExD?=
 =?utf-8?B?a0RjbEFHREp0a1k3MldMZHlMWDJ5Qzc5OWMwaHB2TkxFRkYrTFZJd3RSQWRV?=
 =?utf-8?B?M3pwU1lHbElHVGpjZkEzTXJiT3hJbnRoNU1zalhMSXR4dHhZOXdXdmxHM215?=
 =?utf-8?B?VzBSZTA3eGYrSWV3NG5QV1Z5S1hCZXNqVTJPZHE3QWZFcUcyVG5EOEJGY2xm?=
 =?utf-8?B?cHBkOU1JL0NpUDZaajlKdXo3WnJnWkpCandxR0F6T3BkK1ZNcVhpR1plVk5F?=
 =?utf-8?B?eCtUWnVnaVFwNmk0SVB1NlZndjFzY3ZkdW5MYVRLR0FCa2kxVW93NVp5dmNM?=
 =?utf-8?B?VjR1UjlFTVNsWUV1V3RHU3lMYzh1V2JQajAzUWNuVkl3NjJHSUhReUxIekZZ?=
 =?utf-8?B?T1lBSXBvaXpMYmhQcC8xSHNSVFR1ZVdyYUpFdlk0TTJ0VnZHYmVIK3Bmck83?=
 =?utf-8?B?aXpWWnJadEl2VFNSNkJ2VGZJZTNmOXZCUkJuMGJ5SWxzU3VNbVJGVU9Pczdy?=
 =?utf-8?B?MDRVYWRRUHVJZ3drRGM2SWJGZW5hbzlKY0VEVWRKRTduWUgxY1lQUklDVy83?=
 =?utf-8?B?MHBzMGdzbXBRTGlOdkl5RzNLM0pvVTRyOFNNSk4zWUhDeDlNTndhdjRyQVVr?=
 =?utf-8?B?VGJTT3hCaE03ei9zQUMvVkc0U21xVjJYVFNJd2s4S2hjU2Q5eGdkUHhmV3ln?=
 =?utf-8?B?bjlFSmdmMm55OVZjc1BTZE42L3J6OVJFMGdlcFBEWUphcWE1ZU1vd28rTmJ4?=
 =?utf-8?B?aXpNbkIzd2I0dHFHamNteHZ2MlFqblpDRUdDenhRUEtxSU41WFlxcyt0bCtx?=
 =?utf-8?B?anhKR0JlcU9vOURKbVdxYk84SzFNZHBBVmhkbkUrVE85eERBVFdEV1NqanF1?=
 =?utf-8?B?WnkzaHZ4SW1MZFQzNXUvNzJva3BBelFCWjU1Mm9KV09RWExFeXBkWVpYM3VV?=
 =?utf-8?B?MWI1VVk2L1RjYW0wN1Q4Uzd3TjNwMFBlRDhVNnE1VUhuOGpKRHR1czNOTEc0?=
 =?utf-8?B?QjIxbGxIYUVFdUQ5WXk1WTZIM1M3bFhxbHNxMytVdU4zbGc4UWY1ZWZPT1lH?=
 =?utf-8?B?QllLL24wSkhHeDhwR1VITmJGYmZKTHZNRDl4Qk1URUdQT2NUNmxOVEtYSHFt?=
 =?utf-8?B?WFRUc2FzaEJCY3d0eUd4NjFySDFUNGFLV1BwcXBYVDF0Y0h5MVcxaUwyS2Z6?=
 =?utf-8?B?TVVGU0VXUTZGTUVkRkhwZTBaKzlWRlpBalVjaXEyaUxGYkR1czlaQjdaTFEx?=
 =?utf-8?B?VmEwenMyZ2VYNktKVVRqT1MvNFMyTDRYLzhjVFFGTStyUnJMME9SQjRKMGdF?=
 =?utf-8?B?ODdDTllNdHQxYmxIbnNDNTJPaG1rV3UxRVVPRmxuSFkvd3o1TnBsTXVjak1o?=
 =?utf-8?B?WWpLL2tPeGcyMHB2UUV3MVZqREN3RUMrM0ZUalBtWHpJM2FPcURsWU56NnJZ?=
 =?utf-8?B?NTVjdmFwU1Q1azhhMjhGZ2t6QnlCRjV1aTdDMkszUEluLzVnYzZjMGtkdXpi?=
 =?utf-8?B?cGpwbkRXWWxaOCt0NWxOdldidURmM2ZBVEN1NzhyQmYwZGc3YXA5Wkl0ZWVL?=
 =?utf-8?B?by9xM3g2V2Y0bnQ3YXhoRmVvV0hhZ3dQbHhLSXhDZWJ1ejZiajZ5dHpiMVlB?=
 =?utf-8?B?QkRQVituY3VuNEhSc0xYUUJPbkxWRnhNeXZjRFFxTFJFODdKaXBLUExFeXJo?=
 =?utf-8?B?a0g0L25Gd3BaNVQ1SmNhM3Y2d1JQZzFSVXpsemhoNkZVWGhyWWxXMFNlSFFF?=
 =?utf-8?B?RDN0TmZ6eVJVMEM4SVptM2tvazdxL1F0N0s3QUVEc1RWQlNwSUlTOE1KY1hm?=
 =?utf-8?B?d2QrMzB3Nit2VUQ4WXltNjFFdlB4NnlqY1pERkVpR2p1d3hoTXg3bTdHK0RS?=
 =?utf-8?Q?VySjFV5l51HDPuY7FuLNQYj72?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b01b39f-19bd-4346-12d7-08dddbbda825
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 05:36:17.2510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0ryLlawA+9uk97rWUOVoKZnD8vnmngGCR4NyMqmSE7wgX1MjXkfgkPv1Iz6Ok6DGpZG51fzjE18W1HAo6WVQs0G/v+s6hfOpP8Xx81KE8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFDCBF4279B
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNyAyLzNdIGkyYzogYXN0MjYwMDogQWRkIGNvbnRyb2xs
ZXIgZHJpdmVyIGZvciBuZXcNCj4gcmVnaXN0ZXIgbGF5b3V0DQo+IA0KPiBPbiBEbywgMjAyNS0w
OC0xNCBhdCAxNjo0MSArMDgwMCwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+IEFkZCBpMmMtYXN0MjYw
MCBuZXcgcmVnaXN0ZXIgbW9kZSBkcml2ZXIgdG8gc3VwcG9ydCBBU1QyNjAwIGkyYyBuZXcNCj4g
PiByZWdpc3RlciBtb2RlLiBUaGlzIGkyYy1hc3QyNjAwIG5ldyBkcml2ZXIgYW5kIHRoZSBsZWdh
Y3kgaTJjLWFzcGVlZA0KPiA+IGRyaXZlciBib3RoIG1hdGNoIHRoZSBzYW1lIGNvbXBhdGlibGUg
c3RyaW5nICJhc3BlZWQsYXN0MjYwMC1pMmMtYnVzIg0KPiA+IGJlY2F1c2UgdGhleSB0YXJnZXQg
dGhlIHNhbWUgSTJDIGNvbnRyb2xsZXIgSVAgb24gQVNUMjYwMC4gSG93ZXZlciwNCj4gPiBBU1Qy
NjAwIFNvQ3MgbWF5IGNvbmZpZ3VyZSB0aGUgY29udHJvbGxlciBpbnN0YW5jZXMgdG8gb3BlcmF0
ZSBlaXRoZXINCj4gPiBpbiB0aGUgbGVnYWN5IHJlZ2lzdGVyIGxheW91dCBvciB0aGUgbmV3IGxh
eW91dCAodmlhIGdsb2JhbCByZWdpc3RlcikuDQo+ID4gVGhlIG5ldyByZWdpc3RlciBtb2RlIHN1
cHBvcnQgZm9sbG93aW5nLg0KPiA+DQo+ID4gLSBBZGQgbmV3IGNsb2NrIGRpdmlkZXIgb3B0aW9u
IGZvciBtb3JlIGZsZXhpYmxlIGFuZCBhY2N1cmF0ZSAgY2xvY2sNCj4gPiByYXRlIGdlbmVyYXRp
b24NCj4gPiAtIEFkZCB0Q0tIaWdoTWluIHRpbWluZyB0byBndWFyYW50ZWUgU0NMIGhpZ2ggcHVs
c2Ugd2lkdGguDQo+ID4gLSBBZGQgc3VwcG9ydCBkdWFsIHBvb2wgYnVmZmVyIG1vZGUsIHNwbGl0
IDMyIGJ5dGVzIHBvb2wgYnVmZmVyICBvZg0KPiA+IGVhY2ggZGV2aWNlIGludG8gMiB4IDE2IGJ5
dGVzIGZvciBUeCBhbmQgUnggaW5kaXZpZHVhbGx5Lg0KPiA+IC0gSW5jcmVhc2UgRE1BIGJ1ZmZl
ciBzaXplIHRvIDQwOTYgYnl0ZXMgYW5kIHN1cHBvcnQgYnl0ZSBhbGlnbm1lbnQuDQo+ID4gLSBS
ZS1kZWZpbmUgdGhlIGJhc2UgYWRkcmVzcyBvZiBCVVMxIH4gQlVTMTYgYW5kIFBvb2wgYnVmZmVy
Lg0KPiA+IC0gUmUtZGVmaW5lIHJlZ2lzdGVycyBmb3Igc2VwYXJhdGluZyBjb250cm9sbGVyIGFu
ZCB0YXJnZXQgIG1vZGUNCj4gPiBjb250cm9sLg0KPiA+IC0gU3VwcG9ydCA0IGluZGl2aWR1YWwg
RE1BIGJ1ZmZlcnMgZm9yIGNvbnRyb2xsZXIgVHggYW5kIFJ4LCAgdGFyZ2V0DQo+ID4gVHggYW5k
IFJ4Lg0KPiA+DQo+ID4gQW5kIGZvbGxvd2luZyBpcyBuZXcgcmVnaXN0ZXIgc2V0IGZvciBwYWNr
YWdlIHRyYW5zZmVyIHNlcXVlbmNlLg0KPiA+IC0gTmV3IE1hc3RlciBvcGVyYXRpb24gbW9kZToN
Cj4gPiAgIFMgLT4gQXcgLT4gUA0KPiA+ICAgUyAtPiBBdyAtPiBUeEQgLT4gUA0KPiA+ICAgUyAt
PiBBciAtPiBSeEQgLT4gUA0KPiA+ICAgUyAtPiBBdyAtPiBUeEQgLT4gU3IgLT4gQXIgLT4gUnhE
IC0+IFANCj4gPiAtIEJ1cyBTREEgbG9jayBhdXRvLXJlbGVhc2UgY2FwYWJpbGl0eSBmb3IgbmV3
IGNvbnRyb2xsZXIgRE1BICBjb21tYW5kDQo+ID4gbW9kZS4NCj4gPiAtIEJ1cyBhdXRvIHRpbWVv
dXQgZm9yIG5ldyBjb250cm9sbGVyL3RhcmdldCBETUEgbW9kZS4NCj4gPg0KPiA+IFNpbmNlIHRo
ZSByZWdpc3RlciBsYXlvdXQgaXMgc2VsZWN0ZWQgdmlhIGEgZ2xvYmFsIHJlZ2lzdGVyIGF0IHJ1
bnRpbWUNCj4gPiBhbmQgYm90aCBkcml2ZXJzIGJpbmQgdG8gdGhlIHNhbWUgY29tcGF0aWJsZSBz
dHJpbmcsIHRoaXMgcGF0Y2gNCj4gPiBkZWZpbmVzIHRoZSBkcml2ZXIgc2VsZWN0aW9uIGF0IGJ1
aWxkLXRpbWUgdXNpbmcgS2NvbmZpZywgZW5zdXJpbmcNCj4gPiB0aGF0IG9ubHkgb25lIGRyaXZl
ciBpcyBjb21waWxlZCBpbnRvIHRoZSBrZXJuZWwuIFRoaXMgYXBwcm9hY2ggYXZvaWRzDQo+ID4g
YW1iaWd1aXR5IGFuZCBlbnN1cmVzIGNvbnNpc3RlbnQgYmVoYXZpb3IgZm9yIGVhY2ggcGxhdGZv
cm0NCj4gPiBjb25maWd1cmF0aW9uLg0KPiA+DQo+ID4gVGhlIGZvbGxvd2luZyBpcyB0d28gdmVy
c3VzIHJlZ2lzdGVyIGxheW91dC4NCj4gPiBPbGQgcmVnaXN0ZXIgbW9kZToNCj4gPiB7STJDRDAw
fTogRnVuY3Rpb24gQ29udHJvbCBSZWdpc3Rlcg0KPiA+IHtJMkNEMDR9OiBDbG9jayBhbmQgQUMg
VGltaW5nIENvbnRyb2wgUmVnaXN0ZXINCj4gPiB7STJDRDA4fTogQ2xvY2sgYW5kIEFDIFRpbWlu
ZyBDb250cm9sIFJlZ2lzdGVyDQo+ID4ge0kyQ0QwQ306IEludGVycnVwdCBDb250cm9sIFJlZ2lz
dGVyDQo+ID4ge0kyQ0QxMH06IEludGVycnVwdCBTdGF0dXMgUmVnaXN0ZXINCj4gPiB7STJDRDE0
fTogQ29tbWFuZC9TdGF0dXMgUmVnaXN0ZXINCj4gPiB7STJDRDE4fTogU2xhdmUgRGV2aWNlIEFk
ZHJlc3MgUmVnaXN0ZXINCj4gPiB7STJDRDFDfTogUG9vbCBCdWZmZXIgQ29udHJvbCBSZWdpc3Rl
cg0KPiA+IHtJMkNEMjB9OiBUcmFuc21pdC9SZWNlaXZlIEJ5dGUgQnVmZmVyIFJlZ2lzdGVyDQo+
ID4ge0kyQ0QyNH06IERNQSBNb2RlIEJ1ZmZlciBBZGRyZXNzIFJlZ2lzdGVyDQo+ID4ge0kyQ0Qy
OH06IERNQSBUcmFuc2ZlciBMZW5ndGggUmVnaXN0ZXINCj4gPiB7STJDRDJDfTogT3JpZ2luYWwg
RE1BIE1vZGUgQnVmZmVyIEFkZHJlc3MgU2V0dGluZw0KPiA+IHtJMkNEMzB9OiBPcmlnaW5hbCBE
TUEgVHJhbnNmZXIgTGVuZ3RoIFNldHRpbmcgYW5kIEZpbmFsIFN0YXR1cw0KPiA+DQo+ID4gTmV3
IFJlZ2lzdGVyIG1vZGUNCj4gPiB7STJDQzAwfTogTWFzdGVyL1NsYXZlIEZ1bmN0aW9uIENvbnRy
b2wgUmVnaXN0ZXINCj4gPiB7STJDQzA0fTogTWFzdGVyL1NsYXZlIENsb2NrIGFuZCBBQyBUaW1p
bmcgQ29udHJvbCBSZWdpc3Rlcg0KPiA+IHtJMkNDMDh9OiBNYXN0ZXIvU2xhdmUgVHJhbnNtaXQv
UmVjZWl2ZSBCeXRlIEJ1ZmZlciBSZWdpc3Rlcg0KPiA+IHtJMkNDMEN9OiBNYXN0ZXIvU2xhdmUg
UG9vbCBCdWZmZXIgQ29udHJvbCBSZWdpc3Rlcg0KPiA+IHtJMkNNMTB9OiBNYXN0ZXIgSW50ZXJy
dXB0IENvbnRyb2wgUmVnaXN0ZXINCj4gPiB7STJDTTE0fTogTWFzdGVyIEludGVycnVwdCBTdGF0
dXMgUmVnaXN0ZXINCj4gPiB7STJDTTE4fTogTWFzdGVyIENvbW1hbmQvU3RhdHVzIFJlZ2lzdGVy
DQo+ID4ge0kyQ00xQ306IE1hc3RlciBETUEgQnVmZmVyIExlbmd0aCBSZWdpc3Rlcg0KPiA+IHtJ
MkNTMjB9OiBTbGF2ZX4gSW50ZXJydXB0IENvbnRyb2wgUmVnaXN0ZXINCj4gPiB7STJDUzI0fTog
U2xhdmV+IEludGVycnVwdCBTdGF0dXMgUmVnaXN0ZXINCj4gPiB7STJDUzI4fTogU2xhdmV+IENv
bW1hbmQvU3RhdHVzIFJlZ2lzdGVyDQo+ID4ge0kyQ1MyQ306IFNsYXZlfiBETUEgQnVmZmVyIExl
bmd0aCBSZWdpc3Rlcg0KPiA+IHtJMkNNMzB9OiBNYXN0ZXIgRE1BIE1vZGUgVHggQnVmZmVyIEJh
c2UgQWRkcmVzcw0KPiA+IHtJMkNNMzR9OiBNYXN0ZXIgRE1BIE1vZGUgUnggQnVmZmVyIEJhc2Ug
QWRkcmVzcw0KPiA+IHtJMkNTMzh9OiBTbGF2ZX4gRE1BIE1vZGUgVHggQnVmZmVyIEJhc2UgQWRk
cmVzcw0KPiA+IHtJMkNTM0N9OiBTbGF2ZX4gRE1BIE1vZGUgUnggQnVmZmVyIEJhc2UgQWRkcmVz
cw0KPiA+IHtJMkNTNDB9OiBTbGF2ZSBEZXZpY2UgQWRkcmVzcyBSZWdpc3Rlcg0KPiA+IHtJMkNN
NDh9OiBNYXN0ZXIgRE1BIExlbmd0aCBTdGF0dXMgUmVnaXN0ZXINCj4gPiB7STJDUzRDfTogU2xh
dmUgIERNQSBMZW5ndGggU3RhdHVzIFJlZ2lzdGVyDQo+ID4ge0kyQ0M1MH06IEN1cnJlbnQgRE1B
IE9wZXJhdGluZyBBZGRyZXNzIFN0YXR1cw0KPiA+IHtJMkNDNTR9OiBDdXJyZW50IERNQSBPcGVy
YXRpbmcgTGVuZ3RoICBTdGF0dXMNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gQ2hlbiA8
cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2kyYy9idXNz
ZXMvS2NvbmZpZyAgICAgICB8ICAgMjMgKy0NCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL01ha2Vm
aWxlICAgICAgfCAgICAxICsNCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMg
fCAxMDM4DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgMTA1NCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUN
Cj4gPiAxMDA2NDQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMNCj4gPg0KPiBbLi4u
XQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzdDI2MDAuYw0KPiA+
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTVlNjAwZmY1MGVjDQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC5jDQo+ID4gQEAg
LTAsMCArMSwxMDM4IEBADQo+IFsuLi5dDQo+ID4gK3N0YXRpYyBpbnQgYXN0MjYwMF9pMmNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiA+DQo+IFsuLi5dDQo+ID4gKwlp
MmNfYnVzLT5yc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X3NoYXJlZChkZXYsIE5VTEwpOw0K
PiA+ICsJaWYgKElTX0VSUihpMmNfYnVzLT5yc3QpKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3By
b2JlKGRldiwgUFRSX0VSUihpMmNfYnVzLT5yc3QpLCAiTWlzc2luZyByZXNldA0KPiA+ICtjdHJs
XG4iKTsNCj4gDQo+IFdoYXQgLi4uDQo+IA0KPiA+ICsJaTJjX2J1cy0+cnN0ID0gZGV2bV9yZXNl
dF9jb250cm9sX2dldF9zaGFyZWRfZGVhc3NlcnRlZChkZXYsIE5VTEwpOw0KPiA+ICsJaWYgKElT
X0VSUihpMmNfYnVzLT5yc3QpKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRS
X0VSUihpMmNfYnVzLT5yc3QpLCAiTWlzc2luZyByZXNldA0KPiA+ICtjdHJsXG4iKTsNCj4gDQo+
IC4uLiBpcyB0aGlzPw0KDQpPSCwgbXkgbWlzdGFrZS4gSSB3aWxsIHVzZSBkZXZtX3Jlc2V0X2Nv
bnRyb2xfZ2V0X3NoYXJlZF9kZWFzc2VydGVkKCkuDQo+IA0KPiBDaG9vc2Ugb25lLiBJZiB5b3Ug
dXNlIDEpLCBjYWxsIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoKSBzb21ld2hlcmUuIElmIHlvdSB1
c2UNCj4gMiksIHJlbW92ZSByZXNldF9jb250cm9sX2Fzc2VydCgpIGJlbG93Lg0KDQpZZXMsIHdp
bGwgcmVtb3ZlLg0KPiANCj4gWy4uLl0NCj4gPiArc3RhdGljIHZvaWQgYXN0MjYwMF9pMmNfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsNCj4gPiArCXN0cnVjdCBhc3QyNjAw
X2kyY19idXMgKmkyY19idXMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiArDQo+
ID4gKwkvKiBEaXNhYmxlIGV2ZXJ5dGhpbmcuICovDQo+ID4gKwl3cml0ZWwoMCwgaTJjX2J1cy0+
cmVnX2Jhc2UgKyBBU1QyNjAwX0kyQ0NfRlVOX0NUUkwpOw0KPiA+ICsJd3JpdGVsKDAsIGkyY19i
dXMtPnJlZ19iYXNlICsgQVNUMjYwMF9JMkNNX0lFUik7DQo+ID4gKwlyZXNldF9jb250cm9sX2Fz
c2VydChpMmNfYnVzLT5yc3QpOw0KPiANCj4gRHJvcCBpZiB1c2luZyBkZXZtX3Jlc2V0X2NvbnRy
b2xfZ2V0X3NoYXJlZF9kZWFzc2VydGVkKCkNCg0KPiANCj4gcmVnYXJkcw0KPiBQaGlsaXBwDQo=

