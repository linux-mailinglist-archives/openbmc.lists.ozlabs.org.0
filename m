Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E14EAA4D01
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 03:06:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBjw5s30zDqZD
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 11:06:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="FicLMMZn"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MB4L4SsYzDqW4
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 10:37:22 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id g17so11164431qkk.8
 for <openbmc@lists.ozlabs.org>; Sun, 01 Sep 2019 17:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dLCkW2mQ7pzdTO0nelYirr5LphC4KPpvkUgTXDVLdms=;
 b=FicLMMZnhRgs5ueOUkW+bFy83WlJH+s4WsxIU3SGxSqi7x7ExPpP4zobypGFtUGSx3
 38bfkrN1qmLbuwHzAXyMy4KWtu7c9z4pnhZTfMQMCVOdRFkOVpfI3ZQVnnx8j/fYz86o
 TbiiVNjIggNPdbrekWrara7hSckAkXMxch4f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dLCkW2mQ7pzdTO0nelYirr5LphC4KPpvkUgTXDVLdms=;
 b=Tjk+yulIqrNxhmhDanuxkCm0Buj7/j+FUbkp0uTXYrFYLK2L3Mw04xt3+2rB4fUiI4
 NpEW7r11vdvMEac00miOeM3NCjEBqDSpilaOH5cYBIu9PjOM4s9a9lfdrk8a3Jzlbn+n
 246Dkmh2JblW1CkySp0A5YiTbzRb9CVcNrtcWiOhsEbQHRvkLqlfJlmwiTAAuQ2y8cT7
 yo4IIgx+5yoXTb4fegUllOUoLvIBMqLK6hqR66Jz69nruty8FjV0qogG+jfxMbcxt85p
 xc+W2qS5UwINeQGGbWxtlIeLgSxo/1Uu+15alwr/MH4Lv9wNhUWC6mar/6e6qOrFtzhj
 rNXw==
X-Gm-Message-State: APjAAAUEdqybLovKUKnYpK9a3BFVmS+joxEIkwDPbpKTXfz8xZBhVNg1
 +7bSfAL0MF03NnnCJ91A5jbpRU51JI/qw8vmFCM=
X-Google-Smtp-Source: APXvYqw9oJLOQZ4yJL45YpC4G7tmiEeNMQUpvvsGEPjBduxmQi2IEkKgNQWfdvYdN3+xoHMxS0e5zInUxjwlD4GAIAU=
X-Received: by 2002:a37:bd5:: with SMTP id 204mr2447602qkl.330.1567384639601; 
 Sun, 01 Sep 2019 17:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190830090244.13566-1-andrew@aj.id.au>
 <20190830090244.13566-2-andrew@aj.id.au>
In-Reply-To: <20190830090244.13566-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 Sep 2019 00:37:08 +0000
Message-ID: <CACPK8XfNZxtnGbWFV0BAa_eridBdYUW73YNBkKgyx7p5wbXJNg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2 1/5] mmc: sdhci-of-aspeed: Fix return value
 check in aspeed_sdc_probe()
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Wei Yongjun <weiyongjun1@huawei.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019 at 09:02, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function of_platform_device_create() returns
> NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> (cherry picked from commit 7b7de08a14b59d45cc4720bfb21732063ccfc8f6)
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
