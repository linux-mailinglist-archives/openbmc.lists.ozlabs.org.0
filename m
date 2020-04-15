Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B391A90AC
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 03:59:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4925C40GfxzDqym
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 11:59:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=frGWCiKe; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4925BM2hNbzDqwP
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 11:59:03 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id u15so1954322ljd.3
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 18:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M00Jytb6e/qbqEghK01M4du6TqfbztgspJb21MAMzWU=;
 b=frGWCiKex4rgXrnZZPN5ANmjVZSUICcbaGDDPdQSXSNw3fJK9zpD7kYD4LW27AUt6p
 5z9b5vGE1jDCU0H1trw0D9FOjwTaCc/4eetdBXBUGCQl2B1S3jnbENWL8Ca5w5EXid5X
 7fWfGHh/b9h0tFalk7Nhw3FkzaqMMIc3JOKwmZnw9dd7sKV7RoxbjBF4g6RIweFQeoj8
 u2OQcXyYQrEHQv+pSLTXGFRzM6IvKxNbfmqRrco2EGt1sns7FnB/ZCj14YjPNpNof6BM
 DeriNzW8MKLVTCFjXDfYHFC59xeEpvKPjzDaj36SNlY15TI+8KMBnZRsQyKngdU/4rJc
 aIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M00Jytb6e/qbqEghK01M4du6TqfbztgspJb21MAMzWU=;
 b=hGYJKdvqYEJl1Y7ILU7IjFvhFh+l0dEaQvl5VjuWAPTqpzIjRk53qSXAjPXvSOQQ2u
 +7dra55J/16GGco27VxslspJi37oH1xGHoh9a15Ay+kFKbksvDrUPNvFIqnc+CwYLhbl
 h798B3Q5Y08oF6f+tXUNH3j3pbp7nC9/8Gh1lHBZfh/vC2PVNwgp7Wrfy8ovyna2rAzc
 jBH9FHHUJGdWAKolsaARgMwfpzf/qdIM1LONROYCuKC6rjFPsKy6FGt9TSpb7LylJoT6
 8VbQKh1hWF6v7+UMddk/9AALUMZT06k+N1KnR7w2tvF07QSbmseNgKESD/4MviEfQ5bA
 0W4g==
X-Gm-Message-State: AGi0PubwNr+jvkFxdS5e+7hQce8gB707q6u22JP7QcQRZxDEdQmDKp5K
 NPIX+zQn26a4EiV/cG8zKFteMbUnVCfFSFSncM4=
X-Google-Smtp-Source: APiQypI9EHs8ab7m1LVnS9ikEVAAOowglAK7PvFccqZDCjgPoY1Ws2woJTGtZxaeq7TCgwwRHLtU106wFa9iYg5u5XU=
X-Received: by 2002:a2e:720e:: with SMTP id n14mr1710755ljc.64.1586915938863; 
 Tue, 14 Apr 2020 18:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
 <CAH1kD+b3ij5KiZn+-N0O+BnbB-XONmbWtYSRA2feKNb+zw6kjw@mail.gmail.com>
 <521FD3E2-3AFE-4E56-A6CF-B0ABA7E9C8E3@fb.com>
 <e42cef9e-1760-d3ee-4396-61cd1d141983@linux.ibm.com>
 <d3eac624-f1a2-fd2d-6639-3290c8085abd@gmail.com>
 <bea70fb0-780c-39a7-a677-dfc41e864337@linux.intel.com>
 <20200414154801.GA443018@heinlein.lan.stwcx.xyz>
In-Reply-To: <20200414154801.GA443018@heinlein.lan.stwcx.xyz>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 15 Apr 2020 09:58:46 +0800
Message-ID: <CAARXrtm7ex5wNcc3ggkYNw5s9qdT8rw+4F46ioiPfp-7s+GM-w@mail.gmail.com>
Subject: Re: Call for Gardening Tasks
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, krtaylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 12:57 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Fri, Apr 10, 2020 at 11:00:48AM -0700, James Feist wrote:
> > On 4/10/2020 7:30 AM, krtaylor wrote:
> > > On 4/10/20 9:23 AM, Joseph Reynolds wrote:
> > >> On 4/9/20 5:19 PM, Vijay Khemka wrote:
> >
> > I'd really like to see clang-tidy or other checks for style added into
> > the build CI. The number of style violations waste lots of time in
> > code-review for both the submitter and reviewers.
>
> Do we have .clang-tidy files in the repositories?  Meson has built-in
> support for generating a 'ninja clang-tidy' so it is pretty trivial to
> enable.

phosphor-state-manager has .clang-tidy in the repo, and the CI will
invoke run-clang-tidy.py to do the task.
However, it's noticed that it's broken with
https://github.com/openbmc/openbmc-build-scripts/commit/9e5b11f5d5069d244a2dd86b120fcc98fea66d2c
