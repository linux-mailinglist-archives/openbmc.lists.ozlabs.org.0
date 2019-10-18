Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E9ADC2C3
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 12:27:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vhzr636TzDrQX
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 21:27:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vhz61kbhzDrMl
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 21:26:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="e7i8zGhS"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46vhz52JlVz9sPZ;
 Fri, 18 Oct 2019 21:26:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1571394401; bh=yQVXR+8FI6cIH0oBH5ubfYCFQ3qZmNTLLk5aAhKd+kQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=e7i8zGhS7bkUGH5uy3i8657njGsOZ7OD7yqoEBWWJTzgpWpbif/UZSIItg3IpSmvH
 pRSF9Sw32En2xeMfe6gOt6eDpqmyAPF0rJPK6nAXQAdgLfswh9v86Bbzr9FoRMYXJA
 /xIHvizBEBiuGbc4thK30KWg4VZuLhLOVoU7CJRJZtWrnJaBMYe5xtAahgnDTNQhv3
 hogWRyaktsqK9Fq5mZu3fmesQuS+zySkL7nRM4sf58+GMWlyVXCLIB4sOsi2YhOXW+
 gKajKbhJnRNMrtO7lPImFWNzPdOzZcZwxgviN0fVm/YT8t3BGKgFDESuhPuY8iaiY0
 1pxfy0NqkQMVQ==
Message-ID: <cf6f11adb105ae774fa5d1ecf2959f9f64d1b131.camel@ozlabs.org>
Subject: Re: phosphor-hwmon refactoring proposal
From: Jeremy Kerr <jk@ozlabs.org>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Matt Spinler
 <mspinler@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 jolie.ku@ibm.com, Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Oct 2019 18:26:38 +0800
In-Reply-To: <170FEA13-6C0D-4D08-9118-1831E85DD5A8@fuzziesquirrel.com>
References: <170FEA13-6C0D-4D08-9118-1831E85DD5A8@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

> I have a quick phosphor-hwmon change proposal I’d like to get feedback
> on.
> 
> One issue with phosphor-hwmon that has been brought up a couple times
> now  is that it gets its configuration settings from a file with a
> path in the  filesystem that mirrors the path to the hwmon device in
> the device tree.   This is problematic because the device tree path is
> not required to be  stable, so whenever things move around there, the
> config files all have to  be moved.

Yep, sounds like we should find a better approach.

> The proposal is simply to quit passing the configuration via the  
> environment and instead look for a config file, the location specified
> via logic in the application, with a path like:
> 
> /usr/share/phosphor-hwmon/i2c/2-004c.conf
> 
> This is the path to the hwmon parent device relative to /sys/bus

We want to ensure that any of those paths use persistent kernel
naming/numbering though. In your example, we would need that i2c bus to
be guaranteed to be probed as i2c bus id 2.

There are facilities in place to ensure this happens, and as far as I
know we are currently using those, but we will need to ensure that stays
the case.

Would this be specific to each bus type? The example for i2c is good, as
we do have a mechanism for persistent device paths under /sys/bus/i2c/,
but the same is not true for other bus types (eg, /sys/bus/platform). To
handle that, we may want the paths to be of the form:

 /usr/share/phosphor-hwmon/<bus>/<bus-specific-id>.conf

Where <bus> is from a predefined set of supported bus types, and
<bus-specific-id> depends on that; it would typically be the name under
/sys/bus/<bus>/devices, but we may want to introduce custom mappings
perhaps?

Cheers,


Jeremy

