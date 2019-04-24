Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D57411854C
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:19:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45038m3BkZzDqHq
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:19:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="Fk0UHyv3"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pjmT5kygzDqTv
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 11:44:41 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id h16so8196777qtk.6
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 18:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=iaiGitaPYWwoACiuEl2V/YVAyOnh2DD7B5fKEozHsuQ=;
 b=Fk0UHyv3s5A80Gj8y7jlukFKtiywGGo8CiWv4CTcCM1+y1fv7iJPmq1KVZqkEF9XK4
 7OXhp5c6/q1daP8aXaUFi0hiF55Ha/oBB3t8LrMHzWprNWOwCm0LUC6ZZ20RQHKJggFw
 X5XtNHkSntEF6Agg8pnkUNQzkGnlOAzQFFWHm9/dSRqKnwiOschn+UFVT7ZATdzSmBYn
 J6Ls2ox8FoaVNid5qFDa8ORWJfeSizow2jSaUyjUvmRMDqq7WjyEs7P7lx42ijH6MdRy
 kHvrNaWNt6uQemHRxD5cxFbFkYx5iIqByIDOaNoMXTZMaRxhL/cjXkcuEXIInR7ylFan
 AEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=iaiGitaPYWwoACiuEl2V/YVAyOnh2DD7B5fKEozHsuQ=;
 b=iclIgSAR8LWpNDBAkCG+o/Vny+74435/rvLcGOsXnRG+xqYhUs5pL58DQa2dBxOtc2
 wR4/vZat4jb20wQKBd3UjIS8xozePsvPVwWLDdZKivngHgiTxbOnPhV+rd4ZpVmqBoEL
 iMJmnh/GiLX/iPm+h8Kq/dbGl5+MI4BS8cU2Rwrat7ViB7Cx97mvAalRuBoIRzQ7VGFl
 WAjiDCt+kFFPZYACBMOu6MO981RklGxnYvoSQtBdx/JCHCnsNrP6QrAFcUFheGi3o7R+
 JXDW8aJvSid8Ijs/KaD1T9Wzk0xjq/SuLacKA6svbxEMtIyT/OZeltms6ILctfo3qKrE
 L14A==
X-Gm-Message-State: APjAAAUxvs/Ip5t5c/SOV7dhtAOiHXH3YwhDbjLL9ZggeUkIdKnhHADN
 GAO/E/bb3a8g+CvfuQ3jKtzYGw==
X-Google-Smtp-Source: APXvYqwUx7zNWXi3F6GurL4n/KvMjkuFsuW5f63GeOWNzBNlSEre6sZ8PSzzcADgDQLyAS59giDoXg==
X-Received: by 2002:ac8:2371:: with SMTP id b46mr23906414qtb.270.1556070277615; 
 Tue, 23 Apr 2019 18:44:37 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id r4sm7682721qkd.84.2019.04.23.18.44.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 18:44:37 -0700 (PDT)
Date: Tue, 23 Apr 2019 18:44:33 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH net v4] net/ncsi: handle overflow when incrementing mac
 address
Message-ID: <20190423184433.764674b8@cakuba.netronome.com>
In-Reply-To: <20190424014310.24253-1-taoren@fb.com>
References: <20190424014310.24253-1-taoren@fb.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 May 2019 16:11:00 +1000
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
Cc: Maxim Mikityanskiy <maximmi@mellanox.com>, Andrew Jeffery <andrew@aj.id.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 24 Apr 2019 01:43:32 +0000, Tao Ren wrote:
> Previously BMC's MAC address is calculated by simply adding 1 to the
> last byte of network controller's MAC address, and it produces incorrect
> result when network controller's MAC address ends with 0xFF.
> 
> The problem can be fixed by calling eth_addr_inc() function to increment
> MAC address; besides, the MAC address is also validated before assigning
> to BMC.
> 
> Fixes: cb10c7c0dfd9 ("net/ncsi: Add NCSI Broadcom OEM command")
> Signed-off-by: Tao Ren <taoren@fb.com>

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
