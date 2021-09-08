Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 486FD4033A3
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 07:07:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H499x1Vyhz2yJp
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 15:07:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=rDwS2dxD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.125;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=rDwS2dxD; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320125.outbound.protection.outlook.com [40.107.132.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H499K2vggz2xjR;
 Wed,  8 Sep 2021 15:06:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7jk/PaeLfkBfCtCUCCoK9o2IMkyWqYpCDHaJWPErzC7sWIxcVkQEtUHxAqSFKsbe4C2Hej3IvCQ8/nBVPb9YYnHX652IHnXHJJJt679TyghS5sZq2ZzKLwenM7WdFzjrsKYwjOzfWySgtGhu6UzzIJkSDApQn39bAlsvEOTxNy9A2xykzgieFqdChvjzFKWXauvN6LnGfW5o9tFaJJHca82253Z7X3dS7Q/u3B+WGEATB75KlXQAkav3iYY4cB1N3aFroAFK54M5+rr9Dt4X8EeMeP5dtYeLt95yoan+K8HIFs1VqsGgmbkMP6y+Sok9HRlxcJCf0LUgGUz34GlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=EeEuEZtRuz7bO5bMyrKjau3kDPrTaPnz3jkc1ni+g8M=;
 b=hgUqqumuFXZkv+IJgok87RXroHWzfr+Dfee+pkgb6l1BCDJnYpJbZzEUY6rMIHE2hDYhfIk/r443yu1tlvBx5jCxvFqHBwPoXzugDqXy4tFD17A6UXDwbpJYqbXivgqGuzCu8tb+ZNxAXDqxj6nkIGR68nYoS83zfleEOsrp3Q2Js9XN2J08xUMgnkg2nWXRGDEKh1lJfuLiyx5HqOLUycMSSfmo+phaCfC0gSw0gAPD2i7wnlFy/ENrWybFI0u0SrF/rgMwHA2e595vSCbrm13KaWts0lhKiV+aK2fVfJUb7lTX5PKKtTfMDi/HMQhIougg5pbAJWeyOF/Vxwkh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeEuEZtRuz7bO5bMyrKjau3kDPrTaPnz3jkc1ni+g8M=;
 b=rDwS2dxDBKHthge1P28YHKVvohsZYzYr2kWcKMG2R3jHt7KBfbaPI1bBpD66efDa+/juc6TdeBR8gYEkm4JyBQ5ONMuaNH6QxraO0fReIx6UOr97nnU3nlIuWbQ2OGxZQ91/pJRppd75ODFPK3JLOkGYwsiVCuyjAv6Bc4gJbTIIUzNHjcd5RLGz/plI2y92PhR+pchyHRRQ9A5vK0rM3wrgrXQ0Kwl8kRNAxF48yoV0X9B96ajMfO7G3fwknWM5TMwmy/rkWb0HhIpchEFQyn+ujpisXr2dXQlGZWtezLwcmS7ru0WmaUvpNvHNPz3wvkrZfdwR8FgBo1A9B5mGVw==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3252.apcprd06.prod.outlook.com (2603:1096:202:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Wed, 8 Sep
 2021 05:06:36 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4457.026; Wed, 8 Sep 2021
 05:06:36 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: aspeed-lpc: Add UART routing
 compatible string
Thread-Topic: [PATCH v2 1/3] dt-bindings: aspeed-lpc: Add UART routing
 compatible string
Thread-Index: AQHXn6EXTrG9luH4/kKvLz7wmMPMC6uY8jOAgACs7OA=
Date: Wed, 8 Sep 2021 05:06:35 +0000
Message-ID: <HK0PR06MB3779D0B44F9F927A48F017EA91D49@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
 <20210902021817.17506-2-chiawei_wang@aspeedtech.com>
 <YTezn1TDatYs2FMd@robh.at.kernel.org>
In-Reply-To: <YTezn1TDatYs2FMd@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d1e49ef-7ae3-4636-2251-08d972866f40
x-ms-traffictypediagnostic: HK2PR06MB3252:
x-microsoft-antispam-prvs: <HK2PR06MB3252C4345EFE7CC165A6A03491D49@HK2PR06MB3252.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eFHqghmgwCPOoVzRKOXs+QZYh4QTJZ7f+8OFoKsFoLYvd8dv13tC1u/Ih+2wVKh+x93PejhQ3dkvDKdiRUlYYmKChYI+2z7YYTtD3ah3w/kKSwquq2QjdcpMBMuM9iu9URMp9uu1oWCcRGQu+AdH+jKvoiKGgCygiTGJMawOyC6+RfDoO71r8OX8SbyAiiAE8xMp7yzdwuYnc1hiceifUi4aMKLrbQE202QzDtJgNybDCAV6LebWvDymevM73qw+ldqzlgNj9Ns00/4DkVaIYFMl0bpzPGBDa9T+9Doq+f4K9gFwHSqp1KNYl+iH/YkQ2lJ75tnPwPojiFEZqEuvqbreOl9QEQEQriMQfYehN/oMGtjfrEkBwa9Wd4jX7CC2U+/LJyiZgPmeAkMse3Pv1MGdyuqltE3mAqIODGQqlZUJsxVt+SPeb95rt49xub5+tim/J0mn5Npae18SDm5SR/9C5wJP7wr+/fBrfdl8F9dgPIH4fDr/xI2uuozLrpH3QPIhhiFo1bXX9XKUeOW4/EdVR26igfSpeKXZRiKeXgbnR/hF1859wIURXkQquWTHJ2NT1ssnd9kdfp7Am1Q3NdOl2R1ROJnTyMRtpXDYE1xelX0gl46PLBIccmiZhUTU3aZ2QKguHbMbSGhG/KBydIH/L0kVYvb5IQYRvt4lSBCoa2LHiFm89SdpiqCGEelvve6DDsqkr+4HW9XaoOsVmg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(396003)(346002)(376002)(39840400004)(5660300002)(6916009)(52536014)(66476007)(66946007)(66556008)(64756008)(6506007)(8676002)(38070700005)(55016002)(26005)(316002)(8936002)(186003)(66446008)(71200400001)(7416002)(2906002)(76116006)(4326008)(478600001)(33656002)(86362001)(54906003)(38100700002)(7696005)(9686003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wbxngiiFHNi0493tS5LOCSIWF0OQvSHMyEffa8Vg555StJGxsT9LVgq3O/gT?=
 =?us-ascii?Q?Vf6YSF44YSF6yGpe6HsR9UyUdK6/LdBEjbId972kN5aR22UcaSYpqmIh0ai/?=
 =?us-ascii?Q?oI2NZapiiz+j5dBTAM/2zL1AW6paE1ccpglZqKM8pjp94l8GyJ4qJh1Jh1av?=
 =?us-ascii?Q?IsoKE5Q4nYFdmiwa/TB7FH8h99NG4aYlwhi3/7suzV5x07t7Lti63EjQok4b?=
 =?us-ascii?Q?i1AEu3/bIFKEtEg5ZOjM6RRmvfvIWYEld0zaJ+pBa3IxPgmjNvmRekfFnEXr?=
 =?us-ascii?Q?VsaXlcD/xk2sSAbx9JwImx9EHlMuQiwF7RYlPa8NM2DKi0pUhi9EFuBwnqzY?=
 =?us-ascii?Q?L1sAWc7oIvu7F/rH8E9fqaIOW3bVRVSTSZdDDFxgcW9NfGxDhoH5ujQWwRMa?=
 =?us-ascii?Q?Jz2Eoe2j/Bc9s4Q1kxaB9RI6wQTvgz70mIARUpmkuIQci+HT/FSl19rFK+w5?=
 =?us-ascii?Q?WMBS7zm/7LCQqTMGdO7bZwT4Ds4L5qg9hqwne/B8v3Pu0gORc/4WcJrFiCz3?=
 =?us-ascii?Q?YGSSyxvIIFBd2TtECbx6Z4TwrzWhIHrroQNuru5IiTdlLNnHSQRyvqVlMDYz?=
 =?us-ascii?Q?u5zZDYwknMG8T1SWleFquYebAnAwoPx8d29lUCyu4S4N9iUJ14ZuwBLljbaP?=
 =?us-ascii?Q?NmDFOEYbvg7MekRlPaKqNy9US85a7BFezduC7OYGkMDTPDEhGesGuI0/txEY?=
 =?us-ascii?Q?3NS6peICUe5cAOExozrZ7h6DCqMH3ipOHyl6aTB6DLJYISyZI0kAilmS5FV3?=
 =?us-ascii?Q?qPQGnmpiaKfxyJRpx6urq92MT6Sq4yofBvHzc/A1+VSeCYQybroxvZFWNE+c?=
 =?us-ascii?Q?S4Q2uZpjHlSMfCHoXwYK7X41okLtzBjpe24NvN7fVVezLSnvIuR7qkKREX2s?=
 =?us-ascii?Q?M+NjedbFybhEG4brPI9IEZ7+S68wCHhdh88+35df7BTwskX+9umONSoTs4rY?=
 =?us-ascii?Q?/HIftw/ztGb3sKUNjevv9y6RmYZKygG2Had3JD10LfV5+9DFnJbUjFvOH9Fd?=
 =?us-ascii?Q?a+9idaigkYo5W38vT3G/QhR6WaaLT/FcE5lyLm8tn+XtabE4dXAr7eeCw2+i?=
 =?us-ascii?Q?Lr3vjZaOKVqh8uHPKMIi+lZNejz//gDHEs8N585X40QyU1xJdsA0P528fFw4?=
 =?us-ascii?Q?cEBlb2p63rmSefBeRWh8ESAQh8ZBs3iZyyv//B8xeHrrUE1oYJBtYGJQ1mnV?=
 =?us-ascii?Q?/JjQOAbD97j2wbdaJAYQI1VZdR8nUFVAPPN8QMVCxKDbyjIShCPeAGdwAL1n?=
 =?us-ascii?Q?v0x/YsrQjfho/8dCeNVBfIq3Mnj7nMRXqZPf7SuMGa7zFT3jt8RoC7bbWMqy?=
 =?us-ascii?Q?L4Ak3c2knKHNK+saY/lL8cCr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1e49ef-7ae3-4636-2251-08d972866f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 05:06:36.4355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/8xUaMoBZVk0q4kifuz58bd+MkzAXxvOm1Xdd/4agWezfFuAOdUJ9+Z/xcekspmyTJrIqS0YKD+/vL3JWF65QHPUdvCK5INFTZmqs4K0bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3252
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
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "osk@google.com" <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, September 8, 2021 2:47 AM
>=20
> On Thu, Sep 02, 2021 at 10:18:14AM +0800, Chia-Wei Wang wrote:
> > Add the compatible string and the device tree description for the
> > Aspeed AST25xx/AST26xx UART routing control.
> >
> > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
>=20
> Either convert aspeed-lpc.txt to DT schema or make this a separate schema
> doc.

I will send a v3 patch with a separate schema included. Thanks.

Chiawei

>=20
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > index 936aa108eab4..45d44f812e5e 100644
> > --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > @@ -155,3 +155,25 @@ lpc_reset: reset-controller@98 {
> >          reg =3D <0x98 0x4>;
> >          #reset-cells =3D <1>;
> >  };
> > +
> > +UART routing control
> > +--------------------
> > +
> > +The UART routing control manages the RX muxes among the UART
> > +controllers and the I/O pins. This is typicall used for the
> > +Serial-Over-Lan (SOL) service.
> > +
> > +Required properties:
> > +
> > + - compatible:		One of:
> > +			"aspeed,ast2500-uart-routing";
> > +			"aspeed,ast2600-uart-routing";
> > +
> > + - reg:			offset and length of the IP in the LPC memory region
> > +
> > +Example:
> > +
> > +uart_routing: uart-routing@98 {
> > +	compatible =3D "aspeed,ast2600-uart-routing";
> > +	reg =3D <0x98 0x8>;
> > +};
> > --
> > 2.17.1
> >
> >
