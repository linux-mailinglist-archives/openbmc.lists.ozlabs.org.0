Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 359A31704E7
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 17:55:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SMNd1w5jzDqkL
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:54:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hruu5vds; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SMMv2KKRzDqhC
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 03:54:17 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id x185so64679pfc.5
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 08:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mdmTd3QyG3VKOznhIaxKyan12uhrifQTvqNVXQRRMxY=;
 b=hruu5vdsnCECIuQBHk625P8b04s08DF61T641NvTW4RoDsRy/MhTaekacnaOr/rrqS
 QqHtcQJu5ujKyjJyrZrYMJNOWEG2yfC2xxU5XCnIsMRVKOJVgc00046eYqY1HC9AvtP6
 pfJJX4zlhmAGav+ckY3YH3fkEHQ86+kwZlkLq84FwiKSgmI/7qaB/eUGPTVsRPhnBTJ8
 OxStR58qgY/hVYzu/Ctvj9+Ttie7snxVJac3puXc0oyyI6Egh/oidB8ugqC09MKgWHtz
 60vMReDmMO5ocxz5PmMVM8tDZPa5sRONtw9Jv3khujUP3QMp9mRZkQXppZKt/RgSE9KS
 NM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdmTd3QyG3VKOznhIaxKyan12uhrifQTvqNVXQRRMxY=;
 b=MQJW6WCk6m7bvVKBGBNAfoY0soEVlVwzMnj0ocZpcEbw2wAyo4qfIMlBlwvH7irdlK
 SYVwL1GYouw9ByK7ZzIEqpqXzKLVvf3S0kSgjT4JpFoiKG9mjXMVltnFgql8oTMZJFCP
 p6YSc5GgVsDwSyxSk0ARQhyhSfBKJfGU3gVqhz/XoDmxSWyKO5aXOgFwl24NRhent5TA
 zeiLi6XFyF0C/wRpedHFOTiUkRNyYgmgXResbM9xYjT5HLuT3XLPm9H3acO0dTJqko/v
 +NGA5utYMM98UR0rUL35D27b+sLNoOL+a7/v1EWAVJvv2JwCcKnJuZAF0j+tSvTzp3tw
 F9oA==
X-Gm-Message-State: APjAAAXbjk1ICMkpZJg9jn3pikTFNbJAtt/8U/zO6zCXUiB9Q8wFZkSo
 V5lXZjIQuqsMWqUmz66bH6YZ1BSsSzn2yXpHO9Wrzw==
X-Google-Smtp-Source: APXvYqxHECFoPlNE7kbhDqKFm2x5cS4bo2O3YEFhW7EljxXf4q9g9yJmTVRxb+5mUCxLT5da5uHvnR9m+B+VkfENRRA=
X-Received: by 2002:a63:3f4f:: with SMTP id m76mr4570573pga.353.1582736053947; 
 Wed, 26 Feb 2020 08:54:13 -0800 (PST)
MIME-Version: 1.0
References: <EDBB9002-FDA0-4951-9671-5C01D9C34EE6@fuzziesquirrel.com>
In-Reply-To: <EDBB9002-FDA0-4951-9671-5C01D9C34EE6@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 26 Feb 2020 08:54:02 -0800
Message-ID: <CAO=notwc=8sg-JcXqQ-rpaB-r_pupb=rEhkKFMWnYyPtDp=FjQ@mail.gmail.com>
Subject: Re: command line interface conventions and best practices
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 26, 2020 at 7:57 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Does anyone have a favorite reference that outlines de-facto command line
> interface conventions and best practices?  Things like e.g. long options
> should have two dashes, options should not have capital letters, etc?

There has been a push to using cli11 instead of each repo wrapping
getopts, but it's not required.

https://github.com/openbmc/docs/blob/master/anti-patterns.md#custom-argumentparser-object

>
> thanks!
>
> -brad
