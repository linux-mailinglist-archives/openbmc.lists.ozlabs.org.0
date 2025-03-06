Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A67FDA55A08
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 23:44:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z84G30vnhz3fx5
	for <lists+openbmc@lfdr.de>; Fri,  7 Mar 2025 09:43:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.148.174 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741254112;
	cv=pass; b=QrQyPuW7Zb9wzl/wGvCoKtSSWUlAUWDu8JdhJUNEWv6UyqgtC0XAMxgUH59ETmgPZnyVD3udS5pG85ciU+0lvHJIWAa0BiNzxGr/SieIJUBRnhTyOQtOAtA7AceHnXdes+C3QKaBHq8Gco5a8mojz9ohBH31RWoaWi2MsCJJUAQrqBH3Q//vVcTevVnLDD5CGncgq/v+gOOs5GrYTNA1Y1bvMIOiz+M1wgvTFaYbOHEiMWXObJuuf+/26LYU6x/pihsL4M3Co1JDsABpjyKkDwajyoFiYmIv303CUB2Z5YDYzIbkafmLNYZiVdnz8yC0XPWz7KSmrnYoBuWVAf7WaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741254112; c=relaxed/relaxed;
	bh=G/axD57C7C5tBu9/xJIE+TXd8+6z7AZS3zYYKKoC1qk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L0KNCvASP5puXBTtGtcP5vb6/VJsnD1i3JxQ/0Q/hchA0SXjyd6Ux5RJRpQ95s+ru60sEVhMDa6xTOy9Lrky/BfN4sjEwRv2FCpFpmb9YAc7r3SK11RxojBxAQp8+gaaWe5NGRhlZQ6xG+svnXSW4cUKGId1gkqDDZWAK1Zm/iz9SJ3asUHKrHHoO2oFIYhN9IxvKbXlthz3I4WJMv4NJ+kcar3vhntM2fbEiphPDOZ8dzeWhnRFsOKLg6xb7teKSHmSlzUJRM9xcWcAzEnDtt4r58QuOqm21z6eRuDNf0qOLxlaM9GV/3EzeE2Riwa5q6yKzM/yToOQTsZdTbjOAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com; dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=iriqwd36; dkim-atps=neutral; spf=pass (client-ip=67.231.148.174; helo=mx0b-0016f401.pphosted.com; envelope-from=gcherian@marvell.com; receiver=lists.ozlabs.org) smtp.mailfrom=marvell.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=iriqwd36;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=marvell.com (client-ip=67.231.148.174; helo=mx0b-0016f401.pphosted.com; envelope-from=gcherian@marvell.com; receiver=lists.ozlabs.org)
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7kvz0mNjz30Pn;
	Thu,  6 Mar 2025 20:41:50 +1100 (AEDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5265et86029276;
	Thu, 6 Mar 2025 01:40:53 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4575rt0dq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 01:40:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZ78KpRbr9Ge50ZISkJhVe2ZrlbUfg8pgdynu9yGjFa+zcJtfiByUKo/nF/S2nzWQ1vENObnb9l9L2LF/eDj8CnBYHvCtsaLoLXnBs4cK9srQjKIUxo0Elk8kLCqOZccekSQZ8MvTlB17JE2dw/8DxZl436bUroYR8rpjwY3M6/VnvAYJycBMg8lUw3hZkaiSaqbz0VQDJsxrmVBOK9OJ6d/xNWMc+nUTmF8clfZUVxq0nRzsoP443YODSnxHAJAQCi4lFwyRNf7bjY4feSveyMRX/vJ8pmxm4Kr7JKeIANOaKDQQIcFJvaiTfF5v/sHfT2+bIuzQUAoVdKa20D53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/axD57C7C5tBu9/xJIE+TXd8+6z7AZS3zYYKKoC1qk=;
 b=aeQFG+5gu3XWbjXAnKk4liMlY16g0jwIe26EARhqhQCYwG76GETbrAJQ1BGZDsZco3n5wbvwAmvXehcJLk65gU03uok7C6lbS6dYnbTqaTFTUd7cZ9yOvD0d8ZMYn3XFj2GZGNXEBWJIu7Og8KzC1CHvtoaEdz1FYA/Ynpf9Fv/3EnlxEdiO1XJFNGgoANWTaxYz+heTbSMfkpz6h/Kibuq6mkwPNBBVCjWFpX2gFsZwvBBIsSXcYStKKNTo8qDU6dXV1yknLiJ3404S0aeU1JLYHyBm/rMh5alWO2UaFIJPZAi5qmGOu0Oi75hX1riJFvJpxZ+wpM+Lt80DsnhfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/axD57C7C5tBu9/xJIE+TXd8+6z7AZS3zYYKKoC1qk=;
 b=iriqwd363wjlIurFMxcYjANLR36oqs0gTRhLNTPLErtaTQe4iOuYMjbbBvy0vBNp6BPri3kwfQRWFYpKvr2aAQWQzb0nXDbIa04P5LTFpEf4AIOKcEzHIMmW2o6PSpY8daF6hXf3HrnOFjelA5AzEMEpbACndivM4rFAzH1JFtk=
Received: from PH8PR18MB5381.namprd18.prod.outlook.com (2603:10b6:510:254::16)
 by SJ0PR18MB4025.namprd18.prod.outlook.com (2603:10b6:a03:2ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 09:40:50 +0000
Received: from PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a]) by PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 09:40:50 +0000
From: George Cherian <gcherian@marvell.com>
To: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Thread-Topic: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Thread-Index: AQHbjnvYVnlb/qlDkk2wtjIAS1Ec5Q==
Date: Thu, 6 Mar 2025 09:40:50 +0000
Message-ID:  <PH8PR18MB538137DD102CAA420746CDB8C5CA2@PH8PR18MB5381.namprd18.prod.outlook.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <CAODwPW_3BCfTcTu=K+6Q3PMe8DtWTiKFHC6+HO2q+cTqs=EPAA@mail.gmail.com>
In-Reply-To:  <CAODwPW_3BCfTcTu=K+6Q3PMe8DtWTiKFHC6+HO2q+cTqs=EPAA@mail.gmail.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR18MB5381:EE_|SJ0PR18MB4025:EE_
x-ms-office365-filtering-correlation-id: bf4985b5-3ed2-4687-4b53-08dd5c92fb04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?ZzZjL2ZNNXVvemQ3UVBHM0FCSXRISkk3T2lYTEMwUzJaaW5OQlU1dWFxN00v?=
 =?utf-8?B?cXpTOTlNN05UaldXNGFMekp1aytBTWhrZFNpV0tmYTlJa2V5UTZ3QW1rd2ps?=
 =?utf-8?B?YlA3WGJWcnlraHNjZHlneXA2T2JQdzlleTlNYVpWOS9nZjk2K2FuaFpHTFA4?=
 =?utf-8?B?OWdaVkFXdWkxU3cvL251T1hYeTI1NmhwQU5sQmQ1NE1KdmIrTzNQZi92b25Y?=
 =?utf-8?B?cm5SMmF3TjN4OVp3Z1c2eUlKWUxrL1VYUFFWVFRQd2Z2ancyQm9Udkgxb3hp?=
 =?utf-8?B?czQ0M2toR0kwdnRJeXBuYmE4T205cndxc1NhbmFPd3A2QlJxSkcwMjRSN1lT?=
 =?utf-8?B?ditHMzlOOXpsWWhyc3FacitKTVFUZUt5eGtuM0FaWWp2a3hFeEh5bTdLbUll?=
 =?utf-8?B?YXRWMEJCZWdLb3dFb21WSlBkRTlKY2d1cjlZUmRkeGVVNit5cFd3MGNidlVU?=
 =?utf-8?B?NzVmeFFibnJQaGxCN3dTTmorem56bCttY0xjTUUxQ1JwVCtsNmY4YjR0VkJ0?=
 =?utf-8?B?OFNReFNLZ3dUeGl1Y25KL3U1MHZmZnFSQ05iaEdLc2FYd1VadmE5d3duTk1z?=
 =?utf-8?B?aFhiT2FwZDczSG51M3NKbTdkSUErdXdCQStiUTdLWEdJSnowclp1dXRjTTBE?=
 =?utf-8?B?cmxHNDNSWnlMNVUrTEZRYVdUMW52eXFpRktFRnFYNGIzL1kydnB5ZHhnUjgz?=
 =?utf-8?B?alJ3UnV5RXhOOE5XWU5LeHZyYmZPSWVHc1V1L0xtVHkxY1hxdkIyblBJckhP?=
 =?utf-8?B?TTlDZGNpZ01sNnBMK3ZtdFVvQWZHYXdWTjk3SXlzdFpkSkJDNzU2RkUwK1RY?=
 =?utf-8?B?b1BNc01PZHNSN0RScjlXR2xtWXNMRm5ISWhJdWY1NUFvMGg2RitIODdoSjZy?=
 =?utf-8?B?a0VlbUowdjV0N2pQQU5hUi9JNEF5eWpXUXNreFJvb21xbmRKM2pQYVBIMzhy?=
 =?utf-8?B?RkttZEJubFNRNXcrNU5YM3UvTWZ6VCt1RW5IQ2hxalR3bXRFL1BMWEM1RC9W?=
 =?utf-8?B?NFJkMEZwb00vR1lDOTVSWFh3NVgvRHhyUjhvQWZFSDZKaUdLRjc1MFlLM1NK?=
 =?utf-8?B?YmI4aHMxWWhsREJJSHJVaUZFcXlsTmkxRTlvdE82QzlYVHhVaktqdnNaM1dF?=
 =?utf-8?B?NnBIYW1GSkpZOEZxdVRoWWpRU2t2MzdWY2c3bmkxSThNOW4yZ2ptNzN3M2Qz?=
 =?utf-8?B?eU94NVlKS1lyUVZobVFvdzg3eEk1a2ZBZWRQYjFhb0VjWlFKMzBxcUlvVXQy?=
 =?utf-8?B?Ly9hZDY3d1JEUzZPbEFqMUlWOHFEbnhxR2ZLUUIxaVlZa01CdHZueW9PTDFV?=
 =?utf-8?B?cE9UbEdDNEtaZUJtcjRta0RLTjMzbFdIcUprTWttd3B5T2ZFUjBJcTI2Ymtk?=
 =?utf-8?B?ZHkrY29pZXZOSXRhMVlqbFUrTTNIcjFHR2l4MGtjZ3ZFNmhYZW80VE93NXVS?=
 =?utf-8?B?ZnZIM2tOMlZxR2JEZmRtYlh3N0s2UHZuRzJabDNDVVNIRDlXMHpEMEtJWEpF?=
 =?utf-8?B?dy8yVFhQdjRCYUY2MDZkd1ZuU0pjU3ZxWmZiMzBxbmdRSUxCaU42RXhYdDlW?=
 =?utf-8?B?RmFlSlQ0WjBDdGNZcWpMT1ZMY0VSR29vcTZpcG80QkxDMTZoT0lCdkVlTjAv?=
 =?utf-8?B?ajVWMkFZSlJObEloK1pLQkllV1NvTG53ODNXL3l3YnZtd3psWFFpOStNakdO?=
 =?utf-8?B?L3pET0J0Wnp1M2FLeFFpMkQ5UzhLdWhlQm5hc0JRVS9CQm1XODhacHV5bXhq?=
 =?utf-8?B?REgvSUlxNnRONVVMRXlVUm5kZGIxVjBsQnB0Qmw3Q2VQWmN4L2YyMjZQb28r?=
 =?utf-8?B?QzJLRExTd1M5M1JzMFplTTQ4ZjFOdXY3UHpGaUdKenpwWEl5WmdQdkpFc2ZX?=
 =?utf-8?B?dzZwN0NkcmY5KytiY3BTZjhDNnJhNG4wS21jUHlFZzY3TGI1alkzeG9CNWx6?=
 =?utf-8?Q?4I1lpXsWMWmYadG2mwybO+bb2dhb25u4?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR18MB5381.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZnREczY2T0pUNjlaR3JjVG1KY2JpN0Z0bENJQU03dnh6NjFnM1lqc1V3Snox?=
 =?utf-8?B?aTY3ajhndFR6dWwvSEw5SFp0ZHQxbEdKY1RlcHFSenR3dksyQVA3VTJKbzM0?=
 =?utf-8?B?MjVRWEtSdnlCRWIvT0lWV3VKUVlDME4zUjJrckZCQ3ZJdmFIYkxJZXl4Q05q?=
 =?utf-8?B?ZmZVZWtWSld5S3krYW1mOGpXQW1qbXRPWDI3S21tVXRPN0ttZXFZYWdsMERO?=
 =?utf-8?B?bnk0ZHJBaTN4KzFMZTNnbnlXSTMyZHJhblhFc2U0NHN5V0oxRS9UM2xvY2Y1?=
 =?utf-8?B?a1hGMDRTTkE1UDdUdUdub0ZnaWVXc3l5M0hiV1dmYVRpWEFOdlk0aGlPYnhO?=
 =?utf-8?B?NklpdzhUT3BMYXVINXlDTUhveHJpWHJBNFVUelhESzcvWUZieTE4YVdxSUg2?=
 =?utf-8?B?QUhFMlRMYmFZaHNHR245aHU0N253b3J3Wis1d3d3bTltVUVFSER4WHgxazJl?=
 =?utf-8?B?REwwaWJvdUdyUDJGNDE0bGhrbmxjMk40SlhSMjdMU3JqcDNNaGxZVWdLUHdw?=
 =?utf-8?B?TzhROStyb2EyK3JYVG42UjYwK3pwdkd2L3BYVElwaUVvN0JPVjBPN1JkRXND?=
 =?utf-8?B?SWlDRUNuQVhIc1dRenBQUjRLNnlNdDYydHJldUVLMHBuZE1tUHBoRHYxNjNv?=
 =?utf-8?B?N2pxSFZycHdpZkdMbU5sTWJ6dm9tL3B3WTlPZU43UkhCVU9WYkdDZndHZGFU?=
 =?utf-8?B?VFFPOHpycGJBcUNmRDhSTmJKWHcrUEw2L3hGQlBnbjFIbitvUlJsK1dXaHFW?=
 =?utf-8?B?SzJzNklxNjB0dHNlNjZsUkdVdjhBbGxGRG1mSC9iZXdoUlFPVnNsU1I1aWVz?=
 =?utf-8?B?Z3dLZnVZWXlta2JOWFVaKzNBTmpEbWdaUnRvdTVGanVCRzkwQ1J3M0F6akZv?=
 =?utf-8?B?TEF3Mm5JOEhMSy9HZytSc2pBR1o4NjhBVy9kK05BK0M5RXRzR09lNzFHQmZO?=
 =?utf-8?B?TGx1c2FHajFueEpBWjhyOXIzZGhRR09GY2JaVGdTcDV2bnZ5WXNOT0tDVVVy?=
 =?utf-8?B?Z2ZHRkozd0l4NVVLL0lteGV3cGhPQU5DWXFJQXhIYXJFaENLUFV3a2ZBcU5o?=
 =?utf-8?B?d1pWanpWbTF0VWpWQ3NRK0x2cUZTWFQ1Q3hHUk1TK1FWeWpLYmlROHRRNlBS?=
 =?utf-8?B?R3JONnRiNGtGQlNobk9vUzJkMk9seHUwek5QdGVoa0czOWVyVzZJNE5EY0l1?=
 =?utf-8?B?U09pNWJnUnR4QkJPellmbHNqaWtGcG5CRUlnQXRmU3paVEIrT21DS1R0MDRR?=
 =?utf-8?B?VFc3R0FabVVaRDFFTjFGdGIvTjhIMURzMmYvN3ovTlJnbzU4WXpaQmFOVXdX?=
 =?utf-8?B?eWhNQTRYWEJlYlZOUE5VS0dXLzhFR1FFb3hUZE9GeWFpQkZiUkU0dWQ4YTRU?=
 =?utf-8?B?d3VNME9EcWpNWjA5UTgxVVB3WUJCTktscENHRGovcnF2SFprQlVFc1RZWXI5?=
 =?utf-8?B?Y204TEpqR1BqS1JUQ2VEc2dMQjVuOGNEWlJQd2xOdk9scWhkNTNyZ25lWlR1?=
 =?utf-8?B?eERJeVIzNVVCRllJYXFKOHMyRlFpV2hPcjgvWitnOU5zbFpOaXZieTlGK2lQ?=
 =?utf-8?B?SENYejBHcHJhUE1CeWtqSkJ5aVFxTDZodDZYbmRsZjI5UTJqMXNJQndzbVBz?=
 =?utf-8?B?SXhWejZxM1pVRHoveUFjb0hCNTZkYjR5N3daakM4TDc0V2JFWXIwZWtqRkRp?=
 =?utf-8?B?enZvRWl3UStDaERNS1VNc1FPTmw5MU9YK3RFRHU2ZUlZSGMrV2gyQTl1am5V?=
 =?utf-8?B?UTFOakpOYnR2YWNlYm5ueXY3T2JRY1hINXFTQmlHa0RGME91dzdybUpaaWM3?=
 =?utf-8?B?Z3lOS0QyRWdqTVl6TFlmZGMvNGJBUEZTbFl1UFZPRmdHRXcvdS9qSjhpcG5v?=
 =?utf-8?B?a29OWGUzblFFQlIzdEZTdkZ0SGNZaEVKNFRtZGI3TzJoOTA4NTRDUjluNC95?=
 =?utf-8?B?eitpNW44WVZ4ZWNKUjVtaUJsTXVhMnRrTFFNQnVuUnpiRXZ4V1AzY20xTjN2?=
 =?utf-8?B?Q2pMZUQ5blN3alBYQ2ZObWd4Uy81QVlyU1FXUEtJMVBaaXo0eWYvN0xPeE4x?=
 =?utf-8?B?K2xaQTRqUzEzemJDU25RcXBNUHVVN1hJOUVSeVVnSDROVHNTU01oQlVSM29u?=
 =?utf-8?Q?Qcwx0DnZzV8+1QTKAYKybypuc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR18MB5381.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4985b5-3ed2-4687-4b53-08dd5c92fb04
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 09:40:50.2550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Ay5BdeIXZ04qkGrCZC1xT6iAH7zCQhpnVgyOSYFv5ziCXks3x4uOPSBS0bwRyrBFeVRNtzunLWb8l4iyBjS6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4025
X-Proofpoint-ORIG-GUID: zcFl36Y_OmmjQPjztYmhYFeKv_Q-mhZe
X-Authority-Analysis: v=2.4 cv=JrYLrN4C c=1 sm=1 tr=0 ts=67c96da4 cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=-AAbraWEqlQA:10 a=8bieXAUHvL3E47D2O4QA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: zcFl36Y_OmmjQPjztYmhYFeKv_Q-mhZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 07 Mar 2025 09:43:18 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "mwalle@kernel.org" <mwalle@kernel.org>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>, "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>, "paul@crapouillou.net" <paul@crapouillou.net>, "daniel@thingy.jp" <daniel@thingy.jp>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "festevam@gmail.com" <festevam@gmail.com>, "kabel@kernel.org" <kabel@kernel.org>, "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "benjaminfair@google.com" <benjaminfair@google.com>, "lma@chromium.org" <lma@chromium.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "krzk@kernel.org" <krzk@kernel.org>, "evanbenn@chromium.org" <evanbenn@chromium.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "naveen@kernel.org" <naveen@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>, "ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "bleung@chromium.org" <bleung@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andy@kernel.org" <andy@kernel.org>, "support.opensource@diasemi.com" <support.opensource@diasemi.com>, "andreas.werner@men.de" <andreas.werner@men.de>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "venture@google.com" <venture@google.com>, "romain.perier@gmail.com" <romain.perier@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSnVsaXVzLA0KPj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgd2F0Y2hkb2dfb3BzIGFkdl9lY193
ZHRfb3BzID0gew0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvYXJtX3NtY193ZHQu
YyBiL2RyaXZlcnMvd2F0Y2hkb2cvYXJtX3NtY193ZHQuYw0KPj4gaW5kZXggOGYzZDBjM2EwMDVm
Li43OTRjZjAwODY5MTIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2FybV9zbWNf
d2R0LmMNCj4+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvYXJtX3NtY193ZHQuYw0KPj4gQEAgLTkw
LDcgKzkwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB3YXRjaGRvZ19pbmZvIHNtY3dkX2luZm8g
PSB7DQo+PiAgICAgICAgIC5pZGVudGl0eSAgICAgICA9IERSVl9OQU1FLA0KPj4gICAgICAgICAu
b3B0aW9ucyAgICAgICAgPSBXRElPRl9TRVRUSU1FT1VUIHwNCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgV0RJT0ZfS0VFUEFMSVZFUElORyB8DQo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgIFdESU9GX01BR0lDQ0xPU0UsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgIFdESU9G
X01BR0lDQ0xPU0UgfA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBXRElPRl9TVE9QX01B
WVNMRUVQLA0KPj4gIH07DQo+DQo+SSBkb24ndCB0aGluayB0aGlzIGRyaXZlciBjYW4gc2xlZXAs
IHVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmc/DQoNClRoZSBvbmx5IHJlYXNvbiBJIGFkZGVk
IHRvIGF2b2lkIGFueSBpbmFkdmVydGVudCBoYW5nIGluIFRGLUEuDQpBbnl3YXlzIHRoZSBhcHBy
b2FjaCBpcyBnb2luZyB0byBjaGFuZ2Ugc28gdGhpcyBwYXRjaCBpcyBub3QgDQpuZWVkZWQgYW55
bW9yZS4NCj5gYXJtX3NtY2NjX3NtYygpYCBkb2VzIGEgc3luY2hyb25vdXMgY2FsbCBpbnRvIGZp
cm13YXJlIHRoYXQgYWx3YXlzDQo+cmV0dXJucyBiYWNrIHRvIHRoZSBjYWxsZXIuDQoNClRoYW5r
cyBmb3IgdGhlIGluc2lnaHQuDQotR2VvcmdlDQo=
