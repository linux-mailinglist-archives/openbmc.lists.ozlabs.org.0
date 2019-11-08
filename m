Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5DAF54A8
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 20:50:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478rV74YTczF7cn
	for <lists+openbmc@lfdr.de>; Sat,  9 Nov 2019 06:50:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478rTF54ldzF7Vw
 for <openbmc@lists.ozlabs.org>; Sat,  9 Nov 2019 06:49:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Nov 2019 11:49:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,283,1569308400"; d="scan'208";a="403181546"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 08 Nov 2019 11:49:43 -0800
Subject: Re: Redfish Code Generation
To: Richard Hanley <rhanley@google.com>, openbmc@lists.ozlabs.org
References: <CAH1kD+YQNVKSmH1qP777b2ch6vt=8EENkeE2b7VB_bpZh-DROg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <2a34ceec-f10a-d34d-a23e-48d87141a589@linux.intel.com>
Date: Fri, 8 Nov 2019 11:49:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAH1kD+YQNVKSmH1qP777b2ch6vt=8EENkeE2b7VB_bpZh-DROg@mail.gmail.com>
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

On 11/8/19 9:42 AM, Richard Hanley wrote:
> Hi everyone,
> 
> I was considering work on spiking out a tool to parse Redfish OpenAPI 
> schemas, and create some minimal code generation.  Most of the existing 
> swagger tools I've found for Open API are either for clients or too 
> heavy weight for embedded use.
> 
> Has anyone in the community looked into this subject?  Would people be 
> interested in such a tool? Are there any pitfalls that people found that 
> I should be aware of?

I heard at the hackathon that a couple of vendors have tried / are doing 
this, and most of the pitfalls were size. OpenBmc also makes the problem 
more interesting as the schemas aren't normally all that difficult to 
create, it's negotiating with dbus, limiting the api calls, and all the 
interfaces that seems to cause most of the problems. I'd be interested 
in what code you're trying to generate and what problem you're trying to 
solve. If you have some sort of white paper I'd be willing to give feedback.

-James

> 
> Thank you,
> Richard
