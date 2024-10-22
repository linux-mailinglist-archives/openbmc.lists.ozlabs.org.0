Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F419A965E
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2024 04:43:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXc1k2hhcz3c4t
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2024 13:43:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729565015;
	cv=pass; b=E5Knr0ej499vJWxMvobvNG4JkE/Wl4xAKuH6xRVQIUE88RMnrEQS/OzT4MlXLQNCNcacq+uF6/457nuOqyF0xVZ3QGFl3w3SGU8VFqtSjQ/hCrmH8mMieKpqUEsQ8cEsbcNeF9ynbxbVpZH5/n91xUC6ASzJh0/WkIFKdq91rXJFyWpmiEuztlw71VsRtLystlXSd4ix0XjkiUXeXrJ6F1EYebpbjhQe8BPycDfqRWmVdESE28PjFmQHBE9mFVohJFNdreG7XnL0beEGAMoTQFjuAAms1X6OzqMlPZjApJbkAG91x5uBzSqXFrawYFNAzWSuHYRWDEXbHeA0PyCFdg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729565015; c=relaxed/relaxed;
	bh=mEMNyCEwMWRmcHdDjbmxclgGRkH7KTG6X8d3wyiaVSk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=grhYNdF2+6V/hFLnBZr8fHEBz9flg3xellJpbGeBD9NFqY67GIWh4pE79/4a/nB8PNKPm5z549VVO1M3FJISPQsIeudE6I0DPvTjY4JR0Kp0hYiEsiDXkDhKC3+8Fi2smvZ3Xk5DGN4oG71X8h93OvlZjfYvE0J1SWE8pYiwao2TqBVBymyOMzYTroZWfdmJtDsLKavpkdA7hcA1UM+ApQATKqKAf58Tl/OqVXvnNzGMf5k0mGAhdoXscRYWJDOt3UP25zt9Y0TSU+OSfRb5LmDSNUppoQ8WwhNBJnktd7zrSVKDGarlx+LzXFKW3rEV/565DlKS+1YkoC6k75INtg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXc1P5QXzz2yV6
	for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2024 13:42:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mw/ufg+RxDiX7Qte1vxOwBzmr/6r3F7EhxuXx723QQ3LCwT0MnnFu28lU0oJ9eT60eUT4MaN/TdEQsa4XW/SDxC2iUhMedoR4O8k/l/I9dHTpfKXYqbqsUuQP/rLqjAFvGZv1h0ONyGWbBuNnzQc/7pAKoQ2xZWYR8hX5ivDwGjNHz6hlV5XgrFy68V+lnZr+6J4TGNRyXRc9WU+al7OtnSm0IxWUL7HcIZ14FUUibwP4AigNAPHmN5J3oLPYRu57wWpS6UVuQLDKALPZba9A3+hmZxFmVXYmhpnud1QaKtqImrygZScAbGu0jbgg0x8jHr8xwQo2JDI+rFl/T4+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEMNyCEwMWRmcHdDjbmxclgGRkH7KTG6X8d3wyiaVSk=;
 b=YtW/K+2/LUNTEQEQVjq89YDfkFuB7aFQoReeZAoS3JGEzWq9EILk2eZHz41aCSF9Kr13qPKBMzilT2a0SCI23VKs54u4piU8w7PQvlgQ5FDXLd+igSQ9JGXBhTY76sWtyd/HSKYbpMSGwGX/f3/+IRgvvdsIe1VDf7xK2s0rKxs2Q16I8qDCPCgk3gO57u8FK2Fzcz+8rBgYZKM/PsYS6URkH3gbZuogf1Sh0iuLuNXOcW5qZ60UociTxtlo74zrHBqpFGwW+Rb6bAj1lCdv9DSbnIPveg1TdsK/zvEVpNED+LmKmpWcsEGZXku1NbDAMQq4t/dGW39D+ua+Y21nug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEMNyCEwMWRmcHdDjbmxclgGRkH7KTG6X8d3wyiaVSk=;
 b=UKrZMLIi+lEpNRCGEBXCBey2nBx15BGR3IHIOp5tdgxRQk1/eBU52KTCzLcSRHD62TFH39Ot+MEsNwBLqhA0v27Le/fQUc3NUFdo9qmiAdz/4e16dPDGC4fw1ySl1UBPJ/Sy6Mbk2BxuU+vMSuD01qeygKmUMvsrfO7vCEbFPYzIeZ2JCD2ym2XZoGLq5M2sybTkE1jLNIPuCo1rJSi4Us869mNhmsMofsgsxb8i4KeC019gQ8MigYBVXC6epXZfGoz9zmmW3f689bF/m6fJvLKoRH7SIkJLe+osFzgmkkf5U8JKUTOvsqIg8K6A+a8znqEZBBwEWqQaATUibZTb7A==
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12)
 by SEZPR06MB7226.apcprd06.prod.outlook.com (2603:1096:101:234::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.15; Tue, 22 Oct
 2024 02:42:09 +0000
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2]) by TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2%3]) with mapi id 15.20.8093.013; Tue, 22 Oct 2024
 02:42:08 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "brendanhiggins@google.com"
	<brendanhiggins@google.com>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>
Subject: RE: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Thread-Topic: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Thread-Index: AQHbIRC4mm8MiKb1p0WGejEQka9JT7KRHGgAgADqSOA=
Date: Tue, 22 Oct 2024 02:42:08 +0000
Message-ID:  <TYZPR06MB6191EBA63B87FE5152AF029DE14C2@TYZPR06MB6191.apcprd06.prod.outlook.com>
References: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
 <e06a0db538bf62d4aeb7352ecc81a3a679fb9eec.camel@codeconstruct.com.au>
In-Reply-To:  <e06a0db538bf62d4aeb7352ecc81a3a679fb9eec.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6191:EE_|SEZPR06MB7226:EE_
x-ms-office365-filtering-correlation-id: 43df6462-b7a2-47c0-275f-08dcf2431fae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?cVUwOC9xWURkWkxsRXpZSnBZU1dIY3p5RmNmVDc1TlZBcjFxdzRpUTd2cmlp?=
 =?utf-8?B?QVJ6ekpOTzhxSjBDREhHSHV2azdIRjE1bys4d2RhTlhKTWlpaGlqWXF3YUw1?=
 =?utf-8?B?Y0VWODFqSXVqcFEwZTJnVnV0dFpBNFJpbWdvY2VJZjQ1VVJuYXFwY2E1M2VW?=
 =?utf-8?B?VVF2L01aZ0V3Qk9abjVRL0h5ODMyQ0hrczBBTElnc3hpY1F0WFNnODAxblBD?=
 =?utf-8?B?cHdkc2FubmQ5MmNYTTdqNHFsajFQc2N3R0szZGFRUkxmSXFhRW1FRXFsK2Y3?=
 =?utf-8?B?OWhaWEgxSlB1VndOc3J6SUsrMHpNZzJodVBMWk5PQmx5REFGNkJlNlY1M0Zt?=
 =?utf-8?B?bUZHY1dQWWpvMmlUVUU0L1BsTUlHSFlsNTh4NDF3WjlRbWg2Qm1qeW8yaHkv?=
 =?utf-8?B?c2FIN3pybXVOU1pMalp0ZDI3a21OVHIyVUJNM29xeUJxdFBvSExhb1NYR0Ey?=
 =?utf-8?B?elZKSXlKK3N2amxqSXJ3K0pzZHkveHlQSlVJc2Y5ZWVCaFduM2VjLzZvL3Vs?=
 =?utf-8?B?K3JUWG1NUGw3WG1sanRQVm9nRHZ5a0YxZHZaMHZGVXAzZWJPU3VHSWtQS2pP?=
 =?utf-8?B?ajRqWHdXZHhONWljUXVqUGd5UW9oOE5GSVYzaWVwNnJqL2pKTW9sTFF6UzBC?=
 =?utf-8?B?WUgvNGF3TGRha2pnNldNb2FraURDOGJ5bXplK1dCM2MyTmhUaC9qWXl5MlQ5?=
 =?utf-8?B?K1FwbVlyd3pEZDFIR0hXQU9JMzVRMDdzeXFxTlgrc0NadGcrdGR5VFp3aStU?=
 =?utf-8?B?Ukk0Wm9WbEEyaWZIWlVZeXV3L3hMSWxJakdJNFVBQUU3MHlRTHVxZGk4eFhr?=
 =?utf-8?B?dTdOY05FNk9XejNWRzN1V1FyRnFGalZaTTByV1R6dWM3R3FlYlJma3pFQldi?=
 =?utf-8?B?TUo4Wi9HRU5abWxaOGZBV0lnTlJhbFVIT3lKalFvZXdYUnFVSlFGRE1DNXZH?=
 =?utf-8?B?cEpiaC9nL1Q1ZWVZdFZJSG5MTnhSMjRGYWhsZXBuUlZkVGY3MlRZWnZMT1ZN?=
 =?utf-8?B?b2N4dTFrdG1UY2NQaG9aeDNJL3V4WEFhcHdQeDhhVzdGUVpsbHVSa3ppUnVV?=
 =?utf-8?B?d2FHdVZZOWIwUDNTMkRhbUphbTF2WkRrbTZyR3I5T1oxZmp3SXFBbW1pL3lo?=
 =?utf-8?B?TVVLOXkvWmpSSFJIR3NaaU1pUVEyajNaSDF1dFhIalIyak1NeVJEL1d6cEJE?=
 =?utf-8?B?dUlmTCtkUURncXlGZml3VHhhM0docVVmU0RYRjJuZlo2TUY0bHJ2WE9KSXdM?=
 =?utf-8?B?Nk4zSzFNYm8vdExxRFdYQkhPcWZrVTNZZnVJazBNendXS1lrdVJEdUZFVG4y?=
 =?utf-8?B?cE1PRnlqYjRpYVNnNjJCSWhBME5Xc0pHZmFlVXZFajVmNzFhcStJaXc4YVRV?=
 =?utf-8?B?dVpUUVV1OUZNL29meVNvbjdMaXpaNUhSUzArUFUwRmpZR3VIMm9PdmdZbE5G?=
 =?utf-8?B?aXY4UzVEWHY2TUZSSk1sRHJjb2wxbTNjTHhWVEVVcXNGUEU1YU1vdkxndmd0?=
 =?utf-8?B?aW10V3hoREZsbzRXZWNGNjRuNTlJOFJ4OVBXMEs0VkZzd3Jacm1PTnlRZFp4?=
 =?utf-8?B?bTFuTmlnYUQ4TzlRTnBzcmJxS09pdDVjaHQ5UmNaaFd1QVZnNGRYSk9VMkh0?=
 =?utf-8?B?b3BHZGtFYnNBTmswb2FTTG5JeUNGL0VFZzJ0YTAvVThQdFpQT1RmekdOQVd6?=
 =?utf-8?B?bVdwaDdtMjhZVExmVFZkaEg1ZnZQRzc0dHc2Z1F4dzg1MDlUazlrN29JRU9X?=
 =?utf-8?B?TE5WS3R5ZFJITVdMRVlvVTdESjJxUmplUHl2MXZaeWVXSG5rM3BFWUdNU1hN?=
 =?utf-8?Q?s1J97xEWT8io/wUNEJLmopAvfi6XtHa+0aOm8=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6191.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aEJyaTlFb2JJa1Y3bnhvcXpyWjlONGFpMTlLRlFxTjA4VmZiQ3ltRnJoYVFq?=
 =?utf-8?B?N1M0TitGRG9yZS9DVE5pbVpITEdQb1VuQVA4VHZvNzlqUXdLSUdlMG9FQWxY?=
 =?utf-8?B?R0NpSmlqNHA2UjZDU2JzOUhOVDY1cnFkUnJlTDJGeGs3M1FsYVpuRm5qdmJh?=
 =?utf-8?B?WGRxWC9NRysrbVBVaEVSSkFTODZ0eGVJTzd2S21CTlVyMU14Sm12SFhFcXl5?=
 =?utf-8?B?TTJaN0hTUDM1SlNJSVhRRXk4d01TMnJZS2kwL1hNMXZFSkJlR2hwd0FIN3FU?=
 =?utf-8?B?bVZwTTZwOHhCSzAyNDRKdEFjb25yQ0F4OXI5N0JkMG0zeFVCTW5wVkc0bm8z?=
 =?utf-8?B?aUlwNXVwRTlXaS9qQWhRSHJhTlN2ek1jS005YWQzWnp2N0FGOExXbU5DdmhC?=
 =?utf-8?B?bDYwNk1aOFBxcDVHWmp6N3Z5alV6ajRNSXpobVBkQ3crQzNRY25NRlV2R2JT?=
 =?utf-8?B?ZlR2Y0VtYWdWcVlrZ20wWXo0bnZIVmU2NVBiaFpFVW80SmFJcm94YVdjSmhU?=
 =?utf-8?B?bG5XWjU4NlNJeXYyS0h2bnhOMzJUemV2TExSYVgvYXlPZlpXM1dsTXdCOWJW?=
 =?utf-8?B?MVcxSWlRWkxQRWIwK3kwTHlBNG9sTVJ3ODlPKzlKd2ExNVNuVUFpaFpsUHJq?=
 =?utf-8?B?bmQrRlN0UjRSTnJCTXo2R1N5WHNJNG9wWWNmWDNLMWlGRW5MdkU2OThVNjl2?=
 =?utf-8?B?NnRWK0xnNjVCVWw4akd0RmxRd3J5VzlsUFphLzdINW9UOUVTS0lMemhqZTNE?=
 =?utf-8?B?TUZXN3FDeVYxUTg2K21PWDd6UHFGcDkzMmRMTHRaQjlncGZBaG5rRllVWFRN?=
 =?utf-8?B?VmFzaHRyOWUwekUwckxnWUREUTVoTGZJLzhiNGJPUVNLTjhmd3UzSTdEbkVQ?=
 =?utf-8?B?bWVXQUFhcG5yR1o2QWtsRWhjYUp0OE1wN2d6a0VYaVNxaUhSRlJQcUVBSTVI?=
 =?utf-8?B?WmozYjNxZERJckUzSlhMYmlOTlhqb2M4RTlkNDBMejJjdE9UNytMV0MzM3RG?=
 =?utf-8?B?T0I1MlBhOEltT3A5TWV4c1BDUTVjRjNJU09saTFhYVY2YlNMQ21TSndTMUh0?=
 =?utf-8?B?YXN5dkd5QzVIVXN0SEhSYk1HTmZGRHk3Qy9BZFpUUTZwOHV1SUxuVVY1QkJV?=
 =?utf-8?B?QkFzRTBxM0Q4TTB0TDEvc05FYVdxUE9ETnJBLy83NzR1RGJWa2pPSTFYWjZ0?=
 =?utf-8?B?eFVmWXI2YXBtNkFpKzIzeVRPZFFMbEVBZk8wN2xBV0JxdURMcXQrdS8ySTE2?=
 =?utf-8?B?TFRtVGZDNmNvYUpxdFFrQUFZSjB1Qzl4RDZvaDVBYWs0QU80Y1M3OXhtQWRa?=
 =?utf-8?B?UXI4R01aRFI4VzZiT0Vma0tZMm1KMzV5US9pY0UwTXNOR0ZvZ1lSWjNhVDJJ?=
 =?utf-8?B?UHpwbmpWUFVaQlV1bzZTekdYbmRITVFLTThKZUZ5bW5HekNBZnhNdFFlYUpI?=
 =?utf-8?B?alZFbUluM3E0aCtQamVRUHlkTnAvVmlQRkNZbnZhWDVUeXJhWHdIZGFJMUZt?=
 =?utf-8?B?TTBFRlVDTUJTbzFiblVxUUh1MVJIeEFZOXpNNEp2RzVlUzJRV3BFMnZ1VVVa?=
 =?utf-8?B?MUVXYTNhQUxEYnpGMzQrSkNMek51U20rYjdFVi9PaFpScHpBZHNOYUhtN1FM?=
 =?utf-8?B?Y3ZZa01xaVpla1RBS0tpd3N2SU04NkVscWN3SlJ3U1BsS3dqbE5kUzdvaHAy?=
 =?utf-8?B?ZTBacGFQczlTUkNtU3NJMnNvbmV3RjRsLzhGVE9aL3hESUdjSUxaWjdRVyti?=
 =?utf-8?B?dmY5Uk45VkVUUGVwSVJIVVp2WnZsZURoMGEweS93b2NDUmFEYjUxd2lwUHhO?=
 =?utf-8?B?ZmxzMXdGZEJMN2UxQUtQME91bzQzZklFK1lJODZSZ1FLRGJMYUZUL3lXVUxm?=
 =?utf-8?B?ZWNVVndpWHZ1QVNQcXZnSXFROC96TUcrR0N6WGRxR3BvWThOY28wOUVPZ2NF?=
 =?utf-8?B?cVBQalJsNmdsZXFTWndUQ0ZDYVFlUzFaT1NzWlNkUllnbjFQUlpjSlo3SSto?=
 =?utf-8?B?Nk5tNGYvZi96bkxzWkRaNnBuMmRxS2Iyc01CcmcyS2Z4YVpTM0xubkNjV3M5?=
 =?utf-8?B?WEQ3cmFSMVRvV0JoV3hNUEswYlBnbkY4K2ZvMXdLTnJURFBrQmkzMGtrL0li?=
 =?utf-8?B?bGlxR0dvRmpyaWtMOG9zMnFaT1ZmOHNzbFlXdUFkcmpDVFYrYzF2RXlmTDN3?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6191.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43df6462-b7a2-47c0-275f-08dcf2431fae
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 02:42:08.7658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jrr3OHzV725Fq5o1AGsGFSUmlwAm+fP/+GZOxROQ9HSI10pbTko/p5lBKsa5gwmCsvC4oOpgGgUwK+SPNjijOsUa3dzsgWobPNm2V9fx77Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7226
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3LA0KDQoJVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KCUkgd2FudCB0byBmaXgg
dGhlIHNpdHVhdGlvbiB3aGVuIG91ciBjb250cm9sbGVyIGlzIHNldCBhcyB0YXJnZXQgbW9kZSBh
bmQgcmVhZGluZyAvIHdyaXRpbmcgYnkgb3RoZXIgaTJjIGhvc3QuDQoJSG93ZXZlciwgdGhpcyBo
b3N0IGlzIHN0b3BwZWQgYnkgYW55IG90aGVyIHJlYXNvbiAoREMgb24vb2ZmLi5ldGMpLg0KCUl0
IHdpbGwgY2F1c2UgdGhlIGNvbnRyb2xsZXIgaXMgc3R1Y2sgaW4gdGhpcyBzaXR1YXRpb24uDQoJ
QnV0IEkgZmluZCBpdCBtaWdodCBub3QgaGF2ZSBjbGVhciBoaW50cyB0byBpZGVudGlmeSB0aGlz
IHNpdHVhdGlvbiBpcyBub3JtYWwgb3IgYWJub3JtYWwuDQoJU28sIHRoaXMgcGF0Y2ggc2hvdWxk
IG5vdCBiZSBhcHBsaWVkIGludG8gbWFpbnN0cmVhbS4NCg0KCUJSLA0KDQoJQnkgVG9tbXkNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgSmVmZmVyeSA8YW5k
cmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1Pg0KPiBTZW50OiBNb25kYXksIE9jdG9iZXIgMjEsIDIw
MjQgNzo0OSBQTQ0KPiBUbzogVG9tbXkgSHVhbmcgPHRvbW15X2h1YW5nQGFzcGVlZHRlY2guY29t
PjsNCj4gYnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbTsgYmVuaEBrZXJuZWwuY3Jhc2hpbmcub3Jn
OyBqb2VsQGptcy5pZC5hdTsNCj4gYW5kaS5zaHl0aUBrZXJuZWwub3JnDQo+IENjOiBCTUMtU1cg
PEJNQy1TV0Bhc3BlZWR0ZWNoLmNvbT47IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOw0K
PiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
DQo+IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7DQo+
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIXSBpMmM6IGFzcGVlZDogQ29uc2lkZXIgaTJjIHJlc2V0IGZvciBtdXRpLW1hc3RlciBjYXNl
DQo+IA0KPiBIaSBUb21teSwNCj4gDQo+IE9uIEZyaSwgMjAyNC0xMC0xOCBhdCAxMTo0OSArMDgw
MCwgVG9tbXkgSHVhbmcgd3JvdGU6DQo+ID4gSW4gdGhlIG9yaWdpbmFsIGNvZGUsIHRoZSBkZXZp
Y2UgcmVzZXQgd291bGQgbm90IGJlIHRyaWdnZXJlZCB3aGVuIHRoZQ0KPiA+IGRyaXZlciBpcyBz
ZXQgdG8gbXVsdGktbWFzdGVyIGFuZCBidXMgaXMgZnJlZS4NCj4gDQo+IFRoYXQncyBub3QgaG93
IEkgcmVhZCB0aGUgZXhpc3RpbmcgY29kZS4gQXMgaXQgc3RhbmRzLCBpZiBpdCdzIG11bHRpLSBt
YXN0ZXIgYW5kDQo+IGJ1c3kgd2UgZG8gdGhlIHJlY292ZXJ5LCBob3dldmVyLCBpZiBpdCdzIG11
bHRpLW1hc3RlciBhbmQgZnJlZSwgb3IgYnVzeSBidXQgbm90DQo+IG11bHRpLW1hc3Rlciwgb3Ig
ZnJlZSBhbmQgbm90IG11bHRpLW1hc3RlciwgdGhlbiB3ZSBkbyB0aGUgcmVzZXQuDQo+IA0KDQo+
ID4gSXQgbmVlZHMgdG8gYmUgY29uc2lkZXJlZCB3aXRoIG11bHRpLW1hc3RlciBjb25kaXRpb24u
DQo+IA0KPiBJcyB0aGVyZSBhIHNwZWNpZmljIGNpcmN1bXN0YW5jZSB5b3UndmUgZm91bmQgdGhh
dCdzIHByb2JsZW1hdGljPyBDYW4geW91DQo+IHByb3ZpZGUgc29tZSBtb3JlIGRldGFpbHMgYWJv
dXQgdGhhdCBzY2VuYXJpbz8NCj4gDQo+ID4NCj4gPiBGaXhlczogPGYzMjdjNjg2ZDNiYT4gKCJp
MmM6IGFzcGVlZDogUmVzZXQgdGhlIGkyYyBjb250cm9sbGVyIHdoZW4NCj4gPiB0aW1lb3V0IG9j
Y3VycyIpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUb21teSBIdWFuZyA8dG9tbXlfaHVhbmdA
YXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNw
ZWVkLmMgfCAxNSArKysrKysrKy0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVl
ZC5jIGluZGV4IGNjNWEyNjYzN2ZkNS4uNzYzOWFlM2FjZTY3DQo+ID4gMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtYXNwZWVkLmMNCj4gPiBAQCAtNzE2LDE0ICs3MTYsMTUgQEAgc3RhdGljIGlu
dCBhc3BlZWRfaTJjX21hc3Rlcl94ZmVyKHN0cnVjdA0KPiBpMmNfYWRhcHRlciAqYWRhcCwNCj4g
PiAgCWlmICh0aW1lX2xlZnQgPT0gMCkgew0KPiA+ICAJCS8qDQo+ID4gIAkJICogSW4gYSBtdWx0
aS1tYXN0ZXIgc2V0dXAsIGlmIGEgdGltZW91dCBvY2N1cnMsIGF0dGVtcHQNCj4gPiAtCQkgKiBy
ZWNvdmVyeS4gQnV0IGlmIHRoZSBidXMgaXMgaWRsZSwgd2Ugc3RpbGwgbmVlZCB0byByZXNldCB0
aGUNCj4gPiAtCQkgKiBpMmMgY29udHJvbGxlciB0byBjbGVhciB0aGUgcmVtYWluaW5nIGludGVy
cnVwdHMuDQo+ID4gKwkJICogcmVjb3ZlcnkgZGV2aWNlLiBCdXQgaWYgdGhlIGJ1cyBpcyBpZGxl
LA0KPiA+ICsJCSAqIHdlIHN0aWxsIG5lZWQgdG8gcmVzZXQgdGhlIGkyYyBjb250cm9sbGVyIHRv
IGNsZWFyDQo+ID4gKwkJICogdGhlIHJlbWFpbmluZyBpbnRlcnJ1cHRzIG9yIHJlc2V0IGRldmlj
ZSBhYm5vcm1hbCBjb25kaXRpb24uDQo+ID4gIAkJICovDQo+ID4gLQkJaWYgKGJ1cy0+bXVsdGlf
bWFzdGVyICYmDQo+ID4gLQkJICAgIChyZWFkbChidXMtPmJhc2UgKyBBU1BFRURfSTJDX0NNRF9S
RUcpICYNCj4gPiAtCQkgICAgIEFTUEVFRF9JMkNEX0JVU19CVVNZX1NUUykpDQo+ID4gLQkJCWFz
cGVlZF9pMmNfcmVjb3Zlcl9idXMoYnVzKTsNCj4gPiAtCQllbHNlDQo+ID4gKwkJaWYgKChyZWFk
bChidXMtPmJhc2UgKyBBU1BFRURfSTJDX0NNRF9SRUcpICYNCj4gPiArCQkJQVNQRUVEX0kyQ0Rf
QlVTX0JVU1lfU1RTKSl7DQo+ID4gKwkJCWlmIChidXMtPm11bHRpX21hc3RlcikNCj4gPiArCQkJ
CWFzcGVlZF9pMmNfcmVjb3Zlcl9idXMoYnVzKTsNCj4gDQo+IFRoZSBjaGFuZ2UgZG9lc24ndCBz
ZWVtIG1hdGNoIHRoZSBjb21taXQgbWVzc2FnZS4gSW4gdGhpcyBjYXNlIHlvdSd2ZQ0KPiBwdW5j
aGVkIGEgaG9sZSAtIGlmIHRoZSBidXMgaXMgYnVzeSBidXQgX25vdF8gbXVsdGktbWFzdGVyLCB3
ZSBuZWl0aGVyIGRvIHRoZQ0KPiByZXNldCBfbm9yXyB0aGUgcmVjb3ZlcnkuDQo+IA0KPiBXaGlj
aCBpcyB3aGF0IHlvdSBpbnRlbmRlZD8gVGhlIGltcGxlbWVudGF0aW9uPyBPciB0aGUgcHJvc2Ug
ZGVzY3JpcHRpb24/DQo+IA0KPiBOb3csIGJhY2sgdG8gdGhlIGltcGxlbWVudGF0aW9uLCBwdW5j
aGluZyB0aGlzIGhvbGUgc2VlbXMgcmVhc29uYWJsZSBvbiB0aGUNCj4gc3VyZmFjZSwgYnV0IEkg
Z3Vlc3Mgd2UgbmVlZCB0byBrZWVwIGluIG1pbmQgdGhhdCB0aW1lX2xlZnQgaGFzIGFsc28gZXhw
aXJlZC4uLg0KPiANCj4gPiArCQl9IGVsc2UNCj4gPiAgCQkJYXNwZWVkX2kyY19yZXNldChidXMp
Ow0KPiA+DQo+ID4gIAkJLyoNCj4gDQo+IEFuZHJldw0K
