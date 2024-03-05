Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CA8871172
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 01:10:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=A9pF4+r1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpbYq1jNnz3bmH
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 11:10:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=A9pF4+r1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::70d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2070d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpbY50R6cz301T;
	Tue,  5 Mar 2024 11:09:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBV3FVeNTI9Kp7vHz4J6vWzoCHO4F/Pm/sFoUK8g0po+K7MD673Ff3+cDoDnXQui4ZEtBXbBes0S/zYjKa+Hzw4wOHFLwR76z194zfTvR5YuqJLz5e7lX89JLsr+blem2mrRU7YHZlfV4CWTwnTSyWNkAQL+L11cTwXczERBmuagRoYV2HdRr9WKvHUX6uKElQ6yJhNv38jkCqcv/3zP77yi9f/uaGHBSF5iMkRkqej9y3vjnmPzNm10yuhrhLV1nTbq9gZcdJqEdPuzA+8VLYwbDSzxx44qXdPaGUnUFvYL4zpbh/wewsmm7r+MmrCbq8HrnzDI+5C7Kbj7Qn2IyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVcPwU/8OLeV5406ut0atXK52A94FnVD5VhYAV1SIUg=;
 b=hIQqQ63pCvLMW3jWiDw99KOkoZONhwf+IsAQ9ZQZxjHp43CufCUrWrI7lGGp6BjiAf9pdF56rDpPhzZ6JZs15vGvMSflQYVw429YKjcLFuKJB0U+Kt/Dcqdm9mKigsOINTpgO9ZFUqGCT6OSi67Rx6MSOtHjScD+HuqObJHAUp9A+sz3shsMbDrkB8ug3PG6khZ73vK8AR/p5eZG5NEgAfRHQYywZv8YugDCvVWyazPn0/ko68+RlZDAAAi2idN7ea/Q50vw+M+N9euXk7o+vRPGPfAvKL7l8Ke3Iu8Q8flTEiz0DIMM1nR5Znw17xInha1LeJz1zfdPlGzNFSJNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVcPwU/8OLeV5406ut0atXK52A94FnVD5VhYAV1SIUg=;
 b=A9pF4+r1n4G908CQkHkghwB3bR7/NDjzzeKetmNvVTsFT2ONtJqQXW6aktuI22zCF2s4vE160COgFi3BpKyaDvmR0zuDm1rGHHDHan4yLl/IAwk8FO82V2rJ7nToX8hsoz50oWl+a32XGpbW1qS0ZQKQO39tMAUFGID6WvNRROYjef1t8eSYL+9j9+BD+pFaAD/jn9UwWa/9MfDUz92TeUEzjm7U7ENGjxN5hTwyo691vbXHKWPpOG2PDQ53sGFBAaKqYbcTNSDugFv7/EzpMcfpcinjRhpFeyZQOHCtGw0zXm+GzdmML6N9OH8zCqkRCVVQ8jDB94CfCEYLcV+7JQ==
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12)
 by TYZPR06MB5179.apcprd06.prod.outlook.com (2603:1096:400:1f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 00:09:16 +0000
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::b1fd:b8e3:4dce:270b]) by TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::b1fd:b8e3:4dce:270b%5]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 00:09:16 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Thread-Topic: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Thread-Index:  AQHaYNBg0EEa3X7oHECRXZPcHJI3VbEVVFwAgAA4R6CAAIwtAIABM1cggBDfJICAADXcUA==
Date: Tue, 5 Mar 2024 00:09:16 +0000
Message-ID:  <TYZPR06MB6191E09E92A56D9B66EE86A0E1222@TYZPR06MB6191.apcprd06.prod.outlook.com>
References: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
 <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
 <TYZPR06MB61911F076C8719C6A7D57B97E1562@TYZPR06MB6191.apcprd06.prod.outlook.com>
 <v4nawwb4rwjiy2g7xv2sfyhc545mhk4izb3g22f7jupcevjuzb@nxmqgf2zjyqs>
 <TYZPR06MB61912715EE2869DDB7C3763DE1552@TYZPR06MB6191.apcprd06.prod.outlook.com>
 <ZeY1i9_liCIjqNYL@ninjato>
In-Reply-To: <ZeY1i9_liCIjqNYL@ninjato>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6191:EE_|TYZPR06MB5179:EE_
x-ms-office365-filtering-correlation-id: a6bca3f9-e124-4430-a92d-08dc3ca87eee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QV1XQroFCg4+P5lkolXzx09pX6SPIryZX+ryQu/t55PqZDoBuz4Nq2iVfwZmBl/IQtteLWXvEqmARP6NFvHJiDWPPNGlY/IBuF7Nd7VXHts3i/lRPeyvWh2mz7dmG6+jaHZtllpmpukNKKopXICtBBb/XAUUt04PLrhGK8bnAXVn/AHEkEI9qSBMDvAQSs10ME6ECmYqOqsEkSIoW9V73xDKgSAjGaZTEuvqOQ2LhdKns58J3dpksnd3rad9cxnNhtmKrnfHEkp76sbCxM8Sl/2GIAdr09AsyNj4OGi5piXMmCFPC/k35BlTz4Yhi4nXRrhlaVrNlqkRbEau4Zyx2vR9Fa7xKm3zh2VKFekTWKlvC2bDzzTlYjEKhXu5R4xm6Zv1gJFyt4hfe99yLI3X5qxhsWv8YqYabV79idNF98yRxAh3TNXQJgfmRi+AouCzgAEN8fheGKwyk4bXPy/Z7YZke/skqLMCwGygIZsI/KdHlxUubXhw+TPxzSyisn/1qQSO7T8YyqSePLgLXCLKauaHtoAIn/g1wJshlTlV3DbhrITONSc7zlG9XW1AGkr6ZH3x1MHWAC7EjiXBvE1280uRpFybQesxE06RL0Uic9AlQt9Gj2BOY+YVQMjQebRAReYa4njBRy20GAniVKAZ7kEfINRES9zOae4LN47FvnPM+wl6wOp6+2NtH2CrPleqML/kgZSU8ZGJii4mQg/0yQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6191.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?4L5SkOXrXBwecO3QD5HEyM1gfXnJaO7mYALAvlZpOFV/Nd3P5pKm2IZ8umTW?=
 =?us-ascii?Q?A2S5JGw6y50brXHrUwYsjIIJQtI3200MqxFLoPR4Te7DIJSGGLJgE6T7XyUP?=
 =?us-ascii?Q?yR+u5ZC4+ZAspA3QJUIdTdXJ3KjJpJv1MBWYCR7wV5H6UnK3PLT0IHVb8m2j?=
 =?us-ascii?Q?lbABgl/lPxNXJ5yoELvMwzYHF3f5/CroCSNzepteIG4GiXNE9onlZEp1Sz2c?=
 =?us-ascii?Q?l7zQB/p+fnRB7mj3Uka6M/qp17P517SlCcy2l95m/DKLxE33kcwSpKePsGnK?=
 =?us-ascii?Q?5Xr5J2MmczI8SMwf4foAuD3Cv6MggHLQ//6K4GuplczFP6wCdf6moImeYYt2?=
 =?us-ascii?Q?y/xi+3UpM5SMqujmoNg/oDcOR8hdhUhhGd5e1D0Ue+L7775kwkpKnYClNSPS?=
 =?us-ascii?Q?t8D3VTmSAMOawDXV3O0t9y0nphlV5olo2qo1SMrqm1Yd8Sb81hniW8ZcCJ7Y?=
 =?us-ascii?Q?7Bnau6xGe2BAwXWrP4rkSPnT7OK5yLwdswjRQ3xYnaPzGI+2GzRpla7m+P/4?=
 =?us-ascii?Q?yJuroWyPjCAN6vTBxRdSU2mN4dWfQQ2XQAb5mGrpc247vLSyHBN1Z+vmpJua?=
 =?us-ascii?Q?7ot0cwDEptHpZnHRpFOiLGLY0P6TbZZLFuOTF9opEq+7lAyq7euRRenhJV1+?=
 =?us-ascii?Q?I5IexSPTWbonJki77M/aO5idlCNceBCC1wYN+fs4UFTjlNBsaY1rbhs4Gakt?=
 =?us-ascii?Q?eZiyPGpATjvxOV83nlTosdz8TvYKfMztRo6zPD3ubU78NPdoSt0SbKkEWeZb?=
 =?us-ascii?Q?exbKWXgazZRCWIT3ZFUzApxlAKrqWubwI2DE19GdX3lFKtq/YdEHsYZBJvLY?=
 =?us-ascii?Q?16tMt5bN6IkIqnfTkwf4gNy9QbrCevfulMWJoB/2T4CAbydtb7dgwEAmWeWi?=
 =?us-ascii?Q?bTmqQoE4DzVhoR+fOT0M8mAWmTvB8DmdCcT7DtQMEqVII67V+cBK8NFc2E8b?=
 =?us-ascii?Q?tzeEuZXc2oTPByOO0V1Y+s3gd2MAvJeQs00OM4gx4cms2LCbJKjVaKfYOIVu?=
 =?us-ascii?Q?RfLE/rse9WIV6f7mVuh3+5zKhpQOWyuhh+hNcaiNcvXKe7abZptY03rKM7NS?=
 =?us-ascii?Q?mGHWLHZvEkP8sTJRpGMNa2gMTJkkKSOE/MieR78/Tbmnler4SFq3PkUgL+l3?=
 =?us-ascii?Q?rh2VwfMMtfXeGo2p/aEcQNpZAMQFV1kE1Be1bMbGOdXzwz4Hg2ia0CKiwJcL?=
 =?us-ascii?Q?8kPIp+WFxjXISXoDiCLtoPF/Os3h3dx/3yXexpJ2rK4p9DgNBp7ZvfpR2fKg?=
 =?us-ascii?Q?I48Q7zmzN4XJ7LZ9l1NZElEBa0gAoJiDB/yWMEp0GJSx5oehntKi5vbtkvaR?=
 =?us-ascii?Q?UXpLQfoYoHg1Oezlmn2GUCRQuP/pQAmYJX5EgGeIbYbW+mMBv8TkCD9QlEXd?=
 =?us-ascii?Q?onjKsIQryMQeczf8dkjEczzbOeS1RfG5so8e67RkPfmZsTqkoVHO3PS7//cO?=
 =?us-ascii?Q?gO5eFyMJpkz0WMT8qpT4swrMQEbLTs000mu7YWsVEEssdUqLpv5glALnAlf/?=
 =?us-ascii?Q?26v9Ke+Q5W5YE61Ao/P7ghOt/3DaVcwDW/U+H8i7b7R5jOrYhbgkwDX4Dy0b?=
 =?us-ascii?Q?lvFBrQILn27em2PKoetH/ArGDtf5R5e9DzeVDj2WHtXJKiKDocqA0B2/ulO2?=
 =?us-ascii?Q?kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6191.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bca3f9-e124-4430-a92d-08dc3ca87eee
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 00:09:16.1265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U2JaT7O7GFFVTRkS5IvagJTJAZWg2F9qNsUWVeZsAvqc/1wWW49hDDJ/X7A67coVUNal7iir2WBRiz6oGgr7NdQzPCXl4LPBBRVezRst5jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5179
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Andi Shyti <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

	Thanks for your comment.
	I will resend it again.

	BR,

	By Tommy

> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Tuesday, March 5, 2024 4:57 AM
> To: Tommy Huang <tommy_huang@aspeedtech.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>; brendan.higgins@linux.dev;
> p.zabel@pengutronix.de; linux-i2c@vger.kernel.org; openbmc@lists.ozlabs.o=
rg;
> benh@kernel.crashing.org; joel@jms.id.au; andrew@aj.id.au;
> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
> linux-kernel@vger.kernel.org; BMC-SW <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH] i2c: aspeed: Fix the dummy irq expected print
>=20
>=20
> > 	Sure~
> > 	Below is my re-word commit and fixes tag.
>=20
> Please resend the patch with the reworded commit and the fixes tag added.

