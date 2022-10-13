Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C05FD861
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 13:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp6jB3Yw5z3c7g
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 22:28:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ltuVZbUE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ltuVZbUE;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp6hZ6LKZz3bjd
	for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2022 22:28:12 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id w18so2331564wro.7
        for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2022 04:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z5WwluomDikU7dX2FZCklulKxtoysCIO+N58YQIatVs=;
        b=ltuVZbUE+KdNcnXVyYLfSbxH4Oa/ZC1ZVEBF5eFPTMLNQyJhq7Pk5dSnwpzugDB5Po
         26ndjar2i40JasF7erds/Y1I3pWJdxUa148KIZjyNQHX0p7KCyRkxl1FCgNft+yVKEUO
         8Im9+WJfxd8NFcP2uq8UNgTY5h1ItfOuE/EXduSJcWj9DwJ1RhN7cglln2Mw4o00bTC7
         an1cf4GdhIeT+rbcMij4zqr56lx+Du3hQLehxl8wTvTMRysQbyaYG12y02UsuvZNJXI9
         IW7TfrnW+4/M0CnYqTGM3NFoeBnWabB8lHdM1MCg9yTbp7Do+bbeGqe4kTmYPqamfI3n
         xEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5WwluomDikU7dX2FZCklulKxtoysCIO+N58YQIatVs=;
        b=5lmP+5VpE++q1QhkKSh3dZDGKWqNZyiqSic9FhGPTpUPKkHJ6oDK2biV/zZywc5xq4
         kHitORESKpd6Ar6X8nrzG5+cap6YYRWw2XBta4Kbr+7Z3jsFYq+CyP4JZPcYahkdr3im
         vBH21RX1UchaX8xlTApBjfwI+OqyK1CEEjQNFLihP4NYidrXP+lpvPJ6IyB6hX3nQbn3
         DqyhpvX4BTwOwYNzcjB3UoZ0OBmhC+DnF0Ovn8agwCL3w5q3p/LwJX3FDUBAo7s/po3C
         SQGZU9OkXnZ2oYWkXwY58pRALGNoUBUkcj9yUKkkf0wZw3kWWSNpUpDOdYDpvXl93+6Q
         +3Mw==
X-Gm-Message-State: ACrzQf1JKNRjoPlAsVHi8YxOG568PL0Sp7lOPohBosxjWwZX2XEG1vc6
	B3oeFH03wNy10Uk8yFibvmVSyhqspRyeLfvnRbg5og==
X-Google-Smtp-Source: AMsMyM6gImwFiZ0rTHwgxfqdB7tD245ibfLL1jfdH67yh8Vz/qGD0NYNLiM5gJ4ZVumXNis3pn8a3WGBGL8Eg4AgUGs=
X-Received: by 2002:a5d:64a8:0:b0:22e:409f:a3cb with SMTP id
 m8-20020a5d64a8000000b0022e409fa3cbmr20834340wrp.168.1665660486296; Thu, 13
 Oct 2022 04:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <6bb3a7e1-053c-ffea-503f-a6e3d75d31eb@linux.alibaba.com>
In-Reply-To: <6bb3a7e1-053c-ffea-503f-a6e3d75d31eb@linux.alibaba.com>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Thu, 13 Oct 2022 19:27:55 +0800
Message-ID: <CA+J-oUtOZ3dQBqzThFzVL7KgDX9ySBK0osTKN_XyvhW_LZqYOQ@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] systemctl hangs on our BMC based on
 2.11.0 release
To: Heyi Guo <guoheyi@linux.alibaba.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Heyi,
    I hit this problem 6 months ago, but it hasn't happened again
after upstream,
    I don't know the root cause. but you can try to do more tests
after upstream.

On Thu, Oct 13, 2022 at 5:02 PM Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> Hi all,
>
> Our BMC is based on OpenBMC 2.11.0 release, and we find systemctl hangs
> nowadays. The phenomenon is just like the below issue:
>
> https://github.com/openbmc/openbmc/issues/1097
>
> systemctl command will always return timeout and dmesg will continue to
> pop up below message:
>
> |systemd-journald[445]: Failed to send WATCHDOG=1 notification message:
> Transport endpoint is not connected|
>
> ssh connection will be refused, and normal reboot will return timeout.
>
> Is there any known issue which will cause this problem? Or do you have
> any suggestion on how to debug?
>
> For the above bug, I don't see any resolution before it was closed.
>
> Thanks,
>
> Heyi
>
>
Thanks,

Jian
