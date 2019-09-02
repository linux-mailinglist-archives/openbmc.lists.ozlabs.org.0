Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D869A4D0A
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 03:09:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBnc2mZfzDqZ3
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 11:09:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Id5LHSV5"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MB7D3W1FzDqbB
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 10:39:52 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id t12so13978140qtp.9
 for <openbmc@lists.ozlabs.org>; Sun, 01 Sep 2019 17:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HB8ePyrl3ayAquwhcJtCqu+baSFwSsGf1FyYFrPxykc=;
 b=Id5LHSV5zgbTHFchcE55Ws342PlbNpd/OHAw/e7l+LSo7GE4//wAF3YPGuQXq25GuB
 3egqOgpdvhnjg7oSqY+9tnJyosYo59nzPn1KBvVrlIYL111BDdNtA81zhG0m8SQky2xK
 Q8i57TH+1gaXuZ6gdXPj86J3n+V0nQ6ojIy8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HB8ePyrl3ayAquwhcJtCqu+baSFwSsGf1FyYFrPxykc=;
 b=ccXLk+/GzDfJQOhEQItWyeIg0gwx7jTY9zPTpOn1Ki6xr4+zKTlcjNY+qg9jsyClEa
 xQeKVelrS8tgPJiEMFmZlYLZtVSsFU9kkBeVjssgQQ/wl0o0DFRZQN166FYZg1ceYEbO
 6GGPss6BH7OD7aPqLWRppzLVZNVEin0LIKwMbrjP3gO1W3qlpqdz8ZitoFUeGLJo0kv/
 p1Jke8wCuKGGzfZR1T+OoRiKysT5jN1P0KJpZe1mfjo1czRyLkYNr/c5hGtNG44eX8h8
 N5c6lkYnu8lUEijVLQhAZWCG2GFAsOOSsE3yWmQETTuZ5MNWNLz9uThDgQtGhi/PWsEx
 m0YA==
X-Gm-Message-State: APjAAAVm56A4aPySuN5Iu4lbVpwd4BZqwhLRCbwPaJfQNIuAlHYpaL/u
 VrpJ9Y4lthftcBfLJBosbh19dWo1jAYpEe2Gp0mJzUn/w1c=
X-Google-Smtp-Source: APXvYqxZXVD6uv0tDQaQFD0ZNTpeleyjSTA18PtBmHOx1uQ9xVaAen199aqLgg4LKyCRG3Qi3wItW9E+2uZdFnLCKmM=
X-Received: by 2002:a0c:b44a:: with SMTP id e10mr14040564qvf.172.1567384788768; 
 Sun, 01 Sep 2019 17:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190830090244.13566-1-andrew@aj.id.au>
 <20190830090244.13566-5-andrew@aj.id.au>
In-Reply-To: <20190830090244.13566-5-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 Sep 2019 00:39:37 +0000
Message-ID: <CACPK8XfsOkv-kY2iBn8s_R7BW87eBMb_Exsb0F3s4Zs3CbE1Mw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2 4/5] mmc: sdhci-of-aspeed: Allow
 max-frequency limitation of SDCLK
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

On Fri, 30 Aug 2019 at 09:02, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Add a get_max_clock() handler to sdhci-of-aspeed to report f_max as the
> maximum clock rate if it is set. This enables artificial limitation of
> the bus speed via max-frequency in the devicetree for e.g. the AST2600
> evaluation board where I am seeing errors at 200MHz.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
