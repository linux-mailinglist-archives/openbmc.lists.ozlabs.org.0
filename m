Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9B10A357
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 18:29:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MrVd5SYqzDqVH
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 04:29:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MrTt3Xy9zDqTx
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 04:28:33 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 09:28:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="240006085"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2019 09:28:30 -0800
Subject: Re: guidelines on new entity-manager classes
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <FB1DE03E-092D-41CB-A655-56EFCE849E47@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <4e265913-0704-8438-3f37-389063b235b9@linux.intel.com>
Date: Tue, 26 Nov 2019 09:28:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <FB1DE03E-092D-41CB-A655-56EFCE849E47@fuzziesquirrel.com>
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
Cc: Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/25/19 5:02 PM, Brad Bishop wrote:
> Hi James
> 
> another EM question for you...
> 
> Are there any guidelines or best practices on upstreaming EM configurations?  Put another way, if I wanted to ensure that you would accept my configurations with new types or classes (e.g. Pid, ADC, etc..), what would I need to do up front to make that process as smooth as it can be?

EM configurations are meant to be flexible, and as long as the daemon 
understands it, and the Type is unique, there shouldn't be any issues.
There is a script here to make it a bit more pretty that CI will fail if 
it is not ran 
https://github.com/openbmc/entity-manager/blob/master/scripts/autojson.py. 
The only real things that block configuration reviews are things that 
can make them shorter (using the template stuff when possible). But as 
they are per vendor, I normally let each vendor own their own destiny 
with the files.

There is a json schema 
https://github.com/openbmc/entity-manager/blob/master/schemas/global.json 
that I eventually have the dream of creating a script to generate a 
schema for every checked-in Type, but I'm not there yet.

-James

> 
> thx - brad
> 
