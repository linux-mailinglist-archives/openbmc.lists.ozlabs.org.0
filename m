Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E45752F4400
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 06:39:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFx8v2hdYzDqlD
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 16:39:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=s/3TCRJp; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFx833YlXzDqXG
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 16:38:57 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id s75so967701oih.1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 21:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vdfC9HpGth5RR3F+FWIzS2SLcS9ctaQkpItZW0wHbYA=;
 b=s/3TCRJpiAY02COykX5jlyjPvQsadbEhXDgiy0qRqp1H+gwpFl8O7LmTAd462gHECW
 LdeJb+W+PwWAKJqPoSCKWklVNSPNnDQB9i2oieM40gD8zKKCjW2dn6qiYx1ES5Goq2Uh
 VTTkIST/B+Z79albXizisLO99a83xjnkiFrz4P6bfGM6M/hrOFruwTWrh9YjK1peeNrG
 hUUKX/n/4NZ3Mo4Jhnd+E0LSYYzazzbGP0vDkMUJ7lY60I8Pw5C1lCz1vzBM6yuw8Fh0
 0dWp8NJo/4mihKXRonVv7zTa5iAjgzz0DoyA0YsSSvNvTwJrNvh1frxxnp8ynlRolpDC
 /tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vdfC9HpGth5RR3F+FWIzS2SLcS9ctaQkpItZW0wHbYA=;
 b=bfUO79jUPL7DsOP8+L2MN5Bbh1DWZnoSXE+N0+Ms/eDdCfn6WFE+nU1fO11VtNK3s6
 Uf+Ob/eOx7GzhmpyYZwJp27Njg/DiCIt+MV+walgmbhF/IaUvEY+3i9r3adImqrK1qz0
 BZL1x48wtDsmjkQkJG3b9OI22mvnc9utSqvt8MVgit96aFxJcehXLCwsjhyvKohu16pX
 c0hsvGz6qvvZd4UEgjG3xq9jkQ+DOlr7JfIIbY36G0x46g+KKpREp5fc/sZmEYQfTySN
 r0CEoZ7PnGUaFyA4skP7nmxi6hmFZ0PHhdHvYoBT4NV0x8VXE5rXLDCjmUxH5BUfVGLp
 U+jA==
X-Gm-Message-State: AOAM5309saxExVg7qBvcoc9Xr8NO2X/hh+RaLvveyj9P72nPny6b18Sb
 Ry+b3QtgpzffsaCcBZ8IidD1eXip21RrS+NqkdEQethSrhn4iAvE
X-Google-Smtp-Source: ABdhPJwhDkH5bU54mf9x6Edia+zHaJKFBE5g5RnHXtoMAghlBBZAp3fk3CNUtl4Bu+/5SnAqxIJUM7dfpJ24w3giPG4=
X-Received: by 2002:aca:44d:: with SMTP id 74mr336106oie.4.1610516333511; Tue,
 12 Jan 2021 21:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 13 Jan 2021 13:38:42 +0800
Message-ID: <CAGm54UE6WMuZcDCWbGFDzVMwBCpjhtB0TsTVq0bVAah9h_KHVA@mail.gmail.com>
Subject: Re: Call for volunteers
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

I would like to volunteer, though I am in a different time zone and
may miss some of the meetings.

On Tue, Jan 12, 2021 at 6:10 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Hello OpenBMC-ers!
>
> Your TSC has been aware of the problem of fragmentation in our project for some
> time.  Fragmentation is a loose term - for the purposes of this note consider
> it to be any time contributor efforts in the community are duplicated without
> thought given to maintenance and/or compatibility.
>
> To begin to address this issue the TSC is looking for volunteers to serve on a
> "repository review forum" to which the TSC will initially delegate its
> authority in the areas of:
> - new repository creation
> - placement of contributed new function into existing repositories
>
> The TSC fully expects the scope of this forum to quickly grow into the role of
> a traditional TSC providing frequent, technical oversight to project
> contributors.  The current TSC will continue to serve the project in terms of
> governance, advocacy and industry exposure - and likely get a rename (OpenBMC
> Board? or OpenBMC Steering Committee?) in the process.
>
> The new forum would meet periodically or at the demand of other forum members
> to:
> - raise the forums combined awareness of new function under development
>    (information exchange)
> - build a consensus within the forum on where the function should exist
> - inform the function contributor and the rest of the community of the decision
>
> A successful forum would be a forum that can simultaneously encourage the
> contribution of new and innovative solutions to existing problems without
> introducing complexity to the project as a whole.
>
> A successful forum member will have previously demonstrated a breadth of
> understanding of the upstream OpenBMC codebase through:
> - frequent participation in peer review, the mailing list, IRC, and Discord.
> - submission of high quality designs and code to upstream OpenBMC
>    (github.com/openbmc)
> - a history of working with and guiding less experienced OpenBMC developers
>    in a timely manner, enabling them to come up to speed quickly.
>
> If you are interested in serving the project in this manner, please reply to
> submit yourself as a candidate.
>
> -brad, on the behalf of the OpenBMC TSC



-- 
BRs,
Lei YU
