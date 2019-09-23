Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EF3BAD60
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 07:00:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cBvl0mHkzDqCR
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 15:00:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="fc6RepPt"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cBtG4WLSzDqKN
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 14:58:46 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id u184so14059036qkd.4
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 21:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/CcxVbCP36Y92BrwLKYZxiZ81Iqbu6GjbPiWAkyOJ18=;
 b=fc6RepPtt028U25whcbhAva/fjVozAUpV/4+MEAMaeLKg6zrBNNmisNdhjUHD7165/
 pguN8w6+/hbvhnjpw6SYCCCOl1mpwakxKjjxcER2IHByKeuvzRnwopvt7j5U7Vota2d5
 k+dzIQoDW4P5bC57rbKbzkK3zgpkh96VYXbsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/CcxVbCP36Y92BrwLKYZxiZ81Iqbu6GjbPiWAkyOJ18=;
 b=TT8xS7I6F/SO2yMEFktZnwL3iFUFr74TqwnWAsySBO67gvVa+tjEJEnDqeMbmzIX6u
 ovpFpDPohd872Z3p4DDE8B4uInuwyCSibpDP4unvRiLoWJNF1PWgTO0lqO28qNmE4JD8
 6/OqxtjDu5Fd1ldvF8Fi7BlqLFMVT3McZeJYUNxhhwiycQwADW13+JBz5lnRTBaGKO2p
 +/u1Yny/fJvA10BSptp//92wTXgDpjTZ58xpKzAyOYVicDVvQl29dUpMUHFA1Zchld2n
 1zOVc14CvSss8DHE7PxYtyjtoPuQSLa+tRUkbRJSkd8hWmWvMhLE6kHJm6izEbqNKHnu
 04dQ==
X-Gm-Message-State: APjAAAWKr7GUdKQ1uoCBVS27DcgUcrEW6X/1lYbASHv4zYg7DFuSuV4H
 1GwusxJcXBKwo85ssYM3bgXkzo0JbUaq6+6NkJk=
X-Google-Smtp-Source: APXvYqxhlvUvqhbR0s5M7k1u8ULre+mEQwEGh9exXH/zLYP9lqzzWmnk5tlRqgsnF+licVgRbsYwWYw0UJjFEhrC4rQ=
X-Received: by 2002:a37:bd5:: with SMTP id 204mr15678872qkl.330.1569214723852; 
 Sun, 22 Sep 2019 21:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-4-andrew@aj.id.au>
In-Reply-To: <20190922123700.749-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2019 04:58:32 +0000
Message-ID: <CACPK8XdHCM6h52vXFqF-3vzXfG+2--12nYM=3MdQQvdM1rMcGg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 3/6] dt-bindings: clock: Add AST2600 RMII
 RCLK gate definitions
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 22 Sep 2019 at 12:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2600 has an explicit gate for the RMII RCLK for each of the four
> MACs.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Put this in the same patch as the clock driver changes when you respin.

> ---
>  include/dt-bindings/clock/ast2600-clock.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index 38074a5f7296..ac567fc84a87 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -84,6 +84,11 @@
>  #define ASPEED_CLK_MAC34               65
>  #define ASPEED_CLK_USBPHY_40M          66
>
> +#define ASPEED_CLK_GATE_MAC1RCLK       67
> +#define ASPEED_CLK_GATE_MAC2RCLK       68
> +#define ASPEED_CLK_GATE_MAC3RCLK       69
> +#define ASPEED_CLK_GATE_MAC4RCLK       70

Nit: You call them MACnCLK here, but rmmin_clk in is the gate name.
Please pick one and use it in both places.
