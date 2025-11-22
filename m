Return-Path: <openbmc+bounces-934-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D896C7BFA4
	for <lists+openbmc@lfdr.de>; Sat, 22 Nov 2025 01:03:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCsk02H1pz2yv8;
	Sat, 22 Nov 2025 11:03:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763769800;
	cv=pass; b=dzj3Y4N0lkxjkSrGBlyI7DFwT3Rl72z4MMxOFRUNlOkXhGgXoMSephE52kBECZcVHkr1c0OAi+u8RLQStwLYEinXQRWXXGV7sTQ3vOVfUH6JYpUfxSz+qNJlqFXT6chNvdfXdj2ce3qOsjuj1U9uk4Tf8jIHu7hpPRPnoyb6KrwRW9rDlR+awhKIRoGnHb2NWCfaAtM9CyivNC9jcc8JjpabKD0uYIi0xVspKSL6x/UW51kVZ98gIHSTvbelKpkdWu0JVoN9b371iK9KhQhIKeLlWxCy7Vo8AHwqclYNWSecBBYciecU2DpxUur23C4ZsAfPGOGuTnul9Ws1j7ITLw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763769800; c=relaxed/relaxed;
	bh=Asa8OP4Th/U9Wq3bbYrorSWzd26VZS+xAJwGoiy+5kU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:MIME-Version; b=YMhkX2ZGe2W1U5ocoUHqcqyITYb4KqZoNAGM24UYRxqfX0KLfFuqevfSGCnIAU0roU6YpU36kr+TKb4DC80R097DrjJnU7TyBw5s2p/evixTfyuVBVr/Z3CIZ2VEG+FmTLEvRBp6fzyw3hXaV3RnXwd7Ls5yw4yaaIxbbzCb7TDS3dScJOVaEG9v/EjwKDWns3rsiKELoGMfdyUTym6vkXIeq/D95XYa/pIuQX69KaNlxrSLJgi7YwTpAWX5PGof4mEqZW8mH+urIcE+rtyHmph1zDQUSNQ/8LQKjppMyjaJJ5BnSIzMDA1I5OzTjU3rs8QnADW4RSJ/O71urkiAlw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q8whK01F; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q8whK01F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCsjz4QMHz2yxk
	for <openbmc@lists.ozlabs.org>; Sat, 22 Nov 2025 11:03:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/9Y0jtwjHo5Ck5MAVQzxRdRnjr/cw7CnlXQr5pf8BM7wIvynSl0pZ2G4jz6WmZvH0t2eu2k8K2lR99NYGC84xXKIH3ZdGEs1XTiStcZmlUgTfz3Gne33+t1PnNaHtBiP4KBM/p37OLlmryBMViMSfrrEQgY5lcqkXDkAyLemAbY/rfo3RwmNxj5k7m5nhyK/qu7zFWQfz4iGRzl2L56ju6LMKhYmQ0aBNjs+w69v4EZXcDaz4K6lOP7qVlKm+XBsORYwf/TVxyX0ucjqfSYcYwbwHfcyWMs7TWeILFS6NnLGcINkgEHnW+0eFWC4JfKJhp+DJxh9MqWI+DevNrkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Asa8OP4Th/U9Wq3bbYrorSWzd26VZS+xAJwGoiy+5kU=;
 b=Bo8TLWjJira1JT99Ox4+D/M95TFZ2HelI0MsnfcowdX35iEa4oX8rgpcBWsmufO0xU57Z1iFjuBqGjLOkPVpdXFs8Ym+IIXDvP8cYn+mwaz0UU9urqTWAPPmAg7K5kkSNm+pD+mXBrqJzC7pBVYMIBWkQelqM9XgHa+8FIeeRBJAhop43/L1+IL5bSGP6P7kOzHtYebBSFYyVSongsETOwsI68fmmuyTZFGI+OjvsDzb10pXDchqt+TZasu8+Yih4dJKCBzTngwh+Q0jco5U49UaGt/t3/fuaXLDP8F4vn4dgzxIuWrc31mpYS/5+AlW+bSgDakOocoPqRrSzgGCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Asa8OP4Th/U9Wq3bbYrorSWzd26VZS+xAJwGoiy+5kU=;
 b=q8whK01FCPp+3duHzYl4Qn6ISF2dWi4L68Dl0KoLhJBQJQzKiQXLJvwaCHN/veafe+12h5Np6tD2O86mpZRNDaM2E2sQxdinN5Ti7ovyzcVQphL5xHgx768Jp40D6qhzm2i90AZm8jY331l6bTbxkvZrCn51ZUD+xy0pgl4fJXDQIokx3FpOf6NNfKEDFqXBwmV0IqnPDVVq90XifCZI7QvKc6PCnsD0Wi2CF9jU64ZoTCqoZuDu9UWGZKYIeoKAEUIT+uNuzJDv2QfCs5ulVSAWkIZnEpbNatxelyustE6vPDXKm1mraHS+Zg5h6mqR934aRVFfXz8H/BjRiDJH/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667) by PH8PR12MB6820.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 00:02:49 +0000
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::50eb:dafb:9932:c621]) by DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::50eb:dafb:9932:c621%5]) with mapi id 15.20.9320.021; Sat, 22 Nov 2025
 00:02:49 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Fri, 21 Nov 2025 16:02:22 -0800
Subject: [PATCH u-boot 1/2] Add a new board for the gigabyte msx4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-msx4-v1-1-fc0118b666c1@nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
In-Reply-To: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
To: joel@jms.id.au, andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763769765; l=4493;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=WHZSkTIr7HpOVjtf6IYbC8YUXgQ7xIy1MYWanfg12D4=;
 b=LRJMjiiDWRhSaLO9pyBwsXKG3S2a2Uo/cw9GShRGGRf82KTXDPpgtR+M1mPB/b15RsWMn/AY/
 aHB2wIPsSCdC10i7IqclogqvhEAhpa8TRTn5FMKtFDFv34bj9qJyZLu
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:303:b7::27) To DS5PPFEAC589ED8.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS5PPFEAC589ED8:EE_|PH8PR12MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: e729f0dd-1e76-40c1-50a6-08de295a7912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjM0R1FDUkdZaEFJNmNObS8zdEIvRi9scDlOWnRWTkcxdnEzUWV0Nk5Ic25M?=
 =?utf-8?B?WUI5Z3VEL0o4L3FVRFR4YS9zMFZjOTFydEF1WDEyWWlhdmNEV04zV1RRNnd2?=
 =?utf-8?B?TUgrSGhnbXNmZG1sU0xNOWNUVDJxQU5pV2VxY2Uzejh4OUw3OXVSb3pmMllQ?=
 =?utf-8?B?UnNoZzIvc29IdDY0WDB0Q29QcjRBWWNyT2pMbTdSbUxmd3IrcW5PZVVqTGtj?=
 =?utf-8?B?NGFVajNtUk1hWTd1VnUwUHRZRnlHT0Iyc1RKMWgzeWt2TklEcWtXeE4zYUwy?=
 =?utf-8?B?VU95Y3BDd1NRd0NQKy9GUXNhdjAwcndncjYrUVliM2hMRWRxS2RSSWFNTHd4?=
 =?utf-8?B?UmZGNC9QRFpnMUVqRTY0alFSNTIreTQrVzJDcm8xck1lU0RFdkR0Mm1SOXlR?=
 =?utf-8?B?ZFFjcE0vZUphc3ZMTXhuZC8rditVanA0b0tlb0JmQzMwdk5YR3NMMWltSmR1?=
 =?utf-8?B?WXVSZ1RxL3JzN09wSFVjNWN6Vjg3T3o0TkJMbk04U2lQSU41QWdJc2FuTVEv?=
 =?utf-8?B?RU0ya2YwK3o2RjdZdVg1NndHZDNhL2ZDVUkxQ3pWOHpCaDNYSHhnS01XZmd2?=
 =?utf-8?B?WnRSaUVuZzhPYjM4N0srMEQvQ3hRWWVuanRLald6bTBsZ0ZxSWU3WUJiSE9m?=
 =?utf-8?B?ajdBbUpTZHdJSjlqYnU1UGtCM2hSZXAzWmpaN0JlcC9idkJnVHdDN09tZ3c1?=
 =?utf-8?B?bktXdmdBYmU0aHIvRlZIbDVzN3RteXdaQWgvSWFHRXcvZUIyYzUyc0JQWWhr?=
 =?utf-8?B?RWYwZ0daVyszUkZwSW1xd2t1TDI2c2ZoZ0MrdFBoblV0NEk4NUFyK0srOVRS?=
 =?utf-8?B?ZjNKZCsrU3pVbGZsdnJQcTVLMnVESWtESzdUbkM2TlBrVG1zaWFZQ1Y3M3I5?=
 =?utf-8?B?OGVQYkVzVFVienZvY2hPa2FZdUtoOHQ2U0lBSDhEaDRDNjh0eTg3bnBzTXNp?=
 =?utf-8?B?WGw0c2p2ZnFrNTRWL0FOZnBPeDFuU1RLZXJtWUk0b3dsNk9MU29OejJvTDJ0?=
 =?utf-8?B?ckN5TmMxNklqZTM0RU1sSFZyQi9rMGpxeXB6NEpBcm9GcWpCelF6YWgreklK?=
 =?utf-8?B?bVczcXRzaVFiUVhSQjJaVmUvUERjYmpzVjEySGlBaGZtSDNsdEVYVDVnQlo2?=
 =?utf-8?B?a1FTSDJ1S1lCMjNtSzlqN1dCQU14aWFjc2cxM1hNMlFsL0M1ajhQT1UySVZi?=
 =?utf-8?B?OCtKZFNjVk5zYzA2ZEdjQ0hCTmROMHdVQUl0RDFHd2xjNFZQcEdhcGRRKzdN?=
 =?utf-8?B?a0NIL1daTmRVR21YekxCL1FLdE52b2xZV2s2bHhwTGoyRVZnL3NYT3htc0FC?=
 =?utf-8?B?RHN0QW82dlZHRHFpUnRaSC92OWpxeFUzQ09lSXZvemJjR0t0S3N3YWVtQ1NT?=
 =?utf-8?B?d005ZThVZjAzR2RWRGRRdWlYMS9CVWVPMUJ4MCtvdEpvdlgrQ0FkQmpiUWFJ?=
 =?utf-8?B?bVFablpoRnBaUG5yTXVxa1ROWnVsUzlFQ0ZabmFYcW9xZGRNRGdDeUFGWWE0?=
 =?utf-8?B?U3d0L250SWl6YlBWbHYvZmt3RmZqMWoybGoxRW1VZXczM0hoTE42bzlmdzEz?=
 =?utf-8?B?bEVrWG1ZUnlpVjVVMEtieTRCR20ySnJJNTQyUHdxSTZzeTZ1VktrWXRPdHVK?=
 =?utf-8?B?djRDcHRLVFNKa0s1cTIrbXg1V1FFQUlIMGk3c05DL2lkUTlKV3VaNUppOW10?=
 =?utf-8?B?VkJOemk0RlBXWE9WbFArOWw1L3pXSk5vcXFGbVNjeFd3dFZjclYrakh2WWZN?=
 =?utf-8?B?RXpCMThkRHVYZ05RVFByV29ocHl3RDNYN3I5cTUzREZkdnBVQmFGTHp3U3Q4?=
 =?utf-8?B?cUFBNlkzbDRhT2pWd05FZElmcW1BYllNOGdsZXVlVG43d0drU1FLQ3lrbnlW?=
 =?utf-8?B?cDI5LzRrTmRZK0ZxZTJOemZITDhUaGpEdVMzUCtzWjhja0ZOU1J0KytzRG9C?=
 =?utf-8?Q?cU0jlKGSAnu6dk4w45Iiluo/TVNqPZxB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFEAC589ED8.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUc2WVd5WE5EcTlweGQxNnVFOHJwS2JhZGZQQUhma2JUclpJd25LdFJNKzho?=
 =?utf-8?B?cWwzQWRFU0Fsak5vZFdFWHY2MTJUdnpDNVlSMzB6eHhPRVJpTks5cXNiVUZu?=
 =?utf-8?B?dXlycWpweG9hejRsRUJhVjZMVWl2R1BvSXROUmVyaFkyQllBVVF4Z1oreCt5?=
 =?utf-8?B?V3hNbWVRYXNvQlh3WWNuSVMvVkE2aUNaUjJpOWtsY3dnMmFYQkNZdTVtVnc5?=
 =?utf-8?B?eS9DbEQzcUpLczhNcFdyTnRGc2dyQzV1ZlQ4Ti9ZQ3pFUjFKV1A2dUZaWlVF?=
 =?utf-8?B?TVBydEljM3I0a0ZtczRTck1XUHBBVnlHYzQvYmswVjY3V1VpZ0FnUm1PNElv?=
 =?utf-8?B?c0VNYi9QSi9aWnY0MGZHc3Y5elBSRDF6WjFkYVM5RmJ0OE5RMWJQSFRweWIv?=
 =?utf-8?B?L1ZPL0lFa2NXSWZHNmc2djB3Y3o1eU9RVWVmOEMrS1hCRmdocDBzV0pvQ0Vm?=
 =?utf-8?B?eVJwc0FPVFRxdkR5Z2l6cGVUODN2MGZiektZTGE0Z05LL2xNbEVUV2Y0dVFI?=
 =?utf-8?B?SDBPZVZicktXNmRtb1hFY1cvR0FuaWgrMDh4V25LeWdvcUtUMDQrQlNpTUlq?=
 =?utf-8?B?S1BFV2x3NlQ0MlJHYmV1TTJMOVRYTHhHUFN3TWdiZlEvd2dpZ0VOcGp3ZWZH?=
 =?utf-8?B?dE53WGNScXNtMUFKSy9KUGd6eGlmTlh1aVRQOE15OThaMWlTc1RoTEI5UmNF?=
 =?utf-8?B?SGE1OGVZYjR3QUg1VjNHL2QrTVNEelR0RXI1OVBZY3N6dEU5NDVtb2dpZDI2?=
 =?utf-8?B?Syt6eGs5ZUNMdSs4ckxNWC91M1JDSFVlYjFmY3VyMDIwN3lMNktYT3pxVXor?=
 =?utf-8?B?SkJGS0ZjaHRBRGt5UklVRnQwTEltSTQ5MDJ3TGUyMVdReW9MeE1XNkxTMnFu?=
 =?utf-8?B?UGUybWwwOTh2NFlpNHpPQ3FHZW1qZHBaczZ6SDdyQngyN0U2cXoxcU1GYVZZ?=
 =?utf-8?B?WDdBS040MzllQWZYOWhTVUdJZ1hibW5JaGhJNUFSSDNzNlRGb1BCVkE5a1Rk?=
 =?utf-8?B?d2Z6QW1EZVhBQkpRdmdDWUdablNhbWFPZnpyR05yUTc0eTdrMHBhMzJpZXk4?=
 =?utf-8?B?emJqV3N3L3cybGpIVDJueUtRTUVzUmdISnp0V2FEUUdKZ0FxN0w4bFNaMVBY?=
 =?utf-8?B?Vk5FRVFkc3VyVmp2cUg2N2tBQkdQQmJKYm14a21GUWgzbk1QRnV0SDU3dWQ0?=
 =?utf-8?B?YUo2bUxSMTlMbW5OS1dONE8yNVdnaHFVZ2ZUd3FvM3k1MjU3d2VGeit2bk9p?=
 =?utf-8?B?a0ZaTjh1dFNqZ3hMaUNiTHk1bkFQemxjc1I3Tkp1UzN5cFVPU3htNE1ISncz?=
 =?utf-8?B?T3lCKytIMlp5TTNaaUVTREZ6RGhGdUVFWnBuMTZKS0hGY0JtanFacElhbUha?=
 =?utf-8?B?cmVhbS85SkZKR1ZISkFBMUNTNkg0Y3M2UWZMcFFVVm5Oa2IycWVtNWJ1cjNB?=
 =?utf-8?B?Zml5Ky9YSm9zVmdiWDhWMXRiSjFYeXJrL1M0VWllQW5GYkw4R0I4SEd0cjdG?=
 =?utf-8?B?L09oaHRReDJnQk9aTFZjclMrRThGWWZ3WG0ySHRDZjBjWHl6Qm1lMWZlUnNj?=
 =?utf-8?B?dXZIbnZteTFoOFpZaUxoeDZRUWs1emZBakJsUHlWMUJjcm02M0Jad2xDQThy?=
 =?utf-8?B?Q0o4dFhhTElvcHdJQm1MMlA2RWhFSVJSQ2Zkc3hEMWpoUGx0VTh3b0o4MzQ3?=
 =?utf-8?B?SndVK0NTeFhCOWl4eGpWSjFSNythY1diYzRBd1hXM29OUjl4ZFloaG1jcU13?=
 =?utf-8?B?eHZ5ZWM5VzkwcnFQZGxDS2kzN0RFOFBmci9MYnZLdTNacGFWS1g3cHl1VUxa?=
 =?utf-8?B?Q3FkYjYzbUJaV3I0N2JJb0lRNVA1ZGo1djJrL25IZTV3S3dPSzVUVjRoelY1?=
 =?utf-8?B?TUQyZnF0R3RkWWVydzRxa1FRVnJXdFArZzhvdjRXckVHb2laSVdtc1lqckVJ?=
 =?utf-8?B?ZjdwbHdmZGhGc0I5ZEtVaTNtdEJiOThpaFRMRmJ1ZzdNWGkzMjV3aUdRMkd4?=
 =?utf-8?B?TWVITHJGV21pb0hLWXA3T1NOQk5MemdXa1R3L08zeGhuV0VKS1FXVGN2M1Vr?=
 =?utf-8?B?UHRvV2JhSVJRTjlPQ0ZyK04yOUpnSjFKTXBqL2ErQW5DaVIycXVHNTVEMmRk?=
 =?utf-8?Q?6Kpz5yMRQwqIg5NHX/kVK18bS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e729f0dd-1e76-40c1-50a6-08de295a7912
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFEAC589ED8.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:02:49.5915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wz/qpeXhysZKFNJpw6A7RALFuP1IOY9YALUA53m2+PVX2ehh9TAqg73iaRbs/pyAWoj9KhRrB8RRQjCPo8Jiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6820
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adds a new board for the gigabyte msx4. The primary
difference is just that we disable the fmc_wdt2 in
early board init

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 arch/arm/mach-aspeed/ast2600/Kconfig |  9 +++++
 board/aspeed/ast2600_msx4/Kconfig    | 13 ++++++
 board/aspeed/ast2600_msx4/Makefile   |  1 +
 board/aspeed/ast2600_msx4/msx4.c     | 77 ++++++++++++++++++++++++++++++++++++
 4 files changed, 100 insertions(+)

diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index decf263627fa6ed83123a25268d278fc0f7add2a..6779b000a6ba23dcc4b59515196ecc67d4f429d5 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -37,6 +37,14 @@ config TARGET_AST2600_IBM
 	help
 	  AST2600-IBM is IBM boards for AST2600 BMC based P0WER10+ servers
 
+config TARGET_AST2600_MSX4
+	bool "AST2600-MSX4"
+	depends on ASPEED_AST2600
+	help
+	  AST2600-MSX4 is an Nvidia board for an AST2600 BMC based Intel server.
+	  It is nominally similar to the EVB, but it turns off support for
+	  FMC_WDT2
+
 config TARGET_AST2600_INTEL
 	bool "AST2600-INTEL"
 	depends on ASPEED_AST2600
@@ -66,6 +74,7 @@ source "board/aspeed/slt_ast2600/Kconfig"
 source "board/aspeed/ast2600_ibm/Kconfig"
 source "board/aspeed/ast2600_intel/Kconfig"
 source "board/aspeed/ast2600_dcscm/Kconfig"
+source "board/aspeed/ast2600_msx4/Kconfig"
 source "board/qualcomm/dc-scm-v1/Kconfig"
 
 endif
diff --git a/board/aspeed/ast2600_msx4/Kconfig b/board/aspeed/ast2600_msx4/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..9096e60aaad31db89998e2d8af8b0adff1f1a62e
--- /dev/null
+++ b/board/aspeed/ast2600_msx4/Kconfig
@@ -0,0 +1,13 @@
+if TARGET_AST2600_MSX4
+
+config SYS_BOARD
+    default "ast2600_msx4"
+
+config SYS_VENDOR
+    default "aspeed"
+
+config SYS_CONFIG_NAME
+    string "board configuration name"
+    default ast2600_msx4
+
+endif
diff --git a/board/aspeed/ast2600_msx4/Makefile b/board/aspeed/ast2600_msx4/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..7a01cbec85dafa25a59bbe13534c7f5f36abdc81
--- /dev/null
+++ b/board/aspeed/ast2600_msx4/Makefile
@@ -0,0 +1 @@
+obj-y += msx4.o
diff --git a/board/aspeed/ast2600_msx4/msx4.c b/board/aspeed/ast2600_msx4/msx4.c
new file mode 100644
index 0000000000000000000000000000000000000000..ce249886ca008e01f9b3b7d81d35eef12ec9eca4
--- /dev/null
+++ b/board/aspeed/ast2600_msx4/msx4.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) Nvidia
+ */
+#include <common.h>
+#include <asm/io.h>
+
+#define ESPI_BASE	0x1e6ee000
+#define SCU_BASE	0x1e6e2000
+
+static void __maybe_unused disable_fmc_wdt(void)
+{
+	u32 reg;
+
+	reg = readl(ASPEED_FMC_WDT2);
+	reg &= ~(0x1);
+	writel(reg, ASPEED_FMC_WDT2);
+}
+
+static void __maybe_unused espi_init(void)
+{
+	u32 reg;
+
+	/* skip eSPI init if LPC mode is selected */
+	reg = readl(SCU_BASE + 0x510);
+	if (reg & BIT(6))
+		return;
+
+	/*
+	 * Aspeed STRONGLY NOT recommend to use eSPI early init.
+	 *
+	 * This eSPI early init sequence merely set OOB_FREE. It
+	 * is NOT able to actually handle OOB requests from PCH.
+	 *
+	 * During the power on stage, PCH keep waiting OOB_FREE
+	 * to continue its booting. In general, OOB_FREE is set
+	 * when BMC firmware is ready. That is, the eSPI kernel
+	 * driver is mounted and ready to serve eSPI. However,
+	 * it means that PCH must wait until BMC kernel ready.
+	 *
+	 * For customers that request PCH booting as soon as
+	 * possible. You may use this early init to set OOB_FREE
+	 * to prevent PCH from blocking by OOB_FREE before BMC
+	 * kernel ready.
+	 *
+	 * If you are not sure what you are doing, DO NOT use it.
+	 */
+	reg = readl(ESPI_BASE + 0x000);
+	reg |= 0xef;
+	writel(reg, ESPI_BASE + 0x000);
+
+	writel(0x0, ESPI_BASE + 0x110);
+	writel(0x0, ESPI_BASE + 0x114);
+
+	reg = readl(ESPI_BASE + 0x00c);
+	reg |= 0x80000000;
+	writel(reg, ESPI_BASE + 0x00c);
+
+	writel(0xffffffff, ESPI_BASE + 0x094);
+	writel(0x1, ESPI_BASE + 0x100);
+	writel(0x1, ESPI_BASE + 0x120);
+
+	reg = readl(ESPI_BASE + 0x080);
+	reg |= 0x50;
+	writel(reg, ESPI_BASE + 0x080);
+
+	reg = readl(ESPI_BASE + 0x000);
+	reg |= 0x10;
+	writel(reg, ESPI_BASE + 0x000);
+}
+
+int board_early_init_f(void)
+{
+	espi_init();
+	disable_fmc_wdt();
+	return 0;
+}

-- 
2.34.1


