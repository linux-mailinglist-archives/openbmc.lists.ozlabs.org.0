Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 314952598E5
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:36:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgt4C0BnPzDqF1
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:36:11 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=GuBL83aK; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=GuBL83aK; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgss13rnWzDqNC
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:26:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598977584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLdH6+DLKbbtckYY7UD9StRXzypysbuPoXUltccq2pg=;
 b=GuBL83aKZIFnDldpGWf5hDmgKvUFB35fDn9Xer5rBMSquR7ZDJGzDqGpBG5NVPoXi4aD51
 xFRh7zyPWVngM3jux1TWBlHYLG20QyBSNQ48NBIbZ4m0JTLrNyc88jjpn602cfesvjD1q9
 qtFRjV+vJ6MOE3VoJ8zs2Q4nRYNKf3o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598977584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLdH6+DLKbbtckYY7UD9StRXzypysbuPoXUltccq2pg=;
 b=GuBL83aKZIFnDldpGWf5hDmgKvUFB35fDn9Xer5rBMSquR7ZDJGzDqGpBG5NVPoXi4aD51
 xFRh7zyPWVngM3jux1TWBlHYLG20QyBSNQ48NBIbZ4m0JTLrNyc88jjpn602cfesvjD1q9
 qtFRjV+vJ6MOE3VoJ8zs2Q4nRYNKf3o=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-YNwpS1cqMl--pazRqgxhzg-1; Tue, 01 Sep 2020 12:26:21 -0400
X-MC-Unique: YNwpS1cqMl--pazRqgxhzg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 1 Sep 2020 09:26:20 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 1 Sep 2020 09:26:20 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQBfNdqAAAY+vmA=
Date: Tue, 1 Sep 2020 16:26:19 +0000
Message-ID: <d64dc8ac1b454f1b8e8bec4ab5f2964f@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
In-Reply-To: <20200901122409.GQ3532@heinlein>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.131]
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

Thank you Patrick!  Your #1 and #2 scenario are close to what we are attemp=
t.

> -----Original Message-----
> From: Patrick Williams [mailto:patrick@stwcx.xyz]
> Sent: Tuesday, September 1, 2020 05:24
> To: Bruce Mitchell
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: When building OpenBMC . . . ?
>=20
> On Sun, Aug 30, 2020 at 10:02:41PM +0000, Bruce Mitchell wrote:
> > When selecting Target hardware
> > https://github.com/openbmc/openbmc#3-target-your-hardware
> > to build for the is a tiogapass, now if I add a meta-phoenix/meta-
> tiogapass/conf  how does
> > =09source setup tiogapass build
> > know which tiogapass to build?
>=20
> https://github.com/openbmc/openbmc/blob/master/setup#L34
>=20
> The setup script just does a wildcard, which means you'll get the
> alphabetically ordered machine.  In this case, you should get the meta-
> facebook one selected before the meta-phoenix (supposing they both
> exist).
>=20
> > Or am I not supposed to choose a name (i.e. tiogapass in this example)
> > that is already in the list when I need to create a new meta-
> phoenix/meta-<machine>/conf?
>=20
> The overwhelming preference seems to be to not make another
> configuration with the same machine, and as one of the maintainers of
> meta-facebook, I agree in this case.  But, this answer doesn't solve your
> underlying question.
>=20
> I suspect you're going to make two kinds of changes:
>   1. Features you want to enable on Tiogapass that Facebook isn't
>      interested in.  (I would cover bmcweb 'branding' changes here
>      also).
>   2. Fixes and configuration due to features we haven't enabled yet or
>      fully vetted.
>=20
> #2 should go into either meta-facebook (or the underlying code
> repository where the fix is needed).  These will be common for any
> tiogapass hardware, so lets keep it in the common location.
>=20
> #1 should go into meta-phoenix.  You're likely the first one doing this, =
so
> we may need some experimentation on the best option.  I have two
> ideas (there are probably others):
>=20
>   * Make an alternative tiogapass variant, like tiogapass-phoenix, which
>     ends up including all the common tiogapass code from meta-facebook.
>=20
>   * Create a new distro type for phoenix, which enhances the underlying
>     openbmc distribution with your own branding tweaks.  You'd still
>     build meta-facebook/tiogapass but with a different distro flavor.
>=20
> I believe IBM has experiemented with both of these approaches for
> witherspoon (see witherspoon-tacoma and
> meta-ibm/conf/distro/openbmc-witherspoon.conf) and might have
> some insight into what has worked well for them.
>=20
> I'm more than willing to work with you and your team to help refactor
> meta-facebook/tiogapass in a way that makes it more condusive to what
> your team is interested in doing.  I suspect we'll need to create some
> additional bitbake '.inc' files and move some of the content we have in
> '.conf' to '.inc'.  Catch me here or on IRC as needed.
>=20
> --
> Patrick Williams

