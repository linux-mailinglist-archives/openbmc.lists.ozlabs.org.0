Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 188954BAE02
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 01:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0Bvg4Z8Mz3cVL
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 11:11:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0BvR3R92z3bc5
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 11:11:47 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0F8A720159;
 Fri, 18 Feb 2022 08:11:43 +0800 (AWST)
Message-ID: <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
Subject: Re: Checking for network online
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Johnathan Mantey <johnathanx.mantey@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 18 Feb 2022 08:11:43 +0800
In-Reply-To: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3-1 
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Johnathan,

> Issue: systemd-networkd-wait-online.service stalls for 120 seconds
> when the managed NICs do not have a network connection.
> 
> TLDR: Should OpenBMC remove systemd-networkd-wait-online.service 
> universally?

Probably not, it's required to implement network-online,target, which
is standard, and may be referred to by arbitrary packages.

There's some good background on the issues you're experiencing here:

 https://www.freedesktop.org/wiki/Software/systemd/NetworkTarget/

in short: most services should be able to start before network-
online.target, and be able to adapt to changes in network configuration
after that point.

For your specific issue there:

> Issues: This service blocks entry to multi-user.target.
> phosphor-state-manager uses multi-user.target to report the BMC is
> ready to use.
> This is reported via IPMI Get Device ID.

That sounds like more of an issue of whether that reported state
actually represents the expected BMC state...

Regards,


Jeremy
