Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F265308EF
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:42:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65nd5Vl9z3bv8
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:42:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ACB4pecv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ACB4pecv; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L65mZ4HcHz3bpX
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 15:41:34 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id v65so16598943oig.10
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 22:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AeMKsWqc2qJ2cNsR3z2GTSNOPP/jHfKwRutK423xSH4=;
 b=ACB4pecv66vkso1qf3/itVIXPjN5zHehJvbwHuG0pDJArYfwhAsrIhYp+2wubk9hpg
 K9c20Vm3VSDuSqsqPNsqEuNkfbgjGTfC5zO2v8+xdSYqOubTY8kFXp33VT6mOkRz3/j2
 AXeqQ+WXOwB5zWTmhyzFD1eZfPivXBQNnKM5OUwkisb+DyIIdRJl4pp4adJfPfbNr/fP
 ENYf4uQ/pB3BMkojawOnmo2HxXlTivK5N+zLE2+KtaMw/Um0Bu7MRB8Edhj9WDvr4xDr
 2XXBXV23iI5yO46SryVXZEx5LZvd9yGlGDF7ZBkQrfqWReaAPEM45c7LXxAg/Jwuc0/C
 ronw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AeMKsWqc2qJ2cNsR3z2GTSNOPP/jHfKwRutK423xSH4=;
 b=cMLNdTU+8y2U0DoAeu53jO4UUs3K+Vp7bpbbPNaow7fttXgiZfC21igHRl+ml8sjYw
 Lm3Cbu6tZHNdhcAjyEALibDCdUJTbvXGI4iXiakHx73V8cuHSMJK06EB7ImPqNOynPvx
 pEUx8q9MSyme2+Xtx6mMIX6XZgm2z7EErdh9mhegI+kkFihczApDhuKI3ZHIRWbX4LU2
 RDKi7eV6s9pTFzrU5laH98N9/VSrgvuyyVCWIlQv029Y8FktDjkpqohNVk6ZiMTzSK+U
 e1KmTSgul4rBSGgutWVHomPqdXNAUf17SlXOPfX2u4x1UgYPpHJXdSy/4F0wWAz0TezL
 kjxQ==
X-Gm-Message-State: AOAM533UYQFaJHa058eglm0761+Fxtjx+dtT8rjoWrTKTgm4rjonxXzz
 skRdjbeNjgi5slaBi2nfb9x6hjdoyOcmwpAJjAddDQ==
X-Google-Smtp-Source: ABdhPJwh6CnCwncH/rI2HbkoVYDE8XCrRLubzNSKKM+YxyEnqTDpOqfl28fV4nPJ+ICXvbyBqWIB5VUBf8Z5YkuRbYg=
X-Received: by 2002:aca:ac93:0:b0:32a:e3b6:7c52 with SMTP id
 v141-20020acaac93000000b0032ae3b67c52mr10591097oie.294.1653284491117; Sun, 22
 May 2022 22:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com>
 <YogEf3WTYNBnBvP1@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YogEf3WTYNBnBvP1@heinlein.stwcx.org.github.beta.tailscale.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 23 May 2022 13:41:20 +0800
Message-ID: <CAGm54UFTeTkr2KpdbX=3xBX6-djXpr-JrLZ+VmazM_n=Cs9=Pw@mail.gmail.com>
Subject: Re: [External] Re: The incomplete result of mapper GetSubTree/Paths
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, May 21, 2022 at 5:13 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Fri, May 20, 2022 at 11:14:15AM +0800, Lei Yu wrote:
>
> > If mapper could not guarantee the stable result, the service calling
> > mapper will have to add more complex logic to make sure it gets the
> > "full and correct" result.
>
> The issue here is around causality.  There really isn't any way to
> correctly kick this logic out to applications no matter how complex you
> make the implementation.
>
> The original mapper implementation was causally ordered but this was
> lost in the conversion to C/C++.  We should look at getting back to
> having mapper give causal order guarantees.

A patch is sent to gerrit that is an attempt to make GetSubTreePaths
throw when it's doing introspect and return the "complete" result.
https://gerrit.openbmc.org/c/openbmc/phosphor-objmgr/+/53904
