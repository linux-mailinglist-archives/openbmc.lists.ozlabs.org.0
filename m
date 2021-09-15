Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B1F40C264
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 11:08:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8ZC26F3lz2yLJ
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 19:08:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=r6zcFl5T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=r6zcFl5T; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8ZBZ2lFfz2yHX
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 19:08:20 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so2656671otc.4
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 02:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=6pTLC9vfIuZvAxJOPO5vgEPMh9EWupSNKtF9jPIKRsA=;
 b=r6zcFl5TIJmFPLt5/93MOPGWia1GLZ1KejH2Pjt3A7L9RA4OlVU06AYXTNrpmN6xa2
 i2azCVdiH0d36p4pKgBcVkgK8CzNLzXz+Msqn80V1teQF8t2OYEyeUHScssdG/Q+1F2h
 7tpY0VmC4pRNVtg9vMPBV1EnpkShz67aHWF4V+8xjKgbrrcn6nxNqkmyWkPKt4P/zzoV
 Ji+dXdlkiPN6m1fJY53n0Eyq/XgB8FdvkkNtHcb/WrtIT6iFCM6Agn46ITdlb7fzmCJg
 JHU87zvcy0X8nkJFvGTJkn9ZhDvfnaKQCMLKzyILjYdtmr0oA9DYGfEGTcUohaIjfwhL
 pZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=6pTLC9vfIuZvAxJOPO5vgEPMh9EWupSNKtF9jPIKRsA=;
 b=nye8Iy78UZjwWkIsuPXJvO7ZE0CYeIgLDzeae3IjM30miK/QEfrEL5GKurYFuCtYmN
 nfQW5/209iRt4O3x4rOvbeFCVwKAjVvMds/H0TdNDMJuSVBnMcTb5Padx/kGnhsfiggA
 9tt2anuW84/WZ6gKN/MqwhsKDom4yodoPmD0YgaDA4fWkmRqSu+HwG+Ur0noZkVB36X4
 p8aw68s2+XSKSQh3ogI39fa2c1JNcq+BOzb1QZUUhfavhXNOD3jNC+80TPrlswMzfgnd
 j2uXOwIVaOvVyeBm8N0GpZOoNSZtsd7r5sh1MHf1oBn3nGnKh5riL+Dy9/vfYKHXxK8D
 fkCw==
X-Gm-Message-State: AOAM532CpUuogYxH04MOU2tIb1BKIC+ocKieKd2I4/KZ0wf5o+wdNjKG
 78pQao1RcZ5C3/uet6CWPNRqVzbV1IVcSmyM1fNRwt95Kz3PysNy
X-Google-Smtp-Source: ABdhPJxUUXfCsYrXf7Sady5z6vUPwJWAiFA2595neB6L1wc+yGL6YRFqcZC14mV4wnMSmLf+oxa9vUxAERc13jrDfds=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr17612174oth.307.1631696897664; 
 Wed, 15 Sep 2021 02:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UHdTyPh0hGiatA44whg2PdRzJFg0gBnVHA4moYRr=aT=g@mail.gmail.com>
In-Reply-To: <CAGm54UHdTyPh0hGiatA44whg2PdRzJFg0gBnVHA4moYRr=aT=g@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 15 Sep 2021 17:08:06 +0800
Message-ID: <CAGm54UE5gb+S0WWYGbbr0Nsif6tJ2j+-U1awrAeyJbrj=kf0oQ@mail.gmail.com>
Subject: Re: ipmi sel log revisited
To: openbmc <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 28, 2021 at 5:42 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> This email is to describe the current status and issues related ipmi
> sel log in OpenBMC, and propose a possible solution.
>
> # Background
> There are two backends of the ipmi sel log:
> * The logging entry on DBus
> * The ipmi_sel log stored in "/var/log/ipmi_sel"
>
> The configuration option `SEL_LOGGER_SEND_TO_LOGGING_SERVICE` in
> phosphor-sel-logger is used to control which way to use.
>
> ## The logging entry on DBus
> The logging entries on DBus in /xyz/openbmc_project/logging/entry/
> will be parsed and converted to IPMI sel logs.
> This includes two types of logs:
> * The logging entries with a CALLOUT path in the associations.
> * The logging entries with SEL metadata[1] in the "AdditionalData".
> For the both logging entries, the ipmid will parse the entry and
> convert it to a SEL entry.
>
> ## The ipmi_sel log stored in "/var/log/ipmi_sel"
> The log is sent to the journal log with specific MESSAGE_ID and properties.
> rsyslog filters such logs and save the "/var/log/ipmi_sel" [2]
>
> ## Comparison
> Both methods have pros and cons:
>
> | Method        | Pros                              | Cons
>                  |
> | ------        | ----                              | ----
>                  |
> | Logging entry | Use DBus data model               | Complicate and
> slow to parse      |
> |               | Support both ipmi sel and redfish |
>                  |
> |               |                                   |
>                  |
> | ipmi_sel      | Easy and quick to parse           | Data is
> separated from DBus       |
> |               |                                   | ipmi sel and
> redfish is separated |
>
> # The proposed solution
> The openbmc usually uses the DBus as the data model and all the
> services consume data from DBus, and the upstream phosphor-host-ipmid
> already supports the logging entries, the proposal is to re-use the
> logging entry on DBus as the data source, and improve the cons: to
> make it faster to parse in ipmid.
>
> The idea is:
> 1. On BMC startup, let ipmid parse all the logging entries in the
> background and generate the SEL entries in RAM;
> 2. Use a match to get a callback on logging entries' add/delete
> events, and update the SEL entries in RAM when a logging entry is
> added or deleted;
> 3. Use the SEL entries in RAM directly when `ipmi sel list|elist` is called.
>
> This way improves `ipmitool sel list` speed and possibly resolve the
> issue of the current logging entry model.

The above idea is now implemented by the below series of patches.
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/46893


-- 
BRs,
Lei YU
