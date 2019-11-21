Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B8D10589A
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 18:33:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JmqN5VKlzDqTF
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 04:33:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JmpW3V5nzDq6M
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 04:32:17 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 09:32:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,226,1571727600"; d="scan'208";a="205218396"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 21 Nov 2019 09:32:13 -0800
Received: from [10.241.245.76] (unknown [10.241.245.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2FBCC58049B
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 09:32:13 -0800 (PST)
Subject: Re: How to build for s2600wf ? Does it work at all?
To: openbmc@lists.ozlabs.org
References: <29e500ed-2f4c-5e44-02fc-80b44e1c6623@yadro.com>
 <4844180beece41d08af0206779f6286d@SCL-EXCHMB-13.phoenix.com>
 <22d986a3-8525-b30c-2db3-5c63e55a1abe@yadro.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <bc283b6a-fb40-2980-faed-aed0bb717458@linux.intel.com>
Date: Thu, 21 Nov 2019 09:32:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <22d986a3-8525-b30c-2db3-5c63e55a1abe@yadro.com>
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



Hi Alexander,

On 11/21/2019 1:58 AM, Alexander Amelkin wrote:
> Thank you Bruce!
> 
> Unfortunately, this procedure results in as non-functional an image as 
> the default openbmc build procedure does.
> 
> The boot log is cleaner, but the final result is the same: no way to 
> control power, and a crashing network driver:
> 
> --------------------------------------------------
> 
> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 
> wolfpass ttyS4
> 
> wolfpass login: [  107.121476] ------------[ cut here ]------------
> [  107.126171] WARNING: CPU: 0 PID: 1635 at net/sched/sch_generic.c:461 
> dev_watchdog+0x230/0x24c
> [  107.134834] NETDEV WATCHDOG: eth1 (ftgmac100): transmit queue 0 timed out
> [  107.141718] CPU: 0 PID: 1635 Comm: swampd Not tainted 
> 4.19.29-9bd1e03005e74ecfe16f58143714f25793ae1c5d #1
> [  107.151284] Hardware name: Generic DT based system
> [  107.156157] Backtrace:
> [  107.158675] [<80107ddc>] (dump_backtrace) from [<80108010>] 
> (show_stack+0x20/0x24)
> [  107.166341]  r7:80594a00 r6:00000009 r5:00000000 r4:9e1c3e1c
> [  107.172124] [<80107ff0>] (show_stack) from [<80682b2c>] 
> (dump_stack+0x20/0x28)
> [  107.179376] [<80682b0c>] (dump_stack) from [<801163f0>] 
> (__warn.part.3+0xb4/0xdc)
> [  107.186972] [<8011633c>] (__warn.part.3) from [<80116484>] 
> (warn_slowpath_fmt+0x6c/0x90)
> [  107.195160]  r6:000001cd r5:80843dac r4:80a03008
> [  107.199818] [<8011641c>] (warn_slowpath_fmt) from [<80594a00>] 
> (dev_watchdog+0x230/0x24c)
> [  107.208081]  r3:9e63a800 r2:80843d70
> [  107.211741]  r7:80a12b60 r6:9e63a800 r5:00000000 r4:9e63aa2c
> [  107.217493] [<805947d0>] (dev_watchdog) from [<801572b8>] 
> (call_timer_fn+0x3c/0x120)
> [  107.225357]  r7:805947d0 r6:00000100 r5:9e63aa2c r4:9e63aa2c
> [  107.231047] [<8015727c>] (call_timer_fn) from [<80157448>] 
> (expire_timers+0xac/0xb8)
> [  107.238886]  r7:00000000 r6:9e1c3ecc r5:9e1c3ecc r4:9e63aa2c
> [  107.244652] [<8015739c>] (expire_timers) from [<801574f0>] 
> (run_timer_softirq+0x9c/0x190)
> [  107.252914]  r9:80a03008 r8:80a12b60 r7:80a13860 r6:80a13860 
> r5:9e1c3ecc r4:9e1c3ecc
> [  107.260678] [<80157454>] (run_timer_softirq) from [<8010224c>] 
> (__do_softirq+0xdc/0x2f8)
> [  107.268856]  r9:00000100 r8:9d047a00 r7:ffffe000 r6:80a674b0 
> r5:00000002 r4:00000001
> [  107.276708] [<80102170>] (__do_softirq) from [<8011a490>] 
> (irq_exit+0xfc/0x110)
> [  107.284118]  r10:76f0d2b0 r9:7e80fbf4 r8:9d047a00 r7:00000000 
> r6:00000001 r5:80a46ed4
> [  107.292017]  r4:00000000
> [  107.294599] [<8011a394>] (irq_exit) from [<8014b20c>] 
> (__handle_domain_irq+0x60/0xb8)
> [  107.302535] [<8014b1ac>] (__handle_domain_irq) from [<80102164>] 
> (avic_handle_irq+0x68/0x70)
> [  107.310990]  r9:7e80fbf4 r8:00c5387d r7:00c5387d r6:ffffffff 
> r5:9e1c3fb0 r4:9d002620
> [  107.318834] [<801020fc>] (avic_handle_irq) from [<80101db4>] 
> (__irq_usr+0x54/0x80)
> [  107.326493] Exception stack(0x9e1c3fb0 to 0x9e1c3ff8)
> [  107.331627] 3fa0:                                     00000062 
> 76f0d2b0 7e80fbf4 415f4e60
> [  107.339865] 3fc0: 6c3f6059 00000000 000001e0 41704b28 415f4e59 
> 7e80fbf4 76f0d2b0 76f0d2b0
> [  107.348141] 3fe0: 415de108 7e80fb00 410fc214 410fa370 20000010 ffffffff
> [  107.354863]  r5:20000010 r4:410fa370
> [  107.358459] ---[ end trace 6fd5e4a9b4660326 ]---
>
This is an issue we were seeing for a while, but I think we have it 
resolved.  I'm working on another update that will hopefully resolve 
this one.

> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 
> wolfpass ttyS4
> 
> wolfpass login: root
> Password:
> root@wolfpass:~#
> root@wolfpass:~# power-control
> terminate called after throwing an instance of 
> 'sdbusplus::exception::SdBusError'
>    what():  sd_bus_request_name: org.freedesktop.DBus.Error.FileExists: 
> File exists
> Aborted
Power control should already be running as a systemd service, so this 
error is expected when trying to start the service again.

To use power control, you can use ipmitool power commands from the BMC 
command line:
ipmitool power status
ipmitool power on
ipmitool power off
etc.

Thanks,
-Jason

> root@wolfpass:~# obmcutil
> -sh: obmcutil: command not found
> root@wolfpass:~#
> 
> --------------------------------------------------
> 
> Any suggestions?
> 
> With best regards,
> Alexander Amelkin,
> 
> 19.11.2019 19:22, Bruce Mitchell wrote:
>>
>> https://github.com/Intel-BMC/openbmc#how-to-build-for-wolf-pass
>>
>> *From:*openbmc 
>> [mailto:openbmc-bounces+bruce_mitchell=phoenix.com@lists.ozlabs.org] 
>> *On Behalf Of *Alexander Amelkin
>> *Sent:* Tuesday, November 19, 2019 08:07
>> *To:* openbmc@lists.ozlabs.org
>> *Subject:* How to build for s2600wf ? Does it work at all?
>>
>> Hi all!
>>
>> We can't get OpenBMC to work with s2600wf.
>>
>> We tried openbmc/openbmc/master branch and got errors log from booted 
>> OpenBMC
>> (attached) regarding unavailability of power control, and also a 
>> netdev watchdog
>> timeout and a kernel crash.
>>
>> We tried Intel-BMC/master branch and got build errors, failed to build.
>>
>> We tried Intel-BMC/clean_builds branch and ended up with an almost 
>> clean boot
>> log, but no 'obmcutil' and no apparent way to start the host. The netdev
>> watchdog also crashed.
>>
>> Is there any instruction on how to properly build OpenBMC for s2600wf? 
>> Is it
>> actually supported at all?
>>
>> Thank you.
>>
>> -- 
>> With best regards,
>> Alexander Amelkin
>>
