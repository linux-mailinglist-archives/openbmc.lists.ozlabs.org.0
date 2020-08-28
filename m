Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A616255DF3
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 17:36:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdNwz1jDhzDqsp
	for <lists+openbmc@lfdr.de>; Sat, 29 Aug 2020 01:36:19 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=R1rr/Bp7; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=R1rr/Bp7; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdNvZ4398zDqdn
 for <openbmc@lists.ozlabs.org>; Sat, 29 Aug 2020 01:35:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598628900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usLQjFR1Epep2MN2gFGlZwyvnCgnY/gIqGN7HJEx1tI=;
 b=R1rr/Bp7nr9/lvFain1gqNzIGEh2HsA/OxJASdHgL1Sr8GtDRvEGbfcFq7GeWe7qUk6qtn
 RlZ1Dywvhmrs7yA8YgRAIuT6w4ZntkAiRiG7VbSwKhGl7pDf1jt18Ny86vNY32lFrD/sBr
 HKWb7UQVDbwXLB8YoX/9QXft5El1tAM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598628900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usLQjFR1Epep2MN2gFGlZwyvnCgnY/gIqGN7HJEx1tI=;
 b=R1rr/Bp7nr9/lvFain1gqNzIGEh2HsA/OxJASdHgL1Sr8GtDRvEGbfcFq7GeWe7qUk6qtn
 RlZ1Dywvhmrs7yA8YgRAIuT6w4ZntkAiRiG7VbSwKhGl7pDf1jt18Ny86vNY32lFrD/sBr
 HKWb7UQVDbwXLB8YoX/9QXft5El1tAM=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-Dp0WUKYGO_CWhjb3iLrhSA-1; Fri, 28 Aug 2020 11:34:55 -0400
X-MC-Unique: Dp0WUKYGO_CWhjb3iLrhSA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 28 Aug 2020 08:34:53 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Fri, 28 Aug 2020 08:34:53 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Is there any reason or practical value of staying with
 https://github.com/openbmc/openbmc/tree/2.8.0
Thread-Topic: Is there any reason or practical value of staying with
 https://github.com/openbmc/openbmc/tree/2.8.0
Thread-Index: AdZ8p+wPxEjbOFEZSPWdkMffOCnL1gAyoy0AAAhuzfA=
Date: Fri, 28 Aug 2020 15:34:52 +0000
Message-ID: <dd5bdff8d71e43f18b3707c84e717213@SCL-EXCHMB-13.phoenix.com>
References: <fd8d46e97bc742b5b8dd9325f3835326@SCL-EXCHMB-13.phoenix.com>
 <20200828123606.GN3532@heinlein>
In-Reply-To: <20200828123606.GN3532@heinlein>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thank you Patrick!

> -----Original Message-----
> From: Patrick Williams [mailto:patrick@stwcx.xyz]
> Sent: Friday, August 28, 2020 05:36
> To: Bruce Mitchell
> Cc: OpenBMC Maillist
> Subject: Re: Is there any reason or practical value of staying with
> https://github.com/openbmc/openbmc/tree/2.8.0
>=20
> On Thu, Aug 27, 2020 at 07:27:43PM +0000, Bruce Mitchell wrote:
> > Is there any reason or practical value of staying with
> > https://github.com/openbmc/openbmc/tree/2.8.0
> > vs just using https://github.com/openbmc/openbmc ?
>=20
> Hi Bruce,
>=20
> I think the answer of if you should use a tag or master entirely depends
> on what you're trying to accomplish.
>=20
> If you are developing a new machine, you should do all your
> development work off master.  Working off a tag is only going to cause
> yourself more work because all of your work will have to be rebased in
> order to get merged.
>=20
> If you are releasing an image to production or customers, you need to
> decide what your release process looks like and in that case a tag
> _might_ align well with it.
>=20
> At Facebook, we strive for CI/CD in all of our codebases.  In general tha=
t
> means we "live at HEAD" and try to deploy directly from there.  We do
> not have a need for any long-term maintanence on any particular release
> because we are always releasing a new version anyhow and continuously
> deploying to our fleet.  Therefore, it is very reasonable for us to work =
off
> master in all cases.
>=20
> Previously I worked for a "commercial server" vendor, and fix-releases
> were very important for their customers.  There was an expectation that
> a major release version would get security and other critical fixes for
> years.  In a situation like that, I would certainly recommend starting wi=
th
> an OpenBMC tag as the underlying base for your own release.
>=20
> In any case of a release, I would expect that your company is taking some
> point-in-time from OpenBMC (master or tag) and then doing some
> qualification on it.  All software has bugs, so you're likely going to fi=
nd a
> few, and you'll want to backport the fixes into your own 'release branch'=
.
> Right now, there is not a strong process for qualifying an OpenBMC tag
> and/or backporting fixes onto it (for example to make 2.8.1), so as a
> vendor you are left to do this on your own.  I suspect that this is an ar=
ea
> where the "commercial vendors" could work together to create a
> stronger release qualification process and it would benefit the
> community as a whole.
>=20
> My understanding is that IBM's own release tags are available at [1], so
> maybe someone there can chime in on how they manage these and what
> collaboration they might like.
>=20
> You really could start at any random 'master' commit as the underlying
> base for your own release process and with today's process it is probably
> just as bug-full as the current tags.  I would still recommend starting w=
ith
> a tag because even today we align those tags with an underlying Yocto
> tag.  The Yocto community has a more well-defined long term support
> process on their tags, so you'll be able to get security fixes in all the
> underlying Yocto packages straight from there.  If you take a random
> commit, you're going to end up being responsible for all of the work with
> Yocto backports.
>=20
> Hopefully this helps.
>=20
> 1. https://github.com/ibm-openbmc/openbmc/tags
>=20
> --
> Patrick Williams

