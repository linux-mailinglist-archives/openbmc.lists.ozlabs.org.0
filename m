Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8ED148D02
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 18:32:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4845mk5FNJzDqg9
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 04:32:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4845m05gsKzDqb0
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 04:31:25 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 09:19:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="216648133"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.245.169])
 ([172.22.245.169])
 by orsmga007.jf.intel.com with ESMTP; 24 Jan 2020 09:19:07 -0800
Subject: Re: bmcweb and certificate chains [WAS: Security working group
 meeting 2020-01-22]
To: openbmc@lists.ozlabs.org
References: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <94fa654c-bfa6-c834-6b18-8867aee49c8f@linux.intel.com>
Date: Fri, 24 Jan 2020 18:19:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
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

On 22-Jan-20 22:23, Joseph Reynolds wrote:
> Notes from the security working group meeting 2020-01-22:
> Highlights below; details in 
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
>
> 1. Discuss BMCWeb’s site identity certificate handling, specifically 
> intermediate certificates.  See 
> https://github.com/openbmc/bmcweb/#configuration  
>
> Other web servers have directives to concatenate the intermediate 
> certificates (excluding the root CA certificates) and send that. What 
> does BMCWeb do? 
>  - What is BMCWeb's default default?
>  - Need better docs, for example: How can a BMC admin replace 
> theBMCWeb site cert?  Is it okay to concatenate intermediate certs? 
> Can we document this for BMCWeb?

As discussed during the meeting, I've looked into that and looks like 
bmcweb doesn't support sending the cert chain at all right now. When 
loading it expects the server's cert file to have just a private key and 
certificate in a single file [1], just as we've discussed during the 
meeting, and server's init code only loads those [2]. There's an API in 
Boost.Asio that could allow loading a chain [3], but it's not used 
anywhere, so for bmcweb to support that, a patch must be created.

HTH,
Alexander

[1] https://github.com/openbmc/bmcweb/blob/master/http/http_server.h#L159
[2] https://github.com/openbmc/bmcweb/blob/master/http/app.h#L158-L159
[3] 
https://www.boost.org/doc/libs/1_71_0/doc/html/boost_asio/reference/ssl__context/use_certificate_chain_file.html

