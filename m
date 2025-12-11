Return-Path: <openbmc+bounces-1013-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4ACB739A
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 22:37:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dS5Wx0Jh7z2xGY;
	Fri, 12 Dec 2025 08:37:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.46.39 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765489020;
	cv=pass; b=Jy1ojdoRQ5UFFcKOZNruez2vEaxs3PN6NJfLcF/vmbOgGq9KCzWwLjahLJuVjnXMI3qh2M00vBv2RwOYWW8eWqMc/o0lxcLfCNyCQeQkGEUqcmBCjo14pDgia8EeqzyTT7ftdA22uJQMkWIsqeO5ubpIPhY2FEznepP4lvkOg3CdU41mnN5W3NcZTEA/pHYklIPAuWPPyxUk/u5FtL3bqgaypv814VsAaIdNakquK0ME90s1eVwEapV/dk6wbSbLYXvq5iAtSPPWV4MHrGYfVQqEhLZebkzqCsI4Rm0FO3KsLAhPJi1orgVWw9XZYi8DVG8xCEIUJ0DpRS4fcqzwSg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765489020; c=relaxed/relaxed;
	bh=cCCFtMxtJyScWsoe49DXupHxGnhnwYxVztWb8hL0UEc=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=ddPYmIj07kmC0PUKtinHXjpXM2drqUeeHyFnjrSzt4b9RN5FVPssStnB5JLTsljmd0EROcL5Iy9IkprlVYjDtXe/pbdoNgsGDr9FlD04QzYf2C9HkWEwbUYYWj7YGBr0aECppnKqVA7WdWM5A7zfmJ6xm8Smn4M7rdKJRhbUS3Os4hmT/MyJLjvGsHPHHtvqXW4V5lJNelyACUwd56aK1oyCIPL4TEmMUc/nf1s+fsN8797BPUqkzcmu2X4nopn3ObZPgTXr7n63eNCvywAaAIuiudeJ8gtminQl2sZSO3CZyg3y7M4tcRUzmuuTeROUtMH+zSKHNTyg6/mT0dXPEg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bbg9WJff; dkim-atps=neutral; spf=pass (client-ip=52.101.46.39; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bbg9WJff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.46.39; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dS5Wt6shkz2xFn;
	Fri, 12 Dec 2025 08:36:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdjJ+LMbxlJFxYT7N56nJdzFbBzrZN/QxD7eIyNIKDBXQml5wj5BDnz3JX2Ew9S73oWnk4H7n9xWHFpjs6Rl3f9edxN6Ra1+DgjUYli2cH80EcyVRs7QBueCxyjz4gi5aRfuC+Rmr1/kwpljwA2AjTxrOmw9eQsJIL4n/ZTMjhEBSQ9Olg86vpNEcOb8xq1Bqj8wbPd0Rc/AbRuUAV48wAMyNEUtuuw1Ywb8iXKyX1CN0KOR6SlgKcyM/DbX2PV/bIA7ZSCu4pl/JDoh9xSuoFQTsoATp24T7u7aw2InsTdjv4PvBT+lWcAFHf6r2B5y4ZwRYLljg9mOoT1k3eVz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCCFtMxtJyScWsoe49DXupHxGnhnwYxVztWb8hL0UEc=;
 b=kTftvOlYN8/xs8AJkCV2h81+LsTqHOQWBg6eg0hjQeqyyZ+4QTXzCeFezjIeIlOqRTEUgCcQCw7kNNEqDrzK3pIawGHG5XQRDTLTEkrsN980WEWLVc4MGDBwXkC1cnMqsNa0XH5IwjbSyYWYQ6t8xHS+X4+IkmAlh5cy40aH2w7Dy8ipkCusrXQf9az6buEVZFnnBD7iDj+XxpcKEH739K7s4z10Q3J8Z8ByAn7E6ZbZ88xdNUdPR8Jwz0GptoKmGgMsjsnnWiijUK0ayE2AK21yp1nMpa7v2sqADq4JacacYom9eKf+7WFhbTpggbcYHxeb3Jbs3pL+gCUditjhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCCFtMxtJyScWsoe49DXupHxGnhnwYxVztWb8hL0UEc=;
 b=bbg9WJffWRkpoNyJpekQnh7hPgioj8n9JhwfkkugA3SKpYykyTh5RmrDzL8dLgKnLmQ9i4WMywt9GI2nllb3R4nzvLB6KXHsbpTSxeMOPZu0/mM+zSWCoS9D9lTjUbKPtVXYNrgZUQ0ua6CpavP1ABFTNUbqVIgdUMgaukkWn7LjgYByMg2DrUkfI19rrlyQYBxFx1a6yfYie/K8JQ9gVCXbjloF9kdj9RJjdHN9WZjFEf8hZJf9rGLEHJWw8OJPYz8kMSmzK45yYDNsko5SohH4xhtYAdIb7N1NASktW55uwalZViNRT1p4xgfyoDznpCvXKCSuwHOE9VNoYOehDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SJ2PR12MB9116.namprd12.prod.outlook.com
 (2603:10b6:a03:557::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 21:36:15 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9388.009; Thu, 11 Dec 2025
 21:36:14 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 11 Dec 2025 13:35:29 -0800
Subject: [PATCH] arm: dts: aspeed: add an alt 128M flash layout
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-alt-128-layout-v1-1-100f57d2bc4a@nvidia.com>
X-B4-Tracking: v=1; b=H4sIACA5O2kC/x3MMQqAMAxA0atIZgNNUBGvIg5FowbESltFKd7d4
 viG/xME8SoBuiKBl0uDuj2DygLG1e6LoE7ZwIZrYiK0W0TiFjf7uDMiM9nKNE09mxZydHiZ9f6
 H/fC+HxJL/5VgAAAA
X-Change-ID: 20251211-alt-128-layout-221a40665f08
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Marc Olberding <molberding@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765488973; l=3198;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=bw6+xrCgTfTLMq6RDMw2CaI2MOdKf1ohDcl97niGlQ0=;
 b=X9Hhr0BFhOTgELynI85Ni/AWFVJggnIo6vJ2TGnAQAKYULxFngc2i4BMEAsSR7Jb+jYCxBDIj
 R7Rl2EUssZHAZXZ21liQRpK+Pr3pQsQ0Ewcv12HLNEOQG+4aakg5upp
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 648de8da-79a3-4efd-9fa9-08de38fd4f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1MwZ0owUjgweEVad3NLbkZnaU1reU8yRitvSUg0d2pTV2hlQ2N5b2pvajFM?=
 =?utf-8?B?b2F5YXJHcFdQUW52bjVxMnpyM2FXR2Fjb2FZVHhralRHMlFESzZZNXEwU3Vt?=
 =?utf-8?B?T0dIaWJ4TGhvRi9hTzdwZjRpOVNEL1lIaTdXQXU1SnhzUlhlRE1rVU5jK3Vy?=
 =?utf-8?B?dmJuM2RCaGVnV0ZqSFJZRS8yZHU1ZDNDRUdDbUw3UVRvZnhjRy93bDdMczZR?=
 =?utf-8?B?TC9NbXliMHRZQi9SdVVaSlV5ODJRT2k4bENtNlJLUy94SG9DYUhZZFdwdENw?=
 =?utf-8?B?eEVGdHZOMmZ3dDhJQy9qUlBvcFd3dEN4WCt6dzBIeCtBRzAwMkZHd0E3Rytk?=
 =?utf-8?B?MXl4NWVaYTlkekR2SSsyQzJqcnEzYUdWN0FBT2RMcjRQeXJReWNDVXNFOTIz?=
 =?utf-8?B?VGVuVnY3emNVNlJicmhpdTJsYTFTdjdNQVRCNkpEYjdlWDcxQjM0RUF6QzN2?=
 =?utf-8?B?K2dGQXRBVGJteGRvWXFkMS9ZU2IvTVZaZGhzcmZuN3hReEpLNGRUeXBwSUNs?=
 =?utf-8?B?NUhFc1ltM3M5WVNvM3BIanJvd1hka2JNVjRyODJRUEV6YzV2QjM4akZWQXpz?=
 =?utf-8?B?YXBVUVg3cWxZTFV2U0FYZU5ZVmY4RFZRZ1p2TVdvUnBaMTNGWFlOQ0FDaklS?=
 =?utf-8?B?QmRJR2hpMzdDZTNLR0FMODEvWXpURi9rd2c5aXUva21CcFBqQ1RvUjFuM0g5?=
 =?utf-8?B?aDM5amlDUDF4L2xudGpnb0M4WlVScmdoSHVXaDBVYWFXSkJLcHRnelVNUGNW?=
 =?utf-8?B?cGRZTFVZZ1o3ZG5yYmVZZGJNUmNiQzkySFJ0N0wxTTNTYWNTd3lCZDMwK2ts?=
 =?utf-8?B?eVM0VU5kdmVSaFlwNmZRSU9VVFkzSVU0RjBmak5IRTdoaS93eFhVTkdDd2xT?=
 =?utf-8?B?ZDR1dnBpMmlBVHdGQ0JzY0Vvb1Jrd0RJeGNOMVBnenBWbXoxRG1TUWxPYk1Z?=
 =?utf-8?B?KzRNeDVCQllOVWcwd0FDeUpkYUYyK3JTZnZVc1hIQUNoQUxCQW1RZmFLSmJL?=
 =?utf-8?B?cGdnYUpqU3JvdDEyZ29FSGF2UmRPWXN0emJ2c01XSjVyeW9jOWtEV1djaHI5?=
 =?utf-8?B?dyt3eFJLOGRqRFRFZG9PZ3B1RHFzWGNKOXRKNllGUTJUd1BpUjRmb3FvRWRZ?=
 =?utf-8?B?dGZKbmx5ZHJKeGg3MEFRbXZaUGRCenRTK1RKUDF3ZllCTURaM2YzQ2lZUUI3?=
 =?utf-8?B?eGFYQlRwTGhzYmcxenBheUdBYW1FUGM1K1ZwYmZvbnFmS2Vkbk1Gc2hkaUFh?=
 =?utf-8?B?RGNJUFFLYXE0QlBPM01zNW1qdWdtUERpQzh1MUQ3N3Z6aE5tdFkycDVUdHRO?=
 =?utf-8?B?M3RILzJ1S0xuYmNNZTkzRDF3MWlWQm9rUTRJd1FvSHdWbG9heFB4M0ZjSktw?=
 =?utf-8?B?eVpIdU9IQVpNSThhOTUvWU5BNisxRXArRHJ3eFp5RnV4eDgrNHQrVThIOVhQ?=
 =?utf-8?B?d1pEU1Z2M2pSbm1WcnlmVnp6MWdqN1RrR29PQ2YzSzVDK25vTkUwTFNzaWZo?=
 =?utf-8?B?YldGUUxBaDI4alVGVVZqZmFSODB5Tm14bEI3UWsyN3lHR2RrNVNPMU5pK1N4?=
 =?utf-8?B?MEdXWHFFdkliN0g1eVJIK3A2aEJrZURFTFMrWTVVQ280amRvQ29XdEZ6UVZI?=
 =?utf-8?B?cHdtaWtubmIyZXZlNXhHZHFtZHJ3dGp6WGJtdFFYMExnVWUzMzNMSnlpclIw?=
 =?utf-8?B?K2dVWEVVL1VFK0RhejhtQXNycDZxWVl5NjhUSkZmM0ZMamZEV0JPU2lhMmdt?=
 =?utf-8?B?ZktwSWNSZjFnWE0ydzBKOWd2L0tJNkFNSWNJc2ptbGJvOXg1K081VHZHUDQ2?=
 =?utf-8?B?NkhQU3B6cm8wMFc0cHFKWmFZVDNmUGswNU81Vm5PWG84dG45N045MStVNkdG?=
 =?utf-8?B?OHhOT0c1eEpUMDZNaitOZkNiMDZjQ0hNR2xqL2o5R3gvaUFsZ09ybnhRS3gw?=
 =?utf-8?Q?Vzz1S6kK2b1AC7f6EQEkqGb7hEds8u2+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmc1WXc0b3JkNEtZbHdkOEVWekNuUW01VE9SMkNnT1BqN1E1TmlXQXhyVlNC?=
 =?utf-8?B?SW91THZHeStEQStlUTlXSHV5Q2IxSngxMWZwUFJYeFdyUk02N1lyajF2Y0Ry?=
 =?utf-8?B?UjF6aCtEMlBRMHBZeEpJb1QvREhTVDRNUENBL0NMSXVyYWpqRUJrc3MyamFy?=
 =?utf-8?B?dCtNZy9sb0dtbTZwV3FrVEI4ZklMMVNQNXV3T21scWNINFR3N1E3bkk3S1Jr?=
 =?utf-8?B?RlU0dndmaTBsOVozVkRFa0xUVlpCdVREQlE3OU5GZzlxVGk2bld0QVBtNUZ1?=
 =?utf-8?B?dkJXNk5hd2FmSHhLSjhYOFpCUTZaK1p1NnJlT1RqQ2tvbG5PckREazFHZG9p?=
 =?utf-8?B?S0VMajdvTWN2VWh5UGRyLzB4ZGxXS25ONmNDR2VOcnVQbVFIWlJoTmE4b25k?=
 =?utf-8?B?N0pZOW9tY25LdGFFeWI3ZXAvRzhoYTg2QmMwZDBmcEVBelNlU21Zenk0MEhn?=
 =?utf-8?B?VS9NcjMxOHVXbUZnWlFpRlhLL0pKYy8wUmlpc2pHbG9yajloVVAzandZSldO?=
 =?utf-8?B?bE8wR05pMHVYZXY1OWlwU2lwMkdyUGNsSVllWWJXWkNmdGU1SkhSRnlLN1Vq?=
 =?utf-8?B?VVZSRzIyM20vTFozbm1QNG5Sb1hjeFFaUTkrS0FGUDlWN2N5Z0lLWEd3MlBT?=
 =?utf-8?B?OXUyK1ljWjN6SnozSmpROEcxYndvZWVhZUtGbXUzUG1OdGFCVzBuYSsvWlUw?=
 =?utf-8?B?VGJGVGdhTDFMNlhwOW5sNWZYQW53WmVEMGtPRlVFVEtQdnlVcGpvZjVPcWdv?=
 =?utf-8?B?RWdqS2huRmJ3RFhXcUNQRHFXbXc2RzJhVitYOGlCVmpINStwYWxyTXpmVTNU?=
 =?utf-8?B?RGJhcXRkdEk1NkRpQ3R2eWRvaGlMTmFrSnBtMTg1Y2J5MUxxSWxkaTVpcFZn?=
 =?utf-8?B?VjNxVU55SW5HNlcvbVpraDQ3dDZCUkI0anByOUtXb3JmMEtIdWxzL1RGVXRz?=
 =?utf-8?B?NWl0VHdvaEVibnBxWk0xU3crUXUxZ1Jvazk1Z2ZIeHJ4SXBla0NOUlp6WG9B?=
 =?utf-8?B?RjZpNEk1SnRTbWd6RE9vcE4vWXBDdUZDdk05SEtVbGZ1Wm4xRjBhakFXODdF?=
 =?utf-8?B?SG5yZUlUS1gyYzVXUU11TjBDb0dzaHpvSWxZVGhMUnZSWVNZNEN5eGoycGVt?=
 =?utf-8?B?Q1A5OUlTMDlxN2lTd1gva0lxMGU4WmkzcEVITVF0N2RTcGdXSlJYYW1JRGxP?=
 =?utf-8?B?eEpOYkhuQ2xCQ3VQamZaS2hOQlpUakI2OHJIY3hpTHRmV2JuZ1d0RndlMStY?=
 =?utf-8?B?UDdrOWllTFRKdTVPWUptMlNOS3FQNlNxT2NxRzZlWGozQjRJZVpTbGowRzRO?=
 =?utf-8?B?ampscDFkY2VsSjZoYW1EQVptK3ZXbDRZTURuRlZUdjlscmJsL29yN0NrM1lE?=
 =?utf-8?B?UTI4K3l2YXdzZjhQRmhEc2gxbjNYUHdESUJNcFVuV283eTVsNWdTK1k4ODA2?=
 =?utf-8?B?aW85clluTUFucUJROFFkOFBBT1dKRVIySCtxMjFPOXFqZVJScmdTb1JtR05B?=
 =?utf-8?B?eVlpa3RyaXhDNm1FRk56WUFrL1NURm9WT1oxUW1ZaEhoL2pSSjFtb0RKUEFC?=
 =?utf-8?B?RnIvWlc0dlZ1T29TTURJN0NMOEY2bTJPTWQ1WjFORlEzc2p6Tnh4OGR2VnR2?=
 =?utf-8?B?cVd1ZDU3dkJORjhMOHZvbG0yK3paUER6cHZqMEx3aWxITzQ3Q1pNalhCZkhR?=
 =?utf-8?B?TXNNNDRuRFZNNmYyMDJUV0JWc0tEc00ydjhSckVwMzZGUisvdmFHcmx5VUJs?=
 =?utf-8?B?T0hOdmdEdVYrMWFYU2w4RXltQ1pGWkRvRGFLSnh1aklFNTNnVHduNENWYzRX?=
 =?utf-8?B?WlhZS3hoa3djV0JXNThwWnBXQ3NzY015MUdqZlhHRU1VSkpmMU1EL0IyNXIw?=
 =?utf-8?B?Y0dFMGlMMms5SnhKRUtXUUNZWkhpb08rbmN3dm92bGJMOFNkU0E1Z0dTWmxz?=
 =?utf-8?B?ZXlIUFJJQ3psOCsxTWZ3NEluckduUnJ3OVpseW40MDUxQkNmWjMzRE1iY294?=
 =?utf-8?B?Zy9HV1RGeEZrZ0pTQmVBa2ZuMzVpem90ejU0dEZ0L1RabEYrRkJPRVkyU29S?=
 =?utf-8?B?blhKT25GOGNDUFR6UXBIR2p6SHJuSGMwc1oweVNhSGhMUGFUeEVhb25xNFBU?=
 =?utf-8?Q?mTfIufaOn8v5Z+EOQiSLegh5R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648de8da-79a3-4efd-9fa9-08de38fd4f74
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:36:14.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoF2vBG04iInOnvHZVGfHnk/G5E4u/SuWiMTIABrs/wXOCLe8yfCB444btsxMZoGa+TSxFp0HGNEzhNRo6WTGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a 128M layout for the BMC flash chip we didn't boot from. Including
this allows the user to write to each partition on the alternate spi
chip. This dtsi follows the existing standard of using the same layout
as non alt version and prepending `alt` to each partition's name.

Testing: Include this in msx4 and cat size, offsets and name
```
for devdir in /sys/class/mtd/mtd*; do
>     [[ -d $devdir && -r $devdir/name ]] || continue
>     name=$(<"$devdir/name")
>     [[ $name == alt* ]] || continue
>
>     size=$(<"$devdir/size")
>     offset=0
>     [[ -r $devdir/offset ]] && offset=$(<"$devdir/offset")
>
>     dev=$(basename "$devdir")
>     printf "%s name=%s offset=0x%X size=0x%X\n" "$dev" "$name" \
>        "$offset" "$size"
> done
mtd10 name=alt-rofs offset=0xA00000 size=0x5600000
mtd11 name=alt-rwfs offset=0x6000000 size=0x2000000
mtd7 name=alt-u-boot offset=0x0 size=0xE0000
mtd8 name=alt-u-boot-env offset=0xE0000 size=0x20000
mtd9 name=alt-kernel offset=0x100000 size=0x900000
```

Also ran dtbs_check on an existing dts with this included.

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
Add a layout for an alternate 128M flash layout. This is
useful for the aspeed ast2500[2] and ast2600[1] SoCs,
where it has the ability to boot from one of two spi chips,
nominally the primary and backup SPIs. Adding a layout allows userspace
to flash the alternate spi by partition and switch over to it, allowing
lower downtime for firmware flash, or for updating the primary
flash from the golden backup flash. This is already an established
scheme for the 32M and 64M layouts, where the layout is the same
but each partition has `alt` prepended to its name. This allows
userspace to just prepend alt to the images in the update process
to specify which flash chip to update.

References:

[1] https://www.aspeedtech.com/server_ast2600/
[2] https://www.aspeedtech.com/server_ast2500/
---
 .../dts/aspeed/openbmc-flash-layout-128-alt.dtsi   | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.dtsi b/arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..08ce2eab472c3da4aa3d841adb0eb1c971e6a25a
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	u-boot@0 {
+		reg = <0x0 0xe0000>; // 896KB
+		label = "alt-u-boot";
+	};
+
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x20000>; // 128KB
+		label = "alt-u-boot-env";
+	};
+
+	kernel@100000 {
+		reg = <0x100000 0x900000>; // 9MB
+		label = "alt-kernel";
+	};
+
+	rofs@a00000 {
+		reg = <0xa00000 0x5600000>; // 86MB
+		label = "alt-rofs";
+	};
+
+	rwfs@6000000 {
+		reg = <0x6000000 0x2000000>; // 32MB
+		label = "alt-rwfs";
+	};
+};

---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-alt-128-layout-221a40665f08

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


