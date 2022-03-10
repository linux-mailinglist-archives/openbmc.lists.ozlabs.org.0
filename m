Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9C34D4632
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 12:46:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDnMC4SzJz30Bl
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 22:45:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ZDKyUgwS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7ea9::70f;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=ZDKyUgwS; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::70f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDnH55mNmz308J;
 Thu, 10 Mar 2022 22:42:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bROqIM85hNjZKBI1R+PG28XaePZGzk0Msr3KhVgapg+Hs9ctfeO+iNWiETXoyKjE5fzOafpMsJK2ZVUZVh2iDz/taFfcMGDIdB5HXi3mJ+0qLhmm0/zCCGImTZeZctXyBObLYmVydQl8uUQurZ6mMhl2BZ0ktFTT5QpVEckfkflRGqD409n5gpehExL4iKobxkh4jd6cVMm776hXMk7D12L76ewQL7uSN93pVf/r8xaWiJiRYvbqehmVDi6fuSxXm74mfcJRFUWOnHKy7FG8B+XSAC7ACGUKiejZvPkcW9sNjLPZb+CSqSxfUHEtV6BrN/3I2rQ7hdPIVfBZwOWcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KU1ZJg5C+nGqp4Oe4CPdv7Z+79jbTyAJc3DLyeLAnNw=;
 b=JeyJgbalw3Hye4adjthIGTcUL0z/AEda92JfU+PDzMh/NrAQ1gJPWqQ+hJlEH6W5iY21hcJ1K/mXArESzxL+lPpvSvJ8rOzzYhDI3c1GdPO4qNZM4TKVrxGOtYZCh9iqV7Ej8nCOVkGov9yEHXl6dKX1R2gt9z+ItEagRiO7ZdqtAfBEUJT2bLLogy8X47RKTKTti5dmgVxmKA9Gg/M8v0aX3ZHJgpLmFwt+rl6tg8/Z6eTQa07ZB/UNhLrJ07WuMN8f5jgdp0DZcB93TyLPnS15RSGMZGhTEtDTwK4CFH6z38jvxKLADz7Yy9V7X4I1bziqC9AkzPwGIn+gqfJatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KU1ZJg5C+nGqp4Oe4CPdv7Z+79jbTyAJc3DLyeLAnNw=;
 b=ZDKyUgwS0Gso3yz7MibbdpXvKLofLCB5EEZ3Q8Ibk7xXmjwE2aMS/zSCYTBm6zzng3PErha9dPYcUS4BD8HR7zlRY5GJVLbISI6yL4Exiu9/OYvuqx8NwAv1VS3jjYIIw0idsmqUPyJj3mOFmEWppmeSuzBi2pp0bHGK3ddhv8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB3771.prod.exchangelabs.com (2603:10b6:5:82::24) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.16; Thu, 10 Mar 2022 11:42:09 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%6]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 11:42:09 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v6 4/4] i2c: aspeed: Assert NAK when slave is busy
Date: Thu, 10 Mar 2022 18:41:19 +0700
Message-Id: <20220310114119.13736-5-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310114119.13736-1-quan@os.amperecomputing.com>
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a4c552-b099-4a0f-ef2b-08da028b0246
X-MS-TrafficTypeDiagnostic: DM6PR01MB3771:EE_
X-Microsoft-Antispam-PRVS: <DM6PR01MB377144B46DCED636056DA583F20B9@DM6PR01MB3771.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4C/LvfNyNMDHEA4bt2d2du3FQxLZhbxWEvj4d3FiOymfYvoK3R7rwYO1zQhB+cSSNhCp0duJFLSdjgPcPC2jzKHtm46eDSkx7oAd9G1bHKMF7MNitQ6Jd0pWvR9kLJ0HwFnXiJxhM4uI2//lUXHkpou1glCvSJW+1JiejTrZQFFaUd1XfXRJIy9vPWjuCVkejWV3snabknZv1ndQOuBtgKJKZHGPjhqmIEfWPStMTTj08p9xxwk/Qm7Hg3vW35wG5YzCetz9Q+NzqxtZiOx5zLQUFBQmSuXiPkgVCUvqJLezjYjiWJoEGsQd9lESA04g5jc9D/izH/ayRGvLNLmkdiT9ac0Yo6k0ILjdsrad2o29y5AmbUPOTrns4uEuI1Oqk42OAHj4ZwUXACF7lQpbvPuxqrM8bX1c0kogEdypyA/TVU9ynWoEpP8A2pxCsM9fEwyTAr8sgH6MB8WAm7ISLZmRJagKRpZbCM0f56z3EbRsQ6t5ed7JqD8sHnvTmX6jklZVzrpQJF1jJlKlS2UBqZTgoiPIumpF2pbNTxKmDtrj9voh4RNJPvQRPJYX4p1bU/wfc4UtH0RSeDUZiBTN+dy7tTYzmf0jTnkHpH6NLxy8EthA5OG4dLbxu/ezY210kxundCtG+8ba/cp3crP/3wgXgsTviN+9vwQqNkLhd6MFQnXOC46e+FDtScy/imAUHXSB+B/nQ2tax5NEmchGlFyHdqMLl5QJf1DvPJgBoIQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(83380400001)(186003)(26005)(107886003)(921005)(54906003)(66946007)(110136005)(2616005)(316002)(6512007)(1076003)(52116002)(2906002)(6506007)(6666004)(86362001)(66476007)(66556008)(8936002)(7416002)(5660300002)(6486002)(508600001)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YCK5nNdfEgjTUJpSJLnrsIRImQjNGPDjcxhudtZ8+q5m7JmS4HfARUsh/I6Z?=
 =?us-ascii?Q?IaM5aPwHLUyo41ESx7qWC4yS0gozSXgDGky4vCl0OzsDRh8HhOBlZUv0LVxy?=
 =?us-ascii?Q?EYD35dshvcUfBQ+kGSl9nHNPMyDNy/wHA6pTiWTZm2qx1JwMtwdpSvIHrGk1?=
 =?us-ascii?Q?UnIDj2ACd3UfiEjnt8DWPeZHxTy67tRH3Q52RZGP6eypx0icxs6hJAKM0GkR?=
 =?us-ascii?Q?juZ4PjdCBhNZCQZ6TxgufZbhH4xCIpE6kcwkI80HYnPRIArbUGXqPiSxsTkI?=
 =?us-ascii?Q?ZY5IEDGeUAA7wHWu1gBxWuVp3swpkwLcrO/0kzymmFzkBrxUwd509gZlq2Dt?=
 =?us-ascii?Q?E9kwTQlZUPMyK6z05waB0MDMTlJLLmyoGDmKvc5JOnGEOx+z+8s88rMXrLvt?=
 =?us-ascii?Q?BZrIbwsr0ZbplkzniazNaupdo9L4m8p7hiw9qhf2RlENBenCE6YYHAYaFTmn?=
 =?us-ascii?Q?na8wQXB6faDyMXlPk+vTnxSrCvIqGR+GHcuMdxOwnTaSX0uoARLCEkVeNqVH?=
 =?us-ascii?Q?2S/frLghaRcvzWWZFqPtNsa2KX9kNmwVNHnVwT4Hz4v7YuveiaxkpeHBGAPa?=
 =?us-ascii?Q?0HP0dn8LP0vsDpzy/QAB2QGK+4xxETH4PmWsmNcl6uq5d+25CBPZjA10CckK?=
 =?us-ascii?Q?4/kLEkKRVfYd0tfXMmTZmrmagbIXc98yJPtM35jgd1PyVwe9zPXFXLvOdchJ?=
 =?us-ascii?Q?9RKyH8e7dWrarm6DxEOCHy3hVtGbjc/iQVXhwN3lrOSWvlzOSac95CqZBoV1?=
 =?us-ascii?Q?QajqXQLoV8P6AOT4ljdujePvfoJ+/Gm0gO2kucqCZBLOtK9090BHbGWAYR2i?=
 =?us-ascii?Q?VI417/4yQ31lI/v1X3bxOvybvLY35JlnQaB4oVcqEK/9eAq6/6r7ISyybp1f?=
 =?us-ascii?Q?smdRqlXHLsSZKZmYx3GdPAcBZI1GdNeSaChQwa5lFbNjv4+6U/sPq0E/laoT?=
 =?us-ascii?Q?Y5hXEZBs4MH+MuxLLDlUk/12tca6m8IbugOvSwjZrBKVOz+BTJAnOJlORAJJ?=
 =?us-ascii?Q?CJIzBx9m3Fv/O4Ah81uIPOZx9dxv/khCSjFLDNe0lpBhd+OJNq1OWsGV4llg?=
 =?us-ascii?Q?1RAgDvLN/stQSNsJfcOiI3abdcasGq+ypA1asuRIpIUtE1X+URl9ZDvOCDUb?=
 =?us-ascii?Q?a4NswJI74SdAz4wbemEFojWt+T3s+n9BQZduN5RFL6sbfFh61M3aI/2HROkw?=
 =?us-ascii?Q?ZKyN0/xGB+HwoAFqU+YakzYa8S+q/JEHuv0tmn7t6SZnHRJHNZcHm+rw0Gx2?=
 =?us-ascii?Q?wCmDtUS0abNQh65fyAivkzJ1MPq2IdYYx8kg/NTMMxlJMdE8ofeveLT90nVf?=
 =?us-ascii?Q?imQA41bXFEnNZw11uhzEbpgSxyIH2coEwb7fSqJHeiV1izc/G+mp68ewMTL9?=
 =?us-ascii?Q?eHaFq4c2OD+w7D79jmd2kbMjFV6yrz7m27FIJqDWFlfPL4twg4Ov3A13qkES?=
 =?us-ascii?Q?0E9iWcePqxdkWA6JnyhYTkTt/gbH4cLlkAlHupOTedvgy/wr8SYEtYzXbbW1?=
 =?us-ascii?Q?Si6sVD7udXZjFZQ5WGt/aRrj/RdsD26MkeFVLGR4Gf0zKf8nDFrNz07VRHN1?=
 =?us-ascii?Q?9f2yRJRpbCRuBMwhUI1Mkr12jOSFatuQyiXIjRz0bGcBAAaQdXBYnmhTkEAI?=
 =?us-ascii?Q?QWVzVJxv6fGJmyc33ZGil4tdEJ/M371/p8VchntmdONMZ3mGwfwOnbPE2ki/?=
 =?us-ascii?Q?BUQUyxQr4w2FuFnQB7u9VMFvd4g=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a4c552-b099-4a0f-ef2b-08da028b0246
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:42:09.3414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4spJGlTI+MK/043WYpvFUs/UU6XQr2C6lEdlrBeSh0RD5CWobXFoHMFp8G+suBegiA7riOnKpNzjy+CfW6jZvczFDsdQy7rBw2Ti+pWHzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3771
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

When processing I2C_SLAVE_WRITE_REQUESTED event, if slave returns
-EBUSY, i2c controller should issue RxCmdLast command to assert NAK
on the bus.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v6:
  + New introduced in v6                      [Quan]

 drivers/i2c/busses/i2c-aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 771e53d3d197..ebc2b92656c8 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -244,6 +244,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	u32 command, irq_handled = 0;
 	struct i2c_client *slave = bus->slave;
 	u8 value;
+	int ret;
 
 	if (!slave)
 		return 0;
@@ -311,7 +312,9 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		break;
 	case ASPEED_I2C_SLAVE_WRITE_REQUESTED:
 		bus->slave_state = ASPEED_I2C_SLAVE_WRITE_RECEIVED;
-		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		ret = i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		if (ret == -EBUSY)
+			writel(ASPEED_I2CD_M_S_RX_CMD_LAST, bus->base + ASPEED_I2C_CMD_REG);
 		break;
 	case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
-- 
2.35.1

