Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 905507E7BF
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 04:15:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4609jW6tvmzDqhH
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 12:15:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=vertiv.com
 (client-ip=40.107.73.49; helo=nam05-dm3-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.b="L1cNqxUy"; 
 dkim-atps=neutral
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730049.outbound.protection.outlook.com [40.107.73.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4609hs5DJhzDqcJ
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 12:14:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LASsO+GrITIi/xvNstpXRiRcHFXz/t138YczOGO3UX4T+Vgz1QKY86v9hEdVDzen2k6UaWxB438+74TV9gY4Kk6ClDhtl0TtU4/rGMDZlYXSXeiuxNsiVhLq0Z9i6MN1QxgoYY1HTm1IOHpLrsO0vi46v+Ynz0s0YTF9C0x4JT3QQvP14R/w05jogrGF2LZGW3lDQl6aG2+iAC4dYSRWP8nOMwBirRHxli31lUq5w30rgQ5MsFD2pah7t3hh9SMUwU3hwQgcjmju3x4YD23a8Ejf+gZUiOTbC0EvI/hqwyZtIFW/9Mf8TSPDOcAqX8eprcUsz2zPaCR883/07I/5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5z2xe6xhIPMaNo9UxCXki8M+vvh8zOMpEk5gF8GbwY=;
 b=RTwDJbg+Q2Xj3LznlDe7qmqOcWjgT+uL/vO2DYBmIJvsIFmaNQhciF6Z4V6hFCVUVxp9zrdqs4CNEZ7HtE0NAFONhDGdAMd0tR4DxAV1THEchb8FD8sedCWa4d7Fa9V7WSBPHOqDGNcBJI75dk7vEkd02f5o4nu+rD2sW9HJS4mLs6zjnIEhk2S9nXEVfNnEdrkTgngvS7JDjhRg6gN4ZCMM+xPo41w5HNdHm8DH66pKqx3xLClVAEEvf0qwKp7PBZMzES+HKJ0KkOEfvY8kewOBNDuV4WaYevYkXumfGWMA5YS7CII5p+wLvjyf0LLVnfneT5+U7u4CTdVCPnQPWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5z2xe6xhIPMaNo9UxCXki8M+vvh8zOMpEk5gF8GbwY=;
 b=L1cNqxUyvy+suSq/lVNGIHZ/Ztgd9oDQ3iHPSjTbLv5FPpgn52uK+hSGMdCLJCRbdCD3UmgiX6HfgohwmOAVaZSsbIvaVo2osj592v+uHxTeeJ2XPv3TfTxmy35bp5mc0JPd6PnV/b3pIdPScCylMDqgoVRxaJD4E58FELD/N4I=
Received: from MWHPR13MB1360.namprd13.prod.outlook.com (10.173.120.8) by
 MWHPR13MB1309.namprd13.prod.outlook.com (10.173.123.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.8; Fri, 2 Aug 2019 02:14:27 +0000
Received: from MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8]) by MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8%6]) with mapi id 15.20.2157.001; Fri, 2 Aug 2019
 02:14:27 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Signed CCLA from Vertiv
Thread-Topic: Signed CCLA from Vertiv
Thread-Index: AdVI1QWAN3LhRCTKR7+J3UF7per7Qg==
Date: Fri, 2 Aug 2019 02:14:27 +0000
Message-ID: <MWHPR13MB1360C410A284A04C167D7397EDD90@MWHPR13MB1360.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f7800c4-3db9-4aa1-48a7-08d716ef2549
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR13MB1309; 
x-ms-traffictypediagnostic: MWHPR13MB1309:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR13MB1309367442E6F63EBE605848EDD90@MWHPR13MB1309.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(346002)(376002)(136003)(396003)(189003)(199004)(13464003)(86362001)(6436002)(8936002)(316002)(7696005)(7736002)(9686003)(8676002)(71200400001)(25786009)(3480700005)(99286004)(110136005)(66066001)(71190400001)(305945005)(102836004)(5024004)(6246003)(256004)(6116002)(3846002)(55016002)(74316002)(186003)(2906002)(14444005)(6506007)(26005)(229853002)(76116006)(66946007)(66476007)(14454004)(66446008)(53936002)(64756008)(66556008)(52536014)(53546011)(33656002)(5660300002)(476003)(68736007)(486006)(4326008)(478600001)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR13MB1309;
 H:MWHPR13MB1360.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e9cl1FEAZIMytRTfQKUPKkeeFSp6qEA8cQ6Ribfmh9FkEdxfMbsa61WmdPRCmig0uiH45UecV2gntaBXNexo5DLSPa2pIEQk77u0HWteIgcGXg7q/HxOuY/Qu/vSMlc/FJ9C266qcrPFEwP7uX8jrMRrZi1Wbb0/alG6PyW6S3GPL45qKfL9Y16/Sxb3txypjLs+ZZimByfrJajRiISQymCKDUuRtEl1IJ4hn6I/C9pr1AgPuxrcKhr3UbmP4Dr0na6VmTXZYv5jFC7E0166YgR8lZRau+b2EJR/Ss3JTZwfD4EIBH/jd1XmgnZ2BWZxx5XFzq3NQyiQQ5kxVlLI8Ih6zVnZLB3C2aARtLZILa8fJek8snMAmynJ9523dOhwyAONOUxxD+Bcm5vsW9y0T2ZAQq0lVJGhjuasHJUgcw4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7800c4-3db9-4aa1-48a7-08d716ef2549
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 02:14:27.2170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M0st9+TxD1qFVRLFVy1Q3JpLxPgOHLJh3IswOZ21eUmrZAi6SGTJ1ZfmhxXeuIa77hF7QYviKXp3uoP7Tz9WiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB1309
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
Cc: krtaylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

This is a friendly reminder.
Please let us know if there is any of information missing.


Thanks,
Troy Lee

-----Original Message-----
From: openbmc <openbmc-bounces+troy.lee=3Dvertiv.com@lists.ozlabs.org> On B=
ehalf Of Troy.Lee@vertiv.com
Sent: Sunday, July 21, 2019 3:18 PM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [ExternalEmail] Signed CCLA from Vertiv

Greetings,

This is Troy Lee from Vertiv.
Please find signed CCLA from Vertiv/Avocent attached.
Please help to accept it.

Thanks,
Troy Lee
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail in error, any review, use, dissemination,=
 distribution, or copying of the e-mail is strictly prohibited. Please noti=
fy the sender immediately by return e-mail and delete all copies from your =
system.
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail in error, any review, use, dissemination,=
 distribution, or copying of the e-mail is strictly prohibited. Please noti=
fy the sender immediately by return e-mail and delete all copies from your =
system.
