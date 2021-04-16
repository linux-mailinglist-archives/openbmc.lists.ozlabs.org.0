Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4823627AF
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 20:26:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMPmw2Bprz3brw
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 04:26:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=I7NkKx+r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I7NkKx+r; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMPmN4X50z3c4G;
 Sat, 17 Apr 2021 04:26:11 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so16870404pjh.1; 
 Fri, 16 Apr 2021 11:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+NoMdFRqvCj0wjEu2wU+EppPHqkD5aPuBzCUVO8B5Dw=;
 b=I7NkKx+ryboIFsQYOl0hn9Owr8ah4PzLF123GS1rr/xs+Is+upY0kBQ6YKQF01qdjT
 /JXCewbuJ6m9FkA+hTJ0ZLNndSrBrcAxe1SL6n+h8Dz/6WwoLJGOl3Usr09pFM+DDcyZ
 HJpE32jNzCiYvUL/nDIlAczIlyUI4lF30PKHl8NsfqW4O8uK4lBvECjt4Wbi84sc0yUO
 TBw88FWyBysNTaVA0RWN6HfYwvdJzPzqKYBclHUW4yQSNJtWsJQzFIky0SHayASO+TKR
 MGpyBRr6Fzxc539M6xaRvLtYi/XqzOG3e21wiGh1pwMNcYgqwMmamry8dLyz86+6T+LX
 24uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+NoMdFRqvCj0wjEu2wU+EppPHqkD5aPuBzCUVO8B5Dw=;
 b=Tl0OPrQoXMAHeFlSTHne/qo9NY9h/WpaATZ5ZDID6JBV0BgEVQNJNaD71d5j4GOOys
 y9FqoM0YuTRQxAl2Dw7rY4MTiXz6jWZr1XZRE+2NSR2vPeYAn9+mFxB66KvjO0ZNm1t9
 1MqqXvso/XA/2yLVAktJK84JkNwEliLHKMN5r2sJo2fQl6E2zdtM+yWuxjqdlV1S0h9L
 Q/PtJHX43/aYWFkLcf/gmf9B0u8n8gTw295KcZ5HRK4DO/tTYtinH+5cJUxzDUpc9/lq
 0kLUGXPTlN1raSPujvI5gjrtzZvx9YeZrf6iWkptJ14YElUEXyq8t5UkOgX4ZBXMmo3S
 P6Bw==
X-Gm-Message-State: AOAM531X00DClmWVDg79XNIpcic0q/F1fx9c8gO2+XecQV2cy4S8zkdR
 3xmspsk006zJXJVf2YT0GZQ=
X-Google-Smtp-Source: ABdhPJw2kWFT896TOOCfe5suf1zLJSSp2jHsX2kBjJGSkduJ7jRvKnfFRK8cKa3n/6vBVu3+CGwaVQ==
X-Received: by 2002:a17:90b:344e:: with SMTP id
 lj14mr11195691pjb.89.1618597567017; 
 Fri, 16 Apr 2021 11:26:07 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id x1sm5324218pgp.24.2021.04.16.11.26.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Apr 2021 11:26:06 -0700 (PDT)
Date: Fri, 16 Apr 2021 11:25:59 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] watchdog: aspeed: fix integer overflow in set_timeout
 handler
Message-ID: <20210416182558.GA4816@taoren-ubuntu-R90MNF91>
References: <20210416021337.18715-1-rentao.bupt@gmail.com>
 <2771f72a-cc3c-54a5-cc2c-715ea61be6b7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2771f72a-cc3c-54a5-cc2c-715ea61be6b7@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Amithash Prasad <amithash@fb.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 10:07:32PM -0700, Guenter Roeck wrote:
> On 4/15/21 7:13 PM, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
> > handler to avoid potential integer overflow when the supplied timeout is
> > greater than aspeed's maximum allowed timeout (4294 seconds).
> > 
> 
> I think this is the wrong focus: What this fixes is the wrong hardware
> timeout calculation. Again, I think that the wrong calculation leads to
> the overflow should not be the focus of this patch, though it can of
> course be mentioned.
> 
> I'll leave it up to Wim to decide if he wants to apply the patch with the
> current explanation.
> 
> Thanks,
> Guenter

Sorry I didn't get your point correctly, and I guess it was because of
my lack of knowledge in timeout/max_hw_heartbeat_ms/worker (hopefully
my understanding is correct now :))

Let me drop this patch and send a new one with different subject and
description soon.


Cheers,

Tao
