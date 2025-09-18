Return-Path: <openbmc+bounces-665-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EFCB87285
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:36:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS60Phxz3cZM;
	Fri, 19 Sep 2025 07:34:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231286;
	cv=pass; b=eGVOq1YXW00157NuaZnHkfgq90Eq3YzWFjP2Sm/5JSFoJMty8mVwTizRAB/7PmiXborFbK9MlIEG58gkjOGOy8mkK4tXQzszJIpxp4ifn/u7jigdhoVY6p+kfEf8J4o4RTVJ8CbJE4ahc/EfrXIoJyNTrMxN6GbHx+2ifsAnrvwetExhdWcWQnNjCePVoSoHTFP4vVMjHS2i0HINDdBpRWjm9jN658M494o0nFsvleBpX8yf++h3dNgjyEvSFAUmswAGkm0gCyFPXGWvAKgLuYoinoLZBaCdhkDEMpDzNxOuPcTfUYGfQ6comm2GFNKRwHngpWdWIrqhYl03hbTAjg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231286; c=relaxed/relaxed;
	bh=rq3Qz0v8s5bClbXt5gySo+X+dUszsWLTvmpxiPgNpw8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CXIpP9kHi53vARkscJ6FujzlCmU1g/gZDGemukEsMA6oRHNyaljr4aWkA03CmN5J8VjhZb6UTUDmUwwvriC0bcXaUc9B+49fs5Rhu7khlUZvqRnELXdxpdVjd1ZgGI+iCNsr6Bvwrj5r/EqTYarsrgAikknUvsoK1KXgIycLvKf7y1nz8XcAODZUUHe0ABEiReB14JYSCiAV/3UOSuE3LdxluBmVcc44WfoFhU90qrKN8YqBipG6RI1Vbi2wvcYDFLtEJBIy6yuBVuqmhQLv1Wx5sxOuoHph2xyoEn4cEsDNjs84Qzhq9/gQr6Z54j2f++y1wnUVgQbL9PoTxKjfSg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DVbbjCKb; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DVbbjCKb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS52NzGz3cZp
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8mKSsxAnZ4/ZGq1Ycp5ySiJO4euCqEYg8hxswpph5uAwfnYaHWNi2oAYa9wuftNK7BTdg6VXyaeHVYk3dytkfzGLuc+td3jA0fyxrlgdI+juzznOE4QxDZGbfTCOM+7PHNgBL9vHqVxk/4IAv/xl1gLQoduCticcDBhhtAIrTa6S2XJ7Jk5roxTOi40ITbTmjdF/sLnynCmgsZkvfVVLRZ5APUqZ1W3sDLLUEsW2uVpkZMIeJ8kqvWIUFLJQtICCJF64Go/knQudlhh66eA8EUMCfM0lCDKfYi4TbNx6lk4Ya/Kmvp5qDb7+W3CEBdbYg2Ta7uI2qa7UM4eFKFhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rq3Qz0v8s5bClbXt5gySo+X+dUszsWLTvmpxiPgNpw8=;
 b=Ii2HKGzFz8BCVHx2ag5YqiSO4E5ojVmrrW3ZviO55cJo8ubGzPQa2+vzWEzryP6ZUbtmxCvdTsrv+WLH6/KwtXAVx/YaoCxaGkYZBu3JqLB/AyYB9wP67GZyuqJIaHRjVdsYrgl8MHY0YttHQPbpEYez8mxqPi3og8s+Us4OgGzjotu4bje7rC5YM6lChSGOj9B1J81ZlUuS8kjbbZ2oQMmQFU06Z781rJvKE6oI1/3MFkx0Zg1rbmh42gOUX25J7NGb5p23Oh+O4Q74S0ujbI/FwtxhVUfaT5PtXQvWDo7EDYCnd7HM1oQINZYGqiONz6tMthbvRsO4V1niclxyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rq3Qz0v8s5bClbXt5gySo+X+dUszsWLTvmpxiPgNpw8=;
 b=DVbbjCKblBmay2o2jBz3vmAqM0iLMZawFOnAY+r6CqBWqUmog6i+c59K2eaSDw3KlCE3JgGE7LbdjiGRe/NOA3hYrjHRrAnao/DwA5IpOLmpmweXtXQJ29JZNJbx0NmQVeafRrkkgW0k0J53Jp96EzqNyrxYlGzx2nJDr/OD5hXjhI534b3BR/brCG6pAqKXxqjLeobHcfee720C2GzPxM+1VBcti8+8qAQYeHyG7Vf/G8UoouxXu+ABCJNnj5y50ND/HF+C3gYClIPyTp2oCeCZLIh7RbJw70K6NVkw91BRn3sJAUhmkUvPFICA8edEGMeANiH5r7JorZD59gzcPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:27 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:27 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:55 -0700
Subject: [PATCH linux dev-6.12 09/14] net: mctp: test: Add initial socket
 tests
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-9-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=7937;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=Me4zkiEN/7IHFNauHuCort8dFKezN7fLCkexzV4w7T8=;
 b=zrLDaebM1aKfQKXwap+srXkikYyif+ePFU6S3wDISXo5M7y+vfSkGaAHIcDjB614KrGogGt+F
 vdtf3dyjQZ3DDNDgqYgL3WVgQn51WUiQRSqHoI5mHDuGy2oR8/WGeYy
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::27) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 781cd31e-4661-4e51-ae06-08ddf6fb24c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3B4eEc5Y3BCZ3BrRXlqazkwamJOR3pKUi9UdlJaaEZaaUxDeGU1Z0FMWFJL?=
 =?utf-8?B?L256TDV0V01Cck83UHIwTXNFczVxbWV6WUp6d1BZQloxbGNFUW5XckJjUmtr?=
 =?utf-8?B?Nk9kY3pjRDJ3b1h3TGV1Wk92b0tuMzVMWVhZWXdHS0dTd2JoWXJsSWkrUWxu?=
 =?utf-8?B?cVYxcks4SmQ3Mkl5Q1k0UUc5WC84dktscEtzTnhack5GeVhwZXNSTUdlL09w?=
 =?utf-8?B?UzhzZkFyVzBKdzJYU0RkelhXSEp4ajJlSCtMWko2NGF3OHoxSHM5U3VuQ1dp?=
 =?utf-8?B?dndWNWNkWFZ1QzVPa3dXOVE4S1pPQ2FhNkp4bTBueldPVk1ONDlTUitlbDB5?=
 =?utf-8?B?UkRKSFJkajZoSjR0aUQ3b0Z1alhwYTRVOGNYTDkreldGc0E4djlRYkM5WTlJ?=
 =?utf-8?B?ZzBXTmlBcXgvVStHNmk2b1RzSGJvVnN6OFFrSDRjMG9GcHdMcmdSQVBVWU5T?=
 =?utf-8?B?eTZPdUxkK3ZyclhpZ0NCWEdvLzJwdUxJMTcwQlN2SldNczhGWGZXRUNLT2xB?=
 =?utf-8?B?T1NtZ1hJV1RQb0FldXlQem0vTHpOdjg5V2FHUFdicS81T2ZaZmkvdDJsaHQ4?=
 =?utf-8?B?dHpJTWEzeWFlY0VMVklaWXVxSS9OQkRnYm5zdmZrNTh2RWg5K3VBdXMvcC9n?=
 =?utf-8?B?WWtGY3Y3RVZ5K1ZNamtIVnp3RFc3YTFuWjVoVTBnUkxpTGJoWTREb1FYOWho?=
 =?utf-8?B?TUo5L2NLV3JzSi85bjBobTdoQ3lBMlJZYlYzWlBwT1M4bTdCY0N1RHVVb0Jn?=
 =?utf-8?B?S3hCRkphQ3RKVmN1WitFZ0p5Um1lRlNMTXpmSXBMNzFWT1dERlhEWlNnQ1V0?=
 =?utf-8?B?Yjc4c3BidkNxcllWeFBWWTVmSlFPWkFTVWJRUlJzbUdzS3VYNFpYMVN2K0pP?=
 =?utf-8?B?blp2VjUxVE1iWEd4OUFRaGkwMGQzZDJpTmk3T0lWVnpQS3NleFRaNDMrbkI4?=
 =?utf-8?B?NlptelR3dW4wYXR6ZDZMWkJaczIybFlVdzFZbVkySEtvV1piVVF6NEpmaFFv?=
 =?utf-8?B?ZnBpNURXWldGZm5nbkQ2TWVqemtUY2ovYWU4VnpSUlFWMVF5d3ArMytkQmlv?=
 =?utf-8?B?NmhUUTZCR0JUdnQ1Sy9NakZuUmgyZEdSOTI0UHVSTXVIaitDVVBwZkNkakRW?=
 =?utf-8?B?cjRjQ2pxbXBkNUZZUTVXckJCTmRpaHRzL3R3VmpicjRjTTMzMzZtQkdlRXpU?=
 =?utf-8?B?WnQ3eER2UWo5Z0tOV1QwWmtCOTFObHg5YU4xUUFyOWhGYTVGUHlyL3kyUnJn?=
 =?utf-8?B?NTljYmZoRnhha0U0SXRsY2tPWWVhSWcvcWd3R011UXkybFVJR2k4NHB3WGJo?=
 =?utf-8?B?TmdFUy9vMEY2QUUzYkdpY3RqUm5iWXZPZ3ZNNytCSmhnNGFRU24xc0w5bkNM?=
 =?utf-8?B?enlLb054SGdRQlQvN3JyM1hPRGQ2MTM3ZUtRY0JmcVRhZkpobjFNT094Zngy?=
 =?utf-8?B?QXVpUmNOQlo4UmtzdVNYMXBBOEZMMkI5UVltMFNDUitEQjdBV2xYSFpFSElX?=
 =?utf-8?B?NUVHMG5UV1VDU2tBc1VyQmtUN0FyaEpsSGxWUTRHbTJNbDg0TU9XZ3BBOGd5?=
 =?utf-8?B?QTcyUS9zenk1UVRvWWpvcW1Ca3J2VXFYbmx5THViNnROSGtIbWRHcUh3YWxa?=
 =?utf-8?B?Qjh0a0NTQ3NhZEdldCtmZUs4UTEvYUNoZFBtcUYrRjhDcjVuMVN0WEFvVkxU?=
 =?utf-8?B?U3hWc3M4L1VOa0l0UmxKRk16VzllWFlLclBvbFc5UzBhYzU5b2JlbG03OTRi?=
 =?utf-8?B?WnY0TjN0NnZHMmtaZEdLakhjZEJKZkJ2Qk9aT0EyWkJwZDVpVDZLZUNSbDVM?=
 =?utf-8?B?V3BCaXJycXI2UENka21vVFdJLzEvYXlJUmsrN25IcGVGaUU1MnhyVHBaT2Zl?=
 =?utf-8?B?NVExMWtWeURzd21nSEFsZmt3b3ZaMW9jT3hHUkpBOENOYVEraXBDWXpBeE1h?=
 =?utf-8?Q?zfcLfgReo1k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXRnTEJMOWVxdGVaaFEzQktaNlRaODBoMmtRdnhGNXMyWHhpTFhyZDJscjUy?=
 =?utf-8?B?Z2xXOGFOb3J3akZYdDhLYzhEMW94Q1JscmY3OHU0ZVVScTFETXdVNXJiYkh1?=
 =?utf-8?B?WVBGSmRueldINGRkVnN5SGE2bC9wTkYrS2g3MFdsbmNJWEc1LzBXWHl6SVRY?=
 =?utf-8?B?UFBybG5aU3RoanVKWWxoSEpuMFpiMC9OQisySXBHMjJQcVdKYWhPTDYvRU9i?=
 =?utf-8?B?YXJ2QUNGTGEwTm0zeFM0aDAyMXVvaTI3dzRwQUVlMGFWM1lCMVpaV1J1MEJw?=
 =?utf-8?B?OTJEOEU1cGllVHdYbThNQTR0bVFFWjNBYTc5Z3Y2ZDl5OHlCOE1pU1JMcktM?=
 =?utf-8?B?d2hEQ3FtMEtSZ09GcG9OQ0o4SDIrQXVDbnhRUDVvYnAxQ3gyNHJuTlE0OG14?=
 =?utf-8?B?NnlHSzFOZlBaQVpHTE42blpKanlpYm9VZUlYSDYrK2M4TmRBT2wzbmZOTW10?=
 =?utf-8?B?SXM5Q2Q5NDROSDN6aDcvcGRvQjRoRVNhOHpiRTNSMndCWUJWQjYzc2NWanBJ?=
 =?utf-8?B?dkYwOVNIS0xDSitxNW1vdFF4MUpZbG1IcWIyQjJldktHc3d6Uk92WmxyNTdB?=
 =?utf-8?B?b2I2bGxVK2RJbWJNMUpjV3JLSEhsZ0g0QnN5Z1dHKzFnbjZHdzE2ZERLOE5y?=
 =?utf-8?B?Y1hybE5KcStQK01aSytTZUMzOHhmQ3EwanpIOHdURkRuNmpVQnFoaVBNSEhB?=
 =?utf-8?B?bEt4d3RTdEIvMEZLbmo4ZEwwdFIxcTNzUkdSbnYwUUpwMTRqbWtDQWZ3elBv?=
 =?utf-8?B?c25sZGJ2d2t0M0hyb3ZhT0VHczM2M0gzS0ordk92aHg5U2VVQ0dDOHAzdG9o?=
 =?utf-8?B?N2pjT0tjODlGNEFGeUtKVjEyWDJDWWxKTlRhY2RrdGpSa2pWbXlWZ0dQMmlw?=
 =?utf-8?B?RlZIVWJid0FFcHF4cmh2bGZ5Vk9MYXh0cEU0M2M3R1Z6NXg2UHlLZVphQit1?=
 =?utf-8?B?Mnc0ZEpseERYbzVxU2dRbEFrNFBDdHVsRU83bkNSaVJSRnZtOGpEZk1LNVJz?=
 =?utf-8?B?aEhOMHZ1QnZVYXpZRnk1NUxjd0JSQUt1NDNMU0hWeWg2eGxUVFMySENsK3pu?=
 =?utf-8?B?STdINDNkaURPbnRHMlp2MTZvaE5TaHJaN05lTFNvUUVsYnBhUmVPNi9oQU9u?=
 =?utf-8?B?eDcvUCtLd0dkNlJZQy9XZXcwL1oySjdFR0JPVzE5OEllZHlRdUJBUnpicm42?=
 =?utf-8?B?Ukw4YzNPN3VEVTk0Q1hnUENtVEljeHc3OHFyLzdiVTFYdFZ4QXI2VCtuOFZt?=
 =?utf-8?B?NHpWN0lvQTJHR05ScXJLU2tWcW1HSXdlN2pZNDQ4bStrdGdvUU05QW1odjdv?=
 =?utf-8?B?YzVhMUdyMXhPVzc4ejRBYUY1R0JjdVVtK0hwa2h1OU9YM0V1Rzc0MzFTMWpL?=
 =?utf-8?B?aHc3OWNzSi9jam9JbWNDR0JTT29OTFhxNmpyQ1lDRy9qNnl4QWlTOEorUllV?=
 =?utf-8?B?R2xUcVMxb3JyeWp0c21jNWxPdjQ0b2JhdkVrdWczYUJ6UDBrdFhwRm0wK20x?=
 =?utf-8?B?Vy90ZGJXSllPWGlIYlpFQVhzS1BYQ1FFYzVKSTh5a1YwVEhhY3ErNHoxNmg3?=
 =?utf-8?B?d1d0WlZLZnAwT3RldExOOC9Pd3FFWlFDeTVpZU12S1NEKzNPb3hjWWdqYlNX?=
 =?utf-8?B?UGpYN3ptUVF6N0dJRjM4YldSRTB6UWR4T01jbDgvdk16OFpLNDRmYmI4aHNa?=
 =?utf-8?B?MGlpdmFJbk10Z3lNc3NGS0NZZGR6VTN5dlc0WXpidmoveDJkejVzWWdBeXRN?=
 =?utf-8?B?K21jcnJaU2Q1RlQ2SGViQ2FJVFBQcmNLb2dOYyttOTkvY3FBbTN2Zmk3UEoz?=
 =?utf-8?B?ZmJ5S242bFRzeHBrdzRNbXFZeDRRTWp4U2xERTJhMTlFN24yU0NhdGJ0YWlY?=
 =?utf-8?B?Rm54U2JRdDVSM0dhZ2NzVjNVZ3FncFU3VG1keUtlTlRaOXdybFB6YnpNbStj?=
 =?utf-8?B?WXhSemQ0M1hPOUE0OExlME1Fb2UyOW1CUzhIVGwycHlkSGJqMlRvNENkNkVZ?=
 =?utf-8?B?d0lWeEtNelZwTDErUHExOTNSM3UwMVVMSWxLMVhQUnRocndMeUR3UHl5VjNW?=
 =?utf-8?B?bzRXdDhXbDdiWHJxR3NNbFhuMEwzWHI1bnZpaXpEWDVWR01QMjNSODFkMHRY?=
 =?utf-8?Q?htaTNV+1qj0/Dk7TBxfH21h9y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781cd31e-4661-4e51-ae06-08ddf6fb24c0
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:27.1736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKnIAUZ10/CeJ6kJOSEePn0esRXb5DeFCszUG1mlHRaY6HtLDtOoswkYJJQHocrAsPnolaQpTIGQ8TP8B9JALQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Recent changes have modified the extaddr path a little, so add a couple
of kunit tests to af-mctp.c. These check that we're correctly passing
lladdr data between sendmsg/recvmsg and the routing layer.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-9-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 9b4a8c38f4fe8f6ed51032165c0fc34007d88415)
---
 net/mctp/route.c          |   5 ++
 net/mctp/test/sock-test.c | 213 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 218 insertions(+)

diff --git a/net/mctp/route.c b/net/mctp/route.c
index 23f339b4364316817b90b4fb2952c9eac445dd24..c49c35c989d89e1c199c8f60ace4d6584ea0d8c8 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -17,6 +17,8 @@
 #include <linux/rtnetlink.h>
 #include <linux/skbuff.h>
 
+#include <kunit/static_stub.h>
+
 #include <uapi/linux/if_arp.h>
 
 #include <net/mctp.h>
@@ -1011,6 +1013,9 @@ int mctp_local_output(struct sock *sk, struct mctp_dst *dst,
 	int rc;
 	u8 tag;
 
+	KUNIT_STATIC_STUB_REDIRECT(mctp_local_output, sk, dst, skb, daddr,
+				   req_tag);
+
 	rc = -ENODEV;
 
 	spin_lock_irqsave(&dst->dev->addrs_lock, flags);
diff --git a/net/mctp/test/sock-test.c b/net/mctp/test/sock-test.c
index abaad82b4e256bead6c0a6ab0698bfa4f75f8473..5501f7794a8f96f1dcf26e93542bec04ddcfc769 100644
--- a/net/mctp/test/sock-test.c
+++ b/net/mctp/test/sock-test.c
@@ -1,10 +1,223 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <kunit/static_stub.h>
 #include <kunit/test.h>
 
+#include <linux/socket.h>
+#include <linux/spinlock.h>
+
 #include "utils.h"
 
+static const u8 dev_default_lladdr[] = { 0x01, 0x02 };
+
+/* helper for simple sock setup: single device, with dev_default_lladdr as its
+ * hardware address, assigned with a local EID 8, and a route to EID 9
+ */
+static void __mctp_sock_test_init(struct kunit *test,
+				  struct mctp_test_dev **devp,
+				  struct mctp_test_route **rtp,
+				  struct socket **sockp)
+{
+	struct mctp_test_route *rt;
+	struct mctp_test_dev *dev;
+	struct socket *sock;
+	unsigned long flags;
+	u8 *addrs;
+	int rc;
+
+	dev = mctp_test_create_dev_lladdr(sizeof(dev_default_lladdr),
+					  dev_default_lladdr);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	addrs = kmalloc(1, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, addrs);
+	addrs[0] = 8;
+
+	spin_lock_irqsave(&dev->mdev->addrs_lock, flags);
+	dev->mdev->num_addrs = 1;
+	swap(addrs, dev->mdev->addrs);
+	spin_unlock_irqrestore(&dev->mdev->addrs_lock, flags);
+
+	kfree(addrs);
+
+	rt = mctp_test_create_route(dev_net(dev->ndev), dev->mdev, 9, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt);
+
+	rc = sock_create_kern(&init_net, AF_MCTP, SOCK_DGRAM, 0, &sock);
+	KUNIT_ASSERT_EQ(test, rc, 0);
+
+	*devp = dev;
+	*rtp = rt;
+	*sockp = sock;
+}
+
+static void __mctp_sock_test_fini(struct kunit *test,
+				  struct mctp_test_dev *dev,
+				  struct mctp_test_route *rt,
+				  struct socket *sock)
+{
+	sock_release(sock);
+	mctp_test_route_destroy(test, rt);
+	mctp_test_destroy_dev(dev);
+}
+
+struct mctp_test_sock_local_output_config {
+	struct mctp_test_dev *dev;
+	size_t halen;
+	u8 haddr[MAX_ADDR_LEN];
+	bool invoked;
+	int rc;
+};
+
+static int mctp_test_sock_local_output(struct sock *sk,
+				       struct mctp_dst *dst,
+				       struct sk_buff *skb,
+				       mctp_eid_t daddr, u8 req_tag)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct mctp_test_sock_local_output_config *cfg = test->priv;
+
+	KUNIT_EXPECT_PTR_EQ(test, dst->dev, cfg->dev->mdev);
+	KUNIT_EXPECT_EQ(test, dst->halen, cfg->halen);
+	KUNIT_EXPECT_MEMEQ(test, dst->haddr, cfg->haddr, dst->halen);
+
+	cfg->invoked = true;
+
+	kfree_skb(skb);
+
+	return cfg->rc;
+}
+
+static void mctp_test_sock_sendmsg_extaddr(struct kunit *test)
+{
+	struct sockaddr_mctp_ext addr = {
+		.smctp_base = {
+			.smctp_family = AF_MCTP,
+			.smctp_tag = MCTP_TAG_OWNER,
+			.smctp_network = MCTP_NET_ANY,
+		},
+	};
+	struct mctp_test_sock_local_output_config cfg = { 0 };
+	u8 haddr[] = { 0xaa, 0x01 };
+	u8 buf[4] = { 0, 1, 2, 3 };
+	struct mctp_test_route *rt;
+	struct msghdr msg = { 0 };
+	struct mctp_test_dev *dev;
+	struct mctp_sock *msk;
+	struct socket *sock;
+	ssize_t send_len;
+	struct kvec vec = {
+		.iov_base = buf,
+		.iov_len = sizeof(buf),
+	};
+
+	__mctp_sock_test_init(test, &dev, &rt, &sock);
+
+	/* Expect to see the dst configured up with the addressing data we
+	 * provide in the struct sockaddr_mctp_ext
+	 */
+	cfg.dev = dev;
+	cfg.halen = sizeof(haddr);
+	memcpy(cfg.haddr, haddr, sizeof(haddr));
+
+	test->priv = &cfg;
+
+	kunit_activate_static_stub(test, mctp_local_output,
+				   mctp_test_sock_local_output);
+
+	/* enable and configure direct addressing */
+	msk = container_of(sock->sk, struct mctp_sock, sk);
+	msk->addr_ext = true;
+
+	addr.smctp_ifindex = dev->ndev->ifindex;
+	addr.smctp_halen = sizeof(haddr);
+	memcpy(addr.smctp_haddr, haddr, sizeof(haddr));
+
+	msg.msg_name = &addr;
+	msg.msg_namelen = sizeof(addr);
+
+	iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &vec, 1, sizeof(buf));
+	send_len = mctp_sendmsg(sock, &msg, sizeof(buf));
+	KUNIT_EXPECT_EQ(test, send_len, sizeof(buf));
+	KUNIT_EXPECT_TRUE(test, cfg.invoked);
+
+	__mctp_sock_test_fini(test, dev, rt, sock);
+}
+
+static void mctp_test_sock_recvmsg_extaddr(struct kunit *test)
+{
+	struct sockaddr_mctp_ext recv_addr = { 0 };
+	u8 rcv_buf[1], rcv_data[] = { 0, 1 };
+	u8 haddr[] = { 0xaa, 0x02 };
+	struct mctp_test_route *rt;
+	struct mctp_test_dev *dev;
+	struct mctp_skb_cb *cb;
+	struct mctp_sock *msk;
+	struct sk_buff *skb;
+	struct mctp_hdr hdr;
+	struct socket *sock;
+	struct msghdr msg;
+	ssize_t recv_len;
+	int rc;
+	struct kvec vec = {
+		.iov_base = rcv_buf,
+		.iov_len = sizeof(rcv_buf),
+	};
+
+	__mctp_sock_test_init(test, &dev, &rt, &sock);
+
+	/* enable extended addressing on recv */
+	msk = container_of(sock->sk, struct mctp_sock, sk);
+	msk->addr_ext = true;
+
+	/* base incoming header, using a nul-EID dest */
+	hdr.ver = 1;
+	hdr.dest = 0;
+	hdr.src = 9;
+	hdr.flags_seq_tag = MCTP_HDR_FLAG_SOM | MCTP_HDR_FLAG_EOM |
+			    MCTP_HDR_FLAG_TO;
+
+	skb = mctp_test_create_skb_data(&hdr, &rcv_data);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, skb);
+
+	mctp_test_skb_set_dev(skb, dev);
+
+	/* set incoming extended address data */
+	cb = mctp_cb(skb);
+	cb->halen = sizeof(haddr);
+	cb->ifindex = dev->ndev->ifindex;
+	memcpy(cb->haddr, haddr, sizeof(haddr));
+
+	/* Deliver to socket. The route input path pulls the network header,
+	 * leaving skb data at type byte onwards. recvmsg will consume the
+	 * type for addr.smctp_type
+	 */
+	skb_pull(skb, sizeof(hdr));
+	rc = sock_queue_rcv_skb(sock->sk, skb);
+	KUNIT_ASSERT_EQ(test, rc, 0);
+
+	msg.msg_name = &recv_addr;
+	msg.msg_namelen = sizeof(recv_addr);
+	iov_iter_kvec(&msg.msg_iter, ITER_DEST, &vec, 1, sizeof(rcv_buf));
+
+	recv_len = mctp_recvmsg(sock, &msg, sizeof(rcv_buf),
+				MSG_DONTWAIT | MSG_TRUNC);
+
+	KUNIT_EXPECT_EQ(test, recv_len, sizeof(rcv_buf));
+
+	/* expect our extended address to be populated from hdr and cb */
+	KUNIT_EXPECT_EQ(test, msg.msg_namelen, sizeof(recv_addr));
+	KUNIT_EXPECT_EQ(test, recv_addr.smctp_base.smctp_family, AF_MCTP);
+	KUNIT_EXPECT_EQ(test, recv_addr.smctp_ifindex, dev->ndev->ifindex);
+	KUNIT_EXPECT_EQ(test, recv_addr.smctp_halen, sizeof(haddr));
+	KUNIT_EXPECT_MEMEQ(test, recv_addr.smctp_haddr, haddr, sizeof(haddr));
+
+	__mctp_sock_test_fini(test, dev, rt, sock);
+}
+
 static struct kunit_case mctp_test_cases[] = {
+	KUNIT_CASE(mctp_test_sock_sendmsg_extaddr),
+	KUNIT_CASE(mctp_test_sock_recvmsg_extaddr),
 	{}
 };
 

-- 
2.34.1


