Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F53F92A2
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 05:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwl7J3mz5z2ymg
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 13:09:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Udt1V+P5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.135;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=Udt1V+P5; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300135.outbound.protection.outlook.com [40.107.130.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gwl6J5ySRz2xnd;
 Fri, 27 Aug 2021 13:08:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUyUnKbdYweusmFJoP/LMCWm9yxui9DSADD/2ngV/+LCZv0VtHfToKDDZkBpqdstHoksbYTBxAGgq5ENy+b9g8xf0/qPVdqVVmU4OpjegK/5DjSafIByR6PvKd1fYgzbSY78v4FTaLCH6xsDn7FW448v2Pj2RsxT0N92kNB5zXBHMFyvsqF+UyMMvFU9XP1rPvdTMGWHZTMj53bsZNVUWQh4LSHZrzz9iio1Kf+IsDM9tzmJQOPpFRK9UUkOFBBemAWsNrbV/AGsBI0vXi/VT/dOfI1uu/59IVvvIBr9ekurePI+VFck4d9RjSJKVyzcyS+2MWFfc8dd/fHcziJWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqHXYjedbujd6o3p3s2LcHxOIVFSDnJmdrTXPigGWqE=;
 b=B8xu0F2QM/8QGX1WABVYdEf43LOtmrK0DJ5iS3vPP2+FhTYsL+o4t9gqJ0CAPAfQABQi1mzB1JyBjWcBOgWNNzwJBrf12eUiXcWjfDNyytRvqWEowPiCioWifwAdgEk/pzg3R+vpHqsosI1YvpQD18T/YaU+Oh1lWZ8e5O8WtD1RQ7fLIuGaiZQiTrik1tGO1qFbpExoMItMqgxuWx2eINuCWAzVUNLk3F2DMtatRiMfceZnYoa5FsXD2JvDQDgMVuHz/Hrqx71RgitoJhgwdNlYm8rJ/L9MiONOlXd8t7ob/iysKpMLD847mW+y/87+RRH6pd27K+/qz0X1wWAo8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqHXYjedbujd6o3p3s2LcHxOIVFSDnJmdrTXPigGWqE=;
 b=Udt1V+P5amB7g2u7BOT2oUHuD6At7vv/5LALFKhC0wlf5BZtBWLAw3q72zMhASgHPzu9fp7Ksb7dcIwhmQQDfqSwUQk5LCGxP4QBBBXjRgfGHceTmVEooccEGYNDkJ6rH3ISEmUUVRUoDk6+duVYpfhI+1I6U+87Zk6fIl8T76jH/n4uEhLVRlXsGBjqOrDcluNh7yLMXjc7+oNo00TZrkC4qcJvnk35fGVMDHJNXkf0Z8ZvE96om6haY6UHOa/MZUcItvL1lv74b8mY/9D+54LkviTSIOKuzynpoObXRgCATGaJiUslNmWGbP4ZbSFAvRUvz3ZguOLuxRTzxwUSOQ==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3554.apcprd06.prod.outlook.com (2603:1096:202:40::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Fri, 27 Aug
 2021 03:08:19 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4436.025; Fri, 27 Aug 2021
 03:08:19 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v3 1/4] dt-bindings: aspeed: Add eSPI controller
Thread-Topic: [PATCH v3 1/4] dt-bindings: aspeed: Add eSPI controller
Thread-Index: AQHXmkIdttmpXm7UpE2tjp2jWlnrTKuFx06AgADlQGA=
Date: Fri, 27 Aug 2021 03:08:19 +0000
Message-ID: <HK0PR06MB3779F7F75D24326E6F0DB23591C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210826061623.6352-1-chiawei_wang@aspeedtech.com>
 <20210826061623.6352-2-chiawei_wang@aspeedtech.com>
 <1629984361.334223.1033382.nullmailer@robh.at.kernel.org>
In-Reply-To: <1629984361.334223.1033382.nullmailer@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99353c3b-5609-494b-c194-08d96907ec09
x-ms-traffictypediagnostic: HK2PR06MB3554:
x-microsoft-antispam-prvs: <HK2PR06MB355400784E9F9846E7C2042D91C89@HK2PR06MB3554.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hgIg9WMl81Ftoxz0Tfbb9HQjuWdpt7ot5r9I7jtwd/K+DUn2WngHpIJer/GjOORNxxdJZZcGHtBXRwaFroao+hVfhX78MhLQjvOkozmTw9LnewaHLDBfMiZjtU1PvHu/UgBBBjUDZ5sDQeTTUbRS4NL8eYvXLsNWJiZd+IWdOoPjVOL1mpAEPY5kA/VJqpkJgQeYXrLZwSbo4TdZNQgcalPKtSBVjA7Vm2C1VBUwWrVkh8L2B2kCL/IK9D8XP9//RB2wABLanMilwuscrjJXLlgtp2KUO6FkrrCwjHEMi8ck8pHXSrz4oCNnNZEwKeX4Yt6q9d96jEdhzhC8TUpsEC2M7UNFkVUI5vfrdZaoXzZFedcveGcskg55V35jjGOs0jYkq4NYZynpt6A0IfPIMp5P0NEve7mUOCcHstBIWRISC+Bsp3v/pAFW2VCpkdngLE7Vbi6/CcBv60eaGfBS3+LwHxsFrkUoP01MtYUZMsrw1GYUsd95bg1rZvrfbenPlSU6lOLVYYAvGKAg/dfKN10/JDN4yY8Fs3i/iPa1WwxjYoxMLGwLOX4qxbcRlGjKcj+J4RT/NmXE8ORoA05/s/Ldj/nKSei3kvzj5ntaB8BETg1DKKl9/9GMXEpC8Q7o2hAUBO5T1aKOvyd6vnAyIWK8faR+8Q4MXRkwh0QBMw62AnkDcpSZpWNfb2C2qdC4h/MX0xBMROdj+Wbw+Ie0pmM4rg/SU2Q1lzyho3TlTDpEInT4fXewDUIBYO6R37kbYOieGhewNV9MjS0ZTSBNcw5LHYSLZQye99jfhNMZiCU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(136003)(396003)(39830400003)(83380400001)(4326008)(26005)(8936002)(86362001)(7696005)(55016002)(2906002)(6506007)(9686003)(6916009)(76116006)(478600001)(66556008)(66476007)(66946007)(966005)(66446008)(64756008)(5660300002)(71200400001)(316002)(38070700005)(33656002)(38100700002)(54906003)(52536014)(8676002)(122000001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tspzspcT+keZkB/C3wd+xiUhDpVASTXz05/MWKkCvLAIqZ7UroxBXfSOE1eB?=
 =?us-ascii?Q?3ouNqsQdGiRRNc5WPU/aW0cvnXeGiMvtQw/FGrtd5bcP0A9IR+PV9yo+ql0Q?=
 =?us-ascii?Q?AyYWtzTH2kjYR1HsbETc8m1swXFpIp1Mv3Kaxiftw9F3N/qKvGe6cvWdAwsd?=
 =?us-ascii?Q?6mUq20VKkeKp8ApR+Y8LhMPEfTkRWCDabLopYnJQhcEW79cSqQZnHCSRGW4z?=
 =?us-ascii?Q?3J7vqBMFE8b5c1Puq1Jjw3uOiFLkkpX1XIIttKuDcF22jmjFaXT/tFPyej2/?=
 =?us-ascii?Q?GZESvZRdUHFao58l9/Pn5Fr7totZOmcz3ZSvK/NkOyaB8Hwx40jNAdXVFw4t?=
 =?us-ascii?Q?TVAepcpFM/7wJYImBYib9ZQAIorujiKMAsmDrAZXAWIzUqfzEiQCB7SihCE6?=
 =?us-ascii?Q?y430bQZ4ZxYs6DisUzFh2j1D/XIjgyGK6bP+fAPyUamsXKiNT+eWB7TCip9F?=
 =?us-ascii?Q?ztjpf8Vb1vbXeGAQ61SY/t2MF2StbQ8rIzzTqs6GW4hiXqy0vLg8Yz9nOk1m?=
 =?us-ascii?Q?gb8Coen6eVvuMNDjtCJSFbmZ057sR6/kuOqOMBi2umiMZqyqOqiBBPqPIDfl?=
 =?us-ascii?Q?bo9p+qZgutWodYILRdTf2Il44TGzBTu926NiKxua+6AJrDAdUCQytjpUWujG?=
 =?us-ascii?Q?ch/ym0aCVCqyvbaNOPwjTHwGf4qMWD6ipCwWeQAx67/D5a09QqvAPJUR83V1?=
 =?us-ascii?Q?W3uRNnjpOTFQnBGWJjaYshSW9ZNesk6Jf+PoCywfQMJWgBfBfo7p9QAXFKb0?=
 =?us-ascii?Q?mj2L1zlzr3WAO/NBexWVkxujeAhfPO+Me7RzWMkOPPsUKiRdCnerZomCWqNB?=
 =?us-ascii?Q?bm1izL3O9kSokm6yGt7kxCYby6E0JEP7tlwIcLyC3oaoQDUUeqAfCEdg0vc2?=
 =?us-ascii?Q?mFl/Uf2247hMtqds0ob84MBcPGj3MfkJIpsA2SY7CgrUOulLD0aqNS9xcKkH?=
 =?us-ascii?Q?H1oKmamdIGjgT1B3i/x0+TJcEK6WXIec4hYBMJuY5hZpj/SQLXUq1bd5Su/u?=
 =?us-ascii?Q?xf575x06hXUw+glRe+Rg1NDIbwrDyekxNWS6Xb1322cleF0gnbkbf6W7nqLc?=
 =?us-ascii?Q?TqOL9b7Tl4TQcAEELptIv+CpNOjJHhUDvqvH9NzWcBMLZtcwDiWE2CsQ40n6?=
 =?us-ascii?Q?sNWZJkzl/mroO4aLpFq5E7JNGobzdMdIIjCvR3w66+FgTSwcdumUhnmjP1M9?=
 =?us-ascii?Q?YvDR6FzrPhOQUm4old4kubMMz/d9gKo0FbqKNmgw30D8PgJA1RhQ0cCi8pEo?=
 =?us-ascii?Q?M+R/0BVETVC/SWht1R2a4cCcAC9FIBERZ59ywBY1gISSZbeF6WBoLKxMgbff?=
 =?us-ascii?Q?Ovhc4zh/Li9Tc0TUFaIJHXBv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99353c3b-5609-494b-c194-08d96907ec09
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 03:08:19.4955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XxLgH44MPXHles6L0mPme1CFVYHYRKQ8DZlftl/4LZhqFhd8BgWxDl6ltXzO+e4P3WK/spTXm71zOsTuoHqPGkVKPMy2aPFI78ol8DUBkBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3554
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, August 26, 2021 9:26 PM
>=20
> On Thu, 26 Aug 2021 14:16:20 +0800, Chia-Wei Wang wrote:
> > Add dt-bindings for Aspeed eSPI controller
> >
> > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/soc/aspeed/espi.yaml  | 157
> > ++++++++++++++++++
> >  1 file changed, 157 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/=
as
> peed/espi.example.dt.yaml: espi@1e6ee000: 'espi-ctrl@0', 'espi-mmbi@800'
> do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/=
as
> peed/espi.yaml
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/patch/1520968
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

The warning has been fixed by using patternProperties to define the espi-ct=
rl and the espi-mmbi child nodes.
The updated version will be submitted soon. Thanks.

Chiawei
