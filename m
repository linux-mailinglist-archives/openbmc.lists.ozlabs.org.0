Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC41314B6
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 16:20:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rzhz1qG1zDqG0
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 02:20:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rzhC5NctzDqFh
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 02:19:38 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: HTTP redirect to HTTPS for web UI
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
Date: Mon, 6 Jan 2020 10:19:33 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B3B2725-9C0F-4829-82BE-7FB35C558AB5@fuzziesquirrel.com>
References: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
To: George Liu <liuxiwei1013@gmail.com>
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



> On Oct 31, 2019, at 9:45 AM, George Liu <liuxiwei1013@gmail.com> =
wrote:
>=20
> Hi All:
> I'm working on http redirect to https =
task(https://github.com/ibm-openbmc/dev/issues/895).
> I took a cursory look at the =
design(https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173) and =
did some testing.
>=20
> In bmcweb, I find it the current communication logic can only listen =
to one communication protocol (http or https). If you listen to both =
protocols at the same time, you need to change a lot of code and =
communication logic.
> If we are going to implement this feature in bmcweb, it costs extra =
effort and it's likely the implementation is no better than Nginx. so I =
prefer to use Nginx.
>=20
> Please everyone stay here to discuss and leave your comments.
>=20
> Thanks!

Hi George

I see you implemented this here:

https://gerrit.openbmc-project.xyz/c/openbmc/meta-openpower/+/28099

I=E2=80=99d like to propose this go in meta-phosphor and not =
meta-openpower.  Does anyone have thoughts on whether or not this should =
be enabled or disabled by default?

thx - brad=
