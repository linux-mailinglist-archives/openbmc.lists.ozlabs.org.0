Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFEB13A7B9
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 11:53:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xnPQ3nzMzDqJM
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 21:53:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xnNp02nhzDqPg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 21:52:56 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: multiple device trees
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1298611578998395@vla5-c30c59847b9e.qloud-c.yandex.net>
Date: Tue, 14 Jan 2020 05:52:50 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <FFFFBB27-4370-4E94-8D91-3BEB699CA3DA@fuzziesquirrel.com>
References: <02A2EB59-111F-43D2-8CDE-6DFDE75EF292@fuzziesquirrel.com>
 <1298611578998395@vla5-c30c59847b9e.qloud-c.yandex.net>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
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



> On Jan 14, 2020, at 5:39 AM, Konstantin Klubnichkin =
<kitsok@yandex-team.ru> wrote:
>=20
> =20
> Hello, Brad!
> =20
> I'm doing this using overlay DTS.
> I have a startup script that detects board type by GPIO pins and loads =
corresponding overlay.

Thanks for the reply Konstantin.  Does that mean you have the overlay =
patch applied to your kernel tree?

An alternative design that I am considering is having two complete =
device trees in a fit image, and u-boot reads the gpios to pick the =
correct dtb for linux.  Did you consider a design like that and if so, =
was there anything specific that sent you in the direction of overlays?

thx - brad=
