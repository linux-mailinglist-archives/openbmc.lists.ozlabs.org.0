Return-Path: <openbmc+bounces-629-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA9B51D3E
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 18:15:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMQlD1Dj4z3dLG;
	Thu, 11 Sep 2025 02:15:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757520920;
	cv=pass; b=fsH2Jx/ZSo57lA595y5Ad8tz4KIeA4Y8QnKghpOcy+cpayBdCiiYr2jZySAzJptG6qbZ9yLbwU9qzVD2xOSOgEVQCyrcH//qcdb+zpCMOnWBZdsqjpU82Bs23XjAiQpA+l1O6eXkpiJ9JM6k1+EcBVTiX3V8QJb2f4bVT/6reXCbfZJtZZWRJdOWRw22w1q1hbMA32i2JRrjRqdgCQ01iansL7nKXxz6TKPpWWkZVMwS0zveiyuPEL0y2OpSSfybOFo8NmIJZJBAJoqDiEsg96unWOCP5nNQimw5szxoniT5O4AklGnv5lGxzugoAA5KvCECiRmdhMP4KL8/5SNwUg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757520920; c=relaxed/relaxed;
	bh=zTn1xMMipgvI1aWfg/m+KcUoq5Q12ZdkCDT3GlbhSZY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I7ObSi86Cah0mLjM5tElEQcPVOVQVNU1PrgeTvn7BD+LISur6ezGIkBJkKQM2wTG0sgdGWiBFjpDAnllmGgswtIXKd6gG/z/zOwWbvJcgj+lGaHVXCZZIyfQ2nC8xh3z8xodAhS8QeprJyoDcq/qOB1EU99eTqeLxU6t7PzczVfWVcX754FmO/yNgBnoZy6gwZiA5WlUeMCtdspn7d8DA101FMiYormGpIBfAJtuarQCeLE3KSzm/JHMk/fQFQt3bJqc7JUS/ZrQJM7NBem31cI8rvO8dpICIVBdNSXTp3R09y9DyqILKKGx37Pi+DH4ezUcPB2Nlh5B3ylA87yw3w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NMLBvto5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::619; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NMLBvto5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::619; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=donalds@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMQlB69wVz3dBY;
	Thu, 11 Sep 2025 02:15:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlE18jC2rJj/kxPo6I4XDAnjMQUsGIXT+WAYrrcH0J5gF4IcUnTauF4S/HCT8fe+Xk6oQIxhuJizPWUcM3F60aMmpfuJsgANG/DULrtEdjQQYkUwzvCMbDAz4t11c9+boGtnFEgdsZX/uRcX0+TTAvpjfWgP8+zuz+5XV5PgM1USmlCSsAKCLrwXJBaYW4EQs/e+D00Rs3esUaQMm+jSnVGOaHrPQCii9DbpqEz5NgIHSaYHJFA1qml05DOrRM6b11jiwnSVaX6BQDmlg7ata04fnSSAhrWNAvtKQ0H63F+dUkf08ciB0tAxcuo2p4D5hz4XK2wFh9mMVKjWQhhB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTn1xMMipgvI1aWfg/m+KcUoq5Q12ZdkCDT3GlbhSZY=;
 b=TISFAaUVsDhQkyw11QDrX6cvpe4m+GnH3eZkILzysEVFM5z6KBp4EIBMkRSwusgxDGJWSZaOw0EylHKXIiJLi5F1gkswKDa4VHm0N9DfAIfp1ORaNd1d8hF327S9tJ05vVQKbU9lxnOcMmh4lDgzkw+UwMtHOMP3tqG/Qvz7AvNlVfHyqQbLYVw19hkwdWMw/Neupt/secOQ3ULx1uIQfCNtVmykrpSSO8SH1osvSsSWL4XGcufe/Njm+glW9gLqlaAtNdGva2yFWVqpDuobOGWl/rETaVcU9dN9svHKI1y5LtWFbS+m/Hb7nK/g0AnJr8beo9051iPTptxUybdcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTn1xMMipgvI1aWfg/m+KcUoq5Q12ZdkCDT3GlbhSZY=;
 b=NMLBvto5AJz3pfx7v/IslFesO1vq773eEy587G2+olqeyuJMgxYf+k4HX7Kj5vtv0eG5ZOpB414oDVNtsXmVPgr2J/bPNk7rXaf+Hj93cThD7Ln8s9TVN9dN7tAlzTCLo39ieWUhwT28+heevSLEtIDUbA3GQ982gAjrDLzWxo4mcGqEUeNoda8a6Ok2IAJX2yJNNC2XGuujMma8eSteEQLOnNJiAmsQKFZNRIEVwyCINAPpZhb7pkMhVvtQHwIQPnb5EPsJYEYvTR5Ewbhv30toQHSJmy62hnBLKQ2BvnjFbIpSq1nKZ8tw/D5gDwvKS79/cknnNx59ycAXAS592Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:14:57 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 16:14:57 +0000
Message-ID: <29ab5e2d-2b76-477c-a4fa-39de622544bc@nvidia.com>
Date: Wed, 10 Sep 2025 09:14:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
To: Andrew Lunn <andrew@lunn.ch>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, etanous@nvidia.com
References: <20250910040601.240162-1-donalds@nvidia.com>
 <20250910040601.240162-3-donalds@nvidia.com>
 <3114a51c-47a2-4b67-8965-33841ee87fd5@lunn.ch>
Content-Language: en-US
From: Donald Shannon <donalds@nvidia.com>
In-Reply-To: <3114a51c-47a2-4b67-8965-33841ee87fd5@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To PH7PR12MB7282.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB7282:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: ee41f40e-1987-4be8-82ef-08ddf0852f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjI3R3BZUERHNUk4WkxrWnNIWGZ6ZGUzM0RxV3pqb25UUldwSEpUaGJ1OUNI?=
 =?utf-8?B?NW9CdmpBM1hiY1hYN1ZFVW5OUzFrR0tSblFzU1RBdkRQZ2pkdXVyREl2d3lJ?=
 =?utf-8?B?TWs3UUpFRE5JR3dXUFJGL3hoaFlUQWY5Zm1MRUVMZkw1VWhYRFo1QVprMm0w?=
 =?utf-8?B?bUFua2J2Y3BpKzNiR2MwQ21DM2ttbXBqK1h6K21qYWlQc2Z6aDhod2tQajFy?=
 =?utf-8?B?OVdzWTRONElTTnZaVUZMaGhqQWw4WGRwYkdqdG1HZ2R0Mi80MGpwOVl6SjNa?=
 =?utf-8?B?YTVQTTVRZFFLTUxmekYzZEpzNjRsU3VOMDM5MTY0MnN0TTRhczdQM2xKK2Nu?=
 =?utf-8?B?d08vSkw5YkE5ZmdGSk5iOXFrc2x3QVR4N1czL2RwM2g1U05XeTA3cVpzZitK?=
 =?utf-8?B?TlQydUdaOGlialU2QlhpSjJHa3ZNdlBGZnJmVUU2dE9aZXVaOExDcFBBTHFp?=
 =?utf-8?B?SlpaV2FkczAvKzRBVkVXdDJMSkx0T2UvUVQ4cjFKeityWjZ0emZ0WXR0YlpO?=
 =?utf-8?B?djhHbjdsQWJKSXFTVUx2UWJtYkc3dXViSUgzbDJUZUFWRDhUR00rRmI3MWIv?=
 =?utf-8?B?NU1uMXhoMjJjaU5adkNabmt3d2pWVGhGMjVNa29KOFZDU0Z1TTR4SnJueXNo?=
 =?utf-8?B?V25wcnFqbm95RmdzTDg1UGxBb01Pc3RKbklTSjZKbm1HOWZXSStseThBNDVk?=
 =?utf-8?B?N01QV0x1aW55MzhEcTNVT3JFeW5MZjFpMk5jR2dhZEFhWXo1Vml6QTFIV3gx?=
 =?utf-8?B?V3RGbFp2Y3ZrNzFkR1pINFliU3VOZ2paL3ppbzdIczhmcEJIOWswMWdDeTRE?=
 =?utf-8?B?blIxMVFQOWJ6T3o2cVRpd293aXFiT1ZtVTNZdjN0TWNNRU5OeWlFanhmOTNr?=
 =?utf-8?B?NzNVUUttcnRIc1B4Unp3ZkIxS0I3MkdISC9mcnE3N3JZcUl1b1dWTHZ6WU1S?=
 =?utf-8?B?T3N5Mk1hYzdwek1wSUI2b2RwKzlWRUtRRjgrcER5TE5BNWVneHVyUm9OVkl3?=
 =?utf-8?B?MFd4K3VNWkFYUjBqVE5DZTFaZFI1VzhqOFRjOUFFRVVTY1hGTVQwMnNLb0VV?=
 =?utf-8?B?UEVDZnd2TXY4d1loa09OREZab0UwRi9uTm5PdnpNd2wybmlIN3JvZWpOQ3Q1?=
 =?utf-8?B?UDRHMU1Rei9kRVcwU0R5eVcxTXJ3cnBOUjc5ZjdBcjZZeUY4OHV2VTlid2JW?=
 =?utf-8?B?VEpoQ1VmKzlVcFp2TW8wQy9lZmNkaSt0V2NnQml5QXd0TjdiVTU4WHlDb0U4?=
 =?utf-8?B?LytPUlNVNVhRRW56MEdWbjNOMjhTRWMvUzliSmpqcGJBRlhsUWF5SkpKbUlX?=
 =?utf-8?B?NlgyM0VlTXl5TGlmalF1eFhSSzFueUUwVXBta3U5MVZzTld0QktianZmNWhi?=
 =?utf-8?B?REo0S3JTVVBnWUwybEt0WHVQY1FBWVdTNDZKekg0NFRiYmxGOGdnNnFLUlBr?=
 =?utf-8?B?bnB6QUNMeFFsaWs0Ly8vbUxZN3dJWVUxbHB5ek9ZR3U3dXZOd3R6UmZKUHhV?=
 =?utf-8?B?RmdLSWlSYURSTDhsYlRPdklQejBLTCtGSEduc1J4ZmpQK1VuZzZuYjVNSFJt?=
 =?utf-8?B?T2oxY2FrRXlDUGE4aWxubGVtUTVNSVdCWVN3U2JRNktvdmFaYUczclh2a00r?=
 =?utf-8?B?TTBrSVk4K1hoeWtUelcyWGxIbG9mS291bWIrOC9OQ2ZLQjhzdlRHYTloZUxS?=
 =?utf-8?B?dHZGUUN0RC9va2pyaDN0L0lINFQ5RGNHQzI3bkUxUXovdnB5YTJIQmhNMnU5?=
 =?utf-8?B?U2ZtV2V1YXNnd2doUVZDdnNXbkhtNTQ3WmNGWkJBNkdMWk1iNmJEMW1Ec1Fz?=
 =?utf-8?B?STUxanpLYXZudkxaaHd5MERzZmVjNVE3VzZOMUxTRXYvcUtnaDRZQlg4ZWxT?=
 =?utf-8?B?M1BRT29iQzlhcUhaS3IxMURPVmZtblZsNCtGWHRWRi93bjgva1B3ODBSRHlM?=
 =?utf-8?Q?9Y2G0iFLt0A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b25BbWZIRmNwaTgxU3UwcTNKdW1Bc2hrcFgzMURSUDI4V2dhTFJGQ20vWEhn?=
 =?utf-8?B?WE9uWmlBTXgvaHR0QUU2akU5N2V2Nkp2eDdnVjBvNEFyWmEyMG12MnNFZlZV?=
 =?utf-8?B?K0lTVGFFdFQ1UmRvcTRRSmdsbnc0Q2g4Y2Z1Mzg2MXFaZXJnV1d4MXRLMURp?=
 =?utf-8?B?Wk8wRDFJTlJKTktNTTFzcTFPU0RmQXpOWTZVYWNiell4R08zTnVGTkZMb1hW?=
 =?utf-8?B?eURiNklINThka0M2ZzVVaGFJY29EK1BCOW9zUEVtajN2cmxiVVAxMFI0Y2NS?=
 =?utf-8?B?WVh4MlpqOHdHMDZGMU5oVnNCUk55RG5Yc0orSlBqNG5iM3c2U2UrTThkU3J3?=
 =?utf-8?B?eDhqRDlRcFF6UzI4UXNROHJQVDlYNTBacmNNZWRiZjc2cTZLNmRLS242MFhS?=
 =?utf-8?B?aGd0ZzRUSGw4cXBLVUxKNzNjTURsZ0pyUHZpSm44TFFHYmtHTVgyS2tBaWhF?=
 =?utf-8?B?UzNjVGc0QzJhQUpyNjkzR2FCV0d2eDhpdXZGU1JjZGZ3OUtFSGxkOWtZbUti?=
 =?utf-8?B?NlpJR0twbXNlMW45L3Q1VzAranZzVnR6YnEvandSQ0lYci93cmNJeVJHb0Iz?=
 =?utf-8?B?MkxpWVM3QVhwS2JGQUxaUHo3SW44WW1vSEFtcEtrU2RmQ3R5U1FkVkhkeU5u?=
 =?utf-8?B?QnRKT1pYcGZpQ2s4MW1EaTNmZTluQjJMUU94VStVaGh6bXNDWmhHeEJyR1FX?=
 =?utf-8?B?aDBQZnhEdkZGdDJkZEZ1dkNKUSs2bVRoK3JFN1VqOUdVRWJXYUFVK3ZQYzBX?=
 =?utf-8?B?QjVYR2VNSUtPNDB2anpKdjcyWXZhN1lhSEpJS3NXemNOdXNIcDBCMUg1aU1M?=
 =?utf-8?B?d3BFN0hKdVMyVkxlMHA1WUxLb3FZL1Q5UlJiSmNjOEJwWEtFeDM5MmNTTG9V?=
 =?utf-8?B?bFhmcFR5MWVDMVRma2c4Nm40NlRFUHkxTTZYcEIwTm8rczlHTEFMSXFZU2pa?=
 =?utf-8?B?b01vTjdFUkhtaUx4UlplNzRydkN2QUZ5MzdaeDVYeDJVS1FBVHJmNm5jcDhS?=
 =?utf-8?B?aklTN0l3T3pjOHgvQmVPVHJHVXBwQkExc2x2RituQ2tHNFVMcUZSUmJhQ1Av?=
 =?utf-8?B?ZjlDQnliSjhNOHo5UDRFZUFYdmxpdkFmMkR1eVkvZDYrYTlhT25IalVtU2Yr?=
 =?utf-8?B?MmhkaCsyMUhHbXJtNElESXRVTzBZTDdkRCt1Sk9McytEQVNoWGdTUnBmQmFk?=
 =?utf-8?B?SVJqSGpWWVQ0VXpiakIyYkZUaTN3RDVHdXZvanJoVkZXaXYxMmRBSHM3bUI3?=
 =?utf-8?B?c010V3M1SGpvbWNiRko2eEVraXFDYytvL21jMFZLWWhwYVd6QisycHBCa1J2?=
 =?utf-8?B?Tkp0UzlGWTQyaDhrK05qS1pxWUJOZmJXWWhmcVNCWEFrVVJEbXVMbGRTZ0tD?=
 =?utf-8?B?aGtyOFo5eGFvU0didUFzcVlURTJDNzBTN3cvc0ZtNG56ZUZmQnExUUorMG9R?=
 =?utf-8?B?amNIZk51c1Ewbkh0R0xqM3dBbGFEdkJPbWZNbGt2R1BkVlE3bk1OU3E4UFpY?=
 =?utf-8?B?RTlJOURqWUNKK0s5eG1TeHdCZzcwTktSQnRrWG9pTTdPV3pabjA3NU1wMmlF?=
 =?utf-8?B?S2loOVkyUlJPWXRUWTJsMzN3K0JsY0lLWmtYcHR4NElaNlBtUnk4QnhtVjRn?=
 =?utf-8?B?Q3QxT2UxMG1CMDBWZjRVT0E2ejYrQmZIb1FzTHo4TkhFaW4veEZKTHpWdUxD?=
 =?utf-8?B?amlGV2pYSDJ0S1Vtc21BZ29iQVBWT0ZZYm9YWm1rTk1iRVN0K2hmbkdOcFFk?=
 =?utf-8?B?UDFzQ1JIMFZxbHBHNG11blZMWGFEVnNCK3lzekRGZ3F2U2RNUTJML1lWUFNs?=
 =?utf-8?B?eDFOUWw5NE9lM25zUmk2empMVDNmS3dMV1dzRGxBcTJjZFpBM2o1UGxTdkVH?=
 =?utf-8?B?djZOM2JzNFBYOUNndE1xZy9kM3pMZ2FDZHZBcUdUN0I1YU1jS0xBeEIvelEx?=
 =?utf-8?B?WXB2OUpjMzRKbVdhVDRsNllwSlUra0kyZVJiQVNSTnFRcE9rb01QRjM5STlx?=
 =?utf-8?B?V1l1QlFHSlloQkRyRlBJdGxQNlVtQkozTm9FWVpBRmdKSnU1VXRpUjFBMTBI?=
 =?utf-8?B?U0JNWlhpcVBvNmdnckNXYnl3d3cvK1ZYZHN2UWdOWjh3QzBVbW9jQkZRYWRD?=
 =?utf-8?Q?UBi65wazocutenu9nvgtBEE/m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee41f40e-1987-4be8-82ef-08ddf0852f54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:14:57.3523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eDIxvNetwtI/AaJ6WC6YtgQmgIXwEzdwFVu8ajn5XPBK8izYnRX3JhBDHAB/LR1V1ebLRO+SPFf89w3xZ0+CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/10/25 05:56, Andrew Lunn wrote:

>> Changes v2 -> v3:
>>    - Removed unused phy-mode property from mac0
>> +&mac0 {
>> +     pinctrl-names = "default";
>> +     phy-handle = <&ethphy0>;
>> +     pinctrl-0 = <&pinctrl_rgmii1_default>;
>> +     status = "okay";
>> +};
> Oh, fun.
>
> Please don't do that. At some point Aspeed it going to clean up the
> mess they made with RGMII delays. And at that point, it is very likely
> your board will mysteriously break, if nobody remembers it is doing
> something probably no other board does.
>
>          Andrew

Hi Andrew,

I will add it back in. Our board phy has tx and rx delays.

Don


