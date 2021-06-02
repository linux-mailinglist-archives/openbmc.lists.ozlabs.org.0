Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D47FB397F21
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 04:34:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvtPz0wPDz3bwB
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 12:33:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=mYnxfVih;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=mYnxfVih; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvtP52R8cz307N
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 12:33:11 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id n133so1691729ybf.6
 for <openbmc@lists.ozlabs.org>; Tue, 01 Jun 2021 19:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e/ea8PfUGc8VWWqGDjxCXj5t+XYq6LxMOCUcmou0zB8=;
 b=mYnxfVihDAxwro/nQu7V1VnxS/hezfg1n0AR2dJE5L+VWeLN85RL8lmcNiu04LQZnC
 3VFB6PNQghlOfq70bpG9BR1HZ9LaMrbdNE4A0/uWvRzXnfi5exQBNrvLMQzZf988kSsr
 Nb/y4c/F3szFIuH3x0t2wM7hg0PVX9WkmQUpo+cddPPKmTc7MewyYdASALmb0zzxl0N5
 tiZjBWjWLiH4Ct0Hv0Jm5fh7qOGZTvYUzxLF2RIFGFOoCZIuF3+Mp9+QQ5zXxgkqN9qJ
 l40eFYI7PC7UmJp1GBTSsH1BPFJryW27015Dsexv+6jjapbtHYIv+5is9fsI/TlAArG9
 +t8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e/ea8PfUGc8VWWqGDjxCXj5t+XYq6LxMOCUcmou0zB8=;
 b=KYcb0QmQ2wT7yXVwEwrgCGnIIm8tkLja5JRiRFeNJHiC3z2YtsJMfOG3sRDx+wCGHr
 Ba9bccBQl3P+StpL4/PtlZVhjkTXKeSNnM5b+ihCnUXUML9blRsaqIFfLY/M3MqcjhMG
 TjeXgEbGUuJO7wOH9BHQp6BJh1dfO7zdx+C9HPxxSDbqewPGgQ9p3WZdLngcHmQ20Ozf
 Omx53+bG49gA6QyFk2jhct2O8ty6+nCeE7YRdlhiv1rg0oKKjkzNLsx9NjpOlg1+WSgD
 sR/YUKm6davKCqpYBFASBUPNpsxLDvZiPVFgxOMhU8nYmMaBEfrEJP+LcGt0NEm56cw5
 DfQw==
X-Gm-Message-State: AOAM531mLCBS6gJLrUbh6oc878yRtTooya0DCPtXjlCMYmsBNDCs2/ii
 brVtEZfDDARce56LZyWb1CWlecvkxTu/Fj5cfdWWGwg9+XGOfV15
X-Google-Smtp-Source: ABdhPJwKJ/xSj07k8KltnamsSQ+fo8uFXMNqG04xo5hKDd4uhRUdR1cuMmWCN8wDSH99IxOoLn9A1u22rVOXLShKLy0=
X-Received: by 2002:a05:6902:1005:: with SMTP id
 w5mr42550302ybt.233.1622601186783; 
 Tue, 01 Jun 2021 19:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB30931F4EAC5DC1D4E968631EE1229@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <85157600-4832-42bd-8f4d-87757153b732@linux.intel.com>
In-Reply-To: <85157600-4832-42bd-8f4d-87757153b732@linux.intel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 2 Jun 2021 10:32:55 +0800
Message-ID: <CAGm54UFm59ApCAV7DKdgfUGfjdok8dVs8ng6Brj0VXxMsrj=AQ@mail.gmail.com>
Subject: Re: SEL Event logs in Redfish
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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

On Wed, Jun 2, 2021 at 3:05 AM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 5/28/2021 1:58 AM, Jayashree D wrote:
> > Classification: Public
> >
> > Hi Jason,
> >
> > In journalctl log, I found that the sensor value is crossed the threshold value.
> > But when I tried in Redfish API, I am not able to see any logs, whether anything I am missing here ?
> > Could you please provide suggestions on this .
> Unfortunately, we ran into trouble trying to persist the journal to
> flash, so we have one additional layer where rsyslog watches for any
> journal entries that have a "REDFISH_MESSAGE_ID" metadata and logs them
> to '/var/log/redfish' where bmcweb pulls them for the Redfish EventLog.
>
> https://github.com/openbmc/openbmc/blob/master/meta-intel-openbmc/meta-common/recipes-extended/rsyslog/rsyslog/rsyslog.conf#L66
>
> If you have the journal event, I'd check if you have 'var/log/redfish'
> populated with that event.  If not, you may need to add the above config
> to rsyslog to create it and that will hopefully fix the event in Redfish.

There is a limitation about the way to log SEL event to
/var/log/redfish, that it only appears in redfish event logs, but not
in ipmi sel.

On g220a it still uses the logging service to represent the event log
(see [1]), and ipmid is updated to consume the logging entries to get
the SEL entries.
The missing part is in bmcweb that it does not support the event log
entries from DBus. We could probably add some new code to make it
support consuming data from logging service, and it could be
implemented under a config, so that the user could config which data
source to get event log at compile time.

[1]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/SEL.metadata.yaml

-- 
BRs,
Lei YU
