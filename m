Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C4C45CB5
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 14:23:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QKWq3DY3zDrgD
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 22:23:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="CrNJF4wQ"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QKTh1LRWzDrB8
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 22:21:27 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id a27so1498594qkk.5
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WlYwW5y12B7OxfPDmWRKnUOXybYI+jAbULo5UEZV1K8=;
 b=CrNJF4wQ/2BfylUyJLilpz2OvRZIGVIlW1QF9cTDt7grEpMPnVpICgnWZ1INs+ZcHx
 bJM6THc6PGdLZeo1zV8lD0Gnlpd38wDg4O7X5oIQv5ohQARBBEmaBbKZNcHNBmGChPQ+
 xpq2ET2gf83a2wrX6SY/WsfJvifdyQ9KbSA0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WlYwW5y12B7OxfPDmWRKnUOXybYI+jAbULo5UEZV1K8=;
 b=ZLhx5ajQ6s4p24lL606sbFK2gpKWyDF/KLxUT9wLKkR24uj+JSQSgTWWaICHREiDlD
 c/xwsai3sO3xG4EDrjRbJ4WTdu6Dc1m7AJCVKae6jUHdD0Q7oLPQMQNPK9SjH0iPTr0a
 kX6onZXhYsDB2lJ7FizrF2X0FmBBiLC63S6nDjafjla+JKZdPLaYDg6akviP4JmK3R4R
 zaCtl/EzADKGEi0bNC/XBxj1hfGPcWsfZltzRQPqZxz8ftyG3wL5+X1wRerc3cmnXbB9
 qR0SBhIr2iolnB8WEHOwkW6d20ltoN9J+lJzBOBBoiAQ6sGtUREUWa1nrdChBsSMmFwN
 0Wkg==
X-Gm-Message-State: APjAAAWL81PPsGJ/haFUYpJiRJ/4QCjJLbz7UkwzoEDf/uiuEQWTz8A6
 LSRkuGAFVFJrLj4PF7u9p1ME0UW9QlP8X9udPqc=
X-Google-Smtp-Source: APXvYqyDbsTdzvLVMPPv9fwQn4sVV5cipybUF3qhTMNCpnQ8oqEMYQUzGeExVaGRiBdzJuNPdu26coGdzZtSoU0p9pQ=
X-Received: by 2002:a37:a10b:: with SMTP id k11mr77831699qke.76.1560514885019; 
 Fri, 14 Jun 2019 05:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <1560409202-6299-1-git-send-email-wangzqbj@inspur.com>
In-Reply-To: <1560409202-6299-1-git-send-email-wangzqbj@inspur.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 14 Jun 2019 12:21:13 +0000
Message-ID: <CACPK8XchuTTy+jfvV7r9BUXnLL2GJjJViK7timyfyNzfCWuOfA@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v2] ARM: dts: aspeed: Add Inspur fp5280g2 BMC
 machine
To: John Wang <wangzqbj@inspur.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 13 Jun 2019 at 07:00, John Wang <wangzqbj@inspur.com> wrote:
>
> The fp5280g2 is an open-power server platform with
> an aspeed ast2500 BMC
>
> Signed-off-by: John Wang <wangzqbj@inspur.com>
> Reviewed-by: Lei YU <mine260309@gmail.com>

Committed to dev-5.1.

Cheers,

Joel
