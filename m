Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D317110B5A7
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 19:25:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NThm0rvszDqx0
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 05:25:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NTgb2658zDqwr
 for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2019 05:24:09 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 10:24:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; d="scan'208";a="240428417"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 27 Nov 2019 10:24:04 -0800
Subject: Re: GUI Component Library
To: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>,
 Derick Montague <Derick.Montague@ibm.com>
References: <FD0BD680739BFC41807C96BD23118BB131937A@ORSMSX113.amr.corp.intel.com>
 <OFBA22BA42.AE014E7E-ON002584BD.0071CE96-002584BD.0073A72B@notes.na.collabserv.com>
 <FD0BD680739BFC41807C96BD23118BB131A1BE@ORSMSX113.amr.corp.intel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <022dfcb8-7401-7ddb-8bba-2a7e0f7c0592@linux.intel.com>
Date: Wed, 27 Nov 2019 10:24:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB131A1BE@ORSMSX113.amr.corp.intel.com>
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

On 11/26/19 1:19 PM, Pine, Kathryn ElaineX wrote:
>>> In terms of a design library that matches the style of the web UI we’ve been working on, Bootstrap would be a great choice:  https://bootstrap-vue.js.org
> 
>> We agree to use Bootstrap-Vue for the Vue framework rewrite. Bootstrap-Vue does not have an icon library and refers to third-party sources. Since we are already  using the Carbon Design System icons, can we agree to continue to use 
> them?
> 

Bootstrap did just release an icon library yesterday fwiw, although it 
is only in Alpha https://blog.getbootstrap.com/2019/11/26/bootstrap-icons/

> Yes, I’m ok continuing to use the Carbon Design System icons. I agree, 
> also, that if an icon does not exist in the library, we can use the 
> library’s icons to make new icons that match that style.
> 

