Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF699389D2A
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 07:42:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlzCq67k2z2yyG
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 15:42:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=c/3/i6wx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.135;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=c/3/i6wx; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320135.outbound.protection.outlook.com [40.107.132.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlzCT24KWz2yZF;
 Thu, 20 May 2021 15:42:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7uYtUAUYmnNI1ENSX+pn1lKUGAS6G1tO8D59RupbJHQjqVR4W+w7KRivP8p/JZ07OOmD12wadtv1M8Gq8Ko4D7vOlKXXiI0UNpU+/fIhzobi7mc3ftF+kC7ARZfMs78Cz3ZRefGyiBhonFhj0VJHGkxj1+Zcijssy7hytd8rzMEwduAL5lRSS9yJMs7gxufXO8pvROZEZg7jRmDAth36YsHlj8JT1BY7IF5+RLV0KKvcCiNUP1kq1J6ZwT8G3kaSkm2JpDCm65DAZUPrrTFCqq9quF/dAJiBRY7soWkIuyBgRvRtv/PcV3bFvTofVkTGijuEuThEzCCPCpBnKK6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/3SRJ8FCXu8V2tvPfVoC60epu67wcgptR9TLtpRjfI=;
 b=Guquf1CM0+y2Ii4DwNpyaSnhFHC9CDMgDRLrjEtGHhMMTV1VSPCSLphjKLzx+9bUCvwqtOGgCjAZMKpjvwYBXMMjP//0QSnLmOPbl63Ak8wo+2yGcUkAo5Z2E4WEARZrxUGfPbMJRgu8FZGJdLrkucIXDDgZDPayj7g3Ed5uiJ/W9ZrfcxE1eLLWriK4o/apt0jP6Vr+d+epd7FGW6QQ2XJ1AnOqp7oJyayKK4ufRsqMnJ6bKSwujwk6TeLXhz7iTi0DrMsyGnKbaDvebkrdoSGsSAoTVFQ8jByuCO240eOWrBYLf1zM5TK1kbH/JogJgCL9vYbiVsnx89xf0ZhqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/3SRJ8FCXu8V2tvPfVoC60epu67wcgptR9TLtpRjfI=;
 b=c/3/i6wxKkDoZiCRXi4fCq0HBJGiy27YYx+k3d3IB8HT5XJfaPc0Q2+DvX2ZGTqQGPIi/WxfEKNdaOJqarwSjjKjcSNZvZjUT7QGqmcgoVC0RczP8ERgSY395bHRVVVAGwFxjrfmPLznO2tqSPN9B/nZ59lK7b3+t8BPZCpArC2QYICFhwdyABCTg5uQz+uvI+33ZrZNaWsvpIBokrUkU1SBI8jy4Y7quiT1PlInY/mqQutbGlQhFU0Wp8UcoY8NR/IUna/MGAKMUfMpDQzLenoktSRB8lw5KoCRSP09scj91zxC7mtvfUrh03PzSn6e3MRtvIY9Go3FSBXGOUphnw==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2609.apcprd06.prod.outlook.com (2603:1096:203:5c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 05:42:20 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::2857:6a28:1dc4:bb22]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::2857:6a28:1dc4:bb22%7]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 05:42:20 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Jiri Slaby <jirislaby@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] serial: 8250: Add UART_BUG_TXRACE workaround for
 Aspeed VUART
Thread-Topic: [PATCH v3 1/2] serial: 8250: Add UART_BUG_TXRACE workaround for
 Aspeed VUART
Thread-Index: AQHXTR3L3D+caQgPYkCb4th2c2TeyKrr1qeAgAAEfSA=
Date: Thu, 20 May 2021 05:42:19 +0000
Message-ID: <HK0PR06MB37798367F3F0321B15395DD3912A9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210520021334.497341-1-andrew@aj.id.au>
 <20210520021334.497341-2-andrew@aj.id.au>
 <b8eed269-f30d-af69-dbc2-c9fa70009091@kernel.org>
In-Reply-To: <b8eed269-f30d-af69-dbc2-c9fa70009091@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1acb4dc4-d99b-4485-2e28-08d91b5208fd
x-ms-traffictypediagnostic: HK0PR06MB2609:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2609610A70F0675458B67A32912A9@HK0PR06MB2609.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XRQ+AD8sNabvR/7dMO00ZFxqd2ZLcbi+WQtpHRb2GELgUFxemSEBcflIhhon5s4EvKxLKPCLXXs21rz0iNJoN1HqpQz2lxRLPbWgI/nk5mLPnAiq4FBEpJ48JhOpyZ5IGM6kAkRmZrrDBEsm8sVXU97czd4qnKvuqR2LIGhoda+mlXD9+rGGxMytJV3iKizH9FUQ83qul1NwA3olx2zkoKhh6kRuupYE5VlJrcyVduRNw7vwjgUgImPZ4JIh5eRCAlP0ImTlMf7fBTwqFqPC6aulR92BoQq9hBt5deKjvCPByQpgfJBBSohqCVIWwnYGlXP+llUAXjfJogLyJzfWlPP7hf2Jk7aWaqYQPKsneNRaicxZr4OgPVV979bYdogO5K3nfesK6CzHsvcJI8gqb6HALzMT/8aAT8jDDFaeN6lHi9eyRpK40UBppMrbN/eCy56vMaHHlgiXswc0TEhNze1pBp8Xvtd0ueLIa+WgPy4fLEVQ4+3JEULN5IxbCJAsMXrtcXXj1SayQkM4yrnQqmzM6wwdBgaLFYahRGj+sYmwF0Cjs3bNrHVfv3l6Af+TBm8W1YH7TqVh4nCiKlNhMLEvoMfhVNS+fUnu0g0O1H0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(396003)(376002)(346002)(366004)(136003)(76116006)(26005)(83380400001)(33656002)(66946007)(71200400001)(66476007)(66556008)(66446008)(316002)(64756008)(122000001)(38100700002)(478600001)(52536014)(54906003)(110136005)(86362001)(4326008)(8676002)(186003)(5660300002)(7696005)(6506007)(55236004)(7416002)(9686003)(2906002)(55016002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +tzVt0YRygj5lC/b5zQQso8Mn3mcwu5JjMjAfcdvKDkKDmPA6/pBHqnnBRdkWh0jhbNg/tTAJo9PDhhokdg4lhIXmd/iwX5H4MO+PWNgtrMxAgGpAoWD2USdX3U4sBFL7rlGXSNfDbj+4srgcYlM4lpSuIZd7JxnVbElXj9OXI8cMwhzagMK/4NYQCdmLd63+wG7EIYvRBtJXsOQgd59r30xfFaSzNwXAe95TpYpq66z3SZsXx0hAwL12BU+dXwZMN4gTZXxvMZfmMX0OjYitk8v+Gp7aHSzcY3snhzxyl7YtcKLa4GrdH2YwxBskbDsKRKX/S1Lhw2hHdEe0g6tCNrHLbC5hIiLDi7yOkSAqOrkBVBIPkCd8EUf6F/KrmSBl0Rp38BpsveG1ZYGF6735AfFfIozdMsTrGSF1dUUimRKSEtfC40/qvtVsx5YSu4L4kUAGnGXcLf8jQ/bnSjcxCxDX4Tw1Kb4fjsDQm08mFIWQKG5p0gPjOQgeOydrEYQMvS8KpAtfTRBV9wXgGD/fEMHFvK57dWlDDUVjsW/4hotBtATT7sO5CxQWUqpxsGJQA6zsnSB3Lj0FoKcN7RlSAtkCdZbRap+JKkY6h6lrxHCgkhtD1iyNj/eaTxL1GzCdkN88M45Gi/jyhd/mvxCc/+WBOhRAlWnTIcDOKHpiTxISEe0bBztdHnG1OfYvz2VyGzgysHuX9S+N0mla2iFkFmGnj8yENO2EmbB7jt2l9s=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acb4dc4-d99b-4485-2e28-08d91b5208fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 05:42:20.0335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtclwWqvrMzXYg77GQTnKV+P/ZERAzoS5c5GfhxQTZe2tCcY1i0D8/ErTSiIAEoXwA/P7fXgTXBSoHmiVCzKArzLKfc4jmLgr0pYEYeb3Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2609
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Jiri Slaby <jirislaby@kernel.org>
> Sent: Thursday, May 20, 2021 1:25 PM
>=20
> On 20. 05. 21, 4:13, Andrew Jeffery wrote:
> > Aspeed Virtual UARTs directly bridge e.g. the system console UART on
> > the LPC bus to the UART interface on the BMC's internal APB. As such
> > there's no RS-232 signalling involved - the UART interfaces on each
> > bus are directly connected as the producers and consumers of the one
> > set of FIFOs.
> >
> > The APB in the AST2600 generally runs at 100MHz while the LPC bus
> > peaks at 33MHz. The difference in clock speeds exposes a race in the
> > VUART design where a Tx data burst on the APB interface can result in
> > a byte lost on the LPC interface. The symptom is LSR[DR] remains clear
> > on the LPC interface despite data being present in its Rx FIFO, while
> > LSR[THRE] remains clear on the APB interface as the host has not
> > consumed the data the BMC has transmitted. In this state, the UART has
> > stalled and no further data can be transmitted without manual intervent=
ion
> (e.g.
> > resetting the FIFOs, resulting in loss of data).
> >
> > The recommended work-around is to insert a read cycle on the APB
> > interface between writes to THR.
> >
> > Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

Tested-by: ChiaWei Wang <chiawei_wang@aspeedtech.com>

>=20
> > ---
> >   drivers/tty/serial/8250/8250.h              |  1 +
> >   drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
> >   drivers/tty/serial/8250/8250_port.c         | 12 ++++++++++++
> >   3 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250.h
> > b/drivers/tty/serial/8250/8250.h index 52bb21205bb6..34aa2714f3c9
> > 100644
> > --- a/drivers/tty/serial/8250/8250.h
> > +++ b/drivers/tty/serial/8250/8250.h
> > @@ -88,6 +88,7 @@ struct serial8250_config {
> >   #define UART_BUG_NOMSR	(1 << 2)	/* UART has buggy MSR status
> bits (Au1x00) */
> >   #define UART_BUG_THRE	(1 << 3)	/* UART has buggy THRE
> reassertion */
> >   #define UART_BUG_PARITY	(1 << 4)	/* UART mishandles parity if FIFO
> enabled */
> > +#define UART_BUG_TXRACE	(1 << 5)	/* UART Tx fails to set remote DR
> */
> >
> >
> >   #ifdef CONFIG_SERIAL_8250_SHARE_IRQ
> > diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > index a28a394ba32a..4caab8714e2c 100644
> > --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > @@ -440,6 +440,7 @@ static int aspeed_vuart_probe(struct
> platform_device *pdev)
> >   	port.port.status =3D UPSTAT_SYNC_FIFO;
> >   	port.port.dev =3D &pdev->dev;
> >   	port.port.has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
> > +	port.bugs |=3D UART_BUG_TXRACE;
> >
> >   	rc =3D sysfs_create_group(&vuart->dev->kobj,
> &aspeed_vuart_attr_group);
> >   	if (rc < 0)
> > diff --git a/drivers/tty/serial/8250/8250_port.c
> > b/drivers/tty/serial/8250/8250_port.c
> > index d45dab1ab316..fc5ab2032282 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -1809,6 +1809,18 @@ void serial8250_tx_chars(struct uart_8250_port
> *up)
> >   	count =3D up->tx_loadsz;
> >   	do {
> >   		serial_out(up, UART_TX, xmit->buf[xmit->tail]);
> > +		if (up->bugs & UART_BUG_TXRACE) {
> > +			/*
> > +			 * The Aspeed BMC virtual UARTs have a bug where data
> > +			 * may get stuck in the BMC's Tx FIFO from bursts of
> > +			 * writes on the APB interface.
> > +			 *
> > +			 * Delay back-to-back writes by a read cycle to avoid
> > +			 * stalling the VUART. Read a register that won't have
> > +			 * side-effects and discard the result.
> > +			 */
> > +			serial_in(up, UART_SCR);
> > +		}
> >   		xmit->tail =3D (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
> >   		port->icount.tx++;
> >   		if (uart_circ_empty(xmit))
> >
