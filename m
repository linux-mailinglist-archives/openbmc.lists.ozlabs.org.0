Return-Path: <openbmc+bounces-669-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8652B87291
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:37:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS96BpBz3ccr;
	Fri, 19 Sep 2025 07:34:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231289;
	cv=pass; b=NYOWX2OZLGMfKVuYIp3OZS1YkBWvr+6hItgBjOkLwYaHSMsSQNb8mbFN7zsnG1/MeCVHZ22kXpyhe5SKTzw4sKN/1TedMNkdd8vmz8ifLP9ej7Qgw9pJHIZC6h0VxYTTVEEwzxkyCUrPDStfXz76EYD2pe1Dw9gKCyIq+aB+YMIh7ZTPpHfPTv+4kg2izjk1mLX9wCzeX/7OO1PXrZfAQKlNazYFo/kamy0BdflpcxJkX4CecJEwgdahpF/ApssRyq4nWM+AB45ei4kjyKM8s8GDb03lQWoTkIyRhxBQFdyWPcDquqM+oStjxOSwLBDmHpk5Rh2z/6TsJX7bjbJXvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231289; c=relaxed/relaxed;
	bh=OhNJ1pIPAYqfKeAqh59r1v4YQeZGVgTg7Bls6reeQu4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fs/zhRc0cgA936LpZqdKmyBR6Llgl/uMUwu/rTiOJibrdqBLoz/CkLIEHC/4PZnu7tHdOF1z5Gd3yKba36nqmCFUYLNIj8tWQWGxu2cg9WldVp5b/aBrATQHkzGfhKneO8so94K5JWBZAXI4m+o30jfYo8iIe9EPiVn2rtD5+rtSYqYfPlERZZjX44FnXm11WId4OXOSIcX3i1chdykDP6b1i0vx2dAh5W0EsYwfbcnyBNz51D941XrIoALywhqkb4eWwNRYbw42K3+9gN0Y5GZkpauiExA5yqnjqzRTdLpnyFjsmRJPRmHOUHfSX7Rtc023UjhSiJEaKn3Gs2eCfw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SKgurgBU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SKgurgBU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS856p1z3cdb
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f98E8YYG793ZG21b2RXxz+CKSP2mx4XZX8xSBWylq3ez7Jy2JTKoZaziNAw9zix1YuF8gf4LnnAL1tv6oVtWSU+NWQ4CiIyvFnVpQDB4RRzfindgj2IGLhEnMLZHjwM+kYipRgyUkE1fVjlzh4YuB63BnuDP9Wc4s6tKDxlmsUKDg/6xgqgG4MXpOsUST7niA2w23kaj2ShtaNS/CZrE43JE8l6kuXmHJZfLeyJjNeXhKEfpEyJsrEazljpYfmV0rpAtT2r/jzuTofN/Y0J/VikUgdZsnk+pFphbziq84ZPOwS5IpGq2EwJswIi2ww3dgARK0dVYmYMpAy2Yz/Ckog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhNJ1pIPAYqfKeAqh59r1v4YQeZGVgTg7Bls6reeQu4=;
 b=aaO/IzqQEjUdiAZhgJCc+0blZdJbGpwS6VjpuNgS8fR3xpn1WHlQPMeH4Luf8qv3dr5bPgyQ+D2nm7+wPqNnc/dnkYHhAUnL/2TAYmPO9Rs1gh1+v6+5FB/qeXoOrkQ8TdkGPDQjgau0LMMmkBi+1MoF8YWEvdsQpjcH64fIWgHTPDvS3f/+1pMCa1FIP+J3fg534/7Zie7vRmPQRkUqz2Bca38XKyE6m8pZB2IsDh8HHjHFd6YYoL9Praa8Nbymf9TEtdDS7GUMf/Ux9tlNBccSdajThcB4zurf7EXLT1/9Dv5vQqg2UEJUpf++Oy6WxIVryP3P1iWeL4YZHl633w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhNJ1pIPAYqfKeAqh59r1v4YQeZGVgTg7Bls6reeQu4=;
 b=SKgurgBUlhzPmBdPDkBvu8Kfn3aZN9k6KlfVykMErKQpJd715+pg3di9OPLZtUqBo/0sz76gK4O1E+12OVuWlZ5xpAtJumUMeMT9fN7qZxbF2F0IDMl/LX8ZcALmNeempzkvF//ooPyqQzsbHFkUy0IaJF2Syxgh6TnG0qZ78pvvOrz6YD8Bc11D9KP4LPSzFAGutzGHpMd+SahPkLguLv8KdSze1jvvjkNAwns1k/GPDd5bKMEKvW8G/cuJUnrKqPNbeOSt+EOFSKb3iuUx39n/D1j1k8ltlynTBmNymiRW4fPmBy60X8cLP9/EsQ/3oZjsIZdnwZys+hDAak8n2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:31 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:31 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:58 -0700
Subject: [PATCH linux dev-6.12 12/14] net: mctp: allow NL parsing directly
 into a struct mctp_route
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-12-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=9470;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=dhfgNsjIwdr9SBj8/PfuIOWEu42UM+GYnO1ZliuL7HQ=;
 b=wpX/cDzLrFqVr5VhQCvOdyndD9spTJBAyiDc5j4BRYrUNmO0s98bt8QSqqfdbWzqhx4oM2Obb
 9edgW2m2AYgBut6V291DQ4IGwBpPoVvlV1gpyCI3QOHWSbcHYb9icRT
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW2PR16CA0055.namprd16.prod.outlook.com
 (2603:10b6:907:1::32) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: f1a67c88-7309-4be9-f675-08ddf6fb2760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3lmMVREN2lobUxmd2ZZMXZVK1lHbjAxMGpkMlNFTXZJa1Y2dHNuZFJHZjhm?=
 =?utf-8?B?eDRRVTN3bTRNcTViejVlZmtneXRpdTJmRTlZb3gvcklEaXJNUlFncnZTZzJp?=
 =?utf-8?B?QWszeWRqZVozNW9HcDlROVoybEgveWpWU3ozdE53TzZ0WHZkOC9Sdi9uLzNp?=
 =?utf-8?B?Slc2OGhSdE8yRW1TVXZzT0FaMHZtR1BXbFkxM2xjd1lDVnVXYkhudFhNa01C?=
 =?utf-8?B?NjhHWklPYWltd0s5THVpNUZZOEpBWkphZnplN3NBRVZQRG5XZmFiQm1xUnlC?=
 =?utf-8?B?K0VoenA3Nk1xNitjKzhiVWlkZGFkelpYMFRzd3hOdys1N05jNFYreXFWQW9X?=
 =?utf-8?B?OE15SWM3bVRoYmNHK2lqNWJoakY0QTh6TTV6N3BqZExuRlU5N2ZpZzQ4OFM3?=
 =?utf-8?B?Q281YUxiS2FzWlR6dnZnQ2NXWHB3K1o2Ri95bE1OenVxR2U4d1JQRTlJNVI5?=
 =?utf-8?B?S2xtM2dxclpvbXpPMSszdktYM25GV3VtZG5kYlRYVXFMQTNMb1ZuZUxCeklh?=
 =?utf-8?B?SVVseUV6eEw3SVJ6TVcwOXYrVVBjc1RRS2k2bmZFaUJjaEtHKzZHNUw3ZVFC?=
 =?utf-8?B?OFZIVklteFBYQ1ZnMmJjckhtemFLS3M4eXQzTVFJQWVmSXpwS2RhdHIyZTJG?=
 =?utf-8?B?VUp1R2FTZWpsY1N1NEpGYkh4L09IZEcxU25QU1hibnVrbDNIWnIwMExYUERV?=
 =?utf-8?B?YXQ3WEcrZGhiYlBTVTNZOTNVTU1SNVREeFIvTHgrejBpWVlYZjlSMWlqdDJ0?=
 =?utf-8?B?V3R2TlB6VGtLK08wOVkvZUF6YmpQZ0NqUXViZ1ZVM2JnaDBxTWs2bVpUSmwx?=
 =?utf-8?B?QlRGay9KUVJaelVCdFNTdEViVUR0c1dYZGxnTVlQWTh2c0p3V1d3amY2QSs0?=
 =?utf-8?B?WGx3Q1p3b1NTUENYNVRJa2ppalNjVFV5L0pwWmNpTVplYm5XMURFQ3BjeHlh?=
 =?utf-8?B?Uk5HTCt5VmMwQjBxcm1GVHNPa2FRUzE3OGJETGoxaVh0THYrdnBNRG5nQUNE?=
 =?utf-8?B?bUhPNGFXckVLeWVicUZNeFBDS0RhT2lYRVRtMVFydE1wVVA5VVVJeVpXaUdS?=
 =?utf-8?B?cXhWb3FEY25nS29XUldkZUVxNEZ3V29LOG9IcGowTjFSVGJHOHU3aHFLQmZP?=
 =?utf-8?B?UTc1VHYrbE5TdWpjenAyeEplbStrbHAxMUU3bkIxQmtRWndWdGFaRzR1Tndn?=
 =?utf-8?B?SXdoV1J5bi95TStseTdGaWsxNVY1eHhmcSthNEpJbjBTellJRjNkZzdoMmZo?=
 =?utf-8?B?eU9taExZTTNlT3hoV1ZqYVpFTnZBMXBRZ1FJc0U0b2NyY2RObHExNEdUMWZD?=
 =?utf-8?B?MkZSVjhMb0J0OVZrYTZxUE03RFl2KzNSaSs2ek9BWlhNblJLMTNFR0hVeDdt?=
 =?utf-8?B?NmtNYWdkcHpwTGFUV1ZEdE8xV3oyYWY1aDdFNzNVT29qVU9ZVk5LUGNnU25W?=
 =?utf-8?B?TmMxcHUvem1iMFJmUURrV0xaczdUaHlpMVlrMzhabmRnVjJhWU5VdjhKSVJ2?=
 =?utf-8?B?RWtqbHAwWktHdVY0dFdVRGZ4eFdxbmtMU3h5LzdkQUgyRUc2ZDFvWlB1bjFy?=
 =?utf-8?B?ZkFaRENZajEyRS9qMUFJSDc2SXpGdVc0cmhyZy8yY0ROR3BXaVczQmJ1endL?=
 =?utf-8?B?SVdXeGZwSmFZN1lOdnZ0bHdCWUQ0NG1HZW4xRDBOV0x3YjBlekhHN092MjNo?=
 =?utf-8?B?OG00eFNPZ095Q3U4ZDB5S1BnOVhxUWhHdklBLy9nMm95UVhVMFo4RmF3MkpN?=
 =?utf-8?B?eWw5Q0hWTHRKM1NHWU9taytxOEhpRWhIbHdvMkNYZENDdnFublhZS0VxWnQ5?=
 =?utf-8?B?SEdjYzNvc1VUVjVTaHhnODNPc3pIVzFUNldYSHJ4SnJZc2tOVFdKM0tPeU0x?=
 =?utf-8?B?aGtIaWlybmczZTZTalg2SnJyZkJrZ3gwd0NBbko1MWFiUS9Qa1htVGNmU3B1?=
 =?utf-8?Q?IA0TKJz/ed0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RExhTEZJUmg1c0dac0QveTkvT0IxazZnNVpsUTdqWFZ2ZThpR2swbEVFUzl0?=
 =?utf-8?B?akNnZU9WSU5BOU5icnpjOHpuK29wd0VpZHNHVEpRdmUyZXpMMzNlS0FWazF3?=
 =?utf-8?B?NVZBbXNFczNObXd4b2trdVUvT0UwY2p0LzRuVlhDZkZWV3FFTlliV0lBMklM?=
 =?utf-8?B?dGF1UXFlNDlHZzlHVVY0ZFhGNFpuWTBlc1JaNmo1SE1FRjI4WjdYSi9SamIr?=
 =?utf-8?B?cXJTWm5OaElWQ0RtZlZ1NlV1WnJqUlZiTVQ5WStML3hLakJzQVhDWWN1K1Mw?=
 =?utf-8?B?V3YzZk1DN0w3MTZPTFRuTXovbllleHlBdWlnNXcyYnpTTlRYdnJGZElQUG16?=
 =?utf-8?B?NGs2NEFob2E4SGhWZTExN2p4am1zcERlNkRtZmVtajJKYVBHZUdHZDhmRlRG?=
 =?utf-8?B?WVlCMUdaaXJUaExocVNaRG14Z2wwUWwrVmRFWEhCcXJwd2NQNWZlVmh4QUNx?=
 =?utf-8?B?VmFNNkJ2MHF6Y1hGRDVXUXdLa3JrNFowK2sybFVZSkFVNlRsdTV6YnF4UHNh?=
 =?utf-8?B?a3NTaHhSQzlyWkRHUnp4TXhrVTN0clQwZFlEMjNBZjhqdWE1UjNDajg1MnZC?=
 =?utf-8?B?bnlHUkZMUW9uc2ljalMyODZRS1dkNE0yNWhWQWlFNE96aTdYbEd1SVhEUWs0?=
 =?utf-8?B?YmorL0YvNGRQUjhDTTFLT2FFbHQyRnZsY25jYzJTRVBCbXRUdVZua0J0Mkdj?=
 =?utf-8?B?eE41Ny8wOXJ3c3QrUysrNzRUSmNSRXA0b3FNL1MvOENKRmxJSEUwQ3NtYnEz?=
 =?utf-8?B?TkxCT0VDWnBCbkY3aDI3eDBGdTdhdzZwZy9pV3RDWDV5ZVlueHlGZ29mY3Nt?=
 =?utf-8?B?ckdYZmt1VTJGbm5VeVRmWXdVZ2FGN0R1Wm05ZjhtL2t2N0xQb1JLMGgzVDM0?=
 =?utf-8?B?VlplQ3RQZmxsaytVV2xhQzVtaUhQaGlVdVV3SDg3WlJRdUxrMkdobmRaeTd6?=
 =?utf-8?B?VU8vcWZBMHNzUTEyVS8xcVFPbWpWSXJwV2lpMGhhTUdwcTEvR0FDL1lRTmtP?=
 =?utf-8?B?SUxnQ01iMDY0OWltdVlqdGhyT0tpZGFpQWtpVUNvNTFQRm9ObkNsM0o2eXBp?=
 =?utf-8?B?RjNDNVhMODJzVitVRHVaUmloZzFXbExSRm83eGhOOG9sdi93eEFCaXpYTzJR?=
 =?utf-8?B?eG5MeTNKVEVhU1FlY05Ed0tZcjQxenkxQXpvRm53VVdEMzVNekV6dWNrY2Jr?=
 =?utf-8?B?UVRxVk5IUTBCdFVYUTB2V1RDaURyV1FhMEwwUGRSbjRJaG16ckNZZEdVbm9k?=
 =?utf-8?B?d3AxZ3BOblJ1eWVhV3BjNmw1SSs1d1I1bllNcVJ4RmZQUFBMbFRmRlZKWThX?=
 =?utf-8?B?OHQ3emhsWEM4S292ZnRRSGJIR0xPOExnUURQeEduQXJDVHI4TnZVWmQ4MWJV?=
 =?utf-8?B?QkdjRlNVMlgyekFkUWJQUGFGN1hSQlZMdzFTVnBEOWsxeURNYUFXa2JETVFG?=
 =?utf-8?B?WkI0V2h0RWJYWHN2Z2FrSmVndU9GbisraDhLbWxvcmxKTEIxNGY4RkFnZzRG?=
 =?utf-8?B?TDFWUFZ4bzFvbVFVMUdTOWZGQ3U2MG8yV3RvNUZhakhaSTFBM0liazZubjJT?=
 =?utf-8?B?TWpNSWdWRFEybDFZQVU0cDh3VkRSM1VxTmJUV2xRNU96WENVbmJmUEZSNDY2?=
 =?utf-8?B?cGY3aWxjdVNBbnUycTdJL3grUWJ5dVBqbmtlb0NCR24yRE5XNTdqL3BJOEY2?=
 =?utf-8?B?NUVjWkR2QU43bFBkUTN5OWRwTWFmQXhsNkVBQU1lcTBLeUJNVEtjOTdSSks5?=
 =?utf-8?B?UWFuTlp4MFg1TXVCRGpMbXI2ZStxa1NNNFQzbjN6eDVEZmkzdEJLMEtCNVdq?=
 =?utf-8?B?bCt2WlNHbSs1NlNKOHluM2xTVGl1ek0rMS9TS0JadUthTXBjZ1VZeGpxQWhC?=
 =?utf-8?B?YmgvQUVpZUUwajFxUHBWWHFDbXFuQWxPRVY0aUk1ZDVwYzBDbHd2MDRlL2hL?=
 =?utf-8?B?YnRCc1hwNjB1RHdEcFZPQjljWmF5R2YxQ3E3dXhOWWQ5THdGYnpGZDJjRHQ4?=
 =?utf-8?B?REk4SDVmK0xpamJtZ1d1cXJ3dkozVUF4ajVDVno0M1FmbThkZ0VUTDQ2Z2dj?=
 =?utf-8?B?R1VBNjhtUXlmNFA4WjUvc1pCbzA0T0toZ3JlMUNjbGhRT0hqMlh2eVRXTVlI?=
 =?utf-8?Q?e8il7lf2i49cLc/Odh2bcTDQx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a67c88-7309-4be9-f675-08ddf6fb2760
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:31.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eJB8eypoez2MjTYzcjVoGuQrAl+oBGYcH+1FZgzyfz4ui+uOUIZYDc4gWIsEN1vZcUBmDPfTa1XnQ0Ja0LpLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

The netlink route parsing functions end up setting a bunch of output
variables from the rt attributes. This will get messy when the routes
become more complex.

So, split the rt parsing into two types: a lookup (returning route
target data suitable for a route lookup, like when deleting a route) and
a populate (setting fields of a struct mctp_route).

In doing this, we need to separate the route allocation from
mctp_route_add, so add some comments on the lifetime semantics for the
latter.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-12-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 28ddbb2abe13776d3835f4bda535edd46336870a)
---
 net/mctp/route.c | 202 ++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 140 insertions(+), 62 deletions(-)

diff --git a/net/mctp/route.c b/net/mctp/route.c
index f96265acf16f4ecedad7a3edf2367cfc7f56be7f..5eca3ce0ba3ceac2ea0567d4042a298abcf3c674 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -1091,25 +1091,32 @@ static unsigned int mctp_route_netid(struct mctp_route *rt)
 }
 
 /* route management */
-static int mctp_route_add(struct net *net, struct mctp_dev *mdev,
-			  mctp_eid_t daddr_start, unsigned int daddr_extent,
-			  unsigned int mtu, unsigned char type)
+
+/* mctp_route_add(): Add the provided route, previously allocated via
+ * mctp_route_alloc(). On success, takes ownership of @rt, which includes a
+ * hold on rt->dev for usage in the route table. On failure a caller will want
+ * to mctp_route_release().
+ *
+ * We expect that the caller has set rt->type, rt->min, rt->max, rt->dev and
+ * rt->mtu, and that the route holds a reference to rt->dev (via mctp_dev_hold).
+ * Other fields will be populated.
+ */
+static int mctp_route_add(struct net *net, struct mctp_route *rt)
 {
-	int (*rtfn)(struct mctp_dst *dst, struct sk_buff *skb);
-	struct mctp_route *rt, *ert;
+	struct mctp_route *ert;
 
-	if (!mctp_address_unicast(daddr_start))
+	if (!mctp_address_unicast(rt->min) || !mctp_address_unicast(rt->max))
 		return -EINVAL;
 
-	if (daddr_extent > 0xff || daddr_start + daddr_extent >= 255)
+	if (!rt->dev)
 		return -EINVAL;
 
-	switch (type) {
+	switch (rt->type) {
 	case RTN_LOCAL:
-		rtfn = mctp_dst_input;
+		rt->output = mctp_dst_input;
 		break;
 	case RTN_UNICAST:
-		rtfn = mctp_dst_output;
+		rt->output = mctp_dst_output;
 		break;
 	default:
 		return -EINVAL;
@@ -1117,22 +1124,9 @@ static int mctp_route_add(struct net *net, struct mctp_dev *mdev,
 
 	ASSERT_RTNL();
 
-	rt = mctp_route_alloc();
-	if (!rt)
-		return -ENOMEM;
-
-	rt->min = daddr_start;
-	rt->max = daddr_start + daddr_extent;
-	rt->mtu = mtu;
-	rt->dev = mdev;
-	mctp_dev_hold(rt->dev);
-	rt->type = type;
-	rt->output = rtfn;
-
 	/* Prevent duplicate identical routes. */
 	list_for_each_entry(ert, &net->mctp.routes, list) {
 		if (mctp_rt_compare_exact(rt, ert)) {
-			mctp_route_release(rt);
 			return -EEXIST;
 		}
 	}
@@ -1174,7 +1168,25 @@ static int mctp_route_remove(struct net *net, unsigned int netid,
 
 int mctp_route_add_local(struct mctp_dev *mdev, mctp_eid_t addr)
 {
-	return mctp_route_add(dev_net(mdev->dev), mdev, addr, 0, 0, RTN_LOCAL);
+	struct mctp_route *rt;
+	int rc;
+
+	rt = mctp_route_alloc();
+	if (!rt)
+		return -ENOMEM;
+
+	rt->min = addr;
+	rt->max = addr;
+	rt->dev = mdev;
+	rt->type = RTN_LOCAL;
+
+	mctp_dev_hold(rt->dev);
+
+	rc = mctp_route_add(dev_net(mdev->dev), rt);
+	if (rc)
+		mctp_route_release(rt);
+
+	return rc;
 }
 
 int mctp_route_remove_local(struct mctp_dev *mdev, mctp_eid_t addr)
@@ -1286,13 +1298,16 @@ static const struct nla_policy rta_mctp_policy[RTA_MAX + 1] = {
 	[RTA_OIF]		= { .type = NLA_U32 },
 };
 
-/* Common part for RTM_NEWROUTE and RTM_DELROUTE parsing.
- * tb must hold RTA_MAX+1 elements.
- */
-static int mctp_route_nlparse(struct net *net, struct nlmsghdr *nlh,
-			      struct netlink_ext_ack *extack,
-			      struct nlattr **tb, struct rtmsg **rtm,
-			      struct mctp_dev **mdev, mctp_eid_t *daddr_start)
+static const struct nla_policy rta_metrics_policy[RTAX_MAX + 1] = {
+	[RTAX_MTU]		= { .type = NLA_U32 },
+};
+
+/* base parsing; common to both _lookup and _populate variants */
+static int mctp_route_nlparse_common(struct net *net, struct nlmsghdr *nlh,
+				     struct netlink_ext_ack *extack,
+				     struct nlattr **tb, struct rtmsg **rtm,
+				     struct mctp_dev **mdev,
+				     mctp_eid_t *daddr_start)
 {
 	struct net_device *dev;
 	unsigned int ifindex;
@@ -1323,61 +1338,126 @@ static int mctp_route_nlparse(struct net *net, struct nlmsghdr *nlh,
 		return -EINVAL;
 	}
 
+	if ((*rtm)->rtm_type != RTN_UNICAST) {
+		NL_SET_ERR_MSG(extack, "rtm_type must be RTN_UNICAST");
+		return -EINVAL;
+	}
+
 	dev = __dev_get_by_index(net, ifindex);
 	if (!dev) {
 		NL_SET_ERR_MSG(extack, "bad ifindex");
 		return -ENODEV;
 	}
+
 	*mdev = mctp_dev_get_rtnl(dev);
 	if (!*mdev)
 		return -ENODEV;
 
-	if (dev->flags & IFF_LOOPBACK) {
-		NL_SET_ERR_MSG(extack, "no routes to loopback");
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-static const struct nla_policy rta_metrics_policy[RTAX_MAX + 1] = {
-	[RTAX_MTU]		= { .type = NLA_U32 },
-};
-
-static int mctp_newroute(struct sk_buff *skb, struct nlmsghdr *nlh,
-			 struct netlink_ext_ack *extack)
+/* Route parsing for lookup operations; we only need the "route target"
+ * components (ie., network and dest-EID range).
+ */
+static int mctp_route_nlparse_lookup(struct net *net, struct nlmsghdr *nlh,
+				     struct netlink_ext_ack *extack,
+				     unsigned char *type, unsigned int *netid,
+				     mctp_eid_t *daddr_start,
+				     unsigned int *daddr_extent)
 {
-	struct net *net = sock_net(skb->sk);
 	struct nlattr *tb[RTA_MAX + 1];
+	struct mctp_dev *mdev;
+	struct rtmsg *rtm;
+	int rc;
+
+	rc = mctp_route_nlparse_common(net, nlh, extack, tb, &rtm,
+				       &mdev, daddr_start);
+	if (rc)
+		return rc;
+
+	*netid = mdev->net;
+	*type = rtm->rtm_type;
+	*daddr_extent = rtm->rtm_dst_len;
+
+	return 0;
+}
+
+/* Full route parse for RTM_NEWROUTE: populate @rt. On success, the route will
+ * hold a reference to the dev.
+ */
+static int mctp_route_nlparse_populate(struct net *net, struct nlmsghdr *nlh,
+				       struct netlink_ext_ack *extack,
+				       struct mctp_route *rt)
+{
 	struct nlattr *tbx[RTAX_MAX + 1];
+	struct nlattr *tb[RTA_MAX + 1];
+	unsigned int daddr_extent;
 	mctp_eid_t daddr_start;
-	struct mctp_dev *mdev;
+	struct mctp_dev *dev;
 	struct rtmsg *rtm;
-	unsigned int mtu;
+	u32 mtu = 0;
 	int rc;
 
-	rc = mctp_route_nlparse(net, nlh, extack, tb,
-				&rtm, &mdev, &daddr_start);
-	if (rc < 0)
+	rc = mctp_route_nlparse_common(net, nlh, extack, tb, &rtm,
+				       &dev, &daddr_start);
+	if (rc)
 		return rc;
 
-	if (rtm->rtm_type != RTN_UNICAST) {
-		NL_SET_ERR_MSG(extack, "rtm_type must be RTN_UNICAST");
+	daddr_extent = rtm->rtm_dst_len;
+
+	if (daddr_extent > 0xff || daddr_extent + daddr_start >= 255) {
+		NL_SET_ERR_MSG(extack, "invalid eid range");
 		return -EINVAL;
 	}
 
-	mtu = 0;
 	if (tb[RTA_METRICS]) {
 		rc = nla_parse_nested(tbx, RTAX_MAX, tb[RTA_METRICS],
 				      rta_metrics_policy, NULL);
-		if (rc < 0)
+		if (rc < 0) {
+			NL_SET_ERR_MSG(extack, "incorrect RTA_METRICS format");
 			return rc;
+		}
 		if (tbx[RTAX_MTU])
 			mtu = nla_get_u32(tbx[RTAX_MTU]);
 	}
 
-	rc = mctp_route_add(net, mdev, daddr_start, rtm->rtm_dst_len, mtu,
-			    rtm->rtm_type);
+	rt->type = rtm->rtm_type;
+	rt->min = daddr_start;
+	rt->max = daddr_start + daddr_extent;
+	rt->mtu = mtu;
+	rt->dev = dev;
+	mctp_dev_hold(rt->dev);
+
+	return 0;
+}
+
+static int mctp_newroute(struct sk_buff *skb, struct nlmsghdr *nlh,
+			 struct netlink_ext_ack *extack)
+{
+	struct net *net = sock_net(skb->sk);
+	struct mctp_route *rt;
+	int rc;
+
+	rt = mctp_route_alloc();
+	if (!rt)
+		return -ENOMEM;
+
+	rc = mctp_route_nlparse_populate(net, nlh, extack, rt);
+	if (rc < 0)
+		goto err_free;
+
+	if (rt->dev->dev->flags & IFF_LOOPBACK) {
+		NL_SET_ERR_MSG(extack, "no routes to loopback");
+		rc = -EINVAL;
+		goto err_free;
+	}
+
+	rc = mctp_route_add(net, rt);
+	if (!rc)
+		return 0;
+
+err_free:
+	mctp_route_release(rt);
 	return rc;
 }
 
@@ -1385,23 +1465,21 @@ static int mctp_delroute(struct sk_buff *skb, struct nlmsghdr *nlh,
 			 struct netlink_ext_ack *extack)
 {
 	struct net *net = sock_net(skb->sk);
-	struct nlattr *tb[RTA_MAX + 1];
+	unsigned int netid, daddr_extent;
+	unsigned char type = RTN_UNSPEC;
 	mctp_eid_t daddr_start;
-	struct mctp_dev *mdev;
-	struct rtmsg *rtm;
 	int rc;
 
-	rc = mctp_route_nlparse(net, nlh, extack, tb,
-				&rtm, &mdev, &daddr_start);
+	rc = mctp_route_nlparse_lookup(net, nlh, extack, &type, &netid,
+				       &daddr_start, &daddr_extent);
 	if (rc < 0)
 		return rc;
 
 	/* we only have unicast routes */
-	if (rtm->rtm_type != RTN_UNICAST)
+	if (type != RTN_UNICAST)
 		return -EINVAL;
 
-	rc = mctp_route_remove(net, mdev->net, daddr_start, rtm->rtm_dst_len,
-			       RTN_UNICAST);
+	rc = mctp_route_remove(net, netid, daddr_start, daddr_extent, type);
 	return rc;
 }
 

-- 
2.34.1


