Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5959A41A5B8
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 04:51:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJPCs1c4cz2yPK
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 12:51:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=SsfgDfZJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.130;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=SsfgDfZJ; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300130.outbound.protection.outlook.com [40.107.130.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJPCB4VFnz2yK3;
 Tue, 28 Sep 2021 12:50:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOgA+je9HPZ9lraa4lsQNW4oGvckzJ+tW8hAZXp5tK/hkJmcmf4Bp30Du4h/Zch8Aib9pX4sjzRlmFPFYPeHIfqZD5rKPGY1nb5qCwKBf8VpH8M2i6nRjpLK4BLcIAYEdCZj+Mx6X3Hw/DeyE79AoXewWTP6v0O1rv3hjuRW+LBxWwVnlP9PDe+2B2WrcoD+h7zrVnVKrQCU4WRs71XebXmzE3Z6Q7lvffoBZP7HykJ/z7IKFVzJJAARbzhJHzK22K23CEY5kSgdsh/0+n9jfQKgKvTNIL+mV4MjETi0wBPuV+RNFwH1/3HHzcQBKeCsCBvW9GjArnBOhezdeyu+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nt9nJPtAW87cx4NoeAh+n+Xzd4EbEbfhwZw+wTMJtas=;
 b=hnSbg5icP0aFO1T+QFBSxF1t0JnI5KgRZXzcBUvQCC6bwSGYUrLokgmY4BWa7pjLn1xpd8vBUHVKvFsGMToOOJMUdlDALW8108xsLFfcf5buNeG8XhutJobb393wDSjxcRzU1aEdSPV/qPcbfcojAdZSUu+RMAULeDWszK9OILgWoFIONd/D8HioIJx+SgJVO7/50uA11FzXeyIZ02DVAy84DnF1Lio9YuoWzdBBjejyBuFDtk3RDI4FhiEs6JFkgHkftiGyhmTjMBvJ8X/i1ZMn4ciGKTgK3MN+Cfk9TR1ZWDCwhofmcpsZfP5VtSnI7TKEyRZ4TrJ0SuBh4j9q0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nt9nJPtAW87cx4NoeAh+n+Xzd4EbEbfhwZw+wTMJtas=;
 b=SsfgDfZJNLevdrmF1uFtYoY3Cb/urQQSUTcctUxipNGNK3Vex6M5Pp7/1SJ8OuWGCPmaFFaQTUyfZqk8WBDdgPMDMI5T3DeRc2nLr7XnJIZQx2NcglgIF3NR1enSxLIaBfLsoqwCp9yg7Ww3Ckgzue6cWUsRQyBpTjtYxk8OSkJW85TbYTc+L+wzgVCudxVucwXPeJUPvXoou+omccWmtvv5BejAjLnqFUbU2ZST9CirR+6TOAQTPVx53Hw8cnmsNmhtrSXzlpFkL4BMM0FlNZT80sStb8R/db61SJ01tzKTvjFVEPyAO/8P1uDuZ7VHInKkZeYim+Gzgyj6IT4PUw==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by HK2PR0601MB1939.apcprd06.prod.outlook.com (2603:1096:202:c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 02:50:40 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ddf1:e9d4:c209:8ab8]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ddf1:e9d4:c209:8ab8%7]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 02:50:39 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 09/10] dt-bindings: mmc: aspeed: Add max-tap-delay property
Thread-Topic: [PATCH 09/10] dt-bindings: mmc: aspeed: Add max-tap-delay
 property
Thread-Index: AQHXs884IJ6cSk0Am0C3nRyKGkRXxqu4vtZg
Date: Tue, 28 Sep 2021 02:50:39 +0000
Message-ID: <HK0PR06MB2786A27B0A4C7D1D10415E90B2A89@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-10-chin-ting_kuo@aspeedtech.com>
 <YVIQNPbbnhIqTSuu@robh.at.kernel.org>
In-Reply-To: <YVIQNPbbnhIqTSuu@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be189964-2363-41cb-2831-08d9822ac19a
x-ms-traffictypediagnostic: HK2PR0601MB1939:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB1939CFB17101B50C7EB5EEDEB2A89@HK2PR0601MB1939.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2fdwzS4IZPfiwmImOwCg2MAU18QPxBiaEfU9kV1lGIzWT5PteL43H6Q59hFFxxDhuMD9qsZT+EV60fblHZxdl8b+lCOYBnWkh2nKK2ieVXar/PAjvpnlDdDPe2KejAaLlmCtoaYdr7nRBnEX1oLe9xq7HQLQGoyCPaxr5R7uu9uWD5aH1/GVYY6nrqOno8DL4x3HOKWCG/eHJiEndHEddysHa7CjXN1jSiMsOvzbRS+5GnEwNh70X3BWzbCaAhskgQDI3M9v9U9ADoGmXs1Sxryv/4KKsZXSWBC74X1ohPKnFn9X2SChlTzg7pmBG39AuGmKeIpRpTme79f2wp/81eSNji5akovIziczHiVdmqqwJ+GxZfJR/YgnfDZd1GrPrhqw+cqGz/pMpNqcB8pEePkD+KNTbKzAzNpF0hVGY1PXA9dT/UQkC93vf7L7PTJsbOwUD0WOpT9F+9niF11OPpZIHEKUu5xXB7Ou8sm9xTyfO4kb8kBWCyWa57+ZbDQS3gdPQUshtN3HLZdS08dirMCTLrFZdCP++d8TEyfoeXzgPL2eeW0dBMpUa8hUhS8RkDmJpYi71hkrTQsqhZJg1SxGsUZZSJBoeVrcLBbOXgKZY8qnIWHjRtBFCVcEVTpJ8LJE3NBobnFCP1Udhrf03hOUZ+6UeG+40O70nzyvAkiYlqgUfoyDSpzCbdBE0dqZJRvJrneMFkynzOVLnsjoqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39850400004)(376002)(136003)(366004)(396003)(53546011)(26005)(66946007)(83380400001)(186003)(316002)(76116006)(8676002)(33656002)(71200400001)(7696005)(5660300002)(4326008)(38070700005)(122000001)(66556008)(66446008)(64756008)(66476007)(6506007)(8936002)(6916009)(52536014)(7416002)(107886003)(55016002)(86362001)(9686003)(2906002)(508600001)(38100700002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BKVWTbbLMes6PVJAK/5QC9px1Rb1b3d7iLzLLsBM/DvjdJrgUdojHvMTO4g4?=
 =?us-ascii?Q?Ul/sxjgYjMg5uiAyBNqLlZzmSAyS/Re9w5KxYHFdO54LUA9kQGfYXF8B5r7X?=
 =?us-ascii?Q?LRncOAwlCc9LfElkUnIM+Q/14k1GREeQ5dqsq3fbJ6omcVjmGu5DB4YT9JOa?=
 =?us-ascii?Q?KlrXuN2DF0kt0cjG9mHW7B/wQb8RvOi4YWbYMU9KKO6GMdf1AQDLvfp1fWqz?=
 =?us-ascii?Q?Jfmobbk3x3lJjb5FcFkYCN4lnBolwGB4YpmaitJ07swAlcK5973yal4nY6jK?=
 =?us-ascii?Q?26thwMZupMCEv/QEbjabgdiNSqluLzSAv7Y8DNVibg5G00E6xq8QEacoGWrs?=
 =?us-ascii?Q?MdvRX/7Aqi1UEvqduIJl38+7q6Z7Aa0jTmwhHGNzcJ1irQOj48UT3yHVmIx9?=
 =?us-ascii?Q?ZHXgMNBAURMBgZtr54B857jAGXMr55Cyqj4akaY90bxv7eteZSLJ1j4T0N6q?=
 =?us-ascii?Q?vc5l4CoXIzStF8cWKinKsKpxGTIacIoARGr4YJxCyABBP256FENNJwD9Jdl5?=
 =?us-ascii?Q?oGuOTOubbkvjBblA5jlREt5zU6S6U0lnYAgrS/eJFJKt86//v77StUttXyt1?=
 =?us-ascii?Q?RfuexNkjr6k3WKkha8iHCNOn+CHmc5+4EmqSeK/+TPgQCG/MnUz+wv3KLcyl?=
 =?us-ascii?Q?9vnaCt60dnjUftfMa6Q3KcClJMpnzsCC1UaNOWA8ha22FeRmj6h71IW+dcJD?=
 =?us-ascii?Q?aSefEEZWlHjkUpW2ZIiOsbrwG6XmRf9CE8YYaDBURlDtsPt4LMfgdfsp60wl?=
 =?us-ascii?Q?SCG9Dimcrl82FdD0B7fduEsrPsIKGy+gQhbE5ehlm1MibWkIo4I6qAdGwZxo?=
 =?us-ascii?Q?LoK14FinJLpIjHd4GOQBDmeJjWZml7SO3Zl3p5UV8s0SKb4f2FhB/YirruMe?=
 =?us-ascii?Q?tL6CkpwJRu43kmDNli/WFwXUhXFjfB/4s4J5qsqEgwzYjhap/Iu0Pr0711iK?=
 =?us-ascii?Q?Fl55P0tWT4cPB9IIEOqHx60hB0aEbQ6H+t4CsZk+nDKehvTSvR1mWBSlfCvf?=
 =?us-ascii?Q?mYfWYNrqYOzxlpBb8qjKreWz3usRtla/BNlqhrFVFnuTJSLm5kAHSRkfnVMu?=
 =?us-ascii?Q?Fhx54ElvIhi93GH69bz2BjQV5Y9MQ8IsiJCYMyeV8201XQ25V4zvzKv9cdRW?=
 =?us-ascii?Q?6XdRpHRaltOiCQxWMbLmT/2cE3AbeuYlzRLwVMPHgaonTBgGZG0qe3oaNgm2?=
 =?us-ascii?Q?FIHmx/MIiZXHfbucuWwFOsZM4hkVvWoowgewKnmjrn0i3bCa6dTlcRK36ce7?=
 =?us-ascii?Q?jTYaMoBXLhFcd5sFNDYE9+VViXi/7mXieYp9n4tSGGsXiuZytAfzfYnxfMn+?=
 =?us-ascii?Q?XZMwgOFcap1htdEniJhQEkM5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be189964-2363-41cb-2831-08d9822ac19a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 02:50:39.6249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4MvCSygapLrdu0Djf46WEnBKsFhfxCVvoQs72OCvXJm8FqrLKwepa6YlsfMFq/PGNa/FPDz4a7Y0POWnn18eo+QCjld0H2XEV3XXhLK5Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1939
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
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for your review.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, September 28, 2021 2:41 AM
> To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Subject: Re: [PATCH 09/10] dt-bindings: mmc: aspeed: Add max-tap-delay
> property
>=20
> On Wed, Sep 22, 2021 at 06:31:15PM +0800, Chin-Ting Kuo wrote:
> > Add max-tap-delay proptery in order to record the maximum tap delay on
> > different platforms.
> >
> > Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > index 987b287f3bff..5bb66849df65 100644
> > --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > @@ -37,6 +37,9 @@ properties:
> >    clocks:
> >      maxItems: 1
> >      description: The SD/SDIO controller clock gate
> > +  max-tap-delay:
> > +    maxItems: 1
>=20
> An array?

No, it is an "int" value and this will be fixed in the next patch version.

> > +    description: The maximum delay in picosecond for SD/SDIO
> > + controller
>=20
> Properties with a unit should have a standard unit suffix.
>=20
> Should be common property? If not, needs a vendor prefix.

Okay, a vender prefix and an unit suffix will be add in the next patch vers=
ion.

>=20
> >
> >  patternProperties:
> >    "^sdhci@[0-9a-f]+$":
> > --
> > 2.17.1
> >
> >
