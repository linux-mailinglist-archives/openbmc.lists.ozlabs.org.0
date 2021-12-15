Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAB247834E
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 03:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFYDs34N4z3bnG
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 13:42:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bVXWXenw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=mr.bossman075@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bVXWXenw; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDfPw4rgGz305p
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 02:32:34 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id 132so20324675qkj.11
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 07:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z+oh2c3Jcnkt54ng3vXXJOximUDkzdE7qD69NGAAi3U=;
 b=bVXWXenwgc9g+2HfHCmbN1/c0J29vFn2xTRDYsZEBNXB8tdOW1XLoK5yjTZRzMJ0Fj
 Ss+fkA9QSn998XnZzAha9h/nM5hEf/4UNKEx5ZnXik/51zyinlVWRXgFpN8h2zfJShER
 56ihXKUjb3CVyJPAjZoCBqpahVpQ6E6NWS9LWdxQ3qQNgIMq4vVIyhBaurYyAaHXlTvr
 c1R/O0ViHcjBrZK9S0hMrlA6QPjQiZxiqYW+b0rH6sRo7R6qlNk1E5KnHAbW7FOpMjzv
 40cjCwwEKjHhBjJ/WD7HVt9UMBwwc/x7GJts8sV4+SMehxA9DiQqBsP6te1/UqOQ7YG0
 X5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z+oh2c3Jcnkt54ng3vXXJOximUDkzdE7qD69NGAAi3U=;
 b=wfbvtdQlOOyc/SZmHGmoA2wzoCTM8TBR7rQYbvnDJzRbi/kFn5QKaxxepZ84osQjGR
 OFKzd0iZzMd4xRmEIWXXnIM0S8cJ+ssPz7p4dlos5oMtGdv8KedMpfUDZeWZXwQIox6n
 kL+pQabf6tcz5XRTk0vTSO5Ospu+XTLl1KstKdSjQhUuYqcrTr4yWN/2VvL9mJhLH7cp
 GqCEivWVAdQYAzM1GnF/XD3tQkS8hBCn+FplGQKJfb9+89U4Bgm/lB8acgBhTsFhu4rA
 DT0DHSdVynrCHiBfYPietXf5cMtpVwgtfOroyaSYtQ6CfNgavtl/KBmCO5YufJLz125s
 lK/w==
X-Gm-Message-State: AOAM530vloMqzlhA7ZSiQ87XOpZBeOprb8+YdaUj2SR1mK6m96i4q3jP
 h6RmSQvdbPOo1v7U3XmdMlIC9Cm9MNL+gA==
X-Google-Smtp-Source: ABdhPJxBOIi6sbLxkTb3AHSgWHbSp3pGlZU2LKUu7chs+qv2neDH9ADbw02MusRA0OoR5IbE5APA0Q==
X-Received: by 2002:a05:620a:4514:: with SMTP id
 t20mr8983370qkp.171.1639582351916; 
 Wed, 15 Dec 2021 07:32:31 -0800 (PST)
Received: from [10.65.4.0] ([146.115.16.202])
 by smtp.gmail.com with ESMTPSA id r20sm1234019qkp.21.2021.12.15.07.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 07:32:31 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v1 8/9] ARM: dts: Add Nuvoton NPCM845 device tree
To: Tom Rini <trini@konsulko.com>, =?UTF-8?B?55ub?= <stanley.chuys@gmail.com>
References: <20211215025800.26918-1-yschu@nuvoton.com>
 <20211215025800.26918-9-yschu@nuvoton.com>
 <20211215130723.GW2773246@bill-the-cat>
 <CAPwEoQPu5uC=PGKo2R687R2Ed-GmA_ktG+9uvr4=yU+Kpp4rEQ@mail.gmail.com>
 <20211215133506.GZ2773246@bill-the-cat>
Message-ID: <f2deb80c-6500-80de-658f-564f5ebda86f@gmail.com>
Date: Wed, 15 Dec 2021 10:32:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215133506.GZ2773246@bill-the-cat>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 17 Dec 2021 13:39:52 +1100
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
Cc: festevam@denx.de, tmaimon77@gmail.com, narmstrong@baylibre.com,
 lokeshvutla@ti.com, hannes.schmelzer@br-automation.com, lukma@denx.de,
 u-boot@lists.denx.de, sr@denx.de, michal.simek@xilinx.com,
 kettenis@openbsd.org, harm.berntsen@nedap.com, dsankouski@gmail.com,
 openbmc@lists.ozlabs.org, weijie.gao@mediatek.com,
 sebastian.reichel@collabora.com, ctcchien@nuvoton.com, pbrobinson@gmail.com,
 hs@denx.de, jagan@amarulasolutions.com, kwliu@nuvoton.com,
 Stanley Chu <yschu@nuvoton.com>, stephan@gerhold.net, andre.przywara@arm.com,
 tharvey@gateworks.com, vabhav.sharma@nxp.com, fangyuanseu@gmail.com,
 seanga2@gmail.com, patrick@blueri.se, avifishman70@gmail.com, sjg@chromium.org,
 samuel@sholland.org, christianshewitt@gmail.com,
 giulio.benetti@benettiengineering.com, bmeng.cn@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> OK.  The device trees at least need to be in linux-next.  That will
> cover a lot of baseline review that needs to happen before we take it
> in.
> 
Hi Tom!
If my understanding is correct device tree's should be accepted into 
Linux-next before U-Boot, or am I wrong.

Also Stanley, I don't think I apply to this patch set...
When getting maintainers I think you should pass `--nogit --norolestats`.
I may be wrong about this though as I'm new to contributions.

Thanks,
Jesse T
