Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5221046F8
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 00:29:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JJmy0vCrzDqvy
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 10:29:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.b="Nk3KK5fN"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JJmL4Sw2zDqld
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 10:28:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1574292526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hcuPZqzRAPfHqWjxX410u9VnndLT4qx7HiYBX2nd4o=;
 b=Nk3KK5fNfVjqm+O5cixCFSxdy/pbKoNoBhbP2bhLBpvKxLiFsnBKacPHdqygMFHylKkA67
 qCj8zk+iswISC5l8FfMoPWOECRzZ+4AXrHIHBtoVF6HzrgY22Lp7XsrR7kJZVMg0L6mffk
 9EQbb60ERp59eOJp3PvYKFgF5qaqWso=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-JSYY6hoqOFOGhXH7YYzLjA-1; Wed, 20 Nov 2019 18:28:44 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 20 Nov 2019 15:28:31 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 20 Nov 2019 15:28:31 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Is Intel-BMC/openbmc https://github.com/Intel-BMC/openbmc being
 kept up-to-date?
Thread-Topic: Is Intel-BMC/openbmc https://github.com/Intel-BMC/openbmc being
 kept up-to-date?
Thread-Index: AdWf9z6RqRYRNKz8QQyDIwxVpkVDRgAQ9IQAABA+gPA=
Date: Wed, 20 Nov 2019 23:28:30 +0000
Message-ID: <30e9571340a546ee83d9d5afa1251bd5@SCL-EXCHMB-13.phoenix.com>
References: <d410e08e4d1b48a5831f1af784f76a99@SCL-EXCHMB-13.phoenix.com>
 <54b60348-ca89-9801-7101-0926e56fd5ad@linux.intel.com>
In-Reply-To: <54b60348-ca89-9801-7101-0926e56fd5ad@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: JSYY6hoqOFOGhXH7YYzLjA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

No problem.

Thank you Jason!

> -----Original Message-----
> From: openbmc [mailto:openbmc-
> bounces+bruce_mitchell=3Dphoenix.com@lists.ozlabs.org] On Behalf Of Bills=
,
> Jason M
> Sent: Wednesday, November 20, 2019 15:13
> To: openbmc@lists.ozlabs.org
> Subject: Re: Is Intel-BMC/openbmc https://github.com/Intel-BMC/openbmc
> being kept up-to-date?
>=20
>=20
>=20
> On 11/20/2019 3:07 PM, Bruce Mitchell wrote:
> > Is Intel-BMC/openbmc https://github.com/Intel-BMC/openbmc being
> kept up-to-date?
> > It seems openbmc/openbmc https://github.com/openbmc/openbmc gets
> merges that are not being merged into Intel-BMC/openbmc.
> Yes, I am responsible for keeping Intel-BMC in sync.  Unfortunately, I
> am a few weeks behind due to some internal issues and priorities.  I am
> working to get back to a normal sync schedule as soon as possible.
>=20
> Thanks,
> -Jason
>=20
> >
> > Thanks!
> >

