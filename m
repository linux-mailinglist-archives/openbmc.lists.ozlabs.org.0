Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 924911854B
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:19:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45038613WTzDqJg
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:19:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="c9yHI+eo"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pjLR4jv4zDqM9
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 11:25:33 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id y5so9848999qkc.11
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 18:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=iEeZgL0VLnAFC2YaL3OKxz1fZYNN/AJX7WfyiHQRd2c=;
 b=c9yHI+eo9azROJYdTqJXAZ12f4+oRqiVSL3JKSjX/2aIvNqkrsd5ZoZd38FU1SKi+b
 Jw+EyoFhKlTRuJzu4xx4Pkxr43qViXxqX9tZqwfb5WGitY7UgvJTWG8IXcFzxV5v/W/+
 EiFCK5TY5YXUiLLHg4MFHMZGFacnIOH6Ccmix7rRyiHrA5ien5jJINTa/TZyYDt9udYd
 oKdEzXrYWC1ArHqVIVt6TOWQdCtHmPJ1WzVCPd3be+Tdyy/nSOC7jS9zZf4DIxLBLAs5
 3ynK4dBy9lXhhTY2a+YFWpgdTawoKsNTpLfTGJ5hGL2RNgAU3waFJ1H7Fh3VOP7oXpIb
 pJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=iEeZgL0VLnAFC2YaL3OKxz1fZYNN/AJX7WfyiHQRd2c=;
 b=RYB7LOxvsPb8RtAHykxDHI+ErQKEr9c1iKEtqY60kamkF33mqtpjjZ+ZGj/zAoj3nn
 xI1P5cchUru3N/GzC298UFI+n3juKCu6/UHvibRE2EEJth6xVAq+yW3JMUA7MC6ECarq
 2io4i96s/EnvAFQTOfeZun4ouzf9/guJMnE3y8YIdnNaQrwZRe0TcZZB2M5thrJ4A1fw
 Cmd76uY3XIcn3t+o3yGCuu5rRvvWst81okItuFlbOKMgcY3bt+7/FBTp9EzE7rSTaZGT
 Sz5fsQgGPsn+v+sGRgOyUE9A/pH2+1Bb3niCkcnSP1vjJhp8qSd5t4AYqTqb3hQNyzR0
 cyNQ==
X-Gm-Message-State: APjAAAWbcc0VNSfLEI1XKRNVUdFDXU/YgaXAM5/jB3roY7NbQPoOGcB+
 1kD89AYEnavtSmAa0hVQ++hnQw==
X-Google-Smtp-Source: APXvYqy9cpqCoo3NZxMDHXid22XhjI0797hHPARLSj3YZXEDWX6Qrtus5svvzsUaaEXAoyvRjfPj1A==
X-Received: by 2002:ae9:e506:: with SMTP id w6mr22900147qkf.167.1556069129964; 
 Tue, 23 Apr 2019 18:25:29 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id s2sm8275350qkg.67.2019.04.23.18.25.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 18:25:29 -0700 (PDT)
Date: Tue, 23 Apr 2019 18:24:50 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH net 1/2] net: add eth_addr_inc in etherdevice.h
Message-ID: <20190423182450.27b403d3@cakuba.netronome.com>
In-Reply-To: <2b3935f9-fbf9-6baa-570c-dcd6382518c4@fb.com>
References: <20190423224138.1295-1-taoren@fb.com>
 <20190423161502.5d3e9c36@cakuba.netronome.com>
 <2b3935f9-fbf9-6baa-570c-dcd6382518c4@fb.com>
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
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Samuel
 Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 24 Apr 2019 00:59:52 +0000, Tao Ren wrote:
> > Please see:  Documentation/doc-guide/kernel-doc.rst
> > 
> > Here we need:
> >  - "()" after function name;
> >  - no extra line between function name and argument description.  
> 
> Thank you for pointing it out (I didn't know the doc-guide). Given I copied the function comment from eth_addr_dec(), I will also fix the format for eth_addr_eth() then.
> 
> BTW, "()" is missing from all the other functions' comment in etherdevice.h, so maybe we should fix that in a separate patch?

Possibly, I'm just trying to make sure the new stuff we add follows the
official guidelines :)  For the old stuff we need to way it with
potential merge conflicts and muddied git history so the case is not as
clear cut.
