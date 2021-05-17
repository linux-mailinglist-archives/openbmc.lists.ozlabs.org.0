Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD83338351D
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 17:18:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkN7N5j1hz2yyx
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 01:18:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkN762nH1z2xv4
 for <openbmc@lists.ozlabs.org>; Tue, 18 May 2021 01:18:08 +1000 (AEST)
IronPort-SDR: nu0DQVFjA1lOsuJTw4JfeMa+vpTR5ymmhos4cK96jLaX295lWkLJnFJGu+R2NJlh19PHlaO0OW
 qdstWw3LceDw==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="197404210"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="197404210"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 08:18:03 -0700
IronPort-SDR: eXvfjutzvvntSFjQmcHS1Rlss0219uyy/2O3HXrYO6JaOgTBjAJxtQQAgmkBCfmVQfrhHwDAHq
 v1J0mIusUhzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="630023084"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 17 May 2021 08:18:03 -0700
Received: from [10.209.96.152] (jmbills-MOBL.amr.corp.intel.com
 [10.209.96.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8684358033E
 for <openbmc@lists.ozlabs.org>; Mon, 17 May 2021 08:18:03 -0700 (PDT)
Subject: Re: Time for C++20.
To: openbmc@lists.ozlabs.org
References: <YHdMjAsKKA+BKW8X@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <0030cde6-7b48-2d21-1f26-629ca0ae661d@linux.intel.com>
Date: Mon, 17 May 2021 08:18:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YHdMjAsKKA+BKW8X@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
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



On 4/14/2021 1:11 PM, Patrick Williams wrote:
> Hello.
> 
> Per [1], as a project we've generally committed to using the latest C++
> standard.  C++20 was released in early Sept. 2020 and already had pretty
> decent compiler support at the time it was released.  We're currently
> using GCC10 and according to [2] it has support for nearly every C++20
> feature I could see us regularly wanting to use(*).  It seems like it
> is a reasonable time for us to move on to it.
> 
> * - Except I recall seeing some mention of std::source_location being
>      useful to fix some of the issues with phosphor-logging, but that
>      won't be available until GCC11.
I just remembered and was excited to finally use std::format only to 
find that it isn't available in GCC.  Even the example code on the 
reference page fails to run: 
https://en.cppreference.com/w/cpp/utility/format/format. :)

I couldn't find anywhere that GCC has plans to include std::format. 
Does anyone know if or when std::format might be added to GCC?

> 
