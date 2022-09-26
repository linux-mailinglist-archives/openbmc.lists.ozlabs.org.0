Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB965E9B67
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 10:00:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbZv55QMDz3f3L
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 18:00:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=p1VGHIRT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.104; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=p1VGHIRT;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2104.outbound.protection.outlook.com [40.107.244.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbZsh5ZNpz30hw;
	Mon, 26 Sep 2022 17:59:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgdDrihKhtWjxkMT7HoGbn1jBNh61wbKlGmI5qG8Md4oje5NozO+sQoy06SykQAhhNvdmgV5bsVcKPi8mfN1MaWq+/FpMO5SpTJeJzfzNX6AAunrYTzDBhzsbgu8nwbQijrZ3upviGKTExJm40u2O0kfJQNXW3/gw9FghesHP6ZFfRChVCu4lQfV0eZSczmhC161ekQlfw1K+mDwLVTxH7HLZkAg+0uxbE7OU172ODgl0DWghWUaCaK81d8/iEGZxscbJK0dclYfc5ESxcPjuUHbEoTE2DG8ZaKYe9EuQe666KuT15SbEhCew1E0CokcE18NBCz8NrWdjsr2rwX2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8A8efsndowdMBNoJsnkZ1LEc/rTlAmrxqdPIq1X66E=;
 b=FrkSELdt4tEF55dctHsOCvhD68YUUlHn+yiAGGHqHqfn20spwMvHXJL7rA3jOZ4wmii/EyfDKzc/Xi28Dp3MlpuOB6JOtmfWrp7UlnpUHSevARsACRIkraNgmh5oQk4m68NkcPoBHA+U9hwT0kgJ9Jd5dOBSdKtWZ1v2PhtvxDysdBeZwoOX+DS6aWS60UagKBmfhLNz4VwDlXU574In2mOfOuy4fVKGDmJgP+U0qPzksSH133P3vVMPNIXKPYPVGEs+j9UUYe5cibzbyo6kFcVxHX+rgRrW13u3j0jw+HtcUrEUevayM04MF0yundwBV0+l9i7NdiOoBz+RBX9fYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8A8efsndowdMBNoJsnkZ1LEc/rTlAmrxqdPIq1X66E=;
 b=p1VGHIRTm/Z1qhczKpS/VfoadmxnfHukRFna+MJLCKVAPuNaBjOE1DU2FLsGKJoQq+ZvsWskAqLXf12zzM/XaWOyLfVltoXP/jeYBSHHCZHFMABRkUna4B9FLX9B+rbY7tlWAL6iEk08mttICAFrEt981flLruLM9tTEVZjVSOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB5235.prod.exchangelabs.com (2603:10b6:208:31::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Mon, 26 Sep 2022 07:59:16 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 07:59:16 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: openbmc@lists.ozlabs.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v3 RESEND 0/2] Add device tree for Ampere's Mt. Mitchell BMC
Date: Mon, 26 Sep 2022 14:58:46 +0700
Message-Id: <20220926075848.206918-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BL0PR01MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c265167-59f0-4161-1bc1-08da9f950221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fYpbOB8AoLAwJhTxumGZE4lr3/i+ehRidEoGF+1gRdu0j06dqNQCy7pwX0fOHptS9JEMW+8P5PgO8h3Av+QwpuWW5bnwKDkuuusNOaL3tjFivTfz7RNfeypmMPeDl0dEM7F1M9z32i8HkIRUTxaXIU82QvptidvmKP6meeG8XfS7pGnT8iibyBDYNtydblA6qLkBlNcRbyECfbkySiugI7pxsoojfjCkP2960LSjo1X6cA6uCSiND1y9byAs8WnFYpxsjNdXDiyqHW25hHuo1j507g0APhiuKghJBXt0i1OuTv85Inre5oo8VfaGUybo8hbqkfVEo+LfpJoBT+Hsl+XO7Tr1NiavHQm2oXGiT2hWpdYQTeAsbiHycsbIQNgYHDnGJqj/r/dQROX+ASEDAPvR440yMSWG0HTsGXj/7FZrdEfj7/grb3z2eDlx7htdpFF8AD6PotUBvoO1bIvetat/mTcirx6yerkLEnJujYrnJeGO8XWH/c2DUWN+pXnMMzvVeZE2SV9hR88z/WEc/Iuc8sI0Oyz7j4qljdJznAQ4nj4+PnuG0bgBfkEWNJDsEVlKGLDVpiKy5t27IQqF931Pe7DANz2emkzbYvxF7ty2lyaU+yEVKmHEgWkLhGlVip3KOpoBV48Fg4+QVkaLw852ZOAfWwqjTgfRkAhRYRFCaZjm8K8ES4DOUZ3UJVLqgo00U/88BoPEOuPz11TTex3jkEzXmlQFRGx1TPGW4CPWcrwcs6+DHstAm7ajLcX4tQ7a2j6hrr1hUeuI27tNfP0AwwqV4Vc7FDP7b63czNM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39840400004)(376002)(396003)(366004)(136003)(451199015)(7416002)(26005)(6512007)(5660300002)(6506007)(8936002)(52116002)(41300700001)(107886003)(6666004)(38350700002)(83380400001)(2616005)(1076003)(186003)(2906002)(66574015)(921005)(54906003)(110136005)(38100700002)(86362001)(4326008)(66946007)(8676002)(6486002)(316002)(66556008)(478600001)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/v/wQpkcZDDEO/CU7raeIROdoZMx0BIUGqc7NnFUs2r9Wy/pvASRd5tN9+tC?=
 =?us-ascii?Q?MnSqf1dJCnMSdlTOV5YEYpZTb+GwMVmpE8M+cYJUN7lqzyIjAzHUgR8nSjFx?=
 =?us-ascii?Q?Gam4fXvCqcXxXW0Jx0RQRjQC5TFwScDxysbjplxV92LSWyaZk2sbdVsaNxgw?=
 =?us-ascii?Q?Rd/ORLdJsGsyO3BBRUaqAcuvszxnNSf9EG7OZs9tg7kDIuDnjqbYFFiZ/py7?=
 =?us-ascii?Q?GTBPmbdvn/yC2vNUQuZFqna5RAiSVG9OuHrKfnn222b5at1TlCBoZqg6FI/x?=
 =?us-ascii?Q?mLR3yIZYmh9hDCKVQjku5Jt/Siw3oUTbHOkCUBFxttGQwVFnHIP6F2acV9Z8?=
 =?us-ascii?Q?1Ajdd5T9RYC+bb7XjO9jeCIZkBXK3dCQ488qtsivv7PwMKo2pDwUVgob2qie?=
 =?us-ascii?Q?n/8GBgzZB5eXedA8KtAqIji53VQUgbQOJq8FGGHl/vHjlI01tyG/r+nnfndS?=
 =?us-ascii?Q?M7J7he0dYhb3+qOhj5CmP8vrZ5zHkV5MJUIxnB9eEtQ0nKkcitR89B/3r4sT?=
 =?us-ascii?Q?mmdOWo/WPlzFQBNqrOgMNpOqjs2ugm5kIcBiKM9nhHm1WKQy0+C6nnq9zqn+?=
 =?us-ascii?Q?V2krbMNpPV+xWrBlq2KGSZJxcuJD918/NR8XldWK/KbDWM9cqUDQHYUuqbxL?=
 =?us-ascii?Q?ciXTsZ182nuKpD5G7Xro9Eq1xpIIjsxZVlCczBk8DnhmDNxdwFGTeAUBmwPn?=
 =?us-ascii?Q?kuZLYoKhMOuat6z4Ee7oElZx1AAbTXTP508FKx2JEWbMuNdytZwEeS/Wu4i9?=
 =?us-ascii?Q?h1bQv0cSMK4viUxz5MwPWzqGngITHyNa+O/iXU/kVMHnoU1ydoMy7sFziWBQ?=
 =?us-ascii?Q?8uliL7chuIiH62OYQopXUPfT0fhpKuithxUy9ROc/XpM/UQsa0kIL5OGUF5d?=
 =?us-ascii?Q?C32mGeMlyPOg2fc2mHD28s3gne+YGM4pJ7Q5amiiIcTzTSWQjj6A39osFKVO?=
 =?us-ascii?Q?9hVEWhYlwt1zLxKcVmHloLn09m5zqbA0Z7uvpWXItdT9YMO1bszqUPML6wee?=
 =?us-ascii?Q?Qt1tnNbmNjzCvu7Fw4w4SGdq6UBs0dB9OYw78SY/0osnCNyCiL07/LtDztJS?=
 =?us-ascii?Q?gwV/8/ANZHc0OpRDcjGXk5bPCvMRtCH/Kph7DwyatCCSylIhIkmbhJKanFfK?=
 =?us-ascii?Q?hYxZOe/pf1yxeAQVP+UxVT1lXHYIHf6gL7q9DEVwOdIgq1oKQKcHKZs9/Bp4?=
 =?us-ascii?Q?8h0ympLT3PiSDFK1E5FBHzf3Ny2amhrv63H4Klzcq20QMmP89RWSVL7YYRBl?=
 =?us-ascii?Q?GpgLq4IH6kWgKzBb5pXE83hqo/F/otP+RQ9/w1MNEH+t2w59jiXmK2d6VYv0?=
 =?us-ascii?Q?akssjz9pF9uZSFIgbxNF6Vg0FpOjWXrGympR1dEt+MVVoXVAA2gcPm4QVTDt?=
 =?us-ascii?Q?oBSkebD/d33Sg/MB4TXTd3Yx2dzPrtM9FaT4OSjl0rhWbRcG+BtCEQWhxo7b?=
 =?us-ascii?Q?/t2k6vBcK3F1rgjjdsBLRrBAQFphBs6jDJ6sr1TKX5t4ZvD3M9mD52j+1mz9?=
 =?us-ascii?Q?BgXfj04x5+CAWCOWpXOfG+k049PRGsl0ImDA/IpFrL5uWZsxkyVA8ae/x2LV?=
 =?us-ascii?Q?T7vqV8Pmms1y+oTF+xRyum5UWh2Ruzsnft4zF7Gkdh4vJZdZdNQUUVMyhTCt?=
 =?us-ascii?Q?SkuBolBnat+TSQn9oPOYE40=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c265167-59f0-4161-1bc1-08da9f950221
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 07:59:16.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nmyg9WtRFef+QFfZXnEqDHYJSRHBUKqhUwnY1PNScr8/s2X4RuyAjH0qpN/6GHKfKbONRKjHlAy56tm8KS4mSNqu1Hyd+iDBP0IALcTKD5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5235
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
Cc: thang@os.amperecomputing.com, Quan Nguyen <quan@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
hardware reference platform with AmpereOne(TM) processor.

v3 :
  + Change adc-i2c node to generic adc node               [Krzysztof]
  + Remove unused status property in adc node             [Krzysztof]
  + Remove trailing blank line at the end of file         [Krzysztof]
  + Fix alphabetical order in dt-binding documentation    [Krzysztof]
  + Remove the wrong comment on vga_memory nodes             [Andrew]
  + Remove gpio-keys                                         [Andrew]
  + Remove the line-name for bmc-debug-mode, eth-phy-rst-n,
    eth-phy-int-n, bmc-salt12-s0-ssif-n, fpga-program-b,
    bmc-uart-cts1, bmc-spi-fm-boot-abr-pd, emmc-rst-n gpios  [Andrew]
  + Update line-name for hs-csout-prochot, s1-spi-auth-fail-n  [Quan]
  + Add line-name [s0|s1]-heartbeat                            [Quan]

v2 :
  + Add Ampere Mt. Mitchell BMC compatible                [Krzysztof]
  + Remove bootargs                                       [Krzysztof]
  + Fix gpio-keys nodes name to conform with device tree binding
  documents                                               [Krzysztof]
  + Fix some nodes to use generic name                    [Krzysztof]
  + Remove unnecessary blank line                         [Krzysztof]
  + Fix typo "LTC" to "LLC" in license info and corrected license
  info to GPL-2.0-only

Quan Nguyen (2):
  dt-bindings: arm: aspeed: document Ampere Mt.Mitchell BMC compatibles
  ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 546 ++++++++++++++++++
 3 files changed, 548 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts

-- 
2.35.1

