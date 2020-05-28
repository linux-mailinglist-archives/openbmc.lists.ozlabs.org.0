Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6CA1E6157
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 14:49:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XnbK1ntLzDqKT
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 22:49:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XnYk4QW5zDqJ7
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 22:48:26 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <555375f27645bf26067fba4cfbfc5f5f8ac8c101.camel@fuzziesquirrel.com>
Subject: Re: Adding usb-ctrl from intel-bmc into phosphor-misc
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: =?UTF-8?Q?=E9=83=81=E9=9B=B7?= <yulei.sh@bytedance.com>, 
 openbmc@lists.ozlabs.org
Date: Thu, 28 May 2020 08:48:24 -0400
In-Reply-To: <CAGm54UEDRmEQVQ-WaRiUa+fpxL0UUe-OZ4rwRZHVLTUJBZZb=A@mail.gmail.com>
References: <CAGm54UEDRmEQVQ-WaRiUa+fpxL0UUe-OZ4rwRZHVLTUJBZZb=A@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2020-05-27 at 11:07 +0800, =E9=83=81=E9=9B=B7 wrote:
> There is a script [usb-ctrl][1] hosted in intel-bmc.
> It supports the VirtualMedia feature by insert/eject files to the host
> as a USB mass-storage device.
> Comparing to the existing [state_hook][2] in jsnbd, it supports
> multiple UDCs, so it supports mount multiple files.
>=20
> In addition, I have some updates on the usb-ctrl script to make it
> support the USB ECM device, which creates a USB ethernet device
> between BMC and the host.
>=20
> So my proposal is to add the `usb-ctrl` script into the phosphor-misc
> repo so that it gets reviewed and could be used by upstream.
>=20
> Any ideas?
>=20
> [1]:=20
> https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-=
common/recipes-core/fw-update/files/usb-ctrl
> [2]:=20
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/aspeed-lay=
er/recipes-connectivity/jsnbd/jsnbd/state_hook
>=20

I'm the current maintainer of phosphor-misc and I am looking for help
with that.  I would be fine with adding this script to that repository.=20
It would be nice, but not required, to hear from the Intel team that
they would pull from the new location if we do this...
