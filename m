Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA3D25B75E
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 01:36:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhgLz3jXmzDr22
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 09:36:43 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=FiEewSLu; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=FiEewSLu; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhgL4455tzDqwf
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 09:35:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599089749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HFYcYC54Z+GnG4Nr/uviIusPa9bdLLy8QnyhBtrb+M=;
 b=FiEewSLuNmB0/ibMkbgSN0ZGEC6R6b/P/GH+4n2GpO6fY/u3Wh9e1bHk3fhWcgQBgwf3hJ
 1OY9iwrimEB18vN+nUsgikhKRHmOw1gVBiR8weQV9U5CGUgdkgJV/aLELQvg7NwynrlJZk
 TFG39fRMVJEfXzJxGmazKWyiZgCVVTY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599089749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HFYcYC54Z+GnG4Nr/uviIusPa9bdLLy8QnyhBtrb+M=;
 b=FiEewSLuNmB0/ibMkbgSN0ZGEC6R6b/P/GH+4n2GpO6fY/u3Wh9e1bHk3fhWcgQBgwf3hJ
 1OY9iwrimEB18vN+nUsgikhKRHmOw1gVBiR8weQV9U5CGUgdkgJV/aLELQvg7NwynrlJZk
 TFG39fRMVJEfXzJxGmazKWyiZgCVVTY=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-qBdVjMK0Ou2lDYs0ApOpJg-1; Wed, 02 Sep 2020 19:35:46 -0400
X-MC-Unique: qBdVjMK0Ou2lDYs0ApOpJg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 2 Sep 2020 16:35:43 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 2 Sep 2020 16:35:43 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQBfNdqAAAffPIAAKQSfMAAPlimAAA2UOxD//70TAIAAVa6w
Date: Wed, 2 Sep 2020 23:35:43 +0000
Message-ID: <bea06db008c343e19d6e91cdc9b41839@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
 <2249bb47512947dab406345cfee1206d@SCL-EXCHMB-13.phoenix.com>
 <20200902191019.GY3532@heinlein>
 <5455ced096a74069b08230ad9a46a945@SCL-EXCHMB-13.phoenix.com>
 <3d601f16-2a80-bbac-d8f2-010e20a8b482@linux.intel.com>
In-Reply-To: <3d601f16-2a80-bbac-d8f2-010e20a8b482@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.204]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: openbmc [mailto:openbmc-
> bounces+patrick_voelker=3Dphoenix.com@lists.ozlabs.org] On Behalf Of Bill=
s,
> Jason M
> Sent: Wednesday, September 2, 2020 2:40 PM
> To: openbmc@lists.ozlabs.org
> Subject: Re: When building OpenBMC . . . ?
<snip>
> > Is there a way now for me to force bitbake to ignore (or not use)
> rsyslog*.bbappend in meta-tiogapass from another layer?
> >
> > The two appends that are conflicting are:
> > meta-facebook/meta-tiogapass/recipes-
> extended/rsyslog/rsyslog_%.bbappend
> > meta-intel/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
> I hit a similar issue when moving this recipe out of my downstream
> build.  I was able to resolve it by putting this change in my downstream
> version:
> diff --git a/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
> b/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
> index 7e282804..ef670451 100644
> --- a/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
> +++ b/meta-common/recipes-extended/rsyslog/rsyslog_%.bbappend
> @@ -17,7 +17,7 @@ do_install_append() {
>           install -d ${D}${systemd_system_unitdir}/rsyslog.service.d
>           install -m 0644 ${WORKDIR}/rsyslog-override.conf \
>=20
> ${D}${systemd_system_unitdir}/rsyslog.service.d/rsyslog-override.conf
> -        rm ${D}${sysconfdir}/rsyslog.d/imjournal.conf
> +        rm -f ${D}${sysconfdir}/rsyslog.d/imjournal.conf
>   }
>=20
>   SYSTEMD_SERVICE_${PN} +=3D " rotate-event-logs.service
> rotate-event-logs.timer"
>=20
> We can apply a similar change to one or both of these upstream recipes.
> Or, is this a candidate for meta-phosphor?

Yes, I think the '-f' argument would be a good option to upstream to both .=
bbappend files.  That would prevent conflict in case they both get used.

Conceptually though it doesn't make sense to keep layering the do_install()=
 instructions in this way.  Is there a way around that?  Or can the meta-fa=
cebook/meta-tiogapass version be moved elsewhere?


