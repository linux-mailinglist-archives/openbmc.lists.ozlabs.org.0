Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE9EBECDC
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 09:50:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f6Xx3jFPzDqjR
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 17:50:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="LRPD+Db8"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f6XF0hNszDqVj
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 17:49:48 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id q203so993811qke.1
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v2VNt30P9MOqJz0ZIYYqTAYmbsELaoZ/PnwHrQ31jUM=;
 b=LRPD+Db8iyTel2hfP2B6UWFiAPvouYP01lf+RreRHrMx+Vc9rH8NlzrvHgmt73amhB
 Y09Br7UaCI/Rpin7HBftwPTiidwJlVsZwCVCZ0Jd3/1NKfbX0nuXEhQHmTwusrpSlkhJ
 b71+uxoEH7sZFc8X+FUtjRrWeXQCHtzI6egkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v2VNt30P9MOqJz0ZIYYqTAYmbsELaoZ/PnwHrQ31jUM=;
 b=H23StowZbmEpHU0slbitW0TwjXRpteBAT3PXX16vQkqVdc6CwL6xje4TnoZv80bglM
 R3PjYXWMZZpWFP9hf2ZPELr+GSsjSP3M0iwjByg11dFnnLfYwd/3tea8OsVNK58svR3K
 L4VVpq45dXtbIktvkhQj2X28bN7FlnIAR3+oNlUd8g147daB1aJlIh2q19PSW9Z7KMuG
 zWqlTZi5yZa0n5G04SSziZV/hXbEB2jRmAAAeJHiwlL1DCDIEYy6aUF08BXvNzxaebA2
 zk2QNC9AX5GKyYimyPHEwoPfyIvl1NLfi+d06ynb2LafMYu+KCF/5AlFYzNXU+H9RZhx
 DRtQ==
X-Gm-Message-State: APjAAAU0zI052B+OiWviCsciehf+byLfdBVAhJOPo3Wpq7vwE2bo7Zdt
 pw2jErq1jZlTO+SErilZfYRw1RSSgKEgF/tIhRQ=
X-Google-Smtp-Source: APXvYqwj+Tl9+leFPmQ8XQCvNApJKD1k3ap/LgdnF9fNc6ZIfV1PnLgTwuFMNXfeZCZmPzZnqbu0HDHw2G8J1nDbxJ4=
X-Received: by 2002:a37:f61e:: with SMTP id y30mr1955485qkj.208.1569484184533; 
 Thu, 26 Sep 2019 00:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190925153439.27475-1-andrew@aj.id.au>
 <20190925153439.27475-9-andrew@aj.id.au>
In-Reply-To: <20190925153439.27475-9-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 07:49:32 +0000
Message-ID: <CACPK8XeXWSXMVTDZ4W=Q1edUGCGuX5addTH75ZDW+YcFLk9wsA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 v2 8/8] ARM: dts: aspeed: Add RCLK to MAC
 clocks for RMII interfaces
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

On Wed, 25 Sep 2019 at 15:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> We need to ungate RCLK on AST2500- and AST2600-based platforms for RMII
> to function. RMII interfaces are commonly used for NCSI.

It's unfortunate we need to do this in every ncsi dts. The only other
way I can think to do it is have two descriptions of the ethernet
devices in the dtsi, both disabled by default, and the dts picks one.

Do you have any other ideas?

Cheers,

Joel

PS, you might want to run this on your laptop:

git config --global sendemail.suppresscc self
