Return-Path: <openbmc+bounces-933-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB9C7BFA1
	for <lists+openbmc@lfdr.de>; Sat, 22 Nov 2025 01:03:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCsjz3JB2z2yvR;
	Sat, 22 Nov 2025 11:03:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763769799;
	cv=pass; b=JUMDNddEM3QP9bIXnFt1dJQuBzEAnipMNudYEiUX3tcOBD0pvxBuQm69nUI4CECSkeQkS9+6bB9TpmusFb7xaUMhpDxpskOsc35TrkisJwBdDUh+wFyAGaxWm+nFWaV0OQqWXkAVvI+3Y8i3OF5GKDEd8w58fp8IQqbGrunbPP52EUBijeVXQ3FdlUmDJwplPZ2lL43SFveDAd/tASs6Qe/wDHEWQ2Rc3rzZqlSE88q47+FM54IRyS1qoBHlw73+3adChs8bgit4w1wm+8xegJSasDkovEBBYBXTLBVNYswIH44cUdpsNJr7cGKdGiNcWyGLIl5ad3lDH6WV0UEX+w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763769799; c=relaxed/relaxed;
	bh=G6eYABZq3WhCDWREqBG3gzNYS/fZja4V6d0a8G8JSfY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:MIME-Version; b=TEouZSoR93LrW0WSH792OC9o7z7u7duHxQYpXI9Y4p0Q2/QXpLDFe73f7Si7JdVv41GphXSA943jpChOL0xzFdoARZbfm5KBwIm3uEtUyKK/zh/e4W4O1tn+yAfhnZfm5UYLVavprFrUk70D2xy0n4xITOcGuUg5yjACAGXJRIiUokKvCUtXQdp2oKQWG90FTY2jVxIanqEb/nrdvY/+IgtVi9LtI3GSTJkXc4cS/891ga/3grIbsZGPboLXqaDgHJpcuJGnSHg9ALQt9YdBJL8E2dacsg0PGKbxexVoAqmTnjALN7MxjteaCBnN70x6ONid9/l92VTsMuI0OjXdMQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g6j1aIiT; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g6j1aIiT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCsjy36Wfz2yv8
	for <openbmc@lists.ozlabs.org>; Sat, 22 Nov 2025 11:03:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVATH9zdkk6AfSu5k3eHuP/w8LmxOe3lLKwGvFvIEuXV3Q3ATz03sc/8pN9Yg4VoTFhBYo4d4SZOwuv9YIts12wcQKu1Dgzrl+Ob2wEaLDA9Ri6N/5gIcNp9c68q7Mux0PbFSuyfACc2DqXZ7aQAba3Xc3tYcttdPmG15VjZSv6G5vPMPQCyqZKtrB+PtZ5fVDESrw3fxHazAPcsabx+8inevMl4M/314wYiP6ls1/InnQNWTCZXe9l1EKrULBJpdHsbYgoolSUJuHYXgnolFJlPuQh+kci8lCS9D7sE1jIPB2BdKiFRUPBi0DuUD/u7gUQSWo1BbiM/31RAmQPfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6eYABZq3WhCDWREqBG3gzNYS/fZja4V6d0a8G8JSfY=;
 b=gACr7vfZ0W+S1kU0I+MHGarXYKkT8I5zNN9/fTP1jy6V9WRAfWbbUQ8iovLvV0PgOfGRY6cjoE4C8izG1hiE1fRMzPstnFdj7CiSKtzlddwXv5fZx00oi9wl86IfzAKqmh3kwsRGN9Fzgazta8JDkyyzyzmy/nvLDmxJEXoZERqqG9kplQhfZnRePV48xMzrX9jNIHZqrRjCmz9RaKv5WhLs/Id6Rx53HuYrxerAdPEY9s3J/x/wmUXzLa3crjXOBQCE0rcudYGIVKZqqBbJgJsCShZVSUBf+vAtLRAawTesGCpt8lZ2VHzs3Qx4thtesHhYWOLjRUCnbj+BaFKP/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6eYABZq3WhCDWREqBG3gzNYS/fZja4V6d0a8G8JSfY=;
 b=g6j1aIiTtkIAQklyyOQNemIfeJlmicvLwZ6aAE4V4jgrA1LmE6fyAtLWDtqQchWJe3CYRDGD9fwa2eERzQ4DGvjvazz+NQDLhKyul7stJg3CCTa35aUmeLreImfXNComZBOF6lfGCghDzoUoTcwqt9Y0yObWYW7vf+G9a/FoZsc3cMumnzMSNzCNuzSb2roYPcE8qYZiXmoWfFtT1ymxYZuXHyj0Pc97GMy6Ct+MPLYX50rJyc4txWjlLXb/eb23Zm5xivgUO6kGM/5BXtQyHciFrwwddU3+HgCP5hkDmiyBMUcdcPMw0ZotfUzSzLudnzFQPns4b0UxRd4iUFRCZw==
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
 00:02:47 +0000
From: Marc Olberding <molberding@nvidia.com>
Subject: [PATCH u-boot 0/2] aspeed: Add support for msx4
Date: Fri, 21 Nov 2025 16:02:21 -0800
Message-Id: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI79IGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwNz3dziChPd5MQUw1SjVJO0RGNLJaDSgqLUtMwKsDHRSqW6Sfn5JUq
 xtbUAlO36c14AAAA=
X-Change-ID: 20251107-msx4-cad1e2e4fa39
To: joel@jms.id.au, andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763769765; l=1190;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=fyVNt69J1Yur6yTECxvR3YgrLQn2fcKHWZyk7L6FbSE=;
 b=FV/ww+ddq6X6OGxcVy1J2pxsN2NDYncIPUeisiESTfemLCakVb4fYOCzFxFzNURwPsBgB49nS
 GrC7RCeI4dWBAPbm2nRFpyl3Y8D9rbWfEWHKUG93/AEPyuuvHrwpi4b
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW3PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:303:2a::28) To DS5PPFEAC589ED8.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d04bd6ff-1e83-4182-0fbe-08de295a781d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVJ5eHB1MTZPQnJRMG9OZk9sUkdsOFhTR1k1MG5NUWZaLzM2RHl2Uk0wc3J3?=
 =?utf-8?B?dzZhU3FwSER4aE13OEpYMW1xcmdielZUQU9MYmFLS0FjeC9PbHp0bTJZTkhx?=
 =?utf-8?B?Yk1lME1IZ21jWWhyVEkxeFVhYlZSaHJ0TFBCS1hwaW9KTlZRc3R2Uld3Y2t5?=
 =?utf-8?B?aDc2UkpCUjZSUmEvL2I5ZS90MldFcHBMKzZKeWJvUVpvZzRKVm9EWld6eHpF?=
 =?utf-8?B?MjdvZm5vUlk3T1dHalJRZjZoZVQvM0IvaEZjVlJ2REpHRGdIcFpLTDlRQVE1?=
 =?utf-8?B?YlBicjgrQnVZYUVpU0JBRkJUM29YaFU2Y2Q0RUx6R2V6WE10SlZ4YkRlT3NR?=
 =?utf-8?B?Y0l1ZWM5VEpwZXFRTXJwS1JsWE82VEZxa2g5VVp3Ynl1MEg3ZlJCL21sTTZ6?=
 =?utf-8?B?R2hMY1BJN3VxVjhwRm56eEZKVEFSQy9IMFZKMWljWFg5S01HdU5kWEVUaGMw?=
 =?utf-8?B?YTc4YkE3WVV1OGVQSWl2UzVkR3ArRU1QSXN4RXZseUFRbkFQcU9obHk5dlBZ?=
 =?utf-8?B?Y3NHUW1PWFBqeExRMXBaOXprdVdsZ3pSeXpJMW5sUWF6T2VCM3l1YnR6NW81?=
 =?utf-8?B?bEw0WmEvS1NOblY1dGYzYmR2Tk93eEFPTzRselBqZ0g4TDRUYXNQTmI2ZytO?=
 =?utf-8?B?TWhQWDhHd0JiaU5PVVRrMVpmNmJFeU5SdGRxZXlkZ2tQRXo5YmpTbjdZNWdi?=
 =?utf-8?B?SzdWRk1VbTczM2s3bDBpbmdIbndHMnFqMlErMVZnN2x6UlpXM3h1c2RXd1J2?=
 =?utf-8?B?RmE1OXdCVkZRRjc3RlhNNFJkZ0dnWXlCWkFxNnVZQTZmUVlLWXlRVVgrSWNn?=
 =?utf-8?B?NEg3bmRSa1hGcU0zNE1aZWdXckhHb0gzQkdQT1J6QVZsS0prVFJOcmJWN015?=
 =?utf-8?B?TmRDb3BiV0F0T05ScDh0aEF2SUFhSzFKYk0xVXVpRERBUDRzRkZXSms4LzdQ?=
 =?utf-8?B?cFlWU2F1dnpzb0VLYXQ4cUF1eGpDK052U25rWnVyU21CQ2tMRWtXb0Q4QlRL?=
 =?utf-8?B?a2NqOHhOTnBhay9YTHB5NEJkRmcrWTNFSmNDQTVvRjlURi9uNk1Nc0EzMGxr?=
 =?utf-8?B?WitDWXNaTkd2eFp1RWpOblJxMktpdE8yVG9GU0lBM1kxUkZhTmN5ZCt0RjdF?=
 =?utf-8?B?ZEhhVXVYK2NLUy8wdkRKRm4xK2pzeHg1dVRZQnUwclJZRVF0QzFnUlE4bXJU?=
 =?utf-8?B?cE1yL0JmTjIvZ1ZFdW1QcXRUTzZnbHpWSVJkMzNEZEFLNEl6d0hKb3NVZjdk?=
 =?utf-8?B?T1FmNTRTeHM4RC9IOEd1R3htZys2V0dhWTk0M1JlL1pQL25xOGc5M0pVQnBw?=
 =?utf-8?B?QjVHWTRBSUxyMjJ2RW9SdWdlU0JhY05GaHp4RE9HVERmUm1ndmVaam82WWVX?=
 =?utf-8?B?cS90VWZEcWZHNDNMTGVyMnBtV3ozTVJleWRNYW9MdU9sRUpRZ1dUUEN3ZHJC?=
 =?utf-8?B?a05xMndSdEVKcnU4OVFkUHRmaFZRYnpaMi85RXo5VnJTSVdGT0hrK3pZTVZH?=
 =?utf-8?B?RzUxSTRvZFJTcnBmZk9Tb3BqMEQvbDZreFFRREhFWDdwUUNIWWhPcE0xNmI1?=
 =?utf-8?B?RDNXMmdzUmZiODIxWnZCczVzYWk0OXI3RmZ0RmY0aDR1c091YWw5Qk94dGdU?=
 =?utf-8?B?YlFtbE9rcmFiVnErZ1NacDFCOUlwMGk5NW56RjFLZ1lhRDVHN2pJemV4ZzJH?=
 =?utf-8?B?THlPZXVPRjlMMi8rM0FsQU9UYy8zOXlnRHVBbEdTdEU0V3pBZ3dBc2NSZFN6?=
 =?utf-8?B?YlpkKzFJM2x4THZXQkdkODJQbHc1QXptbVBxRXlsNWFCTWxBZnhCdkNQL3FK?=
 =?utf-8?B?UXpucFR5Ykpmc2NmbjAxbTdzM2c2KzZOcXRTbCtHWWpqTldtclZrM1Fsb3Fj?=
 =?utf-8?B?bFd2MlBYK0hzd0d2MmVnMmphZ1Zmek1UZTdBNkFYQnNibHdWRHQrTHUvMy9u?=
 =?utf-8?Q?TeFdmCFNFhtFHzbWjDgFjTRxp4WgvF1z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFEAC589ED8.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y09SQXFxMlNDMlhCVXpsUDdBOGRTOGliQWNpb0cvVHpBYUYwV1hhS3p3d0NC?=
 =?utf-8?B?N3phcGN1NkpOZTBnQTYzZjFUOFBjanpab0I3SndCazMyMWZrK1R0TmIwVXVS?=
 =?utf-8?B?NTliWVJZUEJoVVpIWlQ1L21JTkZTMzBrdjhTbUhGb0laek1DemNFNDl6UHcr?=
 =?utf-8?B?c3JITWpXQ3l2b2tub0R5K05SbEZjVE42bFpLeDZKcFJLaHhDVnFUTWJObnZH?=
 =?utf-8?B?REtQa0ZRemhPaGlhZERtakhKeXkyRmFuTllUM0V5R0pCVmt3cHlqTHZPb1pB?=
 =?utf-8?B?citSV0Nwalp3UGsvSU9CamdYQzFzditGaUJsdURKV0VGT0VNWGpETHFrYUNB?=
 =?utf-8?B?VWg3d2tseHJDNjhISUh1bXVEWjdKTWgyMEJsWHM1bGJpczg5aUljcnNMNWE4?=
 =?utf-8?B?RmhibU0ySmtJRTFkQWttdkNyZU0vSzMxaG5QZEVEbGNKZjMzNUNid2RvVDJl?=
 =?utf-8?B?WUVUM0YwUTlZeXBkSmRTQUpwcnU3N0xpbC9GalFZRW9MYUlaSGRrM2JrUndz?=
 =?utf-8?B?YnZ0amloYUtJSm4vSFVTZ3dwK1dWMlhhSUJBWGlyMXFqQTdYcnpiRXRBNE9X?=
 =?utf-8?B?SjluOUtrNjcyUEhrK0xQQlF0MUxpTXJqc1Q3U1pibU1vM1ZuTExuTm5sbWxv?=
 =?utf-8?B?NnZvaDI4ZkkyTWY0MHV2VnVUQVhWNXUzMkZmY3VJMEpjUlJEdzJvYzJDS1BJ?=
 =?utf-8?B?YmMyQzBvZXliS28yK2V2ajJ6S3EzM1JSYzJodjZ2MjllclVxdzBwRjJ5dUNN?=
 =?utf-8?B?VDErWFNYd1hjRks2TDlmQ05JRzFyRXBGK3p1YUNLMlhaK24xZXZMV1hid240?=
 =?utf-8?B?MmU4eTVtR21Ja0QwL0pRTVU3di8yWHpqRTdnNEF6RUN1ZjJUTHpqQjN6dEl5?=
 =?utf-8?B?akJKNkkxL0YvVWgrTko5MGxEd29laTBWZWd6UXJKT20vby90dGh3MFFzR3ND?=
 =?utf-8?B?TFU5bHdnS2ZoZTc2dE10MXF0a1RlbTJCZ1JEOHRUQVpnSjNaWkUwWURzcHhk?=
 =?utf-8?B?dTI0TmNFNzd6Z0FKVGpucGdiTjZOOW9ldTBYSXdKK0F1Y3EzM3RIT01ydnp2?=
 =?utf-8?B?ZTNNOVBFVEpjS3VDc2s2N1d1TVRhWlk5OEdQajIxLzVBeFoyTVIyREJZbTZH?=
 =?utf-8?B?ZE1UTEtCVXVvM3FLbHhmQWdqSG03THQrY2VoVzJYdmMzUE9XRGVweCtIZHdN?=
 =?utf-8?B?UjZYVlc4ZjdBenBzTGF6N3ppQ2RwNkpLa21vSXFBSG4rUW52UE1CRXFORnYr?=
 =?utf-8?B?ZmIxQVI1RWUxUVFxOHVlRFpjU0QxWTgvUCszQ0Z4c0ZCUDh5dDA3WmJDaGhl?=
 =?utf-8?B?SWN5SXY3N0hnc3VkdjBUTDFLM0xuZEpTRkdTeU1jU3cvWnpOb3pkNEtmenU1?=
 =?utf-8?B?WGk2MG5GSXZBZjB0blRFY3JlZncrRXFsZzRzbWVrVU96VXZuVzk4K3cwb3FO?=
 =?utf-8?B?eFlEQ2tNdEFYWG1iQ2xGVVNqeUdQNUxQVHZwWmdqN0VoeWhRa250Qkl0aGZ1?=
 =?utf-8?B?Y3JnQmFHK2RvVFAyY05WbEZtV1QwOE5YUEl3QzR6V0dxY2gwOTlPbTVlaVhO?=
 =?utf-8?B?S0J1VVEwSEhIT0VGYzJwWGYwK3hPcEVhd3hFWWZHUWlJSm9kUTR5enM5NUJ0?=
 =?utf-8?B?UGFWTkswWmpaWEErSktkWlBucU5Xc0IvNXR4SGVxZFFyS1kvdjhjOGZNTXBU?=
 =?utf-8?B?MWhwWjJDeSswVzcxSUxHSUViKzhXNGZSMjBCK0d0UndPVEdEWkMreDN4eVVG?=
 =?utf-8?B?eWkxQjVFSEl4TTFaNUlJYXhaYnVtc1pDb2QxODhvSEw1M1J4MnFmOGlXZ0xE?=
 =?utf-8?B?TkdDMEVDdjJJRFdJaFdhdk5pWGV0dHR1MkVnV0pacmlncEd0K2hWUDFOcmtH?=
 =?utf-8?B?NFFYekwzRUxXR2NvU0ZacU5LOWVHa3pJY3RHWnNKN1V1bUx4RFBFMDRUR0hC?=
 =?utf-8?B?S2cvNVVQNG9XdHp0cUVleW5qU0VtN3lYRkQxSEVXNFIyVEh3VllXVW1ocUp0?=
 =?utf-8?B?aDZodW1kRW90YTVyQU45WGM5K1MzWG9Cbk9vVURnU2JJSDFtWjN5Y1R0SEoz?=
 =?utf-8?B?dWtrRFFjY3NmUTU5bmZOcmg4WEMzbjdkWWVBeWNDSnB6eFZRTE1QZnJzOXVN?=
 =?utf-8?Q?ITD6nYOXGExx2L2Fg8PN1t4EZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04bd6ff-1e83-4182-0fbe-08de295a781d
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFEAC589ED8.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:02:47.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gf4L2/iN72JHa3z9JpUQ+fcLLkDSAUD0tjHKMKk8Oe7HtIbTqX5fTlgprrX3fd/aLguD/EjAchqBnEM0oFZyMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6820
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a board file and dts for msx4. the board file is required
as the BMC is strapped for ABR boot support, and this functionality
isn't desired as support in linux is lacking. In order to enable
BMC boot reliably, a board file that disables the FMC_WDT2 is
included.

Patch 1 adds support for the board file. To opt into this support
you can set CONFIG_TARGET_AST2600_MSX4 in your config.

Patch 2 adds the devicetree for this board.

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
Marc Olberding (2):
      Add a new board for the gigabyte msx4
      arch: arm: dts: Add dts for the nvidia msx4 board

 arch/arm/dts/Makefile                    |   1 +
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 111 +++++++++++++++++++++++++++++++
 arch/arm/mach-aspeed/ast2600/Kconfig     |   9 +++
 board/aspeed/ast2600_msx4/Kconfig        |  13 ++++
 board/aspeed/ast2600_msx4/Makefile       |   1 +
 board/aspeed/ast2600_msx4/msx4.c         |  77 +++++++++++++++++++++
 6 files changed, 212 insertions(+)
---
base-commit: 8e15f5c0b1e7b11296ae6c88b686e65d509237d0
change-id: 20251107-msx4-cad1e2e4fa39

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


