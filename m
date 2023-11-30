Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B67FE9F1
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 08:54:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GAoFdcgZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgpP354S7z3cT8
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 18:54:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GAoFdcgZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::72b; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgpNQ2s74z3cCv
	for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 18:53:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+WbDS611KgkvhVYyrViY76mtvhZrZonQlW/ch3Zuo4mXN6bRmVLaimul1pNWY8naP+lX3MXpQA+xtq6WKGZZr72uoWCIFRdv0JvgatewRv/JB6pAxTJYLSfoHW6V4mukiBKC3iHeCt6GZ35kEtVvfRbuuTg9BTZE1h4QusEkRmkMJr+zltkJ2moadtrnqbQdL0OGwVY3PZvTGJlegdEnpD+glQaA50IfLHHLP8GBvCpzjSsAPTRIq4nkE3TN4LSzmu4F9sf4oSIIZarXo/Y2Y4NWbrtnfdhCAC1gEI0tSpih6X7sWgpebMpTeWwsRb7uCXb2jg73u4fzor+ehJU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asqmTou09C/3k66FLy5kyxq5QD0gk2YCPZVq0DeXgMI=;
 b=P4BgUFGtHTLh0Lk7Rx6WUO9BckKfSSYCFoNFTM5bRRm+kELxR4D3JrSjYpwYyRMICPmE17g1dupXxRZ1z/G7ShFeXl2806uwCz/JUIMjRIOWoFVXkQOCRoOHb4hViluyfXXIJQbNKwT1TcWnWKHUEXH/RiDc4fDVHHRPdJyE/+/Ijq9Op8EGcD1q1kDeUbjksWX9aLqJ/DId1Q1ugph6ckqRQoP7sF5M6dIhELG7c+zYmCF/DDkthHLimjES3JY6SUeKOU+Bx2KtAnmEhlAZWS+v24ATvPghv/YAMI0lsddOtq08xsI69G7JM46nGoz7FTx0AS18XZL3co40fycTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asqmTou09C/3k66FLy5kyxq5QD0gk2YCPZVq0DeXgMI=;
 b=GAoFdcgZE+1LSIQzgSyGScnyp3V3qOjGkDFTlMc/D5wi50/gj0thBe9ZV/0vVjO41WbkVKB+zOSHMMjE+tDPJRjGW7W1I8eACZEZn7yod/KsvuMH0b/2kM5wN7rfOgn04BtgkdbNL2+3DJAT9JcO41C9jd2G3QoKwl3Q/yrVPeU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BN0PR01MB7037.prod.exchangelabs.com (2603:10b6:408:149::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Thu, 30 Nov 2023 07:53:10 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 07:53:10 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH] mctp i2c: Requeue the packet when arbitration is lost
Date: Thu, 30 Nov 2023 14:52:47 +0700
Message-Id: <20231130075247.3078931-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BN0PR01MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: dec803bb-62be-4d3a-a3db-08dbf1796524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0RSgACKP6REJcVpP7GabG/UmPv5uEeQjfoWUZvQ2CA0cKzY7SalkzxtCbYgm1qxGmkGpDVtFPUgQLP+eC/oq8CYCKY//e4XQO0r+WtdDpTapzekIe6Ir2CLp+v/Z+eAH4Ts7m9ZhTa4jHTGo6UrW8ADi6pO7Y2VJCbaVN1k+0OHZaBvTBDtywGpeYrh8vgszHVKLD1gDT19jyGU+d+3V25mhZBHhqG1rHMVi4P4csbcYhuui58o/vNv0Kmw6IpSzaNoEuPWSSI0kr0zzAjAp1jK2E1CPskIpXvBFtSE+WRHDIFDDwZO2Er82zNjYLOqHp91uOuZ2awIsIMdYPVo8Fr3bBrjQrFllPoaCWWx6vGvG3LnH9oNBOz+ZD2UcPwHUa1uz9CJxrXulkHmAjruIGFvqem04fDHI30gb8ULQaW0Ihw3ykWtssabLnLJiB7MEszZZrxupPRcVSLYrHA5pJzYxAAOOQ06ahqMDQD6+HTMNCZMh72oyREdyzOZz6BQh6zHra/UxoMSaH347RG7NqDaeg1jQYaLfqyahj0DT3ADrY9/t/wkvYo43+WbeSs/PWWKfjPMq9Indz7lqfK+bH7xLgHaKIxUGOQz76P2tcOFE9IYknamuRHl92m9lqfmXS4E1JIG6kZBjoQ/jkWT26GqHg+C69yCfaWA/ARYH6zolN7z0dSfEZdbwRc48VeRrtJThbvcx8GHIpluJGdYbFcbitjpJQU3w34bU8DORxNA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39850400004)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6506007)(6666004)(52116002)(38100700002)(8676002)(8936002)(4326008)(41300700001)(6512007)(478600001)(6486002)(110136005)(2906002)(921008)(107886003)(38350700005)(2616005)(1076003)(66946007)(316002)(5660300002)(26005)(54906003)(66476007)(66556008)(86362001)(202311291699003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BTOFA95GMgy6W6Dkz70L9sah9uCiL5iyYcdU2M0IMTJ+EHkTexy3vpnqep63?=
 =?us-ascii?Q?mo/M45TY7G0qbKrPfmy4rC/jsH53hv9MZgE3Ldz5+1C41Oj2SsOwn0o17qxJ?=
 =?us-ascii?Q?EwyyDw9NcVhvh8LbnIYlXNIhLNDNAj9ey20YmI1ttBNBjl20NahSXfwwro4r?=
 =?us-ascii?Q?fSGP0yZ66GFbFEpc+3dPtRwX8sUiE4NMtA0bAEqRcbuZwxYedswhKc9K88DP?=
 =?us-ascii?Q?S7AEKr5HgRYBsdKoP8xAnffpw/3EJf9DWUHa4i4qPqvk35ns/BjfU4CAOo7y?=
 =?us-ascii?Q?DhDyahPsLqL6rMorV4u8Qu3C4ozA0uHh6N9ANEaQORNDgGrEe0yxXxY7Vvuf?=
 =?us-ascii?Q?CnRmcbIOOOFDwapOj+KNEqJeU4II7Uvu56Es+zkwERxcmHrwNmROP76dIZdA?=
 =?us-ascii?Q?BXDAAdpGivu6OHMg+ozb3hhZne4QpsQROtI6hn6AC4KNkNqdgJyyW1ztvDGn?=
 =?us-ascii?Q?XZbgnFYs+WK5ZMDItoPkUPXzc6GRUF2EpQUlwyjD5W1+JdN2E8wpbsxMLsho?=
 =?us-ascii?Q?lpuidcfUsaoXgKK3kL4egwyN2vn30F3/DbzZ4hUPx/Pq6POzbLz30AXk5agu?=
 =?us-ascii?Q?PnxvDJQsLsdbmldGZupQf0RKbruU4C195a7rP3m3iNUDDWsXk8oPfQqB6q0Y?=
 =?us-ascii?Q?nRYRFmt9cmRaX0YByAViO1jpW5dOYpe40Z4eoEh9HuN+NoX5eQUyVrO0QSS0?=
 =?us-ascii?Q?/CHjmXhNndgcyBrrkQ6KGCCOX+hxsbtN2m0iQDAtILqfhKhLtmQwEIHaD+dE?=
 =?us-ascii?Q?/WPET/XJ73ZdrA/sWQ3hTfL+WxBsXiGigMmlr6tpyXci2vb+6tJwLl5tddgo?=
 =?us-ascii?Q?zXGooHeSqh6AakyT++dlKkrYo1Jdqh2kQUCeG17nf7FObjx98uyzVZ8dbfxH?=
 =?us-ascii?Q?D84OUYuD+ucR49kLJ+uBUAvjxLvH0yc0d8adxwnS3UVilFHsKv1moyvdnORJ?=
 =?us-ascii?Q?UFcyvytdfVvUEiFue2Cft75g/lBSH68C+b5Pm0ExUlJesNeG/O/gcpA+2YqH?=
 =?us-ascii?Q?GHHRVjhcv9NE90ITS82T81uYZHvXDYwQl7tBHefuf3fJX+LT5SMSp3Zc/PLk?=
 =?us-ascii?Q?jyOR4soh2Juvd4dc3sUuFQk2k/XwsMKXaF7qt7Q39rAFz174f/7WmsiI5qC6?=
 =?us-ascii?Q?Kcl7YcbhJyjmgW7GK7cHBVjyxIyRoJ2gvEZGPDjiPMpgTiU9DXCGgO1ETAEx?=
 =?us-ascii?Q?KXhN58va9osFy31q1cDGi8/40f3DIMvcao+FJ6jVF71mv6r2bxwJrUqKq43o?=
 =?us-ascii?Q?lKyL9+CyQ2Q2AqMm2SsD5mu3NtjbzlIsV2qOm2eq0mDEZDrCI32+BbBNagtn?=
 =?us-ascii?Q?cYCDJtYOXnU/V4B/cLpGMxkUBAuGhzrMeBCEgFmT0C1AX0ZDr43Ntj4h/lYk?=
 =?us-ascii?Q?Q9umXeqC+02JbSIM4nybo22DXYMQOvODBoFFsDRsbzaehCyiSlyk3aQjn9Ka?=
 =?us-ascii?Q?0+Hzv/Q4pTCUWj0oJGRgkNFKhngbNPTxuDPjxSFkL8YqgifOJBW9HWIuTiVh?=
 =?us-ascii?Q?/fqYB3OyKuVb/pD254lYlgYEKh1gFvkzsUZxht9SduojfkJU98OYXI38OMO1?=
 =?us-ascii?Q?wiqvvo7Uq4b7jakW+Spd9Pek94/YFqA+qc/4/QEzQ3Wuc36AcSN5LmvgjcOY?=
 =?us-ascii?Q?46pGEmCRJnU5mTsM/ywJQvE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec803bb-62be-4d3a-a3db-08dbf1796524
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 07:53:09.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elJv3Q8NAPvHz53o4EtvuDVriztZEY/i3Ri+y+RlnLWfz9Cy3fz6sGXIx8EiU3IY6d8ebTzpSeVNS0SXzLK3iywdgVZaHIPTcr3Vy1ucP4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7037
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
Cc: Dung Cao <dung@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

If arbitration is lost, __i2c_transfer() returns -EAGAIN and the
packet should be resent.

Requeue the packet and increase collisions count on this case.

Co-developed-by: Dung Cao <dung@os.amperecomputing.com>
Signed-off-by: Dung Cao <dung@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/net/mctp/mctp-i2c.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/net/mctp/mctp-i2c.c b/drivers/net/mctp/mctp-i2c.c
index b37a9e4bade4..132023306052 100644
--- a/drivers/net/mctp/mctp-i2c.c
+++ b/drivers/net/mctp/mctp-i2c.c
@@ -442,14 +442,14 @@ static void mctp_i2c_unlock_reset(struct mctp_i2c_dev *midev)
 		i2c_unlock_bus(midev->adapter, I2C_LOCK_SEGMENT);
 }
 
-static void mctp_i2c_xmit(struct mctp_i2c_dev *midev, struct sk_buff *skb)
+static int mctp_i2c_xmit(struct mctp_i2c_dev *midev, struct sk_buff *skb)
 {
 	struct net_device_stats *stats = &midev->ndev->stats;
 	enum mctp_i2c_flow_state fs;
 	struct mctp_i2c_hdr *hdr;
 	struct i2c_msg msg = {0};
 	u8 *pecp;
-	int rc;
+	int rc = 0;
 
 	fs = mctp_i2c_get_tx_flow_state(midev, skb);
 
@@ -461,17 +461,11 @@ static void mctp_i2c_xmit(struct mctp_i2c_dev *midev, struct sk_buff *skb)
 		dev_warn_ratelimited(&midev->adapter->dev,
 				     "Bad tx length %d vs skb %u\n",
 				     hdr->byte_count + 3, skb->len);
-		return;
+		return -EINVAL;
 	}
 
-	if (skb_tailroom(skb) >= 1) {
-		/* Linear case with space, we can just append the PEC */
-		skb_put(skb, 1);
-	} else {
-		/* Otherwise need to copy the buffer */
-		skb_copy_bits(skb, 0, midev->tx_scratch, skb->len);
-		hdr = (void *)midev->tx_scratch;
-	}
+	skb_copy_bits(skb, 0, midev->tx_scratch, skb->len);
+	hdr = (void *)midev->tx_scratch;
 
 	pecp = (void *)&hdr->source_slave + hdr->byte_count;
 	*pecp = i2c_smbus_pec(0, (u8 *)hdr, hdr->byte_count + 3);
@@ -503,17 +497,20 @@ static void mctp_i2c_xmit(struct mctp_i2c_dev *midev, struct sk_buff *skb)
 		break;
 
 	case MCTP_I2C_TX_FLOW_INVALID:
-		return;
+		return rc;
 	}
 
 	if (rc < 0) {
 		dev_warn_ratelimited(&midev->adapter->dev,
 				     "__i2c_transfer failed %d\n", rc);
 		stats->tx_errors++;
+		if (rc == -EAGAIN)
+			stats->collisions++;
 	} else {
 		stats->tx_bytes += skb->len;
 		stats->tx_packets++;
 	}
+	return rc;
 }
 
 static void mctp_i2c_flow_release(struct mctp_i2c_dev *midev)
@@ -568,6 +565,7 @@ static int mctp_i2c_tx_thread(void *data)
 	struct mctp_i2c_dev *midev = data;
 	struct sk_buff *skb;
 	unsigned long flags;
+	int rc;
 
 	for (;;) {
 		if (kthread_should_stop())
@@ -583,8 +581,17 @@ static int mctp_i2c_tx_thread(void *data)
 			mctp_i2c_flow_release(midev);
 
 		} else if (skb) {
-			mctp_i2c_xmit(midev, skb);
-			kfree_skb(skb);
+			rc = mctp_i2c_xmit(midev, skb);
+			if (rc == -EAGAIN) {
+				spin_lock_irqsave(&midev->tx_queue.lock, flags);
+				if (skb_queue_len(&midev->tx_queue) >= MCTP_I2C_TX_WORK_LEN)
+					kfree_skb(skb);
+				else
+					__skb_queue_head(&midev->tx_queue, skb);
+				spin_unlock_irqrestore(&midev->tx_queue.lock, flags);
+			} else {
+				kfree_skb(skb);
+			}
 
 		} else {
 			wait_event_idle(midev->tx_wq,
-- 
2.35.1

