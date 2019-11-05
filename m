Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F4DEF20A
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 01:36:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476W2G6G2ZzF42C
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 11:36:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 476W1h5W8CzF3GK
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 11:36:23 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id E99A96DBDD;
 Mon,  4 Nov 2019 19:36:18 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: HTTP redirect to HTTPS for web UI
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAARXrtnEOUuVdZpobxnQiJ-n0ve57fiP0nu8Yw-t5jMHWShXtA@mail.gmail.com>
Date: Mon, 4 Nov 2019 19:36:18 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7046336-11A9-4D82-9DDC-6DB7DF94C8C5@fuzziesquirrel.com>
References: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
 <CAARXrtnEOUuVdZpobxnQiJ-n0ve57fiP0nu8Yw-t5jMHWShXtA@mail.gmail.com>
To: Lei YU <mine260309@gmail.com>,
 James Feist <james.feist@linux.intel.com>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 George Liu <liuxiwei1013@gmail.com>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 31, 2019, at 11:26 PM, Lei YU <mine260309@gmail.com> wrote:
>=20
> On Thu, Oct 31, 2019 at 9:48 PM George Liu <liuxiwei1013@gmail.com> =
wrote:
>>=20
>> Hi All:
>> I'm working on http redirect to https =
task(https://github.com/ibm-openbmc/dev/issues/895).
>> I took a cursory look at the =
design(https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173) and =
did some testing.
>>=20
>> In bmcweb, I find it the current communication logic can only listen =
to one communication protocol (http or https). If you listen to both =
protocols at the same time, you need to change a lot of code and =
communication logic.
>> If we are going to implement this feature in bmcweb, it costs extra =
effort and it's likely the implementation is no better than Nginx. so I =
prefer to use Nginx.
>>=20
>=20
>> =46rom Ed's [mail in June][1], one approach is to use boost asio =
async_detect_ssl.
>=20
> But I agree with George here that it costs extra and unnecessary
> effort, because with nginx it is so easy to config the http->https
> redirection, and it is easy to get all the https related configs
> right, including HSTS.
> In other words, we got such features for free (except for a few binary
> size), why bother re-write it?
>=20
> Considering the binary size, maybe it's worth the effort to check how
> many bytes are increased compared between:
> 1. Current implement that bmcweb handles https only
> 2. Enable BMCWEB_INSECURE, opt-out all https related code in bmcweb,
> adding a basic nginx and a configure file that does the https
> redirect.
>=20
> We could check the binary size to see if it's acceptable. Be noted
> that implementing this feature in bmcweb increases the binary size as
> well.
>=20
>=20
> [1]: https://lists.ozlabs.org/pipermail/openbmc/2019-June/016557.html

FWIW I generally support solutions that re-use existing software and =
have large communities behind them already but I do remember Ed having =
some concerns about using bmcweb behind a proxy.

James any chance you recall what those concerns were?  I don=E2=80=99t =
think I was ever able to wrap my head around them.  Do you share Ed=E2=80=99=
s concerns?

thx - brad=
