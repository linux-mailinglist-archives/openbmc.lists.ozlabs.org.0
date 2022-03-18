Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A82654DD51B
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 08:12:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKZvr4QvVz30NB
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 18:12:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=K0wJNDb5;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WjqqPzW6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=K0wJNDb5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=WjqqPzW6; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKZvK6SLFz2xDY
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 18:11:56 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22I3GrIh005308; 
 Fri, 18 Mar 2022 07:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=oO+NO0JlwWPkN0Tfer2AXtDjyCwZ/IOKBxXebPLJays=;
 b=K0wJNDb5X300D980o+BtWXfWxjBpH04CFcbY/GwPVEDTHVDqz7hCYu8XM9paOhHCd1Iw
 91pd0mv7jKVuT8n38kzJCckLur0wm5Vw/aXm1FDHZkck/TQw1zDF32XtBVVc1UhLoHbt
 UZh7L8s2PldDj6ucMeYoA0zXps2XqsjJJJgfrWZSMHhPwHPP1yz90U3GDcpSy2kOVF0b
 ylxhFD2YSn6qmuJ23an0yYXG7lh3VhCdVEYAY3OsEXyz2sW3liNfBOwjDUfOKFgoYWN/
 3LPpScWR1KSWtSIuLe4SNfGX6Eodwy6J9SxnZ8yKf8MPM0XzJzncbSzNddtsubKS8cgQ Ig== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et60rk0qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 07:11:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22I706uL097426;
 Fri, 18 Mar 2022 07:11:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by userp3020.oracle.com with ESMTP id 3et65a2g31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 07:11:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmDGkgV9fqpbvnfoZNLbd8zyxu9uobC8gQq1pqADrk5F7nFXr7kTSgb3tmNBXwBXuLyjaWjqZuz78b4ZQ8nWU8NQGcvCkuejR/nzOGM6sgTrrB4bLcreL41d7WYZvzGvpNI0u64prEQfvQKgRxh1zkXXdgYMIm8BwVJqlC9mQxJOSg/iHvEBs/RjUPzEnGo3FZQBpLDRbaPWys4MF1Im3JkEGms+o9S1XfcF+fwrUwid7jIIW/7UV5Fpc6ffjFT+uE0AI8Fr8qLao0tr3bhOxD7kRVy5skS8ggqLFBKOIFcXn0ey+xbgbZvuQaM9sU+L0CmRPjonXgpS+pvlRCl+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oO+NO0JlwWPkN0Tfer2AXtDjyCwZ/IOKBxXebPLJays=;
 b=Zs2eLWxHm45nFm4kpQb5QknNOHzqkvdBfnE6QyhTnWliABrilpn1U0Z3QQ70KfogFSgzAq/xifK30iPyjDj3I1tc174WgUBYVjxK0ALc6vXLu2cwRuS2T8AKwIkId+1TQNxrvfW7CiUQCFZst/qul4AU/uaukk3e0FDFCdPIPrvNzHtUBSb1psMBAXDFwJX1ipfuH+6oTw7LFxXVSNPqsp39dxbZoK7utD2RPBJZKIc8ra35sIK6V0DYyhTpZWx5WHh0Bzi9quAOZ+5X+J2vqevE9YJXPJM3SSsCGOF+03V3g+jlSWSfQ+lO8yMAPyYip6tuMkqeKESJEnHU/+cqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO+NO0JlwWPkN0Tfer2AXtDjyCwZ/IOKBxXebPLJays=;
 b=WjqqPzW6qQVhrwSU6KP3enen6lKaNA6UpYPLdUyGDxFxHTll9uIQALpky9+IAm+hb9lkQfiihg1KuQdF8rpUzlfMUgqwDCbrLDJol/1+hgbby4X55zMHZWU6q0UaTJ8YC7TQnbbNQC3O78Yzs2rMpvqrGlFIKPvuszH0rng6ZC0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1452.namprd10.prod.outlook.com
 (2603:10b6:3:c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 07:11:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 07:11:46 +0000
Date: Fri, 18 Mar 2022 10:11:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] pinctrl: nuvoton: wpcm450: off by one in
 wpcm450_gpio_register()
Message-ID: <20220318071131.GA29472@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0153.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 352c012b-af5f-4664-2c46-08da08ae900b
X-MS-TrafficTypeDiagnostic: DM5PR10MB1452:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB145288F3F5014AFACEEAD64D8E139@DM5PR10MB1452.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8exMQwPBjS8bUKSxpNDwil1Dkg0poU+EtI1VhJ3fOQiE8ZsUpX+ZyrYtnAIaE0JeVx0swtV07tBIIYAhaV+DPrTmo5I9nnRwaLoMB8uS2FRU/3i0x7Z+Qhp4YRgd1rzsFyUK7xftQANrOJ1QeBVdTqnjovvDjdzko+TsVUUID7QkFl7DGu4mMNdh3AKo7cb/oImBmuOoLEC9mTXJSJL6gjXNqlxqUuCUAEWqh9QJbpyHAcSNHl+BXkxYM1SjSMXKxgwuvbGi2uJxMltU5lVYw45cXQFadFSBdX589SaXhCkc3yL8lAOg6dc9yxJ2stJxx0o5LdaRhaudozVNNJHymetXTgNAuuYoJXOmcImTd4uCdO2F7p3s5mxt7AxH5Ia1jdLNiCAF5tJUo66Pdw6M3ARERYHZnlecSk5IYZ1EzgdGbpoRhxfhZvP/H02ek2v4iUQcQ9fkjHShUZoYamWBM4Y5792QH0Qiaxc/FPbiZxmnOAxYUH+469mkxd/5Ik2vGLG/nvdMPomVbyj4eAYfJyIne8aps0eCNiK4M/lhrXXIIq71UCocln49IP0GXe2R4q9V15uafXV+nAekc4BhgqOhv6GCMp+yW8X+IxKdC7H4Lll1jqiB2ijjfJTOZAoKFT8edqu49gOqNuflkI0lDMI6QYn0S0uZiT3U1MAsI6Tb/5XVx9/ik47ACNYN4U919Q+zeha8HF/Al4876JHQ0ccsRjpugcUHwVIiBhBUrHybu/3Pinb52nLFxG2OwS4I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(9686003)(6512007)(508600001)(86362001)(1076003)(66476007)(2906002)(66946007)(66556008)(186003)(83380400001)(6486002)(4326008)(44832011)(26005)(4744005)(6506007)(8676002)(33656002)(6666004)(5660300002)(8936002)(52116002)(6916009)(38100700002)(38350700002)(316002)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qExyHrHH1J4AlyaRZWLKQkdy2kzE4cH80c/psrMhBIz+KFVr+3TjJ0ucovAb?=
 =?us-ascii?Q?EO+RZvNGVHJOZg99iVkBZbN/ixzYt8nlUR/SoOhB2GHxZe2WxyFb4hmUTSLN?=
 =?us-ascii?Q?eVgiU75f6kFsFzP8th/um53y0fAEC9xeOJRz69dgVzHWF2qW+HS6mQiH4iiH?=
 =?us-ascii?Q?7fMo14ol6+/DEYictfMUJajYYg4vevVkMYPCEijDgnixUkMexP8mufVgohjT?=
 =?us-ascii?Q?fo8gKdzy9Jo1sIOpW3NTiCM9d5SRGFA7dKkUH/EpMJgobewxdmd5eH8lZ1H9?=
 =?us-ascii?Q?UrcwIy2HFKceTWY9lpEp5yLT8zbYW/IX+VIKpQNLaHfEozXK37By3lOb6Xts?=
 =?us-ascii?Q?J97ZqdDbc6LIaYQjSyySAY0lsBW5MX1iAJRQZWJrrct61fQMAt4Vf/C296pb?=
 =?us-ascii?Q?jx7m4pJRnCwa1h8MbjKUt/7LKqWdLAPTHHhHkp4ln8TD7NBjU+jaX+y2/Kpa?=
 =?us-ascii?Q?0Sta9Qm0oyyuIZ7nek6uMlLhb2vQPAiNsSktq8aASYZfAR4f1L3TBTJMSQh5?=
 =?us-ascii?Q?3ykxTXe776+th+Il6i2JD4u0oa0VNkOdSbng+UfKXd1KZTTXfECN1//qkXcP?=
 =?us-ascii?Q?3ATJsNTbyfBr8BBSAIaSR04bOoK7joPz4TkS/AngSK612MpbM1VeQ8eVuRLx?=
 =?us-ascii?Q?h7z7DUTNKtJfqb78I08OqzHPo3AJWDG3MAAD2Z5C/D+EC7RlLhY36bgNaISs?=
 =?us-ascii?Q?/gS58X59bQUer6SwDAm2RLsuwWfPfjdfT+y4XL+BkyZaSKEFnLxBaHT/Kp7q?=
 =?us-ascii?Q?F9Ne4o6pgKDj66NEV8uc9hycy7UVa1PNwig5L8OXU/6ZctIcTQYEunmmioe3?=
 =?us-ascii?Q?syEYQBH3uJXXHnvWc2dOtzP7OGa2mSrA/IBEtnU7nH3hO0ObB99DhZAymN6s?=
 =?us-ascii?Q?JyB2Up2cx2h6Hfa/B52xFUCq8JF8XFWaBEVABweJXFnfGAA9MUDaHm1TK6UX?=
 =?us-ascii?Q?mOnlDTbZxB+At2LSmoGzKeGayKKgOnJZtR25ilnjrL5uYOsQd8Bbxyyr33xb?=
 =?us-ascii?Q?colcLQSAF6toGYJOLTOgCTg+CY0wF7V1w95Vbz6/3vx/bAbgl45TRCM3C5BB?=
 =?us-ascii?Q?8YF+GumnINVokaayfoShmxpIzMGRR/T84KSltxtZphxIUtvxxh/QnHDK9M7f?=
 =?us-ascii?Q?odjhMxbFddmSQxBPLUTC6yetBDV5C8nSWesMYL00S/LRpvmOq+a6ye1mBrfK?=
 =?us-ascii?Q?qRR9r+JMCkLBY9UlAm284FZ5xqkHuX/NDEIrOifVqNy3PKqbfZOCs29ri85F?=
 =?us-ascii?Q?uu85cIsPAnPQ61arja37RMnifi7WWxAkoo58TIrtoX+9IStrIroBOe5q2S/K?=
 =?us-ascii?Q?FEIGkVE1XZxZvNMKxQhLWptFpy9ntSHd6yP3rIu1jxkH0IrGl84b0Kus5Hhf?=
 =?us-ascii?Q?Oylmp4Njf27Tdidn2dtNIfMRd04rGCHJdpLd/6ZS3erlj2v1ULRgHLq26cNL?=
 =?us-ascii?Q?nW8wdfKjv7LlKTab4PzRVzQdyhMHJHE+XW+Zdcx5HgmMva0yRKmy7g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352c012b-af5f-4664-2c46-08da08ae900b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 07:11:46.2048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x98NnXwJNy206szdMQIV8EZzSTck1O3p5nuG62CxoMsoO464TdPvLNiJ2cMlt0bjwviS8TQaCBoC6C3XAw2w/ICciItEo4eyJCkoLwt//dU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1452
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180036
X-Proofpoint-GUID: KpTdRtdBFUg4Dv1YKCWvuMSkx-Y2U_M2
X-Proofpoint-ORIG-GUID: KpTdRtdBFUg4Dv1YKCWvuMSkx-Y2U_M2
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
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 kernel-janitors@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The > WPCM450_NUM_BANKS should be >= or it leads to an out of bounds
access on the next line.

Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 661aa963e3fc..164d7a6e7b5b 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -1043,7 +1043,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		gpio = &pctrl->gpio_bank[reg];
 		gpio->pctrl = pctrl;
 
-		if (reg > WPCM450_NUM_BANKS)
+		if (reg >= WPCM450_NUM_BANKS)
 			return dev_err_probe(dev, -EINVAL,
 					     "GPIO index %d out of range!\n", reg);
 
-- 
2.20.1

