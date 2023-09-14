Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD67A06D1
	for <lists+openbmc@lfdr.de>; Thu, 14 Sep 2023 16:03:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kNrKT6BY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmfDQ2dNMz3cDd
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 00:03:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kNrKT6BY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Fri, 15 Sep 2023 00:02:43 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmfCl5pnSz3bxY
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 00:02:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694700164; x=1726236164;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=DdKffOgp7PV8c80Hu1kTqxceMnf+6HyHS09OuhcKt7Y=;
  b=kNrKT6BYmcjClYOS/ExagvHUZA0t3QLQmgE6LNR/86v45wzuKj0xYFAV
   WrwBwx7ELCO56mQ8PE/y/z4eodSLU2Drmm4qMe5shPfdthc/bsD3PycyA
   Ab1tCX5FNftp4bOM+oNe9hhgDx/KeH0PpoylDUMbxLUIKWW1oJwHCRUsP
   gS8Ancwn6vloS9kL3iMAyt06kdrUuzr0gOSFhPKxPucK/Uviq75ccjTmK
   UzloAXgewPl9MSloELk8aPMzHhSjp2NpwWeUys+GIeqqZ11tpMPAyTowy
   Y0DVyDKHzWcquO8Zg7LiwMLVHHdsOqlkrcvbrYnQJb2PG5BIu4nhX29YR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="377864120"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="377864120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 07:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="887838433"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="887838433"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 07:00:58 -0700
Received: from [10.209.128.177] (jmbills-mobl1.amr.corp.intel.com [10.209.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id AFF8B580D78
	for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2023 07:01:30 -0700 (PDT)
Message-ID: <263506b1-8182-fe92-4614-45f1d3b9c8ce@linux.intel.com>
Date: Thu, 14 Sep 2023 08:01:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Towards less magic strings.
To: openbmc@lists.ozlabs.org
References: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 9/14/2023 12:36 AM, Patrick Williams wrote:
> Greetings,
> 
> One annoyance of mine has been the large proliferation of magic strings
> related to dbus.  By a few simple calculations, it appears that we have
> somewhere between 670 and 4200 instances of "xyz.openbmc_project" or
> "/xyz/openbmc_project" sprinkled through the codebase:
> 
> ```
> $ find -type f -name "*.[ch]pp" -exec grep '"/\?xyz.openbmc_project' {} + | grep -v build | grep -v subprojects | grep -v .ccls-cache | wc
>     4161   13869  465728
> ```
> 
> https://github.com/search?q=org%3Aopenbmc+%2F%22%28%5C%2F%29%3Fxyz.openbmc_project%2F+language%3AC%2B%2B&type=code
> 
> When I look at these, the vast majority of them falls into 1 of 4
> different reasons:
>      - A well-known service name.
>      - A well-known path (or path prefix).
>      - An interface name.
>      - An enumeration value.
> 
> Today I merged support in the dbus YAML[1,2] to cover the first two
> cases.  The other two cases have long been covered by the dbus YAML.
> Thus, at this point, the vast majority of these magic strings can be
> eliminated and derived from constants that show up in the
> phosphor-dbus-interfaces headers.  I think it would be great if we
> could see some refactoring towards eliminating these magics.
> 
> Below is a "howto" on each of these string types.
> 
> ## Interface names
> 
> The interface xyz.openbmc_project.Foo.Bar has a number of header
> files which are generated:
>      - xyz/openbmc_project/Foo/Bar/common.hpp
>      - xyz/openbmc_project/Foo/Bar/client.hpp
>      - xyz/openbmc_project/Foo/Bar/server.hpp
>      - xyz/openbmc_project/Foo/Bar/aserver.hpp
> 
> These headers will give you the constant:
> 
>      sdbusplus::common::xyz::openbmc_project::foo::Bar::interface
> 
> Any of the non-common headers also alias this into their own
> namespace/types as appropriate.  Eg.
> 
>      sdbusplus::server::xyz::openbmc_project::foo::Bar::interface
> 
> ## Enumeration values.
> 
> Any enumeration xyz.openbmc_project.Foo.Bar.Baz.{Value1, Value2} has
> an `enum class Baz` defined in all the same header files.
> 
>      - xyz/openbmc_project/Foo/Bar/common.hpp
> 
> This enum class is intended to be used in your C++ code rather than
> strings.  sdbusplus already has automatic conversion to/from the C++
> enum-class and dbus-strings.  If for some reason (rare, but maybe for
> serialization to a file) you want to explicitly do one of these
> conversions, `sdbusplus::message::convert_to_string` and
> `sdbusplus::message::convert_from_string` are what you should use.
> 
> ## Service Names
> 
> I think it should be rare that you need a hard-coded service name in
> your code, since typically you'll want to do some kind of mapper lookup
> (based on the interface constants mentioned above).  There are a few
> cases where we use explicit service names, such as mapper itself.
> The [1] commit mentioned above documents a way to add these to the YAML.
> 
> Typically I expect to see a new YAML entry in Foo.Bar:
> 
> ```yaml
> service_names:
>      default: xyz.openbmc_project.Foo.BarService
> ```
> 
> This will create `xyz::openbmc_project::foo::Bar::default_service`
> constant.
> 
> If you have multiple services you want documented, the YAML and
> generator supports that, but I'll be somewhat surprised to see any.
> 
> ## Paths
> 
> Similar to the service names, we sometimes have static paths.  There are
> 3 classifications of these in my mind:
> 
>      - An explicit path to a singleton instance (typically called the
>        "manager").
>      - A path prefix to a collection of objects (I call this the
>        "namespace").  You see this in logging, sensors, etc.
>      - A path segment used to identify a purpose for a particular
>        instance.
> 
> All 3 of these are now supported by the generator, with similar YAML:
> 
> ```yaml
> paths:
>      - instance: /xyz/openbmc_project/Foo/Manager
>      - namespace: /xyz/openbmc_project/Foo
>        segments:
>          - name: Bar
>          - name: Baz
> ```
> 
> This will create the following constants:
> 
> - sdbusplus::common::xyz::openbmc_project::Foo::instance_path
> - sdbusplus::common::xyz::openbmc_project::Foo::namespace_path::value
> - sdbusplus::common::xyz::openbmc_project::Foo::namespace_path::bar
> - sdbusplus::common::xyz::openbmc_project::Foo::namespace_path::baz
> 
> ---
> 
> Hopefully these are useful and we can start to work towards eliminating
> the vast majority of the magic-strings.  Please reach out if you'd like
> more details or if something is not working correctly (I already fixed
> one oversight while writing this email[3]).

Thanks for this guide and improvements, Patrick!

I have seen a couple advantages to the magic strings that seem to make 
debugging easier between using something like busctl on a system and 
looking at the source code.

One is going from busctl to source, it's easy to copy the string from 
busctl and search the source for that string.

The other is going from source to busctl, it's easy to copy the strings 
from the source into busctl to see the results from D-Bus.

Do you have any tips on how to do these kinds of busctl<->source 
conversions using dbus-YAML that will help as we start removing the 
magic strings?

> 
> [1]: https://gerrit.openbmc.org/c/openbmc/sdbusplus/+/66364
> [2]: https://gerrit.openbmc.org/c/openbmc/sdbusplus/+/66429
> [3]: https://gerrit.openbmc.org/c/openbmc/sdbusplus/+/66597
> 
