Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A54EAF23
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 12:49:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473kB262wnzF5kd
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 22:48:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473k9619LwzF5kG
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 22:48:08 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 316D36E212;
 Thu, 31 Oct 2019 07:48:03 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: openbmc project for telemetry
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <ca853ff3-6017-7e75-b66e-3116c042f38c@linux.intel.com>
Date: Thu, 31 Oct 2019 07:48:02 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <A727F88F-D32D-4CAD-8E92-2C99B39E4CEE@fuzziesquirrel.com>
References: <ca853ff3-6017-7e75-b66e-3116c042f38c@linux.intel.com>
To: =?utf-8?Q?Adrian_Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
X-Mailer: Apple Mail (2.3594.4.19)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak,
 Piotr" <piotr.matuszczak@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On Oct 31, 2019, at 6:14 AM, Adrian Ambro=C5=BCewicz =
<adrian.ambrozewicz@linux.intel.com> wrote:
>=20
> Hello Brad,
>=20
> First I would like to say introduce myself as it's my first message to =
the mailing list. I'm Adrian, engineer from Intel Technology Poland. I'm =
very excited to have an opportunity to work within this group of =
professionals :)

Welcome, and likewise!

> Currently we're working with Piotr on Redfish Telemetry. Current =
design in the review =
(https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357) seems to be =
on track to be accepted.
>=20
> I would like to ask you what requirements we have to comply to have =
our own repository in openbmc project. =46rom what I've seen in other =
topic - Apache 2.0 is preferred license. Are there any other =
expectations?

I can=E2=80=99t think of any other than the license as you=E2=80=99ve =
mentioned.

> Should we wait until mentioned design is accepted or can we start =
working on some initial implementation right away? If so - I would love =
to have repo up and running as soon as possible.

I don=E2=80=99t see any need to wait.  What would you like this =
repository called?

thx - brad=
