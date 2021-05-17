Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B78382337
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 06:01:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk56G67gwz2ym4
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 14:01:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ks1wZ9gE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.118;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Ks1wZ9gE; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2118.outbound.protection.outlook.com [40.107.223.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk55q6Hj2z2xfn;
 Mon, 17 May 2021 14:01:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWiP0I+zClRVw5OT5fx8JjnhBUMtYxSlbpsRPlNJjPUDjC5uT9EiRrDaNS+q+cTWcXUhll7hBZrDa8D7IltZnVZzGXbbRIjKg86ouey66CXHHzOQaVGYE5vSq/St2OZ24/yZq8EOeywGITk5sEtK+4t6ubSav3B7b6gAC5fmZ25wCoE8c1SXT7ERkJnBGmrfau7MRv+PBQhuM4zaup2pyzdRxg89C7LWJkH+VTMcAVllosv2Xo3M1w5sqZpZZ+gVzKZplJQ2jKax1X4WXyCgIkVWcJjTEoqiutJJfSWasSj0A+vOUziBKgapX8pz+EGsLpKaHVVe2UEOXDntiUZiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ8YHf5K3+MqTgzYmmP8XAiay0/XJn5CrStvgAUpCcc=;
 b=ep0EAjPSfUh+5QclpxltaCDPuIOgnLvKbmUPT/MvxmrZ3EW2H5AapqmvNqavY1Z6Xs47abRP7GFzCLrmXlogbISe/BBiDRJ1uby2KR5/72nkvcs6ATTRTuna5fmGBi/GlFLzj5lwRcOqHdgZOtw/qPOd2iKo8KgV9ZdGdrdKiujlq4WR/8W6Wh6+R136RB6pv7e7yHIediLEdMbltOluouZ1wpA/VsoF0e4/iCJIwSP7epXg/7Xa8Sx2xO+8HHoyI7Hl0O+qQaIuOV+Huh7tLnSQX0t/LqMXZbCrQv7zLq+dnLCKPv8DWISjPULkWnxHK6f3RzgrvO/Hanl5mLkzMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ8YHf5K3+MqTgzYmmP8XAiay0/XJn5CrStvgAUpCcc=;
 b=Ks1wZ9gEUnE2dqRxwuTEifdeypi+szKAWIYY7y42tR7nBIN2yW68kbaQrCy8+/kL5Lgw2iOkg8vlJtJB0P1UWo0RpnzzvnbRI8wPULPPob53lYtB9Pu3hOFZrjSGmTEjzCYQOR3Y1LlO39gdyuvs+xAVljnM9zrxeTeYrHOPlA4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2007.prod.exchangelabs.com (2603:10b6:102:12::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Mon, 17 May 2021 04:00:55 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 04:00:54 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add support PSU and OCP card on Mt. Jade BMC
Date: Mon, 17 May 2021 11:00:33 +0700
Message-Id: <20210517040036.13667-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: CH2PR05CA0036.namprd05.prod.outlook.com (2603:10b6:610::49)
 To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 CH2PR05CA0036.namprd05.prod.outlook.com (2603:10b6:610::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Mon, 17 May 2021 04:00:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b234a80-fdcf-46f4-ee35-08d918e85e35
X-MS-TrafficTypeDiagnostic: CO2PR01MB2007:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB20078B81A4E471CEF845FC18F22D9@CO2PR01MB2007.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VdZQvFHqjQKlAOj28lx2jx56jlZaPpv3kF/8+gH2ehOixPKsl7Xr0HGn+8W5cdYwmcjuRMSFWMF/siRvNQHtAG7bEPxxmmWqw/AOUtPsC5LZpVnioGGjiyauVeXaWd2EKL3HQJeXixl1g5c7+4Tin9Xg0bdOQeH7SEtjeh0vKj+SSCG5baZ/wEwL2DQmBQjlM2e6bBNJv7LRkKbwvxudTblhIrLW6pVw6Pg6VyrrHZ73oAxgk8sGUqW5m6l49vbVUC0s6nCcbNvE5N3gu3xFBeYi+l1vrKkms1GR0+cV6GnMrGELuV5G3YrHIa1EH0OR+BHp7Tkb+BDHGX1+lTYoriRG2RId+GXkTfLgBDwoSpN3+5+IvZI4BdzBBCS4k3bRU5FEQ4AlGIb2+2gBQXFtbT74dcnHVbozzhjvOIKd87oUVtvaDp2B/S4bmuQlMncMRQENXLZgSpaFdEgduQYlpl/8XJJyu9gffy3eUNK3bklxuVL7p9O9ZgwBFVvMVWs8lg2eMNrFv3dr3P84wHjuM63EVyQCthlxkw7v3fVSmqD+OuD3eXcTH6lA5lFvsF5W7m9N8NUCAp+ds2DrAFiGzV4/9vgWF4+Ev7uWdKKcthUTDuQEnfJaPuVa+5eR5Kmi0sxU3y4mxFVc7u3BXrySiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(4744005)(2906002)(8676002)(1076003)(38350700002)(66476007)(8936002)(6486002)(66946007)(83380400001)(52116002)(26005)(6512007)(4326008)(956004)(66556008)(2616005)(186003)(16526019)(478600001)(107886003)(54906003)(110136005)(6506007)(316002)(5660300002)(86362001)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5ZkfI88pWx84b/M2GC3VVUVhwm9kuoIdWTwe/ugghLZWhabIw5eBVJzRQTV3?=
 =?us-ascii?Q?WbC788+eC2aehNzCctgKZXlJR2zWLXlQ4Mp/a0vL/hly9tzOJIZfoPs8URme?=
 =?us-ascii?Q?bltVWGRayivX5egdd1TCPqF7iJcfX7mOiJXhQlc9wkHvbSAekSFLKc+vGAeW?=
 =?us-ascii?Q?4ySMTKcWXuxXK2LruEZE1WNXZMaDOYSow7zKbJZTuglMocvImwXebotygIZd?=
 =?us-ascii?Q?Kb02WYM7BJucoJ/C2YNPjhAqQGbydE9IH1DHYO/ja6GBP+L/Cb9HnB7s2oha?=
 =?us-ascii?Q?LJdnXVvP6xW7Si5U85exRlAwEUCiz+CgnnMQ+chd+O8tahGFhi3XpB4Yycbp?=
 =?us-ascii?Q?bTOV3agcF/M0VPQ9OpwErJcun4A6kVBahgfUknWrZQ2QnO6l/9CVikecc/BZ?=
 =?us-ascii?Q?UufP2lCXA06lg/oPqMifpV2VmFHAUSnDUQUseOgyYnh7+wEEO7UKIHOFIyw1?=
 =?us-ascii?Q?YsFjs7oDH1amnQS07xAayts4xfCEe25TQdm7wRWy0RKDUaOADdt9BdUkoHcg?=
 =?us-ascii?Q?BPIanhSszl5K5TitqGTPqYLgAkOEwjgmK05pNpZCEzh1I0A9zvFNGm3YumiY?=
 =?us-ascii?Q?1aVbd8bW6/UJ4n4PhiRbzzltOGck/AD2K0YILd4rNLZewx2N/zmFIIheUba4?=
 =?us-ascii?Q?EsegfGNhbThljKYCpN7Our+ytkj7H9AyQxRDyBap9s6+s1crtXm6l9WQS+jn?=
 =?us-ascii?Q?qhmYa1u9LBv5se1/z9m61CTQBcvLHNzLFpSEnzN4dxyTgxT087DgLgj3cPlE?=
 =?us-ascii?Q?RZEvSskOnjcGZCoM/GwuY/lGrmiGRQyHsQXV56/EORygqVcYrf6p48n1iT2i?=
 =?us-ascii?Q?Xvv/3rnImoRiCyqnoeFmKU2iMUHpj1Mbzd/9gjVzVK+BxjVkNETUpcT0EfSD?=
 =?us-ascii?Q?ZTbiHW6f1ZHb/ni4+jYcqXVvvo4e42WCsYE4YKLYlWFQmnEWImqzrX1Bknq0?=
 =?us-ascii?Q?bKedSbf+UJZ7jdix4H0ZrR2E07W343ruFfx+CU8Zztba5370hJT/WP62k96B?=
 =?us-ascii?Q?45Yu4nKs2d11A/QHVSfNsnpU27PQ7dtPAwzpD5/W5J9k8RXPtyUjp8fZgy2n?=
 =?us-ascii?Q?QFGALD8ZP72lcmic4SB7yOtSwh6YgjCW+8WEDzQ7qX4woZAR0YMorF5183ca?=
 =?us-ascii?Q?1YuZlTgqP76INNfJe1AS4CHMKEPRRXkYVPrm/2JK1mLVU8fScrWADfCIvixh?=
 =?us-ascii?Q?Vqx9gEAx/6+MU6TAvfki14oGLLBUGcMsBpSmUi5FDk/sp7GVmwSn5Jcx6sVK?=
 =?us-ascii?Q?yhAKI/EQydqSlNmFQnmg33sYtPXWyS0sc62hb5eHWjDveeSehu3RYuCFU9RH?=
 =?us-ascii?Q?JmolyBum5JKGLCI31GHQ79x8?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b234a80-fdcf-46f4-ee35-08d918e85e35
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 04:00:54.7564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIAHkU52FLRUB8JZfGlHWwUttMKPTy72D0NQMIzA3uItEvRdnmoja16I1+hQtEd32y33DKKiYtL7egXxsi4is1WNOpQDCtOVb5kOqldI0Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR01MB2007
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
Cc: openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Jade BMC is an ASPEED AST2500-based BMC for the Mt. Jade
hardware reference platform with Ampere's Altra Processor family.
This series adds support PSU and OCP card on the Ampere's Mt. Jade BMC
and switch to use the 64MB flash layout as the 32MB layout will soon be
exhausted.

Quan Nguyen (3):
  ARM: dts: aspeed: mtjade: Enable OCP card support via NC-SI
  ARM: dts: aspeed: mtjade: Add PSU support
  ARM: dts: aspeed: mtjade: switch to 64MB flash layout

 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 57 +++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)

-- 
2.28.0

