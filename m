Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 320892C5EC6
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 03:44:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChzVm36KszDrPn
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 13:44:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.69.109;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=VQYzCYOU; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690109.outbound.protection.outlook.com [40.107.69.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChzS43fnVzDrPZ
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2020 13:42:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA9SwW9BmBhTFc1ztXj/q7erOTYmTDVavaU9tLhL3L3E5t2VgbgEkZcuwgfakqLDeqn/1dbpnVzpfVKFUikDs0kS2n/dcRzCWwTthvG/XNopFQulciKSKda3SulSWnaOrRlAMDvfKgv4Vg202oFRH+F5TBJSvyVcskhmtyjqKN9E8VubfOxhgenRlDVaWeLs/D3L1RaFQOHID2CQIVTDPZ1UA5hEDQHhCVnTLSjWsCjVx3X7TlK24cjryEYaKkVVre0hgXSWAHMoiMJcSFgg8J0ZaWO+2GWLS3oL9kPZF7dXe8t1kGoQ8uO8LZLUst3Vn7wpqsl9XXaXDzz64ar7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8ApKUVd6Q1WuI98FzUYwovbczuPvmKtVJZQBxfKDLg=;
 b=MmAguUJnQwSYJI5moIdrIq7+Y32ZwFnqQIYkdSeXUK4oTg0Y8KkNdDsuOGFZm14J0ayXODnobOw88JkuyftyENcFx/SSelOlt7TNtkKe59Dzh2xyqAfeoXEx0zfOZtCAr8XDRH8xAifuM6uQkoYIHDN1DtOs6BPF4w84sGta2hTPX3eXcrMNR8EaArnhe0bGgG4cilme3uUOnkXyKWJ2Pz2QmyyZdiy5ECFdE1luDdXTOo5PS1eMWH94VeblzV9LOS1kpx1EaGhB+58m+b8BVLY6pibLjkuaYsRTg7wBFjNf1iAPTptiLRflpYM4xvt1KllaU512hnMRt+VVQX+g5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8ApKUVd6Q1WuI98FzUYwovbczuPvmKtVJZQBxfKDLg=;
 b=VQYzCYOUv4KXPOjnAGpJTevwNVdD1UkvLEu+KhiXTDfNnB5kPOz2nMZVtH/jw8th9M87sP7CER3FOFj7awEM/+m3PFCoyQ7tK+CI4rG5iM33G/ehvnM+67ix4NhNEV7RskdggrYvMVWuKl9zg1NRax3iSzMTGcAicEm1jxWt3sU=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3450.prod.exchangelabs.com (2603:10b6:302:2::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Fri, 27 Nov 2020 02:42:21 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::a88a:570d:e821:e1f]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::a88a:570d:e821:e1f%3]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 02:42:21 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
Date: Fri, 27 Nov 2020 09:41:57 +0700
Message-Id: <20201127024158.1486-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127024158.1486-1-quan@os.amperecomputing.com>
References: <20201127024158.1486-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: SGAP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::35)
 To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 SGAP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 02:42:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f05dc88-0ca8-4750-fc41-08d8927e107c
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34501B951B3580A50DCEBD1EF2F80@MW2PR0102MB3450.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jr56kul1bTBYvsgO88OXwVQsQexcmEJAsegmuo1tGWNJ2jB65fJV+8uar6ZXwCu8ZNAkLAjNE1ytH9aOJcoIaQN5bekl6M30P2Mrh2IMRf+HdqlH2PU1vVw9hHDLm+FSeCi/kzrNS+dVK/PQpG+QioKba/rc39og70jPLnTUj0g4jwwtcsDYUcvOVvVSPd4/ur2of4x9HejZ1GTBi9nD2DxjxVdQ4gheh4BRiTDr4pKtUmVIgRuTnWM2mBmCk+wE3f4tfQs8P2ZPPU2g++4E6TN5NE8fx4pUwdLGMuH8geLZ11T2y8H0/902Dql9bI5ruwVlMGcxt5/i4wwSfVvrhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(396003)(346002)(366004)(186003)(1076003)(2906002)(54906003)(8676002)(8936002)(6666004)(316002)(66476007)(66556008)(52116002)(86362001)(6506007)(16526019)(2616005)(6486002)(26005)(4744005)(4326008)(107886003)(66946007)(478600001)(956004)(6512007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?h9/AIDtMXoUtFl8wUdQHzjz4Km7/IT2zYdjZv9+ZPwRmQdmtcJ3Yx55zpl3y?=
 =?us-ascii?Q?8ouR0TMgTmByea8n10HE5PKIjDhps4/lJLuY6y6SL13+mJwlP//+WvMt/JCs?=
 =?us-ascii?Q?1Vr9ea89+xQDLEaic3mbBfoR5kQ5icXWXfXo+mW1n2Y9rbGKqvg7e5t7QmX4?=
 =?us-ascii?Q?tpd87oWYwBTWYNk2Lv6mvRpmeWcqLqrzv0yNJqikE+iN4S0e2Jr7a3rcxkNG?=
 =?us-ascii?Q?fDmIlszpLYJnRpHjKgUhVbaV66BePhweqR3ao7qwVvDfBuvx7Z0WsaJWYZJd?=
 =?us-ascii?Q?Qg/128dsfeWLQm2+cN+8Ndof4xlTYjKey9t6bo8RzapaZnvtd3IPJH0i1zRh?=
 =?us-ascii?Q?PyevXQUUiN9SzLCksnBB5o63aXIU3p2fI7itz7WxVeB2r86033twY0rwgpLg?=
 =?us-ascii?Q?BAK3k7kOO+zep/cQhei0MbnDdxdqgy6w0GRsVfuF4JXkI7y7M4zB2sDvuW18?=
 =?us-ascii?Q?4Y7xGhX/eRBdrIUaFgvOXRckKlIl1VhkEg4MVCG3YQrZ0SYisaiTGKz/qq3H?=
 =?us-ascii?Q?acadPK2Urh0O0jYvpOFlIRzwq1+l9pkpKAa+x//bJpCXUoSVBoxt4atvgsaq?=
 =?us-ascii?Q?/NYPX+QeVRHWClPtayV1adKoHanLLadB3KYvIsKJsFJUUA0beJLtB88kHW1e?=
 =?us-ascii?Q?sDwd4GrCnjWf//TZe3pNh61HQuj5xJ6+Octa9F8mBMlfX6fGR4AbsM5mLjby?=
 =?us-ascii?Q?HcHQ8gnYBHQDFluTZorZBBAq6aN5/lQXRHWYuB/uXhjQQUntNtcWbboDsrBa?=
 =?us-ascii?Q?cQg9X3SAzEIeMsceVNRpjQKjRk61QOhrEKRqBtyBEQWHhqjskKHFriAvd243?=
 =?us-ascii?Q?NhOO0TRG14jnCBm1bnhSX3Ra3fwJ+awCey7lWbIjwb6wUwATowZ2tJVMh1FC?=
 =?us-ascii?Q?8qh1LUQtmdpcZlYXUQyuzkALye1b15kAo4ptIIRVlJQYmk4bNK5vMIkwG8XM?=
 =?us-ascii?Q?jjo1/sAhV1QhfgLCZPxC2crnhIb4JvsjzNnwqAmazY2r8za1zH19KoCTyHYv?=
 =?us-ascii?Q?CGrY?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f05dc88-0ca8-4750-fc41-08d8927e107c
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 02:42:21.8403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yrH+HC7EeuZ92oqSM5NUNvD25KEyAAud7PxlEK/gtkG+e52fYPODSfV273O8Jn2kmWf2osT8v7dB5ZRMrZYFsPIzWwr4DIBGcUe51P6QSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3450
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
index 604166ecaefb..1887cd5687da 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -99,6 +99,8 @@ patternProperties:
     description: Anvo-Systems Dresden GmbH
   "^apm,.*":
     description: Applied Micro Circuits Corporation (APM)
+  "^ampere,.*":
+    description: Ampere Computing LLC
   "^aptina,.*":
     description: Aptina Imaging
   "^arasan,.*":
-- 
2.28.0

