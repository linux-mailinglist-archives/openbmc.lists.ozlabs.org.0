Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B4D475218
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 06:31:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDP4c13QTz308h
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 16:31:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=etE5+otV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::715;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=etE5+otV; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::715])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDP43408gz2ync
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 16:31:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQi/ywUTSmhJNX9ez7i7SLVmJU8EUW3c30T3IkbajANaVqqmK0bFTjVf3ObsXTD+klebYucljB+KIfS5OvE3REld4nm9BYQka8H78irmoeK7WHyy56WUifC1iKt+mr5bY5OhZBZ6TMauGoZznZrlrSTO1CveVtUQt1QTPEeSh5MVtOTYqJ8cBVNcEeIClgLjOMWXTt4gyQLwKXLOf249fF8CPC64FExtKhNzOeTVYYmX0qhj9FIcB6/2fVPt/vOxMV+/1bjr34iN8gX+wgXVZZOK+M1x4707+isWiU/vmT/b/bWwiNEcu48PaYeL9R5h4YeGvUZzWmP0W4cpRm11og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alBDMUBkDO0/uvD2vTV/ZYneZcoyEHL9DHciOtsXja4=;
 b=PYJ9UXsRFz5bpWI1vTvBCHVdCGa19dUIL2z0vilzoj3L6N3+H051qGpKVq8ZrwHM7PVO6Lf3fB/3Udj2s5S3oIuLfKmeo4zHfeVleb+O2nltUEuA/bZ2aEHkl6fhnacQQsDFR+wuPVqLa792ujxGeZBomg41HZmAc2xfI7b4WcoKnlK9JWY3InBOQFmrxQJWD12myJwnl83Y7KZ2LCBmouWEWJwb6K7HMzpn/6picttHJq1QijPjsrP+PusYSYsqoWuS+CBwPggxKB3tlqNFx1onwO/936HxNEx5So2j3VnW8iTVj7/8Z8d4t6voxXnqBgzJFyHPOTRjbk3kYlZDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alBDMUBkDO0/uvD2vTV/ZYneZcoyEHL9DHciOtsXja4=;
 b=etE5+otVpfWi1zNibJrza2/YlJQE9iewO/lFVN2AktzYKZlek+qR8IjgMOSlwHR4/YJjT+cj1yKxuauQTg7O+v2Tx2FV9S+1cmR6hxsVZsVwEYi42EeHrf4CaRZKpr5p/7EtxxoRSit5JQPE9hGxzswWsgBO6HS+ROEwRWEgRxAYo3/kXiyKAm48vv1/ar6SgO9HTE0aSiEKCyKFiAXMzAG1RnvHqLVmKEALv6F9iVq9R5F9LXTXzFPfhqoJuE9OUTP4RQg86Jd/9aHh7EVt/HDzmuJqZt+w/69kUU6oiCof5xR4QWqUH4F4YgoAJybOzxWmHhpaQJEUdioXo94eZg==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB3025.apcprd06.prod.outlook.com (2603:1096:203:87::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 05:30:48 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f%7]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 05:30:48 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Index: AQHX8FpD0Nz3v2I3x0ycyTg/sZrw5qwxMObwgAADdACAAAFQoIAAHLsAgAACI3CAAAQtgIAAGxXwgAFoc4CAACvCkA==
Date: Wed, 15 Dec 2021 05:30:48 +0000
Message-ID: <HK0PR06MB3380BAB7D3BF010DC01D8FCCF2769@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20211213194703.24060-1-zev@bewilderbeest.net>
 <HK0PR06MB338026E6233FBF845BF04F5EF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <Ybf0TApJEEaM4FDL@hatter.bewilderbeest.net>
 <HK0PR06MB3380B961DEE52F90241657FDF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <YbgNgBDzrGEI+1/c@hatter.bewilderbeest.net>
 <HK0PR06MB3380C413C9024689082AC4E2F2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <YbgSyxUdI+tiG2L1@hatter.bewilderbeest.net>
 <HK0PR06MB3380C34C97A93A62C7053CA3F2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <YblX4e2Zk/idHoAQ@hatter.bewilderbeest.net>
In-Reply-To: <YblX4e2Zk/idHoAQ@hatter.bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa25c5b1-f45e-4d1f-a8e5-08d9bf8c0d2d
x-ms-traffictypediagnostic: HK0PR06MB3025:EE_
x-microsoft-antispam-prvs: <HK0PR06MB30250843E8368A4355A100C9F2769@HK0PR06MB3025.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eVxNbpGnl06NbJUl+4QDziOBhDWcdvIAC+P9gMcVbHJYEQeNx6Hq3rzYWseT1XCoEuc8bwijv284sTOt/U+WmuNMNtaebmlMDTeU4pDaPwzfzGFGG3I70c+PWyux3N8lgoBwkyF2XgKFEVOSenbu+xy4gcuR3aeJ0o74jjzZ3Ob7ZnbtyNj48LZkSiUV4Q9ieHeLlkkjkJ0nuqx8x9K5QGzuAs00UwQ4QE2KB0fTQFfXEalp6iJuD/aAL8LJ8pVOEyisdqEGiDCh1ET4aK9RJj0to7tk6E6aPLG2KIPMHJh69UxiglhtaStU8SamjQ/K9+CBUgqqdAJG5X0C5RmP0GnHppsOm6VYtIIizHNreY3u0h1VMQtNKkfNhMCEFCqUlSnVSEL88Dhk15pRP0Y4uHHgRm1fTgKL/buIylIz0PTUa8se86anw/P/Sn8vm/BpkeMGbjLkIRRUrFM4xhq4h1MvZTQtSx0ebvSjwkwS+QcNL4qQKq2EiGSHs4nr9CqIrX9Yk1kd0MUY8jsJsuGQmHm/bdGAq6AmZ/o2ueow8cwhipEdbkr4HQXH/CshxlLKbysE95nLOlphrfNyFEHWI35qNwZKzjvnAnwgNicXqcvijNgWfXoFcvdUhmf7TIsytWQr1NHEt4trVyqm8hchNCah0UIYlr8L21iIFTtuKyex2cvMVV/eC4QNDEonbuIXCd59PuIGZvIad0AloiyW9UIR8TLRt9+BqUCoC0KvxM43VE9HDbKc/gZnZVLqZtopX8EoB+gmYIIE/bHMiuLnJYBEk1yAlEH+I5j5sdKmEupzBNvUMwyWWmoQcBV7fnFTOtKAqXKDQK608LtUR+y7/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(376002)(39840400004)(396003)(71200400001)(38100700002)(508600001)(83380400001)(186003)(33656002)(55016003)(4326008)(122000001)(38070700005)(9686003)(2906002)(76116006)(52536014)(5660300002)(8676002)(53546011)(6506007)(54906003)(66946007)(6916009)(64756008)(107886003)(66556008)(66476007)(26005)(66446008)(316002)(8936002)(7696005)(966005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jqz5g1YdjUvBaiux/GzbPOlePEwPL4PsMQ9LhRt9S4gWmf6aCt7KZ4aQalyw?=
 =?us-ascii?Q?lhg25Rd+6XLeK97gV4oUxPinNu21+ctK/7VV+E7AtmOb/pUPYzWZPDDpr+9X?=
 =?us-ascii?Q?uzh+ge0oFrmDIfxM6ZGu2djNb0dqgYYU+DQ9UiXTPA9/jSBhTMTNatI9Cj5X?=
 =?us-ascii?Q?rrsZsLR3lSJublEjNav4wjl2q5A429mj+kXzd9IO0ahnNTfS7aSGGph75j0z?=
 =?us-ascii?Q?cLI7zD8/cVOrz6rzIkZkurCSfSzP0axzSXh9MRPPDzxnN3DTNE3khHXx5diB?=
 =?us-ascii?Q?Wb7u/u0saLVEIWulU/IC2CavC1fd8TlTSc07K1BK88uHmwanKgz7TAR4OhON?=
 =?us-ascii?Q?pLJ87lYpRaEY6N5w9BfHY6AZRzYzPZJEjpyTmLgFakG+JWgsVP19r34WBbAg?=
 =?us-ascii?Q?Y8NfoF7aLUEHkVpHeMVg3PIEbYA++ac1lTmYmnJ/MTDRDtANe0CYmQEm00I3?=
 =?us-ascii?Q?No+4BQ06SQj6au+YSKBVJHMk9JwbQ2TiAFCPQrjaZ5Us9N2430zf67YyOM9u?=
 =?us-ascii?Q?vpuPhJeSw1V5JZ/qTyU4H22jSDXTc8ki9aCwsqeCxPmjZNNOeFiQvp3yLC9a?=
 =?us-ascii?Q?9rWN3OqMdWSBKxuNqfHYWDCh8BaS6+3/wL8axkZHC7uF71Ou1ztSM6hSSzUV?=
 =?us-ascii?Q?OWSJrq761boBC+3el5a0e8oCo0egIyb/HRF1EK9y2Nsw0dlYb/gULr9DzRPV?=
 =?us-ascii?Q?DLR4wcrWwE8yL455ddM7cAlBekaU9D+MQiOjYatQVCTfnu20xFvj3hCYuvQJ?=
 =?us-ascii?Q?YupZjWaNvPOZLTIJL7veI4iuGIq+nccV+ScBQhsvVSXPUrWr92pNbRrf2txE?=
 =?us-ascii?Q?rdbB+QitjDDfQF/KSKocYCr/M8nUaTre8dfJP4OBWG9ezZwAO0l6p813GYdi?=
 =?us-ascii?Q?oQjUCReTkNVRuCbB82lI1y/+OHRNhyPpawTSWXnY9SirtKMCNlPA5308+nv2?=
 =?us-ascii?Q?eJi2s8f0Y2UpQlpEjVCXAJhDfq2J1GHbndzOWu0IWQBSpB/nEotyJ362fTtQ?=
 =?us-ascii?Q?GtZ9PGGkpvgvjkG3Qf7XDkUAufZk/kW3W25HQfr00jJzZPK3lw9ThJTNo1uo?=
 =?us-ascii?Q?tDUqeN3THvbXMz+kUo/taA/WJ6pzKPeWKNWHlTXF00iFzfUmfT6K84zne+zy?=
 =?us-ascii?Q?6hLvjGNVQ4aG46pVkkPIgrxB/13rWaefp2o4lSwuRb091gDzW5VBh5lHpzJF?=
 =?us-ascii?Q?Tle0A7mbzQB6An0jZBO3Bx0aYfULDHjAKx6aVIe+mtBhWl7wNpzMFdfvlSsM?=
 =?us-ascii?Q?4VBCu8iSyZRokwW3Y37KK5a9nz9tcJiUzQ4UDoTG75Hw9bbi5WZohoniHadx?=
 =?us-ascii?Q?+uhJNifW1nSj4+B1IT/FWksK++OUUIwRWp4uAKEeQwbZzkLeg8388GE3tGRE?=
 =?us-ascii?Q?KFiUhrqqoVrgkEn+Fc8hClKqakO1R/2jIzBRCUG5COVCHZS0hA9waml20WZU?=
 =?us-ascii?Q?oDwOlAD/Bxrge9rO4AOUraY1S/OzSjRTjgYZwUU/8Ek4EnnjwcWdVqRlYG5m?=
 =?us-ascii?Q?J5li/CQMhqcxOuyWposZYs1YnvyYzKhnGtYBnfhksQMMpTUP2tUXpLgbxr2q?=
 =?us-ascii?Q?UMEk3+DVmrfBWq4oYOY03DnFi3bvFTDWgfMVR5jVYM2OVFjpfg3qsbzXZ+w8?=
 =?us-ascii?Q?cL9yc+/K+MNA38/11xRVl5tOFLsWqHy2ykYnSrxwREQYT25cYFjRAgjCf6N/?=
 =?us-ascii?Q?BngBjA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa25c5b1-f45e-4d1f-a8e5-08d9bf8c0d2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 05:30:48.6319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOjRjZ5BsQpaMF+KaPAJ6hxFj1wFYhn6kfk4W+glGXwhNaXirUwhiTUSm1C0Mav/L1qZ7WjbISDSWmrQAyQP9KebPJ1Y4PJlUUsasrvjgb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3025
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,
> -----Original Message-----
> From: Zev Weiss <zev@bewilderbeest.net>
> Sent: Wednesday, December 15, 2021 10:50 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>; ChiaWei Wang
> <chiawei_wang@aspeedtech.com>
> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
> support for TXD3/RXD3 pins
>=20
> On Mon, Dec 13, 2021 at 09:21:36PM PST, Ryan Chen wrote:
> >Hello,
> >> -----Original Message-----
> >> From: Zev Weiss <zev@bewilderbeest.net>
> >> Sent: Tuesday, December 14, 2021 11:43 AM
> >> To: Ryan Chen <ryan_chen@aspeedtech.com>
> >> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>; ChiaWei
> >> Wang <chiawei_wang@aspeedtech.com>
> >> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400:
> >> add support for TXD3/RXD3 pins
> >>
> >> On Mon, Dec 13, 2021 at 07:29:48PM PST, Ryan Chen wrote:
> >> >Hello,
> >> >> -----Original Message-----
> >> >> From: Zev Weiss <zev@bewilderbeest.net>
> >> >> Sent: Tuesday, December 14, 2021 11:21 AM
> >> >> To: Ryan Chen <ryan_chen@aspeedtech.com>
> >> >> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>;
> >> >> ChiaWei Wang <chiawei_wang@aspeedtech.com>
> >> >> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast240=
0:
> >> >> add support for TXD3/RXD3 pins
> >> >>
> >> >> On Mon, Dec 13, 2021 at 05:39:17PM PST, Ryan Chen wrote:
> >> >> >Hello,
> >> >> >
> >> >> >> -----Original Message-----
> >> >> >> From: Zev Weiss <zev@bewilderbeest.net>
> >> >> >> Sent: Tuesday, December 14, 2021 9:33 AM
> >> >> >> To: Ryan Chen <ryan_chen@aspeedtech.com>
> >> >> >> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>;
> >> >> >> ChiaWei Wang <chiawei_wang@aspeedtech.com>
> >> >> >> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl:
> ast2400:
> >> >> >> add support for TXD3/RXD3 pins
> >> >> >>
> >> >> >> On Mon, Dec 13, 2021 at 05:22:52PM PST, Ryan Chen wrote:
> >> >> >> >Hello,
> >> >> >> >	You may need claim for function group for link, not for pin li=
nk.
> >> >> >> >	Ex.
> >> >> >> >	static struct aspeed_sig_desc uart3_link[] =3D {
> >> >> >> >		{ 0x80, BIT(22), 0},
> >> >> >> >		{ 0x80, BIT(23), 0},
> >> >> >> >	}
> >> >> >> >
> >> >> >> >	ast2400_groups[] =3D {
> >> >> >> >	{ "UART3", 2, uart3_link },
> >> >> >> >Ryan
> >> >> >>
> >> >> >> Hi Ryan,
> >> >> >>
> >> >> >> That possibility occurred to me, but the existing
> >> >> >> function/group names in arch/arm/dts/ast2400.dtsi (lines
> >> >> >> 1130-1133 and 1375-1378) made me think they should be separate.
> >> >> >This device tree is copied from Linux kernel.
> >> >> >
> >> >> >> I'm certainly not an expert on pinctrl stuff though...is there
> >> >> >> some other existing logic or mechanism to link a "UART3" to the
> >> >> >> separate "TXD3" and "RXD3" in the device tree?
> >> >> >There is no separate in u-boot device tree.
> >> >>
> >> >> Perhaps we're misunderstanding each other...
> >> >>
> >> >>
> >>
> https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a4
> >> >> fa5013d6dd/arch/arm/dts/ast2400.dtsi#L1130-L1133
> >> >>
> >> >> and
> >> >>
> >> >>
> >>
> https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a4
> >> >> fa5013d6dd/arch/arm/dts/ast2400.dtsi#L1375-L1378
> >> >>
> >> >The following is my point.
> >>
> >https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a
> >> 4fa
> >> >5013d6dd/arch/arm/dts/ast2400.dtsi#L3
> >> >
> >>
> >> I'm afraid I don't follow...how does it being copied from the Linux
> >> kernel device tree affect whether or not we should group these two or =
keep
> them separate?
> >My point is the original dtsi file is copy from kernel.
> >So that dtsi define is inherit. So that you see in currently u-boot.
> >
>=20
> I mean, I saw that comment and I'm aware of the derivation of the file, b=
ut I'm
> still not sure what bearing it has on the question at hand.
>=20
> Is your view that because the dts was initially just copied from the kern=
el, it's
> not necessarily the right fit for u-boot, and that we should change it to=
 unify
> these two functions in a single group?  If so, I guess I'm still wonderin=
g what
> tangible benefit that would have, and about the flexibility issue I raise=
d a few
> messages back.
>=20
Yes, it is my original through for dtsi file.
It is ok for this add for TXD3/RTX3 function for pinctrl.

> If that's not what you're aiming to suggest, pardon me if I'm being dense=
 here,
> but I'm going to need a more detailed explanation, because as it stands I=
'm
> still pretty mystified.
>=20
>=20
> >>
> >>
> >> >> look fairly separate to me?
> >> >>
> >> >> >May I know why you need separate?
> >> >>
> >> >> In my particular case I don't need these two to be separate, but
> >> >> it seems conceivable that there might be other cases that would
> >> >> require a different set of signals to be enabled for a generic
> >> >> "UART3" group
> >> >> -- possibly more (sideband signals like CTS and such), or perhaps
> >> >> even fewer (e.g. if you had an output-only UART3 just for logging
> >> >> or something, and only needed TXD3 for that, but still wanted to
> >> >> use pin
> >> >> B14 as GPIOE7 instead of RXD3).  Keeping them separate seems like
> >> >> it leaves things as flexible as possible, avoiding imposing any
> >> >> artificial
> >> constraints.
> >> >>
> >> >>
> >> >> Zev
> >> >
