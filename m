Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6041257B33
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 16:22:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgC8c4g6TzDq9y
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:22:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=dWt5e0Eu; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=dWt5e0Eu; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgC5Y0Vc2zDqSr
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 00:19:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598883593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+yB9Lnlf3oi9VRJWFa5740FH4XMZ9zPZPXByP+3ybU=;
 b=dWt5e0EuOMhxxEKc73Xw62Dfvtzl2GEaI0WQB2OjdL6Hpw9dOWarcDPS69fNloQUoVrSpS
 /SfsbwdJtdT+o2vx9PHKTLrchVuH2CQ0Xf/9qBGU34d55e5gC6Dn/scaGqe3NOPm2MrD7i
 sbKw3BThNundSYWzIkjANkQMzNQKO/U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598883593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+yB9Lnlf3oi9VRJWFa5740FH4XMZ9zPZPXByP+3ybU=;
 b=dWt5e0EuOMhxxEKc73Xw62Dfvtzl2GEaI0WQB2OjdL6Hpw9dOWarcDPS69fNloQUoVrSpS
 /SfsbwdJtdT+o2vx9PHKTLrchVuH2CQ0Xf/9qBGU34d55e5gC6Dn/scaGqe3NOPm2MrD7i
 sbKw3BThNundSYWzIkjANkQMzNQKO/U=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-U-lV3DYGM3KoOq_gH2i7cw-1; Mon, 31 Aug 2020 10:19:50 -0400
X-MC-Unique: U-lV3DYGM3KoOq_gH2i7cw-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 31 Aug 2020 07:19:48 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 31 Aug 2020 07:19:48 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQAp4sAAAAeh65A=
Date: Mon, 31 Aug 2020 14:19:47 +0000
Message-ID: <67f35707fd1844cea64708f64f41224e@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200831105718.o2ic4dvqhde5qrh7@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20200831105718.o2ic4dvqhde5qrh7@thinkpad.dyn.fuzziesquirrel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We are building a separate port for Tioga Pass, so the question is should b=
e not call it tiogapass?

> -----Original Message-----
> From: openbmc [mailto:openbmc-
> bounces+bruce_mitchell=3Dphoenix.com@lists.ozlabs.org] On Behalf Of
> Brad Bishop
> Sent: Monday, August 31, 2020 03:57
> To: Bruce Mitchell
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: When building OpenBMC . . . ?
>=20
> On Sun, Aug 30, 2020 at 10:02:41PM +0000, Bruce Mitchell wrote:
> >When selecting Target hardware
> https://github.com/openbmc/openbmc#3-target-your-hardware
> >to build for the is a tiogapass, now if I add a meta-phoenix/meta-
> tiogapass/conf  how does
> >=09source setup tiogapass build
> >know which tiogapass to build?
>=20
> Are there two different systems called tiogapass?  I hope we are not
> creating two distinct sets of bitbake metadata for the same system?
>=20
> -brad

