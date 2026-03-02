Return-Path: <openbmc+bounces-1422-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIHhMJsbpmmeKQAAu9opvQ
	(envelope-from <openbmc+bounces-1422-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 03 Mar 2026 00:22:03 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0ED1E6897
	for <lists+openbmc@lfdr.de>; Tue, 03 Mar 2026 00:22:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPw1g2zFzz3blr;
	Tue, 03 Mar 2026 10:21:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772479925;
	cv=pass; b=Cvp3kFPbbsBhkdVD5GTi3Iuk9whosvfq7NrcMvObjNb3FY2THNXHls3Rsm3ld1xn9wD8hjveE72y8Ih/GCeeZydBcOUiALrMq+ow3hbfRMtMaHpVBc0ZkGkLnKdANQfC785TQPNInLzSQkBKw07XmTWmYOjiRC/61oyAjTR6BKIO60ySlVQ9LBDBun37B6hIzRvKSJbHG/xF1ycHjgJzYCNjbB4vmufbxQCo4hCoM1JC9kF3r7szaGrSfASQLlMqcaiVfpUOqP1N2zLn66RSWtjotT6I6n9lbl1UA/QaTU0tTL5WLR8CPKBAfbE4VZj9GJvVElVEz5wD/YVaivG4fg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772479925; c=relaxed/relaxed;
	bh=yEBdCqbaCJyRzOrM76wuO3HkgOG+DPYxbCQ/RBxgIZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ct0c2A5PbKmx6eR6reUu/dfn+J2PjVdGGIvU/cBelGJdPi0irfEDkWGxegSGXgXQ1AE8z/ubzJO+vv09EP0HWrZ0Lxz8tclnhqBgu/WLOBYMvpOaEQUr+r+S6IV2MHlU46BZOjOAoMHY0MRJ1J2I2V8g32SCZH+8IrHnDcNOOwsz9wFG0qtdXvr4JL8rmL0fP1sK4NEi2Mk0iYsbaRDPxEBOX3QUOpz4dD+gKIFJVpF2U4ITDNomETXgoe7VPloIwoC+VLuGP4ucf/O0//MOrGCfLdPA4MWKaAamMHYiKvon+bKsJa+3M4uJzvRMkuZzXTDipTW50RKoE30zeovsMQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=selector1 header.b=WbraKBWE; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=selector1 header.b=WbraKBWE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=ti.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPpwL4sCrz3bn4
	for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 06:31:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT7dz4gS91WWDInYtcw+DF559h8l4ixnMh/w0WBlh0JINMnHJGojv7/779+IQW2ibIDJaT2zdCmlabCtAbHjrdUPVI3pcmhdV3AP8PhulngM4k2AfQrcgAKd4uYMiNtE9uXWLE11IWxVMkCoGf7noMgdE9s0K9RN3VA7xfu2v4vcF2eryfsef281HGcpVe4nosz6yaDBhEVblIwYLQwRDRKlOPscabIU6R82EYjY8MJPTarHLVMT3FYCvXMgJ5jrzmUjf9rmTl9RdsLdVC8xaSH9HJr4dxAQqjx/Y6gLQAi2f9937jpGNrZFy2P6eHngmSJtB0+Ls24cbmuv5+fODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEBdCqbaCJyRzOrM76wuO3HkgOG+DPYxbCQ/RBxgIZs=;
 b=YYxz+DTMicXe8UDPzZ5x+Erz7FJ2nDINm/6o1A3Xu0l/Fne9g6PMq2uPNZynBDGoY/xXLyjT/kfJofgT5HdU4vRr2v1tjcOCrCq1jJpnR8mSGJuylM8jtFSfdXjpB84tQOBa18LmYep62PpuBT03OZ8LJzUEXC2s1mTnHLDSTj0QiLsqSl3Aa8+cybDg6uvh7Ro4cHf6mryl/ym3XJ8CWXSL7zLU7wd1QXxv9oOYuoyIzF/ku2zaGNIYEiYsEDi0/ZY6fqRWUPHHBZDSz6qZKVrv9T8VVnlENDD4ommMPZIk2OrUO/nNzShG9/xHZmQFfVj60U4+o1EOFL9dnZIuVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEBdCqbaCJyRzOrM76wuO3HkgOG+DPYxbCQ/RBxgIZs=;
 b=WbraKBWEURa/cHguqlrAugGaXO0MdMYXlfsZrfZtfF5UjprYwFZSmwKhv6pmf5C2AB4kT8DJ5b/+4NaKOaprGuEnhkcjBa9S66JURZa2PpGQHReIDOquzOB0+EZrQyvisaQ67CaAgkMmJ6uxhwXiNXiF5KTpF8WYTwxeU0ssmDM=
Received: from CH0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:610:cc::12)
 by SA1PR10MB5687.namprd10.prod.outlook.com (2603:10b6:806:23f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 19:31:36 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::98) by CH0PR03CA0067.outlook.office365.com
 (2603:10b6:610:cc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 19:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 19:31:36 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:31:26 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:31:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 13:31:26 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622JVPFF1323274;
	Mon, 2 Mar 2026 13:31:25 -0600
Message-ID: <1b331fd9-f01e-4064-bb1a-dd65120203bb@ti.com>
Date: Mon, 2 Mar 2026 13:31:25 -0600
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Remove register_restart_handler() from drivers/reset
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, "Qin
 Jian" <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250813214138.477659-1-afd@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|SA1PR10MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 2554c90b-d9c8-4560-c9a3-08de789251b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	NW+uJgjEzaR10V+UldfIzx49abT2PXXRJjBq5BOLVIZV82Sg9yu+V4T8W2Qr/cJBl7fd+XCDsoT2EziCc+0m5zC8z1vKtS6pqrW2VRK5JSj/Nd4jGllq/R685zZYyO9TRra+UfZ5/9qUjWD70MKGFzhwK8VJ647tX5G22zK+EQurMyAQGGg09MRvTxRrL6nsAMikQZHO3mzUFi1c5lgUNNZlAzwoOm/sFArxic6diwH4VeTl8TbK4YQK5I/+DYvljNL4q5AA83x8qDR0l7UgS2hWk9kwIsW7NHKqjLzTHC7ytjLq+Vik+FQC2UkVBtm9/sTGenBaJk3/6dqVYImYMqCPjjOF/BFTnRxZE5Qs/t1kSrwLXtiST71JS2gy+IEhmVDE9WJ2OayRemlBKiiPROYWU+Eqla1McmzXGlFbY3pMQoscZ0PJKANG8mC7ORRApkZFw+LaR2miOUBiVIpWqdARSr5Y7VHtUQhfcr6mmPUAsBNkYrek7UDwHn+QQq+/nDMLMIeU2qC9IY2MvxDFDeN6CG4PoZfWnmOhDk8tIMzSurOrpMW+8ilw0atdUwlz2VOpBxyy9FaOuOnoQYHU8Fi24ZNPrRo0PtAV66buUhDL3J+Hqp3w1zrBbyOijv/CdUm7MNLEP2Trcc1Wu3fBUV19nPisC/ZNR8bnn9OgiJ7hZOXe4C+rVZ0Wtg0Zi40vZor4nm+NqBdYPrv1JsSm2FkH5AvrfnpuqrM3Y8osBBUpdO2wI9FwwheBRf5pMAdDThS320jb4E9wnIGRRp4c+Wug/U/7zM+735PrPCcwACcInzc4Uiqbauokid70L4krdC9/KZmfqLkQjrMWhtcEqA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wmde/YiKfOdhKZUUDF21KgYP3LZOQXRwF8bnZJPdH/Q9/bElcoh5OgDdVOIpm6gJHhBo2uxyf1xWT9eUyESP5Aqgw2IXPXeHsCkagxW2Rlz0I3+kbFnR+LoS/2xiyF3lfA07BEki/k5FuyipGbi7W4niRsyhd9DoiERGfdU/hsize5GcOuymDpKzMk7oy7cZrIl0X50GwVy4lWxeV2HGWjKBBXv0Q5MdnpIVfc15Za6liCUL1XEZ+e0NL45K4gLyC9gN9FDS5avUNirkjO+hkWPduj3mO7DOu6vbwmc6yKlwmFwlepeXOozNPZlc7fth2LjZ+fkvp+K6muzmBJ9zwIEyUPB7O35mhe/GscURihMENNGEEr5x/o+MPjyPtGUKNtu1C4TahMjW0aTmA/jq8yDWwax8SowlRR2yDc2jfdfuSE7M7+Ais1I9/EH1xNq/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:31:36.3807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2554c90b-d9c8-4560-c9a3-08de789251b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5687
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,T_SPF_PERMERROR autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 8C0ED1E6897
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1422-lists,openbmc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:vz@mleia.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:qinjian@cqplus1.com,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER(0.00)[afd@ti.com,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,openbmc@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On 8/13/25 4:41 PM, Andrew Davis wrote:
> Hello all,
> 
> Continuing to remove users of register_restart_handler(), this series
> removes the remaining uses in the driver/reset subsystem.
> 
> Build tested, but I don't have any of these platforms, so some
> sanity testing always welcome :)
> 
> Thanks,
> Andrew
> 
> Andrew Davis (6):
>    reset: ath79: Use devm_register_restart_handler()
>    reset: intel: Use devm_register_restart_handler()
>    reset: lpc18xx: Use devm_register_sys_off_handler()
>    reset: ma35d1: Use devm_register_sys_off_handler()
>    reset: npcm: Use devm_register_sys_off_handler()
>    reset: sunplus: Use devm_register_sys_off_handler()
> 
>   drivers/reset/reset-ath79.c    | 12 +++---------
>   drivers/reset/reset-intel-gw.c | 11 +++--------
>   drivers/reset/reset-lpc18xx.c  | 12 ++++--------
>   drivers/reset/reset-ma35d1.c   | 11 ++++-------
>   drivers/reset/reset-npcm.c     | 12 ++++--------
>   drivers/reset/reset-sunplus.c  | 12 ++++--------
>   6 files changed, 22 insertions(+), 48 deletions(-)
> 

Ping?

