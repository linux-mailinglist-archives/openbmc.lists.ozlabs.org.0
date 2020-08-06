Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E23ED23D66E
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 07:30:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMcWm17bgzDqkR
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 15:30:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=voXpwcOr; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMcVp6NQCzDqjk
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 15:29:22 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C49C94C878;
 Thu,  6 Aug 2020 05:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1596691755; x=1598506156; bh=L9e/YeWwUR3zhDSmQ4rNjTMF+
 0oIT8uWJ3WXHwrNng4=; b=voXpwcOrj6IQvPMhF2Au2WGcSzq7Kqrxe+nIPm7h4
 6Ucr6tvXLDBdevGufjoLA7zUFTY1cXfBRnteAG45s20pS3WmRGgnXMpm2IQf7aaR
 kXqpZD9uxmY+q+nq+TfKRJzLGXz3hufWtzihpXqENm8M6vL8+B+kuB7ECCr3T4vF
 Tg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ymQ8jzqMuT5; Thu,  6 Aug 2020 08:29:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id F307445F5F;
 Thu,  6 Aug 2020 08:29:14 +0300 (MSK)
Received: from [10.199.0.182] (10.199.0.182) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 6 Aug
 2020 08:29:14 +0300
Message-ID: <07bcb95098af1835736e41793ee64d151ed881f5.camel@yadro.com>
Subject: Re: OpenBMC : FRU Inventory management
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, <openbmc@lists.ozlabs.org>
Date: Thu, 6 Aug 2020 08:29:13 +0300
In-Reply-To: <9a43f76f-0e19-428b-8e79-292c37e6f8f9@linux.vnet.ibm.com>
References: <BN8PR12MB32822ADFBBC19F6B2FB08F52C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <e00d409b-a845-85ee-16d7-0bb53f1e013e@linux.vnet.ibm.com>
 <BN8PR12MB32820389DABEE2E32ED84E57C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <3b6f8a090359d4ffebf3ef98a9aeb7e77df7b10f.camel@yadro.com>
 <9a43f76f-0e19-428b-8e79-292c37e6f8f9@linux.vnet.ibm.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.182]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

Hi,

I tried to use EM + peci-pcie but faced strange issue: EM don't want to
probe devices in xyz.openbmc_project.PCIe. I tried some other places
like xyz.openbmc_project.Network but doesn't succeed also: the only way
it works is with xyz.openbmc_project.FruDevice. But I can't find
anything about interfaces filtering in EM sources, so I assume it
should work.
Is there any ideas, what I'm doing wrong?
Did someone tried to use EM with anything else but FruDevice?

PS: config example
{
    "Exposes": [
        {
            "Name": "my test",
            "property": {"key": "value"}
        }
    ],
    "Name": "PCIE Device",
    "Probe": "xyz.openbmc_project.PCIe({'Function0FunctionType':
'Physical'})",
    "Type": "Board",
    "xyz.openbmc_project.Inventory.Decorator.Asset": {
        "Manufacturer": "$Manufacturer",
        "DeviceType": "$DeviceType",
        "Function0DeviceClass": "$Function0DeviceClass",
        "Function0DeviceId": "$Function0DeviceId"
    }
}

On Mon, 2020-08-03 at 13:01 +0530, Deepak Kodihalli wrote:
> On 31/07/20 2:30 pm, Andrei Kartashev wrote:
> > Hi Deepak,
> > 
> > Saying about inventory management for non-BMC accessible resources
> > like
> > CPU/DIMM with EntityManager: is there good example demonstrated
> > preffered way to do so?
> 
> Hi Andrei,
> 
> I don't think there is code today that does this. We intend to do
> this 
> on IBM systems (using PLDM/MCTP). I had updated the PLDM design doc
> to 
> do something like this using entity manager : 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/32532/.
> 
> Regards,
> Deepak
> 
> > Trying to bring up system based on that Intel's fork, but looks
> > like
> > they have own way to do things ).
> > 
> > On Thu, 2020-07-30 at 13:55 +0000, Vasant Patil wrote:
> > > Thanks Deepak.
> > > Yes, This help. We will go with entity-manager option.
> > > 
> > > Regards,
> > > Vasant
> > > 
> > > -----Original Message-----
> > > From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
> > > Sent: Thursday, July 30, 2020 12:22 AM
> > > To: Vasant Patil <vasantp@nvidia.com>
> > > Cc: openbmc@lists.ozlabs.org
> > > Subject: Re: OpenBMC : FRU Inventory management
> > > 
> > > External email: Use caution opening links or attachments
> > > 
> > > 
> > > On 30/07/20 8:37 am, Vasant Patil wrote:
> > > > Hi Team,
> > > > 
> > > > We are enabling OpenBMC on x86 system. We would like to know
> > > > the
> > > > recommendation on FRU inventory management and corresponding
> > > > pointers.
> > > > 
> > > > There seems to be multiple options available
> > > > 
> > > >   1. described in  "Adding new system to OpenBMC
> > > >      <
> > > > https://github.com/openbmc/docs/blob/master/development/add-new-system.md>
> > > > ;"
> > > >      with  Yaml files (meta-romulus/recipes-phosphor/ipmi
> > > >      
> > > > <
> > > > https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus/
> > > > recipes-phosphor/ipmi>)
> > > > 
> > > >   2. Entity manager <https://github.com/openbmc/entity-manager>
> > > > with
> > > > JSON
> > > >      schema
> > > 
> > > Hi Vasant,
> > > 
> > > The commonly used option for this now is entity-manager. The
> > > entity-
> > > manager config JSONs enable entity-manager to monitor/probe FRU
> > > config information (FRU information read off of an EEPROM for eg)
> > > and
> > > then transform that to an inventory D-Bus object that implements
> > > an
> > > xyz.openbmc_project.Inventory.Item.<Type> interface. The
> > > webserver
> > > (bmcweb) then can relay this into a Redfish inventory
> > > representation.
> > > 
> > > To make the FRU EEPROM content available on D-Bus, anther app
> > > typically reads the EEPROM and then hosts the info on D-Bus. For
> > > eg
> > > the FruDevice daemon (which sits in the entity-manager repo)
> > > scans
> > > I2C connected EEPROMs, and can read IPMI FRU format data off of
> > > them.
> > > Now this info can actually be coming in via EEPROMs that the BMC
> > > can't access (and for eg the host CPU can) - in that case I would
> > > expect the FRU information to be transported over IPMI/PLDM, and
> > > then
> > > apps like host-ipmid or pldmd can place the FRU information on D-
> > > Bus,
> > > for entity-manager to consume.
> > > 
> > > > We are looking to enable below inventory (Both FRU and non-
> > > > FRU):
> > > > 
> > > >    * CPU
> > > >    * DIMM
> > > >    * M.2
> > > >    * U.2
> > > >    * Motherboard FRU EEPROM
> > > >    * Chassis FRU EEPROM
> > > >    * Add-on PCI cards
> > > >    * FANs
> > > >    * PSU
> > > >    * Etc.
> > > 
> > > You can look at
> > > https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Inventory/Item
> > > and define types that you don't find here.
> > > 
> > > Regards,
> > > Deepak
> > > 

