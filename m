Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02A2E18AE
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 06:59:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D12bN01qwzDqTD
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 16:59:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.119;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300119.outbound.protection.outlook.com [40.107.130.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D12ZP5sqjzDqSR;
 Wed, 23 Dec 2020 16:58:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDebQyBoaxMWqWucWjAc9ki84U8hipGtjUOv6gfofqhNXwb7BaiFB9Fe7/sQIaOwLj9XSMtuNmDXSZzHLW4UMDPXlxymwaG7ZGL8Y0rNo/RiAvAa5/hveEm6iVuJxypoKrHgnshgZN5368KHZslO44bU4914yp7Ia5gFmY49xRVfnSSq6zBv7Dnc7soGHncbXl5fiiS6QredkHvr4PScaqJMS26Pg0zvb+/1l/yvaMxqVxsFGk3RUYcLEPtEiIb9YlDYS9ABUBCYewUXUiU3PHbosO7f8FV1DLcrINFqSJo4L7xwntEKgl62y9Uq3JirWVtHm9kPb0GYRAIMln7oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8kV3mYTLaSVUCHsbZ8LsmY7C/7sNxOyNawsu/Zcfgc=;
 b=EcAJBjRCIKTw0aiVv6G9hPk1fjHU74dBlAlf3CmWXfo8uVuSxLk5wQ9lxg2FQs0MpGoLjPQtjLF//ZLioCcPUKvGKdk6YjQslI/o9dUCn1GhSyjUcz1l6gGyI0jcOYmdDCTMOPZ22ccwVj8YVCclW2+GPYrBdSA1oXGAW0HF+1xd2NjPMwZdn9sgzTAe2QHV/UyAv964He4LaEUP0zOrKIQlTja91rayq9eORmGcLTcxsOtKocadcOjP0YWg3+i1LpXl2FIKqVIhNwq7lNFv5SzT7tCSdqvhtWEDK+kHk8ko8X39Gnasydq3mtrNnioMcX+rJLmuMAVTRqkr3OSfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2834.apcprd06.prod.outlook.com (2603:1096:203:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Wed, 23 Dec
 2020 05:58:20 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::59b4:743d:1470:306f]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::59b4:743d:1470:306f%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 05:58:20 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: RE: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
Thread-Topic: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
Thread-Index: AQHW0o5SCt/jQG9HJ0aOoNGkwIAV56oClgeAgADyOICAAGKHAIAAG/IggAASoICAABySsA==
Date: Wed, 23 Dec 2020 05:58:20 +0000
Message-ID: <HK0PR06MB3380F3C6ABAAD12724397A33F2DE0@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-3-zev@bewilderbeest.net>
 <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
 <20201222191433.3dgnfwyrod4tnvaf@hatter.bewilderbeest.net>
 <CACPK8XeOZEkpAKcyhZLeMdGzbwtFmdGEnL6QXp0VK1HL_O2pSg@mail.gmail.com>
 <HK0PR06MB338018668005D679C51EF69AF2DE0@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <20201223035353.omn5ebut62sb7mxh@hatter.bewilderbeest.net>
In-Reply-To: <20201223035353.omn5ebut62sb7mxh@hatter.bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bewilderbeest.net; dkim=none (message not signed)
 header.d=none;bewilderbeest.net; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2895114-db54-4807-82f4-08d8a707c059
x-ms-traffictypediagnostic: HK0PR06MB2834:
x-microsoft-antispam-prvs: <HK0PR06MB2834F1BC1868CBA1AEF76EEAF2DE0@HK0PR06MB2834.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BU4cY3UiUVluWuVf6Y4M4h6sw/5O9LSIg1f390BtJPtCRsU78r5Z0n/ZAjwhSb3MnaOAXfJAyAwWySuFP9jaYc46j7z/iOOrPrVeQ/u7h82I6idX+mcd6ETpHtIuGqyAEtOYBoyKDqD9WFn0si6BXR3HSx/1DQLXdfgp1eEr2FBQ0hNZM0SpbvKKOd1iaZR/bSQ7khXvlvPDWXO53i4mRxTayzXDACZHkq3gEvJlRnc9HvBRr+H/ID97TmzgdQlqybaVeVA9serlco3Fal1qYOhZwptnhBWN2JUgGfiNqt9qOw6L8a3qU7uIp4ehXOgsQ5H4xG3Uqg4BqSWOI2S3diSP+zy5dxg2BqAKEa9ojgxYJ6m35zOEUKH/KhRAkmaxgRsdrjwGW+PKQBAAV1sKlA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(396003)(136003)(376002)(346002)(366004)(478600001)(6506007)(83380400001)(33656002)(7696005)(53546011)(7416002)(6916009)(8936002)(66556008)(316002)(54906003)(8676002)(66446008)(64756008)(76116006)(2906002)(5660300002)(71200400001)(4326008)(55236004)(86362001)(52536014)(66476007)(66946007)(186003)(26005)(55016002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+tJWikKp09WM9av0GfpsQYsxbpbqKTxYvS09NgUZMiMRQmQ4cdZHOSgo3Hjc?=
 =?us-ascii?Q?KlDUGADPd8Ui+lQtEpvMcwDnR2nrA5GyCOco1/9JJZqDgprn77bBpnB+Nxtt?=
 =?us-ascii?Q?Ada4xCSepQmTdPQFI25B1D6n3NwpDXe72/ritqrTfyQwKW1hGQQFNBnKHq5/?=
 =?us-ascii?Q?D6cmQwSL51gAEYVNcIYKX/sY/JnpkJuAOjA2GeoprZ+18AFijZMEwAII7+Y6?=
 =?us-ascii?Q?MhckUoOsi51uRV+f9bOWSlo7y3Zvgic/t0tvoraVxCdXvxVX0uF2HU9aphI8?=
 =?us-ascii?Q?dPM0/I+pUmYgH5aNhGREZdP6xHFRcVDx/Odk76RC1v5ZgFFDpAiKJp933rnk?=
 =?us-ascii?Q?p9Qdc2p59zOaKEKK+PLvTf3W9RGlFj7CT67oe673JiH089WNqp8ZOrQoCE72?=
 =?us-ascii?Q?rCsvXCRdOz6LhCinXW/OSA+qd3T9fqfBreyO382M50+w9xb4dBKOBHcrgOHa?=
 =?us-ascii?Q?2YezvOvc72S/arXBdn6EKqMDVqvkTsWBLxSLOHxCVI7pQbRYhbV/RgFKLFx8?=
 =?us-ascii?Q?O0bjr5VEmj9w5ldlhzAckVmjArteQNaRqplydbSN1LcFbtKxzybDfx0PJvvZ?=
 =?us-ascii?Q?pY3G9OQUw4yzweuXz/YTQoFEHek3Va1NeUUIShP5O2mIwR+04k3v/0uaDRDM?=
 =?us-ascii?Q?as8hrLWrVVcJujIPykWbMV/H7PCQH6QoBHfXPMcdomdiON85ro74Rd9UxPpH?=
 =?us-ascii?Q?IW66nUdY08oSah7J4Wyu0+uWcQJXzjJfLK0qvNQTfrcKfyPXZVxdMKlNc+WR?=
 =?us-ascii?Q?8+bduKP3GAw4RCrs2yoSCvCWiRkESqmJPIQhdvNXEwbDaaIC2O4w0gkWj5HI?=
 =?us-ascii?Q?DkVG6H/zk8djVqhVHH9b344j67vwGhM7AkY7xKQSd+38TIc84PRiJRuA/qac?=
 =?us-ascii?Q?z2GBTsKhA+iowQao4w61rhv6aJ2+/9H2MFiOWhL4b5vzdUlt9dEJGKBgfJX9?=
 =?us-ascii?Q?a4Gq8h53qteKy6wHErCbUL1zuD7gCG855HOSLMk12+k=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2895114-db54-4807-82f4-08d8a707c059
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 05:58:20.5777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoFT/fmLAADYRC0Yo7PQueabXcpootk+9j9ul/R4fWWS0ujILp2djDKRq5rHqEUS1R7+99CRS80cl4dEs17cirkBnkhesO7Bs4QlRrMS4R0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2834
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Zev Weiss <zev@bewilderbeest.net>
> Sent: Wednesday, December 23, 2020 11:54 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>; Eddie James <eajames@linux.ibm.com>;
> Mauro Carvalho Chehab <mchehab@kernel.org>; Andrew Jeffery
> <andrew@aj.id.au>; linux-media@vger.kernel.org; OpenBMC Maillist
> <openbmc@lists.ozlabs.org>; Linux ARM
> <linux-arm-kernel@lists.infradead.org>; linux-aspeed
> <linux-aspeed@lists.ozlabs.org>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>; Jae Hyun Yoo <jae.hyun.yoo@linux.intel.co=
m>
> Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
> unconditionally
>=20
> On Tue, Dec 22, 2020 at 08:53:33PM CST, Ryan Chen wrote:
> >> -----Original Message-----
> >> From: Joel Stanley <joel@jms.id.au>
> >> Sent: Wednesday, December 23, 2020 9:07 AM
> >> To: Zev Weiss <zev@bewilderbeest.net>; Ryan Chen
> >> <ryan_chen@aspeedtech.com>
> >> Cc: Eddie James <eajames@linux.ibm.com>; Mauro Carvalho Chehab
> >> <mchehab@kernel.org>; Andrew Jeffery <andrew@aj.id.au>;
> >> linux-media@vger.kernel.org; OpenBMC Maillist
> >> <openbmc@lists.ozlabs.org>; Linux ARM
> >> <linux-arm-kernel@lists.infradead.org>; linux-aspeed
> >> <linux-aspeed@lists.ozlabs.org>; Linux Kernel Mailing List
> >> <linux-kernel@vger.kernel.org>; Jae Hyun Yoo
> >> <jae.hyun.yoo@linux.intel.com>
> >> Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
> >> unconditionally
> >>
> >> On Tue, 22 Dec 2020 at 19:14, Zev Weiss <zev@bewilderbeest.net> wrote:
> >> >
> >> > On Mon, Dec 21, 2020 at 10:47:37PM CST, Joel Stanley wrote:
> >> > >On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net>
> wrote:
> >> > >>
> >> > >> Instead of testing and conditionally clearing them one by one,
> >> > >> we can instead just unconditionally clear them all at once.
> >> > >>
> >> > >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >> > >
> >> > >I had a poke at the assembly and it looks like GCC is clearing the
> >> > >bits unconditionally anyway, so removing the tests provides no chan=
ge.
> >> > >
> >> > >Combining them is a good further optimization.
> >> > >
> >> > >Reviewed-by: Joel Stanley <joel@jms.id.au>
> >> > >
> >> > >A question unrelated to this patch: Do you know why the driver
> >> > >doesn't clear the status bits in the interrupt handler? I would
> >> > >expect it to write the value of sts back to the register to ack
> >> > >the pending interrupt.
> >> > >
> >> >
> >> > No, I don't, and I was sort of wondering the same thing actually --
> >> > I'm not deeply familiar with this hardware or driver though, so I
> >> > was a bit hesitant to start messing with things.  (Though maybe
> >> > doing so would address the "stickiness" aspect when it does
> >> > manifest.)  Perhaps Eddie or Jae can shed some light here?
> >>
> >> I think you're onto something here - this would be why the status
> >> bits seem to stick until the device is reset.
> >>
> >> Until Aspeed can clarify if this is a hardware or software issue, I
> >> suggest we ack the bits and log a message when we see them, instead
> >> of always ignoring them without taking any action.
> >>
> >> Can you write a patch that changes the interrupt handler to ack
> >> status bits as it handles each of them?
> >>
> >Hello Zev, before the patch, do you met issue with irq handler?
> >[continuous incoming?]
> >
> >In aspeed_video_irq handler should only handle enable interrupt expected=
.
> >   u32 sts =3D aspeed_video_read(video, VE_INTERRUPT_STATUS);
> > + sts &=3D aspeed_video_read(video, VE_INTERRUPT_CTRL);
> >
> >Ryan
> >
>=20
> Hi Ryan,
>=20
> Prior to any of these patches I encountered a problem pretty much exactly=
 like
> what Jae described in his commit message in 65d270acb2d (but the kernel I
> was running included that patch).  Adding the diagnostic in patch #1 of t=
his
> series showed that it was apparently the same problem, just with a differ=
ent
> interrupt that Jae's patch didn't include.
>=20
>  From what you wrote above, I gather that it is in fact expected for the
> hardware to assert interrupts that aren't enabled in VE_INTERRUPT_CTRL?
> If so, I guess something like that would obviate the need for both Jae's =
earlier
> patch and this whole series.
>=20
Yes, I expected handle enabled in VE_INTERRUPT_CTRL.=20

> I think the question Joel raised is somewhat independent though -- if the
> VE_INTERRUPT_STATUS register asserts interrupts we're not actually using,
> should the driver acknowledge them anyway or just leave them alone?
My opinion will keep them alone, ignore them.

> (Though if we're just going to ignore them anyway maybe it doesn't ultima=
tely
> matter very much.)
>=20
>=20
> Zev

