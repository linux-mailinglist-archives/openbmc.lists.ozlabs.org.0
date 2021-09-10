Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F03A40654C
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 03:39:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5JTF6vbqz2yPS
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 11:39:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=nK/u9Sr4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.111;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=nK/u9Sr4; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300111.outbound.protection.outlook.com [40.107.130.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5JSZ48Cbz2yNp;
 Fri, 10 Sep 2021 11:39:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpBTaB9O7m2U+V4magvgNAbnB4WnZ04bqXz1JsbGlOwlk/bOMHyoDvJTLu0x2JRrzOVfZExACpLsOstFbiQ1IMwst+997OomU2HDdbDtg7tEmfw7jt6A/WC5I4XRRFyWo3OqdS/snxi/IrUFm2XwGXj4feDBBefS8o7+3gzPTRo3PSJl/Ee2jAvNOhOG7nO9IlncvS8ez2NiqVTGgEVZliAqGBaVl8k795D+QU/8Ya+MLnU1kZZFUcR2S7flmqJ8T61R7ByARa6/E/tky6F08pm7QmmxCiEcvDLzZez2eWd6s64cLRNGESgUEpBXtuo4ugOOCv18QRVz5cbaLDK4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=OJ5UhXj4twMkluN7cIOzQ46DBkCj2/Iq8A1kaDcBzDI=;
 b=WRVZxd3fRJgz1sEvTwVozI5zf3Pb2pcPrifApBFCaMo55to343oRMFygD1umWcgJCQBiD40RQVSDZ0GeLdDClRxxRb39nqOGSGFQKAOg7UFy1x5a8E2hTbFyfpa1UqB3JoM4hY4BAX2TLNow0UymvUb3KmhxI3/TaUdRz+neioRbZ84qtDcVvZlVcjLxRcfrHTWLi9QLnMeytHTxt0ez0hOltFZ+CynjdIsQu6TOL/O+iqsop/TFdRIpcjNSwCpUsyVmXSFYkCAqXQbeuUglHHRDlEud+5LugSwli9ZutOXgebJy/DBTysC7DApiv8ebaa+djfeRQu/NgNo0puqhUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJ5UhXj4twMkluN7cIOzQ46DBkCj2/Iq8A1kaDcBzDI=;
 b=nK/u9Sr48oSePlnar/Ac24NYrTMaC+rn5FDco54DoQUMSna2WD5WDehJx4MdWqoOinFZjAkLfBWwbW81XOuIj1bGI40sXuSlcXotZwoZjYBzAdJS0MgauJ8xtdiZaScTFUFBsP1/ET1H6QCvtLVGma8Pt82HuTG3K6+z0K4+5cK3DyKfftr5RvsBQPWCE8P5KfpK73ArC8T8xkwRsP0qprIKrNMKzGBCvfe9k7OKXldZJhdxxwvQYf5GrjevS3QIjlJmvkdtdFKmsOkonDEIEvpvYTX1MPB89g9qUz/Al15jjL5URUG4RZDKiu1pBqDrqmzNCxuloEzifbfFvbwRTQ==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3553.apcprd06.prod.outlook.com (2603:1096:202:31::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 01:38:46 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4457.026; Fri, 10 Sep 2021
 01:38:45 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v3 1/3] dt-bindings: aspeed: Add UART routing controller
Thread-Topic: [PATCH v3 1/3] dt-bindings: aspeed: Add UART routing controller
Thread-Index: AQHXpWWkyhyvOPma00qLCHgaz2i9raubotKAgADZLHA=
Date: Fri, 10 Sep 2021 01:38:45 +0000
Message-ID: <HK0PR06MB3779990AF1A5BF5300DC9B0E91D69@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210909102907.32037-1-chiawei_wang@aspeedtech.com>
 <20210909102907.32037-2-chiawei_wang@aspeedtech.com>
 <1631190773.304300.200343.nullmailer@robh.at.kernel.org>
In-Reply-To: <1631190773.304300.200343.nullmailer@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2411d1b-d20e-4781-11c6-08d973fbbad9
x-ms-traffictypediagnostic: HK2PR06MB3553:
x-microsoft-antispam-prvs: <HK2PR06MB3553192BC7A74FE7032B2B6891D69@HK2PR06MB3553.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JLVZ5lMzVN7S0+N2ifT5Tjc7YqeGXIqerRWq0f+Wefg+50TZth5zR2sWrFcVISfIjyusUnUNP3tOg1sPZkoZiNGK7NnHjE6eigwEoJEjC1KTupYaJnyTw4par7lqJCq2IB27n+mSI4d2O03pMHSIPqalJsblj/VhH+Pj6Qk7WwcqoJjvSKsYUvcyN2vTOx4A3eHiCODrVMtDu4IKLR2FDY/CiK+75MxRejffn6zgi9HKKWhCDmS9OEjX4rEqIG6ZFEywT0pnfdEB3PKJWo1EWRAGwN0Wq6qx4i85JMXbxs/OHAxp529Mz7ZgF0iTxpzs2a22dcJ1ZXJnfr4gQ9obkfvPPUviDy6tX+OYexcnt0dKuaHy4jJ5kvupb3fZX1/gSKvIzuClq1GNYpgHv6QaAJjT8nkNVS4GWXXc1xvD2tvs7cYkSS9mD6Nvg60p0GAl1zrR6edy5ErwNkob1vVj72ICkF1ligup9JZ8r88H3BIdnrvouWs5drUkFGICPxnir71Jg0McTppOUcwrRFwxgG0zzGlWfR3q/Khu/+xBygG9AeaNiMHe+tJX7OF7i73wxGOgi8KQVRvhlByNqKbX+w0KCqh9IDvkJWfa9JFJSPzMj44CwtMZ2PZ1dfK0+c/M54mAkQKUEr4KvIOdDs+vMQunUTbHQsrEb1lyTkOJelU0mXpm37EgK3q9Dx3vm97oaYc86hnFLboGk93xYZLN/t7TSXxzqaMcIWr/sFzQQBAxEBL4nBkqQ4eModfEasdd/H6Y4GDCkRTE0q9jdVC67Agjg3iv62Oens0IvhycD+U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39840400004)(136003)(376002)(346002)(54906003)(52536014)(6506007)(66556008)(83380400001)(26005)(66476007)(64756008)(8676002)(66446008)(8936002)(186003)(7416002)(71200400001)(66946007)(76116006)(9686003)(38100700002)(122000001)(38070700005)(86362001)(33656002)(55016002)(7696005)(6916009)(478600001)(966005)(316002)(5660300002)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N2F2lC3RloQtoIo5KZQM43EDDq87WsdKKjvG23v7nAOCVI1R2US1jJhahfnD?=
 =?us-ascii?Q?4y8YMAkZTpaPSD0jn0zh0HOPY4R7JMqFjm4e7Ktd4uRFrtBAkqzBxvBBRjX/?=
 =?us-ascii?Q?KTtbI5AQEIDd5UYVdZFqXihNuVjVaOt1G5Vk9mibc5NmWg86DhzBXJbbak63?=
 =?us-ascii?Q?sQDC+didOJSD/w1/IjKKL+W+bc1BKgVThnduMmqmSh6JfSW0nGxr3N4GCo+B?=
 =?us-ascii?Q?zl7PP4/RzOgfhyT36fB4cMSxROQYwo0ewAa9FJ4DC5EXcWFGoeNiWD7jhqdM?=
 =?us-ascii?Q?PGUDKu/oXDXFMmmKED/T16kTJ2wTjvIcMsL8YppwxVuMxCgpSEVEd/w6OTWp?=
 =?us-ascii?Q?TA9Hytii+OQmtaAuWxPQeh0/y0O0l69GU9HN+4+9VFnSsAgCf1k61f5rMkXc?=
 =?us-ascii?Q?SCkQvvkN93fyB+AGdaQAXDz+VIV0gSPxDhMhmaP96kRueyMspE1GdOTGOjcO?=
 =?us-ascii?Q?76+mibuKMmXdUI75e9Zqi4HZM7H0mWrtKnsKo80Bu7/RxSJRYFnM1yPF1QUt?=
 =?us-ascii?Q?ZiFWxjnzkP9a6QcFCZCjECZX0vPsUnEdEmtRj2c2I6xtWAG0ZTCcjt2sKHzt?=
 =?us-ascii?Q?q58nrAGhvse+wCT7NYZIUmMzH3eVYM8Nzp0lxFFpZkCpwP9va6eS91pklaKj?=
 =?us-ascii?Q?EYDSzqm+eDO1yERxQ7a2NY83rsotXuisyOSkhDtju/P1quLCwBI4nJkGVu0r?=
 =?us-ascii?Q?p5oeUQxRRQSaHetNHe9XKKQ+7R//tBDmxSyg3tFL0SzBwWNuaoMSmYcTve6c?=
 =?us-ascii?Q?GIsMsZzoEQFjDaot71Oj9kzs5c0vvJ5LIVt4pXIEd2qJOsiyz/rm4Zm8z7n1?=
 =?us-ascii?Q?ydsjU5XjjBQWhs0xfkp1T+wLbDzFq7EGPbwgzfZTMPrSJwyf4qoSIZVOMqrB?=
 =?us-ascii?Q?xcQG4dKLbgA8qwV19CWlJlUYlaPvCVXTuNSQUJiDhSWKSHkQx5dbK4bCMEL/?=
 =?us-ascii?Q?1SBINsOWAEozdrpxW1UUHZWHEa1lxb+4r8O9qJ0QeHFotebK0w5VpRw3BT5A?=
 =?us-ascii?Q?/LkfiDC2JUo8rVqP90DYmCsytabDwLVT2AR2u9CD4IhjsIybGgNNv5ULp6ap?=
 =?us-ascii?Q?OLqmSxEOaJA4hRafWrSkyS08NLWLlriT77zhSjPcqlLIOYx+fb/2pjhFpydo?=
 =?us-ascii?Q?HuDUnUm8OUKN2ksa3cICzFXJhrT0ovaq6qoVXZpRSlU5wu73HbvIjaGg96Hm?=
 =?us-ascii?Q?rpw4IMTJWkNgnH0t8Hr0gnIzW+EfolTgBI7CFXK1HQa564nVQcKEB1Zf8Ryp?=
 =?us-ascii?Q?uzV0mXGDyW/wl2RpJnjl+oAZ/y9gGjVkpz5yVaMI3TwiT1swZ2BYH5S53jpn?=
 =?us-ascii?Q?OY4HcUeBZZOtCSO8i+n4Xmux?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2411d1b-d20e-4781-11c6-08d973fbbad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 01:38:45.5551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VR3gEucS5JN1QgJUcNVEDs18JQooOg7ztny+5jQWZ83m7SSD4obru4jNLManzHdyI3B0fZwdfjJ4vlNmNntXCEHNbIvYnZ+RkkRfEYb9Nt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3553
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "osk@google.com" <osk@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, September 9, 2021 8:33 PM
>=20
> On Thu, 09 Sep 2021 18:29:05 +0800, Chia-Wei Wang wrote:
> > Add dt-bindings for Aspeed UART routing controller.
> >
> > Signed-off-by: Oskar Senft <osk@google.com>
> > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  .../bindings/soc/aspeed/uart-routing.yaml     | 70
> +++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/soc/aspeed/uart-routing.example.dt.yaml=
:
> 0:0: /example-0/lpc@1e789000: failed to match any schema with compatible:
> ['aspeed,ast2600-lpc-v2', 'simple-mfd', 'syscon']

The "aspeed,ast2600-lpc-v2" compatible string is described in the .txt file=
 'aspeed-lpc.txt'.
Do we have to firstly convert the text file into YAML one to resolve this d=
ependency issue?

Regards,
Chiawei

>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/patch/1526149
>=20
> This check can fail if there are any dependencies. The base for a patch s=
eries is
> generally the most recent rc1.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above error=
(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit.

