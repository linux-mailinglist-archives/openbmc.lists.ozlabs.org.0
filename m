Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7724037B7
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 12:19:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4J5s5TdHz2ybN
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 20:19:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=N/vD8HkU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.121;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=N/vD8HkU; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320121.outbound.protection.outlook.com [40.107.132.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4J5J4DfCz2yHJ;
 Wed,  8 Sep 2021 20:18:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmrdtQJ/BIg9O8NVKzrCbcMirwUsXTxccXx1wBYeS/4Bx40DMR8GzanASs1Qgujq2a7YSVcXdM0yA9lNpvL7Bqrzvt3mKZKmT0vyIRFB7hHCCrB3ELIzDaqSz29M/zSjhzOzgRTDCqC5b5Owrf5hnLApEkG+bHXFtUIb/uSaZBI+WdG+Zmo2iIs36t4JvbT4BB/QfJ34EoB21VZPq7410JlNCEY6FFOO2G3Jxc8iLa5CzkRdqm15oR/J/puJSpEdoSgvfimxQ6p5+mY7/P26AIx9M2tK+BHDi26dhPi3CJ0Gt+0pFI2AzVh1cehgiat7maH36EU/i+ojGE0e4RYLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0et2rsBPQ5fadDyIxjaBDGpq04m2rCzHq9Y1m07xCjg=;
 b=EVhCQ1vVrlFbo++3UmJJh6sc8WJXO35oHT9Qech0u/mMzRlup6krJEDaKSPRYwwT5e5HQiVK/aQUXIEO/lezDSe0DZ44GHxBAi9dN4UTQl18TzD2+QBhDPYL5jjHXXz7DKupr8cQCiEOatLCGpZ0hz4cK4Jr96aijZgnFvlGeU1p4MXXumvUh9dpgO9KVfZ5mKffbu6mpMnjXWbvXj4COWkswUIH2VluVG6tsera6TjCiIfnILHaw2HZZp1y4qqwOcf1otOhs/LVX8VcLXE/9tPPmY2gWbe1zVU7il4zQjQU+H0VVFaj3Vo1r1G/kuOcO3zgnfYSp6Aedy48m8e12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0et2rsBPQ5fadDyIxjaBDGpq04m2rCzHq9Y1m07xCjg=;
 b=N/vD8HkUFyDr3DggxtKSLtT0doZW5xcgBr9M7Hq+Ds4y84n0nFetC7gP3/G/6PQWxikywHIMFlx4M4bKwCYCXr5WOEahvbzfe8v+wg7i1vUdrfkswBFQnnvMjth+6soQu8z2dHlI2DjwZhzjXhNefBr32hzE5eDGzTAGycgIl0xPEuA2cM9Bif8cGkoTKJ13tAYrm+HaM6WE809amqA+n7y2Hp/3puK8W6iGFk58vZx3LEiHcKTyQ2mqcpVBwwZo2IMkzBfqSM1D+JUpPs17szkw1bGnwUPeptzwKfCd5PAoHZq79I3j8zDe/872UBwLnOiNY7BMNG2Z/khEiSAY2Q==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3556.apcprd06.prod.outlook.com (2603:1096:202:39::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 10:18:35 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4457.026; Wed, 8 Sep 2021
 10:18:35 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Paul Fertser <fercerpav@gmail.com>
Subject: RE: [PATCH v2 0/3] arm: aspeed: Add UART routing support
Thread-Topic: [PATCH v2 0/3] arm: aspeed: Add UART routing support
Thread-Index: AQHXn6Ep4pfNy4cUzEmFUBdsNZd0kquZ7IKAgAAENXA=
Date: Wed, 8 Sep 2021 10:18:35 +0000
Message-ID: <HK0PR06MB3779180F75DB8BD872F8A78391D49@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
 <20210908094248.GZ23326@home.paul.comp>
In-Reply-To: <20210908094248.GZ23326@home.paul.comp>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41af0b3a-687c-41ab-b21b-08d972b2049f
x-ms-traffictypediagnostic: HK2PR06MB3556:
x-microsoft-antispam-prvs: <HK2PR06MB35567BE0EAB4811868889B3591D49@HK2PR06MB3556.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CCFmx3QxDwQdILuLwGdH2RHz2PqTWh3yROKKTXvuQPvKan7//hLHapqZpvqmyGgfDkArWQT/PvSMe0VvveHIkjKme/YMP5Z7GfUVld1TVpbxIF3XZFm/P+tfjHLFSVxpbLfaZFQVqgXFxLDmKO5BcQhxDAPJx01TupsJ2I75X3/7Nj4RrnqJurv5uN5nPSjRVTXgcsCcse+vbi3uge53/XIqirGUlgpbgJZulb4YbZ9KglAPKaZkeyZ8bQimyl0y1Wxy62dyb9nZop5iP5Wl1Df4t6GaXYOSjh5c+5waznNmwAV3q3yTqaJsouyqX/wAj/hlN0t1KdhSb7lCu6al0biUjsJkSrQXoo9n110Asphweu8bnH6V79kNEw0zcxxBzq7dEbYFPt4neoLFLLESHiGpjVK7unGA0n3FLJMXsc/KiV+DaCA19d9WxfqDatTTOkqIOfVAdiz4icHWAuSJVX5sexeyrn3pW6mrorU789VKYhzC5NmKvz9prx5Z4KeesWFisLHy9iYHljadsiYi34aNqhedyxprtKiGYLQbU3MP4Y8Qci+ojLNiGne2Hkpq5ICTlucNf9I4a7VfsT9Nh4LNJSRPNv771AqbHDmPxFuNx87yU+PsHTHLOsHhgAhj5CUbl+7MlUQKUS15AwFsNTwbPsb2zOVpeHaFu4wveAvsgEWhtya4rILmZ+5WkVMsIRvAArOvC2oJa+dYdWfNv61H/RNKlsydM42lhBrXMPKj5PbQC0I26LkZAmCCMZnDeqmD9xbgCLa8YqfjOxCNszj0foXgAInE3eGmZvbT6kQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(376002)(396003)(366004)(39840400004)(478600001)(26005)(66556008)(66946007)(33656002)(71200400001)(66476007)(7696005)(52536014)(54906003)(5660300002)(8936002)(6506007)(186003)(64756008)(8676002)(66446008)(76116006)(38070700005)(83380400001)(2906002)(7416002)(6916009)(55016002)(38100700002)(9686003)(4326008)(316002)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u5H/dxYBBWQJpxI/8rxXPMiMY2ntb5CxjSQvm0mubsOsnU1n9wKH/hJThXmn?=
 =?us-ascii?Q?jTqMXIWp+xAQ1g5kOclcflhEJ5+5eWMjCD6VCePpMhaL5MtfyXwCaOcp8caD?=
 =?us-ascii?Q?/WsGbJ+/5jmqoHa6WsuNE/YebIgviqJhnvzdS9/djnawfp5jLrCqDZFaygd5?=
 =?us-ascii?Q?k9AHoRZhsM3+dUOeNh08bkccsJ3IANEzZXY03OZbF3jlS3QKDvZ6Wjn6zU7G?=
 =?us-ascii?Q?tYwIVi4ypq4u1hku7Rx79hL5R9kOMT/DSegLPNKb9cpeJh/hjcQON3Vkoboa?=
 =?us-ascii?Q?Mu4utqaAC3NnKYYQyN5YBs4W2KiS10hxz/UVpUmYjTw7LPUiyW/jiEPevzSv?=
 =?us-ascii?Q?kp5/4PlCMXoX4NUhmBCQi5ziQhRV/vtuH0QDe/9J8nIowjSBwQnKNNwYmHu+?=
 =?us-ascii?Q?aEZui8hFiloW5mcEMsfMArS1gAyeaIQuDHRlSLXORu7IdCVGqv6Uvb5f9xGx?=
 =?us-ascii?Q?jCos+Q7GCKIZdZsIXZra3CAsX8AYkAB/dhU47Q6J99sW8bioheShYLAlnsPy?=
 =?us-ascii?Q?BqbOWSYvxz20Vxkbu9hsc6saq3X3MRIKShVh+6/zdb5JjPpRiWEMB25iA35l?=
 =?us-ascii?Q?yIT5sQmNjN3nHhW420m7NOH4PC0z7lKa/f57gThs7YbfjqUPmUA5nX0Pzqxy?=
 =?us-ascii?Q?oAFw4PjeMvHnRmTMnzh1jafmwSe54tdq140Sfk0tjE/HYc+f/PvyFUOFlsy5?=
 =?us-ascii?Q?jEdfA5dcvD0xAJnPeNeB2KysLZoEmvTqjuumqq0vql+QYg+30xsl0Trv6E0M?=
 =?us-ascii?Q?rNpxGfHxaEh45zDd/DbvMhSq5LVICVMit1xCdolooVXJT9MAhptL+CYtZsF4?=
 =?us-ascii?Q?AVkd+htkwQGTC3p8WR6rB/5ozHW6i1cHameUy6FePhrjJp+mF7WsgT+RAGd9?=
 =?us-ascii?Q?o+ZGXU2T5Om1IbwF2nm3ltNHIGy2kOtOBlxPq4dRLBPUqPpYIDQsO5IrVeqp?=
 =?us-ascii?Q?rgNAL3MI2v6MoAc7FvQm7IQInoEhJgBHJJ5OrCVnSju6cAdTbXC/IbsWO6f0?=
 =?us-ascii?Q?tNdxC2hzzNFQabQG7W9RMgUKItE8dPg4lNPi0lu7XjTPE6hHhX5QBEwOxJgh?=
 =?us-ascii?Q?wnElMx3gyFf9vE/fCHlr0L4KTzMWob6vIbHLk1wZVy/iCUEaOv8b+3ZvvBN+?=
 =?us-ascii?Q?oHhzK7iGo5S/jYmvh6GgzI83bstLenAa3BoEkIbtBrzqegVFvBAwFcoNQmC5?=
 =?us-ascii?Q?7doZ8SuzqUW5zOi7WpB80ZDf3A5LgJ/pkDTC5wNY5Jrg0S0qc207F2lgqgUJ?=
 =?us-ascii?Q?/Lqr+hKkM9yk1Fu2aUamU1ReZUErYe7d5vVcmQbyvk9NIBo5vuEHNsRijiAx?=
 =?us-ascii?Q?J+YETXzUb7jFymkl2p3yoj4F?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41af0b3a-687c-41ab-b21b-08d972b2049f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 10:18:35.5366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtS8BfG7ayM6KNsukgyfo8Dct0qYQT1b9nQR1naJLYpnPcRokZ4Agp2YEkdctf/GbLEn+kziEpp+WxIana1+G3TkpoA+Pc5no3Mx0Fo/9ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3556
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
 Konstantin Klubnichkin <kitsok@yandex-team.ru>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "osk@google.com" <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

> From: Paul Fertser <fercerpav@gmail.com>
> Sent: Wednesday, September 8, 2021 5:43 PM
>=20
> Hello,
>=20
> On Thu, Sep 02, 2021 at 10:18:13AM +0800, Chia-Wei Wang wrote:
> > Add UART routing driver and the device tree nodes.
>=20
> Thank you for working on exposing this functionality in upstreamable way,
> that's so much better than all the register-level hacks in U-Boot and sim=
ilar
> approaches!
>=20
>=20
> One (somewhat) related question that I hope you do not mind answering:
> is there anything special regarding the routing or other configuration th=
at
> needs to be done for VUART to work with IRQs?

No. The routing control has no relation to VUART.

>=20
> The reason I ask is that I have tried hard (and I know several other deve=
lopers
> who have too) to use VUART functionality but somehow as soon as Linux was
> booting on host and starting to use the IRQ-based
> 16550 driver the communication was halted both ways. Basically, the BMC
> firmware was enabling VUART in DTS, then setting LPC address to
> 0x3F8 and LPC IRQ to 4 and reading/writing using the corresponding
> /dev/ttyS* node. The datasheet is not clearly telling what other actions =
need to
> be performed for this to work. Not using VUART and instead routing UART1
> lines with exactly the same pinctrl/pinmux worked just fine. One detail i=
s that
> with VUART the host wasn't seeing new interrupts but when they were
> simulated by exporting the LPC interrupt pin via /sys/class/gpio and togg=
ling it
> manually the data was getting through.
>=20
> Does UART1 need some explicit disabling for VUART IRQs to work? It looks =
like
> setting LPC address and IRQ number in VUART is enough to override the
> register part but probably not for the interrupt?

You may need to confirm that the Host does not enable the SIO SUART1 device=
.
This will conflict with VUART as both SUART and VAURT are competing for the=
 port address 0x3f8 and SIRQ 4.

>=20
> --
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
> mailto:fercerpav@gmail.com
