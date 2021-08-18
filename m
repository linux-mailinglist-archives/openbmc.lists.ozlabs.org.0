Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E62AD3EFCDD
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 08:34:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqJ5m5pR2z3bVR
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 16:34:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=gl0iS410;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=gl0iS410; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqJ5L71Rgz2yP3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 16:33:58 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 68E2B4B68C;
 Wed, 18 Aug 2021 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1629268426; x=1631082827; bh=l9yh5jHIQURecRrhG+hkHf3yT
 mIO7MI6mVW7LLTTRnI=; b=gl0iS410AwTpwa9iuzWqY19FnixPoJJQSqlVrJPEe
 62ScnmR/w+rluB00zanCgoWxBKh/SzMIYKiJzLau2s5oe7fA7lhqPECuQv84PKp6
 5pebNDrRflNxiqgcMfgMqZYByxPPcZTqBSSFqieRiTHXu0TOiSNtqSwMVvSNWEEx
 rU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YWEtf0BlBQ4; Wed, 18 Aug 2021 09:33:46 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8D1AC4B687;
 Wed, 18 Aug 2021 09:33:45 +0300 (MSK)
Received: from [10.199.0.76] (10.199.0.76) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 18
 Aug 2021 09:33:45 +0300
Message-ID: <0bf2da56744a03e1597d75e88e555ea4363448da.camel@yadro.com>
Subject: Re: Leveraging and extending smbios-mdr
From: Andrei Kartashev <a.kartashev@yadro.com>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
Date: Wed, 18 Aug 2021 09:33:44 +0300
In-Reply-To: <DF4PR8401MB0634FB1810144BBDB9C42E158FFE9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB0634147E668CC84648DC883A8FE99@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <20210729074904.u5lnr33pvayp2r6z@gmail.com>
 <DF4PR8401MB0634FB1810144BBDB9C42E158FFE9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.76]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

You can retrigger read via dbus, using
xyz.openbmc_project.Smbios.MDR_V2->.AgentSynchronizeData call to
smbios-mdrv2.

See example here:
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/smbiosmdrv2handler.cpp#L1240


On Tue, 2021-08-17 at 21:29 +0000, Garrett, Mike (HPE Server Firmware)
wrote:
> Actually I'm talking about https://github.com/openbmc/smbios-mdr
> 
> It looks like this daemon tries to take in a data file at startup only
> (/var/lib/smbios/smbios/smbios2).  I'm wondering if there's a provision
> in the design to refresh the data file if appears or is updated later. 
> This file (at least in my experience) has to be created by an
> interaction with the BIOS during boot.  So it would be very reasonable
> for the BMC to boot before the host and there to be no file available
> yet.  Also, if something is updated on the host, a reboot may refresh
> this file.  So I think there are a couple of reasons why it would be
> good for this repo to react to data file updates.
> 
> If it doesn't exist and folks think it's a good idea, we can look at
> creating that capability, but I want to make sure it doesn't already
> exist.
> 
> Mike
> 
> > -----Original Message-----
> > From: Artem Senichev <artemsen@gmail.com>
> > Sent: Thursday, July 29, 2021 2:49 AM
> > To: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Pedrana, Nick
> > <allan.nic.pedrana@hpe.com>
> > Subject: Re: Leveraging and extending smbios-mdr
> > 
> > On Tue, Jul 27, 2021 at 03:47:04PM +0000, Garrett, Mike (HPE Server
> > Firmware) wrote:
> > > Hello Artem and all,
> > > 
> > > We are integrating smbios-mdr into our build.  Our SMBIOS info is
> > downloaded and built as a file in the filesystem using proprietary
> > means (our
> > CHIF - channel interface).  Our hope is that we can simply point the
> > smbios-
> > mdr service at it and light up new information about the platform in
> > dbus,
> > Redfish, and the GUI.
> > > 
> > > However, I can't find much in the way of documentation about
> > > smbios-
> > mdr.
> > 
> > If we are talking about the MDR2 project (https://github.com/Intel-
> > BMC/mdrv2),
> > there is no documentation, but I don't think we really need it.
> > It is just a SMBIOS dump parser for some table types (CPU, DIMM).
> > The table format is fully documented in the SMBIOS specification:
> > https://www.dmtf.org/standards/smbios
> > !NpxR!xpRhPV3JWN6U7DS7nROiFT5h3CNwyuFM9FLOZhUK0yNczSR8w5MX7
> > iq1WAqwQuc$
> > 
> > > I'm especially interested in how to extend the functionality past
> > > just CPUs
> > and DIMMs into things like OEM records supplied by the BIOS.
> > 
> > What about phosphor-inventory-manager?
> > 
> > > Seems like the possibilities are:
> > > 
> > > 1. Smbios-mdr has a generic dbus API and we write an independent
> > > service to query it for this info and publish to dbus 2. We create
> > > a
> > > generic extension mechanism for smbios-mdr for vendors to add OEM
> > support and push to dbus directly from smbios-mdr (like w/
> > CPUs/DIMMs) 3.
> > We fork smbios-mdr and extend it (not preferred).
> > > 
> > > I'd like to hear how best to leverage this recipe.
> > 
> > --
> > Regards,
> > Artem Senichev
> > Software Engineer, YADRO.

-- 
Best regards,
Andrei Kartashev


