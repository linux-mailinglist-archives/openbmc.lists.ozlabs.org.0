Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B42C5EC5
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 03:43:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChzT44nfWzDrPt
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 13:43:20 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=selector2 header.b=qcyea6Qs; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690109.outbound.protection.outlook.com [40.107.69.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChzS25YbRzDrPZ
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2020 13:42:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k92Zc237rEhVmyU+eOqIpsAZLJzPALB7H1o5ALMqVUL2wLhi6MI6thEEbW1b5uRuIIGfJX8YZC6enezAM1SmTfPizK4YOHwkKOlg/gNVLEfzYYF69YdE2NYGihf/JPughNEfmArgeDrEOsGT6PWxO/vGPijc8bn5ohoSrB/VVcuYd4cuKPCYjn1XmUngEnqJ0vGlNLWq1OYz29/yebi9to2env9zQebncuK0I6NNkhciwTZ92mtAdnXoDJYz79P6oHx5jI+LbhPB6ZIefOPpSjHEpcoTOAB9YPscrdpuB29ikZarmzB0GjXupa7lqOrhVveQ305ebMue130bRgxRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEhAVUtkDCM5exCHPCuDkzS3/yGffRsKOffyIlnhCjM=;
 b=UwAji4R5I/qrHL0ZT3ChDMlcMduNwiFlPrwR5qsZ+HvvsxVFl7f0cQrWMlRiSv6/CDqiQlDFad6Uz8u0xZDaOkFfUNXnGu/G6u5kZS6TG/IKvKW1j1RS+oKTOVURtgiPq8JNbpt9esacUkXbHjlcSPX53L3t9nXb+bofrGVuCl2sI7ds41Cgv2zAjDZeID6nJjS3xatBlYBPPe96vCn6Q3tJraDaRAZ/d94LocuUxGoIVyw5SkedvaPw4qY9TmPnGB9H+ahs8aUjx7okk/K8FoneXCd83TQC8p8d8aB8Z6Cy7lFlCk+eB1rdObhgV1UT2O4q2gCcDrtJxxsEdlmqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEhAVUtkDCM5exCHPCuDkzS3/yGffRsKOffyIlnhCjM=;
 b=qcyea6Qs5zj//V7JDEFwZeaY3qEBQL7nYVhNOyRsnqNSUUCBIyxG6ncfO+vQm+b5WNr5zErxD/VljuwZ11IkZePSRAKZlVixJersLDGjL0TLVoZZKVGUaqWbh11MbktOCKooUHImPzIgJJ4vp4qE7GJwA9oDm4V2V2akWFGYjDg=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3450.prod.exchangelabs.com (2603:10b6:302:2::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Fri, 27 Nov 2020 02:42:19 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::a88a:570d:e821:e1f]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::a88a:570d:e821:e1f%3]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 02:42:19 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] ARM: dts: aspeed: Add Ampere Mt. Jade BMC device
Date: Fri, 27 Nov 2020 09:41:56 +0700
Message-Id: <20201127024158.1486-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
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
 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 02:42:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee5970a9-c1f0-4f1f-5c54-08d8927e0f10
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34508B42F420ACE22A07BAA0F2F80@MW2PR0102MB3450.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQi3vSDity1OtTnablDRSUXhwJfbKMgDnAMdmTJRZ7BW/pBgbBTynDXPYnb03V4NjbpPDLu2G3JxYjMiierQeFwpVIWs+MyZlL88lmWpM8CDByrWz80ffuHBnCdhmtNhatA4dnkmM8fpjpqbX0mEzLneSiAsRkdxXCZP9hFDvXOGlP/eObVt0Xx8HX80SSJQrlMAHtzO+TrIQxhz152+ai1pK9bRgV+WERrgVnCl+oNHY+1v8UhIixjkT/fgendvDEg8QPqZws0vF8bqIQ0i1XwvElOt9rYz/N4maFuC4Ya0wv276h5OAW9FzZbyr5EY2RSxDSvBVpS31OoG+3is9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(396003)(346002)(366004)(186003)(1076003)(2906002)(54906003)(8676002)(8936002)(6666004)(316002)(66476007)(66556008)(52116002)(86362001)(6506007)(16526019)(2616005)(6486002)(26005)(4744005)(4326008)(107886003)(66946007)(478600001)(956004)(6512007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l+OdD3RpzlZ8TFv+7RvR00iLnIf2H0lSJcsy55xWS5yriY6Xu6KYzilE5WHd?=
 =?us-ascii?Q?/qhD5b6K9t7kMFdcE8tWqHKhLlbaJ6zMMhvDhMZ83STIIWNMmvA2xSxx7wpK?=
 =?us-ascii?Q?ZgsjSg/xNpym9HETWWIbtX68+jeFVunEKyN09GRY41+OxB0iQHlR9foTvt+w?=
 =?us-ascii?Q?1bcsNGjoAckxFjorHnKhaUZxd603+rvCsceJy3IvPeQAoAef8r30a7QpDNWS?=
 =?us-ascii?Q?IjTj1gRyUSJO+v6g4xLzCo4i2MQe8a+1t/8t4RJ6tcK9q0H3NPUAmzdC5hcy?=
 =?us-ascii?Q?fzacgUVyb4qU7jwaQcCxe74/3Y8rf8HWnIdCoRhw3Y6e+A6extq7ua0YKOFt?=
 =?us-ascii?Q?kjb/ZSVikygD2bE0HOEzGuhaSkYkLYVy1ZZBtzWds2tLFztaZzt8FquWtC0k?=
 =?us-ascii?Q?wppp4ky6W7tT7rBRqjKfVQ/fx6QOS2LFzJV/GR7sGvLIDSer76EDpg0IeCVJ?=
 =?us-ascii?Q?9s0SCmxWI8uu19n9D8fwxDxO8ML5awnl9EuvNjdynJasejAwCuUI69ggosL2?=
 =?us-ascii?Q?3Xw3NVyRXcT5jDB8kT18/ICljuc2iq4nQtJ9DklHjGE2nJk9fcyyWmL9ktIZ?=
 =?us-ascii?Q?LYXMUdQ47SG6EVPpjLBE/7iqhD5DPnVIqJNhLWwUu4X12MhJD7Bf+4XyJIY4?=
 =?us-ascii?Q?I6xE5+gnRxwcuLEy0+4A2RlhbPQJJgBgdcWvMNsKORf2IFmqXiIpJuDx1qbc?=
 =?us-ascii?Q?cnKv2YYi70eVnajPjds+GA124o0bCYrsjCB5NXDqc8SpnGkyRpTrOONmLgmF?=
 =?us-ascii?Q?QfV95m/Q4DOoyWKbvtYUx8LaF59IQkBBsQxGGn6O8VAbmAGUTzmHhOvVr9Yy?=
 =?us-ascii?Q?9Hk44Dvc6RQQtOcwcgRIMJOXEheyYRn596hDGrEIio49JPhfZtIa8cLHr+je?=
 =?us-ascii?Q?KqBOCYitHGBCxOgglDCt9qcn+gc3asg6IElyMwvN8IOMAF0kZOkHLjta6GJ4?=
 =?us-ascii?Q?4w2GIpN5UGaHIga9ilWWM0ARQWLQmlSq9lN7qb/rHFj/2qapVqmAcRHP1c4Z?=
 =?us-ascii?Q?fnKC?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5970a9-c1f0-4f1f-5c54-08d8927e0f10
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 02:42:19.3987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jqmQM1YuOZqj9C4C+xSebPaZy8Ykk0UrqjUz+W1ZmfrKh1RSENPfPiyDAHGC2HS4reV3FpVSNk2MYQnWHnWV5lyP3ohFxHNT8krMhl+Si8=
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

ARM: dts: aspeed: Add Ampere Mt. Jade BMC device tree.

Quan Nguyen (2):
  dt-bindings: vendor-prefixes: Add an entry for AmpereComputing.com
  ARM: dts: aspeed: Add device tree for Ampere's Mt. Jade BMC

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 568 ++++++++++++++++++
 3 files changed, 571 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts

-- 
2.28.0

