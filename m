Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39828BD90
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 18:24:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C93t22M9qzDqbX
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 03:24:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C93s60wcRzDqb9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 03:23:52 +1100 (AEDT)
IronPort-SDR: GjbWzTB3KQS972d1sc49lW6qxT/3sSmqwke2c9mNjxf7fat5KEDn1hASAfsE2elok2y3ST5Slq
 BoWMQ/UGIS+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="183229481"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="183229481"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 09:23:46 -0700
IronPort-SDR: GVVhX2wSuvGM3J8HAqMkgI+RJclZAeMqiDfYMWcUEjuRdSCw/E35T7Q7tfgRrLePH0T2eVCmnx
 Ir/69U/0ZWtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="317972043"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2020 09:23:44 -0700
Received: from [10.212.194.153] (jmbills-MOBL.amr.corp.intel.com
 [10.212.194.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 16B8F58084F
 for <openbmc@lists.ozlabs.org>; Mon, 12 Oct 2020 09:23:44 -0700 (PDT)
Subject: Re: [redfish/v1/Systems/system/Processors] How does it work on wolf
 pass?
To: openbmc@lists.ozlabs.org
References: <CAMXw96NCuqbeaOMQaO_BU2+_qQojOfLQdH-1=JS16vfanSZPdw@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <943f9c80-1f3c-b64d-1cb7-02b90d999be2@linux.intel.com>
Date: Mon, 12 Oct 2020 09:23:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMXw96NCuqbeaOMQaO_BU2+_qQojOfLQdH-1=JS16vfanSZPdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 10/9/2020 5:57 PM, Zhenfei Tai wrote:
> Hi,
> 
> I've been testing bmcweb and noticed the response from the URI 
> `redfish/v1/Systems/system/Processors` contains an empty collection.
> 
> {
>    "@odata.context": 
> "/redfish/v1/$metadata#ProcessorCollection.ProcessorCollection",
>    "@odata.id <http://odata.id>": "/redfish/v1/Systems/system/Processors/",
>    "@odata.type": "#ProcessorCollection.ProcessorCollection",
>    "Members": [],
>    "Members@odata.count": 0,
>    "Name": "Processor Collection"
> }
> 
> Looking at bmcweb code, it seems to look for dbus interfaces 
> `xyz.openbmc_project.Inventory.Item.Cpu` and 
> `xyz.openbmc_project.Inventory.Item.Accelerator`. However they can't be 
> seen in dbus.
> 
> # busctl tree --no-pager xyz.openbmc_project.Inventory.Item.Cpu
> Failed to introspect object / of service 
> xyz.openbmc_project.Inventory.Item.Cpu: The name is not activatable
> 
> Entity-manager and cpu-sensor are running in addition to bmcweb. The 
> entity-manager config is below and I can see the config is picked up in 
> `xyz.openbmc_project.EntityManager`.
> 
> {
>    "Exposes": [
>      {
>          "Address": "0x30",
>          "Bus": 0,
>          "CpuID": 1,
>          "Name": "CPU 1",
>          "Type": "XeonCPU"
>      },
>      {
>          "Address": "0x31",
>          "Bus": 0,
>          "CpuID": 2,
>          "Name": "CPU 2",
>          "Type": "XeonCPU"
>      }
>    ],
>    "Name": "internal_code_name",
>    "Probe": "xyz.openbmc_project.FruDevice({'BOARD_PRODUCT_NAME': 
> 'internal_product_name'})",
>    "Type": "Board"
> }
> 
> I'm not sure what else is required to have the URI work properly. Could 
> someone familiar with this issue help?
On Intel systems, we currently get most CPU information from the SMBIOS 
tables which are provided to the BMC through something called the MDR. 
That application is available here: https://github.com/Intel-BMC/mdrv2.

When we have seen empty CPU or memory resource collections in Redfish, 
it has usually been caused by a failure to get the SMBIOS data from BIOS.

> 
> Thanks,
> Zhenfei
