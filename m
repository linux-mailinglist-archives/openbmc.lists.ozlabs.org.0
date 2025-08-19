Return-Path: <openbmc+bounces-485-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A27B2D088
	for <lists+openbmc@lfdr.de>; Wed, 20 Aug 2025 01:57:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c661r1YJjz30Vf;
	Wed, 20 Aug 2025 09:56:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755646630;
	cv=pass; b=HcIApqZjEu6vA9Jd8OqERj1U2DNGDrD/RjGNyo67pcZYyqp0hOiwq/Il70cLo3pbTMgapZ4TcpD25EXo4iYGJsjoGWkbf9AWRdi1ea2Dx9PNX+S3UOMHVGLJ4VLhz6MbfsgoCMqp90KHh+od6PreHFE0yH6MjjF7WlTGf7CUJRVFUatyrR2Y1jGyOwNyx0eOH6R/vn88bAgoR5Ymq69JWRdPQT9b7ldMul0EyfZUbnWm6TnvbmTaozpIwfMX+ryDRZzMPuQpPWREmcJPEh38kb5se7/DkMjEM6AXyz0zCfadYA55zzhvJuyEgUg6J8DzQQoo0927RM90v/3XZ5qrbA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755646630; c=relaxed/relaxed;
	bh=o4WvLKuspQQDfa7Dme5LudOEiMzmRTWgV8spwBMVDE0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A3CsC/GYjekSYmLcPhI886GVHOYliQeqUDkarHSXItWD+m2+zSm8f1DK6x/5AFgxLg+r0ExJdEAnOiHwFomvk9gUWOB3zqy/JlVeO9tdZRZQanugSBiqQfaIP/XnF9k13RZO8CHqX1iR16AJ0H3o+sbTCA4irRfFaPWhgmOCfs2C84c7yMUqnedppC7Fbq4MWMe0LeSTuiGG3ZAKQ9RsQ+bZKLtoyrOfchoq8n0+Q2C53FA6nSqXEpiVB3/0CK6waSstNemi8Cw55ymj9SJzoajxJP2zuhZ4Lp5cQJgrUaRVXCsshgVgvy69f+fZP/H+bcYk1qNWr7VXJJq/oMLNVw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=N+OFmFuB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=N+OFmFuB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c65b93BcQz2xc8
	for <openbmc@lists.ozlabs.org>; Wed, 20 Aug 2025 09:37:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZdtjSRPWcVSQbptl/h9TY7iDLdFzdq4JAdETJtBcyR7Udt6jMwcMxllKcgJo1r9PhpUePcd65JykGoU9qP63+ooK3A7GRH1cCNr/PsPME4m1PKGclKAkUYaw7/mftdepuP1SHTQ/BhYIwtlFpgmtZFZmZGR0dmcepAyorsasZ7M4xJQhHAki6bHE2Op7M73jBXaXVi+49YWFkgyn6QRmUT1M/Ntga7hmbz/tx//FKgMJT26g1V1CwtdxjqlniLwaXIhOzzzOEkkfOCdbEE/8XKQlBR3P1R+4+Kk5cWF3V7QCeISg7ac9qbMguQ6yQqWQKgKLrKHli1NTVZDGVDv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4WvLKuspQQDfa7Dme5LudOEiMzmRTWgV8spwBMVDE0=;
 b=ngSr6W26cipBuOUTvQagpHEdOskKFkhyGI+InB1kc/zn+PuxMhYUQouo5hYYIhVBX6NvZdxII7XeWaytw8WKKY91KsZNYdwzVPUOV7dqLwQWnw0bLbpKH+s+FED3ainHZ2eJLcWng5TSsbi2luOBr6UO0sUUTMDE0+U0fafP8SPK/PDMW/ACdX1bRs//oNdVFOcq9fpIoyHEK2eeRIenjPsfoDHPRGUa38Y+g76xVFmkl93jgL0UzacxLOw+rT+AuARBCjzsp/I1UlzLhlQ95FO3Ng/bto12wsuf5jeMDyNifrWEcSyg2xc1+SAB7XG1MwL8IUjvNozx0GqkGwbbwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4WvLKuspQQDfa7Dme5LudOEiMzmRTWgV8spwBMVDE0=;
 b=N+OFmFuBd2Mz8oewdaiPtZe2Zo3vBsjGNc8fCDzTNF2arPhKKXvsITQvBdPz83Oev87EXtKQQNz/bxCiSk1NkVGyYMyKPWJtRCTbGtDcDd9XUmXTRt+E5VCn1NzbPi20O8ZYrHmN+/RxXzLBpKhZzW9ddhd+5YRSj1VVDkO8SD8jlMary50bbMEvvQuuYQbqkZpBcjt7k9NDeWZIJVROy4cX5oec0lrR33uN+/YRL6tbl3d/ez7TK6OhZDVS+Drnpz13owojVfqd3GvLR+5zMOXsDHRyXLX5nhbQPBW4iumWejIx8tNGPTMKRgqBRtfxtzXPSxbQ6T03TTTIUaznUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667) by CYXPR12MB9443.namprd12.prod.outlook.com
 (2603:10b6:930:db::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 23:36:48 +0000
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::fd4e:4c62:b756:96da]) by DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::fd4e:4c62:b756:96da%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 23:36:48 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 19 Aug 2025 16:36:22 -0700
Subject: [PATCH 1/3] usb: Add base USB MCTP definitions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mctp_over_usb_backport-v1-1-c655eb2a32ce@nvidia.com>
References: <20250819-mctp_over_usb_backport-v1-0-c655eb2a32ce@nvidia.com>
In-Reply-To: <20250819-mctp_over_usb_backport-v1-0-c655eb2a32ce@nvidia.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755646605; l=2935;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=kncLOtSk+9H4mta++3iEvdRrvJHKeAJ/QjgUgETEGzc=;
 b=8uzG1sWRBbyxneQJG2wn0C6uIbWV/QnV0CCe+Skuv0jMalLaPTYLto/gkhUuASsW6YJgMG14e
 l1MrDN4tDqNBvtitzxBk7IfcYaJz56ZZpqRdIZ+MnwNOG1nzTdYNPp3
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:303:b6::34) To DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS5PPFEAC589ED8:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea7493b-61a6-4534-25e0-08dddf79443e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3BGUjRlQ3llQXRkMGJOdWN3U2lIT3BsdjlRTDVud0FlSjZLakY4bjBONW1P?=
 =?utf-8?B?aWVPT1ZqZTdORnNZR1pQTDJzbDZNZnlVNm4zaVdTaXlEeVJYMlVoREwzSkNX?=
 =?utf-8?B?OGtEN0VUTHN5TFVXcVZKeGNHR2ZRT2tNS2VNdW80TENxdUlvaDRacjZTaDhs?=
 =?utf-8?B?a2RRd1Zra2MxUHgvVit3RmJBbzM3dEp5TTJzOEJNV3E3QTRNVGY2MktYOHNx?=
 =?utf-8?B?OEdLbEEwWm1YWUJKVk1hQVVBMXdBZVF2YXdQc0VrSjY2RE5YMEFxS2FEZmJQ?=
 =?utf-8?B?Rm1ZeTNLWWlrbXY5NzIzWEpWTjVkbkRRN0RXbG9nVXo0UDRtZk5aekdNVEd5?=
 =?utf-8?B?VVVhOENtSHlFNm96RWdieXZEcUcrZmoxcDB3OWlyRC9pTW8rdHBhbnFCZ1FQ?=
 =?utf-8?B?dzNXbU1tTW1sK3VZVWZJSEtxcmJkbWhyMzNLcmUyNmFwRk85RmV6aklTQW5X?=
 =?utf-8?B?eHNhRmtZb2IyaGV5REl0clg4NEVKeWtLVkFUK1JSQVRHaE1DQVpUQmsrNGNZ?=
 =?utf-8?B?QXlpZjNZTmh1Z0pDQlZ2T1pQMXM3d0ZxSUFxdTZweExoRkhtMjJFWVEyYjFo?=
 =?utf-8?B?bmJIYW0wKy9UVVFMVTNZc2xoTjRZMWo5ZURPVkJPODBqRk9wRGFlMXEvdVkr?=
 =?utf-8?B?WWUvaXNiZnJidUhoU0dGbUV0bTV1b0dQVzVCSHcyZDRWTjZhNzYwVGlmS21S?=
 =?utf-8?B?TjVyWk5kSE42UmFnUmtWM1U1d0dKVzNvSVhKcWpnNHh5WEVtMlN6Q2doQTh5?=
 =?utf-8?B?MUY0dEJycisrV3drajBoVUd5N2ZpSXlNeWJkZVlLZlh2ZWxoc0xuSm9VdVNL?=
 =?utf-8?B?dnBBbi9nSUtFWWdmc241QVd1NDYyd0NrU1VmbW9pN3dHMm5IRnlJTkdYMmhw?=
 =?utf-8?B?eWtpVEJsOEdTNWJvdlhBWGh6bXhGNmpvbW9yUGUwNXRzN1l0Tkh1VDdCb1Jv?=
 =?utf-8?B?aWh6WDBtUG9McytOWW5GZmJNbmlJNG1xdktYc2RFWHlXdzBYVzNEYlVFOVox?=
 =?utf-8?B?bVcyb2RoN3gzUUhWakJOdDV3V1F1ek1oN0Ewc0hPbDczQ01qekt2cnBmd04z?=
 =?utf-8?B?dEdxSmc0MmhjK002b2k5dVBUNjV1LzZlK1BmNURlaVkraThFUTdGeTNQa3Bn?=
 =?utf-8?B?eHJFekhydlpYdVcxVUV0SENuQkZuMDRrZkVzaUx4VHRvanRQck90OFM0cXZq?=
 =?utf-8?B?cHQzcTVuQjRZTlR0NWV1eVlQUVZKNHJhR3o3TzRhbU1sSWN2eXQrS1VQUXVX?=
 =?utf-8?B?bnFOWWI3L2dQNXExOEZvN0Z6T2ZmYURMeEhSWTRuaVBFZlNpcUh3MkRKOWVa?=
 =?utf-8?B?K1pwN05ndG5xQ1lDaUtPcnFUcGdvdjBra1BYTUJJOEtRelpoM2ZnUzBEY2VR?=
 =?utf-8?B?QnVmUGFvOWdvMmJDdlFPT3hLajVscTllYjdHaDFZUFo0MElndUhIclI1Qzhr?=
 =?utf-8?B?dHlnQ05OaTFoT3RmMk4rN2pJU1ZBaTgrblJZb0lCK01zT3B2K001T1VuZXZv?=
 =?utf-8?B?TGF6VHBXd0hHWEFUNDJqWFJDbWxpR2hCS3NKL0R4YnREOFdPakswV2lKblc0?=
 =?utf-8?B?ekJsN21Ka0V3Y1VadnYxeU54LzRnMHNlaCttQUxxSXRnd2JFSG54eU5ha3Fk?=
 =?utf-8?B?Z1k1YXJNbHRPTkNMckNSdnpudEF0aFFuWWJ1ZzFRZ0ZjUGhneWdzNUJOWTdl?=
 =?utf-8?B?Rm5JRE85VTNldG55ZkQ0alNYUnVPZ3RCcjEzZkRrbktMRVlLT2xxUHd6WlpQ?=
 =?utf-8?B?NWRpc3llMStQNG1qOHBVOEtyYkFUM2RFNlBudTJXREZsYythWExnODJRT20w?=
 =?utf-8?B?Q0FRUitnVDhxeDgxUTltcnZHYm1UVEZwVlZodFNsc2J4TG9Oa2Yvb2pvV2Mx?=
 =?utf-8?B?ZUpYTWswa21HcStzUHVURnpacEQvZXZWNzlmZnRZbUlnVU92MlhKVmd1RHE0?=
 =?utf-8?Q?u34urh9DsvY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFEAC589ED8.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmFpU0F4RWJrOVdNbXRPdXhKUFliSEtRTXVrM0ZyWGtRdjBYK1pER1Zra1Nm?=
 =?utf-8?B?d3IyWkgzUjhjSmViT0txNDgwelVDejg2WGd4aFM2SUd3QzdXVXJEYXVNQ3pB?=
 =?utf-8?B?U1pvZFc4TXZuSFljVVFTb1V5TmoxS0JxOVAwRVhVb0xXbHp2Slc1VE5FTzA5?=
 =?utf-8?B?aWxTQjNyT1I1K2FUQkRLUnM1eGdEeEkxQzg3SzRFcUIxWlJWVm9wMnFicUxN?=
 =?utf-8?B?akFtNkZSS0Z6VGFHUkdmQzB6cmhKeExFMFhZeWF4azVOWHNmakVFZ1hYV21r?=
 =?utf-8?B?T0VVaDgybnRsVVZYa0xhb1ZVaGQ4dHU5Zi9HMXN6U2pRODBtUEducnRjc0F5?=
 =?utf-8?B?c3FQQzY4R2Y1U3lwclZBNDVkQ0JkbW8yU2FQM09kTk4vOHlzYURCTVFwbzBs?=
 =?utf-8?B?NmxNM09uZytkSUQxMUpPYmdTbmdxRGp6NS9hT3JWY3VRUmtPQWwzNW5vV3JJ?=
 =?utf-8?B?cXJFWmEyNnZWREN5SjIzZHMvOGlCWndtUGxVZk9IaUh4NEFLWWNQOHNJb01l?=
 =?utf-8?B?Zk5vSmljWXhkbERrOVlPSFl0ajUxTVhxQVlvdEtWd2FFT1ZiZFRtQnhyVGM1?=
 =?utf-8?B?ZWI4aG1DYkhNSU45REhwUFRrNE9TS1pyRGhSaHhXdko4dk9mRHNDN1k1QkVh?=
 =?utf-8?B?ell4anVYN25VbmV0aTVmUjlQRDNGZ3RLZTZSOUlyMitPN3JPN0QreFJpWjZZ?=
 =?utf-8?B?emhpa3VCamJuOVBOUDlsaCtsUDROdUdodndSWG9STE1iUGhKWVdFdGd1S3Bm?=
 =?utf-8?B?N2ZDVG41NHV3Z09qOHFNNFVRdWhYQ04rS0h5QjRKb2hKZXpXMzQ4dmN4MGVo?=
 =?utf-8?B?YXhxQVhSZUUzYTZiMXlBZUJYMUZVRW1PSmpRSG9Od09TM2ZrT3JMT0VvRHJn?=
 =?utf-8?B?MGYyVXhvazBCTXorVGdGV3QwYWthR1pjTXFFNzVLOG9hc204a2xHVjJYNGEx?=
 =?utf-8?B?SVdUZnYyYndqUUtLTjZnZkVKVzNmTU5jOVdyVDVuRWc4UEpCb1k5TE9iYVd6?=
 =?utf-8?B?dkRZVlFiL1RQTm9EVVV2NEUyMlJwTkN6RjlmQnVSQ29ESWNKR0JRM1VDUXFq?=
 =?utf-8?B?WWZHNzd5MzJ1VnNNdWs5aVREQUNydXBpYWorUVdjQzNIUWF0VGpGRnUxVjd4?=
 =?utf-8?B?OURudXk1c1ZrSnVBWm1oUkp5TDkrSmRhQ3JybUNheE1zdjRuaEgzem1IMDJs?=
 =?utf-8?B?TW43SGNVd2pJTmVNYUZJMEpNVUVGSTBScDN6TTVNbWNJYXJydmdkYUxOMERP?=
 =?utf-8?B?NW5CWldCdkRETUZsbGF5dGZuY1grV1dsUWdROTJBSlNXT2djZmRTa1NrTGZU?=
 =?utf-8?B?Mmp0ZjJkaG55cTRBRE9tVGs0d3N4WTBjSW5IL1hGam5WajNiL2MzS2ZaN2E2?=
 =?utf-8?B?U0RxUlVZc0NOdWo0QWl1WkphTEE2MG5KVXNld05oMVkzS1lKbG05VEpnMVNQ?=
 =?utf-8?B?TW1NaW5LZnYxWWlLQTRhdWlZaUc4U2lCUVVBbEI5K2p2NG9mVTNoMlR5a2dT?=
 =?utf-8?B?R2xxK0gzS1ZaY1h2YVl3S2diYWQ4cnRGL0Uwb3k4cC9BWVhjdm1ENnFqNGt0?=
 =?utf-8?B?QURIK3E0TGdZZXpHYzhyZGxBY0JSVUFDcHVuRk13Z2xHbERiOUY2U05zWFhF?=
 =?utf-8?B?Q1RZcWV0SzFOaTdlVkcvTXhuTlVIeFVQZ1pMdlc3TlAxMHhPSlhlU0FHTTdm?=
 =?utf-8?B?UzVCS2Urcy94c2ZucjZuZ2F4WkhmVUNhdmZ0VzdUT0N2K2J6NmRtMzdxbUcw?=
 =?utf-8?B?bjNDNkpWRlAwb1JzdDArcVVvdTQzelBvWWV5Z2RJZmVzN0dBL01mc1VPZyta?=
 =?utf-8?B?bXhjbjRuVXI0Z3h5bTR2aFZCaDJ5UlhndVl5R1pHMEVFcUQ2ekJSdXAzaVBx?=
 =?utf-8?B?M0dTc1V4UlVPd1k1elE5b2kxMlNWd2EwSlpjczV3NWZTQ0dsem5TQndqeWt2?=
 =?utf-8?B?NHdEV2UyYWM1NjVDNk5uN3AxV2kvYWVOLzI5K3p5aitabDVjQTF5QkgwaWVa?=
 =?utf-8?B?WEZwd2dNYytNSVVpbG9kMElZZzNlcklzRGMxbTdBMjQ4NnVRTGZqKzNMeTJw?=
 =?utf-8?B?dFJobG9JMFVIZlc1RW9NVTBtdWl1TjJySFc1TjIxNkdMckJzMXQ3L2pQcGtR?=
 =?utf-8?Q?ZH42JPG/R3Q6djiG4DpPXRHNE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea7493b-61a6-4534-25e0-08dddf79443e
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFEAC589ED8.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 23:36:48.7141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjzAVldFWSZOLAAKFBoXnz8JtpUOt1CH9TwCirQ57IUMzTIzkZidFnmWLAQ5mB0D0mgq7SriyLbhs22bbScThg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Upcoming changes will add a USB host (and later gadget) driver for the
MCTP-over-USB protocol. Add a header that provides common definitions
for protocol support: the packet header format and a few framing
definitions. Add a define for the MCTP class code, as per
https://usb.org/defined-class-codes.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://patch.msgid.link/20250221-dev-mctp-usb-v3-1-3353030fe9cc@codeconstruct.com.au
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
(cherry picked from commit dcc35baae732b9079b2c6595cfd86da02b34a4e6)
Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 MAINTAINERS                  |  1 +
 include/linux/usb/mctp-usb.h | 30 ++++++++++++++++++++++++++++++
 include/uapi/linux/usb/ch9.h |  1 +
 3 files changed, 32 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8620dda7ce11cf577f77f11232bd35f72a4da965..91863b0bd12790be7e0f71580e639c1f2d6eb99c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13648,6 +13648,7 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/networking/mctp.rst
 F:	drivers/net/mctp/
+F:	include/linux/usb/mctp-usb.h
 F:	include/net/mctp.h
 F:	include/net/mctpdevice.h
 F:	include/net/netns/mctp.h
diff --git a/include/linux/usb/mctp-usb.h b/include/linux/usb/mctp-usb.h
new file mode 100644
index 0000000000000000000000000000000000000000..a2f6f1e04efbd0758592f5e74bc634e3542e9cc6
--- /dev/null
+++ b/include/linux/usb/mctp-usb.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mctp-usb.h - MCTP USB transport binding: common definitions,
+ * based on DMTF0283 specification:
+ * https://www.dmtf.org/sites/default/files/standards/documents/DSP0283_1.0.1.pdf
+ *
+ * These are protocol-level definitions, that may be shared between host
+ * and gadget drivers.
+ *
+ * Copyright (C) 2024-2025 Code Construct Pty Ltd
+ */
+
+#ifndef __LINUX_USB_MCTP_USB_H
+#define __LINUX_USB_MCTP_USB_H
+
+#include <linux/types.h>
+
+struct mctp_usb_hdr {
+	__be16	id;
+	u8	rsvd;
+	u8	len;
+} __packed;
+
+#define MCTP_USB_XFER_SIZE	512
+#define MCTP_USB_BTU		68
+#define MCTP_USB_MTU_MIN	MCTP_USB_BTU
+#define MCTP_USB_MTU_MAX	(U8_MAX - sizeof(struct mctp_usb_hdr))
+#define MCTP_USB_DMTF_ID	0x1ab4
+
+#endif /*  __LINUX_USB_MCTP_USB_H */
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 91f0f7e214a5a57c8bee3f44c4dbf7b175843d8c..052290652046591fba46f1f0cb5cf77fd965f555 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -330,6 +330,7 @@ struct usb_device_descriptor {
 #define USB_CLASS_AUDIO_VIDEO		0x10
 #define USB_CLASS_BILLBOARD		0x11
 #define USB_CLASS_USB_TYPE_C_BRIDGE	0x12
+#define USB_CLASS_MCTP			0x14
 #define USB_CLASS_MISC			0xef
 #define USB_CLASS_APP_SPEC		0xfe
 #define USB_SUBCLASS_DFU			0x01

-- 
2.34.1


