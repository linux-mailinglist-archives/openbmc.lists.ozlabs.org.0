Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 272A11DBFE1
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 22:07:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S3h8238HzDqS1
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 06:07:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S3g40fQ7zDqZk
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 06:06:37 +1000 (AEST)
IronPort-SDR: AGeE6aug16f1PhSkkYsM/is7B6bHOzANrhLv+7SFTwAJzz4KFY1v5GNePZal7wew1W+gPwH8UY
 Zyyv1rsO7uEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 13:06:34 -0700
IronPort-SDR: 60zJACGRmlO1ISOIUMlCKiK9FFQNpysWrzlyUrBHNN04QsKGvwwvDZ8tqVJUdkgxei9IPihRg1
 lQ+q9qCWd/3w==
X-IronPort-AV: E=Sophos;i="5.73,415,1583222400"; d="scan'208";a="253768051"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 13:06:34 -0700
Date: Wed, 20 May 2020 13:06:33 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Subject: Re: Reducing fragmentation in OpenBMC
Message-ID: <20200520200445.GA45595@mauery.jf.intel.com>
References: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
 <AA2FE467-1072-4CD6-BA9F-3AAAD40DC8E0@gmail.com>
 <CAGm54UFc15aXH9qJz+-hig8NDbX-bVxjpZa-g-9Bg=uUpjEydQ@mail.gmail.com>
 <9b94cd92ae0d06992f897fa3e5008a1537498578.camel@fuzziesquirrel.com>
 <CAGm54UG0FZ38QzY0rROYVnk3izTE46SNb1D39Hdbz77xz3POZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGm54UG0FZ38QzY0rROYVnk3izTE46SNb1D39Hdbz77xz3POZQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20-May-2020 10:25 AM, =E9=83=81=E9=9B=B7 wrote:
>On Tue, May 19, 2020 at 8:50 PM Brad Bishop <bradleyb@fuzziesquirrel.com> =
wrote:
>>
>> On Tue, 2020-05-19 at 10:25 +0800, =E9=83=81=E9=9B=B7 wrote:
>> > On Tue, May 19, 2020 at 8:53 AM Andrew Geissler <
>> > geissonator@gmail.com> wrote:
>> >
>> > > I know phosphor-dbus-interfaces has always been a bit onerous. I do
>> > > feel like
>> > > we get some good stuff in the reviews though. It also ensures we
>> > > have
>> > > documentation  of our interfaces. The cross-repo dependencies we
>> > > get are a bit frustrating (i.e. need to get interface merged and
>> > > bubbled into
>> > > openbmc before you can implement). There=E2=80=99s also no versioning
>> > > concept so
>> > > if an interface needs to be changed, it=E2=80=99s a huge pain. Ideas=
 on how
>> > > we could
>> > > make this easier but keep the benefits? Or people that don=E2=80=99t=
 use it
>> > > and just
>> > > define their own interfaces, any improvements we could make to get
>> > > you to use it?
>> > >
>> >
>> > This usually involves the repo CI.
>> > If we could implement "Cross-repo dependencies", making the Jenkins
>> > job able to pick the "dependent" revision of phosphor-dbus-interfaces
>> > (or sdbusplus, or else), and build a docker container with the
>> > dependencies to run the repo CI, the issue could be resolved.
>>
>> This would be a nice feature to have in our CI when cross repo
>> dependencies come up.  But I don't think  having that would give us
>> free license to add cross repo dependencies everywhere though - I would
>> like to see us come up with a system that avoids the need for cross-
>> repo dependencies in the first place.
>
>As Andrew indicates, phosphor-dbus-interfaces is the major cross repo
>dependency already.

Would it be possible to have the D-Bus interfaces in the repo that=20
provides it? If the yaml->c++ generator is used (sdbusplus) then it=20
could be run IN that repo as part of the build. If the yaml->c++=20
generator is not used (sdbusplus-asio) then maybe we could figure out=20
some auto-generated unit tests that validate that the provider actually=20
does serve the interface as it is defined in the yaml.

This would make it harder to find where the interface is, but it would=20
reduce the dependency problem. Also, it would make it difficult for=20
multiple things that provide the same interface.

Just throwing ideas out there.

--Vernon
