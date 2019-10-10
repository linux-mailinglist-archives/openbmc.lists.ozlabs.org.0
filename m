Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D695ED1D71
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 02:33:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pXB15ZXqzDqZN
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 11:33:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oCo2UZzh"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pX9R0RRwzDqBG
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 11:32:42 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id r1so1307138pgj.12
 for <openbmc@lists.ozlabs.org>; Wed, 09 Oct 2019 17:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hwafwgLNngUMlC4oWHtYvT1ITO5nzOsFkBcAKdpZxJc=;
 b=oCo2UZzh1NJar1FOnQunNDg7VGAZRVDrc8ixlgCW/wcPpqcbAY+3tTJEQztNa0qPbd
 2y6WZSQVkkY9AtGM+aPEqp3HF94vyeeFo6nEc2Eg3kwHaArGISKn/W1xFejrdf/UreTI
 +V1HOuSBWAdHe6al6wCyEhEU8Hp5TtUpOYlEJenBdOZaZFKjD8piSgFSp7Vicj6JIm3n
 MtJSH5prCSzllusqZ9hfVtYeGF92muQuRKFP3Uo3C00cHu0xR2EnTt8xiX2t7FrAhGA0
 9BlPDzcGsvaSvdONG0rW01PNl+JJFWFO5SW4IM69F+etf4MEFkP7Hp95k2XNdrahCJsa
 svIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hwafwgLNngUMlC4oWHtYvT1ITO5nzOsFkBcAKdpZxJc=;
 b=IkQ+OgZRa0nalyGQOohmDSM9AzSIkG7eeEEmONxwPxspjhE4/yWV+TmebzJirxNRXs
 U7+DB9zSdcbbqxJJaFlGuoGj4JXZ6f4un3+ZCZf+UuDR9hIPPGljLbL0afk3AzOgMdeV
 Tzsn0J+ZUgT6UDtHSKRwnydn/X/8DINiSS1ATa0Qbct+zlw9qUeQpo7ZscK1gwiuz1/r
 6pFS9nXW2617VZ+uUlOGGgdWtBuMuOEVG9XKct3C3xBJ5rXV7xLC3cxz+a2HhJhDQgJq
 bIF9LPo/oNDTSaqnN5XvvQnH7weS5OvLVbpK8hAheL1E0OX6qutszWVJ0joF2Y0P1rou
 cyQA==
X-Gm-Message-State: APjAAAX6p6ZEtUcJ/9AOPrDcKIBinyL1L2SPGJD6XUi/FRrw97cC5tIo
 PrKoR7a56RsY4/feSLmTcgVBfA==
X-Google-Smtp-Source: APXvYqy44rmUKloIJITmQv3fmo4qusdRi2qGuLDOcOb1+z5L9mdE9mmEgbP0UrkPP86MCtd6AwIPJw==
X-Received: by 2002:a17:90a:2142:: with SMTP id
 a60mr7497811pje.8.1570667559681; 
 Wed, 09 Oct 2019 17:32:39 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
 by smtp.gmail.com with ESMTPSA id f128sm3743411pfg.143.2019.10.09.17.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 17:32:39 -0700 (PDT)
Date: Wed, 9 Oct 2019 17:32:34 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
Message-ID: <20191010003234.GA12710@google.com>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Tao Ren <taoren@fb.com>, linux-arm-kernel@lists.infradead.org,
 Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 09, 2019 at 02:20:34PM -0700, Jae Hyun Yoo wrote:
> In case of master pending state, it should not trigger a master
> command, otherwise data could be corrupted because this H/W shares
> the same data buffer for slave and master operations. It also means
> that H/W command queue handling is unreliable because of the buffer
> sharing issue. To fix this issue, it clears command queue if a
> master command is queued in pending state to use S/W solution
> instead of H/W command queue handling. Also, it refines restarting
> mechanism of the pending master command.
> 
> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

We don't have any multi-master setups, can we get a Tested-by?

Wolfram, since this is a bugfix, can we get this in 5.4?

Thanks!
