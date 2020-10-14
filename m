Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877628DE1C
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 11:58:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB7Cs6WZwzDqZ1
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 20:58:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=XNBhw3pk; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB7Bv2rGwzDqYt
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 20:57:59 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BCDA84137C
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 09:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1602669471; x=1604483872; bh=56VAc1P4279HzD/OwCcTu2xu7
 t/uDZZAinmLSehFXOw=; b=XNBhw3pkQB9A1bsM5lxrAFazuM6vjISOTdRsaFMxk
 EkJuzQa2d9tg4YEgmL18+nZ5J3bKJniWkHJULIeeYpDPFHTPqrKG5istpeRq2FGp
 N1FvNKYLVBugSt72B9CioT41RGAi+IJe95nrFgDC+PVzM3tbX+bRj0VmHFa4wBIR
 Ko=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPthPFzAcCqp for <openbmc@lists.ozlabs.org>;
 Wed, 14 Oct 2020 12:57:51 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B4B63412D0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 12:57:51 +0300 (MSK)
Received: from [10.199.1.14] (10.199.1.14) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 14
 Oct 2020 12:57:51 +0300
Message-ID: <6853d70a5f647ac66dded94db7425de046e238cb.camel@yadro.com>
Subject: Re: [redfish/v1/Systems/system/Processors] How does it work on wolf
 pass?
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Wed, 14 Oct 2020 12:57:50 +0300
In-Reply-To: <ea9b85fb-8951-5c25-bc42-6f6e636d347e@hyvedesignsolutions.com>
References: <CAMXw96NCuqbeaOMQaO_BU2+_qQojOfLQdH-1=JS16vfanSZPdw@mail.gmail.com>
 <943f9c80-1f3c-b64d-1cb7-02b90d999be2@linux.intel.com>
 <ea9b85fb-8951-5c25-bc42-6f6e636d347e@hyvedesignsolutions.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.1.14]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

It is already pulled: https://github.com/openbmc/smbios-mdr/
But.. The main problem here is that the BIOS has to know it should
share smbios table. Currently we struggling this problem since our BIOS
lack this ability and we have to implement it in BIOS.

BTW, I first time see this patch. According to what I know, today's
implementation is sending smbios table from BIOS to BMC via ipmi. There
are OEM commands for this implemented in intel-ipmi-oem.

On Wed, 2020-10-14 at 17:06 +0800, Brad Chou wrote:
> Hi Bills,
> 
> I am also interesting in this kind of SMBIOS table processing.
> 
> May I know if Intel has plan to pull this feature into 
> https://github.com/openbmc ?
> 
> 
> By the way, I notice that a patch is also required to make it work.
> 
> https://github.com/Intel-BMC/openbmc/blob/4c732e83b4ca9a869c0a3f6e9b7e22ac9c76a78f/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0035-Implement-a-memory-driver-share-memory.patch
> 
> It says BIOS is using BMC VGA shared memory to transfer the whole
> SMBIOS 
> table to BMC, particularly a 16MB size memory allocated at
> 0x9ff0:0000.
> 
> My question is, if the BMC VGA memory hardware strap settings is
> 64MB, 
> that is BMC already occupy all VGA memory as frame buffer.
> 
> Can BIOS still use the VGA share memory to transfer SMBIOS table ?
> 
> 
> Brad Chou
> 
> 
> On 10/13/20 12:23 AM, Bills, Jason M wrote:
> > [External E-mail] CAUTION: This email originated from outside of
> > the 
> > organization. Do not click links or open attachments unless you 
> > recognize the sender and know the content is safe.
> > 
> > 
> > 
> > 
> > On 10/9/2020 5:57 PM, Zhenfei Tai wrote:
> > > Hi,
> > > 
> > > I've been testing bmcweb and noticed the response from the URI 
> > > `redfish/v1/Systems/system/Processors` contains an empty
> > > collection.
> > > 
> > > {
> > >    "@odata.context": 
> > > "/redfish/v1/$metadata#ProcessorCollection.ProcessorCollection",
> > >    "@odata.id <http://odata.id>;": 
> > > "/redfish/v1/Systems/system/Processors/",
> > >    "@odata.type": "#ProcessorCollection.ProcessorCollection",
> > >    "Members": [],
> > >    "Members@odata.count": 0,
> > >    "Name": "Processor Collection"
> > > }
> > > 
> > > Looking at bmcweb code, it seems to look for dbus interfaces 
> > > `xyz.openbmc_project.Inventory.Item.Cpu` and 
> > > `xyz.openbmc_project.Inventory.Item.Accelerator`. However they
> > > can't 
> > > be seen in dbus.
> > > 
> > > # busctl tree --no-pager xyz.openbmc_project.Inventory.Item.Cpu
> > > Failed to introspect object / of service 
> > > xyz.openbmc_project.Inventory.Item.Cpu: The name is not
> > > activatable
> > > 
> > > Entity-manager and cpu-sensor are running in addition to bmcweb.
> > > The 
> > > entity-manager config is below and I can see the config is picked
> > > up 
> > > in `xyz.openbmc_project.EntityManager`.
> > > 
> > > {
> > >    "Exposes": [
> > >      {
> > >          "Address": "0x30",
> > >          "Bus": 0,
> > >          "CpuID": 1,
> > >          "Name": "CPU 1",
> > >          "Type": "XeonCPU"
> > >      },
> > >      {
> > >          "Address": "0x31",
> > >          "Bus": 0,
> > >          "CpuID": 2,
> > >          "Name": "CPU 2",
> > >          "Type": "XeonCPU"
> > >      }
> > >    ],
> > >    "Name": "internal_code_name",
> > >    "Probe":
> > > "xyz.openbmc_project.FruDevice({'BOARD_PRODUCT_NAME': 
> > > 'internal_product_name'})",
> > >    "Type": "Board"
> > > }
> > > 
> > > I'm not sure what else is required to have the URI work
> > > properly. 
> > > Could someone familiar with this issue help?
> > On Intel systems, we currently get most CPU information from the 
> > SMBIOS tables which are provided to the BMC through something
> > called 
> > the MDR. That application is available here: 
> > https://github.com/Intel-BMC/mdrv2.
> > 
> > When we have seen empty CPU or memory resource collections in
> > Redfish, 
> > it has usually been caused by a failure to get the SMBIOS data from
> > BIOS.
> > 
> > > Thanks,
> > > Zhenfei
-- 
Best regards,
Andrei Kartashev


