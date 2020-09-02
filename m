Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C35425B4C2
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 21:51:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhZLb1c7SzDr0y
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 05:51:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=DitPAd4V; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=FYrjxbVC; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhZKm3D5QzDqys
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 05:50:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599076216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2/0u+SeZYyAReu/Bl+/wgSvYVlt6XvP9DpUvkrFU9E=;
 b=DitPAd4V6AdGG4SrjL7xSag+OT4483lOKaLXTBN0TAJcPp9oz/8Ycc0jC0R0AA5kdyvf7z
 eRkVZTxvXFqrd+92j3TllQm9Fi8H9v4RmEUqLHpIxSV1HCs/vZl5+AlAvrBG/NxBjekZa5
 Vim38He3OOkfMvN7tRV363lfva1jouw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599076217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2/0u+SeZYyAReu/Bl+/wgSvYVlt6XvP9DpUvkrFU9E=;
 b=FYrjxbVCxzQ47I204o64QwVhDwab7CWkxLII7pGPixolIQ0ZBTVJCreR5MI2ok0xFuzXvD
 FHZbSwNhe+RBcR06RHdBzO7Ctu0d6+t1tjIUEHVMiHSa+8P1eHGXNT2AbHUI54mgSlSAc4
 m89WdsdTpOeg/5hsZzW5laIkMlr80Ho=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-r4jl8gf6MCmL_BwkNliBFQ-1; Wed, 02 Sep 2020 15:50:10 -0400
X-MC-Unique: r4jl8gf6MCmL_BwkNliBFQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 2 Sep 2020 12:50:08 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 2 Sep 2020 12:50:08 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQBfNdqAAAffPIAAKQSfMAAPlimAAA2UOxA=
Date: Wed, 2 Sep 2020 19:50:07 +0000
Message-ID: <5455ced096a74069b08230ad9a46a945@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
 <2249bb47512947dab406345cfee1206d@SCL-EXCHMB-13.phoenix.com>
 <20200902191019.GY3532@heinlein>
In-Reply-To: <20200902191019.GY3532@heinlein>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.166.255]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>, Ed Tanous <ed@tanous.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

=20
> On Wed, Sep 02, 2020 at 06:50:01PM +0000, Patrick Voelker wrote:
> > I'm giving the first option below a try.  I've defined an alternative v=
ariant
> and have included the meta-facebook/meta-tiogapass layer in my build.
> >
> > One problem I'm running into is that meta-tiogapass includes a
> rsyslog*.bbappend and one of the other layers I'm using also has a simila=
r
> rsyslog*.bbappend.
> >
> > Each do an append to do_install() and each one tries to remove
> ${D}${sysconfdir}/rsyslog.d/imjournal.conf.  Of course that file can only=
 be
> removed once so the build fails.
> >
> > My question now, is what's the best way to work around this?  I don't n=
eed
> rsyslog from meta-tiogapass, just the machine specifics.
>=20
> If this is a common pattern, we should try to contribute it upstream to Y=
octo
> as a PACKAGECONFIG option.  Then we can add to the PACKAGECONFIG in
> the bbappend (you can do that as many times as you want).
>=20
> If we don't think Yocto would accept it, or they reject it, but it is sti=
ll
> something we're seeing often in our systems we can similarly add it as a
> common bbappend in meta-phosphor (ideally triggered by a
> PACKAGECONFIG).

Thanks for the response but I'm having a hard time connecting the dots.

My understanding of PACKAGECONFIG is that it's a way to provide build optio=
ns for individual packages.  In this case, what PACKAGECONFIG option would =
we be contributing?

Is there a way now for me to force bitbake to ignore (or not use) rsyslog*.=
bbappend in meta-tiogapass from another layer?

The two appends that are conflicting are:
meta-facebook/meta-tiogapass/recipes-extended/rsyslog/rsyslog_%.bbappend
meta-intel/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend

Can I choose one over the other instead of having them build upon eachother=
?

