Return-Path: <openbmc+bounces-671-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E40B87297
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:37:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTSC368qz3cf8;
	Fri, 19 Sep 2025 07:34:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231291;
	cv=pass; b=dRwAUujop0VysoZAodc2jCc2GWdKRWvu5A2hd9LMEiJRmddApNnnNdtEqT3WXwvuDd0Uid4nY0miua91eHFkjNae//NylUADa4G2PFVvfvsgoHZRt3uYRQBtXVxVG1NK6W7Mfa4DotZW0nFa3OJII1JiBmAgv6gkqmRIJcuhg+pJebVOlRgPIq4YLMhZhqaiG/t0HaPeGIK8YAyiOXcVR/PmgjP+TFbK4N2J3ndRxg685+AMRnKfCo3uByDH04X7LUgFyDRKSwgyG5fTw3EuttqdmZwXlJrSppks0xQSIgKx9bNS4g85RJXWrWBIk2wNw9GzQ+OYnnQOBxrY97oiOg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231291; c=relaxed/relaxed;
	bh=q8lYncgrN2uyWafZHOvhd7k82pGxqS6Rflm16DT3Nbk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Fxy54hpzB2Dba3I0u+aUvQ7TX4l5OD1VO/5vb41dRHuXBbYSFTIcoUDedG6DQJphWr1WwGB45AAG+iTMYUfPwkeDfA8hmT2HCe5tA3UfUV6P+sdnOVS/y6W9P6dfHJdRWki15ganegIX6vxBsKRwUyJKBpIOsKsWihB4pjdc1CyPtxfdfMIuzLcwLHJbNUYTk3AP6RI5y+XDZRyZrXwe5xwiiaUcLrihjtex5OTuoXch8ovWW1m/WAzrjMQ8VArGB9HmASfNI6pwtfxLpQNSQl1DxzN+pdnxlYNFmv7T7LWO5UyXzSbR9Z0exUldqTSp7fsjCYi2YotJPJgn2h4OnQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dwf5vnRs; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dwf5vnRs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTSB169sz3cfm
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oM9eFIGWR2687gRdvzC+UcMplR8BjF/3eGnkhwbcFxkYlXUOcD5Bg/9aVJJvDrXv6eixwxGO0RWVmEgWDakwjlI5qb7t+EnRqJltqeRgFY0LUE3JpG4RpZZGWP2NnQXJ303MghXBYZwLwWWbpC65C0EEgQkMqPNh5+nNEMabYmB29kSnnlQSBnL+ri3M3EnhBAQyNtNrWIHS1ZYgf5yfrfXwaqfhE9DzOH95pZLCUnGGo+GlKqRqIbpFkuArGbZHCli4rta4CirvLOivZeA8yBQZwI1TZyNshinYMAkSI/cRkG0JOmrj6BgnoirYfoDc4H42M1GLAlMzU2gNGBbfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8lYncgrN2uyWafZHOvhd7k82pGxqS6Rflm16DT3Nbk=;
 b=iLCnQLeu9gubHcOTlTE/P8AC0tWIZKU8T+nDTlKdu6oBcLFMmlV+jkZ/WPeMTza2bdvAHkbLxhbYHTB+BPDwdhC1znnpHeGnPOBcQR9BxzvLcnVwvImwY+2XRgKWMe6RIVzR4awZ0WtJFqJ0PRYXI4oReKFsp3+vwIgTh0vlZzcNMWYNMpYoiDfjK0nTcmnMGdU4aJvtxKr4dmUr+k3IjD2SkXNDGBDNGUIixxtmZRSJ4TmLU/N7IvkuAKuRD3yMe4hxfDwnFX46oTS3natD1jwBYLffzIDhulWKiSart0IEa3qoodcOki2iiGZfsQU4XJfQMPc6eXnKFSv1T+V5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8lYncgrN2uyWafZHOvhd7k82pGxqS6Rflm16DT3Nbk=;
 b=dwf5vnRsb4izbxFTMdiMWiXl7SAk5z7skhYx/hxnO6sruTfH2LQ4VDDDGYS0A1n6ybJDCSMFY1cV8Px6D7R1cAqM4pMXxZDZVfF9fJem8e+MfpZHDWGFFiCV/uv22Ypr9rf0LzTBNr3gLs0WFIEFql1IIigKmsPhbl3QELT6ctJUdJQU1G+qsJg0U8PsbV+55muWKbrUoiOLybS0/hrtPPXnt28pU5ppjMZ6C2JNIVxOa0YysWJCw5dWTHONJyj4dTQKSKiIQiLTQT8AZQghpX5nTiFxns/1Brgt8nJhtvZVYwa/8ik3FEzyCMQAzz/QVYmhcg6g++ROXZbxLTkc8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:35 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:34 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:34:00 -0700
Subject: [PATCH linux dev-6.12 14/14] net: mctp: test: Add tests for
 gateway routes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-14-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=12424;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=5qQ9iB7xOhLR1KXjj6Tg4SdEAb0G7n+ncKjIM0jPnbE=;
 b=P5RStS+zu7xu0Y3ivVzbPZniTGxZa/Soy+rFhNt/fZaoLWwyW1SB5PofdZdBfBI58tHeP5SM/
 4DP0mEazD9OBbHDxg/OC2zfEOwQ7JoHoyfOENsLWGzBNubA/Ofyd+48
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::10) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ae0ef33e-3ad2-4cc4-8365-08ddf6fb2937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEgrTEdrYXZHOURaeHZpUnFaaFFuSkpZWXozUENiZ1IvdGlKc2tRd2FKb2Y0?=
 =?utf-8?B?TE1XVUY4ZjdBeUF0QmFic1g5djRhRHpJMkRWSTREMDFvNTFWOHdva3ZDb2FR?=
 =?utf-8?B?alR6YkJuaEZMai9ENUxtNFh6NlZyYUVpS3V5ZFlhQitpNWYxbGhSdWk4ME00?=
 =?utf-8?B?NFNvT2dpV2R1TmdteWFZT2ExdzZzQUROMVIxTjdLTFBIRXlYaEJhbStaUDQw?=
 =?utf-8?B?UWRqY1U3dzA0RTlKMnpYOVlaK1J4anlmSVI4NDFWOHN0c2VnbDhwMmFPRXdD?=
 =?utf-8?B?SVI0S0N4Rm5ZRFg0TFVaa25hV2ZjN0V3b3FIbUJIbzYzQjFCSjE4R3ozY0xQ?=
 =?utf-8?B?ZVc2ekVyVGJWRTVHOGtkWm81MzhPUVBqQ0VOS1U2ZWFEQmlwU21iazJyUmdi?=
 =?utf-8?B?VlNCWGdUOEZ4dklFK3F2N2xDc3lOWjRIZmpVM0FjTG4xYTRjbGJZRHJoZzVO?=
 =?utf-8?B?c1pud2xGOUU3U2lodkJHeHRwaVhSQWxIc1psTm9LS3ZiL002Qzl1ZDUyWVZ1?=
 =?utf-8?B?MHNNWVBtczIvT2dldmlobFN0dW1qVG1yYU9hZHRWL1Q4V21FRlhVcXk0MWJN?=
 =?utf-8?B?cWFlcnNKaTRTQ0YvcEtOdE1VTW51SktFSmFjY3BQaTBUWFA1RVFLZTh4WUhM?=
 =?utf-8?B?RE55dkxJa0Z3aG1YV1RBNlN1ajA2c1JuSjNCYWpoTzFoS2pQMUhNSE1CMGt3?=
 =?utf-8?B?bWhQRGt1U1pTa1dIb0UzQmF3em0zN3dsQUtVRUlLM2gyNGdKUzhiUzUxZGZR?=
 =?utf-8?B?aDlUQ0h5Q2Y0M2NMUElRNHN2OUsxNGZKODZuejRBNFZhOHVFUE5nZFZ5V1dO?=
 =?utf-8?B?YllDR0VvR1piZFpOcHZPWmJ0UHExR1ZZcVJmV1hHMURuSUM1OG5VaTlhaU1o?=
 =?utf-8?B?cjArQzhQbTJKc0pudnA5RkVaTUNJK1B5bzd5UHpuWFBnSnJ3NitsNkh5OFZs?=
 =?utf-8?B?MXBFQVVqMlRyYmhHWi9VZXJzY2p1WUtheTNJZDE3S3RzSFdvWk5oUWlyazlm?=
 =?utf-8?B?SEhLdDFNak50bENRV21ZWXNzdWQrUjRLaG05V2duR0ExaDFPWER6RHNZVDhN?=
 =?utf-8?B?eE5ZdjQzdHRTWUNpdXgyYXZCWDJiWmRxd2pTTE9jTGRnYUZZb2ZKQ0dkSVQ2?=
 =?utf-8?B?WnMzQUVwcExWWHlsSGpmaklFSEVOMUJTQmxxOHIzc3NwbEh2QU1aVUQvWmRr?=
 =?utf-8?B?WjJaOC8wOGxSTWtSZUp0eE5LeDRWcG1PSTQ1Y09uV3Q5NE1Sb2NjV1hjSkky?=
 =?utf-8?B?VFBTMC9qV1d3c1hWaW5WclBGcHpKbVdiR2s4N1htZXpqTkZJSmMvZ2Y0S1JF?=
 =?utf-8?B?VXQrWjVTVXN1dVNaeGNmNG5CWDc1dEdudDVjakwrb2xLdDdSRGt1eTI3RFVm?=
 =?utf-8?B?UHNaYnlpVloxQWNORjBQbXpZekRwbXkzUis5aFZhb2VsNk1RVlJYNytKRVBu?=
 =?utf-8?B?R0JCVjlhMkhnSXdBZHRxY25GRDFUR1lxc1hzQnE0ZDNueVNjVEc3YVhSK3Fj?=
 =?utf-8?B?NWlwVWE2azlQUkhWSTBNNXF4QlptUk5Wa2hrVFZJNEpEb3ZyUXR0cU9PWWhi?=
 =?utf-8?B?VDZ3SEx2T2ZibVNLU0dQM2RSNWIyMDBtalUyaWw5dHhubWFxWXZYODVxdXRs?=
 =?utf-8?B?SWpkTERnM0VDeW5SeEZtQXQvSzFMMEVZclV4N3c0SkJnQXpUUXV4Wlp3eWtK?=
 =?utf-8?B?YXhlQS9ITzBNT1JNN09aaWptK0k1ckJISWlJbnJ0ZUpWbDQxUTRSaHBWYzdX?=
 =?utf-8?B?K0E3d2tOSkp1aHNKUlQrU3E3ZHNnbHpDdFpzbDJrUmEvcDc3S3VhL2pvdm9i?=
 =?utf-8?B?bTN6ZHNwMFVoMW15STI5LzhlY0FYd1I5SkZUaWszNVpZSG5maUcwVnBxWnc0?=
 =?utf-8?B?S240cTY3eUZHVDdUZHJIbXRDNldhdElUK1dXcVZsVHV4RDFucVVCeitiU2hr?=
 =?utf-8?Q?MGX7LTDFbXA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OSs2N0M1MldxeGZvU2d0TjArN0RPRFk3Snc2cXo5RlkvMGNEUE1RalJjR3Mz?=
 =?utf-8?B?MjQwZTJuVXBFWE5jMmVwMHNkaUVLRnJWREduRDlBRXdsbEQ5WlFQR2xqZm1z?=
 =?utf-8?B?T0F6ajlPK05sU0czeGtyVVNqdDR0bjhrWkxxNmlLMldTOTgweWl5L2djSStC?=
 =?utf-8?B?OEtXS2ZmSGI4ZFRPd2NZdjhmcU0wZTdkK0tyUzA3aWpEajloR1lWNzhmZHNz?=
 =?utf-8?B?QTRXTHYwQWh2aEt4SC9laWFpN0tqSTNIc0dBRi9DUGh5aHN1S3dIdTJyRnV4?=
 =?utf-8?B?YllkTGVsL2ZZc1o5RE40UEE2THl4eXl4WFdVdWtNOTRjQXJwQ0xzR05YY2Yx?=
 =?utf-8?B?ZURmRmhxeDdidlBjYUZuVm83dW5mYnBNUmxhekZtQUV5S3k0anl2WHEyd3Bh?=
 =?utf-8?B?Mk1sNjQ3OFZHV3B1ckVSd2hhc2dHcktDVk1FTlBoVUJlTFlveTFURHRoS3hD?=
 =?utf-8?B?M0FsR0pjTlFyWTNmTkFzbTh2dVI5QWI3RVVYZVJLemNOMUtwMlRRZTZsSEho?=
 =?utf-8?B?Q3lNRGRpSHVKK2w4MVZJV0RYb3h3bE85QmE0UHV2cW52TEVadlJYN09YWW1Q?=
 =?utf-8?B?SUc4ckNJemNLUDFxUjJxQ3ExYzUwSGxmanlSTWlkMWhpRjhycXdmbi9DcHVl?=
 =?utf-8?B?bXhIZnVNSzYyc1BLdEgrWDNtbkpmNCs1T1duZXMrUHVSV202L0lnaWM4MkNV?=
 =?utf-8?B?MEprUjF2Nllqa2lYSExTLzFYL2dwNHhXZVh6M2JoaC9sK3BoQ3YwV2V4c3Vy?=
 =?utf-8?B?OEJFaS8xQndmQjhMd0pwU2RKS2o1elkyMTlzMTJTSFBiL3NQU0V1S3VGYzZ0?=
 =?utf-8?B?TnNvTEJnME4yclRTS3FyQ3BjbzFuck1LV0xKOWk3Nm0vQ3R3MlBIR3R0K1Az?=
 =?utf-8?B?Rm1BVjlsRnRNa3l3eGIwME5FdUQ5ZnhsWUl6Q1EyQlZUNGRhV0pyN1BKNjgv?=
 =?utf-8?B?MlRneng0Vk1iM2xKaVdzNWo1c0NleWUvejVUcklVVEQvR3NkSnBMcSt4eWYw?=
 =?utf-8?B?M3VReEJZbWhEV0VHc3NSODFUUmNzQWllYU9jOUpaQXRpcS9zRkhucXJFcXhs?=
 =?utf-8?B?cm5YNy8xY1laZ09oSFUrU2xaZGtUTzRQMWVQcitpakZ5ZWpkOFdIU1lad0RX?=
 =?utf-8?B?Njk2bTJCaytYSFg0Ymo3aDFiNmNWdkN4MUdRU0lUbUNwd20zR1pHQmRubzlr?=
 =?utf-8?B?UWJRZFJkNkxaSHdwMGZ3dnRnNXh1YkRvbmRMVjd3NnVyenRrVDBqZ0xTUnNn?=
 =?utf-8?B?UjBJbXRKb2xIeWxoU3dNSGxxWXd0U1NIRWZwemZIb3BHMDhsS01ZSVVGVEYw?=
 =?utf-8?B?Z2ZVcXhUcDBpZjhkaWlMYU9SaSttYlQ3YWFVb21XaitYSHNJSHVQMFJIRGwr?=
 =?utf-8?B?K29maEpUVENzSzZYd3k0Z2NuVmFVU0lVZnNkaEEzQ2E2RWhPMzFUcnNRY2Uv?=
 =?utf-8?B?SVpTSmVhcGFJb2lYSHZvanJPV2VMTkV2RUF6cGRxQ1V1czR4bHNPcEE4VjlF?=
 =?utf-8?B?SGxWSHFTa3lUQjRSSFNNck9OUDU5Q2tMUDl0Q1ZwNE1yNVJ3VVF3UVorMlVk?=
 =?utf-8?B?NHl3TDBBQ1BXRDFmaXNIeDhCMzBrT1JYME9ZcjVmOGIyaDJtNjNCekJFT1hE?=
 =?utf-8?B?RGhsaG5QcVUvblYvR21uZzBZNHVEL3p1cGxzM0o2eWplYmtWZXJ0cDl0eGhw?=
 =?utf-8?B?K1htMVp0Y1VaYTZKYTFlM21PQ2wxQlByczd0YllKWHhMcHR5ZXRzQ1RKWVBJ?=
 =?utf-8?B?a0tMYWc0Yyt5VkIyTHJlUGg3elQ4S1pORmp6bTIrcEVGNkI2bmFyc09KREE4?=
 =?utf-8?B?S0tmU1RxYmc4NFdxb0RGYjJ6eENmL2ttak1IeG11bzdtWHMvNGVSNWZPWmxF?=
 =?utf-8?B?NHZmR2pvRWc0bzRFbXVQTFFIMCsvNTBzcWdpb053bWNsbEJNekhPbStNTnNp?=
 =?utf-8?B?T29IdEdvdHl4eFlmMTRoZ2FxN1ZmZ0ZlWTFpK21wSzV3TGIrRURidEhVanE2?=
 =?utf-8?B?ZUFYTkswbTF2dExVQ1BMM3JtZ2JmQm5Id2tHY0M4ZDZORHlxTERGbmpPdyt2?=
 =?utf-8?B?UHg3UWZzR2tZRlhiL1Zzckt1ZFA3YmxBTHBSblFJb3UvSW1jUjNXSWF0UWpJ?=
 =?utf-8?Q?mOydsLM+1Ht8J3qWtdjN9huoP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0ef33e-3ad2-4cc4-8365-08ddf6fb2937
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:34.6330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l24GBCEnOeCQH3lUI0IVJEPjH2xBMhaIrI01xSM8dBOzAJhvNFIyGkCUBfPtvKy5pignegKV/w10Pn4xTvqXPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Add a few kunit tests for the gateway routing. Because we have multiple
route types now (direct and gateway), rename mctp_test_create_route to
mctp_test_create_route_direct, and add a _gateway variant too.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-14-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 48e1736e5dc1dce875fdaba9b99c01dd4cd226a0)
---
 net/mctp/test/route-test.c | 233 ++++++++++++++++++++++++++++++++++++++++++++-
 net/mctp/test/sock-test.c  |   2 +-
 net/mctp/test/utils.c      |  33 ++++++-
 net/mctp/test/utils.h      |  13 ++-
 4 files changed, 271 insertions(+), 10 deletions(-)

diff --git a/net/mctp/test/route-test.c b/net/mctp/test/route-test.c
index 36dd5e9ba27a0cfc6247ff321e884a9e128ee535..7a398f41b6216afef72adecf118199753ed1bfea 100644
--- a/net/mctp/test/route-test.c
+++ b/net/mctp/test/route-test.c
@@ -141,7 +141,7 @@ static void mctp_test_rx_input(struct kunit *test)
 	dev = mctp_test_create_dev();
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
-	rt = mctp_test_create_route(&init_net, dev->mdev, 8, 68);
+	rt = mctp_test_create_route_direct(&init_net, dev->mdev, 8, 68);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt);
 
 	skb = mctp_test_create_skb(&params->hdr, 1);
@@ -1183,6 +1183,233 @@ static void mctp_test_route_extaddr_input(struct kunit *test)
 	mctp_test_destroy_dev(dev);
 }
 
+static void mctp_test_route_gw_lookup(struct kunit *test)
+{
+	struct mctp_test_route *rt1, *rt2;
+	struct mctp_dst dst = { 0 };
+	struct mctp_test_dev *dev;
+	int rc;
+
+	dev = mctp_test_create_dev();
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	/* 8 (local) -> 10 (gateway) via 9 (direct) */
+	rt1 = mctp_test_create_route_direct(&init_net, dev->mdev, 9, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt1);
+	rt2 = mctp_test_create_route_gw(&init_net, dev->mdev->net, 10, 9, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt2);
+
+	rc = mctp_route_lookup(&init_net, dev->mdev->net, 10, &dst);
+	KUNIT_EXPECT_EQ(test, rc, 0);
+	KUNIT_EXPECT_PTR_EQ(test, dst.dev, dev->mdev);
+	KUNIT_EXPECT_EQ(test, dst.mtu, dev->ndev->mtu);
+	KUNIT_EXPECT_EQ(test, dst.nexthop, 9);
+	KUNIT_EXPECT_EQ(test, dst.halen, 0);
+
+	mctp_dst_release(&dst);
+
+	mctp_test_route_destroy(test, rt2);
+	mctp_test_route_destroy(test, rt1);
+	mctp_test_destroy_dev(dev);
+}
+
+static void mctp_test_route_gw_loop(struct kunit *test)
+{
+	struct mctp_test_route *rt1, *rt2;
+	struct mctp_dst dst = { 0 };
+	struct mctp_test_dev *dev;
+	int rc;
+
+	dev = mctp_test_create_dev();
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	/* two routes using each other as the gw */
+	rt1 = mctp_test_create_route_gw(&init_net, dev->mdev->net, 9, 10, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt1);
+	rt2 = mctp_test_create_route_gw(&init_net, dev->mdev->net, 10, 9, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt2);
+
+	/* this should fail, rather than infinite-loop */
+	rc = mctp_route_lookup(&init_net, dev->mdev->net, 10, &dst);
+	KUNIT_EXPECT_NE(test, rc, 0);
+
+	mctp_test_route_destroy(test, rt2);
+	mctp_test_route_destroy(test, rt1);
+	mctp_test_destroy_dev(dev);
+}
+
+struct mctp_route_gw_mtu_test {
+	/* working away from the local stack */
+	unsigned int dev, neigh, gw, dst;
+	unsigned int exp;
+};
+
+static void mctp_route_gw_mtu_to_desc(const struct mctp_route_gw_mtu_test *t,
+				      char *desc)
+{
+	sprintf(desc, "dev %d, neigh %d, gw %d, dst %d -> %d",
+		t->dev, t->neigh, t->gw, t->dst, t->exp);
+}
+
+static const struct mctp_route_gw_mtu_test mctp_route_gw_mtu_tests[] = {
+	/* no route-specific MTUs */
+	{ 68, 0, 0, 0, 68 },
+	{ 100, 0, 0, 0, 100 },
+	/* one route MTU (smaller than dev mtu), others unrestricted */
+	{ 100, 68, 0, 0, 68 },
+	{ 100, 0, 68, 0, 68 },
+	{ 100, 0, 0, 68, 68 },
+	/* smallest applied, regardless of order */
+	{ 100, 99, 98, 68, 68 },
+	{ 99, 100, 98, 68, 68 },
+	{ 98, 99, 100, 68, 68 },
+	{ 68, 98, 99, 100, 68 },
+};
+
+KUNIT_ARRAY_PARAM(mctp_route_gw_mtu, mctp_route_gw_mtu_tests,
+		  mctp_route_gw_mtu_to_desc);
+
+static void mctp_test_route_gw_mtu(struct kunit *test)
+{
+	const struct mctp_route_gw_mtu_test *mtus = test->param_value;
+	struct mctp_test_route *rt1, *rt2, *rt3;
+	struct mctp_dst dst = { 0 };
+	struct mctp_test_dev *dev;
+	struct mctp_dev *mdev;
+	unsigned int netid;
+	int rc;
+
+	dev = mctp_test_create_dev();
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	dev->ndev->mtu = mtus->dev;
+	mdev = dev->mdev;
+	netid = mdev->net;
+
+	/* 8 (local) -> 11 (dst) via 10 (gw) via 9 (neigh) */
+	rt1 = mctp_test_create_route_direct(&init_net, mdev, 9, mtus->neigh);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt1);
+
+	rt2 = mctp_test_create_route_gw(&init_net, netid, 10, 9, mtus->gw);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt2);
+
+	rt3 = mctp_test_create_route_gw(&init_net, netid, 11, 10, mtus->dst);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt3);
+
+	rc = mctp_route_lookup(&init_net, dev->mdev->net, 11, &dst);
+	KUNIT_EXPECT_EQ(test, rc, 0);
+	KUNIT_EXPECT_EQ(test, dst.mtu, mtus->exp);
+
+	mctp_dst_release(&dst);
+
+	mctp_test_route_destroy(test, rt3);
+	mctp_test_route_destroy(test, rt2);
+	mctp_test_route_destroy(test, rt1);
+	mctp_test_destroy_dev(dev);
+}
+
+#define MCTP_TEST_LLADDR_LEN 2
+struct mctp_test_llhdr {
+	unsigned int magic;
+	unsigned char src[MCTP_TEST_LLADDR_LEN];
+	unsigned char dst[MCTP_TEST_LLADDR_LEN];
+};
+
+static const unsigned int mctp_test_llhdr_magic = 0x5c78339c;
+
+static int test_dev_header_create(struct sk_buff *skb, struct net_device *dev,
+				  unsigned short type, const void *daddr,
+				  const void *saddr, unsigned int len)
+{
+	struct kunit *test = current->kunit_test;
+	struct mctp_test_llhdr *hdr;
+
+	hdr = skb_push(skb, sizeof(*hdr));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hdr);
+	skb_reset_mac_header(skb);
+
+	hdr->magic = mctp_test_llhdr_magic;
+	memcpy(&hdr->src, saddr, sizeof(hdr->src));
+	memcpy(&hdr->dst, daddr, sizeof(hdr->dst));
+
+	return 0;
+}
+
+/* Test the dst_output path for a gateway-routed skb: we should have it
+ * lookup the nexthop EID in the neighbour table, and call into
+ * header_ops->create to resolve that to a lladdr. Our mock header_ops->create
+ * will just set a synthetic link-layer header, which we check after transmit.
+ */
+static void mctp_test_route_gw_output(struct kunit *test)
+{
+	const unsigned char haddr_self[MCTP_TEST_LLADDR_LEN] = { 0xaa, 0x03 };
+	const unsigned char haddr_peer[MCTP_TEST_LLADDR_LEN] = { 0xaa, 0x02 };
+	const struct header_ops ops = {
+		.create = test_dev_header_create,
+	};
+	struct mctp_neigh neigh = { 0 };
+	struct mctp_test_llhdr *ll_hdr;
+	struct mctp_dst dst = { 0 };
+	struct mctp_hdr hdr = { 0 };
+	struct mctp_test_dev *dev;
+	struct sk_buff *skb;
+	unsigned char *buf;
+	int i, rc;
+
+	dev = mctp_test_create_dev_lladdr(sizeof(haddr_self), haddr_self);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	dev->ndev->header_ops = &ops;
+
+	dst.dev = dev->mdev;
+	__mctp_dev_get(dst.dev->dev);
+	dst.mtu = 68;
+	dst.nexthop = 9;
+
+	/* simple mctp_neigh_add for the gateway (not dest!) endpoint */
+	INIT_LIST_HEAD(&neigh.list);
+	neigh.dev = dev->mdev;
+	mctp_dev_hold(dev->mdev);
+	neigh.eid = 9;
+	neigh.source = MCTP_NEIGH_STATIC;
+	memcpy(neigh.ha, haddr_peer, sizeof(haddr_peer));
+	list_add_rcu(&neigh.list, &init_net.mctp.neighbours);
+
+	hdr.ver = 1;
+	hdr.src = 8;
+	hdr.dest = 10;
+	hdr.flags_seq_tag = FL_S | FL_E | FL_TO;
+
+	/* construct enough for a future link-layer header, the provided
+	 * mctp header, and 4 bytes of data
+	 */
+	skb = alloc_skb(sizeof(*ll_hdr) + sizeof(hdr) + 4, GFP_KERNEL);
+	skb->dev = dev->ndev;
+	__mctp_cb(skb);
+
+	skb_reserve(skb, sizeof(*ll_hdr));
+
+	memcpy(skb_put(skb, sizeof(hdr)), &hdr, sizeof(hdr));
+	buf = skb_put(skb, 4);
+	for (i = 0; i < 4; i++)
+		buf[i] = i;
+
+	/* extra ref over the dev_xmit */
+	skb_get(skb);
+
+	rc = mctp_dst_output(&dst, skb);
+	KUNIT_EXPECT_EQ(test, rc, 0);
+
+	mctp_dst_release(&dst);
+	list_del_rcu(&neigh.list);
+	mctp_dev_put(dev->mdev);
+
+	/* check that we have our header created with the correct neighbour */
+	ll_hdr = (void *)skb_mac_header(skb);
+	KUNIT_EXPECT_EQ(test, ll_hdr->magic, mctp_test_llhdr_magic);
+	KUNIT_EXPECT_MEMEQ(test, ll_hdr->src, haddr_self, sizeof(haddr_self));
+	KUNIT_EXPECT_MEMEQ(test, ll_hdr->dst, haddr_peer, sizeof(haddr_peer));
+	kfree_skb(skb);
+}
+
 static struct kunit_case mctp_test_cases[] = {
 	KUNIT_CASE_PARAM(mctp_test_fragment, mctp_frag_gen_params),
 	KUNIT_CASE_PARAM(mctp_test_rx_input, mctp_rx_input_gen_params),
@@ -1200,6 +1427,10 @@ static struct kunit_case mctp_test_cases[] = {
 	KUNIT_CASE(mctp_test_route_output_key_create),
 	KUNIT_CASE(mctp_test_route_input_cloned_frag),
 	KUNIT_CASE(mctp_test_route_extaddr_input),
+	KUNIT_CASE(mctp_test_route_gw_lookup),
+	KUNIT_CASE(mctp_test_route_gw_loop),
+	KUNIT_CASE_PARAM(mctp_test_route_gw_mtu, mctp_route_gw_mtu_gen_params),
+	KUNIT_CASE(mctp_test_route_gw_output),
 	{}
 };
 
diff --git a/net/mctp/test/sock-test.c b/net/mctp/test/sock-test.c
index 5501f7794a8f96f1dcf26e93542bec04ddcfc769..4eb3a724dca39eb22615cbfc1201b45ee4c78d16 100644
--- a/net/mctp/test/sock-test.c
+++ b/net/mctp/test/sock-test.c
@@ -40,7 +40,7 @@ static void __mctp_sock_test_init(struct kunit *test,
 
 	kfree(addrs);
 
-	rt = mctp_test_create_route(dev_net(dev->ndev), dev->mdev, 9, 0);
+	rt = mctp_test_create_route_direct(dev_net(dev->ndev), dev->mdev, 9, 0);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rt);
 
 	rc = sock_create_kern(&init_net, AF_MCTP, SOCK_DGRAM, 0, &sock);
diff --git a/net/mctp/test/utils.c b/net/mctp/test/utils.c
index 97b05e340586f69d8ba04c970b0ee88391db006a..01f5af416b814baf812b4352c513ffcdd9939cb2 100644
--- a/net/mctp/test/utils.c
+++ b/net/mctp/test/utils.c
@@ -119,10 +119,10 @@ static struct mctp_test_route *mctp_route_test_alloc(void)
 	return rt;
 }
 
-struct mctp_test_route *mctp_test_create_route(struct net *net,
-					       struct mctp_dev *dev,
-					       mctp_eid_t eid,
-					       unsigned int mtu)
+struct mctp_test_route *mctp_test_create_route_direct(struct net *net,
+						      struct mctp_dev *dev,
+						      mctp_eid_t eid,
+						      unsigned int mtu)
 {
 	struct mctp_test_route *rt;
 
@@ -144,6 +144,31 @@ struct mctp_test_route *mctp_test_create_route(struct net *net,
 	return rt;
 }
 
+struct mctp_test_route *mctp_test_create_route_gw(struct net *net,
+						  unsigned int netid,
+						  mctp_eid_t eid,
+						  mctp_eid_t gw,
+						  unsigned int mtu)
+{
+	struct mctp_test_route *rt;
+
+	rt = mctp_route_test_alloc();
+	if (!rt)
+		return NULL;
+
+	rt->rt.min = eid;
+	rt->rt.max = eid;
+	rt->rt.mtu = mtu;
+	rt->rt.type = RTN_UNSPEC;
+	rt->rt.dst_type = MCTP_ROUTE_GATEWAY;
+	rt->rt.gateway.eid = gw;
+	rt->rt.gateway.net = netid;
+
+	list_add_rcu(&rt->rt.list, &net->mctp.routes);
+
+	return rt;
+}
+
 /* Convenience function for our test dst; release with mctp_test_dst_release()
  */
 void mctp_test_dst_setup(struct kunit *test, struct mctp_dst *dst,
diff --git a/net/mctp/test/utils.h b/net/mctp/test/utils.h
index 9405ca89d7032d65fbfb92503fbeb884ebd8bd25..f10d1d9066ccde53bbaf471ea79b87b1d94cd755 100644
--- a/net/mctp/test/utils.h
+++ b/net/mctp/test/utils.h
@@ -36,10 +36,15 @@ struct mctp_test_dev *mctp_test_create_dev_lladdr(unsigned short lladdr_len,
 						  const unsigned char *lladdr);
 void mctp_test_destroy_dev(struct mctp_test_dev *dev);
 
-struct mctp_test_route *mctp_test_create_route(struct net *net,
-					       struct mctp_dev *dev,
-					       mctp_eid_t eid,
-					       unsigned int mtu);
+struct mctp_test_route *mctp_test_create_route_direct(struct net *net,
+						      struct mctp_dev *dev,
+						      mctp_eid_t eid,
+						      unsigned int mtu);
+struct mctp_test_route *mctp_test_create_route_gw(struct net *net,
+						  unsigned int netid,
+						  mctp_eid_t eid,
+						  mctp_eid_t gw,
+						  unsigned int mtu);
 void mctp_test_dst_setup(struct kunit *test, struct mctp_dst *dst,
 			 struct mctp_test_dev *dev,
 			 struct mctp_test_pktqueue *tpq, unsigned int mtu);

-- 
2.34.1


