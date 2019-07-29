Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F197834E
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 04:22:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xk3M0w3CzDqC0
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 12:22:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xk1g3Z6GzDqRm;
 Mon, 29 Jul 2019 12:20:39 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6T2KULt005387;
 Sun, 28 Jul 2019 21:20:30 -0500
Message-ID: <cd7e4eacb7c6572e58ed5fdc2286082367520e9e.camel@kernel.crashing.org>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ
 polarity configurable
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Jeremy Kerr <jk@ozlabs.org>, Oskar Senft <osk@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 29 Jul 2019 12:20:30 +1000
In-Reply-To: <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
 <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
 <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
 <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

On Mon, 2019-07-29 at 08:51 +0800, Jeremy Kerr wrote:
> Hi Oskar,
> 
> > For LPC, the polarity should be set to 1, for eSPI the default of 0 is
> > correct.
> 
> Would there ever be a case where different SIRQs need different
> polarities? If not, we may want this to be global, rather than for each
> device (the VUART being one...)

Leave it per device. The way to configure this is completely device
dependent. In fact for most devices it can only be done by the host via
SIO.

Cheers,
Ben.


