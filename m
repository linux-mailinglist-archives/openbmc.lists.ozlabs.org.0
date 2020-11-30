Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0122C7FA1
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 09:20:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkypL1SkfzDqvP
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 19:20:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.135;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=YnO1J1du; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2135.outbound.protection.outlook.com [40.107.237.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckylz4MstzDqdx
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 19:18:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYXdHhbDuNgWA+FzSemWQ4XrCKAQzG2m8IY27utinnuTEty1kZWGp6YIXIVBckfu8DRYecnd1rarl7UT612z7WnC4YrIpm5w2w1+IKB26k0Ni2mrEnHT3g6I3YPHGg5XKV8M4cBhTv3dUVojLAorF+R9NMNsd/M0uXSLIrfg1C0AydlLhzTwSO7jEtie011FrCAoNMRzz781DgRRnqEQAxGhckBlb4YjRi4xdlgnMm33qIKybn6EWDH0Rn2BkmIM4JqJb25vN+O1iD+jwOTAnlR39UfvRPl4ITf3hHATmXFJd+AaH1tD8GX7TDI6plNWmfLQJFrP1XbJM0WQvA4kOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Uq6UbUVBteUDgxqqxFjfiLsG6R3J7Ju7+brluRi38U=;
 b=bqlOIQUgRmeadegeMjXl7tfK6ZG2hXLHjhH3yEMzktlOMb5N1yLzOcj0KNz9kpbNqTmhdlnqLgy3gXvsKYENzuC4RW0vjdl0FhR2mKQPkbl5zJQUYw2mdgQ5D2H+LC6UYkc+5Xcj8vmeSYYMIpMOvpO6PVpO12sJXzGTZ74ShRX5me5BIse4dWW8/RiN+sXuhQ5Nk1PY+R7RvYsTVyho93K80RwuVWc8TQe5hULGHv22PSMfZHKUHH7kxEnQVUZm95DFeX+nHvsdxbZgH8c00swo+RlZWcM6JbAdXn3thnQHM6LO4YkiJauZdCyToZ4+21OgJR4GvqLSnA1lLA47mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Uq6UbUVBteUDgxqqxFjfiLsG6R3J7Ju7+brluRi38U=;
 b=YnO1J1duySu/DanVxsbEf4AEb2BvPYqgcZFZMrVzrpz2iGYmMLecr1fyati75g4TWnOSi+ipn3NIUzx1Sj9GU8uHrctqS9EhAF1HdSKi8UULCHAlz98zuwzIva/u8ewjcGMVWyrqH27s2Xtmlyv+n+5iXC+hrI85ZfhS1v2nIAI=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6467.prod.exchangelabs.com (2603:10b6:303:75::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Mon, 30 Nov 2020 08:17:53 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::9978:c933:a050:a0e8]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::9978:c933:a050:a0e8%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 08:17:53 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
Date: Mon, 30 Nov 2020 15:17:32 +0700
Message-Id: <20201130081733.18893-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130081733.18893-1-quan@os.amperecomputing.com>
References: <20201130081733.18893-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR02CA0195.apcprd02.prod.outlook.com (2603:1096:201:21::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 08:17:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06fb2155-b384-429e-afa4-08d895086edc
X-MS-TrafficTypeDiagnostic: MW4PR01MB6467:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6467CFD0DF7F9882465D5127F2F50@MW4PR01MB6467.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owPqH3ND0iz2V0ZxBDr34qz3qR0WbBHur4Fa4rJ8sqbh3eCeT05d9YwA6tQ7+u3yskN46O3dOuF04mf3w6qkHNoTRKPMVxLsqT8pwntGE0LaBuHI/rQey2+2jBqrj2dQUNqiaAsJUduoW+BehNyJmSIleU9IqOh1/x9sC5LSvjp+YqymP7ijm6e67uT+Z+GvnjtiolFLh0kt/HNogHK5JPFZ6h9aRIXkYXh9KRHrIaSyHyhxBw/v8YbwscAQ7ZvvFMa6Im9s21feSUtMbyDdrv6yVGXU7+ywYkxQbYJ1JFJEbvXXZ8kHoQXGN1+II6s4w63q7BAstpt8EKSTJ7809Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39840400004)(376002)(396003)(6666004)(5660300002)(52116002)(2906002)(66476007)(66556008)(66946007)(26005)(4326008)(6486002)(316002)(478600001)(54906003)(86362001)(16526019)(1076003)(186003)(8936002)(956004)(8676002)(2616005)(4744005)(107886003)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?t7WQfqQKtYpAl0mw3QZAT77oJZxwJABqBrBX+7swPAI7LF7TAaIbsqZpsmxS?=
 =?us-ascii?Q?vvVOFvq/9eONpW3EDPifnk/G/HMKx/knG/ii4VDMDnIgOxzxws54bijXsnNR?=
 =?us-ascii?Q?td/WlynOp3gjNHQ6fkeV0q7dYRvktRYZl7U3UetiREpZ+vGPz7VJkTzx1qJ2?=
 =?us-ascii?Q?ZGutl01SysJqoS1O+ng+Ly380iFg37xhMLY2t/tCIvG+acne49INqU23n8OK?=
 =?us-ascii?Q?0niSYAv0JN13QX6d1ANGIVfbpI119n74w0/P0Zg2j11U00B3gqV5pfM5e+Ez?=
 =?us-ascii?Q?+ZF1ktQsAPU4zXYSC9Uc7hqH8k6wB12ljLSKhH0genl19atIxbokRvAZw7ve?=
 =?us-ascii?Q?zLgVDQ3YjRmkPESqe+5pfVEvWlDPjYBmdUNQb79YOd6KRvv/HAy0lBMjLiVk?=
 =?us-ascii?Q?XThox/Wq5qfadCa5M/DC6h+N6lU3ikFcvzSojCCUoGv5Zp25EaH5QrL8wjE+?=
 =?us-ascii?Q?2X8GSdPgaZfzzOIxXdr8w6+Fylvxu8n+cUImOcn3moHbxitLmnNYZ6V8Ab16?=
 =?us-ascii?Q?CS0NIXZRgZzi2626FsIS7UBWtugUMfblirloQU8Uloglsvl9cNkY1iE7AcPp?=
 =?us-ascii?Q?pBoVqAMcKBDNb2PLtH5bnYH10ThoQbqDflRI/8ZRBx+/G3PA5viaD0LDvjyY?=
 =?us-ascii?Q?vSJ26Kuk+9hPzUHdKUNtilMkdHh8kVhMcRowezqdpphOOxw5Sg7by0h0sC1Q?=
 =?us-ascii?Q?AmV8lhjBWaoY26vg1SzDphWlt9DJfftan980fAd0egj23K62QDNFxZtaydMm?=
 =?us-ascii?Q?007NzXvGooJBwNeLPN+MSo8qpj0rrggZim/qk6rwwhCsvAt9kUU20iIR80Wh?=
 =?us-ascii?Q?WKfOXNxn2QznXJQJGaFhMzCl3Wqq+bGv05GZbxcoZ6n+WX+/Y8TcpSV6/Xon?=
 =?us-ascii?Q?DNui9dXlurncjEXfeqy0a7OXCduPcu8frITpX1FybiuGCUJQDCbBIj+IaUxO?=
 =?us-ascii?Q?+VtU/lepM9Q68yE81L/VtTv/tskZL3cok7i10z7vgYA/t9/pQIOxFizxLE05?=
 =?us-ascii?Q?Zdj1?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fb2155-b384-429e-afa4-08d895086edc
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 08:17:53.6722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJTWUGURPotvICFEsYjihkCdx10gFVPjN5xscyeIQZKjHkt6k5m4kqnrMNV2XxIi4d0TNaZvBPRO7KZLXR7OmwZp0jDPDJAUwE4PytK+tK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6467
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

Add "ampere" entry for Ampere Computing LLC: amperecomputing.com

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 604166ecaefb..10f12e98762f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -85,6 +85,8 @@ patternProperties:
     description: Shenzhen Amediatech Technology Co., Ltd
   "^amlogic,.*":
     description: Amlogic, Inc.
+  "^ampere,.*":
+    description: Ampere Computing LLC
   "^ampire,.*":
     description: Ampire Co., Ltd.
   "^ams,.*":
-- 
2.28.0

