Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F35F7EC6A0
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 17:23:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474SDs03sCzF7F0
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 03:23:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474S9b0KnfzF7Dm
 for <openbmc@lists.ozlabs.org>; Sat,  2 Nov 2019 03:21:05 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 09:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="400897869"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2019 09:21:02 -0700
Subject: Re: How to run tests in bmcweb
To: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAARXrtkwC6CoVFDYwwtD38U5whRTbuodxWUF3A0DM+XvQoPJfA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <c6719aad-1d87-318b-a680-df8844bf6a7c@linux.intel.com>
Date: Fri, 1 Nov 2019 09:21:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtkwC6CoVFDYwwtD38U5whRTbuodxWUF3A0DM+XvQoPJfA@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/1/19 1:59 AM, Lei YU wrote:
> I am trying to add a unit test case in bmcweb and run it.
> With local CI, the tests are not run:
> 
>   WORKSPACE=$(pwd) UNIT_TEST_PKG=bmcweb
> ./openbmc-build-scripts/run-unit-test-docker.sh
>   ...
>   [100%] Built target bmcweb
>   /home/leiyu/work/bmcweb > ctest .
>   Test project /home/leiyu/work/bmcweb
>   No tests were found!!!
>   ...
> 
> So the question is, how do I run tests in bmcweb? Should
> openbmc-build-scripts be updated to support that?

I believe the tests in bmcweb have degraded and stopped working, so they 
were disabled. I haven't run them myself, so I'm not sure how bad they 
degraded. If you want to try to run them locally you need to pass
-DBMCWEB_BUILD_UT=1 when you run the cmake command.

https://github.com/openbmc/bmcweb/blob/c78d791eb1fa9d12e987e7b1ad885ada92d0757a/CMakeLists.txt#L292


openbmc-build-scripts is fine the way it is, if the unit tests are fixed 
then we can simply change if (BMCWEB_BUILD_UT) into if (NOT 
YOCTO_DEPENDENCIES) and the build scripts know how to take over.

https://github.com/openbmc/bmcweb/blob/c78d791eb1fa9d12e987e7b1ad885ada92d0757a/CMakeLists.txt#L206

FWIW Entity-manager has an example of running tests in CMake that works 
with openbmc-build-scripts 
https://github.com/openbmc/entity-manager/blob/f2ad76b32cea5170a5a9a631f49935ae3dd4626d/CMakeLists.txt#L113


-James

> 
> Thanks!
> 
