Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ED71D96B2
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 14:51:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RG3W4rQzzDr88
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 22:51:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RG2K30C2zDqyG
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 22:50:31 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <9b94cd92ae0d06992f897fa3e5008a1537498578.camel@fuzziesquirrel.com>
Subject: Re: Reducing fragmentation in OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: =?UTF-8?Q?=E9=83=81=E9=9B=B7?= <yulei.sh@bytedance.com>, Andrew Geissler
 <geissonator@gmail.com>
Date: Tue, 19 May 2020 08:50:46 -0400
In-Reply-To: <CAGm54UFc15aXH9qJz+-hig8NDbX-bVxjpZa-g-9Bg=uUpjEydQ@mail.gmail.com>
References: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
 <AA2FE467-1072-4CD6-BA9F-3AAAD40DC8E0@gmail.com>
 <CAGm54UFc15aXH9qJz+-hig8NDbX-bVxjpZa-g-9Bg=uUpjEydQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-05-19 at 10:25 +0800, =E9=83=81=E9=9B=B7 wrote:
> On Tue, May 19, 2020 at 8:53 AM Andrew Geissler <
> geissonator@gmail.com> wrote:
>=20
> > I know phosphor-dbus-interfaces has always been a bit onerous. I do
> > feel like
> > we get some good stuff in the reviews though. It also ensures we
> > have
> > documentation  of our interfaces. The cross-repo dependencies we
> > get are a bit frustrating (i.e. need to get interface merged and
> > bubbled into
> > openbmc before you can implement). There=E2=80=99s also no versioning
> > concept so
> > if an interface needs to be changed, it=E2=80=99s a huge pain. Ideas =
on how
> > we could
> > make this easier but keep the benefits? Or people that don=E2=80=99t =
use it
> > and just
> > define their own interfaces, any improvements we could make to get
> > you to use it?
> >=20
>=20
> This usually involves the repo CI.
> If we could implement "Cross-repo dependencies", making the Jenkins
> job able to pick the "dependent" revision of phosphor-dbus-interfaces
> (or sdbusplus, or else), and build a docker container with the
> dependencies to run the repo CI, the issue could be resolved.

This would be a nice feature to have in our CI when cross repo
dependencies come up.  But I don't think  having that would give us
free license to add cross repo dependencies everywhere though - I would
like to see us come up with a system that avoids the need for cross-
repo dependencies in the first place.
