Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1746339BB6E
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 17:07:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxR2H3nzhz3090
	for <lists+openbmc@lfdr.de>; Sat,  5 Jun 2021 01:07:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxR1z3SZ5z300T
 for <openbmc@lists.ozlabs.org>; Sat,  5 Jun 2021 01:07:01 +1000 (AEST)
IronPort-SDR: c6xkqbShTCsLgN8L+Wu+tvMuAniFKEpfLohUhs8imGDEXhPr2hsys3SAr0PtaAD1p9CpQf7h1V
 +FnwToAup22Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="265468462"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="265468462"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 08:06:54 -0700
IronPort-SDR: +GvWKLU38tP7RKgZdOq/rQo9Fygy1kAnA6QUX8EiiMNvo5HabNjLFAriA6ikPjs6VszGbdWAZ6
 eRNHfqVEbhvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="446714996"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 04 Jun 2021 08:06:54 -0700
Received: from [10.212.230.147] (jmbills-MOBL.amr.corp.intel.com
 [10.212.230.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 441E35805A3
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jun 2021 08:06:54 -0700 (PDT)
Subject: Re: Power Restore Policy (Intel platform)
To: openbmc@lists.ozlabs.org
References: <88E210B7-A803-41D9-8261-6F291B092641@gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <d4dc9daf-4eea-03ac-ee81-52108b511303@linux.intel.com>
Date: Fri, 4 Jun 2021 08:06:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <88E210B7-A803-41D9-8261-6F291B092641@gmail.com>
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



On 6/3/2021 8:16 PM, 吳秉昌 wrote:
> Hi Teams
> 
> I am new to OpenBMC, In Power Restore Policy function, I setting "Always On” via web, and reboot the BMC (the system is power off), I expect the system will start, but it don’t.
> 
Hi Paul,

Welcome to OpenBMC!

In x86-power-control, the Power Restore Policy is only invoked after an 
AC-boot.  So, it doesn't happen just on a BMC reboot, the host has to 
lose power.

x86-power-control uses a D-Bus property from the settings application to 
determine if the BMC is booting from an AC recovery:
https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp#L968
         "xyz.openbmc_project.Settings",
         "/xyz/openbmc_project/control/host0/ac_boot",
         "org.freedesktop.DBus.Properties", "Get",
         "xyz.openbmc_project.Common.ACBoot", "ACBoot");

On our platforms we use a small shell script that runs on start-up to 
check the resetreason from u-boot and set the "ACBoot" property accordingly:
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-core/ac-boot-check/ac-boot-check/ac-boot-check.sh

> My system is intel platform, and already install x86-power-control.
> 
> All suggestions are welcome, very thanks
> 
> BR
> Paul
> 
