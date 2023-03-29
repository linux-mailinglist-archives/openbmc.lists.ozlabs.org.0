Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 186796CCF34
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 03:07:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmT1h6VsHz3cdX
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 12:07:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=pjn0Cuv3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::702; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=pjn0Cuv3;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20702.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmT0y6lr2z3cG1;
	Wed, 29 Mar 2023 12:07:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCipD4x5+g+d9+qlimD4oe7s6QtMsTj71+435S6Td53mTsT5au2tlB9CFH1GauaJweSNZdAxcynpOqI3DG/aV8u3kFPFZt/y9GGSQxIIXT1zmQLVENHK0XJwoPnjLJAE8M6NtO3ZXZNlBVkQqfXP1Nyp42Xh7HL7i7ZGCfJVwLYHAF2TltvekwKcHYIgciLoYEyZ6MNSKhw6QvQVpoo64sBVmCe7dBl63kWj+XFoJV8BF9bz5RL4Qd6tGQZ6o3DCFfngzYN33fcYltS5hatS3nu6o1nc7NwEicx2aX6/rmaRUUIjzrYiWwUxgIyj27oh/29EHHscbSXQdKn3kLIweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rq3BBtpzeLOZsTdZyGs+W21sXnJD5rlQC+njWIPH1qM=;
 b=FrsQybN2LxvK82NuDTJC5QBRxPyBE0jLL/XUS+RdIJYIdmMtbbugMRN7b/mgAfB41jbJ0A8Awcf9zzg5r9S43lZ2Ue32/CG5lV6ka7ZFDXPPlfbRYeJr3H1ePz2vA/QR4TCRrPv8PmNobqHIe6zT2Ef5r7JLvgpcregyPLbg9E8cCERuB6K4YiZ5hScMDRoS1dGmQTySGSWJyiKgBagGrqJ+8Yd2TNAifyNcANBSjzc7x9d6ie66jeBgES9SI7FvIZNhZEucLPLutqamPmh2VyDC4GrkMXxbH+lBaZKijuXrGn/b+mWmr/7IAKU2HdHHMRyuCQaG0VCYlMS6h1QaSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rq3BBtpzeLOZsTdZyGs+W21sXnJD5rlQC+njWIPH1qM=;
 b=pjn0Cuv3wySeoPKlb4bgK0L1RYdZlwryMGKFeaiibr/BdZ+ZzV0R8PPtP+1bH27D7f3QGCXIj7X81Iwv6j5WfGvzuGteZq9+MGAxqR/wl5LAgraOswkQdYeRMayIq5RkajFfsvRUEory62si1iFe38h+QESstKgGcZT1W/YBsPPF53HfcIPaKc/iuSERhbNZAxH/e1k7Ws2Ga2YV5JPG3Jit26hR0R9Uyb0ews7m6pkXnu4SImsfegCqFmdleKmL9l7a0vIsbpB6BYvdegpTAydtTlt7g/huu3GlPIct01zdsudz07DGe21/hQQI1NwxtTwbTJUDqpQZ9Sek0N0B6Q==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4376.apcprd06.prod.outlook.com (2603:1096:301:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 01:06:49 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 01:06:49 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH v7 2/2] i2c: aspeed: support ast2600 i2c new register mode
 driver
Thread-Topic: [PATCH v7 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index: AQHZYI4UsjVcqSJbI0ySmwJZKivAsa8QLL2AgADGxGA=
Date: Wed, 29 Mar 2023 01:06:48 +0000
Message-ID:  <SEZPR06MB52695C237BE0BDD4B5B2BC14F2899@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230327092524.3916389-1-ryan_chen@aspeedtech.com>
 <20230327092524.3916389-3-ryan_chen@aspeedtech.com>
 <20230328131219.khfd2jz3z4es5bzy@intel.intel>
In-Reply-To: <20230328131219.khfd2jz3z4es5bzy@intel.intel>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|PSAPR06MB4376:EE_
x-ms-office365-filtering-correlation-id: 15f52457-faf3-4084-9354-08db2ff1dfbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6slkgtAuDubVDNNVsvYPMIj0hM8Y66ABMraOThAa4tcIXtLvDqCkNYhiNgMYa/HN4xaqEQjHL4JTGaE1P0JY0ceUWQUHxbUd63ezImly7+R7gFMQdGxX7zKnb+PgXoqiY8Kb9jQg4QGVfhHdFVzh8LT4JUsJI4EmSrNk7ly3W+m06tEH1h6Jv4QAgwV4Hn52slbhgLpiMpgs2wcMi5oKWxhQLATHy5G5z6utIi25IarC99MbXAb8Q1NCjoeVm9yoJXx1u/A8iuxBOiYQzUUD21V8knfxSwwcqw7IiYGsJFphnvJO+j9LZwO4CTS/EaTIMjSJWZY6Ra9Y42Y1B7sS6hXmnCcwFUgle6Fd7AAbIaR2DsfdDH8C1b8Pi9qPjvooqpLpVKVgUZ3AfiiF+rHMC0+np92gGON23sYFA7RikQlgJZFypPL19RxP6LrjkRp1gYZZijiht7V6IrgOmgdxIeCjie04IsKfJEU/V0rkvOL4t/NyjMN86/ogtJmtVO+fyFi1CwHkkdkOn7/YJvEIwp4dr8QqEZJ2pZzEwpeZIH/ieeHWxFp6vP8A5h/ZtHhXgGoKXSlp088xCm4eYQZo3X6McizEYgzCu1MQ/thos6I7mrgttW14KDMu9I6m2IlM
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(39840400004)(366004)(451199021)(2906002)(83380400001)(5660300002)(71200400001)(7416002)(8936002)(41300700001)(52536014)(54906003)(66446008)(64756008)(66556008)(66476007)(4326008)(6916009)(8676002)(316002)(55016003)(478600001)(33656002)(66946007)(76116006)(7696005)(86362001)(186003)(122000001)(53546011)(6506007)(9686003)(26005)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?k9Yez9kWaptO1DM0CSw+dcfFmn2vOHC9VB+9YsRQhoL5TAp+re5APowG/0Jo?=
 =?us-ascii?Q?V/Ysi5lt6jZ5OvlrhESscAfjcNsHMunQsDOsrc4udwIXDClA/vdr7l9g3aL/?=
 =?us-ascii?Q?46ThsbT/+DP/ZkuayEnJySRYDHcidrJYT8JsIqIlohgqLskKrdUNTv6hSxOg?=
 =?us-ascii?Q?BX+9WL7+MpB2HhOLpWkDtuXVzD+ng6URN/o4oyP0ax5+gneGZh1oWnbdb44Z?=
 =?us-ascii?Q?FCxarG0AigExGW9DEZ1SlVMV1Qba16jO7GCCsT7b7NbjrMXWx9YzAiYPwKok?=
 =?us-ascii?Q?W2rC91J7fHkzNCi0CtlHqPtfzVcyVYr5cEXjh1SoClZT/UOrFMWdssD4DV6J?=
 =?us-ascii?Q?+mOa3hCF/aFI+cW3Uj04fHQpgkEqYxE9LiUogiuMrSEhaxredjxXJgpF8Fbd?=
 =?us-ascii?Q?BBXUYcjY/H8fZDX/46wH7R960B1FASUHS7vDUVv5YznFTPcpumtzhhXJ6rp+?=
 =?us-ascii?Q?ME4dAqx/aN68JWYHh/jsmIoJhRIkVzv/BR3+CSih9sMmECG993N0Se3938cL?=
 =?us-ascii?Q?IuJmJfinWspmI/YgFFrq0+qWl/UFXOa5C+W9l11xZjOREAgb8a2UnDjp4qij?=
 =?us-ascii?Q?86PWcMdxKluWFaewZL/onKdK8cSz2tv5wYVaRwxUTXu7njfZenaHFQesD8YG?=
 =?us-ascii?Q?uCRs555D5mFe3zE+haiA/1xWyEq4tf65O++O1yIFuv9xQRfdabOg0HKEgoQ8?=
 =?us-ascii?Q?Llvi+EmyAlVQDUWC3OeotjE9teH6Meno5KzCuedjSErKEHyGwEPq3tyeu7e5?=
 =?us-ascii?Q?8lRtn8MGA/8RFiSny8X7opRYCbREywv+dHpqLl68f1d0M9Wjv2Yht2xYzWzv?=
 =?us-ascii?Q?E+eQHP7I49p3neAppRzWajQMhTY9UvvHSV6/Y2GlzIX3g+uVhVQRSVL5GEy8?=
 =?us-ascii?Q?+IDb5iWj0duFlNZFhlJNq48nIsdUAQetRr39ON+bEAKNeROoOvxFEYGG4ePy?=
 =?us-ascii?Q?81/m0DHCwgAAlPBhjaXM6KHYMyGewpACje6m7bhKFNCoAxodQume0ZVv+Q4R?=
 =?us-ascii?Q?Nih746txLf4uvTmK1J7WBEwWTxcTgXQbeLmQfExI12OED0p+4hImmA2rDhEz?=
 =?us-ascii?Q?84s9DfoiofWD9giPuVjMnNNB3IbUVl/X7CKC9dIsY7S23Jl9m7DMdcoLwXN2?=
 =?us-ascii?Q?gHDStbv36pYA6jO23WTF7eUMxR92L3FKddBMYj1xQMygOgBNKLKO44N2olL1?=
 =?us-ascii?Q?YghOXDdF9L5GA1G4iumKFbRfGlEo9kZ7Y99jQlOil7xSujcUzwLBijPkxtiP?=
 =?us-ascii?Q?njBu3F2B/efpou9NzGOQiZ6r+frrxXaLKW/nUjB4nJ4uCm/6QXiWOpVCrGZQ?=
 =?us-ascii?Q?iCou9ayiHbNw5ZnwbiYE9j9GLCptlhAUVfuuhNocDNNWy9lq5bu6a7xe26Xd?=
 =?us-ascii?Q?eKWg5JUrSYPur8sEhsGu++RYv4cqPdAR35l5kINzo99hKCcyCmUsY8/jeHLO?=
 =?us-ascii?Q?xMnLgQNxFY+Ro+CPh1iKUeNWRAGyJvsYG9wB2YJxJfoD3FXNYHHnnIo+Ivou?=
 =?us-ascii?Q?AuYYQ02vrbhRrLg+SWXdtioHPAaBWv20/xUnt9EH+Wcscn3osVoU6iNuT5IU?=
 =?us-ascii?Q?7edpB4XB/EetDCMsJyS2vam/dAHrs9rPyCBnTlmL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f52457-faf3-4084-9354-08db2ff1dfbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 01:06:49.0175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJxwIO1pyJNOyxVqpoIm1SC+l3IuiKkOs12sBDzFYcFBfYj2rP/gXEgaedPLW80ctsvcxuQBRjWCBcvtHvEvBgRMkSXTXBKPz3NleYXKhWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4376
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Andi,

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, March 28, 2023 9:12 PM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: jk@codeconstruct.com.au; openbmc@lists.ozlabs.org;
> linux-arm-kernel@lists.infradead.org; linux-i2c@vger.kernel.org; Rob Herr=
ing
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andre=
w
> Jeffery <andrew@aj.id.au>; Linus Walleij <linus.walleij@linaro.org>;
> linux-aspeed@lists.ozlabs.org
> Subject: Re: [PATCH v7 2/2] i2c: aspeed: support ast2600 i2c new register=
 mode
> driver
>=20
> Hi Ryan,
>=20
> [...]
>=20
> > +	ret =3D of_property_read_u32(dev->of_node,
> > +							"i2c-scl-clk-low-timeout-us",
> > +							&i2c_bus->timeout);
>=20
> in your v6 patch this was a boolean value. If you need to keep it boolean=
 you
> have the "i2c-scl-has-clk-low-timeout".

Thank your remind, I will keep " i2c-scl-clk-low-timeout-us", if property i=
s empty, will disable it.
If not, will enable the timeout. It is ok for me.

>=20
> > +	if (ret < 0) {
> > +		i2c_bus->timeout =3D 0;
> > +	} else {
> > +		/* i2c timeout counter: use base clk4 1Mhz
> > +		 * per unit: 1/(1000/4096) =3D 4096us
> > +		 */
> > +		i2c_bus->timeout /=3D 4096;
> > +	}
>=20
> Can you please run checkpatch.pl before sending the patch?
>=20
> [...]
>=20
> > +	dev_info(dev, "%s [%d]: adapter [%d khz] mode [%d]\n",
> > +		 dev->of_node->name, i2c_bus->adap.nr, i2c_bus->bus_frequency /
> 1000,
> > +		 i2c_bus->mode);
> > +
> > +	return 0;
> > +
> > +	return ret;
>=20
> can you also please do some cleanups before sending the patch?
Sorry, will update these two. And send next patch.

Best Regards,
Ryan.
