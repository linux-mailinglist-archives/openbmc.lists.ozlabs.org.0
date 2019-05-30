Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA3300D9
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 19:20:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FDqr02GDzDqXW
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 03:20:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FDqH0q1xzDqWm;
 Fri, 31 May 2019 03:20:09 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 10:20:05 -0700
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 10:20:05 -0700
Date: Thu, 30 May 2019 10:20:04 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: U-Boot environment management from userspace
Message-ID: <20190530172004.GA46814@mauery.jf.intel.com>
References: <20190528183802.GH15959@mauery.jf.intel.com>
 <e42fb92effbc990f60239377b05e3f4e@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e42fb92effbc990f60239377b05e3f4e@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29-May-2019 10:30 AM, Adriana Kobylak wrote:
>>Am I the only one that has a need for this or is there a wider
>>audience that would benefit?
>
>The software manager (phosphor-bmc-code-mgmt) relies on U-Boot 
>environment
>variables for managing the images like for determining which image to 
>boot
>from.
>
>>3) Use a one-shot service that parses the 'instance' to extract a
>>variable name and variable value. Then the variable could be activated
>>by launching ubootenv@foo=bar.service. This would require some fancy
>>parameter encoding to make it all work correctly to avoid string
>>injections.
>
>Yeah, we went that route with an obmc-flash-bmc-setenv@.service[1], with
>like you mentioned uses some 'fancy parameter encoding', ex:
>"obmc-flash-bmc-setenv@" + entryId + "\\x3d" + std::to_string(value) + 
>".service";
>
>This has worked so far but I'd be open on having a mapping of the env
>variables to D-Bus properties.
>
>>Reading U-Boot environment variables from userspace is not difficult,
>>but to do it in a standard way, (fw_printenv), it requires a fork and
>>exec.
>
>We're actually reading the mtd device to get the values of the variables
>to avoid having a 'system' or 'fork/exec' call, then we put those values
>in D-Bus properties under the software/ path. Having some other app do 
>that
>parsing would be nice especially if we're to expand the use of the 
>U-Boot
>env vars.
>
>---
>[1] https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/master/obmc-flash-bmc-setenv%40.service
>
>

Brad,

It sounds like Intel is not the only ones that might benefit from a 
service like this, so it might be a good time for a new project/repo. 

Could you create a new repo for us: phosphor-u-boot-env-mgr

--Vernon
