Return-Path: <openbmc+bounces-661-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C205CB87273
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:35:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS21lhmz30T8;
	Fri, 19 Sep 2025 07:34:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231282;
	cv=pass; b=YOgOUYcAOpOuotq5tUxbGA9NVFKfy3j82SvwKtEOQ7LSDLFtgN4y6XVa08+oXILN2rYXcd1PlzJ0035kOZBQevx84pjRjz38AwUvEhBi6SLMrEuiNiLCk8pP1kT8ZleFZkMLkf9LZ5gNj6q2LLjcOWg1Oyb7R2iTwqxRdDAjKHggvJFwLB0tP1F6Huv7WFAAcwMlulhnMvsMRKTlGvpZZcPpqc7viXDGTco+kc5kwefyhIfNkDK4xbTVf0XBxMwG3gDtp5juoVIpI5FEOhIJslLHlz7IgDM8aRjSopk0FSUIjXVVFoH33CECMQJ19MOdB58iENF/3bIhMzQx0ypFUw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231282; c=relaxed/relaxed;
	bh=IBOJRkGmnKSrwxf5WlbPSwDuvN1lt4wrjWu0iEadluk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MEQwvkxsHKON06Uk2z/GU9gs67cdwjo+gAt2FjekDWXog10K27Tfzg2pLnbI57CW+Iw+HXdpZKsQ+7EJPMWRvcrDFUbDcRJ83+X4SIcme4palmeQhTyFBy0+yucMzWToUu1GfNnWzBM/nOEDkIiNmaqtfTSEAr38ZjezxMyf1sFUr2F4ktXFFlyUFMYGYNbDdlk/az4psEpOKiz0LYrWp/emaUDIETV3gjvq0TXC7aKimME1eWJX/xAR4AzZfMBmpeVT9xDPGE1x8j8u9Qr/w3Ri6zo6yni8G7oEAoDeWaHtbp0i8hbMVQ1ihucuysRyd8d1qjkFkJyHUYokUu5bbQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oBd6XVvW; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oBd6XVvW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS14G2wz3cDN
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3AQ+T6voqONNIrDD6bZqxgH0jN2FOlnluoSB6VOPpxSpkPeJGc4jjW089zRgppGYgNXZVNmSCKKpE0/rbGXjrWQjAT+fsPo0kNLFNjTp1cimlZxz1rsjPrOHZ1JB22nNJktxpXHKKsxSLWQUZ0u4L0zsevAUOexNNcDZJJwghgvufbl27FTkisHIuPOcq6f8ONE2ZcC1/ANqMDRhXu+811TiGaqoPrPRXZiJRSj4CzQwJ/puwjyFm9ogIqAzfbscO0pzWJor0XQ55yt1BIdp/+PIgBREjxGOKLK8kUTKZqK6lO5iIkxwfWFhVz5dXGJISGiyNy7MXyA/N0jAxP3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBOJRkGmnKSrwxf5WlbPSwDuvN1lt4wrjWu0iEadluk=;
 b=dnZcl3Uzq1nvjsObi1i7PTEfo56YIwSWjw3Crkpy990QQUsDv7rjk7TP/G9nk+FFRNyNbD2rzPHeAQTQHsVzr/8uaK/tvW+dFaE1lXnyKHGWmRKpgR7V4ctaYoF31MvPhOtszaJir3h1Y+yYKLxVlV8F79rykFmthNPjWeY06xCj/Yvx6q1W6ndRPMlNAaK9CA+PqXqBSkKzMIeygkL+HnHgNqfxoXOR8N7UBtvkevpoIYuH3dwQZiCqsCiVecRTdiyZ32oOB6P/PqrwNlZZh8IZGMf/Da8eutIMYf9pKMR4a6SvAmnfONoC3wRG0aYYGWvgMokPL/t61xEl8Fq49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBOJRkGmnKSrwxf5WlbPSwDuvN1lt4wrjWu0iEadluk=;
 b=oBd6XVvWEIq9UIDXT5dxJLHMI9eENY3U6YsGeLjGGw4R5ehVzihD6egJxHM4xfG3af7lEC4abXlPxOI/Kv7+nMnWD2nBJxvhuSl3RaZup7pZbtpj8+rQVYYIw6rdVqOH94x2Kg8TsTKZ1q35UGwBNh84tB/MmhttoHN9vd+Go8Gwx0SOOIP+N3JVpSkz6eXDSIm/W2P1CYnG8yYQnWyobrCovhBz8zx+hAsyRsW8Ra4h43tCvNz8rw7myxmwhgZOoFQqTHhlLWYtzAz5HixMRISrTo9SvzqpNSL/OFps10vfpCzX81d3rnz2ldO6hc+qyJxZ7XqaqxaRPnUiueJTWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:22 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:22 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:52 -0700
Subject: [PATCH linux dev-6.12 06/14] net: mctp: test: Add extaddr routing
 output test
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-6-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=2805;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=ui4nxRNNUfkdE25IA+0ce1WCWIZ7JyDTitAuRgRaq18=;
 b=sVA34Mmx2mx5uTmKJFYhoWEvE27ziOEKozYVlEZ8WClJDXvxONHNOXRdVpLt5om9ubZibWKIp
 BnrKAPQdF11ATrtxW+32wupskgeTPT3Hm2ezW71UkD7wIymhutok7Gv
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 024477da-63c8-4194-88c3-08ddf6fb2201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTB5S0tWQnBTNG82OUdCQ2pOdkJQMXNoTEQwN3BlaElRWHNNMllhTGtiZHdj?=
 =?utf-8?B?Zml6RTBnTEFLOThqVEswL1dvYnB3YnlqNGxGOGRJenVIZ1V6ckVpTlZLcWM0?=
 =?utf-8?B?eFBFQTUrVmlpWFowaGRiY1BEbWR4Rk1FOTFxVEVSR2FGaXg3dWF4WnQzN3ln?=
 =?utf-8?B?WGxxTXcrMUF2MHo3dmR6SDJaa1FpWUlmNmNCODRMV1kwenUwSnpmZzNMR3FE?=
 =?utf-8?B?Z0xFS2k5NEcwV0h6Wk16RlFrY08xdVNqUERIRWp4QVhyYVNjQTBjOE1CdU4r?=
 =?utf-8?B?Q3AyVWZsQzBkQkI3dVhidmlRMk8wWjkvaDZlZkpsa2tQY3FmblZuWlp1dXk4?=
 =?utf-8?B?eG1NajRvejRMNEtMQzRNNHZUcTZNRHR0MGhHNkF4ckVnNVAvR2hIOFgrK3o2?=
 =?utf-8?B?U3dmaE1sckNZNG1Ock5PZVJIMlZRS1FHODlNYjhGQ3dWVnFHTHZ1TUpWYjRu?=
 =?utf-8?B?TnBnUitXRllLUGxLUHNxUzFsWEhncFdGWWM4bkx1RmRrQ0doRGUvT3lKbXFH?=
 =?utf-8?B?YllsR0UzdjFXbWNTUEhJY1pUNjMwNDJuanovN3Q4dURBbFdDNXRaLzJUcEE3?=
 =?utf-8?B?QkV2VFZSaVBYRnUvWGQvRDMxaFZWQlNkb0tIU0dqOHI1ZVQ3N1d3Z3NzUU1S?=
 =?utf-8?B?RXV6cUxRbFZJTytEOEk3b0Y5RnZkendISjAvRmYwdm1SeURoemxNSHZCS1dQ?=
 =?utf-8?B?K1JNK1hESkNydC82Rnoybm80TXZLdXo4bzgvMzdWc0crMG1vaVdwYnFyL0RH?=
 =?utf-8?B?M2VUL1o2SHoxYm1xdnByZXd5NmtsbjNrQlF1V2tNcG1iTEtkRS9pbTgzQU8z?=
 =?utf-8?B?Qmp2cHc0akRwSVdwUTdBYW1wVGtGdllhYXFYUXltNGFBRzBrV09mK3VLaDZs?=
 =?utf-8?B?SDZsNTlHbGU4Q3JTLzFObUsxNGlJNlZzaGxxekt6eE9kUmFNWlFSMVdjakMv?=
 =?utf-8?B?L1J4UjM5UXB4TkdNWHh3UTlhZFY2WGltVlBqem5xYmhxTndmMWE0em5QejRi?=
 =?utf-8?B?NW9DbmxwQjlMRFF5VGpwZE5IN2tCd1lRTEVMRTc2TVJSZGtueEMzQVQvT1JW?=
 =?utf-8?B?aFdiVGZ0VUlsS1JrajJoSURTYmtSQUJjSnlSQS9tdkpxZ0RKa29nbzFrVXBQ?=
 =?utf-8?B?Vmxrc0dHeXBCNkdDUmdWU2dtRWk3Y3pJMk0yVGRhaHNMcjR4WTBMWGVkcG5Q?=
 =?utf-8?B?OFViUDdLQmlCbEw2UDdMRElzazJQSXpoekNoU1lTTlo5WStNY1hKRDlRT0t0?=
 =?utf-8?B?eHJlRE9lbEhmb2RpU1RKOFpMUVFDNTZtK2wyWDdUYzFSY2MwVXJVcmpFeHBt?=
 =?utf-8?B?WUdhaCtGVGU4TDdMOTZTUWt1QUFjdUlBemlZM3M4eUw2dEQ0QXhyenM3UWRS?=
 =?utf-8?B?N3VvNWpTVkdkRnR3bUU2b0ZkcEE0TjhYbzdHbkVUVmhtczJhVVVOeUhHc2dn?=
 =?utf-8?B?WENVaVoyNkdPU0d5VGZsNHRUZEVxam5SMmRYMUJlRW1XLzREckI3SWxKK0l2?=
 =?utf-8?B?dE5aMUFydUtsV0dVbDJ1MUlOMC9Dd0hXU0RBeVY3Q2FNYXVXbjZVUlM4OEU5?=
 =?utf-8?B?ZnhkNjJZYTNyNGpsbGtzVTJNemx5Q0Z6bVNUVStNMEhWV3dZS0VJOXduMkV4?=
 =?utf-8?B?bjNKcjcrMGFpTURPVHpxU0EyUzlGVDZpakIyV3poZTFzU3o3RFZsWTJQaVEz?=
 =?utf-8?B?VENzQUlYRmFkZTdLdUlVTTZZUnZ0Z3JxWnI2YWZRRDZTU0Z0a09QRmk5Wm1V?=
 =?utf-8?B?dFFUNFk5SlpESDAxV2hCVXBQK0U1VUI0Q2hsQ0taK3g2RmN6ZUppTXZLMC85?=
 =?utf-8?B?V0hBa2dLUURyWkJrTmNSM3RjanJkZVVVdXExSXFJc1UxaWVwNXI5WEVNRkEy?=
 =?utf-8?B?VW1GbUc1dnplL04wWnJISTE3WjZHSldVSFJ5QzRsVWlsRjZDKzFIdTF2K0tU?=
 =?utf-8?Q?gdNCLS0Ck8s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGdxVlZvTUorRVBvRkUyNFNkY3FzOEl6aU83bXBwclZ1NEtZWllwVEkwcWZp?=
 =?utf-8?B?bWl3dmtEWU5FanIvMWRyL29KTUZJTjBMbjZNZHgwVHFIMmFQNzc1RE8xQWlX?=
 =?utf-8?B?bEJKbGtFZkI0QXFBejQzd3hJUmJoeVJlajBCVXV4ZUVhZ3lmNkJpVjgxaXRC?=
 =?utf-8?B?VTZGTGlueHBvK1hkakZIeDFsV2R4ZlVMSXJTTUZabDcvUWtjTUJRNm1XNG82?=
 =?utf-8?B?THFDMHZGcFI4UTE0cHdXWTRFVHlES1F4dWtBZ2FsYWRWbVhuOHdpQnhNR0Fh?=
 =?utf-8?B?Ukd6MWQ0R0ZtSERKNlFWRDUxZ0o3ZzRYdFJOTy9jWEwrYmFJNkJKSnd2dXRa?=
 =?utf-8?B?NkJGSUorK2MwTFNUVUNXREt6czB1MGlybTVSVk10cTIwZnZWaHlxYW12bnVu?=
 =?utf-8?B?cDlZNWdobllDMDRjRlltN0JIRnowdVVKalBEektvMnorMTJyVi9oc0Z6bEJn?=
 =?utf-8?B?T2RyODk3M2lPUTNvOVJHcGo4RTgzMGZiODhrWDJBcGVMZTAvQkpFaTROMERT?=
 =?utf-8?B?WEhlaHRLNStMUlNCM09JV1pISXIzak1Kd1dnTlFIWFM1NGgrc2ExZVJBU0hx?=
 =?utf-8?B?WEh0TUtsTzJLU3U1aklhUUJJcVkzbEhMMzJ1Ym8vU3owcFVEOCtCTmVJeU1Z?=
 =?utf-8?B?WWl4cTdBSEtTZk5lelU5bDE3aUNJMEZYTGhRREZsRGxGc2xod0JqOW1hanlH?=
 =?utf-8?B?eXkxOVpQQlI2T0JuSlJHZWlibmlwRW5yZ1gxbGt4c1dueXRiclkyY1BkVVVG?=
 =?utf-8?B?YXpIMDZLVUQyYzJGY0JrSThWaGpFZFJXMC9UUHFMTU1JZERsQmVwdUtUajBI?=
 =?utf-8?B?MFM0OHhUaVBRMUhMVlpZWC9YckNlY1ZxaEdrdy8xWjl0dDc1QXVQMkxyRjZv?=
 =?utf-8?B?WFN4MTQwVmR1ZnJKckU5OEtxKzdFMTkzTE1YQ21NcU5Nd3Y4UVZPZS9NL1NV?=
 =?utf-8?B?bzE2cUliUTF0VFBvSnB5MUExSUt0WERvdm14M2hXbEgxL1BtaTZSWTJXblhh?=
 =?utf-8?B?b2JXR2tNMnVKOU55ZHd0eVRwaG1BRjFRQWdGZVprSDFZVXFENkJEVWt1b2N5?=
 =?utf-8?B?RmdVWVpPbWhteEJmMXd3RDZyQUFRTjJiVllmNXpZNTY5SllLbjRoR0YzdTBN?=
 =?utf-8?B?NzRhMVdZbldDZFFjdVBJVjBOdjdCZExYNVJ6WWVCWFRtN21QdzZPRHhUUllW?=
 =?utf-8?B?WTFxUlkzVS9na3k3ditzemtMQWR0N0kwc2tUQ2grVlFHZ2owdnRwcjBUNS96?=
 =?utf-8?B?cGxYMFkySjJ6cWhpdVZwMG1rSzBBdDhhRC9KS1AyNWg5RFVwQXQzMWd1Z2Zs?=
 =?utf-8?B?MGRwcFhjYjBNOVcwM2hZdUpoejBQczNXRjhVbnFDQXlNcThXdy8wZ3dKZHhq?=
 =?utf-8?B?OWJzcUZEZnlML3dPZnMxbm01bnNQeC8xM0ZxVm54RVgwUWhUZ0FtditVU3Vp?=
 =?utf-8?B?UTJPaHdIMGhLNS9OcUI4eERJUEJLQTNNQzcwMzhVcVVYWTJSNWtPdjJ6WGlU?=
 =?utf-8?B?Tkd0MmtFREVOcUZqeTN3elJkNDRTRnVmWTRueHVpK1ppWjZEVkhGbGh1MC9B?=
 =?utf-8?B?N0tZMG9sMW9mVlRYRldFbmVjb1ZCN1MyT1ducXR4NmVGWktUOXB1L2l0TitJ?=
 =?utf-8?B?VzlrYXZzVHF0ZlZQWnl5NDFrdHdMcFhuVHlVbnBTbFM4NkpLS1hxQlFYVy9j?=
 =?utf-8?B?T3BWT0ZtRExTVDIyaDBoc3gyV2JJMzNEcjVlVVUxTzkwdTRWdHJCSTJiaEJ4?=
 =?utf-8?B?cW94VHFEVXAyMnpNNENiOFVCbkQvSGlPWE5oY1A2V24wV1k0MnA2UWxGbUpr?=
 =?utf-8?B?SkYvWTYyZE5hYm1WT2xGVXYyZ1hzWlNpSmp2RlAySlVBUStIUEdnckMxYVdM?=
 =?utf-8?B?Zm1FSEU4SGZYWFRIdWEzTmwzQVo3TVFRT3J3aFBvVG1yS1BoOUxvazBjRVlR?=
 =?utf-8?B?bkVXMTRHeS9ZR3RPb2daV1JuWmNRVGdOVnNaTlVNT082RFQwQ3lGOStOVGF1?=
 =?utf-8?B?WlpyeXJsYjN0czNtQkJBOGN4YW0wSlBPY1RYQXJVN2tOdE4xQTdhR3dwSlFi?=
 =?utf-8?B?Y2RpNmMrdkh0K05YUzRKUjArUGpiN0Q3YW5EVjZ6b1FrVkVkbGpScTRNc2t1?=
 =?utf-8?Q?oOhCitEyRPXIhXVzFl0yD/zov?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 024477da-63c8-4194-88c3-08ddf6fb2201
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:22.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SanpNRmsMEKl+zERW/Qq1qjeAfGoRcY5k1uxFy0cNMwG1JpzoqBRSS1Z8S8HxLmuuJN9rwCGP1awDSMtO8O3pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Test that the routing code preserves the haddr data in a skb through an
input route operation.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-6-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 46ee16462fed5c3a065b603d677a9a36462dab7d)
---
 net/mctp/test/route-test.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/net/mctp/test/route-test.c b/net/mctp/test/route-test.c
index 7a1eba463fe77e4419dfeb94341562541a13fe8a..3a1a686e36c36d3ee700a093cbf77da7e25afe56 100644
--- a/net/mctp/test/route-test.c
+++ b/net/mctp/test/route-test.c
@@ -1294,6 +1294,58 @@ static void mctp_test_route_output_key_create(struct kunit *test)
 	mctp_test_destroy_dev(dev);
 }
 
+static void mctp_test_route_extaddr_input(struct kunit *test)
+{
+	static const unsigned char haddr[] = { 0xaa, 0x55 };
+	struct mctp_test_pktqueue tpq;
+	struct mctp_skb_cb *cb, *cb2;
+	const unsigned int len = 40;
+	struct mctp_test_dev *dev;
+	struct sk_buff *skb, *skb2;
+	struct mctp_dst dst;
+	struct mctp_hdr hdr;
+	struct socket *sock;
+	int rc;
+
+	hdr.ver = 1;
+	hdr.src = 10;
+	hdr.dest = 8;
+	hdr.flags_seq_tag = FL_S | FL_E | FL_TO;
+
+	__mctp_route_test_init(test, &dev, &dst, &tpq, &sock, MCTP_NET_ANY);
+
+	skb = mctp_test_create_skb(&hdr, len);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, skb);
+
+	/* set our hardware addressing data */
+	cb = mctp_cb(skb);
+	memcpy(cb->haddr, haddr, sizeof(haddr));
+	cb->halen = sizeof(haddr);
+
+	mctp_test_skb_set_dev(skb, dev);
+
+	rc = mctp_dst_input(&dst, skb);
+	KUNIT_ASSERT_EQ(test, rc, 0);
+
+	mctp_test_dst_release(&dst, &tpq);
+
+	skb2 = skb_recv_datagram(sock->sk, MSG_DONTWAIT, &rc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, skb2);
+	KUNIT_ASSERT_EQ(test, skb2->len, len);
+
+	cb2 = mctp_cb(skb2);
+
+	/* Received SKB should have the hardware addressing as set above.
+	 * We're likely to have the same actual cb here (ie., cb == cb2),
+	 * but it's the comparison that we care about
+	 */
+	KUNIT_EXPECT_EQ(test, cb2->halen, sizeof(haddr));
+	KUNIT_EXPECT_MEMEQ(test, cb2->haddr, haddr, sizeof(haddr));
+
+	skb_free_datagram(sock->sk, skb2);
+	mctp_test_destroy_dev(dev);
+}
+
 static struct kunit_case mctp_test_cases[] = {
 	KUNIT_CASE_PARAM(mctp_test_fragment, mctp_frag_gen_params),
 	KUNIT_CASE_PARAM(mctp_test_rx_input, mctp_rx_input_gen_params),
@@ -1310,6 +1362,7 @@ static struct kunit_case mctp_test_cases[] = {
 	KUNIT_CASE(mctp_test_fragment_flow),
 	KUNIT_CASE(mctp_test_route_output_key_create),
 	KUNIT_CASE(mctp_test_route_input_cloned_frag),
+	KUNIT_CASE(mctp_test_route_extaddr_input),
 	{}
 };
 

-- 
2.34.1


