Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E50987367AC
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 11:27:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=KjZLrXPC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlh9R59gqz2xH6
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 19:27:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=KjZLrXPC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::711; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20711.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlh8k23bgz30dn;
	Tue, 20 Jun 2023 19:26:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnTnfZNLwthokGa7fiXEZio/V+INtLOX48RI/Gw6gVTCZYUAqZ+/6dgxFmQeLWCp32EvuGlKCM9vC34VRRcb/nJQXmlXYt3vg8BFquk7wmRFZJZBkJNW2u7pp1ZbXy4NKZC+NfbmM7lchqJRzEVMT73H5LHpQP2Lba1QG5N2jv0XxZ1UH7hGZMuQxXXlX/RetBLW2y2HboPcsLF/mSIInwUBqGJ7P9YXTYt3J6v73B/vWRsvF/Lt4eYqJTNfkmfS4s6mudoSsk9syLx2C3ykOmv7R+OBQzk+k9SIsGz+5WogqVmN2Q6HS5zLQYnfzgyQhQS4V0K/R+yzY/JVsNjm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYfC0l4wvtFoQONPNJyShqIhpgoXsSKVft5TGLg+Olg=;
 b=NTcp2xfM/3gKXjyX4uPilYkFb2LXxRYfGocxvTBg8BHDdQOWKDecjox792xqhCOCfHh8NODtWDp1mTQQ5MpYwAcZ62N7oAFr10Lnrhq76i3xaQdwRnmydKbM9t7V+1LoUiRwdgvOSJJrTlvddKMh2m0fIyiX+5AIctthSnabEGlIMalnYOgcRCX7OBYf3ULiUSy7FO5UjY3epxgLPXqyqWAba33mPleINF2PfgakooD2n0GKThdxQYSvyWqsbngOb/Hd2z55az1XkeScEVd/hJ9c/FtSmk5skTDodIAxk7KE7/354zFNH2ePRXnxg5NxIYpPhgC0txHygt8tn5psSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYfC0l4wvtFoQONPNJyShqIhpgoXsSKVft5TGLg+Olg=;
 b=KjZLrXPCdTldpdIxBjQplq4aAdg+Jb/X/Mogs3/7UMSrqUBwZOVFF/jvUeNfph4x7edOaXcDDu022DlQNE/jKAXLpXlM+WM+crjuDe5oAT7WW8JqqhKqHZ3EXoQz1LBVEpusZqK/qUFfFsg+tRMJ17NsbwPvsGybyI7ZSuGACEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 IA0PR01MB8237.prod.exchangelabs.com (2603:10b6:208:48d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.35; Tue, 20 Jun 2023 09:26:03 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e%6]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 09:26:03 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Update the device tree for Ampere's Mt.Mitchell BMC
Date: Tue, 20 Jun 2023 16:25:34 +0700
Message-Id: <20230620092537.20007-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|IA0PR01MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc517cc-0d46-44b5-217a-08db71705de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	unUWF2uqtrPj8IlHcX2CYu2zrzA2P5Ssaj2gT8NO0W6MXtLsPH5aLbJ2zmMVu/u/XEYLz4XFSf6uziw8oU8+4fp/ddeT+OHfZg84nVx/XjfNVhLxAtEorGThWpsR8Rs+UtjtcnJ7GFr1F+Luyeef++V2KOx9NURox7Ig+HEWbzKXpIw92YzuyIZZUNjJAIktVaTPo2AskGeA4QAGDNXFDq5zJWze9l5bQzaRo/gWTT+MevTJztIdyfY6iXcD3cONaOLgriT6zsI6ozyJMU66bsslvb6QXCCixM/Sy57IYIZHXtueQwivQvaIyGMGnpaSaOxkcPKTfjPPkP0CADUlgNOxteuSW4uOAMBF8l81G0SyaXyfW9lrN/jpDCmsKofp6WffffHU1UAZA/Li1SvxnKysmiOrzm+i29ftLxd7Bc3/KijSfiBuZ/znJmtiA0WS66fozyA/nUcgSwvC7LXXfb5kElOIbY4QvCQLZwBFaixiW1anBoOJsHh8YTIUyx8UWLv9ZYctFy/EHPnYLvm6lehxRZK6A/0v+kmhH7NEo5gKatPLtY0RyPZIeaI21OItV+Ee4xhPBxVFM9ZSEgZfn0f+Mhld1EJ5a1VVC2ZmBJSi7NyD0BMNuFZU3kPajquq
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(6666004)(6486002)(478600001)(107886003)(1076003)(6506007)(52116002)(5660300002)(86362001)(15650500001)(4744005)(2906002)(110136005)(19627235002)(8676002)(41300700001)(8936002)(66476007)(66556008)(66946007)(316002)(2616005)(38100700002)(38350700002)(83380400001)(4326008)(26005)(6512007)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?XXUZ4qsQPe5YFBdQOlLUaY9C2UGZIY8pIMcu/QweR/CJyH0YZqp4phNAgDfF?=
 =?us-ascii?Q?WBJl064H+oujBT7+xn4jmNOyPc8j6ojpofZXcoGIy4tsXPedlBn3MofaqBmJ?=
 =?us-ascii?Q?G+kaqanb6ygUy5gq2s+kokyerociBrVHYHnPDvVuw67yf46AvBVDgI1JN1rL?=
 =?us-ascii?Q?BmCgAxm3UKl0BPhjjY/jbEQLJjeO9a/m9wdw/AwMr2bdu9L6CLtdmYrOgrAg?=
 =?us-ascii?Q?eTqP+qphNn/GpgAi+OE75c4DXcPFATbBc8VTGU7Ee4Ou0GSpkCyBgnnoxwFH?=
 =?us-ascii?Q?sVCwuV1+GipvPFMhBYATV/YyX/aRU2BTwxsld1wGjzJOOs1hbvuc8ScVaxKz?=
 =?us-ascii?Q?tP4eCNdaRO4WQWGdDZ0QmV5a/WJFEEHgjwFA3nC30uSYiLB57zEjC0TWxDMR?=
 =?us-ascii?Q?5Y4yipdP3GKSWQvQ0/YgFC/pZSTJ9K48u27L8G1hGN51Zv+gdXLpNpFeXuiq?=
 =?us-ascii?Q?tDeN/zzpekpYAxonyRC09shqdPBszJ+jXQZxOTniynY48EUCYfxFQFYWrre9?=
 =?us-ascii?Q?5UO2MtmnWdN4ix5y4cA2pfnrpMdF4Bt0IR0HzUyGo/6U1wNdLdz7xU8IgFzu?=
 =?us-ascii?Q?HmsWqzEOQlFrzD186Lgj3NjX5bfpXrOAonwGKELX4vpBFw5E/BZv4LsOgkjr?=
 =?us-ascii?Q?6h8G/MG1Q3yUyjOBJQQJPLIPeVamy9sfbNf4ju7PfmM2xxPIecmgvM3aH/Pg?=
 =?us-ascii?Q?bDBVoorbRhvfESS8o18ttGnsRhPzroBfs5ckQEoGru1+/sUPN9BoAOOcpy6l?=
 =?us-ascii?Q?HgOmY1sTHHyDvBz5u7J0Yqtf0TQeye4sz938ctMdd/LRoeOEYun4k7qsP0E5?=
 =?us-ascii?Q?Ha2eCkTa1MU+F1INZwRryj0wPEjmw8DYtgDYBw/XBOaS+lBxOgfbnZagD5jW?=
 =?us-ascii?Q?PK4seajuKQZGOoWRQ1LqOf3gwdDYiV4gxyEzw9hDHet2RlYUewa3EQz68uq4?=
 =?us-ascii?Q?JXUlv9GVV7U9Z5sxQH7V9qf5EIbyDT27QCFk2RdEcgUz0REMQkSK3YbZH/ET?=
 =?us-ascii?Q?9Rka4Y6KH8A0AFv3NwzP+m+8QUaUIAk3UyV3y77c28gXGQOWaHiM4HnfgjCk?=
 =?us-ascii?Q?UGq64XrU31CHe34V/0pgxpIcvI3XBitC5uuiLCKsBJoIC7Q5pcA3/xAaGvpn?=
 =?us-ascii?Q?6G5cZk60vAX/zLlPuMxzq+Fc3THG3HfD1Q/SuUE8G2NSWePq9eumSaf0omWj?=
 =?us-ascii?Q?VA0uJjm6Znr6XKEPRz6VqfjWDol23s/HOiYoGrUO/RCbPTbu0Ceq5UF7j7Rn?=
 =?us-ascii?Q?4L6zU1wKGWR9+ahqWIH7AheYXXPZL0PnwF2+FOLvhrRwMICEqyvlLEXA/+n/?=
 =?us-ascii?Q?iOV5CO9qqFThLSRgf8bgc7gSewXckWwkrddqtV3vusvT8pKuLOXbb0GRPsED?=
 =?us-ascii?Q?5nVMwGXbiD9MuEi0C4Z1Sl9X9FMU74926jeTQeSb7WmL47Y68kA8C+8AJeNk?=
 =?us-ascii?Q?RjtNoAsZ5E/OmyrvcLfdoAwfRqkjezsVnY5F8f7PfJgoCCRxx6gAkDDMydRK?=
 =?us-ascii?Q?58KLHozcJBmY8xrpUZ6GR1MuHtLxm1M2HVLJM4f0x+82ZpBAB8rMyfw7YErK?=
 =?us-ascii?Q?KJWp2b1gXVSkRAW/OWozIKXYdjbcu2EV3+o3pAAV9LNKJkTJJhCO8hTMKkKG?=
 =?us-ascii?Q?RX62gwX4VyUkNOdXR8pwqqI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc517cc-0d46-44b5-217a-08db71705de8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:26:03.3188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8dbft0csw+ZwKsxrQ6ylELgiNlJKZCM7BeQDKo51acLTp4K5mARJOEjyNSXrH/7UCMZiv0KUWk8+eLld61gwCArXPTz93ln6PWvODJT+zJtlGqDu1il7wSFNNzExbL4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8237
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Updates the device tree to support some features on Ampere's
Mt.Mitchell BMC.

v3:
  - Fix build error.                                  [kernel test robot]
v2:
  - Drop 0002-ARM-dts-aspeed-mtmitchell-Add-I2C-Fan.patch because
    "maxim,max31790" is undocumented.                 [Krzysztof]
  - Update reg for mctp node.                         [Andrew]

Chanh Nguyen (3):
  ARM: dts: aspeed: mtmitchell: Enable the BMC UART8 and UART9
  ARM: dts: aspeed: mtmitchell: Update ADC sensors for Mt.Mitchell DVT
    systems
  ARM: dts: aspeed: mtmitchell: Add MCTP

 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 127 ++++++++++++------
 1 file changed, 86 insertions(+), 41 deletions(-)

-- 
2.17.1

