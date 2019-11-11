Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EF7F806F
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 20:49:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BhJv5bd7zF3bG
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 06:49:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BhJB4hzHzF3V8
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 06:48:25 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 11:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="234584016"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2019 11:48:22 -0800
Subject: Re: entity-manager: adding additional fru formats to fru-device
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <80AD98E1-20D5-4ADD-ADD2-6901A3B77A43@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <120a78a0-1801-facf-040b-346471c37b70@linux.intel.com>
Date: Mon, 11 Nov 2019 11:48:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <80AD98E1-20D5-4ADD-ADD2-6901A3B77A43@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/11/19 11:43 AM, Brad Bishop wrote:
> Hi James
> 
> At the OSFC we chatted a little bit about adding support for other fru data formats to fru-device.  I’d like to get started on that.
> 
> For background and reference at IBM we call this sort of data “vital product data” or VPD.  Just so we are all on the same page this is the same stuff as IPMI FRU format data, just a different data structure.
> 
> When I look at fru-device in the context of adding support for additional data formats, the necessary interface seems to just be a set of key value pairs.  We already have an application that produces exactly that here: https://github.com/openbmc/openpower-vpd-parser

If you already have that, then there should be no reason for you to need 
to use fru-device. Entity-Manager probes dbus, so as long as there is 
key-value pairs, you should be able to make your probe
'xyz.openbmc_project.MyInterface('KeyICareAbout':'ExpectedValue'). If 
this application can already do discovery, I don't think you need 
fru-device. This might actually be a good excuse to pull fru-device out 
of the entity-manager repo, having them together makes it seem too much 
like they depend on each-other, which they don't.

> 
> Do you have any thoughts on how you’d like that code brought into EM to the end of supporting the IBM FRU format?  My initial stab without any direction from you would be to:
> 
> 1 - factor (shared) library logic out from application logic in openpower-vpd-parser
> 2a - update fru-device to try multiple formats instead of just IPMI when scanning eeproms
> 2b - add the option to remove support for ipmi or open power fru format parsers
> 3a - when power format parsing is enabled, link to new openpower-vpd-parser shared library
> 3b - when ipmi format parsing is enabled, link to existing code (static, not shared)
> 
> thx!
> 
> -brad
> 
