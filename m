Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DA04307A
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 21:57:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PHhj25lFzDqsl
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 05:57:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PHh857pLzDqsl
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 05:56:56 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 12 Jun 2019 15:57:42 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Will Liang =?utf-8?B?KOaigeawuOmJiSk=?= <Will.Liang@quantatw.com>
Subject: Re: Repository for phosphor-ecc
Message-ID: <20190612195742.sxrqkgrdlw3pvom4@thinkpad.dyn.fuzziesquirrel.com>
References: <baa383a5f03e417aa0bb21c86022eb9e@quantatw.com>
 <20190425200616.mavvuzbfds75dne3@thinkpad>
 <70a9f53573c4443ba0d70aa5c3793e59@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <70a9f53573c4443ba0d70aa5c3793e59@quantatw.com>
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

On Fri, Apr 26, 2019 at 01:05:51AM +0000, Will Liang (=E6=A2=81=E6=B0=B8=E9=
=89=89) wrote:
>Hi Brad
>
>> On Thu, Apr 25, 2019 at 01:40:34AM +0000, Will Liang (=E6=A2=81=E6=B0=B8=
=E9=89=89) wrote:
>> >Hi Brad,
>> >
>> >My proposal has been merged and I need your help to create the reposi=
tory.
>> >(https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/18684)
>>
>> Hi Will
>>
>> I've created the repository on Github.  I am not able to import the re=
pository
>> into Gerrit right now because the Gerrit/Github integration plugin bro=
ke
>> (adding new repositories) when we updated the Gerrit
>> server:
>> https://bugs.chromium.org/p/gerrit/issues/detail?id=3D10657&q=3Dcompon=
ent%3A
>> plugins%3Egithub%20&colspec=3DID%20Type%20Stars%20Milestone%20Status%
>> 20Priority%20Owner%20Summary
>>
>> Please let me know your Github username so I can send you an invite to=
 the
>> OpenBMC Github organization and add you to the maintainers list for
>> phosphor-ecc.
>
>My Github username : YHLiang85
>
>> For now you can do Github pull requests to phosphor-ecc (as well as
>> quanta-ipmi-oem) and when we are able to figure out why the Github plu=
gin
>> stopped working we can do the import over to Gerrit.
>>
>> thx - brad
>OK! i will do Github pull request first.

Hi Will

I have enabled replication on phosphor-ecc so you can use Gerrit now to=20
manage code reviews.

thx - brad
