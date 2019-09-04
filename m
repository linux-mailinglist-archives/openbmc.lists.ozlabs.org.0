Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F8A77E2
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 02:28:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NPn52r0HzDqqD
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 10:28:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NPmV6mC9zDqVC
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 10:27:52 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 17:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; d="scan'208";a="194527176"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.254.64.140])
 ([10.254.64.140])
 by orsmga002.jf.intel.com with ESMTP; 03 Sep 2019 17:27:49 -0700
Subject: Re: phosphor-pid-control build failure with yocto head
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>
References: <907F7F17-6EC3-4F83-A2E4-3BBE764C72DD@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <b6be6eda-703f-7daf-b0ee-e8ed5f778645@linux.intel.com>
Date: Tue, 3 Sep 2019 17:27:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <907F7F17-6EC3-4F83-A2E4-3BBE764C72DD@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/2/2019 1:15 AM, Brad Bishop wrote:
> Hi James, Patrick
> 
> Updating our poky subtree to master HEAD exposes a build failure in 
> phosphor-pid-control.

Here's the bug, I've seen this before, it seems random when it happens 
and changing a few lines can make it go away. Something to do with lto...

main.o swampd-util.o  ./.libs/libswampd.a -lstdc++fs -lphosphor_logging 
-lsdbusplus -lsystemd -lphosphor_dbus
00:59:59 | lto1: internal compiler error: in add_symbol_to_partition_1, 
at lto/lto-partition.c:154
00:59:59 | Please submit a full bug report,
00:59:59 | with preprocessed source if appropriate.
00:59:59 | See <https://gcc.gnu.org/bugs/> for instructions.
00:59:59 | lto-wrapper: fatal error: arm-openbmc-linux-gnueabi-g++ 
returned 1 exit status
00:59:59 | compilation terminated.
00:59:59 | 
/tmp/openbmc/work/armv7a-openbmc-linux-gnueabi/phosphor-pid-control/0.1+gitAUTOINC+35906cc3d0-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/9.2.0/ld: 
error: lto-wrapper failed
00:59:59 | collect2: error: ld returned 1 exit status
00:59:59 | Makefile:919: recipe for target 'swampd' failed
00:59:59 | make[2]: *** [swampd] Error 1

What platform is gsj? We're currently behind tip, and it'll probably 
take me some time to catch up to be able to try anything this new.

> 
> GCC is asking for a bug to be opened.  Could find someone to have a look 
> at this so we can continue to pick up poky changes?
> 
> If you would like an openbmc tree to pull give this a try:
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/24783
> 
> thx - brad
