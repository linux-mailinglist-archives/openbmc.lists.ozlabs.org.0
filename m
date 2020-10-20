Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E9E29470D
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 05:42:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGGXk5RQSzDqRj
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 14:42:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
X-Greylist: delayed 102 seconds by postgrey-1.36 at bilbo;
 Wed, 21 Oct 2020 00:17:05 AEDT
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFvKs1PQwzDqdV
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 00:17:04 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-91-WlibNx1BNMemSMrpm2jZzw-1; Tue, 20 Oct 2020 14:15:12 +0100
X-MC-Unique: WlibNx1BNMemSMrpm2jZzw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 20 Oct 2020 14:15:12 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 20 Oct 2020 14:15:12 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dylan Hung' <dylan_hung@aspeedtech.com>, Jakub Kicinski
 <kuba@kernel.org>, Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH] net: ftgmac100: Fix missing TX-poll issue
Thread-Topic: [PATCH] net: ftgmac100: Fix missing TX-poll issue
Thread-Index: AQHWper5b6m5IMpmJk2Uyk3yAiWzCqmen8qAgACopgCAALYZ4IAAd6yw
Date: Tue, 20 Oct 2020 13:15:11 +0000
Message-ID: <f75555e09d47476a871669ffe017c4f8@AcuMS.aculab.com>
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
 <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
 <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <PS1PR0601MB1849166CBF6D1678E6E1210C9C1F0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
In-Reply-To: <PS1PR0601MB1849166CBF6D1678E6E1210C9C1F0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 21 Oct 2020 14:42:11 +1100
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Po-Yu Chuang <ratbert@faraday-tech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Dylan Hung
> Sent: 20 October 2020 07:15
>=20
> > -----Original Message-----
> > From: Jakub Kicinski [mailto:kuba@kernel.org]
> >
> > On Mon, 19 Oct 2020 08:57:03 +0000 Joel Stanley wrote:
> > > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > index 00024dd41147..9a99a87f29f3 100644
> > > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > @@ -804,7 +804,8 @@ static netdev_tx_t
> > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> > > >          * before setting the OWN bit on the first descriptor.
> > > >          */
> > > >         dma_wmb();
> > > > -       first->txdes0 =3D cpu_to_le32(f_ctl_stat);
> > > > +       WRITE_ONCE(first->txdes0, cpu_to_le32(f_ctl_stat));
> > > > +       READ_ONCE(first->txdes0);
> > >
> > > I understand what you're trying to do here, but I'm not sure that thi=
s
> > > is the correct way to go about it.
> > >
> > > It does cause the compiler to produce a store and then a load.
>=20
> Yes, the load instruction here is to guarantee the previous store is inde=
ed
> pushed onto the physical memory.

That rather depends where the data is 'stuck'.

An old sparc cpu would flush the cpu store buffer before the read.
But a modern x86 cpu will satisfy the read from the store buffer
for cached data.

If the write is 'posted' on a PCI(e) bus then the read can't overtake it.
But that is a memory access so shouldn't be to a PCI(e) address.

Shouldn't dma_wb() actually force your 'cpu to dram' queue be flushed?
In which case you need one after writing the ring descriptor and
before the poke of the mac engine.

The barrier before the descriptor write only needs to guarantee
ordering of the writes - it can probably be a lighter barrier?

It might be that your dma_wmb() needs to do a write+read of
an uncached DRAM location in order to empty the cpu to dram queue.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

