Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EAB8D87B6
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 19:12:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxyWQcCu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtKzQ6RrSz3clb
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 03:12:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxyWQcCu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 04 Jun 2024 03:12:04 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtKyr6PL3z3cf8
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2024 03:12:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717434726; x=1748970726;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=+BK8K2zrLcywPvQVJuelysY2uzln7nDf4goq7WlfGnc=;
  b=TxyWQcCukj0kUaxaREBwcV1pXT3xOL8DyhHGdnr8HU1MmzM08jChrenC
   k77eeD429n/RsYXcP17kW0F15ELtX5rQfYN8MNYnsga7ei4JLtriMxzW+
   gqS7VjbhYHxJBjUiEzDHOujre/5+BUrwNDjDsGmiErEcTqe7CR3Pgcj7G
   prZwkbYQqMo5ndKIzj2Y4ANwoyEPUWd4KG7EiDcy3fQ6/TmTfQ++Jlrms
   zXuuqBYbvoEv0Ko0DQ2UleHKdZzzPOmxpy/oL9gzNhZSrQDBMmXCUsNqc
   BZkRyGJ8u3/GjqFD8LqQLKloUqNrDiQB8HyaZpxO4NPL8mKU+RQSq4NyX
   w==;
X-CSE-ConnectionGUID: d9sODB8pQwOJ/kJzGfPnGA==
X-CSE-MsgGUID: 7EerZtD5QhiT5XBlysLaVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14098425"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="14098425"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 10:10:56 -0700
X-CSE-ConnectionGUID: DgAyjpgaQMCIGmVGMvAGQg==
X-CSE-MsgGUID: DJ6eVX75Qdaqmf8l4fWD6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="60117537"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 10:10:55 -0700
Received: from [10.124.42.79] (jmbills-mobl1.amr.corp.intel.com [10.124.42.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 52CA820B5705
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 10:10:54 -0700 (PDT)
Message-ID: <d7b8e49b-a13a-4756-90ae-1444478b1029@linux.intel.com>
Date: Mon, 3 Jun 2024 11:10:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Server unable to start after OpenBMC flash
To: openbmc@lists.ozlabs.org
References: <CAGUjZ4EuoJFL4N3F4+Knnb+hudHtrMKpCo3UJ=LqrwgOXZxRKQ@mail.gmail.com>
 <Zl3xfZkFlAqGcm4L@heinlein.vulture-banana.ts.net>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <Zl3xfZkFlAqGcm4L@heinlein.vulture-banana.ts.net>
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



On 6/3/2024 10:38 AM, Patrick Williams wrote:
> On Mon, Jun 03, 2024 at 06:35:42PM +0530, aayushi chauhan wrote:
>> *Unexpected behavior you saw*
>> After flashing the Intel GNR-based motherboard with the OpenBMC image built
>> with version 2.14.0, the BMC successfully starts but the server doesn't
>> start and is stuck at LED post code 0x02.
>>
>> I tried using an image built with the older commit but it didn't work.
>>
>> *Expected behavior*
>> The server is supposed to start.
>>
>> *To Reproduce*
>> Steps to reproduce the behavior:
>>
>>     1. '. setup evb-ast2600'
> 
> This is image for an "evaluation board" from Aspeed.  It is not a
> managed server board and isn't likely to work for this motherboard you
> are referring to.
> 
> I don't know what GNR is but maybe someone from Intel knows better.

GNR is a shortened form of the Intel CPU codenamed Granite Rapids.

Please reach out to your Intel support representative to get help with 
building a BMC firmware image that supports the Intel reference platform.

> 
>>     2. 'bitbake obmc-phosphor-image'
>>     3.  Flash the image to the BMC
>>     4. Power on the system
>>
>>
>> -> BMC boot up, server stuck at LEPPostcode 0x02.
> 
