Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC438183500
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 16:33:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dXsP3YblzDrJ5
	for <lists+openbmc@lfdr.de>; Fri, 13 Mar 2020 02:33:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dXrY3q3bzDqQR
 for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2020 02:32:27 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 08:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="443975039"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 08:32:23 -0700
Received: from [10.254.73.52] (jmbills-mobl.amr.corp.intel.com [10.254.73.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3A62F58033E
 for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2020 08:32:23 -0700 (PDT)
Subject: Re: How to deal some fatal error causing from host in openbmc
To: openbmc@lists.ozlabs.org
References: <24ed437.6642.170cd792d39.Coremail.zhang_cy1989@163.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <f5e0cb22-ea6a-d644-e42f-ab586dabce18@linux.intel.com>
Date: Thu, 12 Mar 2020 08:32:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <24ed437.6642.170cd792d39.Coremail.zhang_cy1989@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 3/11/2020 11:40 PM, zhang_cy1989 wrote:
> Dear All
>       There are some fatal errors in host side.
>        Ex:
>             Uncorrectable ECC/ other uncorrectable memory error
>             Unrecoverable hard-disk device failure...
>             PCIE AER and so on.
>        How dose BMC get all reasons of those fatal errors?
>        BIOS gives those informations to BMC by ipmi?
For Intel platforms, most of those errors (ECC, PCIe, etc.) are handled 
and reported by BIOS over IPMI.

>        Or like peci in intel platform?
For errors that hang the host (IERR, ERR[2] timeout, etc.) the BMC 
detects it by GPIO and uses PECI to get additional info about the error.

> 
>        What recipes  can I refer to in openbmc?
You can see the current Intel host-error-monitor application here: 
https://github.com/Intel-BMC/host-error-monitor.

>        Wating for your help!
>        Thanks.
> Felix
> 
> 
