Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3231B31871E
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 10:36:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbs264LXwzDqCM
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 20:35:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=103.231.89.101;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
X-Greylist: delayed 472 seconds by postgrey-1.36 at bilbo;
 Thu, 11 Feb 2021 20:35:06 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [103.231.89.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbs1671VDzDwlk
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 20:35:06 +1100 (AEDT)
Received: from pecola.lan (180-150-121-66.b49679.per.nbn.aussiebb.net
 [180.150.121.66])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B1A6406B8;
 Thu, 11 Feb 2021 04:27:10 -0500 (EST)
Message-ID: <54692726b8192f2533b9d6073575610486f0b277.camel@codeconstruct.com.au>
Subject: Design for in-kernel MCTP in openbmc/docs review
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 11 Feb 2021 17:27:10 +0800
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rui Zhang <ruizhan@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi OpenBMCers,

I've just pushed a changeset for an in-kernel MCTP implementation for
public review on gerrit:

  https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/40514/1

We've had the intention of implementing a kernel-based MCTP stack for a
while - indeed, the current libmctp/userspace approach is intended to
be reasonably compatible with a future sockets-based interface, which
is what we're proposing here. This design provides the outline for
that, and specifies the base components of the upcoming kernel changes.

The aim here is to shape the general structure of the MCTP
implementation to our primary consumers: OpenBMC. Given this is a
kernel implementation, I'll carry this design (plus code) forward to
the kernel community for upstream review too.

This work - including future changes for the implementation - is made
possible through funding from Google Inc., with Nancy Yuen (of OpenBMC
TSC fame) coordinating.

Comments, feedback and queries on the design would be best submitted
through gerrit, but I'm happy to take any general queries/comments here
too.

Happy MCTPing!

Cheers,


Jeremy


