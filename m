Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6604CB68D
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 06:45:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8Kgt457Qz3bw6
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 16:44:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=XBTni2df;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::713;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=XBTni2df; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0713.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::713])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KgN1yPJz2yQH
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 16:44:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY35EWwmbI8LKxf1N25QCqToGkfpHIcXSXOLSb/KYEb6ilD654p1SQMC+Sw5ekNSgJzCgA0ImVYchGEl2WqqCsnPMDlbvMhRPCwjnzlFGEPB8OUEdGzXLbSn4u0B0Iduf1RxJDdMLI3UGxTGJS0cop+ars3kLMT0g4SdPTgdoeGyHMX2lGs+VChZJNnjTmpWzZxjKzaUCmiqqSzdeHCVLjP000gBWP+RHUITsA4lRaQLzeWYVvDsP8VHYVC6OUvio4VXOQFzEiEx3+qNVj2fimAuLprNmO4oRqzfsyR34trjic3fiEFQdy8h+HNBox8+YeVo384AR7yzTh303bzWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyX6Zi3P1sp7vG8+6ywvmwo2BEuK3YhQUFU2i0oU6E8=;
 b=X7NM9oyk8cXjSSCxA0pxMgx8hjK5yDnja2+oHOxZF6jBgaOhI9PHlZMPm9zhval5s9lumVw3KhRoZcFB05lK97nfXxMmHINngvrVmOqQJL2GIu1HBoQmFVK+Y+Hk/VcsrO/ljL4FoIebu2yTaLGJHUhuCq2mu6UxbTeBwf5vWv4IBR/11B5+vvQ6n+gxIiOrc8rtDmyWZ60PCwb+fDMtIlHT5c3IEOSHnDvZCokapcz3sdSPea2H4kpff40HpON6JnyocduJzH90rhi79NbRvIpukcxOey2YsXzsmVd4UuoOPq8RtmlYluIFixbGOuNaL1i7zDhuKGJqpoioOoUHTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyX6Zi3P1sp7vG8+6ywvmwo2BEuK3YhQUFU2i0oU6E8=;
 b=XBTni2dfaA4skU5elvQVxo7Q2bAhXKS/4k0hYGPWgjJX+qzCm5ynxUAw+fl8s5W8ETW/+oboEzy/ijH+UY4m1nXDkLP2V6cscv/bbSQu87GcPRMDaW5obLvGzQ8vacrFohqkWJd6wnlSzxsKqfqjFFYMLR0IqHV7QBqDapamwb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4505.apcprd04.prod.outlook.com (2603:1096:4:120::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 05:44:09 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b57e:962a:3820:eab]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b57e:962a:3820:eab%3]) with mapi id 15.20.5017.027; Thu, 3 Mar 2022
 05:44:09 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 0/2] hwmon: (adm1275) Add sample averaging
 binding support
Date: Thu,  3 Mar 2022 13:43:54 +0800
Message-Id: <20220303054356.14369-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
 (2603:1096:202:16::31) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc144f89-449f-4b74-a4e0-08d9fcd8d677
X-MS-TrafficTypeDiagnostic: SI2PR04MB4505:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB4505FF75F59D36942F662F388E049@SI2PR04MB4505.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z2bRfJ88ERLYdQANfu86FFy+M9GWmpWCqTgSZ3kPs5PfJTUzm1wziuui/haUBgGkrImEe4yLVoNOmdWhHI716U/mrdTUGsSwED9W/RRPst3vGkgFDBcI0XvY1wLO8SOuJxNudy/hdXWSxdanwIHTpjIlBVS9yZcvrerkWrMdJZPF6SmtBrWlHIioMFjGbwC43rXPDlCH1TOvycHDxK4Moz0+WQRMedXE3O6fFPQHoS5PJFxufU8+Cqv8E73H8axjv/Uj06iubkcxPIwT0sL9apg7SLmnL2ThajMoah6YOwv+CGYbYvqt2Kq3W1UbAtnFN7vOfodWyNjZHaV0s2dLMcGZ4YHD7mt4+lOuflgRQaa0JH9MTFWOJXcJq/e8WxrIpVqu3y/h1wyleQu0k/uwo5wJwF34LblYgzPC+EB/KcTlGFZcajUOmCjEfb2/0hhgiw5o5gMtaU/uyz5VDESa1hoXEaAEdTscFv3UUoFC7L+dkMVHcBR2u0GJMVH4EUBuqjUDb9dPB2Mblc2jvU0pJSZNWRIvbIOE+b7XbMfKJTQmYle0566Y6b8gbIhx/hCIGVuHkj81QTpzyHzq2ELyakNjRICYly/FsW/CGx/o9FH2qk7pgwYOr6pSjOL7ckxKby6+kgvWchOZX0RuwzgEXTg/O9DC4jzIpTftlitDyaujy9G6ivqKfg/Ixh/PEx6wJ+Vfjz0zWeXzQ2q+D05OKk+JhZ8A6XW0cLoIOOvA8lz039k9vjoDkjC+IN/NTV0QwmRyYue3oO9s6rXm0j8XxLcFhp9v7+qJVxusHOH++fk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(316002)(6486002)(6506007)(1076003)(6666004)(966005)(83380400001)(6512007)(508600001)(52116002)(2616005)(4744005)(44832011)(8936002)(5660300002)(2906002)(66556008)(66946007)(66476007)(26005)(38100700002)(38350700002)(186003)(36756003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f10wIP8hJ6fvfwHy2RFmnZsu7cGUa6g23O7rXH2QKI7JOJM1JklxJt3B+WIC?=
 =?us-ascii?Q?btIJpUzvPIdy1FwoCb2BVj0iaBqYiTYu0IrffVulsEqmGVdW1YKY+/+ZdV74?=
 =?us-ascii?Q?Afwaf2uEECiqeXw2QaRZSi7UbY8t/Qe1qkKqE3RXUi+vr10XGQBUdg5Mhugp?=
 =?us-ascii?Q?LmdkwRMzoyqtpBuL0OBH0CNu/Ow6PmcxXWxaP+Gt6fNzABlpVaZ3ZR2culWR?=
 =?us-ascii?Q?Pil5f2QZmowiNcQebhZc6E5YsLbHHgvRhmCFt+PFsSolD1g2v0efC1CVIpyI?=
 =?us-ascii?Q?41kfS1TJ2T1hfjFefMbvDVz80J3ibamhcxtNBbCAJA2bNTXBnK2FEI8Sh8GZ?=
 =?us-ascii?Q?GyRgSAL0kJkBHTAsTzjvuEvP7RPLUgaP4sq7QBEStK++GgZ2UGk8hiSGaTCJ?=
 =?us-ascii?Q?UIrJjGJqcdahzpab3FVEWXwJwJdBMQnJ1MmCxUXaYxg/62hqS/B+mImfEP+v?=
 =?us-ascii?Q?A6RN0MgOJ/6fPi9q36A5jKtdN1YnmHMkALXYqN4qsSAqgaRzyMoneF41Km+p?=
 =?us-ascii?Q?THKj6keQvDgGRIfAwZrZeGVWu2DeFmRzEA4gEXMEgD02gZl0UuGlybbFbja7?=
 =?us-ascii?Q?DmsjWJol7vM02KWv8KQsR/RttMLjz6HKwYJ1YMhVL7TBzBdqJETAlAhRtx2q?=
 =?us-ascii?Q?VQO4SaxglC47oCH9hKmkz01r569Vdy6VP29RF0qlNBl9/H4EyV4O3EKQynd9?=
 =?us-ascii?Q?x4Oo/OTUbzzV3PorRP1mNPxuHoWm2DB/njK6ujVV7w+MbSbXI7JgS3JIBFev?=
 =?us-ascii?Q?Y1FKh4j0jcULgFyu6LBUen0yiKbKdd9hf/6grjbopMJUVdLUQ39QKaHZGO/p?=
 =?us-ascii?Q?1LqGU8yE6uG5TaN4u/k4ZCR4VQqWh/9KV9xL/W6CyqYVHixtmRuze8peq1jM?=
 =?us-ascii?Q?l2FmBrLN+ISzTavDOTE0Jb5jxC/fWjdNisCtD/lho6rBy7cyAJAkP6kKeZ1d?=
 =?us-ascii?Q?3XFcnBI0Z6e7jxfzs3Q68csfztSf5EvT9M/UD79EyCysqF1kSGmiyWVClTe9?=
 =?us-ascii?Q?C+q0UdRfHcFW17Tbdx7oWOSbiwhPpRkc9Pb/hqMQ5YCocIH6StZu42EC0Sye?=
 =?us-ascii?Q?dl7NbpEWM6kK8O/b6KfvdBD7EWkOB6N2U/lueIoprG7aMxS5UlevcQlvZg6m?=
 =?us-ascii?Q?uk9AnlNdCIOSmW1Mv+oQicokYQqBiO5s1IK9TIUCL6Vv7VPUnGvpu2VXJd7b?=
 =?us-ascii?Q?XT7G1uMyiLgbvqSIV9lTiCW+ZMc+dyYdlwt+pkC8i+X2+8QauifatQb9eJVs?=
 =?us-ascii?Q?xVT3lqK8EgNcUh2idaIASRP0sLhlsltnbmcf8trK/AfPhVtrhtfNJCuIFXU1?=
 =?us-ascii?Q?8BukQXYv9yWsdvf7aW5ED4oLTjqo3lZTsLwAjqyP56fR+N9tVBheF8S2bvW1?=
 =?us-ascii?Q?AZa7BEjuVGbti26nJQWyxIRlWk8axRbvaA+g0ckI/Be1NCPrS3XJyD3Wi+H6?=
 =?us-ascii?Q?5Ah6oeGDS8tplaxhdaE1vWuVw/wImXm9jrW+nDN2At4aBCityIST3LtgzBqS?=
 =?us-ascii?Q?T/bcHVSXaIZF/8Ofis0m/1wzmsCriKkfX089kOPhkLpDFlk35OgrLkCzIfkg?=
 =?us-ascii?Q?FhkRrq+uaodCnXOU/gHgCja2mmdHn6xocDAyGSmrorKglm+Q195bcW+vtZ0n?=
 =?us-ascii?Q?f1a4oj5mOnM2SeeRRq66SxE=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc144f89-449f-4b74-a4e0-08d9fcd8d677
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 05:44:09.3436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIvuU+fpHMlhsDBfUww8v0ZyuvADs6BBdeR0Q/J9H1vvnzt08nJjeqwuPIoQanydY5n74BiM+VvDck1N8YEiLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4505
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series allow user config PWR_AVG and VI_AVG in PMON_CONF
register by adding properties in device tree.

Example:
	adm1278@11 {
		compatible = "adi,adm1278";
		......
		adi,volt-curr-sample-average = <128>;
		adi,power-sample-average = <128>;
	};

Link: https://lore.kernel.org/all/20220302123817.27025-1-potin.lai@quantatw.com/

Potin Lai (2):
  hwmon: (adm1275) Allow setting sample averaging
  dt-bindings: hwmon: Add sample averaging properties for ADM1275

 .../bindings/hwmon/adi,adm1275.yaml           | 68 +++++++++++++++++++
 drivers/hwmon/pmbus/adm1275.c                 | 40 ++++++++++-
 2 files changed, 107 insertions(+), 1 deletion(-)

-- 
2.17.1

