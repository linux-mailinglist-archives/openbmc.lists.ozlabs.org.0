Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6230F7EE
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 17:32:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWkbl3DgSzDwrp
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 03:32:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dVUQLJdA; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWkZq05NlzDqSL
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2021 03:31:29 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id w8so4329713oie.2
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 08:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9oGsxlPkHLteOf4gkoS+YLOuoTWDjlwkL3iYxN7plaA=;
 b=dVUQLJdABq9bRRzHZw1Hr06yYgY9I5WXq59ud0nq0Ys/N1v0kBfwh4tN/ZqNCA1UY0
 XWfsxKOlXxmRiALmBnAmdSc8YzoWP8YrAMVkZqW6Ny56Gbxv11LM3KH0kuI2HqKQkyPr
 8ZvVpmoxz9qUkfYvATdI34LrUO3uq5qKSkfAo8CP8yZsq9dMY5D6vYH/UfGy/duLw5rI
 HNJ5i0bOIoFmavihgjQvWV1DP9GEpgblYDhGKynbcbMVBxveKruQ/2oo5DaRevxzNk9k
 fBW3xIj7u9oGC/UiLrQDQUp8RQwTuqSd/cosiCzn70pFXuNLkkdQdyd3vLBYQ6pdC00V
 PLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9oGsxlPkHLteOf4gkoS+YLOuoTWDjlwkL3iYxN7plaA=;
 b=ZrYZ/weq1iVN+vV3gogd2Waj6WmRP6thXCAw7IwJxtxn/V6iFt4jNHEG7eIp6Tu1JO
 D1HzqsTYmWsIdo/Q433a2pj54Gw07yxCJYWP55rtwURNlPY1dSP88JD+RVjJbEXqSveM
 e2ADyC6bUQMugXbXARb5A9ucYUsQAY0y/Y1zYOmX3IBimEDS5zlI9GLI4fYH25OO44Ge
 V8a2Ml+CAT6eh+YvlKcLZ3aRz/RKrchgCggFTGj3JuN1YryMWgw56ctvIwanM8HEPbja
 GSr1L07g5+OgCwnZmpVGSzDFbRY4CUfTgxCnR1cmxOVSDgZVdtTFxI7RdIUsif/0/jAs
 b+Fw==
X-Gm-Message-State: AOAM533MVCvrbZG87ddwebHKVcwPkRxOe6U2/mVe4KWR9tvUNnRLT20W
 yigpaNtYSklD74LdthgB9BFIw47Gt8nVLg==
X-Google-Smtp-Source: ABdhPJxv7U/6FB+NsXYyKmisYPhCx92LNKLKHWpjAi3rSDLpU9AfjdGWUq6J0QvW0xYsalzpIiwjEw==
X-Received: by 2002:aca:6089:: with SMTP id u131mr169223oib.150.1612456284267; 
 Thu, 04 Feb 2021 08:31:24 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 94sm1225721otf.41.2021.02.04.08.31.22
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:31:23 -0800 (PST)
Subject: Re: Action: OpenBMC 2.9 release candidate 1
From: krtaylor <kurt.r.taylor@gmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <8a5f94b9-b11d-e0b3-e459-b7c15b68cbbd@gmail.com>
Message-ID: <c584dc1b-3535-e2b8-e78e-56825076fa3a@gmail.com>
Date: Thu, 4 Feb 2021 10:31:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <8a5f94b9-b11d-e0b3-e459-b7c15b68cbbd@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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


On 12/15/20 10:53 AM, krtaylor wrote:
> Hopefully everyone has seen - we've tagged a release candidate, 
> 2.9.0-rc1. We need to wrap up the release before the end of the year.
> 
> ToDo's:
> 
> 1) Start testing the release candidate as soon as possible - post 
> results (email or discord), please openly discuss any problems that you 
> find on your system.  https://jenkins.openbmc.org/job/release-tag/9/
> 
> 2) Clean up documentation, bring old docs current, add documentation for 
> new functionality.
> 
> 3) Input needed for release notes - Either edit the wiki directly or 
> email me if that is easier for you. 
> https://github.com/openbmc/openbmc/wiki/Current-Release-Content

We released in January, so, I'd like to get the release notes wrapped up 
ASAP, please finalize any comments/additions for 2.9:

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/39977

Thanks everyone!
Kurt Taylor (krtaylor)

> 
> Master will not be frozen, new functionality can continue to make progress.
> 
> Kurt Taylor (krtaylor)

