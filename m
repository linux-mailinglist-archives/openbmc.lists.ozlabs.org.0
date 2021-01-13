Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E42F43DD
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 06:32:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFx050CTmzDqv8
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 16:32:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e30;
 helo=mail-vs1-xe30.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qBKfIcf4; dkim-atps=neutral
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFwys5sNfzDqgs
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 16:30:58 +1100 (AEDT)
Received: by mail-vs1-xe30.google.com with SMTP id x4so487271vsp.7
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 21:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dBrFbhKwdkDwNgjcFgGEkdLwWYeKkntekZMEd9omHfQ=;
 b=qBKfIcf4+mZGItbVFeQBGZeyGJL5MjEPnh8/7nsFAUVY0U9wZCx8BpGZa2Dm9gdkzP
 q1htZcZW2Pkn+ZEs6YWbLbe4XXkDb2crFeW2L4LQEycs7OwtYwioH1Ro1xtSFxAE7mrd
 MuOYBiozccxBJZf9yRFH4aa1+hRqJrYq3D4LUYek9gJQQmfIJ4pQ97iF9Y+L0rLQAMSe
 nFDeFgeFh6xyvIgLpi+pmTIbUTReWiiLN2Vc4smrUgbTx/aL3hkOtMlsJSiAHWHR4J/W
 yhzOkAULYCZLz/dnSKWlhbTm4TnQKUz4tg62rs6Bkm/mzAq02Zsz59CxKPLOtusiKBXn
 oD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dBrFbhKwdkDwNgjcFgGEkdLwWYeKkntekZMEd9omHfQ=;
 b=hsJ1FmZjfI7zM16BwBx0eAwDLArB4EIWZ5BRZ+BWb+zWy93ZqkbMC/TMIJt+6f409N
 vObUYsrrSddZEvSGoZqYGnVRDNDAHNTzp5yDD6IUdfC9mFsjtBjNYoYQAeW4RNbrv2Rx
 +l5R/OmcEiybtt47P1yP84nyJTjHG4POQu9XhYHUpw0mKv204zUsytd9UDvAztUWEdkp
 kxwi01bN5PtxzuJC1RPbR1V2DMCzX0Jqo36ZOl/lEG8CIBt02/vkX6rwXJSoL+rkGQAY
 NGrsCLHfjJQuK/IriioTgVc9l9S6ZRM+9JI/Og3y9AwQkYQ6o7JvV3TGZYuJxeaQv2J5
 tM6g==
X-Gm-Message-State: AOAM531GY9AtsJ/CHNrFVShZe4tCtkPGRqltYiTZYqJmjq0CsdqxLcNM
 DjSRa6xG4VfEhgqGKgVecUx4xy+t1g2WEwwlDws=
X-Google-Smtp-Source: ABdhPJzgC6ibGe5BW0+VrlpkjclrfQRw4UGEvT0tUTZEKbQSni2kdSmLxEutfK9tCZvPzox30rMiPoFf9Pi+JOn4pGU=
X-Received: by 2002:a67:87cd:: with SMTP id j196mr507643vsd.43.1610515854632; 
 Tue, 12 Jan 2021 21:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Wed, 13 Jan 2021 11:00:43 +0530
Message-ID: <CAM=TmwWvTFe2WB8f+yHJsa9jrEznnB-KtcfFnBadRAriLWhJig@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I would like to volunteer.

Thanks,
Deepak

On Tue, Jan 12, 2021 at 3:39 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
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
