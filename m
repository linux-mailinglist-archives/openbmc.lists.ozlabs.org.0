Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E76F259A4E
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:48:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgtLY2t5mzDqLX
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:48:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=V26wZv3Y; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=V26wZv3Y; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgswj23NfzDqWs
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:29:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598977777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBGbaoMuzq6I02mg4ODTmLQPFe4KyMPsW7nWKamFvl0=;
 b=V26wZv3YvvJuDzDkduVQmOo0/i8enGs9llejQ9+PtaWMJzmlT+nnYAHRkrSyY5sK9F5WkA
 G/8ZDnvSHcVDVDxieCI5Yv+Ht81b52tVjs6YguknPZ/npS5PcrxgYSf1s5CwJrcCwPTu30
 liDfT3HktfM/46YaxoxvowA/pX43Rv4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598977777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBGbaoMuzq6I02mg4ODTmLQPFe4KyMPsW7nWKamFvl0=;
 b=V26wZv3YvvJuDzDkduVQmOo0/i8enGs9llejQ9+PtaWMJzmlT+nnYAHRkrSyY5sK9F5WkA
 G/8ZDnvSHcVDVDxieCI5Yv+Ht81b52tVjs6YguknPZ/npS5PcrxgYSf1s5CwJrcCwPTu30
 liDfT3HktfM/46YaxoxvowA/pX43Rv4=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-FnMpkzpzPuazHp0xtUW_AQ-1; Tue, 01 Sep 2020 12:29:35 -0400
X-MC-Unique: FnMpkzpzPuazHp0xtUW_AQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 1 Sep 2020 09:29:33 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 1 Sep 2020 09:29:33 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Patrick Williams <patrick@stwcx.xyz>, Ed Tanous <ed@tanous.net>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQBfNdqAAAffPIAAAGEogAAOXiuQ
Date: Tue, 1 Sep 2020 16:29:32 +0000
Message-ID: <60f44a2153514db0a539207bf6f45a12@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
 <20200901162025.GS3532@heinlein>
In-Reply-To: <20200901162025.GS3532@heinlein>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.131]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0.002
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

Thanks again Patrick, I see your point and will that up with our team as we=
ll.


> -----Original Message-----
> From: Patrick Williams [mailto:patrick@stwcx.xyz]
> Sent: Tuesday, September 1, 2020 09:20
> To: Ed Tanous
> Cc: Bruce Mitchell; openbmc@lists.ozlabs.org
> Subject: Re: When building OpenBMC . . . ?
>=20
> On Tue, Sep 01, 2020 at 09:09:33AM -0700, Ed Tanous wrote:
> > On Tue, Sep 1, 2020 at 5:26 AM Patrick Williams <patrick@stwcx.xyz>
> wrote:
> > > On Sun, Aug 30, 2020 at 10:02:41PM +0000, Bruce Mitchell wrote:
> > >
> > > #2 should go into either meta-facebook (or the underlying code
> > > repository where the fix is needed).  These will be common for any
> >
> > +1
> >
> > Could we also make the statement that as a project, we will enable
> > every platform feature we are able to for every platform by default,
> > and if a company wants to specifically disable some features for their
> > use because they haven't vetted them, they should do that in a
> > specific distro?  Said another way, the "default" for every machine
> > should be every feature enabled, as that's what helps users and
> > developers the most.
>=20
> I think this is where we get some conflict between, for lack of better
> words, commercial and hyperscale philosphies.  We may make a decision
> that we don't want net-ipmi in our datacenter, for security reasons, so
> we have it disabled in our meta-facebook layer.  Yes, we could disable it
> dynamically like a customer of a commercial vendor might do, but it is
> simpler to not even have the code in the image.
>=20
> Today we've combined machine definition and image definition into a
> single meta-layer across the board.  This is probably reasonable for a
> single vendor who designs their own machine in-house, but is less
> reasonable for cases like Facebook where we do our work within OCP
> and others can order the servers we've designed from various ODMs.
>=20
> --
> Patrick Williams

