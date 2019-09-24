Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCCABCBB0
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 17:42:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d56R0v0qzDqTK
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 01:42:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d55m21JxzDqQm
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 01:41:46 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 08:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="364034224"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 24 Sep 2019 08:41:42 -0700
Subject: Re: MACHINE=s2600wf bitbake obmc-phosphor-image at HEAD fails
To: Patrick Venture <venture@google.com>
References: <CAO=notyvvVCNr3GG3fvWkXfUc_NA+ge-KyB7capWGymNBYQb2A@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <f6f6856a-0a84-3ff9-b624-5575169284ac@linux.intel.com>
Date: Tue, 24 Sep 2019 08:41:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notyvvVCNr3GG3fvWkXfUc_NA+ge-KyB7capWGymNBYQb2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 9/23/19 8:06 PM, Patrick Venture wrote:
> I'm hitting a build failure with intel-ipmi-oem on this platform.

This should have fixed it: 
https://github.com/openbmc/intel-ipmi-oem/commit/28c7290ce54fe46c9fd82fdcd1702088d621e694

Maybe you don't have the bump yet?

-James

> 
> | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:1849:9:
> error: no match for 'operator*' (operand type is
> 'boost::asio::yield_context' {aka
> 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> (*)(), boost::asio::executor> >'})
> |  1849 |         *(ctx->yield), ec, "xyz.openbmc_project.Settings",
> |       |         ^~~~~~~~~~~~~
> | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
> In function 'int ipmi::getCRConfig(ipmi::Context::ptr, const string&,
> ipmi::crConfigVariant&, std::chrono::microseconds)':
> | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:1869:9:
> error: no match for 'operator*' (operand type is
> 'boost::asio::yield_context' {aka
> 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> (*)(), boost::asio::executor> >'})
> |  1869 |         *(ctx->yield), ec, "xyz.openbmc_project.Settings",
> |       |         ^~~~~~~~~~~~~
> | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
> In function 'ipmi::RspType<unsigned char, unsigned char>
> ipmi::ipmiGetSecurityMode(ipmi::Context::ptr)':
> | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2486:9:
> error: no match for 'operator*' (operand type is
> 'boost::asio::yield_context' {aka
> 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> (*)(), boost::asio::executor> >'})
> |  2486 |         *ctx->yield, ec, restricionModeService,
> restricionModeBasePath,
> |       |         ^~~~~~~~~~~
> | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2500:9:
> error: no match for 'operator*' (operand type is
> 'boost::asio::yield_context' {aka
> 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> (*)(), boost::asio::executor> >'})
> |  2500 |         *ctx->yield, ec, specialModeService, specialModeBasePath,
> |       |         ^~~~~~~~~~~
> | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
> In function 'ipmi::RspType<>
> ipmi::ipmiSetSecurityMode(ipmi::Context::ptr, uint8_t)':
> | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2552:9:
> error: no match for 'operator*' (operand type is
> 'boost::asio::yield_context' {aka
> 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> (*)(), boost::asio::executor> >'})
> |  2552 |         *ctx->yield, ec, restricionModeService,
> restricionModeBasePath,
> |       |         ^~~~~~~~~~~
> | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2581:9:
> error: no match for 'operator*' (operand type is
> 'boost::asio::yield_context' {aka
> 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> (*)(), boost::asio::executor> >'})
> |  2581 |         *ctx->yield, ec, restricionModeService,
> restricionModeBasePath,
> |       |         ^~~~~~~~~~~
> 
> 
> Patrick
> 
