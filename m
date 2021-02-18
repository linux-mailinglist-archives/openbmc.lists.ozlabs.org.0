Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4988531F0AD
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 21:05:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhQgB2bVMz30ML
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 07:05:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=0qdOVKvV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0qdOVKvV; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhQfy6Xrkz30Hq
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2021 07:05:12 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id r127so3385065ybr.1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 12:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9JXIKOLA1z/qQ3+zeu2zspRFQls52Ucd/8UKg1fUuYM=;
 b=0qdOVKvV1tppUDs7zJDmGFM+3ALRcpJ+NTPLLE4APKCX/lOZxFe6EoTpzJ6fbZ91On
 trrQTXgzTducILvJLpis2QBhNo4c+OTPQchYmS8tJ4rUoypstrS7iuQYIQkRLoLiQ4Va
 V0F9ckltg/pfvlLnkmb5BYybnSgVQSNn1isPNyUNS8zcLB3YudBfjaUpnIT9XAnZXimf
 YmWcZL6kHzTSTLDX7dTtpDMkVm/GOQsWZQPRbbe4VIxuEl6HSg8CA26n4KX9xqxAj1rm
 71Zm5uM4tCXqFv7Thwp2AhEDhfhAehg2DfoG2AXQSlWO1Qc6wrNtsogpz7x2yt80c4vH
 clQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JXIKOLA1z/qQ3+zeu2zspRFQls52Ucd/8UKg1fUuYM=;
 b=Ytdwdm7cH9kw72ZJ21JQfqKTa2F3GQ20S96STW0G5sdbkmDMLI+59YCFpRfdlf2pnp
 HP8bzyJScGqhDjT0CvtG+z12YtReWcibm/d1b+TbqfTL7u3EzgL0Nb7aDoq4n+bNlxtc
 yj5brB3UnPFK1Lz5yWB13fguz7ZPUOItcEBqgzbnrvCms3o9mvcZdmkcCR8lN4FSy1BL
 iDLLNrn1OfKDV84MoKuWAMB0G8JoYqrnc04+Xl3HYxMPeiGFSSnwqIUiz0FM0k9pd1QH
 P3qH6coYTRArYJzLyPjE7v9Tdjjwi2RjYFTuG1WvTqRqnHhhaMXkv+THBmFwqmVI7xdL
 +/Tw==
X-Gm-Message-State: AOAM530bIaa5HGOM0KlAuHAuQv51kCvqKMSCn8jrmN5nRLPxWJIaCqqi
 l81gBMySu7BAgpY5kYnBSrBZwvscnmwZIdwjv4qGBA==
X-Google-Smtp-Source: ABdhPJzPeMhBQ5cej4HfsPuzCBwC+awo9hFNACHKPr0wXSeBQaHB6Yw0OCUES0G1wPa1M97QufRPuDgxDU5JrAPDuaw=
X-Received: by 2002:a25:a541:: with SMTP id h59mr8922056ybi.203.1613678708540; 
 Thu, 18 Feb 2021 12:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 18 Feb 2021 12:04:57 -0800
Message-ID: <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
Subject: Re: any in-progress Redfish TelemetryService enhancements?
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, piotr.matuszczak@intel.com,
 =?UTF-8?Q?Adrian_Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 18, 2021 at 11:16 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> Has anyone thought about how to implement the Append behaviors for the
> ReportUpdates property in a MetricReportDefinition?
>

As an aside, if anyone else is interested in Telemetry Service,
there's a lot of code there that's not having a lot of community
feedback or testing on the reviews, so if anyone else is interested
please pull down the patches and provide constructive feedback.

https://gerrit.openbmc-project.xyz/q/topic:%2522telemetry%2522+(status:open+OR+status:merged)+status:open

> thx - brad
