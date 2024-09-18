Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8844B97BAE7
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 12:33:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7w3556kGz3c5J
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 20:33:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::704" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726655582;
	cv=pass; b=YHCs5u/h+fqRkfU0bzinEw6aOwNK06Abl86f6YrXIGqSApokcGWmo3YTiiUAEoF8G9pk09ofuzLLtJGBEocszzhZ4hcQbZhnmcJOhS9tNepvm3msRe7hHqNtODaYr0VRpFDGGFdm0frv7KKf9e6TDOBoKVgtEiFHjsFb2s/IiUZOTlX0C9pg+macypYJYxmFFABq1ns8dprzAwXOwA6ScCcmf4eswAOIP+8t9Yvd8qK7R+pPEaZ9wqlyJh3GAcE0Ff6vJItFaSMTtT7lYg70p0m1pZa/etdMMa2T0WaF5MfCjuOzp4GuaU/xsQZw0ugQ+bRFWgJ+IY9iA/YXi6Hk6g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726655582; c=relaxed/relaxed;
	bh=4LAEuO6t+y/rm83P/tOAmHjHkFbzfaDBCm9h8g6miE4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=M5foJwM18vAwo+y2mP9ChhOoVRKfPX1TC7u6pU2/oLBA3vh2aAJts7U+PG0Eg/i98edoVJw/RYBwpQZxXZfZ02iTao3QWa0bN4XtS6uFPhZ9jZZXxcwHRuod3cecWWf0CTyibhMc5sNcQ4s5qg79mChQjy6JWtHmsAS/fQpqUV+e9AGESf+4zTfWPPZyZjThHeT1gTeK2dAc1sW17MPkU53KKwBqM6ecrVUUtERQd+rPnjLXtwnQ8LJpRhRtoFgukF9rZHReX1bzXRh8wj9DDSjUsNBiADtKL5xhttwexD4Ysj7dE/+gt44sG/aj+1+KtX5iLFgWZOK61ykLlRnURQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=uofj4rqE; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::704; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=uofj4rqE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2418::704; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20704.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7w302h5wz2yFK
	for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2024 20:32:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0IFIXUsJ5h6kNHT0nNfV31ZoYQkdYmyeMvnscyU++KziqC1AyQA/sLBvS3wYkKN1fVhVTO/7iV37QRA+sk+47AIHl9N02GjNF/SW3YYcJMxmd8PDFGv3VzqDXzJzI9kd1uGD15x2GsgKjqn3C8X9FwvjWkssbvVbt6c4OvoJZLOZ3pk8w/gC0TKezHyHZv9SrjUkOcOyds90BK4QescOKEA1aYQIwi+/yOmujVNLSYAkRuUgOtrZ3cM5HeTvCZmtgf+H2xjJ415ZjLVll7OH5/xrRBOe0I/A9dWNNUdZ4/sWFmKnySNd9mFkY+hZ7++YXVQhYuwcUOyIhS0ysgMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LAEuO6t+y/rm83P/tOAmHjHkFbzfaDBCm9h8g6miE4=;
 b=dtSnyXV+4VseRGwVAyMaKLmhoTPj/h6C3GozqiJbmdpQA5H1P+Gc/G10hWosEFqdNXZAUeSKFim8j8EnAxet5wJlPa7kiVUeRG9M/dH/tFzIp+AC5PBEMNyzAtetHYBm7nZLmx68sZUEDFmVmI7eONnpACMxBl5lFKF0i9HwazMtzjIrvrjpZMr5QvKjTA61fc+aTFIV3DPWYDrfq6RgY6FaLHKYsDrrfMCZLbo3grnLpB+xflD1kIBOwndc97MO0uHpjVuSvcRWwy4EI+J9fHySOHuCiV/HIuMLXzMST03iyx0hJa50Q4gSQ2pOgm4pVRLYUxVfLlkQHQaTAAJCiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LAEuO6t+y/rm83P/tOAmHjHkFbzfaDBCm9h8g6miE4=;
 b=uofj4rqEGT761vI3V1acL+HP3RMcKo/2LdpxPqxu33uAO23cttQnSK00+6KNxKFxaJlzgg/+ZQEmEJ7Tt+iCuZKVqQdBGhc7Nunt3/Mapbv+2O3m3xOzD1kXxBEN3uMQwCdm3qTTt5t+5QgRAQNUeP/mEK2wAMoJd4pUhowdSbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB6735.prod.exchangelabs.com (2603:10b6:806:18b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.25; Wed, 18 Sep 2024 10:32:39 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 10:32:38 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH] dt-bindings: hwmon: Add adt7462
Date: Wed, 18 Sep 2024 10:32:12 +0000
Message-ID: <20240918103212.591204-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SA1PR01MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 93802824-f29d-4a66-2bc1-08dcd7cd37a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?ZeAyDkDmDSj7nt9XWltBQTRtN4/UhferiFX9wLL2iAbzxM2ANVUAlHXhqtIP?=
 =?us-ascii?Q?PnnQ0GzZkt+BJflXJIP/TxiUaoVNnZizCvhnqJmRNiNZzeW1eSCtwUnO5gKv?=
 =?us-ascii?Q?SU/h7NkikOfgg5VPkSKIY5VDzJldy1QWoqRsGMxNIH49gAXkxuLB8hAqbqNF?=
 =?us-ascii?Q?xHEa7zPDnir3A2QuxzHLgEQrmx/QP3vMLv6vQBDgnRlVNhPCGijU5x6ufJJn?=
 =?us-ascii?Q?aITXZ/KJXP6dkf81T2FVqysaY0yAueoHjfGL2MalM+wvHT01nbvoiyP9UM3f?=
 =?us-ascii?Q?yBWvLWu9k5tFwduk5ab8Z81spcsUKZthYNenRMC9yJCsqIa7ell+IvSxgwLn?=
 =?us-ascii?Q?Af8nwSHHSLtdAVUOUI6zconeiuWn6AWbWkdJO/Mlx7sBpx0zeMcfz+2iN+uy?=
 =?us-ascii?Q?5jS05A43FDjwIF7VYV77Onc94B/9QOVXAi/Pyfpsu2Vq3WhMKM2sourunYE6?=
 =?us-ascii?Q?dBN3vWuWhpYEZU8LyUfCDo4O9kM/0MG7M9a8ePbtY1AQK/9fmitMffRS4lbH?=
 =?us-ascii?Q?JfAublSD8G8GQI805XwrCBoAqNBr7LuhsPG/ER7a0ekv80hyuzfgrjpCbNTb?=
 =?us-ascii?Q?Pj0AD5KWBc8kVmPJCICeXzqrNEmwQx1/FI+fbsMl6euuuZ4yEbkzgbBnoLxt?=
 =?us-ascii?Q?VhC8D3OvsWvXeifcLDb/nEFiyK9cV0UzBh1h7xGSkegohL7EGPnWhHgIfn0f?=
 =?us-ascii?Q?gxeTsNnz/Tyo2RL9EN+ZBBe2iN9RKzZMZInsnwf+83Xkh5RHMMNjavcgfzPG?=
 =?us-ascii?Q?iNPbKzohi7CU1IiU+fiuHXXhqEoIIsOjHlCpxRwNLtbIASW8wMK/2yevPJJB?=
 =?us-ascii?Q?z54SahYpNtQBKsaFWYr43NEbbAcXZA1/sNt7ryeNpoNvM5i6Fe5O4DQlOqcn?=
 =?us-ascii?Q?M478S+rwQ8wRKzPL/M+GSVETxKm1WwjF3oTcVn5PHSDuSuhP9t2bkpANk9Tf?=
 =?us-ascii?Q?DVgyX547+He42s7Oj5SDtq1cuzDw6ifPQ1pSRyFP+N7h72yiYR5oIGchVJ0O?=
 =?us-ascii?Q?fes8jdY84dvZCHKn5A8FOdcYte3axrcL/ONIipHBsNZbPZCXZrEG4h1gL4MS?=
 =?us-ascii?Q?0cQ3ufM68Oj74CMjbw45P3lCEuXA1V8d4OVZG4PdqR/cozpovXFPihCAOnFQ?=
 =?us-ascii?Q?3yCriKuvWAJGwzhR3IYXNnuKRZW6oDcgR6Vim+dbli+NqkOpuwB8VmBQnFor?=
 =?us-ascii?Q?44yvD5lgXLqrPjEYg02LJA3QoFN1G6+n5QoLnH1fHZmfFke4bq+rGpXasLAr?=
 =?us-ascii?Q?0qB4zL6dE+25OSxweK3ws2J8CsGYIpL5XX7cZvi1wBZHVdQxwqHBv6RCvdiL?=
 =?us-ascii?Q?t3/xlElwMJKGcvLtNEQ0I4qsPEb0DfEsdQnbhexaFAwol5yUlZf6EpDSmPTp?=
 =?us-ascii?Q?9YVwT3u+2SM8TzPwewHEDdQqfkhs?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?miDtoj3bXzDFeqHaMt1qJZzAD7KRxza2Eu/wcUBfKQwwB2uA/P+dX1SvIvv7?=
 =?us-ascii?Q?ZZkNF9Yt1S0IuKBkj9SSUGKCdGr1849OL3EdVyUtmX3UEuFRlLXczNsViYkM?=
 =?us-ascii?Q?MTjDFDTr62xY1sarSAQ1CJTMeuBla++EzYphB9R5tw/oZjnLOUg/Lf0aKeYS?=
 =?us-ascii?Q?j4p1TtSCPSbuJdgwyH1+HGKQ9ZA5cThwS79YK0B3ixYB9cWDBSVndUQvy4tq?=
 =?us-ascii?Q?grPkpYlttaMKmSFP+X4VdGciZsP1H0RJuNzdxpHAn2Ux7K1hKpyetHyfkd4B?=
 =?us-ascii?Q?rO6VfV5Zqg4AM5RNVI8qLBEicL45TDluzz8+basAwDJnzB7iOPQwNW8x18qt?=
 =?us-ascii?Q?xAJiNmI/QiQPf8jeL6duCcjnl1LJvlfuKyIiOswsKaJ494I1kRf6p36s19MF?=
 =?us-ascii?Q?IEjs8i7Hs7LBpuN2P0JAzhLCZwfTdov4iPDbDQWikjIqowBmR1CZp25VYL7m?=
 =?us-ascii?Q?YCGsZOMMpeTOilp1PrxRhoD1A9CmSliATcZSt4+WCLRK04rRcgjiNZ6/4GDi?=
 =?us-ascii?Q?gN3JlmOatC7ZE1f4oE+HM3zF44Dd8ZRjy869wLoPwOq7/33ukR0R94jw3acm?=
 =?us-ascii?Q?IUKdVGyitUOuOul7VNB8q5j5WdcVVGOu1FEtR3yDkIVMhBp5Pn9/Wrj+lXR6?=
 =?us-ascii?Q?PUN/2jr21W8VumBMasLdN9vrvPkFAZzwUiJWoqQa5bOAWJxt3/ptypyLBYYO?=
 =?us-ascii?Q?9fqW5qya7LowuWSBr6gdSt+6Jk2FAN14+7o18dmbenOPulivLS78ThBITwhr?=
 =?us-ascii?Q?Q9UDtZ+IQVbgVMI9OBDpmDp7JS5d06/9y3kzsngnX97hYYjTy4n0nvg4Dcyy?=
 =?us-ascii?Q?9xIOqKQY2brf9LUUq5KoBxRcKmuo08WHC8F/92zccBURO3/JId2iMHpf9jPW?=
 =?us-ascii?Q?q5Ll6cuBzIk1vew1tvRFeFDp7A9YysW1DAZCCFnMMDaUv90h16hQ0mlfBkKV?=
 =?us-ascii?Q?VywQjahTT/B0RmwIetcYZzLpeFLIRUxm5WfPcj+N4heo5lKLtqb+kQcB+G1S?=
 =?us-ascii?Q?mrxwOBWrRUuL8C4ULvH3uYmKluvnFHPo4Ai5sygoWU5TrBsRZrx8tdFiWLCx?=
 =?us-ascii?Q?F3jKE/UXdFOtjGz1PYg7MasIwddMaGRWLrJRVnYaGMKfHDEzFHnfeANZCpMT?=
 =?us-ascii?Q?K3RN5O7bfFDbAiAG4PRz1xPVjdYg8Xn568KHQ+doXt+vmDkwczLj31k9tear?=
 =?us-ascii?Q?uvVv2gy3fZrQsyqtIIY+9bb1BykU3oadrsajfh/a7Go5cbPnLJKE9+ZLEQB7?=
 =?us-ascii?Q?SgHEt+//twn+wma0g7uBOnWhkUPfBtTk8/lN//CKagiFNLWmiL99Iz1GZoDQ?=
 =?us-ascii?Q?K9olxobHVEzzj0/S8gcBLexs2mmUbham4N3psVfPphzMAJ2LZq/MCJ2xd0v6?=
 =?us-ascii?Q?qSmH3ZPvErb6Q6lepKbVS/X+nDSlJ/PJZ7eCP6FdzrXTOD6dAnuQ9plPRCDI?=
 =?us-ascii?Q?7BAFkg1ZaZuYdUYrii8LXNFEb6jV1FVGQRnIM4oQEwrGhyuXT2Z97eSC85U+?=
 =?us-ascii?Q?+PrA9zR0eIq48Bka7KEukHNzueCwLPNB3onO8nxz7PrqvG18XQj3k8BXfA6z?=
 =?us-ascii?Q?+kfA5W5qnmuZWug3aa/OgOyZ5JI9jNbCtvsxGvgF5JtR7ZCTWImV5wi2Uu5s?=
 =?us-ascii?Q?LQQgMPM62zfrse7Z6M8IlFc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93802824-f29d-4a66-2bc1-08dcd7cd37a5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:32:38.8694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voDv3ar3gdzMzfyEX8VtEjLcY8n4MNXfRIy7Cf4N4XvDR1VfiSsCxmzBt+UqF3kqEnys4vVKBR6l9q50lyV44KLoCwj673t9Njv+VJQss3mfJndFzhzbl9lJSbNudyk9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6735
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree binding and example for adt7462 device.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../bindings/hwmon/onnn,adt7462.yaml          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml b/Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml
new file mode 100644
index 000000000000..4a980cca419a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/onnn,adt7462.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor ADT7462 Temperature, Voltage Monitor and Fan Controller
+
+maintainers:
+  - Chanh Nguyen <chanh@os.amperecomputing.com>
+
+description: |
+  The ADT7462 has temperature monitors, voltage monitors and multiple PWN Fan
+  controllers.
+
+  The ADT7462 supports monitoring and controlling up to four PWM Fan Drive
+  Outputs and eight TACH Inputs Measures. The ADT7462 supports reading a single
+  on chip temperature sensor and three remote temperature sensors. There are up
+  to 13 voltage monitoring inputs, ranging from 12V to 0.9V.
+
+  Datasheets:
+    https://www.onsemi.com/pub/Collateral/ADT7462-D.PDF
+
+properties:
+  compatible:
+    const: onnn,adt7462
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hwmon@5c {
+        compatible = "onnn,adt7462";
+        reg = <0x5c>;
+        resets = <&reset 0>;
+      };
+    };
-- 
2.43.0

