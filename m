Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCD6406640
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 06:04:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Mh512B5z2ybH
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 14:04:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5Mgr2dTBz2yHw
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 14:04:08 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 42B2820164;
 Fri, 10 Sep 2021 12:04:06 +0800 (AWST)
Message-ID: <1df72fd584f9c54544f9d5fafcd6232e3079ee49.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC] Specifying default-disabled devices
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Zev Weiss <zweiss@equinix.com>
Date: Fri, 10 Sep 2021 12:04:05 +0800
In-Reply-To: <20210910034958.GE17315@packtop>
References: <20210910022433.GD17315@packtop>
 <71375410db4f03bd19c820f97f3a23418b56ecc0.camel@codeconstruct.com.au>
 <20210910034958.GE17315@packtop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

> However, I think I may have spoken too soon regarding the relative
> simplicity of implementing it -- from a quick glance at it, I think
> I'd want to take of_device_is_available() and split it into some
> variants for strictly-okay and okay-or-reserved (and similarly for
> of_get_next_available_child()).  The problem there is that there are
> currently circa 200 callers of those functions scattered thoughout the
> tree, and auditing each of them individually to determine which of
> those semantics is actually appropriate in each case seems...a bit
> daunting.

I think you should be OK, if you stage it this way:

 - add status = "reserved" to your device tree; this will supress the
   automatic binding right away. With the current code, all it cares
   about is status = "okay" (or "ok"), so you'll at least keep the
   device quiesced.

   with that, there won't be an easy way to initiate the driver probe,
   but maybe that's OK for your use-case if you're doing the bind
   manually.

   There might be some bits doing their own DT parsing of the status
   property, but it sounds like you don't need to worry about those for
   now; they'd mainly be about devices' sub-nodes, and not related to
   driver binding.

 - propose a mechanism to trigger an un-reserve (and possibly
   re-reserve?), if you need.

The core code handles this for you, just setting status = "reserved"
will get you 90% there (if I've understood your use-case correctly!).

Cheers,


Jeremy

