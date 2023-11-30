Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C9A7FE9BD
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 08:30:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=LEMuUldC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgnsH4f06z3cjS
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 18:30:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=LEMuUldC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::707; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20707.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgnrh5tM0z3dBW
	for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 18:29:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiFsWOQRfFzkyxNhryXe53XCQEbOjsSmiMtKz6oo3PEJmVFgV9pD2LiBcCktFPWUyrfh754szgnkE4+NCennsF6ahB+qd8pDrzfwKTEl8GOpfayNTvnF4TrN12IirDxr8t7XwkZlHGJLwzTOQdO5iEyhVGn/FyiAcQD7P2BAWR8JYeYfrya1ZgsawoZWX8JIclfyNj9srur89gPKJCmEcqmjayww1XdIZlvaG2QH/WwU1tZj+kAV7lw65reDKr5RPONpXyuANUxHyGy+WH9HF3VGTrUEnAG3ofDMmTr4q9BMuYLoObcKcBe4314X0IgiWGRy2sChcb5fLEEezOhf5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGJ4C9YNfWvcT8KL1njUy1Du2f7Aa2zAVis/DpjLyQ0=;
 b=WSVFM7YcWhNPOZ11dYZ8XzeVrueAc+O3JJ1xIl0uFuwOmL61YBPx3VO+bXV91ZyvFS6lnVvibddv7Vt5b9t6t8ij6LJ45yLm52RCwOl84a5tfwPYWnvjxXMsuSB1G8o5/STHmczkPftS3wfwvHGyCqPbd0LHuxKJKnRWeZdaXOshGVJcIFBAqYX75StF5uWrfVPbhcB8ndbcYCMBiMFUf1fD8IyZNYqB2kHt3LRDA+P0Me2UdeFX8/IUP304o2l68eOihBKXOvJGB3ULfiCszYoIsc6J13yA1HDIZptTphhik2qn3xYQoxyX5w7I/PSLUEZXD+OQeCnLwMxO+lmDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGJ4C9YNfWvcT8KL1njUy1Du2f7Aa2zAVis/DpjLyQ0=;
 b=LEMuUldCGMlyn+1YhP8Kmbp7ad94IHl1x4F38vqIo0ieLntcRDfWe6k3ihg2IpvSGsjyDatw7b6heFo5uwkRte65kTpDl6UVfd55XlFwlWTLvR/ZH16mSs07Hexf8ENGdESep0k0peFdKD/YLrK6QeC207WIBtdE9RqxdI0WSGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SA0PR01MB6137.prod.exchangelabs.com (2603:10b6:806:e1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Thu, 30 Nov 2023 07:29:20 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 07:29:20 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH] ipmi: ssif_bmc: Refrain warning printout when aborting request
Date: Thu, 30 Nov 2023 14:28:49 +0700
Message-Id: <20231130072849.3075741-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0127.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::31) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SA0PR01MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e96be1-7384-471a-a85b-08dbf17610d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZKeSNV+NsIkseiwHMVh2FX1VLuzJrCiNn3cKVoNzd3SmSNYUjPrQ1JzC9L8zN2wH90qW8onzxIqwea8/TsMrzC8ayzx0OdrF3cPpx3nC6V0a2ugsjsl9d3a0qt77NiWhkxHJQIXi9tIiAMn6Nq3gR9C23Q4rQIhUreQLIvVUQ8fgj9o3wQCVfJ4E25aXGJ8uAq10fBifO+XGLSuDQsXS7zgU19eKemF4gAssiXHOxqXJCf5v2S4rAoVOIbzXDb3SiA7JN9Jg5j3zMU+M2zJilHoD8KsgGMOGzBoiqw9P9JIlA0NF+FTmF8CMm9PdnqSv0utp/750CUGWta5t1qaqjBHJYWCepubnoSODCgSAcb4ivnb+1HTfMJDVEpqfaBJUd2EuwIh6npCv5MDvYttIpsRZGGVbw+ALJMOEs4eF7P8qWD2erbBVm8X62u30eqI96tEIGLVDQcHue08M4+XcdVTWrs0cal78CxAc/vwE/nbT8MXex6D2UsLIJOnEudMwO59w1xzf+FKIVinEm9LvKr8BCZ0WrcDlbF86pCbhDHazxD3KFEACDwBk3gE4CZw7ik5IeB4qzdVzdVnAZjwQa7LZDDdIruxLVw7VActcDtPRecjox289H4WOHxKuI4snaBNYEzpu6jX5xwrvDZ0CMXomYXmnhacCKfgRVKLWqe3UrkkuXuv4nBzmAWsFE1w3ODIgn/iUcaCJgulbn7LqLw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(136003)(376002)(346002)(396003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(1076003)(107886003)(38350700005)(83380400001)(26005)(41300700001)(38100700002)(202311291699003)(52116002)(2616005)(6512007)(6506007)(6666004)(6486002)(2906002)(5660300002)(54906003)(316002)(110136005)(66946007)(66556008)(66476007)(478600001)(8936002)(8676002)(86362001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?gKf4R/VhNC/5lwIhUsittu0Mig3idFm5IpzTjJhiVab7vp91ZomJkl0Up94J?=
 =?us-ascii?Q?4cDt2bnsy63/AbgKRhnpWH64mjml7YVjCiMw4NMqOwmDhgbvV/Dq3kPqjtRu?=
 =?us-ascii?Q?lwNy1rRpW9XNGtgYMRkW5qJjDvjMaLuJ/IZYeWzZLD/ivUWFL4qjZnrTfzbK?=
 =?us-ascii?Q?/sQYQDN+H87NTiNnPEnSkakl7+OruIBdkLnn6E2Eq1bxGcNhLd6MnPvUg687?=
 =?us-ascii?Q?mcwyKsLWIqHZghVHHh1XCf5mKzRtEhs5nSyktCcZMVyeZAxGn36SvLie8pE3?=
 =?us-ascii?Q?kJ8DfA1321v1xoo+62J52KPoGeKDqAY3zakrBZLj6aT5QKb8Sp5zDP+zi8sI?=
 =?us-ascii?Q?mV38gCzr3hhmzFInzaWBVaE7K3tsuZ/7zePIX97ie6qvX3Gmcwiok4ojCalS?=
 =?us-ascii?Q?Hc7nnJMYtfnacyvFAJUhkdRwQ/ly7sud6oTs/+waN/XW+1Ir7Z4Fu0eLAE0p?=
 =?us-ascii?Q?luEl1Yh+0wDBzjjZAP+Mk+xbQkkTny86jQem7Ls6R8vj6jOEz/tLwty9iw5T?=
 =?us-ascii?Q?uZYFq3VDAmbD59SrsiWWpeancWb2cfLUa5Y+7W3yfR7vtrBwDbbmZAgBnUQE?=
 =?us-ascii?Q?Pba4nhY2yuQaT3e2pjJldawBszsI52gEsvZRzD+Pys4bt6klSp6dLG/2d0iy?=
 =?us-ascii?Q?7k/8TITVCI0GM4lE310gGgPEKLMEW7KnWzDG/tnaNhx4z9QINJl++Iq8soza?=
 =?us-ascii?Q?aw+kMwzazBu+2YPRMRoK9CpLhsXlLEbYpJbi11Zp9RSlb6cXvUO10ayaq03G?=
 =?us-ascii?Q?flrAeY4TW9vd2R6R4DmHYQoYxd8zmog24zgFE3MXEaeGGYpv3vwAXvrLJFEZ?=
 =?us-ascii?Q?ztYxLFm2EG3et4fTFkoK7SHJ+NcauctgrTwv444kOqsVGVdYTVNYpdzqweAL?=
 =?us-ascii?Q?zxdFhyVYCdbwqUz98aRzDi40/1PhT6SzG6vqhFaa/COTWrN8bdM3Mavn0p3y?=
 =?us-ascii?Q?GfyT03mvb80kWxUULlmqdpMwSu8+kCY2DW7sP1hh7bIPQk9p5HL31y/N6r6H?=
 =?us-ascii?Q?5ey4ZSOnkb13s6U6Z00NwLiaUI89viT0fmkh8DMPj+ldRhC8aCAbYa/y9Lja?=
 =?us-ascii?Q?3TwALvfeXUTZILkclSqBkgRnscTkg2nWMyR2juZHe5IjIxknqBXV48ZnMBOU?=
 =?us-ascii?Q?dPF1FL4iNdLdu5OX+MB0LPHSryz665DqxqFMA4jiOdkvuABHisaWLPYqHGXs?=
 =?us-ascii?Q?pau8Kb2ZVCFKVIMTDy65U6NRdFaBWU9wMN96De8V7H8bRI4FNHblF6XaQLlz?=
 =?us-ascii?Q?wZL+qeXuOJ0e3/NKZQLHUkTui07Y6sxCrIEOiLmmvWa8cnTpblCTvSYzMEB7?=
 =?us-ascii?Q?QfEwoDgzVXhVTuXWhua36/NMN6GOCyqb56pu3M/kRQ6l0gzSVLOXl5lpJ1k4?=
 =?us-ascii?Q?IdEs836xXgcVkfx/OIJJdw647lTPYgDe10P2TMX63nZqV48VnfU3nKpAJdo0?=
 =?us-ascii?Q?AHUHShqp7l1Xmp4H39mZwL7acWr0TGHcfbopKlwQwdRzg204JH0QHDBW0ds/?=
 =?us-ascii?Q?ofz4S0Vpir0TRc88pGh8RrzXe0Kkx9K1bkUEjeDxsNocHf6F1Q285RJR+iXY?=
 =?us-ascii?Q?EjPWB6RNvQaKTzQsMT3LZk8OsI+M+ZTvcAYYbSNBY25iElTUSOgSFAnRnQ9F?=
 =?us-ascii?Q?oKjRB1p5N/V1B+misGe2KkE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e96be1-7384-471a-a85b-08dbf17610d0
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 07:29:19.9207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cmUevkypJzaOxUwHmESvtnd+MbRmMgblSTwU2j6/KKlRWZPXQICt6RKgKIesomSDJK7Ezsg0AfDAWEjgZCe1leOtXwY1/3+djMHh9od4BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6137
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ssif_bmc driver discards the current request if there is no response
provided until the new request comes, during that period, there are
multiple warning printed out as below:

"ipmi-ssif-host 0-0010: Warn: on_stop_event unexpected SLAVE STOP in state=SSIF_ABORTING
 ipmi-ssif-host 0-0010: Warn: on_stop_event unexpected SLAVE STOP in state=SSIF_ABORTING
 ipmi-ssif-host 0-0010: Warn: on_stop_event unexpected SLAVE STOP in state=SSIF_ABORTING
 ..."

This commit fixes the issue by refrain from printing that warning

Fixes: dd2bc5cc9e25 ("ipmi: ssif_bmc: Add SSIF BMC driver")
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/char/ipmi/ssif_bmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
index 56346fb32872..2857e7341d65 100644
--- a/drivers/char/ipmi/ssif_bmc.c
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -718,13 +718,15 @@ static void on_stop_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
 {
 	if (ssif_bmc->state == SSIF_READY ||
 	    ssif_bmc->state == SSIF_START ||
-	    ssif_bmc->state == SSIF_SMBUS_CMD ||
-	    ssif_bmc->state == SSIF_ABORTING) {
+	    ssif_bmc->state == SSIF_SMBUS_CMD) {
 		dev_warn(&ssif_bmc->client->dev,
 			 "Warn: %s unexpected SLAVE STOP in state=%s\n",
 			 __func__, state_to_string(ssif_bmc->state));
 		ssif_bmc->state = SSIF_READY;
 
+	} else if (ssif_bmc->state == SSIF_ABORTING) {
+		ssif_bmc->state = SSIF_READY;
+
 	} else if (ssif_bmc->state == SSIF_REQ_RECVING) {
 		if (validate_request_part(ssif_bmc)) {
 			process_request_part(ssif_bmc);
-- 
2.35.1

