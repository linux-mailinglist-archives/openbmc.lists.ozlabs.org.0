Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 977CC12071A
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 14:26:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c29K30JKzDqNC
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 00:26:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c26q01ZKzDqVC
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 00:24:16 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 05:24:12 -0800
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="209299609"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.102.85.150])
 ([10.102.85.150])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 16 Dec 2019 05:24:11 -0800
Subject: Re: Fixing sdbusplus CI issues
To: Lei YU <mine260309@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
References: <CAARXrtnfDjG1jaSQPJ78t-bKM7R0-LgdmFWEmBfibSOeJ26J5g@mail.gmail.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <1d9f270a-4e9d-302b-1611-3f508159ae9b@linux.intel.com>
Date: Mon, 16 Dec 2019 14:24:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtnfDjG1jaSQPJ78t-bKM7R0-LgdmFWEmBfibSOeJ26J5g@mail.gmail.com>
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

+1, we have several changes waiting to be integrated, but blocked by CI

W dniu 12/16/2019 o 10:30, Lei YU pisze:
> This email is to introduce a few changes to sdbusplus to fix the CI issues.
> 
> You may have noticed that sdbusplus has no change for a long time, and
> the CI is broken on the latest OpenBMC.
> 
> The CI has two issues:
> 1. The case VtableTest.SameContent() fails
> 2. Valgrind reports an error about "Syscall param epoll_ctl(event)
> points to uninitialised byte(s)", on ppc64le, but not on x86-64.
> 
> For 1), it is the bug in sdbusplus that vtable.hpp does not handle the
> member added in the newer version of systemd.
> It could be fixed with
> https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/27949, see
> the gerrit link for details.
> 
> For 2), it is a bit more complicated, it's caused by code in systemd,
> and eventually, it's a GCC bug. (And thanks @Andrew Jeffery for the
> help on debugging the issue)
> See below for details.
> 
> TL;DR
> 
> Here let me explain the above issue 2).
> 
> 1. GCC has a bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77992,
> that the padding bytes are not initialized in case of such code:
> 
>      struct S {
>          long l;
>          char c;
>      };
> 
>      void main () {
>          struct S s ={
>              .l = 0,
>              .c = 0
>          };
>      }
> 
> 2. In systemd, the code in [libsystemd/sd-event/sd-event.c][1] using
> epoll_event hit the above bug:
> 
>      ev = (struct epoll_event) {
>          .events = EPOLLIN,
>          .data.ptr = d,
>      };
> 
> Because epoll_event is defined as
> 
>      typedef union epoll_data
>      {
>        void *ptr;
>        int fd;
>        uint32_t u32;
>        uint64_t u64;
>      } epoll_data_t;
> 
>      struct epoll_event
>      {
>        uint32_t events;      /* Epoll events */
>        epoll_data_t data;    /* User data variable */
>      } __EPOLL_PACKED;
> 
> In glibc, on x86, `__EPOLL_PACKED` is defined as `__attribute__
> ((__packed__))`[2], so it's packed and there are no internal padding
> bytes;
> On other architectures (e.g. ppc64le), __EPOLL_PACKED is not defined
> and thus there are 4 internal padding bytes between `events` and
> `data`, that are not initialized.
> 
> 3. When epoll_ctl() is invoked, in [Linux kernel][3], it does a
> copy_from_user() to copy the whole struct into kernel space. That's
> why Valgrind reports "epoll_ctl(event) points to uninitialised
> byte(s)", only for non-x86 platforms.
> 
> 4. sdbusplus has a timer test that invokes sd_event_add_time() and
> eventually hit the above code. And in OpenBMC CI there are x86-64 and
> ppc64le systems.
>     * When the build is run on x86-64, there is no Valgrind error;
>     * When the build is run on ppc64le, we got the error.
> 
> To fix that issue, we could:
> 1. Wait for the GCC bug to be fixed, which is not likely to happen.
> The bug was opened in 2016 on GCC 5.4.0, now the issue remains on GCC
> 9.2.1 as well...
> 2. Workaround the issue by initializing strict epoll_event to 0. I
> send a PR to systemd https://github.com/systemd/systemd/pull/14353,
> but not sure if it will be accepted or not.
> 3. If the above is not accepted, we have to suppress the Valgrind
> error. It is sent to gerrit as well:
>     https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/25548
> 
> So if you think GCC or systemd could be fixed, could you please go to
> the GCC bug or the systemd PR and leave comments to help to push the
> fix?
> Or if you think it's acceptable to suppress the Valgrind error, please
> give +1 on the gerrit review.
> 
> Thanks!
> 
> [1]: https://github.com/systemd/systemd/blob/v242/src/libsystemd/sd-event/sd-event.c#L956-L959
> [2]: https://github.com/bminor/glibc/blob/f1a0eb5b6762b315517469da47735c51bde6f4ad/sysdeps/unix/sysv/linux/x86/bits/epoll.h#L29
> [3]: https://github.com/torvalds/linux/blob/d1eef1c619749b2a57e514a3fa67d9a516ffa919/fs/eventpoll.c#L2095
> 
