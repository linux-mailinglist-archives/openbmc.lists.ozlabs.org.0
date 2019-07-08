Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB13627B5
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 19:54:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jCkR2tPqzDqLP
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 03:54:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jCh75l4LzDqRg
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 03:52:06 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 8 Jul 2019 13:52:41 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Duke Du =?utf-8?B?KOadnOelpeWYiSk=?= <Duke.Du@quantatw.com>
Subject: Re: Could phosphor-hwmon support peci-sensors
Message-ID: <20190708175241.nem73wmy27itc72p@thinkpad.dyn.fuzziesquirrel.com>
References: <79563bbd625f412ab4695049df92a0bd@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <79563bbd625f412ab4695049df92a0bd@quantatw.com>
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

On Mon, Jul 08, 2019 at 12:33:21PM +0000, Duke Du (=E6=9D=9C=E7=A5=A5=E5=98=
=89) wrote:
>Hi All,
>  I have some problems with phosphor-hwmon.
>Could package phosphor-hwmon supports peci sensors such as cpu and dimm =
tempatures ?
>If yes, could you give me some hints that how do I write configuration f=
or peci sensors, please :).
>
>Thanks.
>Duke, Du

phosphor-hwmon should work with anything that implements the hwmon ABI. =20
So I think to make PECI sensors work with phosphor-hwmon, you need hwmon=20
drivers for PECI sensors.  I don't know if anyone is working on that.

I suspect the other sensor application - dbus-sensors supports PECI=20
just fine.  But I don't know how it works, if it can be used without=20
entity manager,  and/or if it can be run in parallel with=20
phosphor-hwmon.
