Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F34AE0E3F
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 00:33:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ySvY0LxlzDqQ3
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 09:33:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yStw3cHvzDqMh
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 09:32:38 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 15:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; d="scan'208";a="372687204"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 22 Oct 2019 15:32:35 -0700
Subject: Re: Searching the openbmc mail archives
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <DF4PR8401MB10848A550EA75ADAB33B0B29D8680@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <d61da6e5-4bd7-5449-e75a-3eb109645de0@linux.intel.com>
Date: Tue, 22 Oct 2019 15:32:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <DF4PR8401MB10848A550EA75ADAB33B0B29D8680@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

On 10/21/19 8:06 PM, Muggeridge, Matt wrote:
> Hello OpenBMC community,
> 
> I’m a new member to the list.
> 
> After some searching, I’m yet to discover how or if I can search the 
> openbmc mail archives <https://lists.ozlabs.org/pipermail/openbmc/>.  Is 
> there a way to do that?

I normally just used google advanced search, something like:

sensors site:https://lists.ozlabs.org/pipermail/openbmc

https://www.google.com/search?as_q=sensors&as_epq=&as_oq=&as_eq=&as_nlo=&as_nhi=&lr=&cr=&as_qdr=all&as_sitesearch=https%3A%2F%2Flists.ozlabs.org%2Fpipermail%2Fopenbmc&as_occt=any&safe=images&as_filetype=&as_rights=


> 
> Matt.
> 
