Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA253E27B0
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 11:46:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh0xX4Fk4z3d79
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 19:46:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh0xK3GXXz3bY0
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 19:46:45 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 018232012D;
 Fri,  6 Aug 2021 17:46:41 +0800 (AWST)
Message-ID: <556ea2925e85d84f296211cce9ef3572647e9e80.camel@codeconstruct.com.au>
Subject: Re: Question about NVMe MCTP in dbus-sensors
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Heyi Guo <guoheyi@linux.alibaba.com>, Andrew Jeffery <andrew@aj.id.au>, 
 openbmc <openbmc@lists.ozlabs.org>
Date: Fri, 06 Aug 2021 17:46:40 +0800
In-Reply-To: <30416e46-2e6d-c878-4c7d-943aa1119c0e@linux.alibaba.com>
References: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
 <863f7fca-7088-450e-a855-92261ba56b9d@www.fastmail.com>
 <30416e46-2e6d-c878-4c7d-943aa1119c0e@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Hi Heyi,

> BTW, when will MCTP be ready in openbmc mainline, including SMBus 
> binding and PCIe binding? Do you have any plan in the future openbmc 
> release?

We're mostly working on the generic infrastructure components at the
moment; those are based on their relevant upstream projects rather than
as parts of OpenBMC specifically. However, the upstream work is going
well, and the OpenBMC integration shouldn't be too difficult there;
we'll get that done as necessary.

As for interfaces: I currently have i2c and serial transports working,
but have no specific plans for PCIe - no hardware to test on. If this
is something you'd be interested in working on yourself, I can provide
some pointers.

Regards,


Jeremy

