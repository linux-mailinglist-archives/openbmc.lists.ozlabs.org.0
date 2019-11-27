Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8C510AC66
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 10:09:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NFN13F3YzDqlV
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 20:09:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NFM34hvrzDqT2
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 20:09:01 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 01:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; d="scan'208";a="260950892"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.245.177])
 ([172.22.245.177])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Nov 2019 01:08:58 -0800
Subject: Re: BMCWeb auth primer
To: openbmc@lists.ozlabs.org
References: <98ab5fc7-60e7-3e90-1e9e-bf7e220a2a50@linux.ibm.com>
 <CAK_vbW3xT8WL5qnBVV_m-HVY84DWYNCpH=ntYyLNzgyFJMzw0A@mail.gmail.com>
 <e4e32524-d71f-3f17-645a-39861755215a@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <90f5f8a9-de1a-3216-21ac-4bad81d77764@linux.intel.com>
Date: Wed, 27 Nov 2019 10:08:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e4e32524-d71f-3f17-645a-39861755215a@linux.ibm.com>
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

> On 11/25/19 3:37 PM, Brandon Wyman wrote:
>> On Mon, Nov 11, 2019 at 7:41 PM Joseph Reynolds <jrey@linux.ibm.com> 
>> wrote:
>>> Dear OpenBMC community and BMCWeb maintainers,
>>>
>>> I worked on BMCWeb, learned how it works, and put together this little
>>> primer on its authentication and authorization flows.
>> Would this have worked better as a gerrit commit, or a public gist
>> that you could point to?

I'd second the "gerrit commit" suggestion - maybe something for the docs 
repo? I think this could be a useful document, if it's updated in line 
with code changes or if it is high-level enough to still be useful, but 
withstand minor code changes/refactoring.

I have at least one comment for the mTLS part right away and would be 
glad to review the rest, but IMHO that'd be much more convenient via 
Gerrit (easier to track comments for specific lines, etc).

regards,
Alexander

