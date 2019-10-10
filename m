Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A0D3023
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 20:23:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pzwn2wSFzDqGZ
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 05:23:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pzw14Jt5zDqBV;
 Fri, 11 Oct 2019 05:22:40 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 11:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; d="scan'208";a="184507020"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga007.jf.intel.com with ESMTP; 10 Oct 2019 11:22:36 -0700
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
To: Joel Stanley <joel@jms.id.au>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XfKCSNsQJa2J2jKZJ7LGZh3zXAOfBYnp5X0w=TH4JfSpQ@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8586205c-1edc-dfc2-3309-11050afbbaf8@linux.intel.com>
Date: Thu, 10 Oct 2019 11:22:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfKCSNsQJa2J2jKZJ7LGZh3zXAOfBYnp5X0w=TH4JfSpQ@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Rob Herring <robh+dt@kernel.org>,
 Cedric Le Goater <clg@kaod.org>, Tao Ren <taoren@fb.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Acked-by: Joel Stanley <joel@jms.id.au>

Thanks!

> While reviewing I was concerned about the locking in
> aspeed_i2c_master_xfer. It's a bit hairy, and I am not convinced it is
> without bugs.

The locking was already in there in aspeed_i2c_master_xfer but it
unlocks the protection to make a waiting for a completion. This code
is after the waiting so I added the locking to protect
'bus->master_state' variable which can be accessed from driver context
and from interrupt context.

Thanks,

Jae

