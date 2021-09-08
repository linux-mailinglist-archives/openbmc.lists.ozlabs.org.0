Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECAD403216
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 03:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H441p0GQfz2yLm
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 11:15:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H441Y4bK5z2xry
 for <openbmc@lists.ozlabs.org>; Wed,  8 Sep 2021 11:14:57 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5CF6820134;
 Wed,  8 Sep 2021 09:14:51 +0800 (AWST)
Message-ID: <7ac0aa41c2136e17117d1709d1cddc7552b8b948.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-5.10] ARM: dts: aspeed: Add TYAN S7106 BMC
 machine
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Oskar Senft <osk@google.com>, openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Wed, 08 Sep 2021 09:14:50 +0800
In-Reply-To: <20210907205200.1193552-1-osk@google.com>
References: <20210907205200.1193552-1-osk@google.com>
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
Cc: Ed Tanous <ed@tanous.net>, Vijay Khemka <vijaykhemkalinux@gmail.com>,
 Jason Hargis <jason.hargis@equuscs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Oskar,

> The TYAN S7106 is a server platform with an ASPEED AST2500 BMC.
> 
> Submitted to upstream in
> https://lists.ozlabs.org/pipermail/linux-aspeed/2021-
> September/006326.html

Pending Joel's comments there, all looks good to me.

In case it's useful to include, I also have the multiplexer on i2c6
defined in my dts:

+       i2cmux {
+               compatible = "i2c-mux-gpio";
+               #address-cells = <1>;
+               #size-cells = <0>;
+               i2c-parent = <&i2c6>;
+               mux-gpios = <&gpio ASPEED_GPIO(Q,4) GPIO_ACTIVE_HIGH
+                            &gpio ASPEED_GPIO(Q,5) GPIO_ACTIVE_HIGH
+                            &gpio ASPEED_GPIO(G,0) GPIO_ACTIVE_LOW
+                            &gpio ASPEED_GPIO(G,1) GPIO_ACTIVE_LOW>;
+
+               i2c_pcie_s1b1: i2c@4 {
+                       reg = <0x4>;
+               };
+               i2c_pcie_s1b2: i2c@5 {
+                       reg = <0x5>;
+               };
+               i2c_pcie_s2b1: i2c@6 {
+                       reg = <0x6>;
+               };
+               i2c_pcie_s2b2: i2c@7 {
+                       reg = <0x7>;
+               };
+
+               i2c_ocp0a: i2c@8 {
+                       reg = <0x8>;
+               };
+               i2c_ocp0c: i2c@9 {
+                       reg = <0x9>;
+               };
+               i2c_ocp1a: i2c@a {
+                       reg = <0xa>;
+               };
+	};

- but I've only done light testing on that.

Regardless, if you CC me on v2, I'd be happy to add my ack.

Cheers,


Jeremy

