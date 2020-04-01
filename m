Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A319B5A4
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 20:36:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48svzT67przDr10
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 05:36:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48svxz6gVlzDr83
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 05:35:02 +1100 (AEDT)
IronPort-SDR: yBS6p/gbse6VNRoOFgRwq/0BppXL5/raCLP3+ZkGGoypzWxnaGs+2w3Kx32DWnoFqPV6833zlo
 vO8fZ2QCEawg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 11:34:53 -0700
IronPort-SDR: sQudz6lpv0a1NmhL6waWvIZnjC9OH1Qa3cIB2X4/K7DAJSQuSNYoGDf8BKi8NkHlOOV3Mpjx+k
 YMhOPsql2A2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; d="scan'208";a="238267623"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 01 Apr 2020 11:34:33 -0700
Received: from [10.212.83.15] (jmbills-mobl.amr.corp.intel.com [10.212.83.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 07B815803DA
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 11:34:32 -0700 (PDT)
Subject: Re: New repos request
To: openbmc@lists.ozlabs.org
References: <7388c9a0-20da-a9a2-af08-76d3e4aca4f1@linux.intel.com>
 <56BA4944-EF73-40E7-9E16-35A327A2DC9B@fuzziesquirrel.com>
 <723777DD-6CF7-4C46-B79D-BE2AAF66C693@fb.com>
 <da673369-58c1-e64a-72ac-75283ae3c7fc@linux.intel.com>
 <53BBA343-A673-4762-997A-47A26EA1EF36@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <e497c65a-7283-f623-2f8f-7a48e3ed6ef7@linux.intel.com>
Date: Wed, 1 Apr 2020 11:34:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <53BBA343-A673-4762-997A-47A26EA1EF36@fb.com>
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



On 3/31/2020 12:58 PM, Vijay Khemka wrote:
> 
> 
> ﻿On 3/31/20, 12:34 PM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
> 
>      
>      
>      On 3/31/2020 10:03 AM, Vijay Khemka wrote:
>      > Hi Jason,
>      > Can we get some details about these repos like features, usage.
>      Sure. I will update the ones that I know below but will have to depend
>      on others to add more detail.
>      >
>      > Regards
>      > -Vijay
>      >
>      > On 3/31/20, 8:45 AM, "openbmc on behalf of Brad Bishop" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of bradleyb@fuzziesquirrel.com> wrote:
>      >
>      >      at 4:05 PM, Bills, Jason M <jason.m.bills@linux.intel.com> wrote:
>      >
>      >      > Hi Brad,
>      >      >
>      >      > We're doing some housekeeping and have some code various places that we'd
>      >      > like to move into github.com/openbmc repos.
>      >      >
>      >      > I'd like to request the following four new repos, if possible:
>      >      > host-error-monitor
>      This application will monitor various GPIOs and signals from the host
>      and take the appropriate action when they are detected.  For example,
>      log the event, capture a crashdump, etc.
> 
> Why can't we use phosphor-gpio-montor for this. In my understanding, phosphor-gpio-monitor
> does the same.
Sorry, I wasn't aware of phosphor-gpio-monitor.  Right now it is all 
GPIOs, so could probably be done there.  Additional monitoring may be 
added in the future for non-GPIO signals.

>      
>      Will be ported from: https://github.com/Intel-BMC/host-error-monitor
>      
>      >      > libpeci
>      This is a library to provide an interface to the PECI driver.
>      
>      Will be ported from:
>      https://github.com/Intel-BMC/provingground/tree/master/libpeci
>      
>      >      > pfr-manager
>      Will be ported from:
>      https://github.com/Intel-BMC/provingground/tree/master/intel-pfr-manager
>      
>      >      > service-config-manager
>      Will be ported from:
>      https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager
>      
>      >      >
>      >      > Please let me know if you have any questions.  Thanks!
>      >      > -Jason
>      >
>      >      done!
>      Thanks, Brad!
>      >
>      >
>      
> 
