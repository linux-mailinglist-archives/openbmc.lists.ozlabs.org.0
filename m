Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D23DB6B5
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 21:00:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vJQj43RbzDqcv
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 06:00:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vJPs4ldWzDqch
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 06:00:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 11:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,308,1566889200"; d="scan'208";a="371229501"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 17 Oct 2019 11:59:57 -0700
Subject: Re: DbusVariant insufficient for complex tree entries
To: Patrick Venture <venture@google.com>
References: <CAO=notxEVLf-TLqh8EHwcuU5EViBy-o8pHFdO13TNQDn=heXpw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <b1ab0298-760b-dd4e-aa5c-272b4584d5fa@linux.intel.com>
Date: Thu, 17 Oct 2019 11:59:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notxEVLf-TLqh8EHwcuU5EViBy-o8pHFdO13TNQDn=heXpw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/17/19 11:30 AM, Patrick Venture wrote:
> James;
> 
> I wanted to validate the problem I'm hitting reading the Association
> vector<tuple<s,s,s,>>:
> 
> using SensorMap = std::map<std::string, std::map<std::string, DbusVariant>>;
> 
> I'm using the SensorMap to read out the Association interface:
>   sensorMap.find("xyz.openbmc_project.Association.Definitions");
> 
> This is fine, as it holds a map<string, DbusVariant> --> except, it
> doesn't, because DbusVariant only holds the basic dbus types.  I was
> curious if there was a way you recommended to deal with this?
> 
> I could individually request that interface against the path and
> connection, introspect, and then use my own receiving structure - but
> it seems a waste to double-grab it.
> 
> I could add the complex type array(tuple<s,s,s,>) to DbusVariant to
> allow for this, but -- that seems a bit ugly.

This is all my opinion, but perfect world.. you would just always 
request the types that you think are possible. I think the 
implementation of DbusVariant has too many types as is, and is 
overused.. but this is  a common practice and adding the association 
type to DbusVariant is probably the best solution. Either that or 
reworking SensorMap to be a map<string, 
std::variant<types-that-we-care-about>>... but I wouldn't expect anyone 
to do that. I think the DbusVariant came to live because of the old 
namespace of the variant being so long, and people not wanting to have 
to type so much when they just wanted a variant.

fwiw phosphor-ipmi-host does the same thing with their Value type.

-James

> 
> Any suggestions?
> 
> Thanks,
> Patrick
> 
