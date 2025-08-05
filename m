Return-Path: <openbmc+bounces-414-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4459EB1B9EA
	for <lists+openbmc@lfdr.de>; Tue,  5 Aug 2025 20:18:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxMB76K7Pz3bm3;
	Wed,  6 Aug 2025 04:18:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754417919;
	cv=pass; b=dTG43N/Uk65MlAamcLlrUcETEv4y/4q3VR69zPaTjk7c0IdQhf+HiWwFn2Qv6jJtI9XgFiGPUujJET1ZWI6iayCSKxXww0O+9xHMen9NLm+XR0KgDZDXocYB0QNLZJDJkb0NTO8Jhm3XTaWYzbImGE0Z/kOo1jaRKnXsThntlVAFDeQtliFnKtg2zTEajl6bxXabxh+sVkt2gXEWva3n2qtjkAe32F//5/s6hWPdPztmp9OgZqZIy3pPzuBlOd9vRQndT2H1baxp+dTEZMTUo6k22EXs7cBy3QEWcEGbsp8bdkw0N1/+EO7f7gKjUiPrROi+0JgkVCRyLqE55E6Iow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754417919; c=relaxed/relaxed;
	bh=rmKGeYWvQHe2rzs2KU0PVpn2KOQLV5F0TFnsjDZxgCE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j/mQCEfZKVleh628QQtL32k1BJJJ3okqMx7CHz2H+hFhLCvg5nKc2fEjGpxBTx5AUnXCq7dbE3ZcWIWNTay0csHZZm5RowBkuRFxYCelqBBbnOeov00uNEHKcjOLok09AIFj4fP2XFolr8J2avUmijqF51P3CrnSydPspnf7iP6kgCm/2O1QulsLA2UaAFIrFabtJ5MW6n9Yue4QgJ/vSk9+ZHLokjFhaq4Z7zbLozR/E2o1nm6m1HpJK0jHNdRcCPg3W/stejl6tamyKbvWkOtqEkEXWEZCiAJvbVnYaxYSmckGZlal7w+T5gJ2UOMnxPfFm2LZkz3oq72j0zxK4w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=F0TKz4qX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::621; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=F0TKz4qX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::621; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxMB61QXxz3bkg;
	Wed,  6 Aug 2025 04:18:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCN/1h8vc2dQG9tXkCGTkEpWHWakrTziD7bsy0DSboBKqDZDHg6km+x4MA2ApU8Wkoksuu1WLZqtppsHuFmddItQCei6b9Bknq+fMAPl8w6zS84BsYxTOLB35SbepSiIYGYiPBpmSe5rLTOROkFBeu3ByXwpabf18nGCL8EZ82GKi1iy7sb4iSuU7vUIHgkxSl52uYx/6baQSH364rIUfCZIfo4xkCF+RQR77IcyFpk6mTCMsoWVY6kp3zxcakMi2ho/T2pDyRrK/iQ7oHHTyt4sa5Ka22MJ8u58KO/2hUMNhrKIdDpmcOxmCnNgwzhEpFzOwI5YKpXyfMIv9WFWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmKGeYWvQHe2rzs2KU0PVpn2KOQLV5F0TFnsjDZxgCE=;
 b=KNHl5VggSipHF6zY0g3Pzr0ZShO3gX4tSkepn5If5GtNa7qus+88lbRrJ6TOIVKoNIZ704ii9EnDvqOW/X+SX9rRGQXivm7C89fXnMWLEvR9RMoOCj0J/aQHaKwP1aNDVY9nJH23LJE4Qda0IvAMZUFv5/TfSsXGGxNLtzBQQhQPU4dfVrYXdr30vw6Aswhc1upLpCCslE3y5bN46NmIoj5y+ytG0W65QbRA5vUuNrx9SbmX8SHIGqAH3C/cGmHQUlbis4/Va83yQNXx/Fs0sl+3DAtsOEhwxLW7AXKax8mF9I94eJUKgXDG7OBnxXYtCMKuXtmZ+VZXBPj4//52rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmKGeYWvQHe2rzs2KU0PVpn2KOQLV5F0TFnsjDZxgCE=;
 b=F0TKz4qXCN0MQ7X3TMGsuaoFt3pK5kB+NWFSwQuZJHIDXEXKrAs7jw7onhXqk6PGZaMZ+yuKAJPzn7oyc4cq02692njdLYsvVCojwmsKDb1CtQKJHSe/4XozXw6gw7fLXDu7VwF0TMg6rcbo4XBzIhu9WXbyRwzxDSp9oVFYNMWM4+0hVtKKeUP4XmiMOVexTuBxjVGMs3d5060x2EgQCfUPlw98E/LWH4Vj9w9dVWdnqKA/aE2IhH+xdW+fjV4Qd+w1N2tbVzJHsB3u0eSdhWqh+SY0MsQbImAD5j8ORSwwulctOuTDHzv4sAgknmMiT9Wua6qyqChib8iW7hdjig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by IA0PR12MB8256.namprd12.prod.outlook.com (2603:10b6:208:407::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 18:18:14 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 18:18:14 +0000
Message-ID: <5e5c8bd2-4c4b-4371-a6b2-d4d4359a4233@nvidia.com>
Date: Tue, 5 Aug 2025 11:18:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Adding device tree and binding for NVIDIA
 GB200-UT3.0b
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20250723222350.200094-1-donalds@nvidia.com>
 <20250724-affable-gorgeous-dragon-130ac6@kuoka>
Content-Language: en-US
From: Donald Shannon <donalds@nvidia.com>
In-Reply-To: <20250724-affable-gorgeous-dragon-130ac6@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:a03:60::26) To PH7PR12MB7282.namprd12.prod.outlook.com
 (2603:10b6:510:209::7)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB7282:EE_|IA0PR12MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfcfc1e-b822-4645-1398-08ddd44c7155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzhTdUZvTEx6cnc4ZThxdWg5MzB3UXRqUE9QTE9kc0VDWDBaTnBQVDlQSjlP?=
 =?utf-8?B?WW9CbHo3bFBDRlc4Yzg5djJlMEFHbWZGU1FTTCt3Vy96K25BRFk3V0MxeFo1?=
 =?utf-8?B?cjAyWURoMzM4Y0FFamFLOEgrekJuaHFVdkJFd3MrUGVXTi9uWU4wNU5yRHVF?=
 =?utf-8?B?R09MZVRlemd6THJxcHR5Vk1CdmdFWHpQRVB3SzdUeW5xcGxPL3ZubENDbVZh?=
 =?utf-8?B?RDEzOVJvUjVzZC9JL2RMbTdUQzhCWHRiVkVuTkkyWnhuSEs1ZGZwVWxpK0dv?=
 =?utf-8?B?S3JubFQrTXV6TXFSUlJXNVlhWDlOS1VxLzNkekI1bHJpbFVGQ3piakx4V3E0?=
 =?utf-8?B?WHpUbXpUc1ZYbGxSa2QzZHpOTzFGK1FrVFZ5NXRlOWR2TjgvWHg1L1orOFZH?=
 =?utf-8?B?dUdBTDNtNTZmNTJORDh4QzNvSlZUMkV4U282YzZ0cWljTGxWS3NBdC91OEZ0?=
 =?utf-8?B?emtmYVJaZFZXQXdEVmU2RTY0enBvdDJMVEVpQ2R6WXdDRUVLTGtBWDlJK0Nu?=
 =?utf-8?B?bzVnZWl5cVN3cFk5aXJZS1h5dnMzMTNGdFdiRmVSY2ZSTzA3VDdYb0tUUGxX?=
 =?utf-8?B?UkU2VXdrRjRJZUsrTHB6MGRGelFuYVlta3RoblpjM0p3ZURidTFRQjNTZjFO?=
 =?utf-8?B?WnhFRGdVZFhQOHpLZTlsMGtMR09sUkxVaVlWNldGYXhQYi9USmdmV3lieUZG?=
 =?utf-8?B?K2ZzQnM2cS95MncvMU8xVUdUOVh0aWp5Q3Q0b3gzVlJlREw3T28wVjV0Qlc0?=
 =?utf-8?B?QUNwbDdHTXMrSXBzb0lFYisrWWtEYUs5RjdWcWJ3R00wL0hwWHdmWE9Cbmh5?=
 =?utf-8?B?ZVNUVUkyQ2pSdGlaRXAzUVBmZVkzL283ZThpMXdVTFlHYU1LcXFFVm1UenNi?=
 =?utf-8?B?SmFod1I4UDlBVmFEQnpmbVZRMElXNTRJTlpwZGtrWTRBYktIR1I0ME4rK1d1?=
 =?utf-8?B?YWpkWUp0SzR6L0VvemR1VmZOVG5ST0Y4YmtaQU02am5TeEN5Vkd5eUIxZGNP?=
 =?utf-8?B?bHBSdittajd0TlFTc3BpeUVKRWpGVlNlTVlMeERjV1h0dzh1N2wxQzM2eHNy?=
 =?utf-8?B?b3Z0UWlYYWZxbmhaNHU3MS9jd3BwN2hqalI0RzJsek8xeDgyaWE0bjRma0M5?=
 =?utf-8?B?bUg1cFlOVHVZVWNmT1BybjBIQmROd3h0TmN5YWFsWVg2cUVZYVlFdm5hYURv?=
 =?utf-8?B?NU0yWCtoWW9LRkp6OE9BTjR2TzNqckY1eVVtR1pRUWYrbkpBdUNSc05VemRC?=
 =?utf-8?B?eUdXR1FkdkM2YncwY1JkUWxCY3hKRWVRaGdYcVNubE1pZWhMQUtxbnpjNnBn?=
 =?utf-8?B?dzdrSS9WREFua3RrT2NWaGh6OWR1UmZzaEJ3SzI3OW9HZnc2RXZVUWxOeHd0?=
 =?utf-8?B?V0NGR3hNRWd2Z2t3Titkd0V1blBpVm1KRkdrMTE4VUVzeTF6UC9WUWtRNXEr?=
 =?utf-8?B?eUZ3eE1RWnZvU0F6S24xOFh6a1o3TjcrM051bVA5QWhTQ3I4cHBqRlpuNHpl?=
 =?utf-8?B?S1lUazNiU1hlSENHSDJKdDRnRWdFUzlJOFVvemJRckVhNitpTGduQkpOL3d1?=
 =?utf-8?B?Q0lXS1ZFL2FHTGY0MFV5Q0JiN1NMTmZMT25ZRk9hZ0xVVHVkbGVWOFZDOEJy?=
 =?utf-8?B?VDcvRHR1Y09PNUVHZVJoWktMWTVheFhVRzRJYzdIcWpUTlQwVm1MdzloVDdh?=
 =?utf-8?B?dm1Rd2syZ1o1RFZMMHlJL1htYnZsUkowUzZoOWFONG52UnlLaFhpejc2bW5O?=
 =?utf-8?B?dy9DNnJ3M1l1Z0xJcjBZVGR3Q2x1YytRdXNqTVJ3NzJNVEUzZTBwUGtaRGUv?=
 =?utf-8?B?V3Zna1kyY3VVWTVmYUxuSk9YTDBLZ3lZVFFVSGpCa3o4WFlBVGtpWURxaUs5?=
 =?utf-8?B?MUQwV1VYMVRCd2hDdGttRmMvM01qOHJrNnZkdWZ4UDV3Rmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1VXano3SzR1amhkdERjR1MxZkJ2am9PVjliUURsNHd2WGZaZDFVUFFrK1Qx?=
 =?utf-8?B?bWhEWEttYnR0UFpTRVhnbk50WUZqajBtVzl5OUhDaHNIck1VODVoUklMN1FB?=
 =?utf-8?B?YzUwanBORGxYTVBGWmlkZlRZS2tpY3VxeXRZcWVUalNnQytDKzdPUnhnakto?=
 =?utf-8?B?Qm16OUtQalIyYUVxclh6eVZYa2JzdlpHUmNFKzRDRGVBL3BpNkdnNC9kcUFa?=
 =?utf-8?B?Q1NFeGlFY3lMdTdjN2QxMFhLQTNzMG5XZlpkRGFzOGVuUng0eHhZNUdGbmhE?=
 =?utf-8?B?dGwzZk1QNnc1UXpQV200SEc5OFB4NWpuQ1V5a2k1VzlubmpscXVOWWFaUXFs?=
 =?utf-8?B?TGk0ZmtJSzcwWHRKRHNyMEZwT2Q3dVJDZVhwNXhScTJrN1FiSXRGYi94bTgr?=
 =?utf-8?B?QjNLMS9EWS9BWHQrZElOcUNBZkhzQ2I0aW9UYWczZU4xeW0zY0tCSUlFMUpQ?=
 =?utf-8?B?S2hjV3JFMjFVeUdyWDRmOUphdjJzZHJNOFZNM1FkSWdSV05VKzI2SFhtaCtD?=
 =?utf-8?B?MndnZ3lmeWkwNXJvbjdYOEVmemhlTUpFQkh3RElpNXYyTkF6RVBFVlRGdXB5?=
 =?utf-8?B?L2RIckJhQ0ZHU2lrLzZORVBQR1ZWeGtMVXR6NEtXRzYyR2UwMktGdWdaR3Zw?=
 =?utf-8?B?UzNUQ2FZS0dGSEZicVEzUnZqS3hYQ2xyaVpKVzVTT2U5clFGMUluQmdGUWtL?=
 =?utf-8?B?VUFVSGM4aER3dlpwMW9nV2lqcjczMWhmeGdWK2tIYU5qcGsySThSbVRMTHJD?=
 =?utf-8?B?Q01vMWg2azZ2RHNIUHJ5NkRtV0F6RlRRN2pMT0g1NDc0WkR1WFkzdnJBVVBv?=
 =?utf-8?B?Sm5LVDR0NjlGcGJsVE15eWsyeGxCdnpnWG9oYS9GaXQ5Uk1tb2NBUTZ0Wmhs?=
 =?utf-8?B?M1Nvc1FvNzNzaTc3ODg5dHovWFRIbDhnWVlqN3NuYjdMMWhFVVhHczF4d0d3?=
 =?utf-8?B?dHNYODlrU25obXBJMWhXemVqNy9JK0FEZlJJS3dhbUhXMVhmQjJUc0grOUly?=
 =?utf-8?B?TXIxNTFYUjcrTjhMQWlMSHRFSXZIbzZxYXVjMWkzeWl6bWJuN0ludjBUSVZP?=
 =?utf-8?B?U29ldUFhNGVqcU5XUW1CeGJCdmlCY1BmV2pWa1BCR09kK0RjSkdIR0FKMnVt?=
 =?utf-8?B?TkFrYVpubEN3YTBuR2lZZU9YY3ZlY2YvSGR1dndoMDFJNnNSSnpmdnRmeWxU?=
 =?utf-8?B?N3hWRWhiTUVZQkt6YTYzZ3BLcE1NbnpzeUsxZVY0emRzQldJNUtoOEZLcDJo?=
 =?utf-8?B?Yk5ybW5yYXJSQnFLVTlpVnM1ekFvLzJHdUdEdWt1d2lKYUdCejNSNVVzK3Fs?=
 =?utf-8?B?Q2dGVk1ocXlOZW9SQm9ELzVTNjliQ0FseUR0R0l0cEdkZXF4TXpJNjIvdmxk?=
 =?utf-8?B?UjRqL3o0eDQ2YUNKQy82aVNOMWlQWWxxRHk4c0RBK2dTaTVHdlFRMmVDYkVy?=
 =?utf-8?B?a1gwNnAvcUFQV3A5dW9JaW9tVVVZVENGS3N1R1RaVUFsc1JtRU9VcnEzSTRB?=
 =?utf-8?B?aDFDbTAycENyZ29WeE1nK1pid25LeFlBMkNuV080bFIySFdXNFVTSG9VcVFW?=
 =?utf-8?B?NC9xT3RTS3Ira2lUZERoenNaK0RLbDVjNkVLaUx3VzYvektvMXo4a0Q5NGpI?=
 =?utf-8?B?WUNLU2hxSmtyY1RNQ2dma1Jqa3NRVERoaXozRUJWMU4zN29rL0ZqdFhEU3dz?=
 =?utf-8?B?TlVGOFBNd3ZlVmx0dllnVmdFQnI1UjRhZVlvU1BqYld3azg5b1JnR2Y5TzB6?=
 =?utf-8?B?SXRSWmUwWGhPdUVFbFFPbUo0MC8wLzNiWklDenFDR05lT2F6aXNxaXZhamlG?=
 =?utf-8?B?dVFLcU4zVnZiNXgxWnczWWVpSjhBSlhVNlg5QThhc3d5UlhCVDNCdTdTVDBm?=
 =?utf-8?B?TFptTnlFNkF0eWVKdnlpRFNCS014UUgzLzZrcUVBcURPVlpIN0hodytSRVBk?=
 =?utf-8?B?d3N3RnVkendCR2VkUmdINWpPQkxwQU5hTzNPOHM2YnJUWDVXUWhDaXdwNFJv?=
 =?utf-8?B?cnVocURMbU44MS9uTE5QVmRUNTl6NjBpS0VoWmlsMDEwaXhKYWVaLzFVeVJs?=
 =?utf-8?B?Zm44LzBGWWV4emJlS0RiblRNaU9JSFh3eUVPV1owcm9qVFcxbFgybG1uRjRR?=
 =?utf-8?Q?ZeF0okqmeD07n7zQ8G0F2Sl3w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfcfc1e-b822-4645-1398-08ddd44c7155
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:18:14.3693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t97jt63eJ4n0e45Uv95HZgPFzJI2JbpC5Z0AMA1QmUCbtE0wYk1eFJDDYCaduoJ0mY1wkNWBngTJ2dbCKwNqKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8256
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 7/24/25 00:54, Krzysztof Kozlowski wrote:

> External email: Use caution opening links or attachments
>
>
> On Wed, Jul 23, 2025 at 03:23:48PM -0700, Donald Shannon wrote:
>> Patch 1 adds the binding for the NVIDIA GB200-UT3.0b platform.
>> Patch 2 adds the device tree for the NVIDIA GB200-UT3.0b platform.
>>
>> This is an Aspeed AST2600 based unit testing platform for GB200.
>> UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
>> differences, additional gpio expanders, and voltage regulator gating
>> some devices.
>>
>> Reference to Ast2600 SOC [1].
>> Reference to Blackwell GB200NVL Platform [2].
>>
>> Link: https://www.aspeedtech.com/server_ast2600/ [1]
>> Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
>> Signed-off-by: Donald Shannon <donalds@nvidia.com>
>> ---
>> Changes v1 -> v2:
>>    - Changed phy-mode to rgmii-id [Lunn]
>>    - Removed redundant max-speed for mac0 [Lunn]
>>    - Fixed typo from gb200nvl to gb200 in Makefile
>> Changes v2 -> v3:
>>   - Fixed whitespace issues [Krzysztof]
>>   - Fixed schema validation issues from my end ( there are still issues
>>   with the aspeed dtsi file that are not related to this new dts)
>>   [Herring]
>>   - Reordered to follow style guide [Krzysztof]
>>   - Removed redundant status okays
>>   - Changed vcc to vdd for the power gating on the gpio expanders
>> Changes v3 -> v4:
>>    - Added changelog [Krzysztof]
>>    - Added nvidia,gb200-ut30b board binding [Krzysztof]
>>    - Removed unused imports
>>    - Reordered a couple other style guide violations
>>    - Added back in a couple needed "status okay"s
>> Changes v4 -> v5:
>>   - Resumed my patch after a pause
>>   - Don't plan to make this include of nvidia-gb200nvl-bmc due to some
>>   platform differences
>>   - Fixed io expanders that weren't gated by the 3.3V standby regulator
>>   - Fixed incorrect interrupt pin for one IO expander
>>   - Removed some IO expanders and I2C busses
>> Changes v5 -> v6:
>>   - Fixed subject line
>>   - Added missing gpio-key compatible type to buttons
>> Changes v6 -> v7:
>>    - Removed Acked-by Krzysztof
> Why? You did not even give me chance to respond to your reply.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

I will reply here to keep our discussion together.

I think that the issue was me using your kernel.org email and not your linaro.org email.
I will fix this in the next patch series along with some fixes for the warnings from the other thread.

Thanks,
Don


