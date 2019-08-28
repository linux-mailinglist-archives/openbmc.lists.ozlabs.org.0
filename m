Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED7DA076D
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 18:32:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JWW96YwxzDrF0
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 02:32:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JWVJ4LqZzDq9b
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 02:29:51 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 09:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; d="scan'208";a="380458181"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2019 09:29:47 -0700
Subject: Re: Entity-Manager's Configuration Generation leaves address as string
To: Patrick Venture <venture@google.com>,
 Peter Lundgren <peterlundgren@google.com>, Kun Yi <kunyi@google.com>
References: <CAO=notzA5GNeAbNxvrDs3gwORnjx36d5oPa5R=D-oajCxBC2Ow@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <6ab26e95-a327-9263-c1f3-9ba02333913d@linux.intel.com>
Date: Wed, 28 Aug 2019 09:29:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzA5GNeAbNxvrDs3gwORnjx36d5oPa5R=D-oajCxBC2Ow@mail.gmail.com>
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

On 8/28/19 7:27 AM, Patrick Venture wrote:
> I think I've figured out what's happening.
> 
> If a configuration has no fields that are changed by the template code
> (or possibly even in that case), nothing happens to the values.  So,
> the property Address is left "0x54" if that's what it is.  And the
> code is templated, so it just adds that property of type string to the
> dbus sensor configuration.  As this is definitely what I'm seeing.
> Json doesn't support ints that are written raw as hex, so wrapping
> them as strings is what's required to make the json parse.  I've
> worked around this problem by just using decimal everywhere, but
> that's harder to read when comparing to schematics.

Based on this, I think this line might be your issue:

https://github.com/openbmc/entity-manager/blob/3b80d7c51ff5d5859c0ca1f2b517c18f4766a1a6/src/EntityManager.cpp#L1336


If found device is nullopt, you still want to call this line, but you 
want to call it with an empty flat_map.

I verified if this happens it should work here:

https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24787



> 
> Would it make sense to make the add property code less field agnostic
> so that if the field is Address and the Interface for
> configuration.XXX that it checks to see if it's a hex string?  Or,
> maybe the templateChar replace -- if that supports converting the hex
> string to a raw integer value type should always get hit?
> 
> Thanks,
> Patrick
> 
