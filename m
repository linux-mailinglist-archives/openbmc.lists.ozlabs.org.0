Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DD31EB3CD
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 05:33:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bd0x0dpyzDqS7
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 13:33:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=k2YzvMIT; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bd093gfPzDqGX
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 13:32:39 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id x27so5245766lfg.9
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2020 20:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wWG6YewEX65fODutcZZjtKclLfSp4ex9TlHkGqc1SVk=;
 b=k2YzvMIT10E1czED94V1qB/1L3C1HYJDhyj8OvR5HWsuRMsUTwoU5EC9HPL0rTGGOH
 05LIkhliTTRxtoVKnLIPAE0NGhH/Qmsg5FNPaSMEvw44iocefW+/pjBLyiENgOv2IYpb
 U8YC/jzPwLceGXb+4ULLb6zAJwWUyt8tJN4Dtxqc7VRffQP7PBJvHkM8eDt/ZaCT7Oq1
 13o/mRtCeKJKlSklhF4fVUI801zxvJI9BLBwT/V/YLevKFkWWLq3nv8IZuFgCzJLv2W5
 lf2YWydjNgcacKZzoxmvi1llwT8n2XgEwolMeARLpzkrIPRxTYnp9mKaN3oDl7SSAXHc
 iZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wWG6YewEX65fODutcZZjtKclLfSp4ex9TlHkGqc1SVk=;
 b=HRGf8gmbC8u+9l7MHTNRW2ru8znBiQtLjr0+2qKipnHAB1oN5xAewcioAkIEHHTW4S
 IBOUgMFG4wfvpD6/FRe+N/w18cd4+TpLJk6g6iU6ml08Eb1HQ1ym5MDHcJct80U4ZFFq
 hPdWdUJUGGVCXgfqV7iDMuTckfjnDBHnEZXAL8pxgbaOnoV2e8bekQvz89uEbLYtU2qA
 dPDa0O/WhkjkYNVv3omSNwjhh/edBy6kVbNDnM0X5CZCgRhXHrCp9sHUb2ouZf1p5KwD
 cjQhJ7hVPz1drpz0m/8c67Cxt6UUzo1ECDThbCbaeJz8uphGHqkbPiEpQqaHwkab6DUQ
 FAFA==
X-Gm-Message-State: AOAM532ROCXt5S5tjpOU2i1u05GiCSXLwXN5GTaxtA9wO+IhjxI5tgPC
 Z3fUIWVZFBSwpWNH9NR2+d2Na6CqQmrMeLC0Fsuvqw==
X-Google-Smtp-Source: ABdhPJwhnfdd3Ya4GwYzRqHSTq9PwYW96fmK0bYkCGrkCaNzvOrqO4H6v/JzYwp3/9q+ysyeDezAOMonOcQj9Y2B7wc=
X-Received: by 2002:a05:6512:d1:: with SMTP id
 c17mr5214092lfp.80.1591068754217; 
 Mon, 01 Jun 2020 20:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
In-Reply-To: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Tue, 2 Jun 2020 11:32:23 +0800
Message-ID: <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
Subject: Re: OpenBMC Logging and Error Handling Dos and Don'ts
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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

> ---
> ## Don't require `-o verbose` for systemd journal MESSAGE field context
> The MESSAGE field of a systemd journal entry should be self describing and not
> rely on additional structured log data.  For example when the MESSAGE field
> references a filesystem path, the path should appear in the MESSAGE field.
> When the MESSAGE field references a failed system call, the system call and the
> return value should appear in the MESSAGE field.  This keeps the journal
> informative and useful for casual journal users.  Note that it is perfectly
> acceptible to add (duplicate) structured log entry values for the data that
> appears in MESSAGE.  This guideline only prescribes that the data _not_ be
> omitted from the MESSAGE field value.
>

I have a bit concern about this. The existing phosphor-logging API
does not support this well.
Specifically, it does not support the "printf" way to generate a
string with the variables to log.
So previously we typically put the variables in entries.
I do agree that logging the variables in the MESSAGE field is much better.
But to encourage such logging, the logging API should be enhanced to
support the "printf" way.
E.g.
    log<level::INFO>("Something is wrong: %s:%d", xx, xxx);
is much better than:
    std::string to_log = xxx; // generate the message manually
    log<level::INFO>(to_log);

Otherwise, it's really not convenient to write such logging code.
