Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A737AB9AD
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 20:59:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KNNvpH9+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RshQd34D5z3cg5
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 04:59:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KNNvpH9+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RshPz3dKnz3c4r
	for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2023 04:59:01 +1000 (AEST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1c4cf775a14so1298319fac.3
        for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 11:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695409133; x=1696013933; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MwYTWetIB5eA4p2llRV2YmVgtaHtsqDUxOoROYWvR8=;
        b=KNNvpH9+/5QVCxMCvCGFlkX4oLpB/pj1GvnY6WvLlIqgwlkBKHP3tpR1hy7LRGs4g4
         L0zSChGkiYJLItwmW/e24HyzXjQ1T1AkFCv0pdRMvgzqsAADLjRcZjL0BsFX++04g1/V
         wsnS/MM8FfMdFx54mJLNmmc4ylHGYPk5tTKd2Kxw98wWx3lSuiUBFcq2FC1w2F+7ta9U
         qQnwBjKA7FN8MLAwOYN7KGwwYhCyH9D2UTgWYUkr7jClwtVA4TNkbk1L47j/OwuuVPEF
         A/EYtXqLaz3ULx9v6JbrPYOV3oTrIxP8I03+uJC+Yqk300NEjzm+5ZBRNu41W6VkcHSS
         1vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695409133; x=1696013933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MwYTWetIB5eA4p2llRV2YmVgtaHtsqDUxOoROYWvR8=;
        b=ix1XcIemtIz2WOffy3TtU0it1OLk/NHNmxhv3tvulu8o1rT0ctTVVnMWTTvFtv9HJL
         LGr/HAa8UEiC20epez1gxCDDg/eloS+hya11BaOlm/EustBDDFANK4dqvGncCB5Wlf60
         g/ZA8MBl9vOZUQWm8ztnWEJNUTBpWOhwwRTwtDPct2dqvG4+0c2l5alYwOU/el3cI9g0
         l7dQOK6W1cn45zNUPIljj2+86mgwxvzzNp6/kBSpptOWU9j6o5xNrO9QosjnUMnh3Abs
         YHMXllhyuqqLeOHOy2DHhGpctNja4ZpoXqJeIYNUqx26PM2hGTmOzB/sMo01GN6SlDvB
         dAkQ==
X-Gm-Message-State: AOJu0Yx2tzz2uPXClgmpxBwvW9Y2gfqG3rQ7LAAPVu4OAyK672AAkxhY
	G5bAWxIe13IzEJYwPdeNZieND5GCk3uwhME7zTEKfKyHMMA=
X-Google-Smtp-Source: AGHT+IGPc2UqKD8gUDqgighijPOgDFYQS1IQZCQDDrZxP+kEjoMv2QHwna4dmFGX48e8LFcjc6fGWq+1K40eRIshF4A=
X-Received: by 2002:a05:6871:5d4:b0:1d0:eaa6:82cd with SMTP id
 v20-20020a05687105d400b001d0eaa682cdmr355927oan.25.1695409133530; Fri, 22 Sep
 2023 11:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=pST5nX76byef6S4rsskMRD3xvF5gAVqhr2eRefcRa-qA@mail.gmail.com>
 <CACWQX83En+xqRAwM9hSwqFsZ_+SA6rqtGC7TenYSdAcxdPvaHg@mail.gmail.com>
In-Reply-To: <CACWQX83En+xqRAwM9hSwqFsZ_+SA6rqtGC7TenYSdAcxdPvaHg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 22 Sep 2023 13:58:37 -0500
Message-ID: <CALLMt=pNqMNRRJRo5f3v3jA66Sq7HnAbyneX+n4svSAsm6z6fw@mail.gmail.com>
Subject: Re: webui by default in openbmc images
To: Ed Tanous <ed@tanous.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 21, 2023 at 12:11=E2=80=AFPM Ed Tanous <ed@tanous.net> wrote:

> The problem a while ago was that the webui is not able to build
> offline, and completely bypasses yoctos do_fetch step, so the sources
> aren't traceable and make the software bill of materials wrong.  What
> exists in the OpenBMC recipe is literally just calling NPM install and
> using the NPM registry to build the webui, which isn't able to be
> built in an offline cluster.  That, along with issues with some users
> proxy configurations why it was never installed by default.  I think
> we need to take this up a level, and if we decide that we don't need
> the defaults to be built hermetically or traced, and we don't want to
> support devs with a weird proxy, that's fine, but it should be a
> project level decision on that, not specifically scoped at the webui
> as a default.

Ahh, that's a good point. These issues haven't been a concern for me
but I can see how that could affect others. I updated the commit to
create the new image feature but to not include it by default in all
openbmc images.

https://gerrit.openbmc.org/c/openbmc/openbmc/+/66675
