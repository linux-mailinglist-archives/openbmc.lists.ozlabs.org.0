Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D9465DF0
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 06:30:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4PgK2nfKz307L
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 16:30:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
X-Greylist: delayed 520 seconds by postgrey-1.36 at boromir;
 Thu, 02 Dec 2021 16:30:24 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4Pg46Lxcz2yZx
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 16:30:24 +1100 (AEDT)
Received: from [172.16.68.45] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C43B420164;
 Thu,  2 Dec 2021 13:21:41 +0800 (AWST)
Message-ID: <06b3258c44f7ce434ec917c53ea4e1967ea75768.camel@codeconstruct.com.au>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org
Date: Thu, 02 Dec 2021 13:21:40 +0800
In-Reply-To: <20211201072902.127542-1-joel@jms.id.au>
References: <20211201072902.127542-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

> Systems provide line names to make using GPIOs easier for userspace.
> Use this feature to make the tools user friendly by adding the ability to
> show the state of a named line.
> 
>  $ gpioget --line-name power-chassis-good
>  1
> 
>  $ gpioget -L pcieslot-power
>  0

Awesome!

As someone who has had wasted hours of debugging the wrong GPIO lines
because of incorrect chip/offset calculations, +100 from me.

(or was that +101? I'll have to check the schematic again...)

Cheers,


Jeremy

