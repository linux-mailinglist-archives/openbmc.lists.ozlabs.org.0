Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF453CC3AD
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 15:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRqM93wj9z3bP0
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 23:53:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 306 seconds by postgrey-1.36 at boromir;
 Sat, 17 Jul 2021 23:53:11 AEST
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRqLv2cSsz2yNq
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jul 2021 23:53:10 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-18-c9JPzhnSOuerytt2WipVKQ-1; Sat, 17 Jul 2021 14:46:18 +0100
X-MC-Unique: c9JPzhnSOuerytt2WipVKQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Sat, 17 Jul 2021 14:46:16 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Sat, 17 Jul 2021 14:46:15 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Eddie James' <eajames@linux.ibm.com>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
Subject: RE: [PATCH 0/2] spi: fsi: Reduce max transfer size to 8 bytes
Thread-Topic: [PATCH 0/2] spi: fsi: Reduce max transfer size to 8 bytes
Thread-Index: AQHXekgD/1pxtg9xfUiNUvFFS56Yj6tHLOmA
Date: Sat, 17 Jul 2021 13:46:15 +0000
Message-ID: <0ed7c393b7aa4252a48cd2397ac251eb@AcuMS.aculab.com>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
In-Reply-To: <20210716133915.14697-1-eajames@linux.ibm.com>
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Eddie James
> Sent: 16 July 2021 14:39
>=20
> The security restrictions on the FSI-attached SPI controllers have
> been applied universally to all controllers, so the controller can no
> longer transfer more than 8 bytes for one transfer. Refactor the driver
> to remove the looping and support for larger transfers, and remove the
> "restricted" compatible string, as all the controllers are now
> considered restricted.

Aren't there significant performance (and device wear?) penalties
for doing short SPI eeprom writes?

IIRC (and I'm not getting my serial busses confused) a write request
can request an aligned transfer of up to (typically) 32 bytes.
At which point you need to wait for the status to indicate 'complete'.

So restricting writes to 8 bytes increases block write times
by a factor of 4.

Increasing the numbers of writes by a factor or 4 may also have
an effect on device wear - but that is more likely only affected
by erase cycles.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

