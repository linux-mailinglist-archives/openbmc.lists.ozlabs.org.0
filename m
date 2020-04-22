Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28D1B437D
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 13:46:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496dvD6pGdzDqkB
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 21:46:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 496dtB0jJszDqWL
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 21:45:52 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: phosphor-dbus-interfaces modification process for existing YAML
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <29a3376f-d82d-057c-e2d5-0fe250b55951@linux.intel.com>
Date: Wed, 22 Apr 2020 07:45:48 -0400
Message-Id: <2A59C9DC-F7F5-4A7E-BF83-5BE2AA8A04B9@fuzziesquirrel.com>
References: <29a3376f-d82d-057c-e2d5-0fe250b55951@linux.intel.com>
To: =?utf-8?Q?Adrian_Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 7:00 AM, Adrian Ambro=C5=BCewicz <adrian.ambrozewicz@linux.intel.com> =
wrote:

> Hello,
>
> OpenBMC Sensor interface is specified here:
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/ope=
nbmc_project/Sensor/Value.interface.yaml
>
> We would need to extend it with new hierarchy/namespace : utilization, =
=20
> and corresponding Unit: Percent.
>
> Should I push change directly to review or do I need to discuss it =20
> earlier with someone? My first thought was to address =20
> https://github.com/openbmc/docs/blob/master/architecture/sensor-archite=
cture.md =20
> , however this document doesn't seem to address these details.
>
> Regards,
> Adrian

Thanks for bringing the topic to the mailing list first!  I find discussi=
on =20
here to be much easier than in a docs/designs or phosphor-dbus-interfacs =
=20
gerrit review.  I also think it ends up getting much more visibility.

With that said - this one is pretty straightforward.  Your proposal sound=
s =20
good to me!

thx - brad
