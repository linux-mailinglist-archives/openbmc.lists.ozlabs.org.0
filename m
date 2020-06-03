Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C2E1EC79E
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 04:52:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cD3L111QzDqLM
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 12:52:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1fr+MYUm; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cD2d1wZBzDqGc
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 12:51:52 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id m18so791205ljo.5
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 19:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wpzMEMZRv+cU30pNH50TklMc/GPrVnTRpqgRtT/T548=;
 b=1fr+MYUm5Y52Y3TOcr6WEpqbVTuydCg05PK5pp3uk3UJtls/F01xlDb41HQP3Cpxvi
 y75tc/pb6JEC0IK5AGB/9c99YyLWplUTeynLAuYEF4OdHn6OlDGUKjBuB6NjolQ+inYv
 iNfy6oKy94pRJ+OD5Mn8Mfr9bzSQo4s3KtjOWacpsaLT82zqhoXhnSk4ItBD3eKmWV9a
 wayr9hm8T8k8jPNICTFLA4QUiznguVBxB8IDdVnNyvraHV+I2k4sAa3Q73oUJjFoQMsF
 9tCz+CdDfhAa6wAcZnPgFH+9lvTuXF59TrWtcxQH/OmO69J32LLcy3vyQ40/Zh1nY9Ei
 FyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpzMEMZRv+cU30pNH50TklMc/GPrVnTRpqgRtT/T548=;
 b=QpA+vrOQXEl9G41vr1Iyhk6VHuyNpo8jnHqT+yK3F/wDX2UkmyGjVNYmOYopi5jEHJ
 CZTEeA4DUqFfkz/eBo5AiKjp8QNe8oa7WqU7MQAyeydW6SpBTO5fWtJdwlnk0CBFyoqx
 /hZyVuz7G6OmQ+j4Jssjr5vUTGtdUWhIN5toUGuToPdARluRzEdklYG1OIu1YnUIsazh
 9B0ubXRJnxsMF6pIWD4qxzSlS1TxcRqCrT+kB3VsHBy7yl8Z8wEILbq5zJ9U8X/lBSTy
 me/2YtOc5qiEUQ+vDOifFUmXvyCD/YYTtmlS44/yVjZvPDpp1UOamytJGofMGXq3jxVo
 ZhEw==
X-Gm-Message-State: AOAM530UOhU5ZUp4t/AQKggNvDX3mVYSxaefFrucZIts15AskTWHkPLx
 JzZZcvE6rpkpvZzjL7fI7tgQvhguAzmPvvt66ECWrQ==
X-Google-Smtp-Source: ABdhPJzkBAhpUZItjD3nwCkKxmhf4G3BVSL62pIePRWp+BY8wnbeBA/6RNSH39IlRE8dTvcYiAIRw+Z1KJFUj9fdteI=
X-Received: by 2002:a05:651c:3c9:: with SMTP id
 f9mr979136ljp.416.1591152705719; 
 Tue, 02 Jun 2020 19:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
 <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
 <CAPnigKku77Tc60TAAb_yTJaWNePYWM204BF8erJS7CjhxrAPRA@mail.gmail.com>
 <20200602230639.GK17541@heinlein> <20200603000702.GC7478@mauery.jf.intel.com>
In-Reply-To: <20200603000702.GC7478@mauery.jf.intel.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Wed, 3 Jun 2020 10:51:34 +0800
Message-ID: <CAGm54UGNdLLMf7Lu5gf-yzBRLVeu=RQDdTnb6mp_ZTsBT9ynhQ@mail.gmail.com>
Subject: Re: OpenBMC Logging and Error Handling Dos and Don'ts
To: Vernon Mauery <vernon.mauery@linux.intel.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>
> One more change I would like to see is a way to actually have the real
> filename and line number show up in the systemd log. Right now the
> filename and line number are always the logger code:
>     CODE_LINE=76
>     CODE_FUNC=helper_log
>     CODE_FILE=.../usr/include/phosphor-logging/log.hpp
>
> It looks like C++20 has a shiny new helper for this: source_location
> https://en.cppreference.com/w/cpp/experimental/source_location

Yup, this is what the logging needs to improve as well.
The new logging API is better to resolve the issue:
https://github.com/openbmc/openbmc/issues/2297
