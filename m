Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA14434F4BA
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 01:05:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F94lt5n9yz3bwG
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 10:04:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=hvJHkNLS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=hvJHkNLS; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F94lc4LNcz303G;
 Wed, 31 Mar 2021 10:04:43 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3332540;
 Tue, 30 Mar 2021 16:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617145481;
 bh=a0pxJKLp4kwSgBuAXaf6gCUL1ZiGuvYKdYven1w2R5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvJHkNLSqelGFK0pxm2kZDqUvh6POA51LGFafc7kenK/M3WXW5hDZaBowcPiRfmZN
 Bge/3CZ5uQlTQogNlqHSMlcoK1Yy6WUZydzlzzGopWeIHlctYxJbBqdt9xQoxZaytM
 iJjNSMsIbl3q8ol+JFkh98RodvOxVrXNfTLY3zJI=
Date: Tue, 30 Mar 2021 18:04:38 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: serial: 8250: update for
 aspeed,sirq-active-high
Message-ID: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
References: <20210330002338.335-1-zev@bewilderbeest.net>
 <20210330002338.335-3-zev@bewilderbeest.net>
 <20210330223902.GA837825@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210330223902.GA837825@robh.at.kernel.org>
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 05:39:02PM CDT, Rob Herring wrote:
>On Mon, Mar 29, 2021 at 07:23:37PM -0500, Zev Weiss wrote:
>> Update DT bindings documentation for the new incarnation of the
>> aspeed,sirq-polarity-sense property.
>
>Why?
>
>This isn't a compatible change.
>

Ah, sorry -- that was a misunderstanding on my end.  I'll resend a 
compatible v2 shortly.


Zev

