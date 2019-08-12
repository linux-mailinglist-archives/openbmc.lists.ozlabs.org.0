Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B98A410
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 19:12:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466j8j1cxwzDqYd
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 03:12:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466j852pNpzDqXf
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 03:12:20 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id A3F6D6DC94;
 Mon, 12 Aug 2019 13:12:15 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: New Repo Creation Request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <8b047191-7648-587a-2b14-8cbb94aaf1c7@gmail.com>
Date: Mon, 12 Aug 2019 13:12:15 -0400
Message-Id: <B8F669FB-9B7C-466B-A736-27EE8FFEAEB7@fuzziesquirrel.com>
References: <8b047191-7648-587a-2b14-8cbb94aaf1c7@gmail.com>
To: Santosh Puranik <santosh.puranik.ibm@gmail.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 8:51 AM, Santosh Puranik <santosh.puranik.ibm@gmail.com> wrote:

> Hi Brad,
>
> Could you create two new repositories:
>
> ipz-vpd-parser : Parser application for IPZ format VPD.
>
> keyword-vpd-parser : Parser application for keyword format VPD.
>
> The design document that details these applications is here:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22491
>
> Thanks,
>
> Santosh

Hi Santosh

The design calls for additional systemd services and applications (not =20
necessarily additional git repositories).  Can the new applications and =20
systemd services be hosted in the existing openpower-vpd-parser =20
repository?  We have an awful lot of repos as it is and these new =20
applications seem like a good fit to go with the existing ones in =20
openpower-vpd-parser.

I=E2=80=99m envisioning a repository that supports parsing a number of di=
fferent =20
fru data formats.  Support for the different formats can be turned on or =
=20
off with meson options or autoconf options.   The specifics of how the co=
de =20
would be organized within the build process for openpower-vpd-parser I=E2=
=80=99d =20
leave to you and the current openpower-vpd-parser maintainer (Deepak).

We could rename the repository and/or recipe to something more general if=
 =20
it is just the name that is off-putting.  Open to suggestions there - how=
 =20
about phosphor-fru-parser or just fru-parser or vpd-parser?

thx - brad
