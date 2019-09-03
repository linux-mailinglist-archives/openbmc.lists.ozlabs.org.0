Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59CA6413
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2019 10:35:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N0dd6HSSzDqQM
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2019 18:35:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.58; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ctcchien@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="i+Are8u3"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320058.outbound.protection.outlook.com [40.107.132.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N0cn2kqzzDqB4
 for <openbmc@lists.ozlabs.org>; Tue,  3 Sep 2019 18:34:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqU0qX4iorMVv56tLC/OjPXrYgEvbXXFBtynia6XnZvcPd0yOugw0dwOm+vnGMSIblQ5Zphk+PeYOfV41G8BiS4yEI74oeLfErW3aSyuUaEZ8HXMstyPRd9Y54RD9IhNPPyJy5X6Aba7NIIFuKUra3Lizo675Evp0vKDUFpyzKaWBFdm5x9e1sVu1UC+/56eg84LCtutoCpdxJM94AGWDtNbAR5xhATxRMAZbN3hdCT2pXCLIV3fr6YH9qLigFssrI4bvcusRI6sEvZCTX0ZeNHrXxt4iCiQeqL73nWwFQy1Bo6THaDSuZhRB1wUW/mPXcWLnXKD6sz6IOlm6lMsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTwCxoTh56i8xDFiIRQyTvcN9mHGr+oUwD496jpOXrk=;
 b=QPjT1yD9lovNz2yuVuI2EF5Zywgr1/Pg0fqeguu18/CppheNBLV4MjDSeeXj3gKlKm4wLap7yD6Bw+0F4zs8jDy+lF7fHYA/vC8k8OvxD79Ttehi6qCCr8nJcDrnjJLPw8SFrOI7oopZE004e5r/393/wioweMwY4pxzva+uFF4fARifd14ppe6T9iATb/CBQ8uglNncGXNZEax96o/0fMnezHu0jJnHyX2vcTzYNal7v8k2OxtuyTA90roDIHYIzApJj6e6YH/WlIvc0ZrlhP/6xTLCmg/O+xrOsqrGTqgCWhvFCpvC//1WIUy8r7v/M8vTnTwoAw1z2eqfr7Snlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTwCxoTh56i8xDFiIRQyTvcN9mHGr+oUwD496jpOXrk=;
 b=i+Are8u3HoG5PRr+NMcurSxwbIlluWUv+feRnHHq3TYgHI7jv5FkcIU3ZuTzqWrSnzKLWEzeHccRoesZSvXa2/UyKl2YaC59L9lj9ya9daRtigqZMNs3InNkKO3Y8GNpZJJFT4iUf/l27jN5BxnPrDa36pvDPZgP7GDZIFt4MSg=
Received: from HK0PR03MB5123.apcprd03.prod.outlook.com (52.132.237.76) by
 HK0PR03MB4148.apcprd03.prod.outlook.com (20.177.167.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.5; Tue, 3 Sep 2019 08:34:41 +0000
Received: from HK0PR03MB5123.apcprd03.prod.outlook.com
 ([fe80::4cec:74fb:671:5050]) by HK0PR03MB5123.apcprd03.prod.outlook.com
 ([fe80::4cec:74fb:671:5050%7]) with mapi id 15.20.2241.012; Tue, 3 Sep 2019
 08:34:41 +0000
From: CS20 CTCchien <CTCCHIEN@nuvoton.com>
To: Patrick Venture <venture@google.com>, CS20 KWLiu <KWLIU@nuvoton.com>,
 Benjamin Fair <benjaminfair@google.com>
Subject: =?iso-2022-jp?B?GyRCMnNaQBsoQjogcGhvc3Bob3ItaXBtaS1mbGFzaDogQSBwcm9ibGVt?=
 =?iso-2022-jp?B?IGluIEJNQyBGVyB1cGRhdGUgb3ZlciBMUEM=?=
Thread-Topic: phosphor-ipmi-flash: A problem in BMC FW update over LPC
Thread-Index: AQHVYjJtV+qQLtHN5UmQiYITnttx3w==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Tue, 3 Sep 2019 08:34:40 +0000
Message-ID: <HK0PR03MB5123490BEC19882216BC206BDFB90@HK0PR03MB5123.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CTCCHIEN@nuvoton.com; 
x-originating-ip: [60.250.194.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 883e769c-b3c1-4e1f-8837-08d73049908c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HK0PR03MB4148; 
x-ms-traffictypediagnostic: HK0PR03MB4148:|HK0PR03MB4148:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB41486DB4EA022B6F68CF98A5DFB90@HK0PR03MB4148.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(366004)(39850400004)(396003)(199004)(189003)(2906002)(74316002)(316002)(25786009)(476003)(99286004)(66946007)(52536014)(486006)(256004)(14444005)(110136005)(7696005)(33656002)(71200400001)(71190400001)(66446008)(64756008)(66556008)(66476007)(305945005)(8936002)(224303003)(7736002)(76116006)(66066001)(5660300002)(53936002)(4326008)(81166006)(81156014)(55016002)(6506007)(9686003)(15650500001)(14454004)(6436002)(186003)(26005)(4744005)(6116002)(478600001)(3846002)(102836004)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB4148;
 H:HK0PR03MB5123.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UxJtGrbIpO+LViVVx/yhfH972ifvfqNEs6K8OrWw/1C2TBZWgx167ZpaOm2COTDndGHQ9uGMAwOwd5DiQXqjehpWkQa/S1eQIkOT9B6uxVQKemaRJN5l2mr4WDYAYE8VRYSDvUPsHEYinuIy6rEBg1jPlGpWkKC3Yj46hE8NdXCHafuRxXlQDc4aZWOQuuESz7FTM80C/FOiVtGty2olAtaUqE+GjovxB0u5dO59kCTpatdNmeVoH0hXsPSOBtqpl8LUsbbFVeqwJNtAmJofF7IUNos6lJKSRqyduaAgnttmL+IEKo1YLWEkc55Wkw8xlLnGZfS5BgmxiYhVIyPmCzUwV+NIkIYlV9gHmQPJPHmM7U+rsHVIYeUdlbJ6NPA1gG7fYHfrDjBBXQSEQxMPjfCLYjPnOyhQy3IVORuwoxY=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883e769c-b3c1-4e1f-8837-08d73049908c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 08:34:41.0200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZ1N1EckQ7WVRc9vcFZA78dPwBkIuNkiMLYuPCkpTryre1Oz6HgUksmqIAugKcsjqvR6r7lXj5TOZ8rtFwV+OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4148
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

CS20 CTCchien =1B$B4uK>2sZ@GgIuM97o=1B(B [phosphor-ipmi-flash: A problem in=
 BMC FW update over LPC]=1B$B!#=1B(B
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
