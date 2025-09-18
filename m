Return-Path: <openbmc+bounces-666-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F4068B87288
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:36:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS65NpQz3cZp;
	Fri, 19 Sep 2025 07:34:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231286;
	cv=pass; b=kxIsveKyHf/E4+3bImuQGS3RigfwsojAUmgR1NLSix+vhCI8T//tpilL9NrXF39JHYmuJ9K4IWgdVKD7UvBXt7Fi9/R6AaqGJSEgPayKzDTH8mr7MYZsI/BNrfm86+k2MxUH++/N1UdjQL4gbqU88JNaLtz2nx0V9P2Uvvzy0exofe1qEnkf/yUv9+CYS8BM3KcwVxAoQPImzXuD5StBE+ovo8uRUUvrigW9+vUAbcEJenjpRsuOMVgwK/pZqTlzJ2IgEEYmh94UwO23tU/kO3Kd3dyQgPSLD+YShWpT2fZ1Dkz34k27PLDt08wdEDkLeUskIWSiW334xDstW63hxw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231286; c=relaxed/relaxed;
	bh=piIrz/WP1mOG7Gc861VPSrZOi8cD1Wmd4IVfDIB8nHA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aK9ku42xAqLVo9GE2zTE2Ku+Z8NIz+jpzdUEcT53MAjonvpUTd8y86sriNlwhyVdjWcj0k78XHJzr/RmOV+75UCpw4FrBq4AGE1cBdjdPVbTJDyhenpMKq3bT6lFqpVlV1Pw9JnirQ57QCRRFTnJ7HcA+Pf+tLCbvjhJKGUltPZdJpD7Stj92ef4fC8ldVy0u733/k6b7K7ZC3lrBI2ZUFlmAt63+yPuxoXHf449YiJeN41DKO07v/ejBz7Pl1xF5VC4pe5hilnbHxkUcH0dgkz8F03mPzKXGqltPBdZr2N0o8xOE2TAr9MdM7xsx4WEQax2PoEzccd6j0gcS7sMVQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ErfjrGIc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ErfjrGIc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS61qVPz3cbL
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl8LY+KViclHQSJsvgAcCvkENodQU7fN/byMN0MT3R7dZOIDsyeaVN8GWfwZptWpALfuI3H1giL7sh3jWSCEmJl78zaTFUpjC5WXtWxjV8KI5uK4yCoB3Hl+hPZeS46nWdRqD4c3BSWnzolsgPlT+XrKopfz4ohZ5hHtDf0a80/e7n76ar63iEq0iHRJB7oUX85CMVd+yizhlwjilK51HUP/JSkMqxOHtDNfMMM6t/B7fErWK9tgilYjsbGRHzThPGzmbC92dl02d12275PVIj0VmavTxvlcrcV2BHZvr3adD/hEuJNxA4hwztFwht5UinHRhPLbsygAyh5ZRGfF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piIrz/WP1mOG7Gc861VPSrZOi8cD1Wmd4IVfDIB8nHA=;
 b=U0nNrV0LZPqij3ALrk3fntHl6J8q5n8n1S4vffVrMpzYXcFxeY4P7SvgHjyOv9u4WOTMRkGA/yK5Yy5GPTbgA4lc7dqvNMnbAI6QN958GTqIv4+h1PFl0k2pWHr7t4RwqpaSKUoHDWxZrCLcMc4Q6U2rRkw3FpXXvvj0AL4N2jNsec5i2E3wkN0U0vhLR8IaBdWpS7nb/PA9xzm1DhlWiSlVbn1YhhWJWzJfbbzY8VFgWo87/f4g8XFuTWZOeQemEVQA9F+1tjgIx3OR1eBJo7zjT919uxHjgCoJjONgQ54cPGKMmuIMpRIw3Du1jcTkbPHD91GWecQVb42fYXwP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piIrz/WP1mOG7Gc861VPSrZOi8cD1Wmd4IVfDIB8nHA=;
 b=ErfjrGIc8E99v7Y9By3yNdy4L1HNQnJ2qpRhI47gsEYwp+591Kuf34MQdRMG/xowX/DgC6yZ4PJN2AWbTwkiwMIrJiUzMlMBAX517yQlH538c3BDI2oXXIw4c+maz/JWDZHcWN6rjcm7uSFmsKNEc8JsPKHJvNnmB2KTWg1fuXSGYDa2dzLN+nEly5ToctdXsjurgcMFZRr9FsYzKKZVmyXA5EcO5g68tRMVZvDvXqW7pSi2fkRQ3ZOrExV8JTAjs59aPDfIYKtL/JBn6pHeVzukpTu6DxvbzTBMalwCug/Ah0fzYbieerkHqbDK1FCR95qmuX8rQ4Ylw2T4X7vYzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:28 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:28 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:56 -0700
Subject: [PATCH linux dev-6.12 10/14] net: mctp: pass net into route
 creation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-10-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=4855;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=fqTa/XvBS8u1RRnmdVdl/WF/BYn7Kb4zEklr/1rs9v8=;
 b=uH1sy0ceiuxZWCHa3YbGWOzX9BxU41wDQyTcdBun4iPTeW6jpzneRKV0ckf/LwLsfggjhy8hc
 68AV7AaEoUICW2WQq0hRTXVVXuVouU9RHDuTapFq0irfriRLImWsG+l
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::31) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ee7a77dd-dd7c-4d3f-3816-08ddf6fb259a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDJud1Z2NkVzQ3JlUHR1bTFBVWVPNFJNbUJTSzY2YklHTkVWKzNKcmpsaC94?=
 =?utf-8?B?TUxMRitXRGE2OXNtMFpMbWRIVzI0aXZIaE1QdHZKVEQ2K2ZBT1J4UXhBZUM1?=
 =?utf-8?B?RjA2T3doaTFvT05TU3ByLzk3VUIxd1R6cExvRlFHaEFNWnJNUDduT0NCRk1q?=
 =?utf-8?B?NlRUOCttSUJPbzArTnZrRXlQTUpJVmF5TDI5ajk4K0REQnRib2ZoS2Y5SC8x?=
 =?utf-8?B?Z2FESnVCRUZzQk01UUd0bEUyUTczbFRyTGpZeEp2Ri90ckJHTHZTQkErZXhl?=
 =?utf-8?B?NG1wbG1oejROUklpa2JrK1RlcXhjRlFSeUNCLzhySVUrNVJjNElZbDhXZlpF?=
 =?utf-8?B?MXhmTTFsS3JRUkxlRmR2YytPc2tFMzd5STBsQUpEZVVtRUJXekU4ZUhmMExp?=
 =?utf-8?B?MHVnU2V0OG82TE9yNFVpT1QyUXRqaVhoL3Mya0VBT0RxZnZXditYa1MwaUxn?=
 =?utf-8?B?NElqZnBBMnNZTnFZTHdPWE9Ec1dUUU15MWN3QkVSV01jWm91bExzVHE1UHZW?=
 =?utf-8?B?WnNLWVNHWlFKQmhYSzJSek9QcHpCWFhTSkRiQ01XMkFBeWFGQVMxeHQwZ0tU?=
 =?utf-8?B?WWs1ZVVmVGpCdlY2UUFnK3FvWlRYVytjcWFtZFd5SFhIN01nTmlkNlhUWFY1?=
 =?utf-8?B?ZXdWcnR0ais5Y09VemM2VGw3TkZKR2hvcUhsU1I4eTJuemNuRkhmZFllYkda?=
 =?utf-8?B?UGFoczlIWHdCb0ZFZDdQR3RpbSt3aU03MnR2YjJ3b0c5MWZmL3RTZmlrN3VX?=
 =?utf-8?B?aVVkREp4aitzQzY4YXhjdmQyNmwwU2JIZGQrZ2VjTVJXMWZhODdUYlRlclJ1?=
 =?utf-8?B?S2x1NGFqcWFEQmFhVEVqcmJJNVpGYmRhSVJ2TlRWZTdlSDd1UkFQRFdldHBZ?=
 =?utf-8?B?KzE3YU1qR2VCQkRFNVVvaUdoN2NXcVIxSnRxWnNycGVzdU9jVkluR0hNTGU1?=
 =?utf-8?B?ZklRcEYxUDhpT205RGUwYTZmQlMzbis4LzU2SThtYWJkK1g5MVk0WldZWXhz?=
 =?utf-8?B?UnIrZmpOdk9rYUFrUDQ5SnQzbHZWeGtSOXNJMDFFbHNsVGJpakp4K0tlbDlX?=
 =?utf-8?B?L2ZMeEVKa05xdDh3WTV1bEFOdlMyNFdaMGhzRHlsck5FREZuQ2twWGhyWTBm?=
 =?utf-8?B?U0J2NkNHWCtZWHFUSDhOcFVZekpwdnNkSzEwVVlmbG5VV0l2UUJUL1hIb3Jr?=
 =?utf-8?B?ZjNHemUzOENLa1JuUnNzaWM4NVh0UnRkcGhPWWk3cGx5UUR0dDQ4UHFUUXRS?=
 =?utf-8?B?bUFhUzBjaEdyZ2FSL0Y3UjBOekp4RE5Gam45dUdHa2oySks0VjMxT1hiY3VG?=
 =?utf-8?B?RmdmRjJwR20zbUZDenNjTldaL1lxWWtaSEphcTFRZld5SlFQakRrR1BlUys2?=
 =?utf-8?B?SE5UNlM3TnZWMGhkRlRxeDU5bU1VcmJ0RkV0bVdLSjluSDFDc0ZKenRKOTNx?=
 =?utf-8?B?T0lUVXliQXk3UUVPZ1dVc2VzbFd6S25TQVUzNXAvMXJPNUgzYzRraHVtUDFw?=
 =?utf-8?B?eS9uUFhqcEY2WUNTLzRaRUNYYjZNRVYxYmM4eUcxcHRwNE01R0tUWUZlSnhG?=
 =?utf-8?B?QVRwY3FpbUxvMjJtYXV5blMyU0luZUFyMFJaN3BScys3RUxEcnNaOXJlMWZK?=
 =?utf-8?B?V3RCVkZ0YmhrWlA3Z0lEcXRQeVRnVXAxMkE2ekNQaGFlRWJCc2dVaWhmMnM4?=
 =?utf-8?B?MWQ4Z3lIbUlGM3B5dlBUUDFKUDhRNk1vdDNSV3ZhYzRodEhtRzRuZDNvVnBw?=
 =?utf-8?B?Z1FsaWVzNzQ3LzllS0h6cXNBV09tZzd1Z202Y0l5V3hBZFVUZm5VZGJLckpY?=
 =?utf-8?B?OWhXTmgrc2RnZkI4YVRyRldUM2RJc1Fqb0F4VXIrODFUTGt0aGcxS2d2cVFG?=
 =?utf-8?B?b0FvUmFFQkVuWCsyZVpDYW8yOTZnbzVJcGVuOXJYTkVQZm02b2dlYkVsbitE?=
 =?utf-8?Q?+FEo9soJG1g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUdHRTgwV1ZrQ1VFUHpPTkZQdzhrZ2tLTHk4bWp3UEhOR3gyYjdTMmJUWmhO?=
 =?utf-8?B?NThmZ0YzQTEwbFU4NTQwR3VyVk9CeEV4TlZySjQ1OERlVFBvMzdJY0FyVHF1?=
 =?utf-8?B?U25xWGk0dzhoQlpMdEpNaEtWS1JVVlBTdGkzZVBjbHNxSEo1WGdRc3Q0R2V6?=
 =?utf-8?B?T1JadU1KUU5CczRvSysrZ1BERUZ3NEJCUkVreXNlOXd5S3ZkN0gvWUVmTnpV?=
 =?utf-8?B?a2V5cm5oS0tzeXpmRW1tay82NnZGQ2dyWXBHbGYxTVBNcVBzeGJMZ1dmdFFX?=
 =?utf-8?B?SEhPYXIrZHg4UXlCUm5CRGRSN2FNTXUvN0d3TWZNdW1ZR2oxL1JSQ1NoVzRW?=
 =?utf-8?B?dnk0dFV6VVg0aXFTRlhFb21iSjBkVXBWOU9pa25mazRXZExaOUMyTXVKOGJZ?=
 =?utf-8?B?VzlmMXIydFU0Y2NXOVNEZS9pbitmRWZGM1FqdDVGT24xT1NhTTduYVVZMHp2?=
 =?utf-8?B?VDVacW9YOUNnbldHQkN2NTFJM05reUxvcDlRSGswZUVSRUZURHNjN3QzakZS?=
 =?utf-8?B?UW80Nmw5ZnhXVytuUHdTT0dtTDVQd2ZHbnJ0OER5VVptMEhGT2cvZDBLcjZU?=
 =?utf-8?B?YkJ3MWdaQ25GZHRJbWFlaUVxNWJoalI1UytmUi9yQ01EK2VIUlhCTVZvNTQx?=
 =?utf-8?B?VmQzd1JTVHhqV3dOMFRIRFRnRlBYTUtmelBjL3Nva2xwTU80eFZvY2pqQmdv?=
 =?utf-8?B?NVYzVXZCTjdJVG5WOEJSeEhJM3lxRlZCaEJlZ1lrdzA5cmFzL2FMVWh5SHBk?=
 =?utf-8?B?ZDR0aWQ1M21zcXRNVjkwMmhGQXJtRENabTBiRWJJcnVkYlUrME1OYzN3cllt?=
 =?utf-8?B?UHRiQW1GblROYkYrL3g5T213Tm5NanNvL3I5NEFXMENSeXdKTTJBQ3pUUlZo?=
 =?utf-8?B?WitqSnlHSUVaTndRNTBiT3AyTnNKUkN4azFDbm9xdHY4SGtQcHYxdDdwR2tw?=
 =?utf-8?B?WCtaVjhEczNDY0lnZ2F3VDdBS2VPNkNuYmo5UmFTaWpwV1VDdXlQbzFWWDJt?=
 =?utf-8?B?UXlEVVdXdVg0Zm9yb0tuOUNwTm5JVDAvdVU1OE9zb29ydk1SNVlPSm9oVGVm?=
 =?utf-8?B?clAyZEhPVk5aYTNTN01zaCtKbzRLa0xJdlNGZzQrbGRLT2drYjJ4eHJVWHVx?=
 =?utf-8?B?RTlLYm96UzdDQzZzL0JtTXBrVzFDZzZGT25qRTBLQ3d0cnRmbDlycWhHZWJS?=
 =?utf-8?B?ME9seDVlaHp1a2NiSDk4RFRNbkdZVkE4elZNRW16emtZNXNRRGE1dm9jVCtC?=
 =?utf-8?B?ZjViUGtGMnd6bzNqR1Y4dnV3Z3gzSDB6YmcrR3JmQWVEY3hzSFNYRkh3dWVh?=
 =?utf-8?B?SDJuckhSVjJTcXBUV3lGdDQ0Z3JpSkpLK1VEL0VycVBQak9MOCtCRXZlNm4x?=
 =?utf-8?B?SmZuR093SUhtMXhYQyt0UmpoRU9ISHhlSXBJZ29CV0hUTXFic2djKzdmc3pZ?=
 =?utf-8?B?WW1zYUVnbDYzQVROS2Y1aHBHZXVncytEVExRaFRDcFpUc1pON3RvU0RvOFV5?=
 =?utf-8?B?YXNEY01zcUxvZld0bTBqOXQxYmVUZ25xTENvNDQ0VVhmeHg0QTF6b3JUeVBV?=
 =?utf-8?B?UVBPVlBlWXFHYUludm5PbWhDa0xuTHB1ajV3RGFzVGFSVmE1QjQrbmFRcEZ1?=
 =?utf-8?B?UzFDMnZnL1hETmpYZVNYK3hlMDlHMWxjRFk5dVhqNnRScEZNQU9rUkNQU3lW?=
 =?utf-8?B?UHgzekN3QVU0WmpVNFpkZmpURGswRkkwcWpJU293c1FIbHFLTHJpdWRKcWsw?=
 =?utf-8?B?UTlGZHBBYzZXNm0za3A2K1N4ZjlqV3F5R2tkQzNOUFdVdzR5K2JiVGV0UG5r?=
 =?utf-8?B?TmxucGxSTWpDcVptTzJNcnBoczlQUFV4dFd0Z2pSRENLdTF3SGhibTlVbzBN?=
 =?utf-8?B?VkdGVDRxN3FQMlZKQ3p1MzN3SnFrL0FYY0ltUy9BNnZjMVU2ckdDb3RVV3JJ?=
 =?utf-8?B?MnJmTmdBSHJTSDhpNDB0S3dobDdiUzM3V21iQzF6RXBQNjhwZXZqcy9VOEVG?=
 =?utf-8?B?eDZLZ0YzWForVzdTNDJTZkxVYzBwTnNwU3lqV3BhMkM0UmZqcTNuTHJsTy81?=
 =?utf-8?B?c28zTmNuMW9wdGlYNS9Da2p0dW00VVNCazNLRWJEV29xUFlHaFdnNkRYZkVL?=
 =?utf-8?Q?T2kS3CfUjGUhfjyTf+kUuqp8+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7a77dd-dd7c-4d3f-3816-08ddf6fb259a
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:28.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTkahnABxBkPB8dSfbCrqeSac7E2Eaa6bKHW5CD7ClSVlZh7EKZipwjhSH12UAJ3SH61siiA6x6/yhxj26G3RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

We may not have a mdev pointer, from which we currently extract the net.

Instead, pass the net directly.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-10-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 48e6aa60bf281e86372d174d96fb1147f02743b3)
---
 net/mctp/route.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/net/mctp/route.c b/net/mctp/route.c
index c49c35c989d89e1c199c8f60ace4d6584ea0d8c8..66395f782759b6a2131342fda099fe5d7cdc4c38 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -1086,12 +1086,11 @@ int mctp_local_output(struct sock *sk, struct mctp_dst *dst,
 }
 
 /* route management */
-static int mctp_route_add(struct mctp_dev *mdev, mctp_eid_t daddr_start,
-			  unsigned int daddr_extent, unsigned int mtu,
-			  unsigned char type)
+static int mctp_route_add(struct net *net, struct mctp_dev *mdev,
+			  mctp_eid_t daddr_start, unsigned int daddr_extent,
+			  unsigned int mtu, unsigned char type)
 {
 	int (*rtfn)(struct mctp_dst *dst, struct sk_buff *skb);
-	struct net *net = dev_net(mdev->dev);
 	struct mctp_route *rt, *ert;
 
 	if (!mctp_address_unicast(daddr_start))
@@ -1138,10 +1137,10 @@ static int mctp_route_add(struct mctp_dev *mdev, mctp_eid_t daddr_start,
 	return 0;
 }
 
-static int mctp_route_remove(struct mctp_dev *mdev, mctp_eid_t daddr_start,
-			     unsigned int daddr_extent, unsigned char type)
+static int mctp_route_remove(struct net *net, struct mctp_dev *mdev,
+			     mctp_eid_t daddr_start, unsigned int daddr_extent,
+			     unsigned char type)
 {
-	struct net *net = dev_net(mdev->dev);
 	struct mctp_route *rt, *tmp;
 	mctp_eid_t daddr_end;
 	bool dropped;
@@ -1170,12 +1169,12 @@ static int mctp_route_remove(struct mctp_dev *mdev, mctp_eid_t daddr_start,
 
 int mctp_route_add_local(struct mctp_dev *mdev, mctp_eid_t addr)
 {
-	return mctp_route_add(mdev, addr, 0, 0, RTN_LOCAL);
+	return mctp_route_add(dev_net(mdev->dev), mdev, addr, 0, 0, RTN_LOCAL);
 }
 
 int mctp_route_remove_local(struct mctp_dev *mdev, mctp_eid_t addr)
 {
-	return mctp_route_remove(mdev, addr, 0, RTN_LOCAL);
+	return mctp_route_remove(dev_net(mdev->dev), mdev, addr, 0, RTN_LOCAL);
 }
 
 /* removes all entries for a given device */
@@ -1284,12 +1283,11 @@ static const struct nla_policy rta_mctp_policy[RTA_MAX + 1] = {
 /* Common part for RTM_NEWROUTE and RTM_DELROUTE parsing.
  * tb must hold RTA_MAX+1 elements.
  */
-static int mctp_route_nlparse(struct sk_buff *skb, struct nlmsghdr *nlh,
+static int mctp_route_nlparse(struct net *net, struct nlmsghdr *nlh,
 			      struct netlink_ext_ack *extack,
 			      struct nlattr **tb, struct rtmsg **rtm,
 			      struct mctp_dev **mdev, mctp_eid_t *daddr_start)
 {
-	struct net *net = sock_net(skb->sk);
 	struct net_device *dev;
 	unsigned int ifindex;
 	int rc;
@@ -1343,6 +1341,7 @@ static const struct nla_policy rta_metrics_policy[RTAX_MAX + 1] = {
 static int mctp_newroute(struct sk_buff *skb, struct nlmsghdr *nlh,
 			 struct netlink_ext_ack *extack)
 {
+	struct net *net = sock_net(skb->sk);
 	struct nlattr *tb[RTA_MAX + 1];
 	struct nlattr *tbx[RTAX_MAX + 1];
 	mctp_eid_t daddr_start;
@@ -1351,7 +1350,7 @@ static int mctp_newroute(struct sk_buff *skb, struct nlmsghdr *nlh,
 	unsigned int mtu;
 	int rc;
 
-	rc = mctp_route_nlparse(skb, nlh, extack, tb,
+	rc = mctp_route_nlparse(net, nlh, extack, tb,
 				&rtm, &mdev, &daddr_start);
 	if (rc < 0)
 		return rc;
@@ -1371,7 +1370,7 @@ static int mctp_newroute(struct sk_buff *skb, struct nlmsghdr *nlh,
 			mtu = nla_get_u32(tbx[RTAX_MTU]);
 	}
 
-	rc = mctp_route_add(mdev, daddr_start, rtm->rtm_dst_len, mtu,
+	rc = mctp_route_add(net, mdev, daddr_start, rtm->rtm_dst_len, mtu,
 			    rtm->rtm_type);
 	return rc;
 }
@@ -1379,13 +1378,14 @@ static int mctp_newroute(struct sk_buff *skb, struct nlmsghdr *nlh,
 static int mctp_delroute(struct sk_buff *skb, struct nlmsghdr *nlh,
 			 struct netlink_ext_ack *extack)
 {
+	struct net *net = sock_net(skb->sk);
 	struct nlattr *tb[RTA_MAX + 1];
 	mctp_eid_t daddr_start;
 	struct mctp_dev *mdev;
 	struct rtmsg *rtm;
 	int rc;
 
-	rc = mctp_route_nlparse(skb, nlh, extack, tb,
+	rc = mctp_route_nlparse(net, nlh, extack, tb,
 				&rtm, &mdev, &daddr_start);
 	if (rc < 0)
 		return rc;
@@ -1394,7 +1394,8 @@ static int mctp_delroute(struct sk_buff *skb, struct nlmsghdr *nlh,
 	if (rtm->rtm_type != RTN_UNICAST)
 		return -EINVAL;
 
-	rc = mctp_route_remove(mdev, daddr_start, rtm->rtm_dst_len, RTN_UNICAST);
+	rc = mctp_route_remove(net, mdev, daddr_start, rtm->rtm_dst_len,
+			       RTN_UNICAST);
 	return rc;
 }
 

-- 
2.34.1


