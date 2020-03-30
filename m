Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D21401987B7
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 01:03:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rp0N0TcDzDqkw
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 10:03:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rnzc0yFczDqkd
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 10:02:34 +1100 (AEDT)
IronPort-SDR: +ga2DfquYW7g5XXuztNr90wtDZsDMjaJ9Q9Ovcj8CkHORf2QVpQv7Wcrpo8r2jP11HacEF2LR7
 YJAt25St6R4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 16:02:31 -0700
IronPort-SDR: uSxTdlehieoVm8SSA5uAlHRj1Q1EF+j7UEeKOYDIv3NW67bk1vSCmbKlll4Jr+mB4fDqgC1Wuq
 DvmZhFKQSRGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; d="scan'208";a="272537236"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2020 16:02:31 -0700
Received: from [10.135.52.61] (jmbills-mobl.amr.corp.intel.com [10.135.52.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0A293580281;
 Mon, 30 Mar 2020 16:02:30 -0700 (PDT)
Subject: Re: Chassis sled cycle
To: Vijay Khemka <vijaykhemka@fb.com>,
 James Feist <james.feist@linux.intel.com>
References: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <478597bb-e9f9-d71c-bbf8-84ad79fd8821@linux.intel.com>
Date: Mon, 30 Mar 2020 16:02:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vijay,

On 3/30/2020 12:59 PM, Vijay Khemka wrote:
> Hi Jason,
> 
> We have a requirement of Chassis sled cycle and it can be achieved by 
> sending an i2c command to hotswap controller. Is there any plan to add 
> this feature in x86-power-control. It should take i2c bus address from 
> configuration file.
We don't have any platforms with this capability, so there are no plans 
to add this feature to x86-power-control.

> 
> Regards
> 
> -Vijay
> 
