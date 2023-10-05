Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5C37B9A84
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 05:56:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=nAVCXwSv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1Hn25k9cz3ccd
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 14:56:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=nAVCXwSv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::705; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20705.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1HmK48rgz3c8c;
	Thu,  5 Oct 2023 14:56:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQesswGbiO+7GNrUr1l9m0rdHF0tEIk+wYKWVOAfOoPMPn8dKeoeptGgNS4wq7Yn5EdCPQxp7NAUxTcp1L7jsmY1E1vUHgitPrBV9KZ2AhqTx7qOxmAN0MxutjyMaBwaIDynm02ENQt/Cc4UUovodj7THdvAtTUJmHn3LOXwgy+1/cJZCfnh9wHwBR2PBIR1fwZkk/NWYLTcxnI3NAZm7dnRcnN1rYEwbxLZ2JW3InKGyq1wy66CsXH31ZwM/g4BuXk50Sgy4G//0bxQzn0GK4zhpDEFej1wPSIu35V3C9XwQDrvbO4GofGtvdeot/h2Fe0xvjrY82oPEo2gBGsjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qI4TPyc2XF7Y6lzUlN2IgqrdTo1lXeAq4rUJKnhM7dw=;
 b=oW+7LGrjRu/qioZLl65WzgUYLTmkMcO48kp9m8MYwzuVCIsfonLextx1gHPLP1JOQ82fNgnXyMNJAw2UMGT77mIqFDtGx3QTwiJnhfkl8AzoExheJh7Te/t1PkdjmLFn+lNTxYcLBmhQIuVKhtuWKV0x4cmanlzBGDvWF8Nc12m9UR6o1HT4ps+DXsxcgCDezxUSRnRZCQVdAoTKOboakJS4fz08Is/VASJEqco9jIQzW38zUIlV47yq2LpGrzli/xI4AcbmDu+7JDWkwKR3rZ9OuV2W5YuqHcL7YwO1wld620oOzjof/UM2FazB331Zx+EoWYZrtChLIWkoK7rBfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qI4TPyc2XF7Y6lzUlN2IgqrdTo1lXeAq4rUJKnhM7dw=;
 b=nAVCXwSvZ99ohfLKZEaBCj+YRKXSgnioUovRxjoTil8SCE6APRhuDuQvUjH/W7nnYSNxqaGUHJ6OarhhJeN6NHwmriOeOtUrShhYayS8WUmpk7LegG/2RNFooTcYPq79yyCXSnQeSW4EALu4ssUyX87440AF/0eD//gavK5abU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BL1PR01MB7649.prod.exchangelabs.com (2603:10b6:208:394::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Thu, 5 Oct 2023 03:55:55 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:55:54 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Update the device tree for Ampere's BMC platform
Date: Thu,  5 Oct 2023 10:55:18 +0700
Message-Id: <20231005035525.19036-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BL1PR01MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1e62ab-f340-439a-2f2b-08dbc556f8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XJUkQhlQW09jpBMScOyweI01r5WlrX0OQUxs9qJ+UnzP9l1lHQxvmrFQTqzKcnxJGn2KuB3bstyRY26/iDtXWxvKzGwKWrR4A9QkYmXIq6cimyMOpfizEoj9tFMwUxhDzs29QW0M6hULRQE+iQOyckK8sRfsff9EW1ldS6WEgAOC/+2mtLiQiAVPvFCMOnmu1x5VXZ9LxgqE71EtonTeELqAvnT51pcuBg9bZcD0iVrd5I920FEKTJ1T8lnAUp1tPpugY+8qgIJ+OSsAAzGmVG5yI5K2v4j4k5n02Vjr9du9RPj5X1+FO7IiBn8e6cHdMpdpfm8ha+Yo7e6mzbYQ56K1SA0Rb8dD8/LFcW2ziDj1QkwmoWlAbkuk7SnfCYEcxvBDP2b2MLqRLfkUDyccr1+r4NC/urHWcM4azQpXqsEObAFRk0L8lPUQ3rZvENlMF5Hl35zNx4omfv/HiEW/JZ4gSdhwc6sn4Aigj4D2Shz5wSQv6U0ZnGtEkfjT9z5ihb0bg0mHcuOx383fv/vt1Bgxm/O5MevuOaWmDY1aN4MWBp4MyLAFsjGU7wSXuhX76VM3wq0Ql5GR6DaC0u33VRhaMs/6zcgY4HbzmZ6MoiWVdmfqVep1L0odQzXDYh83
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38350700002)(38100700002)(6666004)(478600001)(83380400001)(6512007)(921005)(6486002)(6506007)(52116002)(7416002)(15650500001)(86362001)(8676002)(4326008)(8936002)(5660300002)(26005)(316002)(41300700001)(66946007)(66556008)(66476007)(2906002)(4744005)(110136005)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?QQO6UWGQH/luImpJgjPnDiNblxa9nugnbKwwne4maYfQYNnuOZJ0ete/6BOZ?=
 =?us-ascii?Q?9kpAUcCQxkcqgPC8pLKJOAwwOQzAHIhLsZriyYatEWyPXT5VJHxToxCG+2yc?=
 =?us-ascii?Q?aFWNrvor5goMRzAxbPJIWgK2AFkZ+0Goy6zwhuKINQiaS7tdsJjzelF5FlEs?=
 =?us-ascii?Q?3dIPxgnREXyLckkrf4VZBISjCj1PEkjKDc0XJm2Kh5K7OFykTNZ4dmaCiJ40?=
 =?us-ascii?Q?tHOGo3963D4Ds5Czb+pfMF130+NrSn5902flJwmjLJEjrGOxdcm0+jWPMue4?=
 =?us-ascii?Q?VZQ9SyqxB5bwdy/nLIbddOuHBiZwoFcpmt1uHEWYJmOerPUl6JiyZZq304jw?=
 =?us-ascii?Q?uO1z9DJz2bFtSH4fYGsK0Nzj0lUEFmvScYF5Bhd8b9uSFPAdmMJUtVNt4C2Y?=
 =?us-ascii?Q?f5Dxy9c/Jvf9AK9dZosG+AITdQqMMKkPnp3w6ZiUlV9nBwz9dutK7pa+070H?=
 =?us-ascii?Q?3N1NWb/AeMqW7sO8s3aCFPycDvge5zU7UEOdYihE/ws8sdJtjK4u0VTYyaRc?=
 =?us-ascii?Q?geHP2xFREwiOy18RRnzIFAgd35AXAYx2YnrrDx7ncE3HtEL8xA2x9RXj+S1E?=
 =?us-ascii?Q?IW8epzdbR2EDxKb3eA+JKGv3D/eUX1NZ1JXlQ6jFf4uPZkHWCvzm2zAhpbkP?=
 =?us-ascii?Q?YIQA4akc4I/Z5vcg688i+Ed6KZrZEJO3l3LitsybcEio7drk6QauK6x2ffmE?=
 =?us-ascii?Q?tMUH/1+b0n92J14bwhAkLrjYgmXESWCzxK7467f+Na6qqznKLWu8lPIc0VgI?=
 =?us-ascii?Q?roJe0dBlF/+Zv0usAKHMHaUgalHiVMoFgYM6SVQU4Daj1JXMt5obc8LuGm2p?=
 =?us-ascii?Q?XTRO6Ij0LzPpXNkDqsJQ6QRtkgNBhVGpwye2URt3O5zSVUr+/Pf3gaRTZJX/?=
 =?us-ascii?Q?16NTwe6OSBrVnWew63rRwyrXRMJ1UYOfC/7LsbAD4BZ1UMqZczMH11+aHJJh?=
 =?us-ascii?Q?/fwY68HzsbfLHvYKAEzeD1TRqXmMyy3yzoP4pvYbjtOe4sQ16/gUQCANnbFb?=
 =?us-ascii?Q?xyp+So0c/tMUU379yYSKWF9HjP9SDgTk0ZWs365lon383YaBvzqNlcXfJxFL?=
 =?us-ascii?Q?7mLToiV7WgY4AehhFYFZa215tKFL3/1sL2/SEA3nxUBkBf7jr134DoNCUtRn?=
 =?us-ascii?Q?Yj7S9gsxUv7xX6vQmeE5Rt6LCglL134seWDWG3yeM4mi28A1OJsqRmTpFZRS?=
 =?us-ascii?Q?L/pJpaouCQncgqFqNxDwqiO101mSq13dVmvpW6/cPwz+fjKOAckr99bI9RGI?=
 =?us-ascii?Q?utZIS/Ylb2V7t8c/CywXmDJGwSOhCwNWlvu9R1V3VXoNl95NbFYSUdHAzEpN?=
 =?us-ascii?Q?aJPwfJZklZZaTDAwL13UW2VSe4WHSovQugbnR3zOoTlaEKpvIL7GYl6cc3g6?=
 =?us-ascii?Q?5ROMgkmbNoa2xmHdVI25YVnf7uDvn0W94BqOme3c+07ZC+hPQmWLnDh3qpRr?=
 =?us-ascii?Q?fWf4IYjhOTsbq7IbMYovBxa1CmHOTSiptSHcj7sXcpMhbmOHWXmmonhNP46x?=
 =?us-ascii?Q?uClOWB8Ij0kwvh+7YPa2Iml1c9Q35hUVQ8KIxWui3NKb/ITy4phv/N38S/Lz?=
 =?us-ascii?Q?X0ZKl9nMxdMcvIw34LWdooOi4fndcMcrLqnV4nHkUGrZQPTLNCtBtbFSuZQR?=
 =?us-ascii?Q?tcIML5v235ynr8JiIstB+To=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1e62ab-f340-439a-2f2b-08dbc556f8f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:55:54.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HftmYQtpasa2x8fXURCDKHUG/CU235HdBvREE1QAHFSbZHjD8oGqToTSl5GnhM0HACgIS2UA2Lu3h58yT3Aoayvffhify8Zaja5vOlKt3yF1vmZ83ByTQKswn6MC742
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7649
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
Mt.Mitchell BMC and Ampere's Mt.Jade BMC.

Chanh Nguyen (7):
  ARM: dts: aspeed: mtjade, mtmitchell: Update gpio-line-names
  ARM: dts: aspeed: mtjade, mtmitchell: Add new gpio-line-names
  ARM: dts: aspeed: mtjade: Add the gpio-hog
  ARM: dts: aspeed: mtmitchell: Add LEDs
  ARM: dts: aspeed: mtmitchell: Add inlet temperature sensor
  ARM: dts: aspeed: mtmitchell: Remove redundant ADC configurations
  ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port

 .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  66 ++--
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 315 ++++++++++++++++--
 2 files changed, 334 insertions(+), 47 deletions(-)

-- 
2.17.1

