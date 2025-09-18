Return-Path: <openbmc+bounces-670-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57274B87294
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:37:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTSB4f13z3cdb;
	Fri, 19 Sep 2025 07:34:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231290;
	cv=pass; b=bry4bMPqrPCLhjhbVjys2jOhh6tRiDjhZZJkbjFrL1wm2Rt/crSpKzg3dGbzoP66TutEQUh7Y7eZBIHrDejDPru6Jw2FFLM/f+CeEopC+lKgc/ysWMjF2dWCh+PydplDhMVQnG/0csDOP5kLyRdSRGnatcw4h/Sf7Y4P8Egez9sj8mGx3PVdzyvr+nWSu/LcxaPtKzADbqJofbPpWfsHaoIvKANe7fPDGIouZwckgs2+qyklRZamJvtRxUwHt2z/3Co+D9SG60GWPVu1E5NbtX7A2GDTNEK/4tC9FbIguNrIZqaM3CCccLEzeHhQmPOyN9sCr5Iwr7cmxTR5o5Itmg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231290; c=relaxed/relaxed;
	bh=mzGevwWcBb6sJuLkJfDbRMqFnedU35t7SynZoSzqxfA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Wa5ONyTUGOZTquCA+0T13KUMmG61CPkAfhSLOJp9HhuLz3spxMd069+fG6c0x5EVT01xvO7x7o3+SFeH2l59jgR9v5LzvA4Vg+6WfiAUJT9+JcVWMICAQLeIUwfeSInORKlQZWoHs99GjnJa/kvZgFAGzmq21P1x9f8UPmRUNMEtHI+OGDS9mQYLuakKNMy68s3xfh2fT9hEjG2ekHnRx686bXskuWoaHRWiw59UMDq7UqIt3BnWUmLOSD3N0gNqz65rYQRp5I5uV9xOc4MJ0RON5K5jiX7dlbYcmlKEnqnw7g1z5FZuyRJMnqt0k6tl7eEgGVxaKYiOYsYAYhp0DQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NMxWS+6U; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NMxWS+6U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS860PQz3cf8
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRuikfSFlWTVm34IMUH6nQ+PcM0nbd/KhXAX719SFknM45cTp/FWmvlcoVs8D1wOVMTmfmgYjwyWMjY5TVga4v/pCJTqLlNfGSsHT3YwsXNP19bJvaPd4PHl4+Ldy2bWGNeS6ouyUNvmq+6DYLkgJs+gCgE3P/7P00KtjhRwaVhqNkJA938/qpsKwYNU8BjYSta6zD7/+XimJ7zOoKBbWsD08mZkCD80IUlC4n8Erc6501+ZHvCBEjAFWSeGr3Ttg9/r7N5WYBIcUA0gHXBXYhlaUwVC5thuE9A73nzOX5RjfWc/k1ek8Xu5sZ9FGnTsFyttmP19zxJ7JOQWm9x5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzGevwWcBb6sJuLkJfDbRMqFnedU35t7SynZoSzqxfA=;
 b=LW4Vs/0WkLU3ti0jckytocwG0pggs2Hr1LGbKz8q3sB4BfZG+T+t9OGVEgVDymYCYVAIa2JakYpsN1Z8lkwGWhlAxg6HDZuMOe6q1PjUSGvS3R/gh9QhP91S6V04iutqFOlqY3Kii3wvVcSQMQwTm013mBXUZq0N2A93HbiVfUtKoSIh91YPDZEG4iuliTtYimk+s/Gyv3ce/qxnYhCSJi0e7UgLG2iZSIItue1Se6Lq+a28cpchxHE5tLYwcRn9mwhj/AZU++LcQ5fJ72Fldry2xczk5ObwduAkY1p/yIvUTUyQzuEqhhmOK+jF9NN2Mb/c0sEIaNIL9zE5nFcpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzGevwWcBb6sJuLkJfDbRMqFnedU35t7SynZoSzqxfA=;
 b=NMxWS+6UKI3IYnUJoEUR7bB9cltIdCkOg/ovBnBQ0uCTVHEx3JWiLBi1bGNHKYSaXL03doRdxHMI9gMgTJu3mA0JGUcWhTQX1V2kY/ZCJrLhsZm9Q0XTZq9Ew6yqIOMIzVgb6lu/DHxEbCDkBCb79qdK5gXuTT5COF5zYXuqGdDknMwYH/W5fywdNl1z3EUosg3teaOY49ByGunFZnj8WmnKiWFE6BH2gewkRHx+iNGjO7AyliTyiLvq/CUSbDrvihyFqKzbbT8jXWfLE/1ngx0J2SEctj/dFNvZn50WwhjMibFnK4nySRv4EUR7xJfjF2jrpTcFg9MjWeAPJc4WAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:33 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:33 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:59 -0700
Subject: [PATCH linux dev-6.12 13/14] net: mctp: add gateway routing
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-13-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=16701;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=xHKzctxoFpfsW+3gX/CmxW7RfvLVAEblonabFXI/v0A=;
 b=AWCHeTWW2P2KvZtFolkj6U0eq6iELrD7B909PFvP+N4UPwzvRpxMj944/W1JjVdMLFmVjmjts
 8z/q41c6XiQDeMCqaHiHphlxxlSDb1R3bQzjdYyISmqsYquAqI1UbC+
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:303:87::21) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: c7700eff-0ec6-44f0-71d6-08ddf6fb2858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R09GZ09jRHQ3L2VNVFFqeUhCZzFXY0NuUlhRTXN3a3hjWURlMkt2Zk5LSHRz?=
 =?utf-8?B?UnFpYmZkWWhSQ3lMWDU3YTBuUEo3WkIySzgrK3VEV0ZuZFQvblRGdFE0L2lw?=
 =?utf-8?B?VUtlYjBhSDFnek9WdGhHTG9pek9sT2w4Qkk2SEJPMHRGa3J6QVg5K2RpL1V4?=
 =?utf-8?B?VWxwV1dmR3dmUUNkbVlIa08zUDF0TVRoZkRjQkYwYTdRMkxHV0ZYVHRoRzNY?=
 =?utf-8?B?cDdZNXJSU2NBbWJTOWRaTVJLTnd0MXFsMzA3dEZ6cGdHc3pnRWtIK2x6SU9D?=
 =?utf-8?B?ZGVWdHZ0djY4UGNpZXEyZ0FzRWlQTG5Felg3TGIvNjZVK3d3UERSQ2h1eVNt?=
 =?utf-8?B?QURUVlh0Z1R6eXluYXpRZjl4YTY1SngwZW1kbUZxU09ORU1BamhVZGJqaUE1?=
 =?utf-8?B?UE9JMkd6MXFWbU92M2Z4NzhjaUd4QUdzUDlNQSt0RDRtbzZQNklKVmlnWTBi?=
 =?utf-8?B?amhiRkQ0OEhCSW1HWUtBQkFhejFSTlBNU0FCamhXamlBNXArcXhVMDh1b3Fa?=
 =?utf-8?B?Si9JN2NWQ240Q2FxUWtrVllnZStaeTJHTWpDaSszSkZTb0NXcy9DNzZ3SHl3?=
 =?utf-8?B?dkNBdmRtRnJKY05PT3pjSTlJcDNkTytDWjN5dVp6ODRUakhKVCt3ZXNyaDll?=
 =?utf-8?B?Nk9sRXAxME83WFZGMEs1MVEwMU42UEdSVnFQd0YyMTliSDBFTkJjZFhIL0F4?=
 =?utf-8?B?bUV2NHdnUXR4MU5YU3NMTmNTMkgxRFgrdmoxekppS3gxeHpsUkdIQjdPQjJ0?=
 =?utf-8?B?bEJWTmNubjJTaTFGK29qMjZYSHhmdkNFRjQrV0VVQ0tuUmV3VmtiaG1PTEx6?=
 =?utf-8?B?SmU3K0piQ1N2U3lHbjdkbDlCN2EyQ2Fya09URUVQaEljVlV2aWM5VEt5MGZi?=
 =?utf-8?B?Wkh2RjYxNGJqUWtSb2ZmNTVNVTFmYmtsdVpXRktUTlI4TDlIYnFwUktvNjV5?=
 =?utf-8?B?Mi9hL1kzK3crYXlLRzUxQnVESjBkNmpKaFNGbDJqZ0dNSzMwSXlCZjBnanhp?=
 =?utf-8?B?eUJNNFNYMkVrc05PbEs0TzVCRFVjNUM5SWo3UW5WSS9nTHg0TWZyb3d2eUpo?=
 =?utf-8?B?djdyZDZHdkJhM1BRQnJDUTJiQXRhcGZlL3pEUkd0cFUyU0N4L1hwVjBRUWNq?=
 =?utf-8?B?alhFNGJGblluc2RxN21xcGJtaGRCVTZiY3I2Yy9uWmMydHVjT2Y3cFMzM0RD?=
 =?utf-8?B?SjNqQjZvVjFCOWJPdm53UWFvTHVkenY2UnZiUk5IcnUzSEtHZlN1Z3NYV2gz?=
 =?utf-8?B?Vnhyd3FlNC9iYXpPMk1aWnlyN1dFZlY3dUxZYW5zSUR5bHlpRnl4VnFVRC9C?=
 =?utf-8?B?VjVIQy9Lak95elgyb3FtYVpya2NCQVRmNDVtVFc4QzhKVVluakhCYkMrZkp4?=
 =?utf-8?B?TjFheWhjaUJqeW1uV2xoay9LUDc5b3Z6bTN2UFd1cUx6QmtoeDVVb2M5Njl6?=
 =?utf-8?B?Mm9iWnBDcTQvT2tiZ1RyYnd3ajNFazFIYWpQdlVPN29pQXl1MHpVMktIYU91?=
 =?utf-8?B?bEFqUllPZlRVMi9OcmVCbDdHQ1FpY1NGdWYxa1lEQzdaalFlZEI5OVRaTHQ5?=
 =?utf-8?B?L3h4SmgwaEtDWW1ZNEhvR0JQM0ZlU1dLTHZPb3Q3K3dDS212RWtJNEhjNTQz?=
 =?utf-8?B?RTFjK25YKzM1enFacXFiak1GVHRXdTVZWVEydFpUNU5VRGV3TGpxVjdYQVRt?=
 =?utf-8?B?eHp5dm50QXJDSGZMeVR1VVNMUzFLWVY2WGRiZUlEUWhqTW90bTZ6QTRJQXox?=
 =?utf-8?B?S20xR2RLbXIyaTNWOTQwQjNRRlhPYWhjTkx1Nmpnb0x2K2tWSFIzdmN3Qmoz?=
 =?utf-8?B?YlkyVFlOdUdweFhTNjRsUWZud2Q2d0kwUE51Z0lmVGFzZkJvc1cvK09CRFcz?=
 =?utf-8?B?aUM3TEFOYkRkM3BPc0ZtL3VFWkNYUTMwbTU5YnJTTjNKNjQzWDZxaG9HakNS?=
 =?utf-8?Q?ZfkLeVAIJhY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk1qclZFdTlpbGV3WGMyVHdaRTVHYndqWkRGc2xHbU4vU3RVaFFxVERiYm9U?=
 =?utf-8?B?bW5kMnpmWWxLSUNrdTBKOFVIQXVOK08xUTk1UHRNQUlkMHluR1pTbHU0U3pq?=
 =?utf-8?B?bTVUVXpJQ1YvUDNjRE9uWjNzY2ZRUGdUamx3ZzdlTXI5VFQ4dG4va3pmVEsr?=
 =?utf-8?B?eStnUXVkOE9VN1MzNmRTK2hEUUpmb1NWb3M5MnI1RUZ0MzIzakFXWHB5MHNC?=
 =?utf-8?B?NEJuZ3IvUUxzOFBpOXY3UDMrMDAreEFoMGtqelczcXJVQWFwZHNFT1lyUncy?=
 =?utf-8?B?ZUxtODZGU2NzaHVCSEdYZGV4azlUMEROY2RsTUlTMzdlelVjcmFscTRKQ3ZZ?=
 =?utf-8?B?VHExS25ORG52NFM0SVNnMHBxZXBpSTYybmlnUEJFWFUzdDE4a3B1UkFGaFJO?=
 =?utf-8?B?ZzZvTVdZSmljVmVWMGNpVWxua0hwbHhETitvNnZnZ3VvV2NZMllScVFYa2lF?=
 =?utf-8?B?dUtrd0QvTCt4N2VhTHZCVzdaWnFzUHBpeDMwd3pGNWErVXZhTjVqZmRKcnFa?=
 =?utf-8?B?YlF1eVU5NVVpMDZEd2VhbmF3V0lRQkpZYlF3aDZlbnFoUVd3OGFwRVlPZEh0?=
 =?utf-8?B?TTROaDh3NzJ0aUI3TkRZd1NhV0pQV0x0N1BGWEpDS1RwUEhjYmcrKzA1Vit5?=
 =?utf-8?B?elZlMkRvejZIazNlSHdIeC9aMjN2amM4V2FaZWVrcGFtSkg0NXBUbFVGWEFH?=
 =?utf-8?B?Zmt4M2M0SWx4VDFCUFVKQjRtR25qREVlcjJOTi8xR3hZWWJId1gvdDZmdm53?=
 =?utf-8?B?MUljSWZCbWNKWXB5cUZkZmpuTG1uYU9OM3pCQXFOL0ZVRkdRRzhWbkFjemJu?=
 =?utf-8?B?ai9Fa2JEV1VqMzVYQ3VvU3M3c3RYMHFpbjhsWmJ1WitDUmZZYUc3K1RkRDFX?=
 =?utf-8?B?M1FiZWtxdzVHREZaaGp4OHBQQmwxNWIyVHoxWUtNcXlja3ZJV0J4L216ckR4?=
 =?utf-8?B?bEpWSUk5cDA2dUJNaDQxbzF4RUVXeVhwSzdCRGl4RjROZG1Yc2R2SWpBTEhK?=
 =?utf-8?B?UnE5L2ZMRGtrdnkzVWM3WFdKL1JtNm9LcFFXTDVGNnl2WTllOHJlZEt6T1Mx?=
 =?utf-8?B?dFJVRmp5MFVNQWxZYnAyYmFtcW1HcW82bWlDdVBqOEsyTkNKYVY2UXl0TVpw?=
 =?utf-8?B?RGRHMnIvYmptbFQyeFFuNVl6cEJrN2VnQy96N2ZQYXErK1diNEtYUFBZeW4w?=
 =?utf-8?B?akRjM2R1ZkRFMjU2QlNiTXVic1ppRTVCS2hnbmVIcVNJTzhtaXlqTjcwNnpm?=
 =?utf-8?B?bGRJNWEyV3pINkZ4VjdsaGwrSFpxMW9UbXprOC9uQ3ZxbkZWa3d1dzhnenNX?=
 =?utf-8?B?aWlpU3Z0eHFKMUNUZ3pSS3o5d0ovMUcxYjZLdldWdzFTS1ZHRXhmUVFTVmZZ?=
 =?utf-8?B?MzQwd3BsUDRDZlhJL2tsYTJRVHRZWlJWN0V5RzRXRDQ5bUMzRUV3dFJJSEhW?=
 =?utf-8?B?MFRCdElacWRoR1BvRlk3MWs0c2g3VktiYjBxNGRTcVowZU1Vajk3c3A5RGJt?=
 =?utf-8?B?K0xyem1TSEZ4SFVsNTF4dG9DbFhVOU1iN1NkemtJTkRjR2JqbTRPYjR6MzJS?=
 =?utf-8?B?N2paNkh1TVRaU3N4NkQvQXhJSXFSRWJGMWZlUkdteE1Cci9ySDhWQ1Iwczdr?=
 =?utf-8?B?MnBSVEY4dGdnL3BLZmhhN0Z6c2tWbDMxQm83RzlLY0t0UnMwYmlkak9Ia0lG?=
 =?utf-8?B?d0diTCttWnV2Vkx1cmZpbTIyY25IZ09hRmtWN3RjMmJjWlBTVlJJOVJyc1kr?=
 =?utf-8?B?cXR5elN5eU1IZmhaMk9XWjFiMGZ4d0x6YWQ1RXJobFZmZWRZWHRMTjkwMndp?=
 =?utf-8?B?M3FwQkRZT2lrZmJlbnNlRS9Qdmx2dUNsRUZhYVlqeDhTMksvV0RvbS8ydjNK?=
 =?utf-8?B?U2Q5dlZYM1kyTTZmeFFSWWNmUUVGV1V3ZXhwemw3NjdSTHFLVnlQK3BuT3Bl?=
 =?utf-8?B?SUE2azgwenhoVjhYSmZVcVRGVTFscTF0TE90NWd1eXkxbXdzY0s0dDhwL041?=
 =?utf-8?B?eERqL04zWVFuTnNKamNaNkdIUXlFM2dIYksrd2RZeG5Fck9KblAxVEEzYmh0?=
 =?utf-8?B?YmZCdC9sWE11TXpCSkFxdUJMUzc3YWFQbDRXR1J6SzJYMm9YanFYY1M2T0xS?=
 =?utf-8?Q?xgEgWv4E5J3JzkF7rLDXsC10U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7700eff-0ec6-44f0-71d6-08ddf6fb2858
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:33.1792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaD7PLGE4p1GV43sGev7c8m2xtqM1ktKYdQSu2XIQ966NtcX3QCZDheRNgsfnatE14V0mlbpWiBbl8YnKS9BjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

This change allows for gateway routing, where a route table entry
may reference a routable endpoint (by network and EID), instead of
routing directly to a netdevice.

We add support for a RTM_GATEWAY attribute for netlink route updates,
with an attribute format of:

    struct mctp_fq_addr {
        unsigned int net;
        mctp_eid_t eid;
    }

- we need the net here to uniquely identify the target EID, as we no
longer have the device reference directly (which would provide the net
id in the case of direct routes).

This makes route lookups recursive, as a route lookup that returns a
gateway route must be resolved into a direct route (ie, to a device)
eventually. We provide a limit to the route lookups, to prevent infinite
loop routing.

The route lookup populates a new 'nexthop' field in the dst structure,
which now specifies the key for the neighbour table lookup on device
output, rather than using the packet destination address directly.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-13-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit ad39c12fcee34b8980a80ad5c803bca9906fbd4e)
---
 include/net/mctp.h        |  13 ++-
 include/uapi/linux/mctp.h |   8 ++
 net/mctp/route.c          | 206 +++++++++++++++++++++++++++++++++-------------
 net/mctp/test/utils.c     |   3 +-
 4 files changed, 173 insertions(+), 57 deletions(-)

diff --git a/include/net/mctp.h b/include/net/mctp.h
index 5dccf0ab751a12d14c534af8ab8eaa6b495d9f24..a396b09dc2e20c4ab2e5c3e99a4a85ad90fa3734 100644
--- a/include/net/mctp.h
+++ b/include/net/mctp.h
@@ -237,8 +237,18 @@ struct mctp_route {
 	mctp_eid_t		min, max;
 
 	unsigned char		type;
+
 	unsigned int		mtu;
-	struct mctp_dev		*dev;
+
+	enum {
+		MCTP_ROUTE_DIRECT,
+		MCTP_ROUTE_GATEWAY,
+	} dst_type;
+	union {
+		struct mctp_dev	*dev;
+		struct mctp_fq_addr gateway;
+	};
+
 	int			(*output)(struct mctp_dst *dst,
 					  struct sk_buff *skb);
 
@@ -256,6 +266,7 @@ struct mctp_route {
 struct mctp_dst {
 	struct mctp_dev *dev;
 	unsigned int mtu;
+	mctp_eid_t nexthop;
 
 	/* set for direct addressing */
 	unsigned char halen;
diff --git a/include/uapi/linux/mctp.h b/include/uapi/linux/mctp.h
index e1db65df9359fea810a876786b864743c77e2478..19ad12a0cd4b4599667519aaed73a12d2892aa25 100644
--- a/include/uapi/linux/mctp.h
+++ b/include/uapi/linux/mctp.h
@@ -37,6 +37,14 @@ struct sockaddr_mctp_ext {
 	__u8			smctp_haddr[MAX_ADDR_LEN];
 };
 
+/* A "fully qualified" MCTP address, which includes the system-local network ID,
+ * required to uniquely resolve a routable EID.
+ */
+struct mctp_fq_addr {
+	unsigned int	net;
+	mctp_eid_t	eid;
+};
+
 #define MCTP_NET_ANY		0x0
 
 #define MCTP_ADDR_NULL		0x00
diff --git a/net/mctp/route.c b/net/mctp/route.c
index 5eca3ce0ba3ceac2ea0567d4042a298abcf3c674..a20d6b11d4186b55cab9d76e367169ea712553c7 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -563,7 +563,6 @@ static int mctp_dst_input(struct mctp_dst *dst, struct sk_buff *skb)
 
 static int mctp_dst_output(struct mctp_dst *dst, struct sk_buff *skb)
 {
-	struct mctp_hdr *hdr = mctp_hdr(skb);
 	char daddr_buf[MAX_ADDR_LEN];
 	char *daddr = NULL;
 	int rc;
@@ -586,7 +585,7 @@ static int mctp_dst_output(struct mctp_dst *dst, struct sk_buff *skb)
 		daddr = dst->haddr;
 	} else {
 		/* If lookup fails let the device handle daddr==NULL */
-		if (mctp_neigh_lookup(dst->dev, hdr->dest, daddr_buf) == 0)
+		if (mctp_neigh_lookup(dst->dev, dst->nexthop, daddr_buf) == 0)
 			daddr = daddr_buf;
 	}
 
@@ -610,7 +609,8 @@ static int mctp_dst_output(struct mctp_dst *dst, struct sk_buff *skb)
 static void mctp_route_release(struct mctp_route *rt)
 {
 	if (refcount_dec_and_test(&rt->refs)) {
-		mctp_dev_put(rt->dev);
+		if (rt->dst_type == MCTP_ROUTE_DIRECT)
+			mctp_dev_put(rt->dev);
 		kfree_rcu(rt, rcu);
 	}
 }
@@ -799,10 +799,16 @@ static struct mctp_sk_key *mctp_lookup_prealloc_tag(struct mctp_sock *msk,
 }
 
 /* routing lookups */
+static unsigned int mctp_route_netid(struct mctp_route *rt)
+{
+	return rt->dst_type == MCTP_ROUTE_DIRECT ?
+		READ_ONCE(rt->dev->net) : rt->gateway.net;
+}
+
 static bool mctp_rt_match_eid(struct mctp_route *rt,
 			      unsigned int net, mctp_eid_t eid)
 {
-	return READ_ONCE(rt->dev->net) == net &&
+	return mctp_route_netid(rt) == net &&
 		rt->min <= eid && rt->max >= eid;
 }
 
@@ -811,16 +817,21 @@ static bool mctp_rt_compare_exact(struct mctp_route *rt1,
 				  struct mctp_route *rt2)
 {
 	ASSERT_RTNL();
-	return rt1->dev->net == rt2->dev->net &&
+	return mctp_route_netid(rt1) == mctp_route_netid(rt2) &&
 		rt1->min == rt2->min &&
 		rt1->max == rt2->max;
 }
 
-static void mctp_dst_from_route(struct mctp_dst *dst, struct mctp_route *route)
+/* must only be called on a direct route, as the final output hop */
+static void mctp_dst_from_route(struct mctp_dst *dst, mctp_eid_t eid,
+				unsigned int mtu, struct mctp_route *route)
 {
 	mctp_dev_hold(route->dev);
+	dst->nexthop = eid;
 	dst->dev = route->dev;
-	dst->mtu = route->mtu ?: READ_ONCE(dst->dev->dev->mtu);
+	dst->mtu = READ_ONCE(dst->dev->dev->mtu);
+	if (mtu)
+		dst->mtu = min(dst->mtu, mtu);
 	dst->halen = 0;
 	dst->output = route->output;
 }
@@ -854,6 +865,7 @@ int mctp_dst_from_extaddr(struct mctp_dst *dst, struct net *net, int ifindex,
 	dst->mtu = READ_ONCE(netdev->mtu);
 	dst->halen = halen;
 	dst->output = mctp_dst_output;
+	dst->nexthop = 0;
 	memcpy(dst->haddr, haddr, halen);
 
 	rc = 0;
@@ -868,24 +880,54 @@ void mctp_dst_release(struct mctp_dst *dst)
 	mctp_dev_put(dst->dev);
 }
 
+static struct mctp_route *mctp_route_lookup_single(struct net *net,
+						   unsigned int dnet,
+						   mctp_eid_t daddr)
+{
+	struct mctp_route *rt;
+
+	list_for_each_entry_rcu(rt, &net->mctp.routes, list) {
+		if (mctp_rt_match_eid(rt, dnet, daddr))
+			return rt;
+	}
+
+	return NULL;
+}
+
 /* populates *dst on successful lookup, if set */
 int mctp_route_lookup(struct net *net, unsigned int dnet,
 		      mctp_eid_t daddr, struct mctp_dst *dst)
 {
+	const unsigned int max_depth = 32;
+	unsigned int depth, mtu = 0;
 	int rc = -EHOSTUNREACH;
-	struct mctp_route *rt;
 
 	rcu_read_lock();
 
-	list_for_each_entry_rcu(rt, &net->mctp.routes, list) {
-		/* TODO: add metrics */
-		if (!mctp_rt_match_eid(rt, dnet, daddr))
-			continue;
+	for (depth = 0; depth < max_depth; depth++) {
+		struct mctp_route *rt;
 
-		if (dst)
-			mctp_dst_from_route(dst, rt);
-		rc = 0;
-		break;
+		rt = mctp_route_lookup_single(net, dnet, daddr);
+		if (!rt)
+			break;
+
+		/* clamp mtu to the smallest in the path, allowing 0
+		 * to specify no restrictions
+		 */
+		if (mtu && rt->mtu)
+			mtu = min(mtu, rt->mtu);
+		else
+			mtu = mtu ?: rt->mtu;
+
+		if (rt->dst_type == MCTP_ROUTE_DIRECT) {
+			if (dst)
+				mctp_dst_from_route(dst, daddr, mtu, rt);
+			rc = 0;
+			break;
+
+		} else if (rt->dst_type == MCTP_ROUTE_GATEWAY) {
+			daddr = rt->gateway.eid;
+		}
 	}
 
 	rcu_read_unlock();
@@ -902,10 +944,13 @@ static int mctp_route_lookup_null(struct net *net, struct net_device *dev,
 	rcu_read_lock();
 
 	list_for_each_entry_rcu(rt, &net->mctp.routes, list) {
-		if (rt->dev->dev != dev || rt->type != RTN_LOCAL)
+		if (rt->dst_type != MCTP_ROUTE_DIRECT || rt->type != RTN_LOCAL)
+			continue;
+
+		if (rt->dev->dev != dev)
 			continue;
 
-		mctp_dst_from_route(dst, rt);
+		mctp_dst_from_route(dst, 0, 0, rt);
 		rc = 0;
 		break;
 	}
@@ -1085,11 +1130,6 @@ int mctp_local_output(struct sock *sk, struct mctp_dst *dst,
 	return rc;
 }
 
-static unsigned int mctp_route_netid(struct mctp_route *rt)
-{
-	return rt->dev->net;
-}
-
 /* route management */
 
 /* mctp_route_add(): Add the provided route, previously allocated via
@@ -1097,9 +1137,9 @@ static unsigned int mctp_route_netid(struct mctp_route *rt)
  * hold on rt->dev for usage in the route table. On failure a caller will want
  * to mctp_route_release().
  *
- * We expect that the caller has set rt->type, rt->min, rt->max, rt->dev and
- * rt->mtu, and that the route holds a reference to rt->dev (via mctp_dev_hold).
- * Other fields will be populated.
+ * We expect that the caller has set rt->type, rt->dst_type, rt->min, rt->max,
+ * rt->mtu and either rt->dev (with a reference held appropriately) or
+ * rt->gateway. Other fields will be populated.
  */
 static int mctp_route_add(struct net *net, struct mctp_route *rt)
 {
@@ -1108,7 +1148,10 @@ static int mctp_route_add(struct net *net, struct mctp_route *rt)
 	if (!mctp_address_unicast(rt->min) || !mctp_address_unicast(rt->max))
 		return -EINVAL;
 
-	if (!rt->dev)
+	if (rt->dst_type == MCTP_ROUTE_DIRECT && !rt->dev)
+		return -EINVAL;
+
+	if (rt->dst_type == MCTP_ROUTE_GATEWAY && !rt->gateway.eid)
 		return -EINVAL;
 
 	switch (rt->type) {
@@ -1177,6 +1220,7 @@ int mctp_route_add_local(struct mctp_dev *mdev, mctp_eid_t addr)
 
 	rt->min = addr;
 	rt->max = addr;
+	rt->dst_type = MCTP_ROUTE_DIRECT;
 	rt->dev = mdev;
 	rt->type = RTN_LOCAL;
 
@@ -1203,7 +1247,7 @@ void mctp_route_remove_dev(struct mctp_dev *mdev)
 
 	ASSERT_RTNL();
 	list_for_each_entry_safe(rt, tmp, &net->mctp.routes, list) {
-		if (rt->dev == mdev) {
+		if (rt->dst_type == MCTP_ROUTE_DIRECT && rt->dev == mdev) {
 			list_del_rcu(&rt->list);
 			/* TODO: immediate RTM_DELROUTE */
 			mctp_route_release(rt);
@@ -1296,21 +1340,28 @@ static const struct nla_policy rta_mctp_policy[RTA_MAX + 1] = {
 	[RTA_DST]		= { .type = NLA_U8 },
 	[RTA_METRICS]		= { .type = NLA_NESTED },
 	[RTA_OIF]		= { .type = NLA_U32 },
+	[RTA_GATEWAY]		= NLA_POLICY_EXACT_LEN(sizeof(struct mctp_fq_addr)),
 };
 
 static const struct nla_policy rta_metrics_policy[RTAX_MAX + 1] = {
 	[RTAX_MTU]		= { .type = NLA_U32 },
 };
 
-/* base parsing; common to both _lookup and _populate variants */
+/* base parsing; common to both _lookup and _populate variants.
+ *
+ * For gateway routes (which have a RTA_GATEWAY, and no RTA_OIF), we populate
+ * *gatweayp. for direct routes (RTA_OIF, no RTA_GATEWAY), we populate *mdev.
+ */
 static int mctp_route_nlparse_common(struct net *net, struct nlmsghdr *nlh,
 				     struct netlink_ext_ack *extack,
 				     struct nlattr **tb, struct rtmsg **rtm,
 				     struct mctp_dev **mdev,
+				     struct mctp_fq_addr *gatewayp,
 				     mctp_eid_t *daddr_start)
 {
+	struct mctp_fq_addr *gateway = NULL;
+	unsigned int ifindex = 0;
 	struct net_device *dev;
-	unsigned int ifindex;
 	int rc;
 
 	rc = nlmsg_parse(nlh, sizeof(struct rtmsg), tb, RTA_MAX,
@@ -1326,11 +1377,44 @@ static int mctp_route_nlparse_common(struct net *net, struct nlmsghdr *nlh,
 	}
 	*daddr_start = nla_get_u8(tb[RTA_DST]);
 
-	if (!tb[RTA_OIF]) {
-		NL_SET_ERR_MSG(extack, "ifindex missing");
+	if (tb[RTA_OIF])
+		ifindex = nla_get_u32(tb[RTA_OIF]);
+
+	if (tb[RTA_GATEWAY])
+		gateway = nla_data(tb[RTA_GATEWAY]);
+
+	if (ifindex && gateway) {
+		NL_SET_ERR_MSG(extack,
+			       "cannot specify both ifindex and gateway");
+		return -EINVAL;
+
+	} else if (ifindex) {
+		dev = __dev_get_by_index(net, ifindex);
+		if (!dev) {
+			NL_SET_ERR_MSG(extack, "bad ifindex");
+			return -ENODEV;
+		}
+		*mdev = mctp_dev_get_rtnl(dev);
+		if (!*mdev)
+			return -ENODEV;
+		gatewayp->eid = 0;
+
+	} else if (gateway) {
+		if (!mctp_address_unicast(gateway->eid)) {
+			NL_SET_ERR_MSG(extack, "bad gateway");
+			return -EINVAL;
+		}
+
+		gatewayp->eid = gateway->eid;
+		gatewayp->net = gateway->net != MCTP_NET_ANY ?
+			gateway->net :
+			READ_ONCE(net->mctp.default_net);
+		*mdev = NULL;
+
+	} else {
+		NL_SET_ERR_MSG(extack, "no route output provided");
 		return -EINVAL;
 	}
-	ifindex = nla_get_u32(tb[RTA_OIF]);
 
 	*rtm = nlmsg_data(nlh);
 	if ((*rtm)->rtm_family != AF_MCTP) {
@@ -1343,16 +1427,6 @@ static int mctp_route_nlparse_common(struct net *net, struct nlmsghdr *nlh,
 		return -EINVAL;
 	}
 
-	dev = __dev_get_by_index(net, ifindex);
-	if (!dev) {
-		NL_SET_ERR_MSG(extack, "bad ifindex");
-		return -ENODEV;
-	}
-
-	*mdev = mctp_dev_get_rtnl(dev);
-	if (!*mdev)
-		return -ENODEV;
-
 	return 0;
 }
 
@@ -1366,24 +1440,34 @@ static int mctp_route_nlparse_lookup(struct net *net, struct nlmsghdr *nlh,
 				     unsigned int *daddr_extent)
 {
 	struct nlattr *tb[RTA_MAX + 1];
+	struct mctp_fq_addr gw;
 	struct mctp_dev *mdev;
 	struct rtmsg *rtm;
 	int rc;
 
 	rc = mctp_route_nlparse_common(net, nlh, extack, tb, &rtm,
-				       &mdev, daddr_start);
+				       &mdev, &gw, daddr_start);
 	if (rc)
 		return rc;
 
-	*netid = mdev->net;
+	if (mdev) {
+		*netid = mdev->net;
+	} else if (gw.eid) {
+		*netid = gw.net;
+	} else {
+		/* bug: _nlparse_common should not allow this */
+		return -1;
+	}
+
 	*type = rtm->rtm_type;
 	*daddr_extent = rtm->rtm_dst_len;
 
 	return 0;
 }
 
-/* Full route parse for RTM_NEWROUTE: populate @rt. On success, the route will
- * hold a reference to the dev.
+/* Full route parse for RTM_NEWROUTE: populate @rt. On success,
+ * MCTP_ROUTE_DIRECT routes (ie, those with a direct dev) will hold a reference
+ * to that dev.
  */
 static int mctp_route_nlparse_populate(struct net *net, struct nlmsghdr *nlh,
 				       struct netlink_ext_ack *extack,
@@ -1392,6 +1476,7 @@ static int mctp_route_nlparse_populate(struct net *net, struct nlmsghdr *nlh,
 	struct nlattr *tbx[RTAX_MAX + 1];
 	struct nlattr *tb[RTA_MAX + 1];
 	unsigned int daddr_extent;
+	struct mctp_fq_addr gw;
 	mctp_eid_t daddr_start;
 	struct mctp_dev *dev;
 	struct rtmsg *rtm;
@@ -1399,7 +1484,7 @@ static int mctp_route_nlparse_populate(struct net *net, struct nlmsghdr *nlh,
 	int rc;
 
 	rc = mctp_route_nlparse_common(net, nlh, extack, tb, &rtm,
-				       &dev, &daddr_start);
+				       &dev, &gw, &daddr_start);
 	if (rc)
 		return rc;
 
@@ -1425,8 +1510,15 @@ static int mctp_route_nlparse_populate(struct net *net, struct nlmsghdr *nlh,
 	rt->min = daddr_start;
 	rt->max = daddr_start + daddr_extent;
 	rt->mtu = mtu;
-	rt->dev = dev;
-	mctp_dev_hold(rt->dev);
+	if (gw.eid) {
+		rt->dst_type = MCTP_ROUTE_GATEWAY;
+		rt->gateway.eid = gw.eid;
+		rt->gateway.net = gw.net;
+	} else {
+		rt->dst_type = MCTP_ROUTE_DIRECT;
+		rt->dev = dev;
+		mctp_dev_hold(rt->dev);
+	}
 
 	return 0;
 }
@@ -1446,7 +1538,8 @@ static int mctp_newroute(struct sk_buff *skb, struct nlmsghdr *nlh,
 	if (rc < 0)
 		goto err_free;
 
-	if (rt->dev->dev->flags & IFF_LOOPBACK) {
+	if (rt->dst_type == MCTP_ROUTE_DIRECT &&
+	    rt->dev->dev->flags & IFF_LOOPBACK) {
 		NL_SET_ERR_MSG(extack, "no routes to loopback");
 		rc = -EINVAL;
 		goto err_free;
@@ -1505,7 +1598,6 @@ static int mctp_fill_rtinfo(struct sk_buff *skb, struct mctp_route *rt,
 	hdr->rtm_tos = 0;
 	hdr->rtm_table = RT_TABLE_DEFAULT;
 	hdr->rtm_protocol = RTPROT_STATIC; /* everything is user-defined */
-	hdr->rtm_scope = RT_SCOPE_LINK; /* TODO: scope in mctp_route? */
 	hdr->rtm_type = rt->type;
 
 	if (nla_put_u8(skb, RTA_DST, rt->min))
@@ -1522,13 +1614,17 @@ static int mctp_fill_rtinfo(struct sk_buff *skb, struct mctp_route *rt,
 
 	nla_nest_end(skb, metrics);
 
-	if (rt->dev) {
+	if (rt->dst_type == MCTP_ROUTE_DIRECT) {
+		hdr->rtm_scope = RT_SCOPE_LINK;
 		if (nla_put_u32(skb, RTA_OIF, rt->dev->dev->ifindex))
 			goto cancel;
+	} else if (rt->dst_type == MCTP_ROUTE_GATEWAY) {
+		hdr->rtm_scope = RT_SCOPE_UNIVERSE;
+		if (nla_put(skb, RTA_GATEWAY,
+			    sizeof(rt->gateway), &rt->gateway))
+			goto cancel;
 	}
 
-	/* TODO: conditional neighbour physaddr? */
-
 	nlmsg_end(skb, nlh);
 
 	return 0;
diff --git a/net/mctp/test/utils.c b/net/mctp/test/utils.c
index 6b4dc40d882c912575e28dfd8f2e730bf346885f..97b05e340586f69d8ba04c970b0ee88391db006a 100644
--- a/net/mctp/test/utils.c
+++ b/net/mctp/test/utils.c
@@ -134,6 +134,7 @@ struct mctp_test_route *mctp_test_create_route(struct net *net,
 	rt->rt.max = eid;
 	rt->rt.mtu = mtu;
 	rt->rt.type = RTN_UNSPEC;
+	rt->rt.dst_type = MCTP_ROUTE_DIRECT;
 	if (dev)
 		mctp_dev_hold(dev);
 	rt->rt.dev = dev;
@@ -176,7 +177,7 @@ void mctp_test_route_destroy(struct kunit *test, struct mctp_test_route *rt)
 	list_del_rcu(&rt->rt.list);
 	rtnl_unlock();
 
-	if (rt->rt.dev)
+	if (rt->rt.dst_type == MCTP_ROUTE_DIRECT && rt->rt.dev)
 		mctp_dev_put(rt->rt.dev);
 
 	refs = refcount_read(&rt->rt.refs);

-- 
2.34.1


