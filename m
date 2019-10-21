Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93597DF4FA
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 20:21:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xlMn2KC4zDqKL
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 05:21:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xlKn5ZSzzDqJK
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 05:19:54 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 11:19:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,324,1566889200"; d="scan'208";a="372259797"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 21 Oct 2019 11:19:50 -0700
Subject: Re: entity-manager frudevice interface
To: Patrick Venture <venture@google.com>
References: <CAO=notwQoW6zM_NnDbukXpvhG+OKXn2Nw0Lnzh_E87P4SF+kAw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <8238ceee-ae3a-89b1-3742-0e920b19486b@linux.intel.com>
Date: Mon, 21 Oct 2019 11:19:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notwQoW6zM_NnDbukXpvhG+OKXn2Nw0Lnzh_E87P4SF+kAw@mail.gmail.com>
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

On 10/18/19 5:02 PM, Patrick Venture wrote:
> James;
> 
> As you know, I've started adding:
> 
> "xyz.openbmc_project.Inventory.Decorator.FruDevice": {
> "Bus": "$bus",
> "Address": "$address"
> }
> 
> To my json files.  But I was wondering, this feature -- being able to
> point back to a FruDevice by bus+addess may be sufficiently useful
> that entity-manager always adds it when the probe result has a
> bus+address.
> 

I would generally disagree with this, as the FruDevice was meant to only 
be 1 type of probe, and I imagine in the future we'll have gpio, mctp, 
etc types of probes, and I would like to keep it generic as possible, 
and have EntityManager not care what it found on the other side of dbus. 
If there was some way to make it more generic I'd be interested.

> Thoughts?
> 
> Patrick
> 
