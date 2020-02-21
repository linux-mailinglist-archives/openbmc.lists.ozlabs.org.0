Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F5167D51
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 13:20:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48P9XK2hS5zDqM9
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 23:20:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48P9W950bnzDqkK
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 23:19:31 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 04:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="229834527"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.245.179])
 ([172.22.245.179])
 by orsmga008.jf.intel.com with ESMTP; 21 Feb 2020 04:19:26 -0800
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
To: openbmc@lists.ozlabs.org
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
 <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <2b30dde7-3415-8c7a-2001-28793e938339@linux.intel.com>
Date: Fri, 21 Feb 2020 13:19:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 20-Feb-20 17:26, Patrick Williams wrote:
> Can we put something into bmcweb to detect its own
> certificate has expired and generate a new one?

The idea here is to discourage any prolonged use of the default 
self-signed certs at all, as they don't provide full protection from 
MitM attacks. That's why the 30 days validity period was suggested 
(compared to current 10 years) and discussed during the meeting. Adding 
an auto-regeneration feature would be going directly against that idea, 
so I personally wouldn't vote for that.

> I know self-signed certs aren't great, but the minute I have more than 6
> systems I'm not going to want to follow some "BMC Admin Guide" to update
> certificates by hand.  So we're effectively forcing everyone to develop
> some kind of certificate management infrastructure, without providing
> (or pointing to an existing) implementation.
I'd say that in such context, you'd be using one of the configuration 
management systems (Puppet/Chef/Salt/Ansible/homegrown scripts/whatnot) 
anyway, as that's a standard system administration BKM, so IMHO that's a 
reasonable assumption at the OpenBMC project end that it's not going to 
add any noticeable burden for BMC admins.
