Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB923F19C
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 19:02:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNWqs20XlzDqss
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 03:02:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNWpz6tZGzDqFY
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 03:01:31 +1000 (AEST)
IronPort-SDR: ZlCzQMK/PIWmGGOfqhgYqOAg/BdWFPU1WfPucfsEyIOLPfoFjeCOTsDAyIdcT3c6p3uovDV8Bh
 mtQSEWrHSIwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="140738420"
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="140738420"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 10:01:05 -0700
IronPort-SDR: fPxnbOgC7/B5TOifs6zX4xnAdc2h9nGdsdVRyVZHw4g414Ny/LfI8wFIVHg4QYdYfIn5YG/PV5
 jL+Llu+UJNBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="333598676"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.36.209])
 ([10.209.36.209])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 10:01:04 -0700
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <5ac86e6f-80f5-9f77-4e47-e8e5935c21ac@linux.intel.com>
Date: Fri, 7 Aug 2020 10:01:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
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

On 8/7/2020 9:34 AM, Jason Ling wrote:
> ack,
> sounds like I'm better off just moving temp sensors over to being 
> handled by PSUSensors.
> 

I'm not sure this is a great idea either, I think taking the label 
parsing out of PSU sensor and making something generic that both can use 
would be the best approach.
