Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA661E60F3
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 14:34:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XnF75MCDzDqYn
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 22:34:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XnDF1vzVzDqW4
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 22:33:17 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <6226fbb38816b7bd97b451cb72265acb6502d133.camel@fuzziesquirrel.com>
Subject: Re: article on data in OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>, Andrew Geissler
 <geissonator@gmail.com>
Date: Thu, 28 May 2020 08:33:15 -0400
In-Reply-To: <20200528020044.GA17541@heinlein>
References: <58a733f5aac22446c8cab43535aaa2a133a20717.camel@fuzziesquirrel.com>
 <E3CB1347-0E32-416F-9837-A955BF0F0613@gmail.com>
 <20200528020044.GA17541@heinlein>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2020-05-27 at 21:00 -0500, Patrick Williams wrote:
> On Tue, May 26, 2020 at 10:56:19AM -0500, Andrew Geissler wrote:
> >=20
> > > On May 22, 2020, at 3:46 PM, Brad Bishop <
> > > bradleyb@fuzziesquirrel.com> wrote:
> > What=E2=80=99s your vision for this article? A doc repo? A wiki? Wiki=
s def
> > make it more likely to get updated.

I'd be fine with putting it on the wiki.  Does that make more sense?

>=20
> A few people asked similarly, but he had already submitted it to
> Gerrit
> before posting to the ML:
>=20
>     https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32735
>=20
