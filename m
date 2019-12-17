Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A92123A42
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 23:52:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ctgZ2sjTzDqXf
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 09:52:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ctff0TgrzDqSg
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 09:51:20 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [EXTERNAL] how to get pci config space
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
Date: Tue, 17 Dec 2019 17:51:16 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <3718EF06-C5DE-4D3D-B2B1-548FEF5A1919@fuzziesquirrel.com>
References: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
 <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
To: Neeraj Ladkani <neladk@microsoft.com>
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

Thanks for the reply Neeraj!

> On Dec 17, 2019, at 4:15 PM, Neeraj Ladkani <neladk@microsoft.com> =
wrote:
>=20
> Is there any broader use case for this?

I want to report mfg/model/pn/sn for pcie devices via the pciedevice =
Redfish schema.  I assumed the config space is where this information =
would originate.  Good assumption?

I=E2=80=99m also aware of a need to dynamically tune fan control =
parameters when cards that are known to run hot are installed.  Are =
there better ways to do something like this?

> I am not sure on Power

Similar to PECI we have something called FSI.

> but on x86 it really depends on how the CPU PECI is router to BMC. If =
its wired to ME then BMC->ME->CPU( via PECI over DMI or serial PECI) but =
if its wired to CPU then BMC->CPU( via serial PECI).=20

This helps, thanks.  If we assume the second case for a moment - is the =
entire path in hardware? - e.g. does PECI give the BMC direct access to =
the address space and the BMC just reads it?  Or is there a message =
passing interface?

thx - brad=
