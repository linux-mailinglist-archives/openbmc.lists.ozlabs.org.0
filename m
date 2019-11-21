Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3A104EC1
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 10:10:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JYg90qsyzDqxH
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 20:10:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JYfF2HDszDqkk
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 20:09:20 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 01:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="407128021"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.245.177])
 ([172.22.245.177])
 by fmsmga005.fm.intel.com with ESMTP; 21 Nov 2019 01:09:16 -0800
Subject: Re: openbmc project for telemetry
To: openbmc@lists.ozlabs.org
References: <ca853ff3-6017-7e75-b66e-3116c042f38c@linux.intel.com>
 <A727F88F-D32D-4CAD-8E92-2C99B39E4CEE@fuzziesquirrel.com>
 <ce5c1774-ff0f-602c-a165-43cbca90f818@linux.intel.com>
 <ee14af8a-5e0a-04b1-4978-09d34f6f9628@linux.intel.com>
 <FC0713B7-19EB-49E0-958F-3290DA5A10DD@fuzziesquirrel.com>
 <8bda426c-5dfa-b9c6-f4b0-769288ff675c@linux.intel.com>
 <8A128ED3-1DFD-43F2-B249-79BFB97E4672@fuzziesquirrel.com>
 <0cf486fd-39c7-70f5-8c4a-76341c201322@linux.intel.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <d1344379-4d8e-90a3-171e-0d897aa2e523@linux.intel.com>
Date: Thu, 21 Nov 2019 10:09:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0cf486fd-39c7-70f5-8c4a-76341c201322@linux.intel.com>
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

> Most OpenBMC projects are using this format:
>
> https://github.com/openbmc/hiomapd/blob/master/MAINTAINERS
>
> I’m not aware of any automation that has been built around that file 
> format though.  FWIW I intend to implement the owners plugin on our 
> gerrit installation in the near future:
>
> https://gerrit.googlesource.com/plugins/owners/
>
> so you could make use of that if you wanted. 


FWIW, Github has recently added new feature with CODEOWNERS file, could 
be useful probably: 
https://help.github.com/en/github/creating-cloning-and-archiving-repositories/about-code-owners

