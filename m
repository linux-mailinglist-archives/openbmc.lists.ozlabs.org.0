Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A28E440EE72
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 02:47:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9Zz73v7Tz2ybK
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 10:46:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Hx7XcTcu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.91;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=Hx7XcTcu; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320091.outbound.protection.outlook.com [40.107.132.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9ZyS6Znhz2xYG;
 Fri, 17 Sep 2021 10:46:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsUbbcEwAFDjY2i5NVWmIeFkT9JHP85yVF6RkPxt6hoOMdf5XgpP53BFCGO0jGQSw0LbksB2EHNPMMIgr1R+qKYfokDHd/0IBo32ydP+0Q8YxeviasWl9MqX/AejfXE4fJiIyTAX2/tzjnxbXS1l+TMM3AMwSJD7WqrL7DnCQSN6HnN6KHGYk5geb6tc3CdJAU7TIFW34tm8FDDZgIhLVbGkLzGy0xXv6yiTQL6HQA1pbXlkdw/CN7Vj1+8T3mIJYSgmPQZqMW7c3OXY4pJuEpOt2MhaJ264tz3aNK2O2edqlBo1xkQCam2DtPZbcUYP7Gagx50IQNjX81B82Q5D7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FB4ptc6hYyJcHI4zkbLFJq8A8pXG6F0KqjxYaDTlXzw=;
 b=H25lD/jNYADUcVMP4TRiqwwQfEhHw8UFRXl7q3JUSBR65kaenrspI5LUXQ6i5eNmqAEj+azdezvmYDvx8FUvZvKALR2EbFXRaLe2sE6us1+tLp/UGqhqYUTXfb9/FdNC3107VXNU+2CRGxQfUA6t6+dmvtdOzmOeCVqNiNV1TeEbeFsuqWuyw8fdGqOUQaHfkIL32hEfRYppgN1yd7cU80WkMQK3JxFT4oiQ5DPhwtX5yH8wIpOT1gfJ6s0RI1hDxJ1Gh2FOyl5jNgy5VRK4N9kdT+eEZeX/RyRS8PUVYwKog4fbWVXrx+Yw4wTq3KTKe6sR5LWBdU5umE7l4gOv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FB4ptc6hYyJcHI4zkbLFJq8A8pXG6F0KqjxYaDTlXzw=;
 b=Hx7XcTcujnYz8xQsN5aJOEAL91mWwaZ5/m34DxRnwskvN+l3EpGZK52yKF9wvJ2J75zUIcLnDcwcz7cBe7Ox8OsP+ANIG3YKqNNjNRXsELF/yCnPdXzhIohaUT4KRyLNRh6Blvmz3Fu5DhmrfPdWmM7VUWIRfz45kXeVXlqP21r2xNJhYfD7W2GOpBKw07rXnbICqOI4QuXTpOC0Yf5jUmX02ioa6u7bI9cLQ6G9F1L0QmRg26Ijv2s1haFMuoNxSaSPZ4W+e6bdt4PXB4jfssAlYHDnQIrVzeFeqnElXZShBYG9InFrVGk0v5OxsECitszSiML17juTgTgjIucwWA==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3251.apcprd06.prod.outlook.com (2603:1096:202:3a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Fri, 17 Sep
 2021 00:46:02 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3517:6c51:50d:1a55]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3517:6c51:50d:1a55%3]) with mapi id 15.20.4500.019; Fri, 17 Sep 2021
 00:46:02 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v5 2/4] dt-bindings: aspeed: Add UART routing controller
Thread-Topic: [PATCH v5 2/4] dt-bindings: aspeed: Add UART routing controller
Thread-Index: AQHXqtz27VKj1AH6l0KtPAiIVT2SLqunGmaAgABJ27A=
Date: Fri, 17 Sep 2021 00:46:02 +0000
Message-ID: <HK0PR06MB377954A91F788E4B091CAA1891DD9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210916092515.10553-1-chiawei_wang@aspeedtech.com>
 <20210916092515.10553-3-chiawei_wang@aspeedtech.com>
 <YUOmq4hLoP2ds18w@robh.at.kernel.org>
In-Reply-To: <YUOmq4hLoP2ds18w@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08df6254-b07e-415f-ef54-08d979748666
x-ms-traffictypediagnostic: HK2PR06MB3251:
x-microsoft-antispam-prvs: <HK2PR06MB3251149A31A19A9B42AAED2991DD9@HK2PR06MB3251.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3c5Po67P+Gq1UZG+1eRUFP0YBGFzEHQo2aVk7nBCGbGzP+nS7wZA2PVB/33ZVbSNZZgKPv0U8xOHu+Ee/DAFDWy9UVIK7OONKimuDsmtJb4KptNxVefaNEudS8t2KI8BCqhIaKUX6iDPLeotV2fjneGWJSBgjdJItqOyLJjwPNSUHCg3iQIbzFfvyaIMt9pM9s/WckTZMwgsGTCu9L7L3cNPAPwUMu3HNfbhPct1N8NRYhMkU9+B5p2b4ilqRTJq95w6fHTyJzoMJvfIxmmy1fa5EdkFT9mp4OlpOsPLSNyYP1g7B46qJaYXsq8D5Mn+jBkyABe5Q6gtTyZOkABzc/9uqLXiN0EQsN5pT2fsxi8p+J1kf+SOlXwT0EzXIc8m+9AjTyY94bLFhkY4MwNz/K1mwNhsi47N6S0MK5MJYuDmstxYM+sBwpKVRFD+YVUDrm/tBCkQsXlLX0PzXRc187n0P8AmvX0+r0/x0l7yjxtbo4xtr9hci8Ert4UT69e0DBUGPLREsWn3gTlQKZv1LnIbR6mQZcoFSZyNWP98ftqYz3oxP2aqbf/ySLt0m9ov048NxxY7PBHTa0VogYWKW3tgxGbFExcFp+l/Ti1ZPHVzE9fIniLh3DyyLqTnLrmsoZiyoVQ6oa6HxdgQr7nmNF4AO1DwZcQMm0ZyW81BNqb052LLwpTXjrp3Jq9wpONCkwCdrU8yaiHXrOLM3DrOLHlCd6gYaixZbFJc7uv3q/VAQwDoihRgDZZsLYdbYSTi6TZInFm2EngSi0kzQOv4AAf3ic/ELGJFWDBm90cP5fsnT41LEljivc4eFAO0wzIAfZPrYXW4TknUBuViC+knag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(366004)(39840400004)(136003)(64756008)(6916009)(8936002)(26005)(122000001)(316002)(33656002)(52536014)(66446008)(9686003)(4326008)(38070700005)(76116006)(6506007)(478600001)(66556008)(55016002)(186003)(5660300002)(71200400001)(7416002)(86362001)(83380400001)(7696005)(54906003)(66476007)(38100700002)(8676002)(2906002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yRLnkzl8rbfPl0Mjc8MIAVAVLgiClyKwN6wkwTm0Y7F6toD6Yfy6GckcqK4E?=
 =?us-ascii?Q?8KlXagtfzJI1Yhi/3lYOSvzfx5dgtbSoF2SCg2l9AcTvyztN3kFgdEKt90tZ?=
 =?us-ascii?Q?opmDVtVBMCNHJLbLrlxY/LC2ZQ/0H40+xtj+QG8hFt1RpYxtDczCXgDyLK0M?=
 =?us-ascii?Q?0opzXmF/cWCQqS1LFazN5TWFwyKhsnH/6A49EbzWpeXoInfCrmCebsJjdiAm?=
 =?us-ascii?Q?Zrx4NYE9O8t3siZiHp0lwmaYKcgE+U3s5P4+FMB5knCwkPoh8ANno/NfXPcW?=
 =?us-ascii?Q?bd1/13hOJqOOOLwztK2yb8NtUPO06FBc2lGU1nBuZsBAm6Yw5o674uLWwqyo?=
 =?us-ascii?Q?6Vt2RgDtVb9bZreAznpvVe1sIww62ShT/fB1Y/bl2fyh1Lw/6A4kV9+/H65w?=
 =?us-ascii?Q?nGDxSYxuon3+pgOxwWdSYhWtySAaQxZifAJ3aC4h8kIJqdKbpyLp3z/6fVV3?=
 =?us-ascii?Q?Z5bmzVlYKdYmJWouJPZCaP/LfEjoqsB6X2oxo/BEQUOuXdUWt7Wy2sJ7RiS8?=
 =?us-ascii?Q?LyhopboEzAEA2oybVT46E8wAQwWTVbQ0NeCqk9/z5RWuHgR17/ZPrYOORSLf?=
 =?us-ascii?Q?FCqkb1gKRm2aSlDwLXVeUkf1Q46MX1mcTYI9c5zWtL71wjM7wRdKPn7JYlNX?=
 =?us-ascii?Q?YTaMcdm+WcHliTtD/y519JM35pYQCTcRg8WLTyDd8R5UeLmyWGYVg9y8PoaL?=
 =?us-ascii?Q?1vDnTokGW7kt6/hZa16MbdgjneItlxcQXEbvGhow/drqFUPppOvxSjogH8Ec?=
 =?us-ascii?Q?dGINxsTWMF6h7Of8g+tMDj0ee4Z37KqFR3ufzMdHh+hIaSZnUJSCO33iE6DO?=
 =?us-ascii?Q?L7f0+U3aFMzlpAjXSI1rKzNtbXhvGMKFUX8Pv0AQ1Qmlm/AGbm2rUbIQ4Ot9?=
 =?us-ascii?Q?wcpt53nfLrdHx6Bn5fgyqFTCkYB+sF9pP5/QiceHS+aT29cbK4RdeYQ8p22Z?=
 =?us-ascii?Q?NkzyZp+JbFzfNAAJORwxA3kardmpor7tsyHFH/0sd2SQiIuuZTizqFAGn+zA?=
 =?us-ascii?Q?cugPRKoHbG7Xj8tF3LMNWRVO7jPYVEIcD9feATEfOtrDBUnWjMqceV9KCDaX?=
 =?us-ascii?Q?W4ynjShrjZhPSfu3xb2Fe3o5mSpnf/9OuF42JHnrQNWWvvEQROyNk5ZnVpvg?=
 =?us-ascii?Q?DJhsrvTuZjK//LuFDnOYY8I553cn4DLTX3aAUQT7hLUzg4FdyKDW1Em0O4Cc?=
 =?us-ascii?Q?d1V3XxqhLXF8KvK6qp2qeh5jqIGU4s0/9Qiq6008bQbMkFPLdaePC8Xj9gzR?=
 =?us-ascii?Q?0lcVasW4t8PNUkuMhzRlUXjkwa3SDxndYx0DdCz+85u8JMe7PP6cEtXUJhjo?=
 =?us-ascii?Q?Lis/wKvp7xJPIFCvbtXt+IaZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08df6254-b07e-415f-ef54-08d979748666
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 00:46:02.5867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AbnsoY2g92ZbHQPv/JZ9M/FHM439ts3MVLeE+MQpVqSp/fP14O8RChubUvzIVrh1c9I5fgM6D8HmgCHMMbaTg86uzK8qJwqEbsTPCf441As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3251
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
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "osk@google.com" <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

> From: Rob Herring <robh@kernel.org>
> Sent: Friday, September 17, 2021 4:19 AM
>=20
> On Thu, Sep 16, 2021 at 05:25:13PM +0800, Chia-Wei Wang wrote:
> > Add dt-bindings for Aspeed UART routing controller.
> >
> > Signed-off-by: Oskar Senft <osk@google.com>
> > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  4 ++
> >  .../bindings/soc/aspeed/uart-routing.yaml     | 70
> +++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> > b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> > index 54f080df5e2f..697331d840a0 100644
> > --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> > @@ -142,6 +142,10 @@ patternProperties:
> >        - interrupts
> >        - snoop-ports
> >
> > +  "^uart-routing@[0-9a-f]+$":
> > +    $ref: /schemas/soc/aspeed/uart-routing.yaml#
> > +    description: The UART routing control under LPC register space
> > +
> >  required:
> >    - compatible
> >    - reg
> > diff --git
> > a/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> > b/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> > new file mode 100644
> > index 000000000000..534b2a9340ce
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # #
> > +Copyright (c) 2018 Google LLC # # Copyright (c) 2021 Aspeed
> > +Technology Inc.
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/soc/aspeed/uart-routing.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Aspeed UART Routing Controller
> > +
> > +maintainers:
> > +  - Oskar Senft <osk@google.com>
> > +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > +
> > +description:
> > +  The Aspeed UART routing control allow to dynamically route the
> > +inputs for
> > +  the built-in UARTS and physical serial I/O ports.
> > +
> > +  This allows, for example, to connect the output of UART to another U=
ART.
> > +  This can be used to enable Host <-> BMC communication via UARTs,
> > + e.g. to  allow access to the Host's serial console.
> > +
> > +  This driver is for the BMC side. The sysfs files allow the BMC
> > + userspace  which owns the system configuration policy, to configure
> > + how UARTs and  physical serial I/O ports are routed.
> > +
> > +  Two types of files, uart* and io*, are presented in sysfs. The
> > + uart*  configures the input signal of a UART controller whereas io*
> > + configures  that of a physical serial port.
> > +
> > +  When read, each file shows the list of available options with
> > + currently  selected option marked by brackets "[]". The list of
> > + available options  depends on the selected file.
> > +
> > +  e.g.
> > +  cat
> > + /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> > +  [io1] io2 io3 io4 uart2 uart3 uart4 io6
> > +
> > +  In this case, UART1 gets its input from IO1 (physical serial port 1)=
.
>=20
> This is about documenting the hardware, not an OS driver.
>=20
> sysfs files have their own documentation.
>=20

Understood. I will remove this sysfs description from bindings in the next =
revision.
Thanks.

Chiawei

