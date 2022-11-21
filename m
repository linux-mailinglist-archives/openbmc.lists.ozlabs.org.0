Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D790463326D
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 02:55:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGS5K5RCxz3cHF
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 12:55:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=4uoXyHLd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amperemail.onmicrosoft.com (client-ip=2a01:111:f400:fe59::716; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=thang@amperemail.onmicrosoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=4uoXyHLd;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20716.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG3HQ1NSkz2xmg
	for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2022 21:17:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV+czQ1o7XpVqkWqRnrAptb8J/+8D3zfNmyHpjoFkgTZ2T9iNDJ48fOsPdiB83mwecth40iB37UDpO8hz3ClyorW4WEOhaKztQZxnag9+hyunW3wmbDlQS29NDWsR8uGpAzt2XZtH5ri9/SA5X42g5XQkr6K7SfS3RKBe5LgzhASx+KD+vbDFdsOR8iZrZ+6W9HpR57CH6i8zLSw1VFblsQn/VQwrq8nbhV8b/myjVbGGMEHK4AZHYzeZ4C0CkYO8MQcUMhVC7eyzwCvXHyWIInvUSoSMmdeUSZONmmvycFWskvgw+t8gkGtshyjyz5SLT8yKAJDzGOjFGILYK4OQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/3C8Zmu2lmuiCI7vraBdjZtXdsbKROsFs5gym8l/NA=;
 b=gubDqJIceBynvPd2K0jIUPqMjSi1VZY39C5eOQaWGFxBGPaEl8oPolLcA/2cd/kcW+z/Y6aMhUIa2qAyxyJRQD4OG4uDzX/uzXe/VCppzS6rhbqX3u41iquw9/9HFUokdaCYcB0dXNUmmkUO5blY6rm+KqXfqrOdRTMC4lR8cDJTaQmsMBCyr55d18n+cdLVLIwMrOBKXhyV0d497x8TNu4cqnw6szQLJvIo0KTWjuwFMy2W+JM8acTz+0M6GnHf+e+rzR5iVzysD1PByspNFz46NrZ6w8fY7R2ihrgBj4mwQmeoVkBKIxpKU7DrKfQiI2dYd8yGRJlz5AqMFnoKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperemail.onmicrosoft.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/3C8Zmu2lmuiCI7vraBdjZtXdsbKROsFs5gym8l/NA=;
 b=4uoXyHLdJz1C1VgDugjE4V+ZL31DxySSNJmao3nwiSn/Q7Sfz769M1dma75AUvN88Evulr6iNk6a/boi9turoOPeuUiAlJAWJmkS3kOCDH9VKwtvX4NaVmoJkxvwrJ8rSQXikD6k8kYSJNNGn79C3HPxtcQFADtoDLytHk5xlDo=
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 CY1PR01MB1996.prod.exchangelabs.com (2a01:111:e400:c60e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.9; Mon, 21 Nov 2022 10:17:26 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::82c0:f6e9:d5f9:d3ec]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::82c0:f6e9:d5f9:d3ec%9]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 10:17:26 +0000
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Phong Vo
	<pvo@amperecomputing.com>, Phong Vo OS <phong@os.amperecomputing.com>
Subject: Potential high risk for readonly/operator users on BMC console access
Thread-Topic: Potential high risk for readonly/operator users on BMC console
 access
Thread-Index: AQHY/ZJ02G3GWPtXVEGoSHlEMsG5ZQ==
Date: Mon, 21 Nov 2022 10:17:26 +0000
Message-ID: <496697FB-7A80-4F2B-BC4A-8955016082CD@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR01MB7747:EE_|CY1PR01MB1996:EE_
x-ms-office365-filtering-correlation-id: 5e5e3d2a-a13a-4005-ab1d-08dacba996b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VDNdFGLHGmWZXCGC0o0CiPGbxwqga/IcF9braEykgIWxup82BlDtufK6AiDvG0pq7X+qGdDbv8VwA8ctCK+z6/lAZ5aU6ZCe+LwPA+p1WE9VVB9MIeBfeZU78JSZE6WP6oSAN7X38oSO1iBVRQdNJy27pFKe8++WLG/7aRd3nnBZRYu0o+kt9plgPPhIY7vbkwRodI5dQAVGK5Dw/UWDMFvCgkF+tuMzm9iL0VnPunXXIN3a9QBs3TmROhIfqAf1iAzAh8OMt5KEqmUCSRN6SCJVOcXwExKyQuPWNg141A4XTgCbr39cu3ySJcEDh/qdvfSp+DmyYI0ORccHKFnUsJRFxmV6Gon0Sbcgbvx9VwM7rVg297KzOC2bG+ApHqI4Amhx8F1sIJeFq2T4W/pTHC3DHXQTYmoEwp6afay3zNAOwcuSd6MfoVzlux4iHWx25fsj9NC+n2DdfAOfx8cYF44oPfHhcw+W/hFa/7qPRay5uZ4VtVMUyvHmXdwZjSlvBhtQV7xAs6REF5A+zc4xYDedMSmOHLGI5X48Jrc2EoP344Vmkowam+CIxngEdaHOWYUoZlUUDSaZvgpnbrfTNy7SoBGMkOB4swWmhfCTQc2LP4b3LQyYDOMMv7fcXKHr3kjQlUdfiWmZKz2o32m710OhjrmBtC1pDrdBSgeUsavP+jmIMCAVLpvDDWghUpfTBK+ZEGcWeI4jpwniq5wFGicwu119TXum2wZUU3K/BFo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(136003)(376002)(346002)(396003)(451199015)(91956017)(76116006)(66946007)(66476007)(5660300002)(41300700001)(8936002)(478600001)(2906002)(4326008)(66446008)(110136005)(316002)(64756008)(66556008)(8676002)(107886003)(33656002)(71200400001)(6512007)(6506007)(26005)(2616005)(186003)(83380400001)(38100700002)(86362001)(38070700005)(6486002)(122000001)(115813001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?vJ/03UWHDKDNjbFQ+vuLE2a0+zN5291z/QTtxxxQ1e8rCZa+w6x4azuw8LbA?=
 =?us-ascii?Q?dQSMdybD0YXwVb3L0wUNuO+50zDDiL39DZL7HpN/I1nbnjpD8hK9LrrY6b2w?=
 =?us-ascii?Q?qRjRPG+9avqZWgXp9QS2ZAsK63XLyxvp1oYc2YrMOk4qHoeUyQJQqOL0eGjl?=
 =?us-ascii?Q?JJ+aYhhOt5l2sx7etjR4itn48gIovEWbz9u8zFunSdqEt62Udr1OdIfSQeAM?=
 =?us-ascii?Q?UJtCkJ+3stoPeMakjpCcxFMYbMRTqPdXSWG+BU5tIFWpNC3Sk6W94+dyytpR?=
 =?us-ascii?Q?xdhFZBiywMD5+VehMNPYj3VcqVoeFtVk7BiYBSYAGSDM4buPxZQQtPgtU4Hj?=
 =?us-ascii?Q?eOl3PU8+Cx130nQYRJCU4IKav5+Tmxjw9kV6SmgsT+sKpJhh/Pk5UHUv1ZnV?=
 =?us-ascii?Q?7MhTWJRnEJY6r1d78bGfejv+/55KEgt6Te1f+CVJh+6pPKLl14d7rje3US2Z?=
 =?us-ascii?Q?tw7Ukxe+k2rN2MpvI5Nb8NAzfEqo/0lgEC9uTmdIjt4778iUgHbC2DgdsZYC?=
 =?us-ascii?Q?6e7b6p2oYsHUUmcEU98c/KKNb0a423NCsrmgi4nuSc0Wlp+tGk0V6gX/TGXe?=
 =?us-ascii?Q?1OCiNDSFfvH93JNzwEHsPTORxAfcD2T6tzKytchRng56Z6f9Qf3XoHUZfVhJ?=
 =?us-ascii?Q?DjOqoQ+KsxFS9mKz+ti1gkfVakSVpQPkjCi/rCU03ZIUlZQtuzF2Sqs4TUGU?=
 =?us-ascii?Q?cd/xvd9rdcKNyKQcze4I4gb4wUYk9rpMKRkKSuHEkCKD812w6xRXxKslG6Gz?=
 =?us-ascii?Q?GJeKrrHCTrB/rkB2CBJuDZ5N9nNbF/SrPrYV/ZVi+RhB+OKiI9/EIid8RJhs?=
 =?us-ascii?Q?yfSmXSZghBuyUfmCKLS6qQp7HBFfhtLIQSOFZ5ldfkUQ4592dFmL1FSiSw7W?=
 =?us-ascii?Q?gSysOr7ted6fQH5BE5RSiHUswj8SvQcK18LprdHvoeMAJ2i1f8mPZx/zKVqf?=
 =?us-ascii?Q?ZKUu2O7Py4bTd226UNe7nDYkYH0kxyAwQVwefc8qbWHJqQcY8B5HHQNatx0k?=
 =?us-ascii?Q?T7wl+fP6Yahq3DBlR8gmLSjpp1hIo+sY69VYJb49j1NLDkL398s3DkOLa/0f?=
 =?us-ascii?Q?AcFrBMAwcQ5+lvkfhHLczwCcYvm1yPPQGCpLLruC66Y15IbE1gMV6iS6TrwH?=
 =?us-ascii?Q?NqXz6nmPYXlIth44w3nE2o+FMvvjvyo+GDu4sGeIIPPpaAjOXPFMy4vIt2sN?=
 =?us-ascii?Q?orLSg0jekMRUB5r7HxNF+Bp1Q8CQENLuPHSBRy94/AypBIYPrXsWpF9hX9Jg?=
 =?us-ascii?Q?GuYNybDdpnKQBdvSd+0klKW+mZFWJtTRx9UETNK0X0XD8sHEY25xMtcQuq8N?=
 =?us-ascii?Q?dv6bR0x+luaeWkJfLmL3yH9AUr/QyASdC1E6AXNf2WPj4XrvZ0ZIpQt/f20u?=
 =?us-ascii?Q?7FxsUlO7TIggVFaaBqJL6gAubBTrrVIenHNQUZLSmQB9ZDRCkToRlWI/q+ET?=
 =?us-ascii?Q?rWLTsXqRngSq4QMB3ZQhPa82YjAZ7zltdoaCDoBLGyESGVnDo9r8NYPVmYaf?=
 =?us-ascii?Q?xeXeTcF6ez9QUvJyyfO1AdF7MGGEhzPUkIinxxqaDvR70BUZo5GOUAFakNYI?=
 =?us-ascii?Q?506RLnC+Y7RX9eUWLqLLSLk2dG4dlg4jk1Dl2ko21mCZ7SodKEpYWRiReIv5?=
 =?us-ascii?Q?XoZL0KL50F18GLb9nea7IQc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EFB0DA4E19D4E147A4E90ADE806E7A97@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5e3d2a-a13a-4005-ab1d-08dacba996b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 10:17:26.4252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bOhPPmb4esrrsnd3XzxOUZrkS2x4MJWiBklxSeOl1OE9KXawLzcpmZ/QymDl44huo7uq0Jr+YMCRJzv26AbylYOVebLjvy5pzCcXayXsQDoLzbOzbhUxrmk6YL0RPoLP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB1996
X-Mailman-Approved-At: Tue, 22 Nov 2022 12:55:05 +1100
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
Cc: Nga Nguyen <nga.nguyen@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,
I would like to have your comments on below issue which we think it is high=
 risk security issue which description below:

Any user (read-only, operator, administrator), when created, has BMC consol=
e access/login by default. He can login to BMC via BMC console and do the f=
ollowing actions:
 - Write to his /home/<user> folder to full. This will make the RootFS full=
 and no more operation can be done, unless do A/C power and reflash the BMC=
 from u-boot.
- Write to /tmp folder to full which will make many application fail to wor=
k.
It is good for administrator as he should have full privilege. However, for=
 readonly/operator users, he should not have console access. No matter if h=
e makes the BMC crashed by mistake or it is his intention, we should preven=
t his happens.
It is known that many production systems do not support BMC console but sti=
ll have some support and some companies allow remote access via KVM or cons=
ole server. I think we should disable shell login for normal users (readonl=
y and operator) by default.

Thanks,
Thang Q. Nguyen -=
