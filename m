Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFCD81A38C
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 17:04:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLqDqb7z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwJJx5nLkz3cLv
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 03:04:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLqDqb7z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwJJL40rHz2xcv
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 03:03:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703088210; x=1734624210;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3kLCJZ+2gYDJ7cP0GWBxpaFG9ME8qZjLP+ARA41/m3o=;
  b=nLqDqb7zoyAqj4/lTfjz/SZ0F/2WPShF+zca1pXObwWynBtkQO7xmC/G
   cMDEUJUYSU4yrF7dagu6yaXWrwyepWqU1f2RkVbntdbu+vcmRhGUbMQho
   is18AolXDC7FfpBVSC07sSvyOCN+eUfUfJ+E/gIje1XdgXfmYXGOzO303
   vhDV1GMYDOdPES7nC0OK/lPA1esZJpNwjma2XEpyAWaceCOpTCTjTkFrP
   T9Xt1JJIftgtyoF6FbbjpR6qSTh3UYNiG8poCXtfv9cFC5AOfmNEfdIoO
   TvbmWHdFNVX0b50VqKvwwfM+bkbZma6ThyA6BYOUzC69GFa+8BTu2KnnV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="17388592"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="17388592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 08:03:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="17999537"
Received: from aambroze-mobl4.ger.corp.intel.com (HELO [10.217.160.83]) ([10.217.160.83])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 08:03:23 -0800
Message-ID: <fcd703f2-b05b-4c21-9d66-6506b7aafa01@linux.intel.com>
Date: Wed, 20 Dec 2023 17:03:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
Content-Language: pl
To: Patrick Williams <patrick@stwcx.xyz>
References: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
 <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
 <ZYMGqtn9XVgjkBj8@heinlein.vulture-banana.ts.net>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
In-Reply-To: <ZYMGqtn9XVgjkBj8@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: cezary.zwolak@intel.com, openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com, jozef.wludzik@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

What I mean are functional tests on target, with real BMC, board, and 
sensors.

Could you point me to examples where it's documented or done in 
automated CI for other subprojects?

Or perhaps do you meen that maintainer stalling the change until he 
makes sure it doesn't break various configurations is unacceptable? Then 
IMHO I won't aggree, as code compiled within unit tests is just one 
arch, yet alone separated from rest of the system.

Regards,
Adrian

W dniu 20.12.2023 o 16:22, Patrick Williams pisze:
> On Wed, Dec 20, 2023 at 03:18:38PM +0100, Ambrozewicz, Adrian wrote:
>>
>> Currently we've integrated proposed changes and wait for feedback from
>> automated regression test suite.
> 
> Hi Adrian,
> 
> What did you mean by this?  Commits go through CI when they are
> submitted.  I don't see any change in Gerrit for any of the 3 commits.
> 
> If you have an internal test suite you haven't contributed upstream and you
> are holding off merging commits until you run them through a private test suite,
> this is unacceptable for the open source project.
> 
