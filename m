Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0822C5EC2
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 03:33:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChzFR4ZxDzDrRc
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 13:33:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.92;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=hUzsZmAd; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2092.outbound.protection.outlook.com [40.107.223.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChzDX4QN1zDrMv
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2020 13:32:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mpk4sVThE8/rxx44P7zds7mSM9O/CZf9uon5r8J4ugC7aPlQItCmE4I5f2A3dixE13jP75wNzF62IaNX1BloFBHFOOx6wfBBz9ck2YSxmpPwN3lVy9+eJcjvhZGV0tPpIcC1okVumgat9beufPZ7f27o5kzQTQAn8iadoHOT9bKMg0ChIO/a3hee+RJYMN/PWrKv7gQLpzpsqKGkCgpCMI6V9ckBXOp6qAj39Qf4hjdTdg6GYTmlQmGf4S66Jc0V061qbFvUl1jVh8vaJpImVqnF1JXUhnf/y7PXLWM5dplfgz42QHeaKSzzqlrCD+3OpzDgCdfSZcunGoz0hlk2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEhAVUtkDCM5exCHPCuDkzS3/yGffRsKOffyIlnhCjM=;
 b=ENyiL2nE3zPSL+daL5C5KALhb7u5j40CFIeSZm5FjwzN+bRGFg/XDDCTHWCUYaOmotYp5VcN6MOj0QtVaCyo/jmzLxwm2ochIg4x+fBsPdWhW5BmYI8kOgch4Y4eU4hib2jq3jFrrG9sXEL19ujomEaexT0TCBWTYXEoKrz0IzxGY8oh0ClWIaOxcg2PPkxoPciLdzqGxZZ39XtnV1RO3Ly7+Txk//PO6OiHUVy77wqxp40V38lsMi0K1RAaCxpQ+ZGAXDh7RxW68t8Q26oMcR0Gx2kdUDy8xbRJaorsxT3cZKN1JB++XtPzImv2SeSreAZp0JgWkvsHE1/NqHUafg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEhAVUtkDCM5exCHPCuDkzS3/yGffRsKOffyIlnhCjM=;
 b=hUzsZmAduyd83dvFsP3QbOxd9XF89nI8bj/VXBHRs7aCMTODCRZjyE1Ka8Ij18SnQvXn61T3OhufzZobSVPs5/BvDwMgzti1/PqJ0LO6RPqzNzU9Rs9ucOyrlYWU60UuGaJUPOQA8zGf0GCj5omU/EXP2OP5fmeFuL53okhwJeM=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2592.prod.exchangelabs.com (2603:10b6:300:3e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20; Fri, 27 Nov 2020 02:32:19 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::a88a:570d:e821:e1f]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::a88a:570d:e821:e1f%3]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 02:32:19 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] ARM: dts: aspeed: Add Ampere Mt. Jade BMC device
Date: Fri, 27 Nov 2020 09:31:57 +0700
Message-Id: <20201127023159.32456-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 02:32:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 277adc0c-854e-49db-ca13-08d8927ca947
X-MS-TrafficTypeDiagnostic: MWHPR01MB2592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2592D58D6235A3FD4914F853F2F80@MWHPR01MB2592.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HHMHFR3AV8apsfXrjyFbl3q2I9OyxcR32wI3fm2TPCNWKJ/hNqd0HLUg9d+mZs3TCUGFUvU9uMNnQGec2F3b2TvZexOTEC3v01RSS7kPeA7HKr8VomVU80JCTFOLmgxzYf6aJP1Mj80djEhkIEy2tNlwlR4jQ8m0pwx2ZWGUPsewlnO5czCMChKqwvpUC3c+K1/gGlzH8e8SQVnbH7GhDybb1FXgZB0Ppm/z55RIP/WSM1y+darRslsPuz+BfqdtZ55U/GV0xsE3Fxew/sYm4mGKUOGePApeK3sPyHoFLjPN8J87ShTHsNloklZbX2tZ5HT3QIJIiRqjkvBWFpDYpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39840400004)(366004)(396003)(8676002)(66476007)(478600001)(66946007)(8936002)(6486002)(66556008)(4326008)(4744005)(6512007)(107886003)(2616005)(86362001)(5660300002)(956004)(16526019)(186003)(6666004)(26005)(52116002)(6506007)(2906002)(316002)(1076003)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Al3xSjjkD6exZhY7YQWyD8gZcTXxE4S6DUD6tXI/mQ6CoBbLW1SPJCLviyap?=
 =?us-ascii?Q?9wNd9grt/UpZpYm9vQg5pIUMpkwB7gOHwAUAA9GNDBiD/xFKa4Dyuf1rNg4b?=
 =?us-ascii?Q?eH2IPncLI29Z/a8BmMN83ta8Lg7Xwoj416mlfpfa+zd9jzPWbU3iruehX2KL?=
 =?us-ascii?Q?vMG6gHbuwF0f4MSyuxubvEN7a8//Yg1nUlUR8oUU3jV6dL5WPmYQP5NoagAp?=
 =?us-ascii?Q?V+FYCDhDBJMZt4KWHLJeewRwLJeJlOx71T4UIbsN/9Kc0T25sVGRxU4pa+Pc?=
 =?us-ascii?Q?m9DfdfmKmJoB6CDgPbIAlNYNCWTWamdSnewleMY8QOCBG8dndOUYt6ztY+Ib?=
 =?us-ascii?Q?yYSVEKddJ6ocH8fP8Rdam6NLPWUZHg733piULAxHIMHYLBbGQInnSNKOf2yv?=
 =?us-ascii?Q?U1JwEU2yXZNQZAdtkgNHU0EvkuQSyRuoSmYB79MZNkOjGBHCEpXtdjBG9PLh?=
 =?us-ascii?Q?ThL2W+yV3smREvgKplj8FSuiaxI/ynRk417oQ4zB4N4wHWS17mWOVVFKYEqU?=
 =?us-ascii?Q?uHPYP+WoibMb6nilF4f251H74I8WifETCs3SoNSqh61eF5eYgwHUhVoUxEVF?=
 =?us-ascii?Q?XPvVvdP+fc2ORTaKOFchIZC/C2TtPaKCZH+X4U7AEGLPMUcQpUXGUvIZOEwW?=
 =?us-ascii?Q?jpx7cvbx5UKwR5hILySfzunw4q1xaZ1/QCImgnramYXlS5E5eClTfmImBSFV?=
 =?us-ascii?Q?9C6+cD0tyOP+Zxr6Eu1kmdlaHNxZidzThqfi6AtWYTuYr/Hr+RiGi5YQLU4F?=
 =?us-ascii?Q?M10WOhVsjNAMHEHOwbIIGuJCjCIRxyBKxZftREn6AuAFZLscXVJ+dSr/yXAO?=
 =?us-ascii?Q?/h/cip9ShZgI6fSvJvP2nntdU6WMaEnjOBn9eCSpdnI491QtRbEH+EZ6CM7E?=
 =?us-ascii?Q?w65smpJDtfVP7xy4LR0N6BHrkL1zMIlmI5u29XRWCP2zXX0Yp+RoVYCDrEvC?=
 =?us-ascii?Q?V0NkiGfqaRCzwWxBlHLgTQtUBDESTIBMb/YhCH4F0JlUtFnsxR32W1e1KVOz?=
 =?us-ascii?Q?lf0R?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277adc0c-854e-49db-ca13-08d8927ca947
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 02:32:19.1626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4NrWVGZ6WD+K5LjTqNeDd3Wd0fEp91MN4WDM+lMZUCT6Hc1Bm9YVw9koc6vz4REKvCrgSqhsFA+YyIrEyVCAdYxPxGy+8shCeO4XeXeF2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2592
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

ARM: dts: aspeed: Add Ampere Mt. Jade BMC device tree.

Quan Nguyen (2):
  dt-bindings: vendor-prefixes: Add an entry for AmpereComputing.com
  ARM: dts: aspeed: Add device tree for Ampere's Mt. Jade BMC

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 568 ++++++++++++++++++
 3 files changed, 571 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts

-- 
2.28.0

