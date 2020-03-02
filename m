Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 323791752DE
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 05:50:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W74h1K25zDqVN
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 15:50:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W73n1MZJzDq62;
 Mon,  2 Mar 2020 15:49:56 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 0224n7ms031936
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 1 Mar 2020 22:49:11 -0600
Message-ID: <42daa66bedc1b06936bc9cbc6e9b31f6dd8ed3a1.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Tao Ren <rentao.bupt@gmail.com>
Date: Mon, 02 Mar 2020 15:49:07 +1100
In-Reply-To: <20200228081309.GA4531@taoren-ubuntuvm>
References: <20200227230507.8682-1-rentao.bupt@gmail.com>
 <20200227230507.8682-8-rentao.bupt@gmail.com>
 <3150424b9e9f5856c747a0fbf44647919f49209d.camel@kernel.crashing.org>
 <20200228010444.GA19910@taoren-ubuntu-R90MNF91>
 <2676013663fc8c53e02a5fdaafb1b27e18249b80.camel@kernel.crashing.org>
 <20200228081309.GA4531@taoren-ubuntuvm>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 taoren@fb.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2020-02-28 at 00:13 -0800, Tao Ren wrote:
> On Fri, Feb 28, 2020 at 02:02:28PM +1100, Benjamin Herrenschmidt wrote:
> > On Thu, 2020-02-27 at 17:05 -0800, Tao Ren wrote:
> > > > Also long run I think best is going to have a child node per downstream
> > > > port, so we create a matching linux struct device. This will make it
> > > > easier to deal with the other device-controller in the ast2600 which is
> > > > basically one of these without a vhub above it.
> > > 
> > > Maybe a dumb question: what would be the proper place to parse the child
> > > node/properties when they are added? For example, in some usb_gadget_ops
> > > callback?
> > 
> > No. What the vhub would do is when it probes, it creates a platform
> > device for each "port" child node that's linked to the DT node.
> > 
> > The driver for the device then attaches to it via standard DT matching
> > and checks if it has a vhub parent or not, and based on that, operates
> > as a vhub child device or a standalone one.
> > 
> > (For example, it might have different functions for EP selection since
> > standalone devices have private EPs rather than a shared pool)
> > 
> > They can both be in the same module or they can be separate modules
> > with cross dependencies.
> > 
> > Cheers,
> > Ben.
> 
> I see. It's to describe these downstream devices (such as configurations
> and according functions) in device tree, which is similar to defining a
> composite device and linking functions/interfaces via configfs. Thanks for
> the clarify.

It's also to make it easier long run to support both the standalone
variant and the vhub variant from the same code base.

Cheers,
Ben.


