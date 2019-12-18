Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 788961246F4
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 13:36:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dDz93YT9zDqjT
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 23:36:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dDx74hcVzDqfB
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 23:34:59 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [EXTERNAL] how to get pci config space
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <DM6PR21MB138892F44E5B77CCE63F83D4C8530@DM6PR21MB1388.namprd21.prod.outlook.com>
Date: Wed, 18 Dec 2019 07:34:53 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <D37CC7FB-0199-47A5-930A-B9BBFF02F0D8@fuzziesquirrel.com>
References: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
 <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
 <3718EF06-C5DE-4D3D-B2B1-548FEF5A1919@fuzziesquirrel.com>
 <DM6PR21MB138892F44E5B77CCE63F83D4C8530@DM6PR21MB1388.namprd21.prod.outlook.com>
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

Thanks Neeraj

> On Dec 18, 2019, at 2:18 AM, Neeraj Ladkani <neladk@microsoft.com> =
wrote:
>=20
> IMO, we only need DeviceID and VendorID fields from PCIe Config space

This would probably meet my need to dynamically tune fan control =
parameters.  Is it possible to populate instances of the pciedevice =
schema based on devid and vendorid alone?

> and we can let system firmware send this information during boot

This is how it works on Power systems before OpenBMC, but we have a =
custom protocol with a proprietary implementation.  The purpose of my =
note was to find out if there are typical implementations or even =
standards out there for doing this.

> or preprogram the information to BMC using EntityManager.=20

Can you elaborate on how this would work?  Given the number of pcie =
devices out there this seems like it would be hard to do it this way =
without a huge database of some kind on the bmc?

> Regarding BMC-CPU(via PECI), BMC needs to send PECI command to CPU. =
CPU should support RdPCICfg as supported PECI command and thus respond =
with data.

Ok - that sounds like its all in hardware.  But above it sounded like =
you suggest we skip RdPCICfg and instead let system firmware push this =
information down to the BMC - do I have it right?  If so why do you =
prefer that mechanism?

thx!

-brad
