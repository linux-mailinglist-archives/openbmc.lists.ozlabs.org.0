Return-Path: <openbmc+bounces-1292-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Et3MscMemlo2AEAu9opvQ
	(envelope-from <openbmc+bounces-1292-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 28 Jan 2026 14:19:03 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF734A1FFB
	for <lists+openbmc@lfdr.de>; Wed, 28 Jan 2026 14:19:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1NC62hslz2xm3;
	Thu, 29 Jan 2026 00:18:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769606338;
	cv=pass; b=a7UPXoaKOGXr3rCfNR5C1kHTQ+yGoBAsmUKVTxungOejJkLRFk/ZvUz1NqiHXisLJRQCEIU852eNGBTMkhRAfvJ82AbFvd9DTr6IQw1pRcPkNON6dp+BSrK1mMkevkrsEBCDxhCrCwaYLdZu1z8qiYIvgS75U4FOAxuyFh55rvQu0PKaDFAjpE/TTPoPEpv/8VXHIvbubNlT/shFLRSbBqDDnPpn9bfMY40p4MOM85icEAwjSwQr1y4YJgB07A23C8Fd1uqDTODRUH6DrrIYhBeUn5TkcOZ1L9szWQV4/apzftP6KjLkQeSlMw4ba+C5L0IXDcUWd/wW7GI9qAdlpg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769606338; c=relaxed/relaxed;
	bh=pRUKz0MbMXNxoliAcNkuHlnLevOAhpE9RnBTW7h4R40=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B6MoamDhgWoVLLFlEkB5p5fAVM3psFpBMGjRwsaQicR5gjox+apedN9JJKWO0N8dWkWPyD2lSMebqBUhlDrWaFK5DU8zQ8+8Kwnu8JUXJ07yiQedYqlxUFUFLon1FqUfbYCxqLjDWP66cMhfIh7a7+nS1nWz4mwxml8uTlqV3caIVdNEllKjm+/C1F1N+KiI89dEHKXvTCOm/uvlpad17kBoyovOhJ+n/hVrFMAPCJXmTT5Bz5zDasf0w83UwqIAIpMOkLUfFdsiYnpBqelVvkvMwMySbbN5fjK10f2RCgLwInchZI/npVyISxOaTXItDJBxHsQYq+c3MIjbeSUSJw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=DulR2H8c; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=DulR2H8c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1NC45gkdz2xjK;
	Thu, 29 Jan 2026 00:18:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhEBTLEuXjy8B4nclNNN4hRf940VRf895lqLec7NMxgbg/P/MEuPOiiHqv2Itsqy75N277lj623pN3UyziTN0N1hjXLmw3dicl86rHIE2iDFjAH7nKP1hezFHywoxZAz7AbdtsxIGmSGiD2i4EQS0005nkSrLs+JXIOhGI/QCQKRxLCt1ycoS3yboeis5Yk1uaS5GJssO9ZyON1gnlHEj0y0flQ+DYC84if5hT5BpC27LZWU+bnewjlCXQ9VUz3QG6vgY4erC8rUIPmpmo06meMPzPLS8O8xqZpURbUTuh9ZMvbDysWIUxK8VLzck6OwvB8Bryxrj0+JewjhmNfMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRUKz0MbMXNxoliAcNkuHlnLevOAhpE9RnBTW7h4R40=;
 b=T3UCAtaW5hoYDHR0S3Uulw6z6LF41y29yEO2FTtw9rYQCJ2YZN08TUmTe1yOzjOHOZwWddYVUdbXK2j7K0lPaYjSiDsZSSf3T8dmbkjwm4XyDoJ7OrwsipAZIjs3x1U/zYGvQ8gcJArQHbIW2GgCHLVsR5S+5grMFwHGGshJMXPK6g+JW/KawKti2N47T0H3lIfhi0inMqRmgzLupCEHyvfrPcfsQ8zC26QQ19l/rboL/rUaa849apBWWn+55InVZ8gxR6gmjjyAvDY2oJCGxiAkmrXTM0PbFVpnQemd5JfGKPmDNGC6ScNyU78AdGUZi7qs1JWdffCqpSXN/Uv8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRUKz0MbMXNxoliAcNkuHlnLevOAhpE9RnBTW7h4R40=;
 b=DulR2H8cA19K4LDgF5bkExiuuTgttdd1VAwRPH3tKP2tc+BQWX348dTH0rhEcyraIx6YILSTacH6k78nGAoRrdNqRk4Reb3PaHpEzORnKwYY6755QDtzk9nPIb37Y3vrrtKn86piFleXfSTd6RESr+KC+HI4UKJyDNyG3JAUdv5VSeTRvQGFtySzBjFGjtgqrNBMFVw1D9elYCx+KZNwkL34O7IaGXASoF9aBF61euIIf9BUuSCHs/OOQOMulJZfqqyltZ4XqvEVXZkSdccvniZohfhvBuIoAL1y3jV7gGNSJ+FaUkUMXltWJi5HU8h3DJmQv6R2Jq2Wy1SPe1sM+A==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by KL1PR06MB6624.apcprd06.prod.outlook.com (2603:1096:820:ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 13:18:28 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489%3]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:18:27 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Mark Brown <broonie@kernel.org>, "clg@kaod.org" <clg@kaod.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, Boris Brezillon
	<bbrezillon@kernel.org>
Subject: RE: [PATCH v3 0/2] spi: aspeed: Improve handling of shared SPI
 controllers
Thread-Topic: [PATCH v3 0/2] spi: aspeed: Improve handling of shared SPI
 controllers
Thread-Index: AQHcigiFuYg0+/7qUUio4Mli5bHqW7Vnmb+AgAACzMA=
Date: Wed, 28 Jan 2026 13:18:27 +0000
Message-ID:
 <TYZPR06MB520330043A3072973EC430E3B291A@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20260120123005.1392071-1-chin-ting_kuo@aspeedtech.com>
 <176960558580.1648911.5452842376187241181.b4-ty@kernel.org>
In-Reply-To: <176960558580.1648911.5452842376187241181.b4-ty@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|KL1PR06MB6624:EE_
x-ms-office365-filtering-correlation-id: 8cfb9550-0c54-4a7f-7217-08de5e6fb96e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WDhraHNVdVFCaW5CR2ZSZnExeVlZY0pTNG5aSllzVS9BTkErcFZOSUFOU2Zt?=
 =?utf-8?B?RGJ2NDF5cG1ubGc4YzgxSDQrZFVSd21zVUJhRWlGbFdYNVRVN0w3eG1tYmpi?=
 =?utf-8?B?bUZlY0lPZXVzbXYyNXZGeXkraWRHRzZTN0g0VTk3MlpCQXlDUktIZjQyM3JE?=
 =?utf-8?B?TVdCblN0NUd0MVhKdWxHUzVzNVk1NU4vYmJWTnl0OGFNYzB1cmMxalArOUZz?=
 =?utf-8?B?NzVoM1NwalpLTUJ5UmlLTnNCMGJDV1BaaFI5aVU1bDYwdTE2VWg1cjRCS1Bh?=
 =?utf-8?B?clRzK2xzNi91UDZWV2svNjRwaUNDUXBCZFV0d0ZpeWc3cnNiVG9KUndEb2tq?=
 =?utf-8?B?aXRuRnExbzRvTkxGU0lXWEM1elFWdnBuV3RSUytmeVdEU1hLNjBtbFlaa0hH?=
 =?utf-8?B?U2t2am9LYlBuQ0JaeEJFNlA0eEsxRVc2bHp3OEUxOUU2V1picDd0SmY5TVJF?=
 =?utf-8?B?c3F0TDltaUdVejNBM2EzRHVndzU1YjVPRXk5MzF6K3hCcGJ4RnU1Z1RjSUdm?=
 =?utf-8?B?WS9RUUZrY0tJdFJrVE85alg2Q2Z2MmFqRFltQ2grWnRwY2J3U1VxeUZGc0FB?=
 =?utf-8?B?OWNhZWlnd1dXWU9uTXZmdmV2eDFqTjNVaDZUZGhxM3kzTUlKNlpkV3NtSUdm?=
 =?utf-8?B?QzdvbXNyalZGUU9LYzFMZysvU2dLbDd2K3NoU1JicCtIZTArRUZ1UU1uZFN6?=
 =?utf-8?B?U1MxanJ1QWk0K2IwbGZGMU12YmkxV2VvU1RCMUErQUxWL0tWR0dqZHZlYlls?=
 =?utf-8?B?YXpUODBGckZ3c3Bib2ZOSmtQeTBVQUQ3SUE1QTBRNzZqenA4eWdPYm9lOGU5?=
 =?utf-8?B?a3pkZ3NUSFF4SDFlb0FXNW5BbkhmWEszRndndE9qZFhVa0JzdmVpTkRwdVlS?=
 =?utf-8?B?WjVNck9TRURCdWQzeHZpZjViZ0ZQS3lrT2tuWDZzVEFzdldUdHdkdTNheVVr?=
 =?utf-8?B?d3FVVEpGd3lCMDJ5WDNZUTNBT2NTOWUxS1BpYWRFS3BSODB2Ui9YS2ZoN3p3?=
 =?utf-8?B?NXh3SWVmR2hBcHcwRU5sYWVRaitkWnI3bGhlS3ZlT1NzVWxVNnl6QTJJUEcy?=
 =?utf-8?B?WEZ2cStReVFNYXllaDNFdkFPRjBpcGFERFRGUWJhSTMyNXVZTzdnNEtwY3Z6?=
 =?utf-8?B?NHBmMXRKMVdmWjVNcWtuOUcvcmg1aktnQWhWYTRleHpKSzVQMktOVDQvT1ZX?=
 =?utf-8?B?KzBiRERxS0dxckhNWDV3TFR3NGJVeFpVS2F1SkR5UGdVSCtkZWNyUHBNbVJI?=
 =?utf-8?B?OUhiRFFmYXIvelc2MlBsT2xWVE9sdmdVT3pUaEwzTkxLdXh3TUhnVWE0d2hr?=
 =?utf-8?B?WnJ0OExNVldmWFdhaGhlNkIvZldtQkNzbmQxanF5YSs3VVhPaks0c2k0am5h?=
 =?utf-8?B?Qm5RSlZVampLT0hvN3c4NlgvQll2K3JOV1hSYTN3RUdjc20vZllWWDNrV3BW?=
 =?utf-8?B?bWNCaEhEbTFqYUcyVVFsL091aHVjZGQ1aTlhb3Z6dDVWWUowMGk4K2t5NUxE?=
 =?utf-8?B?VUFjUnNibGRRMkR1UFJXWXNPaVpXSjRJT3RvdStKcldobHptVGF0Z1cyY0Nh?=
 =?utf-8?B?VUVYQUJvV2xqNUVkb3lyK21KWE9jQ0pUNHRaengwbVJYNWhtVFJBQit0dGI2?=
 =?utf-8?B?YmhxNSs4ZjBrZUFNQytQNzlad2tQYjZFbndPb2pqZWdLdzFhUGMwQzZpTVJ3?=
 =?utf-8?B?MTF2WVhEUVVkbENaeWVNVHZlczN1UEthT2k0NUVOcndqbG1xazZlM0Q1OFRw?=
 =?utf-8?B?WUVmdHhCSThIU1QvOXg1NTFjcTJ4cW1IK3hOVjZ6VDNVOE5RbHl1VktuZS94?=
 =?utf-8?B?S0pNdVVWdHAwVE83bXRBa0VqNW1FZmdNaDFlNlQwMFFzUktybmRWczdwU3NQ?=
 =?utf-8?B?bytORjNWL0tvR2dob2VnNUpwbnUrU0hWMWxVaFBVOE5mQTlTK1JzZjE2UmF2?=
 =?utf-8?B?SlIvMldxR2I4R0M3QU95Nzh5RmNhWEE4RjI5eWxCSXNQV2xEdWhJc1FkRThx?=
 =?utf-8?B?NzNyWGNuait6aHFwQTVQb0NhYk9YUUp5c1hTYUFUb1plRkErRHNiZlF5MzhP?=
 =?utf-8?B?ZFJQS2t0NXRRajlyZEtZMlZ5bWpPK2ZUVHZCVXJPbEtrRFIxVmtvOWo5YnRm?=
 =?utf-8?B?anErbWVhRmQzOElPVW55Yjk0NExibkRnY2ZWbHNQTXU2Snk1bHlaQi9jeGZ3?=
 =?utf-8?Q?IN2JtbELQ9eS+QkM6BO7ycgSS+poIMTA1UeDod9HdJQM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTVzZ1prMTZ2L1RPd1RONWhhSzhhM1NjYmNVS0h5K2wwbXgyY0N6T1BER29z?=
 =?utf-8?B?WGxoYWlDQkJBYjJaaTdvMUNBRFA3UTRtT1RSZytmaHBYMGd5Rk01akh1MTJQ?=
 =?utf-8?B?MGtNUisxRnJMMnRMT3Z5T3pRUnVrdG9sbEUrV1BDanF3bFdySTRULzVpMEJa?=
 =?utf-8?B?TUR1OHM5OERzNk5SSG1lQlVNL2FidWU2ZXd3RVVTdkVNaDhkSk1UdWMxUHc2?=
 =?utf-8?B?ZTZDYWgzY01lZHpLTFdQZ1lpVFhLaW1waUNZSmFpbnpkU1EvRGpZN1cxazM3?=
 =?utf-8?B?cDJWcnAzQTJDSDFLYmdkRk5rN2pTWG82UEFJRDh0RS9OYXc3OW1GSXFIRzZ5?=
 =?utf-8?B?MXE5ZUJYYWNVQTRqUVZlYUJzbS8zSllVdDVKWTZQZzQxZjEvWmkrT0JDYUtY?=
 =?utf-8?B?MkhTZnNMY1docDRKTkFPaHFiMWFmbTlmRGZkU3FKVzhxSWhOZDRWZFZNN3o3?=
 =?utf-8?B?aEVZWGV2SWp5N1NEc0hYSGE2KzNlcmJwbm5jSThrQzNSckRYMmJvZ1JFMjdY?=
 =?utf-8?B?THZ1bjhtN2FCVG1FLzhDTFhnM2tNYklxMzROMUE4aytINURaL05GdmpDL0ZX?=
 =?utf-8?B?ek8xWFd1VHF3OWpnYVJnV1VzZk9QTVZ0RGp3c0Q5bE1xazZlUE1mejcreHRG?=
 =?utf-8?B?SlFUTnlGaWt3Nm96a2xhdGFwcUdpOFFiNE5UVjNNK3ZhOXBVN0E0S1gyc2w4?=
 =?utf-8?B?NkZ5bDdIbzR0QTNuSjZxN1NtWVl1enVhSW1WM0x6YmlzbHdvM2tqQjZwV3V0?=
 =?utf-8?B?Sy90RnV2SHJHdkRjYlZaN2V1WW43eFVxYU1BVGJ1RjJyMkVrQUJURTV4RlpZ?=
 =?utf-8?B?UHRBMUt0dFZ6RGNlU2dheUV1Y3l3Rzlna2U0MG5aamN0MGcySjdReWwvV0ZU?=
 =?utf-8?B?R0I1RzU2SHNCUGR1V0ZGVmFUbGhqaE03MUNBZnpHVzVnUHI0YjRYUzBLTXha?=
 =?utf-8?B?S1pXdkFSQkdFNTQvVDlOanBqczZjMHdMUGJjOEtWcG96c3FMRmV1cXlxVmly?=
 =?utf-8?B?L2poVmhteEw4WUFpNm5LMkpiMU0wcHpQbGxtQTNPcityM2pXMGpYY2ZmOTVP?=
 =?utf-8?B?Q2NLQmplU3R3WVo1bHdFbzcyWmVwMGkybW9uRkZ5bUJjNW1pOHhGMU9OQkEv?=
 =?utf-8?B?dHRDRWxxQzNqSjJTVkQxemtCSC9QdHBZNWs3UTdpWXdZSmliQ3Y1U2lLWDF0?=
 =?utf-8?B?S2YvczhOS0pFUG93VmczZEk1RVIxMU5kT1JYL3BkZGNyZjBBd3UvVFZleXd3?=
 =?utf-8?B?TVdzdmRTdGtwZHpvQWZFVGhTN1pHOEY5emZ6ZmlERFNoVVR6UlcyVVNuYnho?=
 =?utf-8?B?M2N4UGdINGNBUWhleFhQQWR1QklZY2dpbnJTTWdDYmd1Z3ZqK0UzWTlaSXNV?=
 =?utf-8?B?cWFTMEJ6cEp2NE1RbTVYSVk3OEY4OWtSV1d5d0UreWRMa0UwQ2hjS01TZmEx?=
 =?utf-8?B?SVRNTkFYcmxOZzJrdWVWSWVTZ2dtVEUrK0w2bmZvV1FSWUV3Q3BaUWVOSngr?=
 =?utf-8?B?bGIrTndHdDUzYjNZdkE0YUJqWFdTZUxPN2N4RUM2ZkJablo4dDdOODRqM1g5?=
 =?utf-8?B?K3pFdHRiTy9ZYTV1UFRmeWMyM25HSXRlaC9TUnVkbDU1UDBpK2FhN2p0WElH?=
 =?utf-8?B?STB3WHkzMXlzcDdJaXJvYlR4S1dIWElZUnhzRm9Rc01qWVA3T3I2WGtqNVNC?=
 =?utf-8?B?NGVySjBRNXZveFBkQk00cGgzZE5qMEpINWI5MlRJcWJuWGpLK2ZWTGltWkRH?=
 =?utf-8?B?TWE4TnlJSmZXYXJPQXdEZHN5cjl3UTlLRDNTakl4Tm5ZbWd5OGV1Mmcrek81?=
 =?utf-8?B?cGZkVXo0blhnL2pkOEJOdFhUYSt5Q2x5bVdtWlF6clFZL3pJU28rSFFVVXlJ?=
 =?utf-8?B?a3RRM0tGVnFqT2VaK25qSm5zNnB3M3hnVndCOGJKUDlTbExteitHTFlnR3d3?=
 =?utf-8?B?akpSYmd2QWdlN2N0aDhyajlDeHNYZHdyd3d2L0Y1K24xVnlId3A2SnZMSnps?=
 =?utf-8?B?dXo1NzdkY0ZvREt0NU9CQUFIaVM4Y09YL2ZxQTc3N20zQ1kwYmcvWHBCTE04?=
 =?utf-8?B?ZHJmUm5vdWpPRWFrek1LRjlwWXNtM08zWStteWFtSzFWUEoxWld2SXp2VFJs?=
 =?utf-8?B?bTlHV1JCSjNWUFNyQ2xROWkvZlVDTWk3VEZodFNFSEZYTVNmdkdjNVdmWEJ6?=
 =?utf-8?B?ZXFwZGs5NDN3Zmg1bHhTdmpyNEpGUmtvcVBwZFI2bjhCK3ZXMW1KWTVDang3?=
 =?utf-8?B?VFNMQjhub0llaUpRUmFsb1llQTZINE9qa3g0LzltZ1VyYi9BNUoyUTRiKzR6?=
 =?utf-8?B?R1h4Z3ZTSGxCMUZQa1Vmemxtek5SN2hkcHo2NTd5Y3lvVG9HWXlyR3lqd1pQ?=
 =?utf-8?Q?SYT3k8uK8po6z8P4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfb9550-0c54-4a7f-7217-08de5e6fb96e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 13:18:27.8472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCmYjgqUODHZn8APYrU9JNSKXEbaFpaj/Dadxy9DGxDsUOhnTvnw7otvaXgqm1jJXDRw2ToyQc7P7VEBhwXOFNpOfGO5uyTW14iLPU4eGv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6624
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.10 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-1292-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chin-ting_kuo@aspeedtech.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[openbmc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:dkim,TYZPR06MB5203.apcprd06.prod.outlook.com:mid]
X-Rspamd-Queue-Id: CF734A1FFB
X-Rspamd-Action: no action

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcmsgQnJvd24gPGJyb29u
aWVAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDI4LCAyMDI2IDk6MDYg
UE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzJdIHNwaTogYXNwZWVkOiBJbXByb3ZlIGhh
bmRsaW5nIG9mIHNoYXJlZCBTUEkNCj4gY29udHJvbGxlcnMNCj4gDQo+IE9uIFR1ZSwgMjAgSmFu
IDIwMjYgMjA6MzA6MDMgKzA4MDAsIENoaW4tVGluZyBLdW8gd3JvdGU6DQo+ID4gVGhpcyBwYXRj
aCBzZXJpZXMgaW1wcm92ZXMgaGFuZGxpbmcgb2YgU1BJIGNvbnRyb2xsZXJzIHRoYXQgYXJlIHNo
YXJlZA0KPiA+IGJ5IHNwaS1tZW0gZGV2aWNlcyBhbmQgb3RoZXIgU1BJIHBlcmlwaGVyYWxzLg0K
PiA+DQo+ID4gVGhlIHByaW1hcnkgZ29hbCBvZiB0aGlzIHNlcmllcyBpcyB0byBzdXBwb3J0IG5v
bi1zcGktbWVtIGRldmljZXMgaW4NCj4gPiB0aGUgQVNQRUVEIEZNQy9TUEkgY29udHJvbGxlciBk
cml2ZXIuIEl0IGFsc28gYWRkcmVzc2VzIGFuIGlzc3VlIGluDQo+ID4gdGhlIHNwaS1tZW0gZnJh
bWV3b3JrIG9ic2VydmVkIHdoZW4gZGlmZmVyZW50IHR5cGVzIG9mIFNQSSBkZXZpY2VzDQo+ID4g
b3BlcmF0ZSBjb25jdXJyZW50bHkgb24gdGhlIHNhbWUgY29udHJvbGxlciwgZW5zdXJpbmcgdGhh
dCBzcGktbWVtDQo+ID4gb3BlcmF0aW9ucyBhcmUgcHJvcGVybHkgc2VyaWFsaXplZC4NCj4gPg0K
PiA+IFsuLi5dDQo+IA0KPiBBcHBsaWVkIHRvDQo+IA0KDQpUaGFua3MgZm9yIHJldmlld2luZyBh
bmQgYWNjZXB0aW5nIHRoZSBwYXRjaGVzLg0KDQpDaGluLVRpbmcNCg==

