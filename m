Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E905E2F7721
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 12:04:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHJGL31VKzDsdP
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 22:04:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=zankapfel.net
 (client-ip=2a03:4000:6:113f:0:1ce:1ce:babe; helo=zankapfel.net;
 envelope-from=phil@zankapfel.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zankapfel.net
X-Greylist: delayed 409 seconds by postgrey-1.36 at bilbo;
 Fri, 15 Jan 2021 22:03:26 AEDT
Received: from zankapfel.net (zankapfel.net
 [IPv6:2a03:4000:6:113f:0:1ce:1ce:babe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHJFV74K7zDsc4
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 22:03:26 +1100 (AEDT)
Received: by zankapfel.net (Postfix, from userid 110)
 id 839891454CB; Fri, 15 Jan 2021 11:56:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on zankapfel.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from _ (localhost [IPv6:::1])
 by zankapfel.net (Postfix) with ESMTP id 9365F1454C8;
 Fri, 15 Jan 2021 11:56:26 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 15 Jan 2021 11:56:26 +0100
From: Phil Eichinger <phil@zankapfel.net>
To: Shakeeb B K <shakeebbk@gmail.com>
Subject: Re: Hot plug support for aspeed-smc driver
In-Reply-To: <CABYu0WhdNyNpJ7n1_LAW2eDv5J9uSmSKDQbMHhjLb6N_moB=ig@mail.gmail.com>
References: <CABYu0WhdNyNpJ7n1_LAW2eDv5J9uSmSKDQbMHhjLb6N_moB=ig@mail.gmail.com>
Message-ID: <b7056526d455d6e5f3c9c9accb1f91bb@zankapfel.net>
X-Sender: phil@zankapfel.net
User-Agent: Roundcube Webmail/1.3.13
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
Cc: openbmc@lists.ozlabs.org,
 openbmc <openbmc-bounces+phil=zankapfel.net@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2021-01-15 11:41, Shakeeb B K wrote:
> Hi All,
> 
> We have a use case for dynamic enabling/disabling access to spi nor
> flash using an external mux.
> This is mainly for data flash access over spi controller.
> 
> Since we use aspeed-smc driver for both fmc and smc, we cannot make it
> loadable as of now.
> Is there any way to handle this other than writing a new
> implementation for spi controller?

Hi Shakeeb,

You can use manual driver binding and unbinding to accomplish this (see 
also: https://lwn.net/Articles/143397/).

Example for spi1:
echo 1e630000.spi > /sys/bus/platform/drivers/aspeed-smc/unbind
[change mux]
echo 1e630000.spi > /sys/bus/platform/drivers/aspeed-smc/bind

Cheers
Phil
