Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3186F48B5B
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 20:08:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SK2J4NCKzDqVK
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 04:08:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SK1d3GtbzDqQq
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 04:07:31 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 11:01:45 -0700
X-ExtLoop1: 1
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.87.181])
 ([10.252.87.181])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2019 11:01:43 -0700
Subject: Re: Move away from default password
To: Joseph Reynolds <jrey@linux.ibm.com>, Openbmc <openbmc@lists.ozlabs.org>
References: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <1ec23c9c-6fd1-1a37-150e-6ac7c950cc0d@linux.intel.com>
Date: Mon, 17 Jun 2019 23:31:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Joseph,

#1 is not yet covered in any docs yet, but 
https://github.com/openbmc/docs/blob/master/user_management.md#deployment---out-of-factory 
this covers the out of factory deployment.

Regards,

Richard


On 6/17/2019 10:16 PM, Joseph Reynolds wrote:
> There is some interest in moving OpenBMC away from a default password.
> - email: 
> https://lists.ozlabs.org/pipermail/openbmc/2019-June/016515.html 
> (which references a RestrictionMode design: 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21195)
>
> Having a default password is a security risk.  Note that changing to a 
> different default password is not a good solution.  For example, if a 
> bad actor learns the default password from one device, that actor will 
> likely know the password for many of them.
>
> I am exploring two options for OpenBMC, and want your feedback.
>
> 1. Unique password per BMC.
> In this approach, there is a way to change the factory default 
> password.  Example flow: assemble the BMC, test it, factory reset, 
> generate unique password (such as `pwgen`), then use a new function 
> “save factory default settings” which would save the current setting 
> into a new “factory settings” flash partition. After that, a factory 
> reset would reset to the factory installed password, not to the 
> setting in the source code.
> Presumably the new factory default would be printed on a sticker, or 
> something.
> Are there any other factory settings (settings unique to each device) 
> that would benefit from being set like this?
> One downside to this approach is someone who orders 100 systems has to 
> enter 100 unique passwords.
>
> 2. Create new account on first access.
> Specifically, default OpenBMC to use a new RestrictionMode=SetupAccess 
> which:
>  - (A) requires users to set up their credentials (at least: remove 
> the default password) before they can leave that mode, and
>  - (B) does not let the user do anything else, including other 
> provisioning or operating the host, while in this mode.
> So we could manufacture the BMC with a default password, but require 
> it to be changed as the first step to provision the BMC.
> We might want to make network services react to this new mode, for 
> example, the phosphor-webui GUI would likely want to handle this 
> specially, and most REST APIs would be restricted.
> Note this approach gives an attacker a window of time before the 
> credentials are set up.
>
> I believe both of these approaches represent reasonable security 
> practices which may satisfy laws regarding consumer products.  For 
> example, CA Law SB-327 
> https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=201720180SB327
>
> Are there guidelines we can follow?  Can you find additional 
> vulnerabilities with these approaches?  Can we do better than this 
> without requiring additional infrastructure?
>
> I plan to discuss this at the 2019-06-26 Security working group 
> meeting: 
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/
> and would be happy to see ideas here.
>
> - Joseph
>
