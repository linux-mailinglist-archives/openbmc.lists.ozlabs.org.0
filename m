Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 501471B57AE
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 11:04:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497BF81h4mzDr2m
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 19:04:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497BD35V6wzDqdc
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 19:03:13 +1000 (AEST)
IronPort-SDR: HHjfwSztdFU9JgfnrDm46ATOv+LKq5jHu+XE6p9aOhYzQbN8kzv+tsd/dsRz0Qxzu/Ki6Y1kbj
 nT9UF4zOIyig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 02:03:09 -0700
IronPort-SDR: lvP6WAWg1aIxiiiuE+9jRxPdFWfTYeZ0eS/v9hu3AMXc/YIPSfILAy1a/oCNrE5uvcmtE8O1PS
 ph5+Ooxjiafg==
X-IronPort-AV: E=Sophos;i="5.73,306,1583222400"; d="scan'208";a="402855256"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.249.143.125])
 ([10.249.143.125])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 02:03:08 -0700
Subject: Re: phosphor-dbus-interfaces modification process for existing YAML
To: Patrick Williams <patrick@stwcx.xyz>
References: <29a3376f-d82d-057c-e2d5-0fe250b55951@linux.intel.com>
 <20200422114349.GD196148@heinlein.lan.stwcx.xyz>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <d3c9e30f-c00e-95da-36e7-969173ba9a9e@linux.intel.com>
Date: Thu, 23 Apr 2020 11:03:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200422114349.GD196148@heinlein.lan.stwcx.xyz>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



W dniu 4/22/2020 o 13:43, Patrick Williams pisze:
> On Wed, Apr 22, 2020 at 01:00:40PM +0200, Adrian Ambrożewicz wrote:
>> We would need to extend it with new hierarchy/namespace : utilization,
>> and corresponding Unit: Percent.
> 
> Seems reasonable to me.
It was easy :) Thanks

> 
>> Should I push change directly to review or do I need to discuss it
>> earlier with someone? My first thought was to address
>> https://github.com/openbmc/docs/blob/master/architecture/sensor-architecture.md
>> , however this document doesn't seem to address these details.
> 
> It sounds like a straight-forward enough change to just put up a commit
> that changes the phosphor-dbus-interfaces.  Since you're also proposing
> a new hierarchy for these sensors to fit under, there isn't likely to be
> any backwards compatibility issues are there?  If there are, that's
> probably when we'd want to expand the scope to a design document.
> 
I don't expect any backward compatibility issues here. I've checked 
bmcweb implementation and it is just ignoring sensors of unknown 
'hierarchy'.
