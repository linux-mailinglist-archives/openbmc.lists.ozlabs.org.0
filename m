Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9140911B
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 15:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7SjN0L6vz2yJw
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 23:57:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IPzXLxZo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IPzXLxZo; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7Sj05NRYz2yHq
 for <openbmc@lists.ozlabs.org>; Mon, 13 Sep 2021 23:57:22 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id s3so17465900ljp.11
 for <openbmc@lists.ozlabs.org>; Mon, 13 Sep 2021 06:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HUA85e5LsPvmtYmuCmhinWB+yb4f2XX6FnQzUp2D+pU=;
 b=IPzXLxZo5QyZ0RrgnjQ/QXq3zDuGIe5zCo1d3DB/2Q1qQi/fG5PfSq7PJOkmAFkfuY
 DbhZ9ddVw7Doxvogw9wGjDxfRJokRo8j4wcO/7dIAJErug0to53fdofcCCPxNpamIDEF
 BD6ycj73H8HdV1oZqhv2SlD68riwwoMns+cIKo+EHoj54evBQ9PJUXlCDPRrzYLrbaN/
 cJYv5q9AV8diWf5T6KRqQO4im+2h5eEcJHjXSiQRTXbQMAvDWdLZD/C6rbbFPUfrMoas
 lhNkvgKTY+S7vjO1aDeGP40lcEaqCI1J21MoyEryfGRcJgXAQP/SpoNU0aA/56weM6DE
 GbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HUA85e5LsPvmtYmuCmhinWB+yb4f2XX6FnQzUp2D+pU=;
 b=xpR5weDhxqyAciBozzAmGfpZQRiJrSiFbHv3JPFP4U++WqFNrhc981Qfn58hNNBpQR
 msv9sccnMqOXkF+DwGSNn8C3mOYT9dRXsYFLTfakS3A/MINARa68gEJvlo1p73dCm6s+
 dNrW+4htevyLW/Kni3Q5zVK/FBU1V1Cz8NU3SCIn30PIMDwLf7wXQSM1CeWfZOimTDhK
 h5OeR/hT8751cjMBLYpycY2zzYUDTSOXCx1x3tkCVnZwDsIL1F5uVGu6XlZqBWqekESW
 W8MAa+nGRfntZHqGCR1FUBn/Mk+RmJbMFKXjL/O69DKNx67vLIKEofWDKnBuKzsAC12r
 D5ow==
X-Gm-Message-State: AOAM533d2N+WR1QgKAHr4JfmhUVSp8KekcPk4OeUAKpoe6YEf5oDKK4l
 amMUyPNfM6y0cj7DSGS9/f4=
X-Google-Smtp-Source: ABdhPJwHMmgex9WvWA2vfM3i2d9LXs39rc5+tQZ9z/+TcTR6EnnCF+Nz1XM4CMJEtkcS6k2EEU5Gdw==
X-Received: by 2002:a2e:9607:: with SMTP id v7mr10231985ljh.405.1631541436572; 
 Mon, 13 Sep 2021 06:57:16 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id s2sm1005312ljj.83.2021.09.13.06.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:57:16 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 18DDvDPJ001649; Mon, 13 Sep 2021 16:57:14 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 18DDvCZT001648;
 Mon, 13 Sep 2021 16:57:12 +0300
Date: Mon, 13 Sep 2021 16:57:12 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: About KVM screenshot
Message-ID: <20210913135712.GW23326@home.paul.comp>
References: <CAGm54UG1guTohXRB5CPYJR=4PQmdXaqZ0Tgq5Z0WXPS7QBxg5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm54UG1guTohXRB5CPYJR=4PQmdXaqZ0Tgq5Z0WXPS7QBxg5Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hello,

On Mon, Sep 13, 2021 at 09:47:03PM +0800, Lei Yu wrote:
> The whole KVM screenshot is implemented by the below pieces:
> 1. The vncsnapshot[1] is slightly modified for cross-compile, and a
> bitbake recipe is created for it;
> 2. A service is created to host the DBus interface to provide the
> "Trigger" and "Clear" methods for KVM screenshot;
> 3. OEM redfish actions are implemented to trigger and clear the KVM
> screenshot, including the download of the picture;

Currently obmc-ikvm gets a steady stream of JPG images, frame by
frame, from V4L2. Have you considered extending it a bit so that it
would be capable of simply saving the current frame to disk, without
any conversion/transformation, just dump an array of bytes to a file?

What would be the advantage of establishing a local VNC session with
this additional software compared to the straightforward JPG to file
writing?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
