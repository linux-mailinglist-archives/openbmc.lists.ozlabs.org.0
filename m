Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A6A34CFDF
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 14:19:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8BTK64DTz302C
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 23:19:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=UMnvoExx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.103;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=UMnvoExx; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2103.outbound.protection.outlook.com [40.107.236.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8BSX1SBqz2yYt;
 Mon, 29 Mar 2021 23:18:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASjHxlzU/83jjWYKHZIc/6G4s2uCjPaZ/2UntYSBz7kryL+9/hp2dyKzmxQgi17c3aho1prYpQu6VAk0+0Qa+MffVXdxrmSsX/qZH3mAyyfsVoyFHrgFheNEkYw1dEhajmY9u4hsAwlFcO5QvqYkrL/qvtBHWH1Rra3yIZeW3lWBE0pqP83c3cKdwvuZzl2bDTP4wnlbv6148g/GzyYcG+dZf4+551AsknmKHAHVL8HdQFqaEuox5CgmweOuIIp0iCdJqY45zFXw2Z1Gld9uKoTWIZoYhSsmCvMGUGswSTZIfSSRNnYPX+ZEoS11YAkInJIiwEgE5hLGiiPTAvEYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObTdeZ8zsjlufq5/WNaeZ0cI2o4TsSWrRB99EetYum4=;
 b=dezEa/mW0Q50rQx0jhMvQ8z+KWYYWkdKctzf03O39lN7MC5X56dzWk5n49rBvcA1Oi4rI6RNOtYnn/1wkBd7ZGwpJ+sNoMGkxkWnruEypBBsGOClpcX8WuPGunbAV7XvggSF5nPoj8AFunPZooDfKnIt8c9Q8WRr+CEMoTvwJgA7jnp6U0J/5AKexd4+wgmaER/BZs8tmHF+jFA9b1Iur3/mfeuRD21qwV5i4FOFzvtfpD32Ce2Nbxa5lsnH5UjzB/zyT1/ERbeN8D8zdCRaGEekL6HyMCNL1UBLDFGDAY9UXNKezLcJ43m+ohQG1fBkiED2Qj3Hs1EnYEE8ZxFVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObTdeZ8zsjlufq5/WNaeZ0cI2o4TsSWrRB99EetYum4=;
 b=UMnvoExxDtYF2RhE4n7W+rSwYGFr1lQyylB9MKGCxRQYHYQlbKRiiUMwlr9OOnbJhANbhygaDSGeMGfehHk3tcEc2DWvAd//MDouEE5cnuu1rP6mU7s7M54F58obqnS7S+E4lPTDr9G+pg2cTjPUKu6IBWWFMNI+A7mP0zBdyzk=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6679.prod.exchangelabs.com (2603:10b6:303:f5::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Mon, 29 Mar 2021 12:18:31 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:18:31 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v1 1/3] i2c: i2c-core-smbus: Expose PEC calculate function for
 generic use
Date: Mon, 29 Mar 2021 19:17:57 +0700
Message-Id: <20210329121759.5644-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210329121759.5644-1-quan@os.amperecomputing.com>
References: <20210329121759.5644-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 12:18:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee65b826-7160-44ae-2c3a-08d8f2acc3fe
X-MS-TrafficTypeDiagnostic: CO1PR01MB6679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB6679AD07FD63E9D9FFF24FCDF27E9@CO1PR01MB6679.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lkcZvIiTmGuq8XTNPfLcoERkBvh+3Lq9BbQzBrZM/IXgUGdOxtqnvxo254MRAbr5k7Gkq9fAzj2nfSAMyaNc6q5B9Uggy5zD58mtTIGFHysk08WQBP3v6Xh6BHRSQ2IZM+fQ5FbabaubTC9cb2gCmzZ9qOMoZc1oqG4l40EAGEUyTk1X6R3OOCdrXiwHkXub45CcALvT+Ah10CzW+BJlH25NWVidXKt6XfRVQk1sNDE5mTdUK4/DMWr3ykwZklwWeHSo8B0rdXzniA4e3Ze70hIgjoWa5pvAftOS5bmgf+D0mo2LSuGkNUuigeXMF7mruReUddLOq8x0/u0GGOF+rMKFECsQl0RhPgrcu3Q4a/wIdMjhijI0EshOu+errxG7rGA7oXP0rH5pXzKX5mcYzs0+KqyUuPFUl+yyl5SXew5QbBKQHHN6zXt2cPSWhFRvUjGBIhtB7eBWbs+0vLjp54+PIIxzPhSCMqmc8anGvgP4ggUSfzUXpIyUP9Zm+c37MiJLYbw/MebIP+FVsg/msrysWqu0zLFSzmkc8A0Acm49JG+xnXC/Ks3yRtrIESFhQy3wyR/VieZfOScnkV07XJau4i99jjjNkqYtU52b2RZVppeN/NmfEv6Go5Vt0mVdWWgwBorEyb3ODaKit4EoAeq6FMGCkti+X6Q63pQF2isjdZlSJf3DWUzh8iMBAIYc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(396003)(346002)(136003)(921005)(52116002)(6506007)(66556008)(4326008)(6486002)(16526019)(54906003)(2906002)(107886003)(956004)(6512007)(110136005)(86362001)(8676002)(38100700001)(8936002)(1076003)(66476007)(5660300002)(2616005)(83380400001)(7416002)(316002)(26005)(478600001)(66946007)(6666004)(186003)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wI0izVF6VsbQRmoX5ezlG2BEqxPbFF2dG7yhRHNfRedunNfXbOPunRa7mVw4?=
 =?us-ascii?Q?PM/vrC0MIvP8I6MDDleFzHo5P1suMLltNq/JOImTt8C1DOoCV2pFK589U1vc?=
 =?us-ascii?Q?quVRyqSOW55tNIBzSnQzEVRIqwXc9+iT2009RefAzjr2VxUR4iDQ8nsQ+duO?=
 =?us-ascii?Q?mK2m950jRVBKFoikRSBqIMcZXGJA1cq9WHYdRRFTTzQEf8HIaMztc7UYLXvD?=
 =?us-ascii?Q?xjT5weO+1danJB/wMf9KChx2dbKncz9CTGnuML6X8DaU0koMlgwTxrYRKwns?=
 =?us-ascii?Q?2clpVOPJi6ZRpNSUPvTr21mZABCfRnLXpFORmVUDEwpAUgCtplRIIBIlY7U0?=
 =?us-ascii?Q?cRkW4Uil/xidqJanSpEBcFiJU6PZ/U1SbPn6+SzaWWRdlCMpz1ZfFqdYT7jq?=
 =?us-ascii?Q?uLZiaau1HrNPLuCpvM89In+Y+giwgbCbgURObe50jZlgGx8UZrzT+fvA9Su3?=
 =?us-ascii?Q?faKAuKPxbp7lZ/2Vm5J2IPwEdn/7EQFVX4r8qQDgTCgn3irRCQYHpDV582h/?=
 =?us-ascii?Q?I0UbWncaa9ZKB6tARCnIV0p2ZrNf7ngI/js/r39GVLLGP3OM+pnI0rN7aJHL?=
 =?us-ascii?Q?MTrt2fyUQj7N2NPzRu0EGcPWV3ZrWFRR0ceIKccDfRzPLGh7X7MvaFZQ02oP?=
 =?us-ascii?Q?PZP3hzpDrZxWyoozX4DXEjFGJvveyZQSeb/g+iWPLRWAD1KZSJEnItDGSolQ?=
 =?us-ascii?Q?0zEPB0cBTuDEgB1F73VugEFvGhVrOa5AROKzMgCUw4yppooJcrrRZC/Dn8Dn?=
 =?us-ascii?Q?oPjPc81o2kO5DFKfNwPhzHjMQxJEL2Mi+vpjI10VIcrsaY+5on0WDFM0Winw?=
 =?us-ascii?Q?+jrYo1e3Af3oKB4LGt9Oh6R7YmSkN0hkRKvgMRkwC0kukEXVFHPQAehOMOgb?=
 =?us-ascii?Q?GiZn2jlG2gYeFN2ZMr0y76Ldn7RisqJVs18osCUQOFnOnw+5f/l7bodO/dUC?=
 =?us-ascii?Q?jtIxZocm1aOaAHBtt3Nr4tzPnh+YUNdmhZm011irkFBGyEiYe2tSgJn8o1Xs?=
 =?us-ascii?Q?9AyU1TyFjiZ21kt9aexkqcN8c2Mtu5WzrAsGgPXeVW4PxmBCulxsKTqM7njF?=
 =?us-ascii?Q?lX0agF0Oc4Qo6RQLMnBpi2obZ8UTxpp1/S348M+oj9BKMvKhxexdQYEf8Xgp?=
 =?us-ascii?Q?cY7qwunnEqoEuNnAK/9u9UPOYlweMgvWfE83/ZP0lCyOmYn0B8X8gOcdT5zv?=
 =?us-ascii?Q?gr/2RprRxMhNK6BX2oFyvQXGHOarbEJBWhedROYjlPvxteQrE/hKxfzxEAsr?=
 =?us-ascii?Q?I064STS+/2LkJEtZJwBInENKJRnTHDNvTU59H2Tw71B4wQxvej9CTKIuVuHA?=
 =?us-ascii?Q?MDsUZ3OZ8curBxXUqhli+YoQ?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee65b826-7160-44ae-2c3a-08d8f2acc3fe
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:18:31.4103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bb0hzPJ/ybSXHOGuSp3Dy44EySeq9aZEZ93phVuoBfVuFXg7G9A/Z0enoLP0e4AWtRHO8eyJa3HfkDVPnx1LgbzWP8k/2z1czQBnTNETiPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6679
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

Expose the PEC calculation i2c_smbus_pec() for generic use.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/i2c/i2c-core-smbus.c | 12 ++++++++++--
 include/linux/i2c.h          |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index d2d32c0fd8c3..e5b2d1465e7e 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -37,8 +37,15 @@ static u8 crc8(u16 data)
 	return (u8)(data >> 8);
 }
 
-/* Incremental CRC8 over count bytes in the array pointed to by p */
-static u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
+/**
+ * i2c_smbus_pec - Incremental CRC8 over the given input data array
+ * @crc: previous return crc8 value
+ * @p: pointer to data buffer.
+ * @count: number of bytes in data buffer.
+ *
+ * Incremental CRC8 over count bytes in the array pointed to by p
+ */
+u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
 {
 	int i;
 
@@ -46,6 +53,7 @@ static u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
 		crc = crc8((crc ^ p[i]) << 8);
 	return crc;
 }
+EXPORT_SYMBOL(i2c_smbus_pec);
 
 /* Assume a 7-bit address, which is reasonable for SMBus */
 static u8 i2c_smbus_msg_pec(u8 pec, struct i2c_msg *msg)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..0d75e5bcdde6 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -144,6 +144,7 @@ s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 /* Now follow the 'nice' access routines. These also document the calling
    conventions of i2c_smbus_xfer. */
 
+u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count);
 s32 i2c_smbus_read_byte(const struct i2c_client *client);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value);
 s32 i2c_smbus_read_byte_data(const struct i2c_client *client, u8 command);
-- 
2.28.0

