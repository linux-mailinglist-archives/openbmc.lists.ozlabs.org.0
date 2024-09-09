Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7932D97260B
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 02:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2kYC3btvz3cDy
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 10:07:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::629" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725862445;
	cv=pass; b=OjoPixtBULqR7xxGcGrb7eewuZeAwtdE+vRTWPb9RLxONx5QmnoO7MPQ5Vlb8vcDBATldlOkHL0Cq9UzUP5CmyNw/fu2YFGf94vBszsddOWQMASnWbvyUjl61hZjKOgUgEd3/HKx0Si3N8uz4Iyh/uPUQuK9LOrOan1fSm5tdTGZPqFNMUVLZHsMhQ2B5M6L9GKWL+TvJjCDfxQmNkkCVnlceivEs3XMfIJ/gNM/PQK66C9ojX+Dafeb3b3P0l7U0JCq36RUzzY2nWiryzyOGYnKmtJs9YNOowmjgkmJWxSaz8/LDPMIxe0MH2exgC6TMQLjidOStOmfkgWYTGE6Jw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725862445; c=relaxed/relaxed;
	bh=g+Qb2Xthgx7cA609kjqtiz/yKtMaj5HdZ07kZUELu+w=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:Content-Type:
	 MIME-Version; b=FNBHXZthcKKNe0/MDV0Q/QqdsRweYVloQRN97SD0FgV0W6J3I2mNPWDmkjCyLM+wibohLh7oJpFJRJZnMm5Sw/Pfiv/mH6cNW9IOiprNTXdOyxbGi6zENDIx24AD8kdZ9vxK1jU6/YNb9F5SsWOoOLEXlDo8e52fvY6mEKs58tGmuxX4l0uZiNyS8Wt4Dvn6t/6OplRDnjjaVazryJK+cWxIYHGuhM5GcO5/i6Yep2O3H3R8UaXKt2ajuF9k2PO5O7EnSYL30MKI8HUQvPqsswb5P+wKtuFI2AhkWlb6GvWXTbp6C3nV0WzVD15zFskjPuWnteRJuucrYhWDPwZz/w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=J1noaHGz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::629; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=yanzhen@vivo.com; receiver=lists.ozlabs.org) smtp.mailfrom=vivo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=J1noaHGz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:2011::629; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=yanzhen@vivo.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2GkN5Fpmz2xdY
	for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2024 16:14:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DW985P60uU7bUQs7nsFs1elkdRbfsXIAS8mPYVCzOOdmpsHtk8Fv3gpCY0lHxuUk7wu7MqmgINAdLn/q2OjF3N4s4/6siMAywgaL5weZJpHpnYwCg3whCAVycofSS/0jL8cbpecqkQRno8B/toncR96BInbvkgShtdqm6tlhZvuv0EDmNmN3/E8LHC2ionZsnpHTS72Rre9mduDAM3s8HE8aqsj5jCdoAz9pfjyGOmGLNIpDaEGfF9Vz5pWIVZhLlFA7553r46MhIJpUF6ynLxaUH5Y7Mf+cDKMnkZVNZ7Ldwg+z0LI5WQcHcx0DSKlsYP6acQX3WJB6CzActG4jDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+Qb2Xthgx7cA609kjqtiz/yKtMaj5HdZ07kZUELu+w=;
 b=muAaXLpgghuafR1M1ejwLKvjehavSAiHizX49QKV0psi3W7bcN45DewMQz4o452hXe5da+2BAwPeoCylvDQmuq/J9rWCE6I3YIBOExLsb7MZeMEKT3p+QXXZzltmEbaj4Zgw1TpUf92ILObLxz4WG32Q6/ogrnUNBAuwpVzODQMjO3XDxokPFvet9h+5fa1FIlsp6LNsHyvWR8bcO79smbJLPd3Rsk4OyKjdVIa1Ja7gbZwRAHan+/kwnYyTut5ru3S4ca2mObyNWkcHJAhjxd8t8TCs4Q54tk+scVhwmCVeoDeBUvLUmyeh3eYcaNI2aKF33bD8j9o4M/ZoGD8qwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+Qb2Xthgx7cA609kjqtiz/yKtMaj5HdZ07kZUELu+w=;
 b=J1noaHGzCZVQ8ddFkYcNCcAym2RwOgQzMc8I5nKYZTIDEStZRr2pZn20IcIEW8TJbIIENgo52DqY+N2tXiUUOkf1DKpmhMiWFqrme9wjwN7PCX6k7HJQYKWBz2e/+YbaV+M69d4or1IIzth7z4Kvt3RMvcg7iZaWrv5fYShtySWqJAOsdR7CM5Mg5dpuEe2fWEA3KOE0kdj26QWxpGEMHCI8NBKVmke6gloM1mYITUOcpzmakcUDtu6IxOUDNl7jrKyXu4MNdQxDbvkL/DABUUqhED/Mm4fBOPTBHvGwQkXm3a8CD10A8267L29k2AGvqy6YPIi+iQEYVcdDvbjNdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by KL1PR06MB6209.apcprd06.prod.outlook.com (2603:1096:820:d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Mon, 9 Sep
 2024 06:13:40 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 06:13:38 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	p.zabel@pengutronix.de
Subject: [PATCH v1] reset: npcm: convert comma to semicolon
Date: Mon,  9 Sep 2024 14:12:58 +0800
Message-Id: <20240909061258.2246292-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0297.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::20) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|KL1PR06MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: f97ad28e-2ddb-4107-d873-08dcd0968b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?5/y+233YOsp1dzYP+PPWDAK9JLp7A3sQZG7nnjqIwkc7OO9lrRm9N3v3oQhN?=
 =?us-ascii?Q?0xrAectxmZdcxvLzjjtxGyjgi6P22MH5dvYHsq2lW0zvkHHmJGBcNeUGGObY?=
 =?us-ascii?Q?/zzDY5k/ypGYgRsvGPiOmmuY/K2HrfKAD6j4l2Ur4ZMJ7ky0PpcFJbdenHJM?=
 =?us-ascii?Q?ZYiFLSijByNqu/SGIm75BaTRx+yxkNrKgAn/Pw5DJ+VSxWDrsaA12kA9jnIw?=
 =?us-ascii?Q?NtNmnLEpZZBTuJ9/VYYMn9XOmN/RIVoSlc49OQsB8Dg3YvqBuCnitg7IDwZM?=
 =?us-ascii?Q?f40HaL3du3UxOJbEZW14fbxPgVGpmbu2YDqBKfa3uSNU5QI7VetUNxg0LFY+?=
 =?us-ascii?Q?qgMd6kEhmGdJ3R6uzocdFRCuc1EKHsjkHQGNjOB9rxml/M1HuTzkrwGnV/gJ?=
 =?us-ascii?Q?mJ+/qXRTIDhSRmpnNSOvi+zlm2QDDJkf080UOy0QqSw67HkfjDI1kdeIlgty?=
 =?us-ascii?Q?wnaq+yfcjV/oR94vY4T6gP/Cae0XgMt2AuTt/3vnqbkkgHtZwQj5//1Iv5y3?=
 =?us-ascii?Q?JLWqz/C8rf60B3UxWskmMX3YFZBzdIZsR2NcR6TijSXxwiRgYSyTHZIWAFEb?=
 =?us-ascii?Q?VrqiIagyNa0UQYQKKeyS+CSf01SwbGMtEBa23Nd2kmdl613WPsy72+t9kEIo?=
 =?us-ascii?Q?MqcChjRy6eXwGXsgRvA+GcqSWqmVZqmIf5ilNDVtq3ZFvNSdxlCgGvxx/NMg?=
 =?us-ascii?Q?nh3HkEaNgB7FVJR0Q9+Z53R/IVoasTzsHQ8kUS8l5JRO03SMcUeeLQ2GORTN?=
 =?us-ascii?Q?tmoAGTTutXoli0+zreQVzXZq4maCr7LmH+I/MJftHJkAc+a0F7UZETvp2Gv/?=
 =?us-ascii?Q?Ks5hak3MEqpv6yTtQSnAsVzntjjzAaobl1riLDUjH9SZcvvrV4ATT37RY8nB?=
 =?us-ascii?Q?eSJzuP1+kPALSSSiqDp+WpxiDPqEf76GJX92cFRGx6VOUBemR0wFSUVcdbPx?=
 =?us-ascii?Q?I2eAZq0F0REzsOrX9Yafm7S3TD4enxjYUJjCF2eDnbeITWGgOTfB/Ru4Wsef?=
 =?us-ascii?Q?lU20QUa2N/NfHa7Bpaz5eFbSpgqOJOhF0T/dU01u4UpIm0B0TsubELqHt4pw?=
 =?us-ascii?Q?EDe+X+fB/2GczrXhtpr24aY32zLyxjz6biZlS/h1pDDq4LI3cU+b4CqXJYhP?=
 =?us-ascii?Q?iKryjERBACgWqRJxFgUZbQlVECNbTReq4n5YQX6bXKv/et2/cd4YPW9ZDoRM?=
 =?us-ascii?Q?4ljDmJ5/OS3Pwjhclf/4q4xuFBwHy/Y/XaQeuqHjI6JcaYAITIAofbCvLpe1?=
 =?us-ascii?Q?Z7VGs4twWL90vwY0LAxLkMDSk+vJznK7wNct1izU2kqSacX3yUKMrjBIBRPa?=
 =?us-ascii?Q?uIO+wpgcxUn8MWZP831mucPWld8CQUf0NzU3FWJUJL6qUQ1gbBha/MeZhDci?=
 =?us-ascii?Q?3gKVjwAMhTPxukOroK9AsQVWHQqYUrINjzUSpCSEYnSTIqzdfQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9P6B1yrjsHBHfnlDz/buhylK1a3fqRq3bkpJWz7J/qC0uJYHSTc6ZN0iISID?=
 =?us-ascii?Q?ptwMtkTvji0PCSdRCW3bEgV6Jp1NpwLssxDqiyqd94jMFrFItmfqUSF8EMzQ?=
 =?us-ascii?Q?RzmApe3pkPAJBsb+ZTivpsp13agvC0g6AMgM626ktAjN+YlfqgDZ5HF1ynk9?=
 =?us-ascii?Q?xHzn4mF+xuEdazfMEzTcptWsiTBCva8acFCEvsRTxkQzfyOTOUaMCKlgX/Eq?=
 =?us-ascii?Q?q1SLJJYditHs/ZsQ0ph13CsdqRFDT1QRiYqVpa2XtoT/VjUDDwnDhJbCzLKU?=
 =?us-ascii?Q?HfsSGBnsqXjSN6lvkDFoLGG8G0DeVd/yGCtX/VXvaeyB3picpPy6fiREBhVT?=
 =?us-ascii?Q?fw7opmEXuyLLMq2d3G7xKdb3yXkTPua3HgXMhO7iFrYjLhqu9WV/OvdJqxCr?=
 =?us-ascii?Q?X4BD7RvnDS1L72NB+pOuC3NBmEQU+UA/9kR6rFRWzY3Z2V3QjEteLaS033KR?=
 =?us-ascii?Q?6013+QuQtt+kBUeAmH+MB6WFcVuAs+/KkPHBkwPF7PFIgGNm8ZtCmtMsDT99?=
 =?us-ascii?Q?PvLM6Ocit1Lyp4LXiec7o9Ez+qGMIZoge7tzaln7tZYZHUWK/8ucItLErVf/?=
 =?us-ascii?Q?GfUMQ5lVyx1NxdDHHJybbQYF4M1Bm7EQ2LSnDPVZ7E0n2aKgF/A6G85ukWOE?=
 =?us-ascii?Q?hQSxyCUm9gqh/BETsCsdlcfmW9ZtCMod9xeIZMQizeJQo+FF7JOkTlVpxOqr?=
 =?us-ascii?Q?VXfNO09hZorDUzFUG8LHLAvapfrVEF6J1PF1J5rEZDUWlw7Cf6Ep3pPV+TEY?=
 =?us-ascii?Q?k1/9HIIATbmpr7Gka/o4nku9jJMRqOwK9RFUjd84IVt04WGtBrF86q2SME4W?=
 =?us-ascii?Q?OGppdODcBMRXT18cIYrgfpM2uaCIcYJEhftOozghCyQsorQCF+xlemMrMA3E?=
 =?us-ascii?Q?7JSfq7OhFPIa7wqXE/wS6ePTA/7LiNUSX7nVhYDSgZ4YCwwofagIIo5R8iOl?=
 =?us-ascii?Q?uLvkeEbLNveIyG2OPIzkoK08iXtgaR6V3jMI5f8IMWgdNOZ9W6klqEwO74Rx?=
 =?us-ascii?Q?pCLiAxVtUtCQpM8MLKQbkkPoV4+70bNZMM6fApKBA3VhvgcAuQnsmdntotoh?=
 =?us-ascii?Q?obyIQcDctbLwhSMP6UjOiwcOwLdCEBszH2gCaL1UeWTbc3zLR9xdtUbTSPOz?=
 =?us-ascii?Q?B5yhdy6VJrW2/0pTpX0F1HTvpqAELfangxcaz/97TKLcpm44zRCxR8Tq8hch?=
 =?us-ascii?Q?B6xBijhi33d02Do2CIklSiMPAz0h0IeRc8s7j2yMK1ZG0mPJXMdI5ms3kDZJ?=
 =?us-ascii?Q?n4CM6BV/Yot5GCspm52+CpQN54wQQPv+fXIQCJcx2LIK6gajRBWuMkk0W969?=
 =?us-ascii?Q?nX8wfzqBqs9b8xiErEi/XIP+a0iAM2ivIbK4G/id9knr1rvUPTI+/KAk81tX?=
 =?us-ascii?Q?EJA/+/KDM0yomMOATs5OUlICmY8sJ4FCE4jBO8Gh70q+KdU2HzTHLlTHpjrn?=
 =?us-ascii?Q?958rXEXOHRjoC89rObyfIN1S1HnVB9hCDDPd7BEEicULLkqdNo5UZEnjnaEu?=
 =?us-ascii?Q?ampKGmhRmi89zDBOguYeTjfe2uzKBOSABUNd5zXY9qQQ1jV9Sd3tgIhQmJ83?=
 =?us-ascii?Q?YoYOEDb3+3bTb4nAzDAwOrXE44r/FdZzHhT0ab8k?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97ad28e-2ddb-4107-d873-08dcd0968b5e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 06:13:38.4284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3JduymVUI0+jvoXAed9sZhnBGhRXzeRWBOcZfiR4w8WDqACXRZilDo1Pwttazkr1eHJdTqKHU+EkX0Fd2p3SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6209
X-Mailman-Approved-At: Tue, 10 Sep 2024 10:07:40 +1000
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
Cc: opensource.kernel@vivo.com, benjaminfair@google.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Yan Zhen <yanzhen@vivo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Replace a comma between expression statements by a semicolon.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/reset/reset-npcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index 8935ef95a..a200cc8c7 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -405,8 +405,8 @@ static int npcm_rc_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "nuvoton,sw-reset-number",
 				  &rc->sw_reset_number)) {
 		if (rc->sw_reset_number && rc->sw_reset_number < 5) {
-			rc->restart_nb.priority = 192,
-			rc->restart_nb.notifier_call = npcm_rc_restart,
+			rc->restart_nb.priority = 192;
+			rc->restart_nb.notifier_call = npcm_rc_restart;
 			ret = register_restart_handler(&rc->restart_nb);
 			if (ret)
 				dev_warn(&pdev->dev, "failed to register restart handler\n");
-- 
2.34.1

