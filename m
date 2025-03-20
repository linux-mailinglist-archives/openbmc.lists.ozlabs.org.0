Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F0A6A33D
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 11:02:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJLjh0Hkwz3c8Y
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 21:02:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::604" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742464963;
	cv=pass; b=VgJHA3pUQK26SdF+/fcZ01tbwpS+8Wzumd/RHHgd+/CkqiVLHH4OB+/cIqqkU6QI6PkBtPfF93fu9zwNGuOWjsLhkLXQlOawqgAahlZxuiIIb5L6GX+6arJolvo3tEM707XFhM7dbvci22JBI33AfFRCJ81JR3PqmRnZop2pvOjhGW9eMd4MMgtZ0KBmh8Pj26NHeVo8yfkpch+imL3FVVWfWloragrIZywJBetocFjS9Zxd7eGwew7COsk1Wq6MQFbEHuqtdmMoa9TRRi4p+4m3QKsqyma0zOerfyghCrhxMtuoVRfgmHwtkiT3GIqFHlWyOhpi15FqcCfrl9Kvng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742464963; c=relaxed/relaxed;
	bh=zbRpJ3y6B6rTVrUyO18rstw36AStAveqH6zWGaFaKaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KvFLEuoTt1Tys8xkYY9djHitE6s9C91oFHTkIQgvg/a3/emrOXNXrn14CXkJhZMk3WIYLZpj7oCcXwep6XB/iRUGd6TWOndCXeKshOi04idqV6IQRZJq6Lv/1e6IXEhSeNXzSt1TjzLFcip0uLjnYJk+CiCqWICwrijvpGdO0Uac4J7+6VLKkEUjlXJRrxU67oO5dXNOVEdKDqIu5VaUAOe5KcwnA0g5xsydhOokA1uwLRctFMczJO2wCf5bT1C+t1ObXX9ettKT2V/CtbO5y7g8Xg2gmBp6MGwiVfR8wlGL+wF4GS7AOfii+FOoZ+JeHIy4JCoxMvUACRBLlKQldQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cr+X8r6O; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::604; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cr+X8r6O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::604; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20604.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJLjZ0wZtz2yf4;
	Thu, 20 Mar 2025 21:02:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mF+/e7cCyz2MGK+iGidbgbKfcqPK+Xjrmn0Eotm3+VY2/zxoUs5xdW+n8WHge8IVUxKjdsY9MrP9zhmgKqeeszyb780YCmSSZj2ik6vn54whVUXdJgseNuBNwl0ByuYds6XWx5c3/a74s9LOLgOHfEPeGwSxykmyhSOQtt8F3y2ypktN+mxWd1oh8IpHjS8hvnjifj8rjQRKUJCyRNWDGwWGaT1pr320kvUsPszQj8khOuXQ0bLDcne3M7FSYO2ev9552+XWlXMNVGKjXnrFLS1erQ9/jMTW/J6YT9GGgOR82Fa2+XOtImHMXItqQn4RkwhVMztPcHCv6lxZp1c5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbRpJ3y6B6rTVrUyO18rstw36AStAveqH6zWGaFaKaQ=;
 b=Yv5O+u5JPN9xeRfzp37wvV93DitoSNLUoWbLJW37fByaJM1XRcRXmeWfUYv+ZEUoeeCrI3LZQ/XDyqNTf3q4sFQrGeRVc/k2xdmutCI6nN7aZlG6oXrF1Mp04E6+TCHGMDFDQERniiU5UwRIDowOWPKcdfYaSZSbHRFtwChgnCZwBWBd+PQbR7UVmu1ePbsK7LDyGIuEx5zhu0waT3mmC6oLq9Y3GmwFz3AU1QFLjD0ay78rPhExRSZ0WWRTviv1I3GInu51/V+EnYo7KqvLC7FP7XxKyJnSFnroIHgjP+avCBbxVxUlGLhnHtmh2X7OeTlLp8EOeJ8uw2bLlRaCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbRpJ3y6B6rTVrUyO18rstw36AStAveqH6zWGaFaKaQ=;
 b=cr+X8r6Oe6e3cQwxMGUA/D0E1C1vSyLBNjmqhKVvXActPn8uk4AavyZDOfRk0idRVd5xVxuyRQeBRzbaun/hCjIygANojYL2UrchHx0B6SqIDzgqNOiXjSk2hrfOuLJlbLGmq1vHXyI7RyKxHneBmdeOsBVZEuzUB2+BzMN8HkOmxsDRif5PtedJWc4lr7StA6OGYuqpuJC98VTXvz82lQEgGLUcUmply/C+I3rar20J9bF/PUh9sMj70t6+k9sf0VfXTEsZcAG8eSDliCqXNNazxHdCxOBnSCpSbd6XyMmvZJjGbK4y2GskD4vdc5/hGNEmFV4Txqfn8jekTjNQ7w==
Received: from BYAPR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:c0::32)
 by SJ2PR12MB8035.namprd12.prod.outlook.com (2603:10b6:a03:4d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 10:02:18 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::9d) by BYAPR05CA0019.outlook.office365.com
 (2603:10b6:a03:c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Thu,
 20 Mar 2025 10:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 10:02:18 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 20 Mar
 2025 03:02:03 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 03:02:02 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 20 Mar 2025 03:02:02 -0700
From: Willie Thai <wthai@nvidia.com>
To: <robh@kernel.org>
Subject: [PATCH v2] ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BMC
Date: Thu, 20 Mar 2025 10:02:02 +0000
Message-ID: <20250320100202.56205-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <174178473498.434308.6316925758588470688.robh@kernel.org>
References: <174178473498.434308.6316925758588470688.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|SJ2PR12MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: f865392f-f1f8-4b7d-0509-08dd67964caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|30052699003|13003099007;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?PkzZRsT7q+9z92Yyl8n6fxPcHr/EXTkxI6Am/JzdLOB99rNwCqIKeXJNqqEn?=
 =?us-ascii?Q?/PMtkWVOAHCbHsR3PApLIlxozN7sVAASLYcDDLRYQcM2ZGEbxmM/SsL/vXxp?=
 =?us-ascii?Q?ZfEAVc5emQTjTVirFf4Bijv9NGXenMiubkl7j5GnRsVZk5dRh4puQtT5Ic4N?=
 =?us-ascii?Q?PkUxXe7bxtGAKr49wYrzvNrrbzaqCkVD66XnGSBqb67ndEcKqTF1FTsPlQP7?=
 =?us-ascii?Q?9v89QBdhlyAH0IAH1o9boLcZSbzMcRyJQIhJ1oZp1jLZit5CeJ/tbePm88cP?=
 =?us-ascii?Q?MraJYbtl+th5yu8AtvoRjImiHwUAQMtoPWVrKPd4qNZytFJFUMK2D+AdCo/I?=
 =?us-ascii?Q?SuY7jtZP9WpnRfA6lot/UZjxLMWdUMpK6k6J7ECNN7gGN0aS5MYBE6RsMQ9/?=
 =?us-ascii?Q?U9b7IO+okXZgdG3bnvBjtWzm6ornFHBiz+SrXp8TYdp+vRSAq3J3fnyfEkCg?=
 =?us-ascii?Q?DhvNBZnz/qC1CRz6pAMP1lcVxixE0DbHCVys3eMdPoI2Y2orq8eYQnS/C91q?=
 =?us-ascii?Q?KUA8tcTAYPcPpgfdRTVOgbwdvPhCzsx+Vn+oVWv5kVVcma70kWowUjhor7Ue?=
 =?us-ascii?Q?QuuxC3GgsoIWKbxuhPMF1WFwvCd5KP5IOKv4WsLdizQLQpR8wc6souEWfsrZ?=
 =?us-ascii?Q?YL7XZeL2ZNR4q45XWSzQnLwxn8xGydpnH+Q1sB7jOvaqd3mqP74/I6MJ5pl/?=
 =?us-ascii?Q?cEPcrI5tEYgxG+xHVcAMW1eHInabxuOh4eOAFvy1xJH5XuIHRKSLJ+r3NQIa?=
 =?us-ascii?Q?tFuHYEKy44dWieJld3IQFITHKLCRO82CD5VJc6sLqyffVOaxCdlMpFen1Msi?=
 =?us-ascii?Q?rMNFdPIZ3bdFGzj0UtbeEfml1G0X/YEzo19onoiZ1YcxZ2oLLeO6s0nkJ+5i?=
 =?us-ascii?Q?MAv0ZThhh/dU7mYbuBZmcbYO31wLIT37o95P6HCZUweYjFkEXtYMW57sWgcg?=
 =?us-ascii?Q?mTKPc14U2u1KYdDTK/fLOM0cZnG0bCFDSHP59YB9vlJR9rXxNBOb4Tvr4eu1?=
 =?us-ascii?Q?y+apgNPwLUVg0vYGoyOzRx2vZZXYbsB9cdWJUXarezRayvemLPrEuQgNE1kB?=
 =?us-ascii?Q?+hNTbA2mGq5TetuDMjGaSrpx+/IoBQ/fC79Lup1zc4i2Ilaz8eOWnLhD+NPv?=
 =?us-ascii?Q?XMhum89GvaMUZIBq6P58sgyQBlruJ/a7R+OiHIBwPWjgVfYd5xk9fHPk5OWu?=
 =?us-ascii?Q?RTCtHOv416fz31c7K0YDyuFUHHu2jwrnL6jR7w09MMuRQyMQi9rD7EFt6AYE?=
 =?us-ascii?Q?HhbNYnSw8vEGgh5UOuJX1pAwLCib3eXeubh74e0rUO0AiBPOiN3O6X192SSz?=
 =?us-ascii?Q?91VeHQbWIWBcd+3ryRa2PqEK9IH1EuiVcxpEJ7XMe6wRBjSbaUf+iIdNZSMt?=
 =?us-ascii?Q?2IKe1bH4UlgIJst9k+iYQX14y8NucytiW0w96YeoyiO7huN7KwHGYCAKCgYS?=
 =?us-ascii?Q?K9mOl35S+cc3adyk68c361bpOScghJLRwaBqvRfPvvg3r2OQQCttk1vGRFiI?=
 =?us-ascii?Q?xiTI1pl7QxYpq6c=3D?=
X-Forefront-Antispam-Report: 	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(30052699003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:02:18.5132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f865392f-f1f8-4b7d-0509-08dd67964caa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8035
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: tony.luck@intel.com, andrew@lunn.ch, conor+dt@kernel.org, tingkaic@nvidia.com, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, kees@kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, linux-kernel@vger.kernel.org, krzk@kernel.org, pmenzel@molgen.mpg.de, wthai@nvidia.com, gpiccoli@igalia.com, maryang@nvidia.com, joel@jms.id.au, dkodihalli@nvidia.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for your comment.

> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/aspeed/' =
for 20250312045802.4115029-1-wthai@nvidia.com:
>=20
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /: compatibl=
e: 'oneOf' conditional failed, one must be fixed:
> 	'nvidia,gb200nvl-bmc' is not one of ['delta,ahe50dc-bmc', 'facebook,gala=
xy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,oly=
mpus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
> 	'nvidia,gb200nvl-bmc' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-b=
mc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'as=
rock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asr=
ock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,mini=
pack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemit=
ev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,miha=
wk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,withers=
poon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bm=
c', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'le=
novo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centr=
iq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc=
', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'y=
adro,vegman-sx20-bmc']
> 	'nvidia,gb200nvl-bmc' is not one of ['ampere,mtjefferson-bmc', 'ampere,m=
tmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-b=
mc', 'facebook,bletchley-bmc', 'facebook,catalina-bmc', 'facebook,cloudripp=
er-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,greatlakes-b=
mc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,yosemite4-bmc'=
, 'ibm,blueridge-bmc', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc'=
, 'ibm,sbp1-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscream=
-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'qcom,dc-scm-v1-bmc', '=
quanta,s6q-bmc', 'ufispace,ncplite-bmc']
> 	'aspeed,ast2400' was expected
> 	'aspeed,ast2500' was expected
> 	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /: failed to=
 match any schema with compatible: ['nvidia,gb200nvl-bmc', 'aspeed,ast2600']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: timer: 'cloc=
ks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /sdram@1e6e0=
000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-eda=
c', 'syscon']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: bus@1e600000=
: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
> 	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.y=
aml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: syscon@1e6e2=
000: 'smp-memram@180' does not match any of the regexes: '^interrupt-contro=
ller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^si=
licon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.ya=
ml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pinctrl: emm=
cg5_default:groups:0: 'EMMCG5' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC=
11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'A=
DC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMCG1', 'EMMCG4', 'EMMCG8', 'ESPI=
', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'G=
PIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU=
0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'HVI3C3'=
, 'HVI3C4', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', '=
I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3=
C1', 'I3C2', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LP=
C', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', =
'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCSI3', 'NCSI4=
', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', =
'NDSR1', 'NDSR2', 'NDSR3'
>  , 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', '=
NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM=
1', 'PWM10G0', 'PWM10G1', 'PWM11G0', 'PWM11G1', 'PWM12G0', 'PWM12G1', 'PWM1=
3G0', 'PWM13G1', 'PWM14G0', 'PWM14G1', 'PWM15G0', 'PWM15G1', 'PWM2', 'PWM3'=
, 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8G0', 'PWM8G1', 'PWM9G0', 'PWM9G1', '=
QSPI1', 'QSPI2', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', =
'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10G0', 'SAL=
T10G1', 'SALT11G0', 'SALT11G1', 'SALT12G0', 'SALT12G1', 'SALT13G0', 'SALT13=
G1', 'SALT14G0', 'SALT14G1', 'SALT15G0', 'SALT15G1', 'SALT16G0', 'SALT16G1'=
, 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9G0',=
 'SALT9G1', 'SD1', 'SD2', 'SD3', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOON=
CTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSC=
I', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', '=
TACH0', 'TACH1', 'TACH10'
>  , 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'T=
ACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU=
2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12G0'=
, 'UART12G1', 'UART13G0', 'UART13G1', 'UART6', 'UART7', 'UART8', 'UART9', '=
USBA', 'USBB', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WD=
TRST4']
> 	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pi=
nctrl.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sys=
con@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['=
aspeed,ast2600-smpmem']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sys=
con@1e6e2000/interrupt-controller@560: failed to match any schema with comp=
atible: ['aspeed,ast2600-scu-ic0']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sys=
con@1e6e2000/interrupt-controller@570: failed to match any schema with comp=
atible: ['aspeed,ast2600-scu-ic1']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/dis=
play@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600=
-gfx', 'syscon']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e9000=
: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-ad=
c.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e9100=
: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-ad=
c.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: crypto@1e6fa=
000: 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acr=
y.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/tim=
er@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-t=
imer']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: lpc@1e789000=
: lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: lpc@1e789000=
: reg-io-width: 4 is not of type 'object'
> 	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@24: 'clo=
cks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-b=
mc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@28: 'clo=
cks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-b=
mc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@2c: 'clo=
cks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-b=
mc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@114: 'cl=
ocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-b=
mc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/lpc=
@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast=
2600-ibt-bmc']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: sdc@1e740000=
: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
> 	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: sdc@1e740000=
: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
> 	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sdc=
@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['asp=
eed,ast2600-sdhci', 'sdhci']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sdc=
@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['asp=
eed,ast2600-sdhci', 'sdhci']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@80: Unev=
aluated properties are not allowed ('disable-master' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@21: =
'#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-=
9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
1: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
1: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
4: $nodename:0: 'i2c-switch@74' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
4: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
2: $nodename:0: 'i2c-switch@72' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
2: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@21: =
'#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-=
9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
3: $nodename:0: 'i2c-switch@73' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
3: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
0: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
0: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
5: $nodename:0: 'i2c-switch@75' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
5: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
4: $nodename:0: 'i2c-switch@74' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
4: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
6: $nodename:0: 'i2c-switch@76' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
6: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@21: =
'#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-=
9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
7: $nodename:0: 'i2c-switch@77' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
7: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: max31790@20:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-=
9]+$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: max31790@23:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-=
9]+$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: max31790@2c:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-=
9]+$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: max31790@2f:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-=
9]+$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@20: =
'#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-=
9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@21: =
'#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-=
9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@27: =
'#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-=
9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@74: =
'#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-=
9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
7: $nodename:0: 'i2c-switch@77' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
7: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
7: $nodename:0: 'i2c-switch@77' does not match '^(i2c-?)?mux'
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@7=
7: Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: fsi@1e79b000=
: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
> 	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-ma=
ster.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/fsi=
@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi=
-master', 'fsi-master']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: fsi@1e79b100=
: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
> 	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-ma=
ster.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/fsi=
@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi=
-master', 'fsi-master']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/dma=
-controller@1e79e000: failed to match any schema with compatible: ['aspeed,=
ast2600-udma']


Will add the binding into the yaml file in the next version.

The other warnings are coming from the dtsi itself.=
