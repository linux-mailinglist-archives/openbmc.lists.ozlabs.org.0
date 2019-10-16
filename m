Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE742D95C8
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 17:37:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tbyf59PBzDqkJ
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:37:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.b="Ii7Wlr1o"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tbxg70nxzDqjb
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 02:36:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1571240193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J/NKN+dyCTUcKIQLwWUTgZRepRMKDCvKdvVYgEQGsD0=;
 b=Ii7Wlr1oGl6D0O993IFnMU47ogHlXLzzwKPIuOxuWiOCYSiJURDF55ZYqwXpsBihc9t/hS
 IXW3mw/tbHVMgpB77euEIIS99GrPwSxl7DCR9sZ5bOXA1JIRGbaMbTY7a1znMW9v29KALU
 fPyldDGI89tGFIgi9DbQVf1uEMn53O0=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-6ExEn7KeME6K_l-8Kx1uOQ-1; Wed, 16 Oct 2019 11:36:31 -0400
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 16 Oct 2019 08:36:29 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 16 Oct 2019 08:36:23 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: "andrew@aj.id.au" <andrew@aj.id.au>
Subject: RE: Recommendations for development platforms for the ASPEED AST2500
 & AST2600?
Thread-Topic: RE: Recommendations for development platforms for the ASPEED
 AST2500 & AST2600?
Thread-Index: AdWENzDUn0M5gBJVT3uoYEw0J2tLWg==
Date: Wed, 16 Oct 2019 15:36:23 +0000
Message-ID: <b4ad804a513048e4bc8df7ff9cb8598b@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.170]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: 6ExEn7KeME6K_l-8Kx1uOQ-1
X-Mimecast-Spam-Score: 1
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Andrew,

> Hi Bruce
>=20
> On Wed, 16 Oct 2019, at 05:14, Bruce Mitchell wrote:
> > =20
> > Hello,
> >=20
> >=20
> > I am Bruce Mitchell and I work for Phoenix Technologies Ltd. as a BMC=
=20
> > firmware Engineer.
> >=20
> > Phoenix Technologies Ltd. is developing an OpenBMC=20
> > (https://www.openbmc.org/ , not the Facebook flavor) product.
>=20
> FYI, the projects have united (and the result lives under the Linux Found=
ation).

It seems the people at American Portwell Technology do not actually know th=
at
When I enquired about their Neptune Alpha OpenBMC development kit
https://portwell.com/solutions/openBMC.php

> >=20
> > Our intent is also to be a valuable contributing member to the OpenBMC =
project.
>=20
> Great! Looking forward to your contributions.
>=20
> >=20
> >=20
> > We will be initially developing for the ASPEED Technology Inc. AST2500=
=20
> > followed by the AST2600 BMC SoC.
> >=20
> > Do you have any suggestion of available hardware development platforms=
=20
> > for the ASPEED AST2500 & AST2600?
>=20
> Unfortunately there isn't anything that is both cheap and easy to acquire=
 that I'm aware of. Hopefully others can chime in if they know things that =
I don't, but this is an issue that's cropped up in the past and hasn't been=
 resolved.
>=20
> I think the cheapest anyone has found was a system (motherboard, cheap x8=
6-64 CPU and RAM) that was about $800AU, but I'd have to dig out the detail=
s on what that was exactly (and it may have been AST2400-based).

Easily affordable is desirable, but easy to acquire is of more importance p=
resently.

>=20
> Sorry I don't have better answers.
>=20
> Andrew

Thank you.

--
Bruce

