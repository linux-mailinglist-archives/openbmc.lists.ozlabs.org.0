Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535E9634FE
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 00:47:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvKLB2P4Pz30Vf
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 08:47:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::701" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724832620;
	cv=pass; b=WKasTOsmihW8qtejUV50sK3grbdHBP+0V0i1QXEdjcDygPxaMznNcx9d37/8OB4BYJpH5XA5HlRmD4Yt/yit7c3fhtEB5GWl4OPdFeFlW/1U/gnt+W6cduytsVRZdea5Rj3MgtWytRI8B/+opbYrA6aDRpK1k5NTVRrPjXEHr04zdLNkrUvp0IRfoGx5hivsaU3LMLiGbbHMiMoj48jRGMrDvypRUaNqVSn3N9LLx6SYnJe6A7bTuIdQ2qSUY8+9l21TfKeeXTQwwpC5/q0kUbdsAgPW0XaImSyykqSugYgGm75nfv6B6iV5US6VdkaLviaYTxemVKvClExspWShnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724832620; c=relaxed/relaxed;
	bh=M5f3l5wjpR/eKiQ2lfe/puJPbmqVlF7nm+3oTgcSjEg=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-M
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=lqyGe1sF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::701; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=lqyGe1sF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::701; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtxt36y3kz2ymf
	for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 18:10:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idjPY+FsuI8j6U7OYzu0AMCd1F1Ez2i5NSL5WXz9M/F+bx19mToG8T2Qugx8lIon7oVCPFvB/AVk2fHKU04YF9c9poy9l3453n9K4O4kKyOSBrNNrWY3I9kpPGqvaZRCPavCXc27Q2nBHAwbOtB3tUV1YO/F8mft08lQYf2mtERAH8oz8XDLPTCRL5vywvhgdzHsmLR8gFVGmLb37NmoIQ/PAFPuO1lF0kqhtoNHRC9dY6hO9FDh0z5fdZq//RBql3JdDKggd74Tc1oHhPL2oIaG8PQ0NIa3Pyo1dr5fSaJFS451FTLhc/V07yooCgJ/6Bso0BNlIBmFB1bEZRm/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5f3l5wjpR/eKiQ2lfe/puJPbmqVlF7nm+3oTgcSjEg=;
 b=sA1qVv1hYX/gcFBn+F5CsrFfYrtSptFthCoZV8ElX5gv4/Sch3Y/zUzD9CkHVNivqiBkK/pY8rjlcIwkx17fdIT4Sm2BHP3lmMRly7nHoOy0PhFZs99Z3/gHPcKvhEwaQJWQRX2XDjaA50Zsxg284OH1WhFsv/lqZ+/2LawaUSS0BFdif4lAhJ6cTNvBczTku0e1fDEPrYNWWF2EeH+x38aUmGB2/DV/pBt75FxRNCLIOy4yT2nHFi2pBhLqsuo5lvcRO/s7AorPo9unhtwFETKceLIt/Jz/WFjcYEcyN7I84R8Fk+BLr50YzRaNFE0ZnT/P+EHlC56rZBa8+lYAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5f3l5wjpR/eKiQ2lfe/puJPbmqVlF7nm+3oTgcSjEg=;
 b=lqyGe1sFzkEoNLOljcr2VFT9cTSsxMnYFc9rhv+WHGcBnmTSxkcgqZAGxIZyQicTQqHAYy/vWNRoA+lkRSElsCLKwP4w8oI8z5l0/N83jLG5nrWpN58EznquRjyP3VU+qmEoGCfjSFOfy9Ogu5uEPuIGNqHEful/8FdBaRHqEDiCpPoRJ4ehI1ubg35TSMp1KwAtMYrYPI086Vt9YsI/L8IONvwegoODen8I/+Q8e7Sb3x0Z0FgWTj8AzTCAQI1SZ3Y6t2dznV2VX9rEBjifpAYx2fOwlPfKPXTJyZ5RQdob4CrB+VSEoPTs3rAxEUx5sg+PoJsXQJAhP4+Sn1vDHw==
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com (2603:1096:400:271::10)
 by TYZPR06MB5526.apcprd06.prod.outlook.com (2603:1096:400:28c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 08:09:56 +0000
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b]) by TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b%7]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 08:09:56 +0000
From: Vince Chang <vince_chang@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: build meta-zephyr or prebuild image
Thread-Topic: build meta-zephyr or prebuild image
Thread-Index: Adr4+ZMzrhwa+rofTU+edif48qH9QA==
Date: Wed, 28 Aug 2024 08:09:56 +0000
Message-ID:  <TY0PR06MB5707DEB13FCB8F7A30528E25E2952@TY0PR06MB5707.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5707:EE_|TYZPR06MB5526:EE_
x-ms-office365-filtering-correlation-id: e3ef1f02-8b7b-4b3a-95b5-08dcc738cdac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?u5JIfuiZy+KvBdipBpgRQt1IY34KoVhI6HK45Yx0xL6D2/dEG2ZaXIJAtuJC?=
 =?us-ascii?Q?Pj5SsGOYiKETf1ziAIlMo3yHqdJY7zRo+vg/P6EDi88nQuauAfvPxjyXr48a?=
 =?us-ascii?Q?kDZur4Xo6ZatqnDLaLC2oy8zLyEILP+d9LrxXNY+xM8/ly/nA9fGT88fH/qi?=
 =?us-ascii?Q?aYmXA+coZ7kWJLDXdnWVcebkidHxfgN2il8VLHdr9moyGCwSb+sBjQen0jat?=
 =?us-ascii?Q?eoGplg1zyfGwTLrAQjoc4cnNL/lML42tiRZ1bGTDygGX3nGWrX1FWOIWzJl8?=
 =?us-ascii?Q?66OCPD0yD8RwrpW3jgmhtj2+GjoaHJ718o/l72lU+evZ2ZZbH/4cu+cvahwN?=
 =?us-ascii?Q?NCsdjtqe61PqMCPuah4a/o61SJaBhvoCYR5dPZD0ALM/eXGUqiWbVVtZdBqv?=
 =?us-ascii?Q?SjLpfaBVX6t4ZT4pInhpaZ+WyUQN0Blv1muSEZQzKqYi+04RPsdYUjkuw0nd?=
 =?us-ascii?Q?sPsUd6LjLpwrJO6ptjQoKZCea4g+GqFyPweS75s94dI+a5bkXW8yv0mAspOS?=
 =?us-ascii?Q?Tkahkp51e3aq2DPwAG3auvmlF+FCbI8kCr1Wmj/VmheEYzleuj4r+5V1TbBP?=
 =?us-ascii?Q?ivNGi/tl7MfX/CaDxUSeZrra9Nul6lfbkVUTsvXssXQ/CdPJF4tFiRyz3d/I?=
 =?us-ascii?Q?Ca4o4KMo55pY8gBUl/tY4tq2eZEI23exYI+RlajbuvKvXUuYZrOtiH4qAisE?=
 =?us-ascii?Q?OjzGitfnGMH2jmfaMi8bAfVPYHG3sSvcigBmhihjUjojq2OJGtcWw/XwAxqK?=
 =?us-ascii?Q?OJR1yWOoc/54xq5sdUSgh66Bp4WGKCdsfVy8Tkse4yHwUhGvO6wr7pT8SIn0?=
 =?us-ascii?Q?RzYYKwbRyxFyrBIAtcaN6Wq1XRGDNLuuDlMYQno4b4CS7qwOys7EsetiQt5f?=
 =?us-ascii?Q?Jnzg6+ZXK9T/gFF3bb0xWNAtr/DX1/QOIeAgF6iRxSBte/OIPLkGBHIPfBmp?=
 =?us-ascii?Q?YBLFRkdGuzfyCXoR05Rr2NRrYS4JGz1hy9aWHeVGe4XwnPMijZLYVwczEgg5?=
 =?us-ascii?Q?H8jseZ5Zdz6Nxg/LA4vL164vgctGiSMXjc7Siabnl9lskHDvqujyMXRYymGI?=
 =?us-ascii?Q?adySdByuyHJ5oOekFZGsqvMRnkiA7C+8jkTrwOhpiS3RpiORrSXDLe9k9nyR?=
 =?us-ascii?Q?nzQXZvxUGLAVfm5e6mAwNsxjYtW9Hl41Zg7bhOoFfF7QwxJJrONTuUCGqHmV?=
 =?us-ascii?Q?ca5AcNYUdQgizNnP+yZVAqWmBKQ6Yk2Tu/45wAHMZqK5FwPUODOrLoOgc3Al?=
 =?us-ascii?Q?RDUb9ERCzBvBVxJotgylkSQVKHHS6q+A9Tande6eL7Cdh0odaYxmsQvkw0kx?=
 =?us-ascii?Q?wjEa7KVr80iAdzgWL5Ki7LI3Zu0mNZ6Odt5mK9rYZMZDPItpZWYHapSM/8Z6?=
 =?us-ascii?Q?1vq1hw8=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5707.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?uYCEQykYSoFq8rGlQVwDsBeBXluCcAYUKJ7+HsZE4zQRhikIGcu1ThWGwkJE?=
 =?us-ascii?Q?rjuqZr+MterJ5QpcYNbzB+AH7L4eB4XT+kxLsc2dVkgtJGRL1YKb25oDYQEK?=
 =?us-ascii?Q?0wOl08Jzm+aEkib+QzyV9GP37qSflXLnHpBeb5Px0ErR3YCZv6Tuxo2FDWZq?=
 =?us-ascii?Q?PDhDrKUKG0QNpEo7DA38LdXKJsy66xs6dLdlnIQxil2w8QQlE0E/sCVjIBp4?=
 =?us-ascii?Q?sQccSBp7JcISblb5F3eB6n/kik1Lb1U0oxeNG8loPwKgamRFw4JjUha752QP?=
 =?us-ascii?Q?0CKJsxbZOZN4tKo/H+wEcDbaaWKPWpNu9t7bV0SsS6E8KLJw2tGV3/B5XXwE?=
 =?us-ascii?Q?7AwRHXwoo1o5YxsSk58UN2pbBfHWl03jCVDc1jeIUGHqiiuT4mKfex0f6NE8?=
 =?us-ascii?Q?nEouEO/eo82ySXDLEJrippAKPOUET2SbI2DYjMRolg1ci7+sUhu/DWsxx26J?=
 =?us-ascii?Q?XET1e1p4nB4yfqmRTj2DBbQPDBBvCD1kWECVHXXyxk//u1s1vYEnbQ1MnJcF?=
 =?us-ascii?Q?kq9j6jqXoptqKTlttjKH/wHn+FjakVzTfvChC/Xx/vQiZqI3bf7strrl7BeQ?=
 =?us-ascii?Q?mgJ/6b0eFYbeqI/59zB1DL2xxmyTUH/gkYtz78avlugZ86PpbyLoKg6M/YBk?=
 =?us-ascii?Q?bnuWBIqp5ZYrHNpejR8DCvCbdwjyQt59l1vwvzWf992sO6D6A6TTu5PwVyUL?=
 =?us-ascii?Q?VQOte4hzJZGJjk4S8+FKXbIw02hzBU/NeT9Q7aih27biNHah682s2Dqxnv+c?=
 =?us-ascii?Q?7VTG9W4rDtKrnA4BB3CmhfkRCe4kWd2UaHKATL8zg7GJ8eD5tVpBDZJTXVeU?=
 =?us-ascii?Q?FmDI1AO3cqJx5iCZ2XRG9pMvTBBkZYmhYMw1sV+q6lmId6nb92lyyLJlbZ6W?=
 =?us-ascii?Q?HObxPcjVzzeiCVpFOAfzri/JyXymE3E3OT5idb410HbdIu4BwzMvnYsT9Em0?=
 =?us-ascii?Q?kXLQHpy1Cf0EXs+69FuhNS6/gdKETPNrIfNfQGKCoN+NP9i9J80BHS39sxVg?=
 =?us-ascii?Q?rOjwbhi9FRC1ECcHJCgxB1AevUDga0e+28cYN4//1MQq23x/+wBiHEjonkGa?=
 =?us-ascii?Q?adf7Cgr8gI+Zjf3OwtYVl3ZFSVP+GP6P+MOGo4BNeqjz2i/DPB26ixmMUKC+?=
 =?us-ascii?Q?AfwfzE+U/KzNWEm18qCDlIawlbB0U9q73mY2e2thz71ipKoYgG0dVLD5cnoK?=
 =?us-ascii?Q?LFZlGl9QLt4UMK2Ze/pCNgdgy7kqYg67qRG4jVFSRIt+UjIU0Q8rXQ8uOQuX?=
 =?us-ascii?Q?I8wH1DtM9o/sNdIH8a+lsA6vSeKlavvx/0XwWdX+C+nJ+OjkPSz+BHamW7+u?=
 =?us-ascii?Q?8ozhUTp+q0/wXlHBOtzgatzEo7x9sUtn/OJx/edx1VuOhG85zLb/2P0bsKY9?=
 =?us-ascii?Q?lr6p3DSe6gShJoPJih5/mN9tRp+QU1AID3s3BFWIaU5t99fXxaTOdulpYNgv?=
 =?us-ascii?Q?lAtauS5ODBR9Kp/CB9utcITPvaqb57piN5PV44t3sNUkJnSZ6TUYsyUzKf/4?=
 =?us-ascii?Q?bwRQqcxWAqyfAqAd3ooxfI/b3sMf1to+NZo7qlvIvNIPn43Quq/UGZUBx1KQ?=
 =?us-ascii?Q?sZ66t1nqEHo/UHKvmtHce+SeWuIyw7PX1nseo+SJWhp5aVUNlipRJSUac9x/?=
 =?us-ascii?Q?jA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TY0PR06MB5707DEB13FCB8F7A30528E25E2952TY0PR06MB5707apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5707.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ef1f02-8b7b-4b3a-95b5-08dcc738cdac
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 08:09:56.2420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lkBl97/IF5168KJtJM4F9QB4YL2QRA0xPVJASkEO7pRAJHoYkApt1+8ZmxXgZZqx53x0zXcV0ifCeSiuEanvtTsjSPj4xZyLo/4JTJXPolY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5526
X-Mailman-Approved-At: Thu, 29 Aug 2024 08:47:27 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY0PR06MB5707DEB13FCB8F7A30528E25E2952TY0PR06MB5707apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear OpenBMC org,

The next generation ASPEED BMC AST2700 will integrate a RISC-V MCU (BootMCU=
) as the first stage bootloader, and the firmware will be written with Zeph=
yr RTOS.
We'd like to seek your guidance on the best approach for this integration.
I am considering two options:


  1.  Using a prebuilt image:
This approach would use a prebuilt image in the build process, which is sim=
ple. However, I am concerned about the flexibility and customization option=
s that might be limited with this approach.


  1.  Adding the meta-zephyr layer:
This approach would involve adding meta-zephyr. I am considering using "git=
 subtree add meta-zephyr" to integrate it into OpenBMC.
https://git.yoctoproject.org/meta-zephyr/

Thanks,
Vince

************* Email Confidentiality Notice ********************

DISCLAIMER:
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing the contents. Thank you.

************* Email Confidentiality Notice ********************
????:
???(????)????????????????? ???????????????????????????, ???????????????????=
???????????!

DISCLAIMER:
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing the contents. Thank you.

--_000_TY0PR06MB5707DEB13FCB8F7A30528E25E2952TY0PR06MB5707apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:616907376;
	mso-list-template-ids:385535994;}
@list l0:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dear OpenBMC org,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The next generation ASPEED BMC =
AST2700 will integrate a RISC-V MCU (BootMCU) as the first stage bootloader=
, and the firmware will be written with Zephyr RTOS.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We'd like to seek your guidance=
 on the best approach for this integration.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am considering two options:<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo1"><b><span lang=3D"=
EN-US">Using a prebuilt image:</span></b><span lang=3D"EN-US">
<br>
This approach would use a prebuilt image in the build process, which is sim=
ple. However, I am concerned about the flexibility and customization option=
s that might be limited with this approach.<o:p></o:p></span></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span lang=3D"EN-US"><o=
:p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"1">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo1"><b><span lang=3D"=
EN-US">Adding the meta-zephyr layer:</span></b><span lang=3D"EN-US">
<br>
This approach would involve adding meta-zephyr. I am considering using &#82=
20;git subtree add meta-zephyr&#8221; to integrate it into OpenBMC.<o:p></o=
:p></span></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:12.0pt;text-indent:24.0pt"><spa=
n lang=3D"EN-US"><a href=3D"https://git.yoctoproject.org/meta-zephyr/">http=
s://git.yoctoproject.org/meta-zephyr/</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Vince<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">************* Email Confidentia=
lity Notice ********************<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DISCLAIMER:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This message (and any attachmen=
ts) may contain legally privileged and/or other confidential information. I=
f you have received it in error, please notify the sender by reply e-mail a=
nd immediately delete the e-mail and
 any attachments without copying or disclosing the contents. Thank you.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
************* Email Confidentiality Notice ********************<br>
&#20813;&#36012;&#32882;&#26126;:<br>
&#26412;&#20449;&#20214;(&#25110;&#20854;&#38468;&#20214;)&#21487;&#33021;&=
#21253;&#21547;&#27231;&#23494;&#36039;&#35338;&#65292;&#20006;&#21463;&#27=
861;&#24459;&#20445;&#35703;&#12290;&#22914; &#21488;&#31471;&#38750;&#2535=
1;&#23450;&#20043;&#25910;&#20214;&#32773;&#65292;&#35531;&#20197;&#38651;&=
#23376;&#37109;&#20214;&#36890;&#30693;&#26412;&#38651;&#23376;&#37109;&#20=
214;&#20043;&#30332;&#36865;&#32773;, &#20006;&#35531;&#31435;&#21363;&#210=
34;&#38500;&#26412;&#38651;&#23376;&#37109;&#20214;&#21450;&#20854;&#38468;=
&#20214;&#21644;&#37559;&#27584;&#25152;&#26377;&#35079;&#21360;&#20214;&#1=
2290;&#35613;&#35613;&#24744;&#30340;&#21512;&#20316;!<br>
<br>
DISCLAIMER:<br>
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing
 the contents. Thank you.
</body>
</html>

--_000_TY0PR06MB5707DEB13FCB8F7A30528E25E2952TY0PR06MB5707apcp_--
