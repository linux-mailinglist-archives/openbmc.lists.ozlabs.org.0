Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B495D3A8F32
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 05:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4VZx2w3Wz30GS
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 13:11:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=OHVc6pOx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.122;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=OHVc6pOx; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2122.outbound.protection.outlook.com [40.107.237.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4VZW4RsFz2yWN;
 Wed, 16 Jun 2021 13:11:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdfvqzRDO65NR8BxDpeuEWhFBQEC9MzM28Qpup9sTtLo9uF6zWTrRikbSmCRcK5A6fktP8St/HceF5I2y/BiPOJncHchfanIzBB3GJj/dLeZah1EGCtd+5Exer6yxqn/b7wvr/XTzynxhP9rELEnkCA4WadH7ocweCQDh3Ah9MqIwnew5ib/8e9SkrH2NpBdt4B9DgnBu/a3apa2yxr4vq4iLJOD1qxF7WbLoKucmlzHW8X2kSw4Pq2pMPK9FKqcM8paW6PnSkIcsyj4/WncL3QIv4l5f2gMpDW1uZwnm3FbZghn9XEQ9KyqxdV29ZsfrKQJ5VHb/uM+8YplxprLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rB4IwdppHnDtjSly2R1vOI/yiyYMAekO7oDaZRSqtxI=;
 b=bc81QRwE5TeCSJcSTkmsZ3djxCYqc2RDwAeLNHtPuOIi2WCy2tNo5/2k9JtVgoJuuLapD528iCLWfXkW0l4lIgtxqsPGrFUfGKIJ/7Xfedk0IUfALNbr2Y4t/leIZER43NMLEo2kycqutXCOwNEwsJCA+pQhD7DHfqN3Az16UMSUbejh6pk+iTAs/JpifErP5y8Zcy62BnYzlEuwbHA95OfliOURBzRTqi3O63Rp9Q4izRxiaDq+Nx9UQvwmHyrQLx2BKoGdPBswku3OLeHW5Pa8MpSgcXBN0XKEHb4JsyHY1rgI+F3BpZILazKzPe68ro2x8TLsg90nZiKQIAdBeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rB4IwdppHnDtjSly2R1vOI/yiyYMAekO7oDaZRSqtxI=;
 b=OHVc6pOxVB7zLniy1IGif3dT3jg8T8lhEsqbbmv4STe+xO9yS5wUchJmGOYjFZau1IG9kTHzEruyAGkrUMYk+1S8aMk/clixzMqrTN1QTYc1aPRdDUVAglG1ol2te4e4vWTbDUaXgiU1ZMmwQu1bctuisKjYEnCbd/0Z+txs4lo=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2200.prod.exchangelabs.com (2603:10b6:102:7::26) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Wed, 16 Jun 2021 03:11:03 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 03:11:03 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] i2c: aspeed: Late ack Tx done irqs and fix unhandled
 Tx done with NAK
Date: Wed, 16 Jun 2021 10:10:44 +0700
Message-Id: <20210616031046.2317-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:203:c8::6) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR03CA0001.apcprd03.prod.outlook.com (2603:1096:203:c8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Wed, 16 Jun 2021 03:11:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fed0ce44-2bcb-48b3-32ac-08d930745fcf
X-MS-TrafficTypeDiagnostic: CO2PR01MB2200:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB2200743C46B3E57B4F48B8AFF20F9@CO2PR01MB2200.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vf0UeId2CY1xx5pyR3tbR1jGrKNpr9S8ZExEED9RsCSH0DrUzpTw6L49QZJhH/eAmGo7BrWfD3XJXR1ergFOcnoYFPkvy2kgXNCUxRuWZVhTmuvj5CiV+w+jGfwwzbX3n5N3VTDphwuOYKD4ap40nK/uXtqmOP4kGHlA46hp7jZobS7rLOfWuDPTBtFI16mF6ozopqwqMUzQEzkCVKIIE4Yh3YYhSvH0enkCbuJsgKH/31w/Z9jE8pHfHUKdHEV9V9soarDqNV8kcv8Epx/unegdRT4l/T0I+1NVbDdKp6VTi8nPgVlhFwxxT7JZ+dkN0dZzjcH/k1tc5RSm1T5gCCBrtuXToU34BEZsFkLgQzY0hKpVy8/E2nyRX3K+GgdEPneJsNJEAtmwQXwQUjKJRdGx9uxKUd5HwocAFz3WqiWhuqmPnrUcVU+FCiyjIEjkQ/5p7A0bK/l4y/lZRBFEyaCUDR4lWlEjiB40lZkhA2oZA/CYmcRM0fgDXWKA50vPHa9EEwHJpebi6iI9gwvD/2hEBmLnp8oyiIyK0C5ocV9DeN8E9M/rHh+V3ZWJivT+8FkXpIlatNQOmcvOkOdYmAvamAlJVSLMrtwlNmT/mfoYTfm4xPzpnXq4QqbFIOvrEK5+OIqKaN4e6YpUugDpDStSHSzx6opwnNJCO7ftL6xk0gsWx4WWkZ8z8doqpBjpanTrOPunXJPLizBs2GTusc/N4j/TBHmbpr2hmD27pWxnEV35TFWwhJyztaiVOhHGDW0yAj/66tTpcGzxm2XHZ75YVKVGLuz+ZoYR8OL8ris=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(366004)(346002)(376002)(136003)(66946007)(956004)(1076003)(186003)(16526019)(921005)(4744005)(2616005)(38100700002)(38350700002)(6512007)(5660300002)(7416002)(83380400001)(8676002)(2906002)(6506007)(107886003)(4326008)(110136005)(54906003)(26005)(6666004)(6486002)(478600001)(52116002)(966005)(8936002)(86362001)(316002)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tlY27AphRGIJ3nfurgBuxtCLZycnUbAqlOAQ2iUb0ol3aN/EHDdzmzl8cquO?=
 =?us-ascii?Q?SIQtKfWSPAaizM8rBxXNiKy+Lean9FAq6da6B6JeU1i6Hy5fbenzADB4ZW4q?=
 =?us-ascii?Q?/AaI/SU3aFsAvREGkwU9ED1eHeeeVreh56I17qLuH2ZZYbPssYLpSnRn9cHu?=
 =?us-ascii?Q?zwLmELla1qpEbBFh5QURr181IqA5RZSkWojpbxvyIEOtR+Q00zgIRlYIcqW7?=
 =?us-ascii?Q?2IfaM2/O44SQzx/Ttcy++Bm3bg5Dhe67JZ+XQAh69ej/4YCMvWpT3ByW9qeX?=
 =?us-ascii?Q?c5AghhUCDATd9cDHWFCaFenx4UInuXqNGpmK+xbzCw3vul7fdpRIOJTnJGMC?=
 =?us-ascii?Q?hW+en5wDlEHqi521LxuLptx4TyElClVfQrjAvCnrGhh0o8mxj+pVTKAT4lyp?=
 =?us-ascii?Q?r5vsDgyfy5faRID3vDkfSlUUBnjsfGhfuV1iTts0FyxLQ+yDFoIczTv9y02z?=
 =?us-ascii?Q?he/CqVkKVuJY9s6ecB+3iCaJfVexv9+cafgGzcxXj/QagD+osi51OPBmc7b5?=
 =?us-ascii?Q?99vfImgcOrJuYA+P+2BEBfYwbcEt+xuf3qMVB6pspiqgfviBx1kgbTZkmrVg?=
 =?us-ascii?Q?jBY8xuVb+qMPaUBSns5cFl28CJ7ksye+rgCk0KPAp0alWpjdrHPlJtv+UV3Q?=
 =?us-ascii?Q?UI2UcF/7Y6VWQvNxIGNo6jqKVrOaYhFGQkuvAPRleSvoI2sejXzX8lUnz0el?=
 =?us-ascii?Q?8vBxqz07GTn/cvyASesJjv3crFjqSO5oPj5Z+gzYd3yJuUSzLL/sYPvu4vGq?=
 =?us-ascii?Q?awauNV7AZzQOoATtdO8M3+SSA0DMmUATlxbVc5+V8s4U7K27r5V2xYnPXL/e?=
 =?us-ascii?Q?tXosWecqK4ytha6ClNKW8O9ucllWeB4Vjsq84oVBOYGdMCI5jYQd/2LvKays?=
 =?us-ascii?Q?V+HMgvcKV1NeeBty/zBP9blvF6JVOW3aYtWaYcpEC6PRcIf3402tkaM73fX4?=
 =?us-ascii?Q?p3tAokyDAmq7KQc/963sBIFIztBA7MpOaRv+t7sJM+FJt19WacK/+AhIrWSN?=
 =?us-ascii?Q?/65qtWQy41c1DeNBo1ZnMEhuO8Ska+k9OslCqZ9y8OZQTEi16Z3DryICPkOR?=
 =?us-ascii?Q?Tq2n6IkuTd3iRHl1g6ARDeeUGPQfjOBlKyGc1A++NVKh72pp4557JaN7D0gC?=
 =?us-ascii?Q?6DqxI6yW5HSoUq+fcYiNlJUZAMqwkgwB1EUDmxEbl+Tqf6bVGIr0ycsP7hNn?=
 =?us-ascii?Q?pMZ6s1wlYdvwArNIBi1Ztvs0SIBgKqr4M5hg23EKRfHByCKaQ4RKm8yO2Ui+?=
 =?us-ascii?Q?obLCdK3yxA8btQ4qfc3FwvF9W8jOiaCievoXSgvV1uDRl7eeAIHO12sOvdR3?=
 =?us-ascii?Q?vu+0Eqklwoyx+JQmzDol0Mnu?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed0ce44-2bcb-48b3-32ac-08d930745fcf
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 03:11:03.6486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/T2clpQ3aS0jAx85eJcGqpdA+N7zPz6nvqtcQ6SEcc9AlEGdsZsf5cPEJMIMuAu1aT5szNIRAV0SM+UA+9m5UJ3yMmRgtptL+ZHFf82lv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR01MB2200
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

This series consists of two patches to fix the below issues observed
when testing with slave mode:
  + Unhandled Tx done with NAK
  + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
  read request".

v2:
  + Split these patches to separate series [Joel]
  + Added the Fixes lines [Joel]
  + Fixed multiline comment [Joel]
  + Refactor irq clearing code [Joel, Guenter]
  + Revised commit message [Joel, Quan]

v1:
  + These patches are first introduced in
  https://lkml.org/lkml/2021/5/19/205

Quan Nguyen (2):
  i2c: aspeed: Fix unhandled Tx done with NAK
  i2c: aspeed: Acknowledge Tx done with and without ACK irq late

 drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

-- 
2.28.0

