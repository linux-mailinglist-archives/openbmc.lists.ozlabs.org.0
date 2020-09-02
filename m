Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D69125B3B0
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 20:25:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhXRr4YX9zDr27
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 04:25:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhXQz3hzSzDqx2
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 04:24:41 +1000 (AEST)
IronPort-SDR: KRqWRK1YU0ZBvEQOU8IHxqGe8qG2vLObdMLuXwnNplE+gtW778naRaoiM2KYG6v5KR+p3nMliX
 XUIna5rYMIxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="136974442"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="136974442"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 11:24:37 -0700
IronPort-SDR: 6Rj+bATD+BkLDPH1fu344TehGS28+kQ9DIXHZNIyS5Kv3K6KCOrF8h1WXPf8cO9Y4l/bbZp6zT
 r0AWdRyHTXPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="331520541"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 02 Sep 2020 11:24:37 -0700
Received: from [10.212.148.106] (jmbills-MOBL.amr.corp.intel.com
 [10.212.148.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1D9C758010E
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 11:24:37 -0700 (PDT)
Subject: Re: Need update CI build config for new repo smbios-mdr.
To: openbmc@lists.ozlabs.org
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200901162333.GT3532@heinlein> <20200901164139.GV3532@heinlein>
 <SN6PR11MB352047845E48681E8F71B139902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200902154944.GW3532@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <5e9cb6fe-ae95-422b-2d06-1ad2db40916e@linux.intel.com>
Date: Wed, 2 Sep 2020 11:24:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200902154944.GW3532@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
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



On 9/2/2020 8:49 AM, Patrick Williams wrote:
> On Wed, Sep 02, 2020 at 02:02:00AM +0000, Wang, Kuiying wrote:
>> Hi Williams,
>> The key thing is sdbusplus interface is not match.
>> You could config CI based on this patch https://gerrit.openbmc-project.xyz/#/c/openbmc/smbios-mdr/+/36011/
>> That's ok, if it can pass the build.
>>
>> Thanks,
>> Kwin.
>>
> 
> Here is a snippet of the compile log:
> 
> /home/jenkins-slave/workspace/ci-repository/openbmc/smbios-mdr/src/cpuinfo_main.cpp:34:10: fatal error: peci.h: No such file or directory
>     34 | #include <peci.h>
>        |          ^~~~~~~~
> compilation terminated.
> 
> 
> This one might be a missing dependency?  Where is 'peci.h' from?  Is it
> from a kernel header for the ioctls or some other repository?  Do you
> need to stub this out when building on x86?
peci.h comes from libpeci which needs to be pulled in as an 
ExternalProject in CMake when not building with Yocto.

Here is an example of how I got libpeci working for the 
host-error-monitor to pass CI: 
https://gerrit.openbmc-project.xyz/c/openbmc/host-error-monitor/+/32545/1/CMakeLists.txt.

> 
> 
> make[2]: *** [CMakeFiles/cpuinfoapp.dir/build.make:63: CMakeFiles/cpuinfoapp.dir/src/cpuinfo_main.cpp.o] Error 1
> make[1]: *** [CMakeFiles/Makefile2:78: CMakeFiles/cpuinfoapp.dir/all] Error 2
> make[1]: *** Waiting for unfinished jobs....
> In file included from /home/jenkins-slave/workspace/ci-repository/openbmc/smbios-mdr/src/cpu.cpp:17:
> /home/jenkins-slave/workspace/ci-repository/openbmc/smbios-mdr/include/cpu.hpp:113:17: error: âstd::string phosphor::smbios::Cpu::processorSocket(std::string)â marked âoverrideâ, but does not override
>    113 |     std::string processorSocket(std::string value) override;
> 
> This appears to be a case where the current phosphor-dbus-interfaces
> doesn't match whatever your commit is trying to do.  You've got
> additional methods for handling dbus properties, but those properties do
> not exist in phosphor-dbus-interface's Cpu interface.
> 
> I suspect you're trying to implement
> xyz/openbmc_project/Inventory/Item/Cpu, which has a 'Socket' property
> but not a 'ProcessorSocket'.  If I recall, this happened in the code
> review where the "Processor" part was requested to be removed since it
> was redundant.
> 
> There are a number of other properties in your compile fail that need
> similar updating.
> 
