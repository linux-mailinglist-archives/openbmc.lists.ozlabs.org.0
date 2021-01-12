Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BDC2F363C
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 17:56:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFcDQ290BzDrQM
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 03:56:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PeOj3UcL; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFcCV0xc8zDr5R
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 03:55:47 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id r7so3237459wrc.5
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 08:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mMCtsPhoDLySuO0wwPKqEwkavGQxn2c1mkDRwh4kK2c=;
 b=PeOj3UcLKzx8L0A+mFz1fURMUg0GkU5OEqD2qMQWRmns++I51KHpv/x+e4r4TT/9TR
 /ImD7+rc7wQQF18bl9zgbylIWM40wkaoraZZs2snCbSeQlENzzG1/ad7v41xz6eLe8wu
 MLUbiXfxhErwEHIMN1IfI61rqVok8q6xlsTadRwuFs180W++JwaBUbup0d4SiOxws0Hx
 zmJ8p2kIAR7RjwSSOqlE58+aiObHcN+ZXgXtEMCMR1w9nNDhPnMou9DVJfnndhDQZpNf
 yDTyHeG3jtketQCUg2cptURa0BQtfagOTZ8Yo6c4tJdYD1AcPWBMT5yvxefEXPg35a2c
 6HXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mMCtsPhoDLySuO0wwPKqEwkavGQxn2c1mkDRwh4kK2c=;
 b=uO6irK5jzdESjxqK2PHNmdMhxd9rkEVD4KO+oADDKjofGsr6cK/xca61MoCcwdazA5
 1NJxByvmNXe1PaH93WnYI/GkrXgEsk9Sgm1oSmQgU4COY03ddzVaTFV2fV+GmKx5u+J2
 01/6XWFL4bvkWnhVYaBHTTIPwVKKBKiDOJZqh4isRrtHpydthxFdNsxizmKxmTiLI6X8
 dPIkYO36EJOqFlk+QH7IOUg+RSa8rFzfeF8jaF7oWXxSVSk+OQm5wPPzdBiFy3TVhzQt
 6rNo8QUe/VNisqCiloq1pdGW7usTFORE+IUAOYjKq/5FrYkMLcYTK263ZMKzxriGHfJS
 XbNw==
X-Gm-Message-State: AOAM532Ncx3hb//Q1q7WEfr7d1rGzBt2JWOOdrq2fBmfmSHIFGdjKIYi
 R8LyEs5zbRNjznR3zkieyi/sxvSElLL331RyHNBf1Q==
X-Google-Smtp-Source: ABdhPJxugmYJWzPJUKjW5XUJuQNBfSVhUTsFjWdzcRH41X+/YFnfs6aCmIHBV3YYAV/O22Fyg8YySelNQMTSIMvCYFg=
X-Received: by 2002:a5d:660b:: with SMTP id n11mr5312330wru.407.1610470543053; 
 Tue, 12 Jan 2021 08:55:43 -0800 (PST)
MIME-Version: 1.0
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 12 Jan 2021 08:55:32 -0800
Message-ID: <CAH2-KxC7=rNHJo2g=bO3nma9ViQ+hJsGEcRLtsJWs0QKUnqkVw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 11, 2021 at 2:10 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
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

I'll volunteer.


>
> -brad, on the behalf of the OpenBMC TSC
