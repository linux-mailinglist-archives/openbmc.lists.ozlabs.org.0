Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D34963D2E5
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 18:46:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NbWC1V9nzDqgX
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 02:46:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NZNP5RsDzDqNV
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 01:55:42 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 08:55:40 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga007.fm.intel.com with ESMTP; 11 Jun 2019 08:55:39 -0700
Subject: Re: About the external project of sdbusplus in bmcweb
To: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAARXrtkeMTts2GXpqjwNM6danj0jZoZVnkvJLKgo=416LheqRQ@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <d99f8d73-f648-df65-2c87-00f398e6dd35@intel.com>
Date: Tue, 11 Jun 2019 08:55:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtkeMTts2GXpqjwNM6danj0jZoZVnkvJLKgo=416LheqRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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

On 6/11/19 2:29 AM, Lei YU wrote:
> While I was adding some new function in sdbusplus, it's found that bmcweb is
> not working correctly, that it always gives errors like below.
> 
>     Jun 11 09:14:26 romulus bmcweb[1501]: terminate called after
> throwing an instance of 'sdbusplus::exception::SdBusError'
>     Jun 11 09:14:26 romulus bmcweb[1501]:   what():  sd_bus_process
> discard: org.freedesktop.DBus.Error.AccessDenied: Operation not
> permitted

It should be noted, I am not seeing this behavior in my builds.

> 
> Then it's noticed that bmcweb is using its own revision of sdbusplus during
> build, as external project in "CMakeLists.txt.in"

https://github.com/openbmc/bmcweb/blob/6ca6ac12e62bd8bfbdb9a24bbfded4a138a1150a/CMakeLists.txt#L9
https://github.com/openbmc/bmcweb/blob/6ca6ac12e62bd8bfbdb9a24bbfded4a138a1150a/CMakeLists.txt#L142

Notice the YOCTO_DEPENDENCIES option.  When bmcweb is built within yocto
(which should be a majority of the time), it relies on the sdbusplus
version that yocto has decided, and ignores its own.  The
CMakeLists.txt.in is only used when building out of the yocto tree, to
enable static analysis tools to function without having to static
analyze the entire codebase.

> 
> It's worrying that one should expect that the whole build of OpenBMC should
> use a single sdbusplus lib defined in
> meta-phosphor/recipes-extended/sdbusplus/sdbusplus_git.bb, but apparently
> it's not for bmcweb, and that results in the weird behavior.

See above, my understanding is that bmcweb should be using the single
sdbusplus lib.

> 
> When I change the "CMakeLists.txt.in" to use the same revision as the one in
> sdbusplus_git.bb, the issue is gone and bmcweb behaves normally.

This is really confusing to me.  When building the openbmc image, this
should have zero effect.  Can you verify you're building with "bitbake
obmc-phosphor-image"?  What machine are you building for?

> 
> So the question is, why bmcweb uses sdbusplus this way? Is it possible to make
> it just link against sdbusplus like other repos?
> 

See above about static analysis, and building out of the yocto tree.
