Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806940A2A4
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 03:39:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7mGf2kQnz2ynQ
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 11:39:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=skcnTPIX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=skcnTPIX; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7mGD05s0z2yL9
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 11:38:42 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id w144so16693341oie.13
 for <openbmc@lists.ozlabs.org>; Mon, 13 Sep 2021 18:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cUarz+Fr7KpRDXLRIYBdZCEHDyjn6ONLGW1N4OxI8CA=;
 b=skcnTPIXr/hT2RVsyDMI8eIkvqEREksmeYib5wFLXf7rmweQYku2QjkrypAUEzFZHQ
 BHmVrDX+T92qIhmvn+kkRqv/dB4DDCD6r4RD1GgV4YNzkcs2SdAG4KG5NHGzV33IzXkf
 HD14gXKvl+Xkx/IyuDvRyNL5aHY6HPsPUcOZUUWK8e/bcQrVBO+0cENZhLbaUvjByXc8
 4BMyXK4mrMbail2B1eGyRVg83mBg3XQxaOZV/QXTtBMW7J8WxXq/9Vx4mSmjfOeCn2PL
 6kkHJI5IHRZorC8FlZ7ulYFDICiYn/2ngio4GNitp6x99X6TuDIikLnJ2DtIkXDW2UVQ
 YbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cUarz+Fr7KpRDXLRIYBdZCEHDyjn6ONLGW1N4OxI8CA=;
 b=q9RxeS6nYZz7Z9sXdJbH81l56qUek0jX8AIX94K6Q/fzpuJ8IywpSA1+9+dEEfJHeJ
 ZBh5WPOmKKn+hQszjNTZAtQO69FXWZrDyNL3T56E0kIq9IeYIDn9GTlZA7w/C0SuORnT
 O+LyfDc8hi8tU8KRBvspO69h/M6p+FF5EnVQ6Qi7ABJZzLtjbUKGkp8dSKX2ebMjikXD
 1RBwsw5t2rDzKGFJVBpiHyjSmwXs+bsKU8tdhDnBNmSPCBbegc8Xo1toZQ+x0hl3t44i
 VJY98xBVp896e1tT0L2xD980bLLrIam9OpDpkRuREqkvI460OOodBX875kQuSP5vweRW
 iK4g==
X-Gm-Message-State: AOAM531dX3f3X/Vmo7QPz5NXGSY074GMyNfzSgozNBNY1ua4jDvKlvEf
 eAVUytSOM4TpXExvFaXBv/eGitTPAodfc6C5z/6eBg==
X-Google-Smtp-Source: ABdhPJzgIixrZjMtKboQ7QYzDrK5Q014LFcQL4wIiqyrizdCSR5GNUuTZa4nPkXJ9+w4IQg1eqvfyNmXvXloeV5loig=
X-Received: by 2002:a05:6808:1294:: with SMTP id
 a20mr9892268oiw.4.1631583515368; 
 Mon, 13 Sep 2021 18:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UG1guTohXRB5CPYJR=4PQmdXaqZ0Tgq5Z0WXPS7QBxg5Q@mail.gmail.com>
 <20210913135712.GW23326@home.paul.comp>
In-Reply-To: <20210913135712.GW23326@home.paul.comp>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 14 Sep 2021 09:38:25 +0800
Message-ID: <CAGm54UG-ufz_3tE_uVj-o8FjrD0c57tbCfBA2_dzY4t5MAOAZw@mail.gmail.com>
Subject: Re: [External] Re: About KVM screenshot
To: Paul Fertser <fercerpav@gmail.com>
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

On Mon, Sep 13, 2021 at 9:57 PM Paul Fertser <fercerpav@gmail.com> wrote:
>
> Hello,
>
> On Mon, Sep 13, 2021 at 09:47:03PM +0800, Lei Yu wrote:
> > The whole KVM screenshot is implemented by the below pieces:
> > 1. The vncsnapshot[1] is slightly modified for cross-compile, and a
> > bitbake recipe is created for it;
> > 2. A service is created to host the DBus interface to provide the
> > "Trigger" and "Clear" methods for KVM screenshot;
> > 3. OEM redfish actions are implemented to trigger and clear the KVM
> > screenshot, including the download of the picture;
>
> Currently obmc-ikvm gets a steady stream of JPG images, frame by
> frame, from V4L2. Have you considered extending it a bit so that it
> would be capable of simply saving the current frame to disk, without
> any conversion/transformation, just dump an array of bytes to a file?
>
> What would be the advantage of establishing a local VNC session with
> this additional software compared to the straightforward JPG to file
> writing?

Extending obmc-ikvm was my first thought, and when it's discussed in
Discord, @zevweiss mentioned that we could use the existing
vncsnapshot tool instead of writing new code.
And we tried and it worked fine with the limitation mentioned above.

With the obmc-ikvm extension to capture the JPG image, it has to deal
with two cases:
* When there is already a VNC session, it could just save the current
image when a snapshot is requested;
* When there is no VNC session, it has to open the video device and
capture the image.

We think vncsnapshot is much simpler to use in such case.

But I agree that it will be more efficient if we could implement the
feature in obmc-ikvm.

-- 
BRs,
Lei YU
