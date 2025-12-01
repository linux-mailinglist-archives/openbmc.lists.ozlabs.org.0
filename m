Return-Path: <openbmc+bounces-946-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E1AC95810
	for <lists+openbmc@lfdr.de>; Mon, 01 Dec 2025 02:35:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKRKT1Wdvz2yv4;
	Mon, 01 Dec 2025 12:34:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764552893;
	cv=pass; b=ltciMYfFE870OSfgWPKpv8KgPqt6Wyz7FRoe2KXcW/gv04PsbszYSznqGU+ePuqhGbmcU4EvfSWGpiqiBO1P1HfeHxAX/HSNjZ73Ht7vo+pXcokMB/gFO5I2iXmY6+DwqgHz9m6MVtA9vD2c5O9VJlvaMbWHmCo0jiWHe/UsNf4DSUqIiJa7H3xOYdrQIV9PPvFbaHeT/CTwKlY9R9piA70FOWbxcAKE0b6BEO5KDAbmsOh872QAz9E3TvzApKF0SnR6CG9sHB/QB8zmqBnlBHCiByqOZmdlShyoWTql8ch45xespy5S/nFsKjAqbn54kTKRzFz0gKl9kEvMBqJ9JA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764552893; c=relaxed/relaxed;
	bh=97ER0f38iA01XsseOGyJFDsPMhSAKuzkJLi7CF98rqk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U5E5T57VL2ErqSJesj9MTsPoqPN4ccHGaXIL+Pqvub1925A6ziljwto2G/CA/p+3CzYovo738526yjoxRturVgnehPF+Le8/h9LTRQDutmzNRqZ1ZNGQLHX6ZkyBhuWVT7UYdZyvO5vjIGaG7qzr0rWXfUmrMj2htCPorUXLiOa+9ST+cqkDy/O+9BgqBuJ4UhzVI0VxV6Hdb7uUqxzfqu+SY+Obrjm6LSf3P+qDnt6Tfld9qUuLPZecXLgUJElLHepntMUY5251QRdQDxooiSLzTmG2XKF8g7nsChaGHvTJTnpCnAF0fp71XZ4fpOHv+UOH/T3Zq84CPC5of1e7Rw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=bTiQnPjP; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=bTiQnPjP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dKRKQ5Z70z2yFs;
	Mon, 01 Dec 2025 12:34:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAsle1n57gtNSNIn9chfA5xeWbycWa88d97m/Rjr1enjbBUbDnr0OJA7L/oEobKl3KA+YizVSFcVdM8IF+vld+ukFWX6N76PmncofZIQKLLddjujqJqDw8VOwa5fV9/Mmr3AOKPyzBcmGcC8eLPr2fAL58mcu0m/pYog9XKybjU2DfLC2s/eloKithxJHxiGQHNEboNb0hhQ18v2Hod8I0b1w1iwypvdyk4Dw8J/e9fiziUURMwoMQI23FnrIKXYRrFXLDHwkFCVU1nfKVvGET6y2XwNkhdiW0c9qGGaPHXCIe48YPhZUEn5TbC+MdVvTJ1RMY54WZk5uHsBjcQwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97ER0f38iA01XsseOGyJFDsPMhSAKuzkJLi7CF98rqk=;
 b=olv4fdT6Jmg28uE2LZOljpzaK+k7gVAMNpMtWfm+CbpwiBq2RE67DK/1ypVriuZXhnF1YPx4hDWsFueyqxnHPTCVn+ooq0m/hNBCZ9ewC3IMYMBAOwZhuZ9v+OcXHrbgg8cPeUWElhNK4yAGB0qddktN9JkyEHQQ+5SQKAiL8UsqrIGy/GvUR8vO97F2tp5SBOwgNs7acbuBu43vuO4pJ94MGv/mtRuuxZjRD4VhOy2fTntAH6707bHIk1dzhmyiLxbWcxG9ZmGZcARtd86VtnwtiIU+QwZoHjD9rSiz+YaPV5OD0f3WzBYL1WK1Yci4a/VjwKwZAd9yXtyBLNkzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97ER0f38iA01XsseOGyJFDsPMhSAKuzkJLi7CF98rqk=;
 b=bTiQnPjP1S2uAeNL/RWw+sTm4FT9fPe8m4DUkvu/F6n+kLbl6xaE5d/yL0YfXGo/dC1Kl7xd3azRhlDwSoAZroZFbVOiZRC9+EZMrTRsc/qd3FxIKwbNZmcg4zgH/GioNb4aFBAjyGak5jJoQOTjlsiVzaLzn4HgyNa39xkqJs3F0Yhwb+8i149jI6FKCP6UGzHNHKb0ykGWPS14FiBG/IUOAglsGmd2KuCdDRXz6H/fXL4WxieMIqDzGshfZi7rAeo17vicemBI70ivRKUmJljndY7jbakl8oNUqDFqisQdOQRQ0fyB9Uw8wYQCnyp+PHKcfc1+5y/2nZdMgMtCcA==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by KL1PR0601MB5536.apcprd06.prod.outlook.com (2603:1096:820:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 01:34:26 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::b803:eff4:ebd4:9393]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::b803:eff4:ebd4:9393%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 01:34:25 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: =?utf-8?B?546L5pWP?= <wangmin@phytium.com.cn>
CC: Eddie James <eajames@linux.ibm.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?6IiS5aWV5qOL?=
	<shuyiqi@phytium.com.cn>
Subject: RE: [PATCH] media: aspeed: Fix dram hang at res-change
Thread-Topic: [PATCH] media: aspeed: Fix dram hang at res-change
Thread-Index: AQHcXO81fEguB+57mk6MGZIYtmjz2rUH7xgAgAQa0iA=
Date: Mon, 1 Dec 2025 01:34:25 +0000
Message-ID:
 <TYZPR06MB656876892F6046F22AD87073F1DBA@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20251124-video_dram_reset-v1-1-9d37229e4ec5@aspeedtech.com>
 <120162b9.3256.19aca13d4e0.Coremail.wangmin@phytium.com.cn>
In-Reply-To: <120162b9.3256.19aca13d4e0.Coremail.wangmin@phytium.com.cn>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|KL1PR0601MB5536:EE_
x-ms-office365-filtering-correlation-id: 818e742a-28cd-4817-e5a1-08de3079c31e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2dScDJXODhWc2RianUyWi9iTVBwV1B5WUw1MWRydDdXalhGVktST3hzUGl0?=
 =?utf-8?B?WTFlb3BQbERvak1ZcWt3eVViaTVyRUp1RmIzcHdPdG9EclpOQnREb1Q1Ni9a?=
 =?utf-8?B?QnNZV2VoN3FhNG85aXVCMk55anUrc29JY0hwdTNsUStoZUtTdFl3aUlOdjBs?=
 =?utf-8?B?aERVdGk1S1hBdnd1REhJN0FUVlBjejVELythS3NFdG5GbFJSL1gyMDk1b2R5?=
 =?utf-8?B?ZkwvNmVkdFhqaVQ4aHg1dStFUHhkblJUTXhrKzZYUnVSRm5TU0Q4RGxLc0xW?=
 =?utf-8?B?Q1lkWFVLN3VVNGQ4QUs2UytHM2M3THJWY05KNEd4bmhpMjJzMnBtakJqUmVH?=
 =?utf-8?B?MEhOb2V6Y1ZLN0x4dk9taUk1eUllUDVoR21aUUxZL0l3UTFBelAvWTBuL2lS?=
 =?utf-8?B?N2l0SWQ0bFRzWGtMeGZXSGt5dXpyVi84TnNEblBRaTIwbGdNaXJ5NStLVFNj?=
 =?utf-8?B?bG9ySVFwbVIxY0dXellOT2JPQzFLU00ydEUwTUNSdyswWlpGSW5EaTFvbCtw?=
 =?utf-8?B?UXZpY1J1bVB6R2VpRVZ0SXVNa09Bb25LTDUwcWVPbU40MGpVWC82cUpad0ZI?=
 =?utf-8?B?SGw5dHU1MmdKQVh4ejFLd1ZOL1NKNzVzVU1aZjhydnI2dzUwdlhDVktWRVgv?=
 =?utf-8?B?cDZYQjFtQkV3OW0zc3l4YkNVLzcvOE9wMkNpZC8yNkYzamhlNWtiYVI1anNR?=
 =?utf-8?B?RWpPUUZpekpPVkc5dlF0YnhKV0NnckNDeEE5UFJ2ME1NdkRFKzlMKytFUmZS?=
 =?utf-8?B?TklZK1dabkN1L1NGeWZZbjRyYVYwaHFGZnhxbkgvaklXYTI3NlpudDltdExB?=
 =?utf-8?B?QURzZ1hWdEtKclVVNnoxMG9pRUVBWndQbHlrTE5aSU1RMlVLMEo2bHlnTCt0?=
 =?utf-8?B?ME9KKzRsbkpxQk5QSzUrRHBPbGdMczhaTDlwWFBNN0QxbDRxeEY2eUIxelBX?=
 =?utf-8?B?SmNPRFNWODlycTVEMFlvUTk1K3liSUkveFc5V1VVdWE3dEJOTHJjcDJHUFg4?=
 =?utf-8?B?Z3hSMld4NGRQQnVIeTFpb3Y2UnhycFAraTdJY1lTNm5VZkowZmhQR2RBUkpx?=
 =?utf-8?B?c3ZyTXNTeVNkYWZWby9icUpUcXZQVldBZkZBRWwvVWVCVXlBbGJreHFPanpq?=
 =?utf-8?B?bmdsYWhFNlk3OWJzQmtrNU0wbThqODgyODl0UzZvU3Y3b1RPTjg4NmpuVTBV?=
 =?utf-8?B?ZjBobDVUcFJCL1Z4TUhmL2p0L2NlUDNoZkRVTEZEN2FwdFQvdU5kZk9XSjht?=
 =?utf-8?B?ZjlaSHY4c280by9oMmNYL2ltYmh4SDN3dmJ5V1JBdGxmVm9ZdGdxTVg5dmI2?=
 =?utf-8?B?d3BKZnpaSEg4WFdRYkFJanFTNDMvWGxIRXdFdVUvNVFDVmovMlUrM3hqN3Nk?=
 =?utf-8?B?OG9sbmFnck1wbkYvS25sUEdvVUs1TEtFalJQbEFFVVE4UXpPRElaN3Q4ZEpX?=
 =?utf-8?B?aUg4Mmp1K2tqcjRvdldiQ29LcW04L0NoMVlqSWtIQ2k1MzJnQmN2RWlQREtY?=
 =?utf-8?B?RTg1b2cvOHZHVWsxOUpBNldCeTFnOVR1QnoyajV1VmFyZ2s0dzljM3VJSXNE?=
 =?utf-8?B?Nkd1S3JkNDhXQ1ZadGhPRGVOclpySEJ0TUZ2VGFnOGdzc01GSDN5WFhLYjBD?=
 =?utf-8?B?eHFuOEtvdDJWOWNVb1J0RktGOVBiaWZvM1hkSitxQmU1MmdrN09PYm9nQm9U?=
 =?utf-8?B?VWd6T01HY0JUTkxMbE8wVEViMHNHSGZXRjAvN0xHOW9XSzljMFVEVlZqeGJu?=
 =?utf-8?B?QXo1ZHkxRS9aZlpTdk9raUVxcGVKdXlxNzkrN1EyTVFVQjc0UU94TjN3Rk9i?=
 =?utf-8?B?dmRXQjhyZlJUU2Z5N2J0V2o5Tjd5TDZDNkkvaURpb0NvajIrdm9uVTVWQzJG?=
 =?utf-8?B?dVR3M01qYWdEbDZiblBWejhUS2xhZExUSXNJeEZORDcwdysxb2dOVlZ3djEv?=
 =?utf-8?B?eVB4aGNsZlRMVzVxQ24yNWJ1Y1JZa3EwbmMyY2ZOV3hIRFMzL0dpTStLZDl0?=
 =?utf-8?B?dTFJZmdNNDNTcE81eFkxRXVNQzYwdFlQUE9CcTU3NGtYdys5aGY4WEhSdEg5?=
 =?utf-8?Q?r7kHBh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1JsSFh6aUtoQzM2S3JFZStIcjJzMjdvRGZkanpuZGZuNzZ6NVhRRnY0bSsw?=
 =?utf-8?B?WEhnUkpoN2cxWk1jeUJxLzJJMEtNc215NGJxdTRXRTQ3UE1BK1QxbUxlTTdK?=
 =?utf-8?B?UTZabFo5Mkc1M1R1b01HQVlIUlhIY3ZFWGMyNmY4cmJNR3hHakt2V1Ivc0NC?=
 =?utf-8?B?NndiWDhpTjRENU9Pb0EwSGxFei9XaW85Z0s0UUlFdVVXbVZRYUU2dDhWczVH?=
 =?utf-8?B?Q28wTXVhVUd1c3ZTbGswZXRIL1BkajdKZWhVVVVTOSt1WnhKY1F4UHhDUDFr?=
 =?utf-8?B?cDdwY1oweXNpbmY1VWdqUWs4RE1BUjZIRXR2SHViUDcwUkFUSmh6UUpvK1Vv?=
 =?utf-8?B?dEdoVnNzVWFUcjlMa2xXdEZiMXlUMWxjV0tOQ1h5M2l0ektFK1ExQUo3MDlO?=
 =?utf-8?B?a1lFd25OalhELzRkeFYwVlBKSkNub1ArS25maXdYVllnUWR3cG85WVdLZGVk?=
 =?utf-8?B?VnlJMlkvLzErUGJhTnEvbERQb2diamh3Q0tKZzNDbXZteC9nRUJSbm1TclZ1?=
 =?utf-8?B?SmVXcStZemtiK2pRN1VQdXFiVEhwWCs0cHB0dTlqOHZDUjVkbFpZQ05GWlhm?=
 =?utf-8?B?TTVzUEdjZHV0SmVGelZIeElnSUZGRXVtUW0xM2FTOFloWjBxcitnSks2UE11?=
 =?utf-8?B?eVdxTXp2T1A2NW9ldEVvenJZVEkxUGh5VGc0MjI1OTd0eVltUHdLQnVHdk9Z?=
 =?utf-8?B?N3FVemhQVFBNazdoTnRRWEN0Y0FhN1AwUytWOVJ0dUlZSWR3cUtVVjVMeUt6?=
 =?utf-8?B?SGtqejE4NkQ0ckdjWU9VbEtUUVRtZERpemNOZk9Gejl0SGxUMTA5MlBJOGlw?=
 =?utf-8?B?WTcrSmRsSHM3d0NBVklTb21TcEU4L1hXc2ljOGJpRlhqSlBEbEhIaWxkTFZs?=
 =?utf-8?B?ZUdxWW1pWmZXRjI2VHdueFR4WVJMWXJHQ3BNaEd3bDdxVEhiY2p6dFMrWm9J?=
 =?utf-8?B?aHdhemxFOHdwckpEMk9XQmNzSWhqWHNSWDZjR3ZIQzhFOFk4SWgyMVU0Nk1n?=
 =?utf-8?B?WEljZUNzMUtpK1JJQmhiVTZHZHRXeXVydjN0Skp6YXdQSjhsSklHY256eTJ5?=
 =?utf-8?B?RytzUmdyeUZnWitUeDBMdzhkV2JkekJGRTVOb1BNU2dtUDlXUFZxS2JQazB2?=
 =?utf-8?B?NjFzK2hBQ09xU0YxWDNEOXVqeWR1SUhlSm41a0ZDa0JTaVJFMC9iM3BMUGJQ?=
 =?utf-8?B?eG51VWplZTBCYlZBS0xtS2I2dnk2czlkVDg0TkNMeDRYVjBhZ3dMNlFvdXY5?=
 =?utf-8?B?TjhDRHZsajR3MElLZDZOMldUaU8xK0lheVE4MDlpdUEvY2lMbjhPdGpmZ0VM?=
 =?utf-8?B?Y3Uzdy9wZlY1cThBemlpMDk4WUJCUTlhUGdTZGVSM2dHYUhLUDRMQjlLdWh6?=
 =?utf-8?B?UVo4K1RQMi9GWHlTRWZKZDUyS3UxZTUxWnhLczhkR2pOaVVmRisxK1VzZm5D?=
 =?utf-8?B?TmZra2VXRXZtWVdCQVp3Ym9wenpIbmR6NzNzenFEais1YmFLcmovVjF6dVZr?=
 =?utf-8?B?WEF6NytQdnprMW5oU1gyaGljbHQzZGd4bS9SNEttRURhcU96R3QyS0VnZkNx?=
 =?utf-8?B?RW5ZbHQ4UG9BMEdQMXRLTUNvaG9qdERCYnp2TnVZdndjOCtBMzJnM0pBYVFD?=
 =?utf-8?B?bjB2b056aGsyYzE2ZERmUHdiM0lRd3RPZG1OcWtZM1o4N3M2K1R1Z1FGTitK?=
 =?utf-8?B?L1pvSSszemMyam1uNUhRUG1ldWJ0MlFOLzlaaXdyMjdjWGFZRGhScGRFZmlu?=
 =?utf-8?B?N1A1MFZRZWx3Z0Rub1JoS1hMRURlNDBYcitSOTV5NTdCaytJWHZEd0IxVGp5?=
 =?utf-8?B?Z1R5QW1taUZSYUovTkxxRjhGSEE0TUxSSFJYWCs1NG5FZW44SE1zNFkwdWsz?=
 =?utf-8?B?YlByYjN1ZzFKWVVYcFVLa2JIcFNNVHgydVkraWN5dVNQTkJtUUc5ZTFRbERV?=
 =?utf-8?B?MkpCdisyVHYvVitJT2xQZ2NrMG5ob3FXUG80eTYwd0dEZzhkUENEeGhscFFv?=
 =?utf-8?B?a1BxUFBmSzI2N3FwY0xkV2c3dnhGdGFOZnl5V3kyVDRDS1B4aHZHU004WnRv?=
 =?utf-8?B?OEhSK1FsdlhaVUJ1RUpGK1g1SDZjUlNZTEhjdzBuUS9zYUQ3RzRlTzJ0S1dr?=
 =?utf-8?B?aUczb20zVEJwMkErWDdRcit5QVAxMitUWWZGQzA0RVd6RXJZUDI3MEo1ZjMx?=
 =?utf-8?B?Rmc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818e742a-28cd-4817-e5a1-08de3079c31e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 01:34:25.5632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVLiACqfBZw+rMCYIhu0iXCdToG0zA1Fc8IFsGCDGdQnwyfc7U1TSnhSgjxButM9A3se0Bx+a0mHNidi3XwwNYTrbSMWWY3NltrejPAbyBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5536
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgV2FuZywNCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KDQpSZWdhcmRzLA0KSmFtbXkg
SHVhbmcNCg0KPiA+DQo+ID4gRHJhbSBoYW5nIGNvdWxkIGhhcHBlbiBpbiB0aGUgc3RlcHMgYmVs
b3c6DQo+ID4gMS4gc3RhcnQgY2FwdHVyZS9jb21wcmVzc2lvbg0KPiA+IDIuIG91dC1vZi1sb2Nr
IHdhdGNoZG9nIHJhaXNlIGlycSBiZWNhdXNlIG9mIHJlcy1jaGFuZ2UuDQo+ID4gMy4gYXNwZWVk
X3ZpZGVvX2lycV9yZXNfY2hhbmdlIGRvIGNsay1vZmYNCj4gPg0KPiA+IEF0IHN0ZXAzLCBjYXB0
dXJlL2NvbXByZXNzaW9uIGNvdWxkIGJlIG5vdCBhY2NvbXBsaXNoZWQgeWV0LiBJZg0KPiA+IGNs
ay1vZmYgaW4gdGhlIG1pZGRsZSBvZiB2aWRlbyBvcGVyYXRpb24sIGRyYW0gY29udHJvbGxlciBj
b3VsZCBoYW5nIGF0DQo+IGFzdDI1MDAuDQo+ID4NCj4gPiBVc2UgcmVzZXQgcmF0aGVyIHRoYW4g
Y2xrLW9mZi9vbiB0byBhdm9pZCB0aGlzIHByb2JsZW0uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKYW1teSBIdWFuZyA8amFtbXlfaHVhbmdAYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4g
T24gQXNwZWVkIEtWTSB0ZXN0aW5nLCB3ZSBmb3VuZCBpdCBjb3VsZCBsZWFkIHRvIGRyYW0taGFu
ZyBpZg0KPiA+IHJlcy1jaGFuZ2UuIEFsdGhvdWdoIHRoZSBpc3N1ZSByYXJlbHkgaGFwcGVucywg
dGhlIGltcGFjdCBpcyBzZXJpb3VzLg0KPiANCj4gQ2FwdHVyaW5nIGFuZCBjb21wcmVzc2luZyB0
aGUgdmlkZW8gc3RyZWFtIHRha2VzIGxvbmdlciB0aGFuIHRoZSB2aWRlbw0KPiBlbmdpbmXigJlz
IGlkbGUgcGVyaW9kLg0KU29ycnksIGJ1dCB0aGlzIGlzIG5vdCB3aGF0IEkgbWVhbi4gVGhlIGlz
c3VlIGhhcHBlbnMgYmVjYXVzZSB2aWRlbyBlbmdpbmUncyBjbGsNCmlzIHR1cm5lZCBvZmYgZHVy
aW5nIGNhcHR1cmUvY29tcHJlc3Npb24uDQoNCj4gSWYgdGhpcyBpcyBub3QgdGhlIGludGVuZGVk
IGJlaGF2aW9yLCBwbGVhc2UgaW5jcmVhc2UgdGhlIGZyYW1lIHJhdGUuIFRoaXMgbWFrZXMNCj4g
cmVzb2x1dGlvbiBzd2l0Y2hlcyBtb3JlIHByb25lIHRvIGhhcHBlbiB3aGVuIHRoZSB2aWRlbyBl
bmdpbmUgaXMgd29ya2luZy4NCj4gSG93ZXZlciwgYWNjb3JkaW5nIHRvIHlvdXIgZW1haWwsIHRo
aXMgaXNzdWUgcmFyZWx5IG9jY3Vycy4gSXMgdGhlcmUgYSBzaW1pbGFyDQo+IGlzc3VlIG9uIHRo
ZSBBU1QyNjAwIFNvQz8NCkluY3JlYXNlIGZyYW1lIHJhdGUgd291bGQgbm90IGhlbHBmdWwuIFRo
aXMgaXMgYSB2aWRlbyBjb21wcmVzc2lvbiBlbmdpbmUuIFRoZSB0aW1lIHRha2VuDQpmb3IgZWFj
aCBmcmFtZSdzIGNhcHR1cmUvY29tcHJlc3Npb24gaXMgdGhlIHNhbWUuIFRoZSB3YXkgdG8gcmVw
cm9kdWNlIHRoaXMgaXNzdWUNCndlIGRpZCBpcyBjb250aW51b3VzbHkgcmVzb2x1dGlvbi1zd2l0
Y2guDQoNCj4gDQo+ID4NCj4gPiBUbyBhdm9pZCB0aGlzIGlzc3VlLCB3ZSB1c2UgcmVzZXQgb25s
eSByYXRoYXIgdGhhbiBjbGstb2ZmL29uIGluDQo+ID4gcmVzLWNoYW5nZSB0byBhdm9pZCB0aGlz
IGlzc3VlLg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FzcGVlZC9hc3Bl
ZWQtdmlkZW8uYyB8IDIyDQo+ID4gKysrKysrKysrKysrKysrKysrKy0tLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FzcGVlZC9hc3BlZWQtdmlkZW8uYw0KPiA+
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQvYXNwZWVkLXZpZGVvLmMNCj4gPiBpbmRl
eCBiODNlNDMyNDUyLi40MWNiOTZmNjAxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vYXNwZWVkL2FzcGVlZC12aWRlby5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9hc3BlZWQvYXNwZWVkLXZpZGVvLmMNCj4gPiBAQCAtMjYsNiArMjYsNyBAQA0KPiA+
ICAjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9kZWJ1
Z2ZzLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9rdGltZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvcmVzZXQuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvbWZkL3N5c2Nvbi5oPg0KPiA+ICAjaW5jbHVkZSA8bWVkaWEvdjRsMi1jdHJscy5o
Pg0KPiA+IEBAIC0zMTAsNiArMzExLDcgQEAgc3RydWN0IGFzcGVlZF92aWRlbyB7DQo+ID4gIAl2
b2lkIF9faW9tZW0gKmJhc2U7DQo+ID4gIAlzdHJ1Y3QgY2xrICplY2xrOw0KPiA+ICAJc3RydWN0
IGNsayAqdmNsazsNCj4gPiArCXN0cnVjdCByZXNldF9jb250cm9sICpyZXNldDsNCj4gPg0KPiA+
ICAJc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ICAJc3RydWN0IHY0bDJfY3RybF9oYW5kbGVyIGN0
cmxfaGFuZGxlcjsgQEAgLTcyMCw2ICs3MjIsMTMgQEAgc3RhdGljDQo+ID4gdm9pZCBhc3BlZWRf
dmlkZW9fb24oc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8pDQo+ID4gIAlzZXRfYml0KFZJREVP
X0NMT0NLU19PTiwgJnZpZGVvLT5mbGFncyk7ICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQgYXNw
ZWVkX3ZpZGVvX3Jlc2V0KHN0cnVjdCBhc3BlZWRfdmlkZW8gKnYpIHsNCj4gPiArCXJlc2V0X2Nv
bnRyb2xfYXNzZXJ0KHYtPnJlc2V0KTsNCj4gPiArCXVzbGVlcF9yYW5nZSgxMDAsIDE1MCk7DQo+
ID4gKwlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHYtPnJlc2V0KTsNCj4gPiArfQ0KPiA+ICsNCj4g
PiAgc3RhdGljIHZvaWQgYXNwZWVkX3ZpZGVvX2J1ZnNfZG9uZShzdHJ1Y3QgYXNwZWVkX3ZpZGVv
ICp2aWRlbywNCj4gPiAgCQkJCSAgIGVudW0gdmIyX2J1ZmZlcl9zdGF0ZSBzdGF0ZSkNCj4gPiAg
ew0KPiA+IEBAIC03NDIsNyArNzUxLDkgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3ZpZGVvX2lycV9y
ZXNfY2hhbmdlKHN0cnVjdA0KPiA+IGFzcGVlZF92aWRlbyAqdmlkZW8sIHVsb25nIGRlbGF5KQ0K
PiA+DQo+ID4gIAl2aWRlby0+djRsMl9pbnB1dF9zdGF0dXMgPSBWNEwyX0lOX1NUX05PX1NJR05B
TDsNCj4gPg0KPiA+IC0JYXNwZWVkX3ZpZGVvX29mZih2aWRlbyk7DQo+ID4gKwlhc3BlZWRfdmlk
ZW9fd3JpdGUodmlkZW8sIFZFX0lOVEVSUlVQVF9DVFJMLCAwKTsNCj4gPiArCWFzcGVlZF92aWRl
b193cml0ZSh2aWRlbywgVkVfSU5URVJSVVBUX1NUQVRVUywgMHhmZmZmZmZmZik7DQo+ID4gKwlh
c3BlZWRfdmlkZW9fcmVzZXQodmlkZW8pOw0KPiA+ICAJYXNwZWVkX3ZpZGVvX2J1ZnNfZG9uZSh2
aWRlbywgVkIyX0JVRl9TVEFURV9FUlJPUik7DQo+ID4NCj4gPiAgCXNjaGVkdWxlX2RlbGF5ZWRf
d29yaygmdmlkZW8tPnJlc193b3JrLCBkZWxheSk7IEBAIC0xOTg0LDggKzE5OTUsNw0KPiA+IEBA
IHN0YXRpYyB2b2lkIGFzcGVlZF92aWRlb19zdG9wX3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVl
ICpxKQ0KPiA+ICAJCSAqIE5lZWQgdG8gZm9yY2Ugc3RvcCBhbnkgRE1BIGFuZCB0cnkgYW5kIGdl
dCBIVyBpbnRvIGEgZ29vZA0KPiA+ICAJCSAqIHN0YXRlIGZvciBmdXR1cmUgY2FsbHMgdG8gc3Rh
cnQgc3RyZWFtaW5nIGFnYWluLg0KPiA+ICAJCSAqLw0KPiA+IC0JCWFzcGVlZF92aWRlb19vZmYo
dmlkZW8pOw0KPiA+IC0JCWFzcGVlZF92aWRlb19vbih2aWRlbyk7DQo+ID4gKwkJYXNwZWVkX3Zp
ZGVvX3Jlc2V0KHZpZGVvKTsNCj4gPg0KPiA+ICAJCWFzcGVlZF92aWRlb19pbml0X3JlZ3Modmlk
ZW8pOw0KPiA+DQo+ID4gQEAgLTIyMzAsNiArMjI0MCwxMiBAQCBzdGF0aWMgaW50IGFzcGVlZF92
aWRlb19pbml0KHN0cnVjdCBhc3BlZWRfdmlkZW8NCj4gKnZpZGVvKQ0KPiA+ICAJfQ0KPiA+ICAJ
ZGV2X2luZm8odmlkZW8tPmRldiwgImlycSAlZFxuIiwgaXJxKTsNCj4gPg0KPiA+ICsJdmlkZW8t
PnJlc2V0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldChkZXYsIE5VTEwpOw0KPiA+ICsJaWYgKElT
X0VSUih2aWRlby0+cmVzZXQpKSB7DQo+ID4gKwkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gZ2V0
IHJlc2V0XG4iKTsNCj4gPiArCQlyZXR1cm4gUFRSX0VSUih2aWRlby0+cmVzZXQpOw0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiAgCXZpZGVvLT5lY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImVjbGsiKTsN
Cj4gPiAgCWlmIChJU19FUlIodmlkZW8tPmVjbGspKSB7DQo+ID4gIAkJZGV2X2VycihkZXYsICJV
bmFibGUgdG8gZ2V0IEVDTEtcbiIpOw0KPiA+DQo+ID4gLS0tDQo+ID4gYmFzZS1jb21taXQ6IGFj
M2ZkMDFlNGMxZWZjZThmMmMwNTRjZGViMmRkZDJmYzBmYjE1MGQNCj4gPiBjaGFuZ2UtaWQ6IDIw
MjUxMTI0LXZpZGVvX2RyYW1fcmVzZXQtYzUzMWY2YmE1NzNmDQo+ID4NCj4gPiBCZXN0IHJlZ2Fy
ZHMsDQo+ID4gLS0NCj4gPiBKYW1teSBIdWFuZyA8amFtbXlfaHVhbmdAYXNwZWVkdGVjaC5jb20+
DQo+ID4NCj4gDQo+IA0KPiANCj4gDQo+IOS/oeaBr+WuieWFqOWjsOaYju+8muacrOmCruS7tuWM
heWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWcqOe7hOe7h+aJgOaciSzlj5Hku7bkurrmiYDlnKjn
u4Tnu4flr7kNCj4g6K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D5Yip44CC6K+35o6l5pS26ICF5rOo
5oSP5L+d5a+GLOacque7j+WPkeS7tuS6uuS5pumdouiuuOWPryzkuI3lvpflkJHku7vkvZUNCj4g
56ys5LiJ5pa557uE57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu5Lu25omA5ZCr5L+h5oGv44CCDQo+
IEluZm9ybWF0aW9uIFNlY3VyaXR5IE5vdGljZTogVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIG1haWwgaXMgc29sZWx5DQo+IHByb3BlcnR5IG9mIHRoZSBzZW5kZXIncyBvcmdhbml6
YXRpb24uVGhpcyBtYWlsIGNvbW11bmljYXRpb24gaXMNCj4gY29uZmlkZW50aWFsLlJlY2lwaWVu
dHMgbmFtZWQgYWJvdmUgYXJlIG9ibGlnYXRlZCB0byBtYWludGFpbiBzZWNyZWN5IGFuZCBhcmUN
Cj4gbm90IHBlcm1pdHRlZCB0byBkaXNjbG9zZSB0aGUgY29udGVudHMgb2YgdGhpcyBjb21tdW5p
Y2F0aW9uIHRvIG90aGVycy4NCg==

