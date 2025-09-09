Return-Path: <openbmc+bounces-609-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16BCB5090C
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 01:05:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLzv76nfYz3cZx;
	Wed, 10 Sep 2025 09:05:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757459139;
	cv=pass; b=Xi1XHiCrA41VFXnRXOPMKpDFfDgaERyvYJbkMcus0p+qoe2DMBwYpTD75e/2i/jsbwvOj14QpM+ci4Jiwf15F5bJbgDo8yMGsdB9u/ZLJ41XhcCjytVjpsTfYECHPjEwnnSpXxetxpADrTo5EZMaDAV7cVhKE5yL5r6q3byoqlTDdWVOPf3eg87EWOehXyZhHuBtxOSLKKbK6MiTTI4qhSoZMAqRSXIYwdDGX0LCP7pORiqoYcLsYQxI28li3LQe7QI/H6kCn83QI8naH3pVaFTd8+ZQMNaFxRvRWfMrm/rAjP4fFKW8IWSCinjOCTzMmnzcpzU6W2a9dWkHDSJ7fw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757459139; c=relaxed/relaxed;
	bh=LAbk5u88AWU5i7gF44WXSIwW193lXWWXCvPcfvD9hFY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R2822h+s5SzTGUBY2u61My166kLaKZMXUAAGD5beKcL5YVCsFSXooPCBOL6zukZq/3F8MY3q+T/F0mGx+yHcQIej+Y9LiDCME26SaWWETALpw/aRVaENfZqY5TCXJZm9L9JPe+7wi+y1TpGhDdfRFgg+ANHMZOu+XcHCTw1NHUiJp8jxClG2/n/vyTjvfaqdoUb1gPN3LeGmPntxxB4s/sYA3V0riQmMR7pnU5eLYMI/yZDGub2b8PFgIrZtm3RlI3sHMbHMmp+NqbPDEqVoUwuyQVCTYsSYUw0mSuyg6Kl1o4ve02epBEuUbCxTPvteo3hSCWYW0OGaoC+g2XzmlA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HeeKg7+S; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::609; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HeeKg7+S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::609; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLzv55xSDz2yrT;
	Wed, 10 Sep 2025 09:05:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylHICCE5gUphmQscIx/HybOQudChS9bMYd7oEKI2q1+/Y1ghnNYVyj3DVnEzs7bYt3fFdu0/Mbud64brdaxUppbG3dR2lLgVOOmpi+iGs+6OGEBxa81vXqEpQKu9aw9RIEtl4arm6kLgJWHjkoYKYOzDvJiyP1YtyJYs2xqxx5L220xXIpA0r12vh3wJFs0jqieO+ZD87mJi7HDusq2cHsxdwnxk2gByhT+5/sxgKjcvIp5JjX/wVmYTPM9zfvF5eh1fRhV1ucnNSka/dE4zS945kCf+qqJC2IPvR/REpeiPJYMH5kn/OS3w2FVibTgTZE+XjP8K+SDAF1TEpqkvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAbk5u88AWU5i7gF44WXSIwW193lXWWXCvPcfvD9hFY=;
 b=ShmDOAedvAmWBAj+t4JgZfxXA78FrWo6Mg/SBdFViDFNrKzLV4PoyzD+nqWeJqdTw3VJXT/fu+ATl1EtPTLLBPkjrWZQ3bhOnkbkFZkgvaYiNQRF2dmHa9BEpp6cw8jqvU323LQ1i586bLyHJm0WRsKdFg3meKK6krM09BSCH/o7kVEsaivbzbPpo3wwzAbKaRsuMwIkk+2aNs8sffGJvV1WZ7Ino0yCmRKarRWadwCYaXJesfEDJwcHsLGg1o30wxZkzNVupIwwCBCwdPqHP6HRaqPibd1rAYQ+/fL+IcwBMhco7UHnfjDANfGfFwmk4t3+qm7oLnBc73SIjWQfzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAbk5u88AWU5i7gF44WXSIwW193lXWWXCvPcfvD9hFY=;
 b=HeeKg7+SDxtbc2FkexF6yuD9wVqiU0fq3RG/ObEQpgVtyPuJM6w/+DtBvF9gslKr97+NvBwJdNWvrG4E2fx7orq7+EqA/rBZxlMFIP4gVQM+LumHDPLN5Fnbel1XgCv1DQ9+LHppjcwSIwjKa34rlnQzc+8SrFzPl2JfAPsC2uqyH4Cz1zNIKnY8QZFbnaT/YOssc6eybnWOIuThEzqBvA7KDe6sUqZEj9wNU3sMKEz08kajhfri/oXOntX7CL3Lf9qzrWJ6lidv1dGATAjjXzXgQ0knd7E1p+Kyd6nMFJyiW9JZiMfO5uaM0EG4u+BeqUxY5iIUErGWhLTGk2EDkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by IA0PR12MB8748.namprd12.prod.outlook.com (2603:10b6:208:482::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 23:05:16 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 23:05:16 +0000
Message-ID: <fcd64668-4232-4d7b-98ec-5326d40d19d7@nvidia.com>
Date: Tue, 9 Sep 2025 16:05:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
To: Andrew Jeffery <andrew@codeconstruct.com.au>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, etanous@nvidia.com
References: <20250822203818.4062595-1-donalds@nvidia.com>
 <20250822203818.4062595-3-donalds@nvidia.com>
 <f9cd6015c47d390eef9c689d2cb4fcd301c4d123.camel@codeconstruct.com.au>
Content-Language: en-US
From: Donald Shannon <donalds@nvidia.com>
In-Reply-To: <f9cd6015c47d390eef9c689d2cb4fcd301c4d123.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To PH7PR12MB7282.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB7282:EE_|IA0PR12MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: b482f28a-e8f6-4c77-ef72-08ddeff5571f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1IwbFNrcGErWlEwR3diWmdEUmMvc25GczRjR1MwL2U2RVlVeWhvaStsV2s1?=
 =?utf-8?B?cXN4VE1kRlgwK2U5ZzVDN3hYUVI4dENmQ1B2YUNKaWtEWjJzRVVKRUJsWjZV?=
 =?utf-8?B?REhzZmJzbE5uT0svSTFtV243b3NDanFBTzhsUkJ0MS9QZnJoU2VicHN5dkNS?=
 =?utf-8?B?cFgxTFZsVTJoUHU3R1hvOGNoWlBEL3daSEtXaTIyYkdLL2NySXNXMjdaWTIw?=
 =?utf-8?B?SkZpWGptVURqRk43Vy9XOVN0emxRUy9KN1laUGFuMVJOU3VJSmRCcG4wOVNC?=
 =?utf-8?B?eGFpZnc0NzJteitoSXgrRDBjWGpCU1FwcHYrMklyYjZKdU1IcjR5TDRmbkdV?=
 =?utf-8?B?eE12WUV2bzNIS2JZSmp2MFhka21YUWhjV2lzRDROdktJdWxHMFowVTh6bVVh?=
 =?utf-8?B?ck90Z0lkRThoNEV4b3lTaTA1alkrUkJnMmg3d3A4S3d3QXJyNzF0bERuOFUz?=
 =?utf-8?B?S0VnUXlUd0dCWnJ4UmpwVk5oUjNhMXZCN25NcWQ3elBWeVRhT1NLK05KMjVa?=
 =?utf-8?B?bkJJK2swMlNER3J2eEZVSVZ3UTRtS3pCVlNDKzdVT3J4N1g5M0FDQW0xVFFS?=
 =?utf-8?B?YXRET1JPM2FEa2wrYmQ0R3hVUTU2OHdhSjhnb1BqaVBqU1d3VGo1SWYveTR1?=
 =?utf-8?B?VE0wTmcxd201OWM3cFhWUkNPVzBqTUxpdHZiY252ZUpYcHp4eXpOWXdJNDJp?=
 =?utf-8?B?T2R3dUlYeVRtSHYrdVo3dXVKRU4yK0J5Z05ST1ZMNVltbWYyTEJYVTdkbmIw?=
 =?utf-8?B?cm5UV3VYVGdvME14U05uWmJNQ2MyQWZIMXgxN0tCMnhwRjlvK2ZzdmwvQ0VV?=
 =?utf-8?B?a29QTi9sdHRyTk0wOUhJQ2ZOY2Z6N0YvaDhNT3RYYXlITDBtOTNzektGUWI1?=
 =?utf-8?B?UU1kQ0xwRnZaWGlBdUNUcC9uTW9FaEd6bVBtTlVPSkl5UEtwT244Z2ZqYVJX?=
 =?utf-8?B?cENieVo4RUlSR2tMZHorRjk1Uk1VRlg0SC9TcTl4NE95dzBrNlZoQ28wRWc1?=
 =?utf-8?B?UEFHWDEvdmNHa2ovaUI2alZaVVhIeGs5QWRnek9wUldNTVJxdm1jbndTRDd4?=
 =?utf-8?B?N3IyUXJYMWZ5MG9UcWJweEF5cTU5NkwrWWVWbU5YWko1YWNxbVFESktmK0NV?=
 =?utf-8?B?bzlMN1ZNbmo3c1dQdkZsQjRUZndTd0tMd3dpQkhHOE0wVStVaUEwWC8wWlRz?=
 =?utf-8?B?ZHltZ1hVaUJzZ1lKM0F4ZlVUVTUvV2JhV0gyaVFWUm1vS3BOTXpCakltZDAx?=
 =?utf-8?B?bGU1Z1hISXNLTU42M1FmeHl0TDd6SDB3ZWo2QUhZLy8rWG5JNEltSUIvRnV6?=
 =?utf-8?B?VG9wWllIWHBQUjc3Vkk5Rm8rZ0dUSnFUY3B6MVhycVdDdld6UmlDaDVTemlm?=
 =?utf-8?B?Ylk3QXlOV1ZPS1lwdWlkU1FWZERVRk9QMWhkZ2ZacW95OFJ0NDV4Vy9TbmxP?=
 =?utf-8?B?dHdyRlNYQ1hhd0hjeitUVXY0dTMyc2s0TkRta2cySFpZUWl5dGhQRWRxdWRJ?=
 =?utf-8?B?OW9HMkNaSkc1bVlkc1U3WWsxTXVtQnhQS0tOZ3hjajR2RExCdThFYlRiWmM4?=
 =?utf-8?B?dWJWcFo1YWdxSUZuVERjK2xyb1pqeWlBZ0RzdDBrVFMwdzRqZmxJbFh0aEh3?=
 =?utf-8?B?bSt0WkZGcmEyekhUYitYdUFybWdSK0F1NEdVbVhKeE1WMzFmdTdVUVk4eUIy?=
 =?utf-8?B?ZFdJVFRWYTBkbDNBYWFCODVOaHJOTHRlTEtHRjRIaHpoLzFrUnZWanlWODZl?=
 =?utf-8?B?YTlpRjN6OEpuN2hvMnp0OFJ0dlNnbDJlVzV0YllLbm8rU1JDL2JhMEpHL2VZ?=
 =?utf-8?B?SFJhcUVCZHpJQ001SHMvTmwvc1p5bmhpWVJPbE1BUWpOSHdOcjI2R1ZEYmJp?=
 =?utf-8?B?Q0VRb1hJQitaRFFGM29td1hmbDIrRkdxb2dHU3p4VmJYSnJETzM2VEVTNTRR?=
 =?utf-8?Q?pIUn15Hk680=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkpIUnIxQXJPczZLRWdjaU1VSU1NUXhTUUxFUmY0a3NkblBBUyswZFRLV0Vx?=
 =?utf-8?B?cVZGOGMvZ3hibTlxdXdrZU5VQ09hMk9oMkw4Ylk4cWJaeGNMSmJhRFlFeUw3?=
 =?utf-8?B?NnFncks1M0lCUkdZRnkvNkh3dGJnM2FNT2pBbS90bWJOTXBLbFFEU1NXY29E?=
 =?utf-8?B?a3Uyek5pcGpWRW4ybUtGTkx1eTVmM1VtTU80TlRuTEJaZTYxN2cvYTVpYVRE?=
 =?utf-8?B?dVJORm5qWjVodlJNOUJqa2FhWFpiRUkwTWhwNDhBNTZubVMzY1AvTGg1ZWsy?=
 =?utf-8?B?YklOK2hkUG84OXBKUnZ6cEVqRk5sZFZROWZ3NnZ5U050T0owc293VTVuVmRn?=
 =?utf-8?B?ajRrRExmRlpwWkRHZDRVRGt6R0ZzcjM5UzB3WXBUODhmKzNQSC9FVlgrTmFo?=
 =?utf-8?B?UUdKS3VxVVlWdFlMM0l2d0VsMVRoYk13NHRETDNQWnVmaGp6RjZpQnZXTldn?=
 =?utf-8?B?Z0RUWlFnUE9IZkV4Mk82L3VCODBIa1cvVWdtMjkyS3B5WkJQSHMvMU5xMGN2?=
 =?utf-8?B?eHNwelNpN2J2Vlg4ajk3cVlZS1VKbkRKNEZLTzZEUXhUbXBmbHJZV2NrM3Nt?=
 =?utf-8?B?RFRHK1N1QXZsc1VJYnp3L2NRK3pEdUNBN2pMWDNyYXJkbk50UXJVYzJQVmty?=
 =?utf-8?B?ZmhBUFh0ZE9weTZUWHJOOFpWa1V3WmlCenRpcDhwL1ZtL3l3ZFp5eTNYMHdl?=
 =?utf-8?B?Uk1rTSt6UDI1RENmYS9ndlpUdy9OSkZzNHA0Rm8yRG1qOHJXaXJiZW9abkcw?=
 =?utf-8?B?UXRseTJnSUdMM1JJUDVjNGRsSzN2RnltdS8wVmdiaytIajc1ckNyQnhWWkZq?=
 =?utf-8?B?eFN1YkVBaE4vVzc0OHQ0eFQwUll4eDZubG5HZ0pMQk5lSEJpdkYyejZmYktD?=
 =?utf-8?B?ZHFBNnM3b21aY1NNTkM4SzNtMlM1UFRIdUY1a3hFbVJDMW5BM05IVFd0Q0Rz?=
 =?utf-8?B?cUtSMWZPanFaMjFURWZpZERIUXZEenRpTnVqdnhHVDEvZEtYcXE1NkRmZk5j?=
 =?utf-8?B?WVdhNWM2enJaelFJQXhiK1pwWTdHd3lVQnF1ZWN1UWpzRDRtUnNNL2ROaHFS?=
 =?utf-8?B?OE1NNTR0K3cvdzdPTDZwbnFVeUFHWHpoS0o3Z0ZLSGhZeVYwVDcxYVREQ2JY?=
 =?utf-8?B?NzVHbmZQcHpjR3ByM0hONkVJU2IrSm85cW95Z1F4azZEVVNDMzZxV3dDRzFQ?=
 =?utf-8?B?MnFuV0gwNFlpcjBlK1BybThzVXBFUDkyVW5jYjUwaWQyOXVwbjMyUDVmWDZs?=
 =?utf-8?B?aXlGZ3RVd3F4aG1KdUNmNVdZRUpRTFBTZDJhUHhCdkxCQURiMUdyREJxMVAy?=
 =?utf-8?B?MUYvWXk2cytkL0o5NS95ekRxQytMTUJaMklQU29aVWIwMjNDQkNFTUI1Ympr?=
 =?utf-8?B?T2dwM1l0WmtmZUJmV3VVWWJoNDlTczBVMWgzeVlKTjJwSDIwTFA0VWdFUm9m?=
 =?utf-8?B?a0tpNEpsY0hxOEdYUDRid2I1eGdxZS9oSm9GVnZUZS9YNnBUcWlUUWYzOWFB?=
 =?utf-8?B?OStNRXphR0Uzdks1UXYxYUJaWUYrY0VVVFdYd0dGS3ZQRXd1anZhSlBEa0FZ?=
 =?utf-8?B?ZXVyY0ttNDkwa1UxYmsrcmgvRlVDR0J1RGR0ZUxlU1J0QkMvR1d0UzhJYms2?=
 =?utf-8?B?c1BaYTYrSlhabUwyS0MrTkdCeGl5RnNVMzRuTkZ5c2o4OVhMODNYTjQvMTB3?=
 =?utf-8?B?TnhmTkRzeStJa0pWTDFEcWhQVlNabzY1T1hBZ2hadU5kUldNK2VCdUkzcUNZ?=
 =?utf-8?B?YWorWXhpM1FoNG9ib2tnLzl0NnpWZUNIYUQ3cjN2MlluNXI4c1l4VFM1Z0dx?=
 =?utf-8?B?K2xKcm5kVFFkMnVaK3libGlsYVM0eDBpcFd0cENMbDVEaDlsU0RnY25ndWZt?=
 =?utf-8?B?Mmh3NXhhTnRUN1gxTGZqS1FJbXdOWnZxdlY4QUJkUEpSeWkvbUVXK295dlhK?=
 =?utf-8?B?UURuUmFiOUZqUVZFU1N1VmVLRzNRNVhMNThUMFdULzhlSFhBRnVUTEh6UzU3?=
 =?utf-8?B?MlVUdGszcHFuL2VMbUxKZk5BTjhRdUd0MmEwTnJqbTV2SVE1MUwxc2lYVVZa?=
 =?utf-8?B?ZzZVNUpMbCtOMlA3S1Y2YW9EU3JlMklnRHpjNVVCUXQrOHJpMWlVRmNVdWQw?=
 =?utf-8?Q?E2SeW5L7O8gufK5rOJYVkobGq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b482f28a-e8f6-4c77-ef72-08ddeff5571f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 23:05:16.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liegeal/x1MTvKxDeiFTLB+B57b2PEQjJfSy2XlJeuTdvvsHDSvncws1kqv83CGXh0pi6MX4HSkhHhuVuaqQoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8748
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/3/25 00:07, Andrew Jeffery wrote:

> Hi Donald,
>
> On Fri, 2025-08-22 at 13:38 -0700, Donald Shannon wrote:
>> This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
>> Platform.
>>
>> Reference to Ast2600 SOC [1].
>> Reference to DC-SCM Spec [2].
>>
>> Link: https://www.aspeedtech.com/server_ast2600/ [1]
>> Link: https://www.opencompute.org/w/index.php?title=Server/MHS/DC-SCM-Specs-and-Designs [2]
>>
>> Signed-off-by: Donald Shannon <donalds@nvidia.com>
>> ---
>>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>   .../dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts | 779 ++++++++++++++++++
>>   2 files changed, 780 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>> index 8062c685f7e8..b479824c434b 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -55,6 +55,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>          aspeed-bmc-lenovo-hr855xg2.dtb \
>>          aspeed-bmc-microsoft-olympus.dtb \
>>          aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
>> +       aspeed-bmc-nvidia-vr144nvl.dtb \
>>          aspeed-bmc-opp-lanyang.dtb \
>>          aspeed-bmc-opp-mowgli.dtb \
>>          aspeed-bmc-opp-nicole.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts
>> new file mode 100644
>> index 000000000000..5984984b5109
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts
>> @@ -0,0 +1,779 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +/ {
>> +       model = "AST2600 VR144NVL BMC";
>> +       compatible = "nvidia,vr144nvl-bmc", "aspeed,ast2600";
>> +
>> +       aliases {
>> +               serial2 = &uart3;
>> +               serial4 = &uart5;
>> +               i2c16 = &c0uphy0;
>> +               i2c17 = &c0uphy2;
>> +               i2c24 = &c1uphy0;
>> +               i2c25 = &c1uphy2;
>> +               i2c32 = &i2c_usb_hub;
>> +               i2c33 = &i2c_tpm;
>> +               i2c34 = &i2c_dp;
>> +               i2c35 = &i2c_rtc;
>> +       };
>> +
>> +       buttons {
>> +               compatible = "gpio-keys";
>> +               button-power {
>> +                       label = "power_btn";
>> +                       linux,code = <KEY_POWER>;
>> +                       gpios = <&exp7 9 GPIO_ACTIVE_LOW>;
>> +               };
>> +               button-uid {
>> +                       label = "uid_btn";
>> +                       linux,code = <KEY_FN_1>;
>> +                       gpios = <&exp7 11 GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> +
>> +       chosen {
>> +               stdout-path = &uart5;
>> +       };
>> +
>> +       leds {
>> +               compatible = "gpio-leds";
>> +               hb-led {
>> +                       gpios = <&gpio0 127 GPIO_ACTIVE_LOW>;
>> +                       function = LED_FUNCTION_HEARTBEAT;
>> +                       color = <LED_COLOR_ID_GREEN>;
>> +                       label = "bmc-hbled";
>> +                       linux,default-trigger = "heartbeat";
>> +                       default-state = "on";
>> +                       retain-state-suspended;
>> +                       retain-state-shutdown;
>> +               };
>> +               pwr-led {
>> +                       gpios = <&exp7 8 GPIO_ACTIVE_LOW>;
>> +                       function = LED_FUNCTION_POWER;
>> +                       color = <LED_COLOR_ID_WHITE>;
>> +                       label = "pwr-led";
>> +                       linux,default-trigger = "default-on";
>> +                       default-state = "on";
>> +                       retain-state-suspended;
>> +                       retain-state-shutdown;
>> +               };
>> +               uid-led {
>> +                       gpios = <&exp7 10 GPIO_ACTIVE_LOW>;
>> +                       function = LED_FUNCTION_INDICATOR;
>> +                       color = <LED_COLOR_ID_BLUE>;
>> +                       label = "uid-led";
>> +                       default-state = "off";
>> +                       retain-state-suspended;
>> +                       retain-state-shutdown;
>> +               };
>> +               fault-led {
>> +                       gpios = <&exp7 12 GPIO_ACTIVE_LOW>;
>> +                       function = LED_FUNCTION_PANIC;
>> +                       color = <LED_COLOR_ID_WHITE>;
>> +                       label = "fault-led";
>> +                       default-state = "off";
>> +                       retain-state-suspended;
>> +                       retain-state-shutdown;
>> +                       panic-indicator;
>> +               };
>> +               warn-led {
>> +                       gpios = <&exp7 15 GPIO_ACTIVE_LOW>;
>> +                       function = LED_FUNCTION_PANIC;
>> +                       color = <LED_COLOR_ID_RED>;
>> +                       label = "warn-led";
>> +                       default-state = "off";
>> +                       retain-state-suspended;
>> +                       retain-state-shutdown;
>> +               };
> To be consistent with my request on your other devicetree series, can
> you please order nodes that either have no unit address or reference a
> label alphabetically, in line with the DTS style guide?
>
>> +       };
>> +
>> +       memory@80000000 {
>> +               device_type = "memory";
>> +               reg = <0x80000000 0x80000000>;
>> +       };
>> +
>> +       reg_3v3_stby: regulator-3v3-standby {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "3v3-standby";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               gpio = <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
>> +               enable-active-high;
>> +               regulator-always-on;
>> +       };
>> +
>> +       reserved-memory {
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               ranges;
>> +
>> +               vga_memory: framebuffer@9f000000 {
>> +                       no-map;
>> +                       reg = <0x9f000000 0x01000000>; /* 16M */
>> +               };
>> +
>> +               ramoops@a0000000 {
>> +                       compatible = "ramoops";
>> +                       reg = <0xa0000000 0x100000>; /* 1MB */
>> +                       record-size = <0x10000>; /* 64KB */
>> +                       max-reason = <2>; /* KMSG_DUMP_OOPS */
>> +               };
>> +
>> +               gfx_memory: framebuffer {
>> +                       compatible = "shared-dma-pool";
>> +                       reusable;
>> +                       size = <0x01000000>;
>> +                       alignment = <0x01000000>;
>> +               };
>> +
>> +               video_engine_memory: jpegbuffer {
>> +                       compatible = "shared-dma-pool";
>> +                       reusable;
>> +                       size = <0x02000000>;    /* 32M */
>> +                       alignment = <0x01000000>;
>> +               };
>> +       };
>> +};
>> +
>> +// Enable Primary flash on FMC for bring up activity
>> +&fmc {
>> +       status = "okay";
>> +       flash@0 {
>> +               compatible = "jedec,spi-nor";
>> +               label = "bmc";
>> +               spi-max-frequency = <50000000>;
>> +               status = "okay";
>> +               partitions {
>> +                       compatible = "fixed-partitions";
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +
>> +                       u-boot@0 {
>> +                               // 896KB
>> +                               reg = <0x0 0xe0000>;
>> +                               label = "u-boot";
>> +                       };
>> +
>> +                       kernel@100000 {
>> +                               // 9MB
>> +                               reg = <0x100000 0x900000>;
>> +                               label = "kernel";
>> +                       };
>> +
>> +                       rofs@a00000 {
>> +                               // 55292KB (extends to end of 64MB SPI - 4KB)
>> +                               reg = <0xa00000 0x35FF000>;
>> +                               label = "rofs";
>> +                       };
>> +               };
> This isn't using one of the usual OpenBMC flash layouts? Can you add a
> comment as to why?
>
>> +       };
>> +};
>> +
>> +&spi2 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_spi2_default>;
>> +       status = "okay";
>> +       // Data SPI is 64MB in size
>> +       flash@0 {
>> +               compatible = "jedec,spi-nor";
>> +               label = "config";
>> +               spi-max-frequency = <50000000>;
>> +               status = "okay";
>> +               partitions {
>> +                       compatible = "fixed-partitions";
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +
>> +                       u-boot-env@0 {
>> +                               // 256KB
>> +                               reg = <0x0 0x40000>;
>> +                               label = "u-boot-env";
>> +                       };
>> +
>> +                       rwfs@40000 {
>> +                               // 16MB
>> +                               reg = <0x40000 0x1000000>;
>> +                               label = "rwfs";
>> +                       };
>> +
>> +                       log@1040000 {
>> +                               // 40MB
>> +                               reg = <0x1040000 0x2800000>;
>> +                               label = "log";
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>> +&mdio0 {
>> +       status = "okay";
>> +       ethphy0: ethernet-phy@0 {
>> +               compatible = "ethernet-phy-ieee802.3-c22";
>> +               reg = <0>;
>> +       };
>> +};
>> +
>> +&mac0 {
>> +       pinctrl-names = "default";
>> +       phy-mode = "rgmii-id";
> Is this correct, in the context of the query here?
>
> https://lore.kernel.org/all/6a3d7eb4-c091-437f-98f8-2b8577e539a7@lunn.ch/
>
> If not, please drop the node from the patch until the MAC driver is
> fixed with respect to the RGMII delays.
>
> Andrew

Hi Andrew,

I will change this to alphabetical order.

The extra space in our flash is for root of trust application. I will note this in the next patch.

I see that the ftgmac100 drivers do not use the phy-mode parameter so I will leave it out.

Thanks,
Don


