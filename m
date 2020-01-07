Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9221513297F
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 16:02:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sbFr2ShjzDqLV
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 02:02:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sbDl0mXwzDqKP
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 02:01:24 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: first boot repository
Date: Tue, 7 Jan 2020 10:01:19 -0500
References: <b09011f57074c8a9dc773937c0921f9860b92e50.camel@fuzziesquirrel.com>
 <20191021064623.GA2987@bbwork.lan>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <20191021064623.GA2987@bbwork.lan>
Message-Id: <E3D38FFD-FC69-48D3-888E-9BB60497EC1D@fuzziesquirrel.com>
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



> On Oct 21, 2019, at 2:46 AM, Alexander A. Filippov =
<a.filippov@yadro.com> wrote:
>=20
> On Fri, Oct 18, 2019 at 02:31:18PM -0400, Brad Bishop wrote:
>> We've collected a number of "do x on first boot" type scripts and
>> systemd units.  I'd like to create a repository "phosphor-first-boot"
>> to host these.  Does anyone see a problem with that?
>>=20
>> here are a couple:
>>=20
>> https://gerrit.openbmc-project.xyz/c/openbmc/meta-openpower/+/26292
>>=20
>=20
> I agree and I don't see any problem.
> Besides, that couple of scripts has a lot of repeating code which =
might be moved
> to a shared source.
>=20
>> and there are others for things like creating users after a code
>> update.
>>=20
>> thx - brad
>=20
> Regards,
> Alexander

I finally created this repository today and moved a couple scripts over:

=
https://gerrit.openbmc-project.xyz/q/project:openbmc%252Fphosphor-misc+sta=
tus:open

please review!

I named it =E2=80=98phosphor-misc=E2=80=99 so we can put other random =
scripts and unit files in this
repository.

thx - brad=
