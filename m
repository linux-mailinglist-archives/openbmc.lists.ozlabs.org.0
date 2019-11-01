Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C3AEBC5C
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:27:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47471F2vc0zF5gm
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:27:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o+c0rSnB"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47470T1cTyzF4s3
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:27:04 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id w12so9419707iol.11
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 20:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EKarv+0RC/JWJi5/ZgwjStZtVStVfW4j/secMfJ6SlI=;
 b=o+c0rSnBw4r+3XZiNrowtRM8M5kIbVYqaBY+Z0BfQkBcKtUS5P7uTC/OBHIMwW+iAv
 0Wl7Z0su/K6SshzkjAJpdbYFLjrRLdAi/qVTMV9vVIAHIq2XvTmEeGEIPJ9z4reZe3WJ
 a2N1peTdt9zvuaoR0gGA3zLVURhuaBKCnSCcHt/Tpbp2F4si9RSo6+d4fQyn7rNDcQao
 UAFFaJihkO9D1cZDdOc4rs8j04mRp7GhK7rXpVhuw46wMiwXfZoS1zYJc8rFISCM2AvX
 ZhlmLCo55RmUOjJ7N8bUSbiRRdPxTNQ+buNOz4ZzkJXF6fVSrkNriezCS7xk+6maaZfr
 vA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EKarv+0RC/JWJi5/ZgwjStZtVStVfW4j/secMfJ6SlI=;
 b=Ss8brUOQ/3aUSgRiQJ1b1y+tmfyxfg7HF/wiQIDcGoZO3k5lCZXMsRcRpmFewX7xmd
 FNsmUsNAn3VaH0+z+vqhfPS9KnfWKIL/Koirb57RzmKQAkGH1pyAcpCI4dTRKku9dvaH
 anbvJCFUT/JmUK3fCAqIFs8oBiEEY44jtw57ngDsm+ANHCOvklxt6KC3NIdDG/bTVCUd
 quYj65JKfois7SltWhj7J8kaFACteCwmBlmBL+RTOyBCor6LlmdqfOhbbOKyVUvQF92O
 j4igu2Z6ue/k8rJgXSHxPQjBpSmc/He8n6xFWNqoEKUINGEWDevja4N9YE7sS9TGpi1x
 zHOQ==
X-Gm-Message-State: APjAAAXJyJnZ2KFh48JxPkIg74rdhcJSn9GAdvH068MfbD+7/A7kD8Mp
 Vvuu960dhEOckoJ2QBYY04dxLC1IYvQUDBelVS1KKuPRat4=
X-Google-Smtp-Source: APXvYqw3aMnNqyKmpLe9azTo/QD8K1Gg6N8exQESf/BxEwdv6gsn+FFzvP/30iN4d2hIY9ceM36JjxO5U7x9dpUcR8s=
X-Received: by 2002:a02:c4cd:: with SMTP id h13mr3403345jaj.33.1572578821193; 
 Thu, 31 Oct 2019 20:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
In-Reply-To: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 1 Nov 2019 11:26:50 +0800
Message-ID: <CAARXrtnEOUuVdZpobxnQiJ-n0ve57fiP0nu8Yw-t5jMHWShXtA@mail.gmail.com>
Subject: Re: HTTP redirect to HTTPS for web UI
To: George Liu <liuxiwei1013@gmail.com>
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

On Thu, Oct 31, 2019 at 9:48 PM George Liu <liuxiwei1013@gmail.com> wrote:
>
> Hi All:
> I'm working on http redirect to https task(https://github.com/ibm-openbmc/dev/issues/895).
> I took a cursory look at the design(https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173) and did some testing.
>
> In bmcweb, I find it the current communication logic can only listen to one communication protocol (http or https). If you listen to both protocols at the same time, you need to change a lot of code and communication logic.
> If we are going to implement this feature in bmcweb, it costs extra effort and it's likely the implementation is no better than Nginx. so I prefer to use Nginx.
>

From Ed's [mail in June][1], one approach is to use boost asio async_detect_ssl.

But I agree with George here that it costs extra and unnecessary
effort, because with nginx it is so easy to config the http->https
redirection, and it is easy to get all the https related configs
right, including HSTS.
In other words, we got such features for free (except for a few binary
size), why bother re-write it?

Considering the binary size, maybe it's worth the effort to check how
many bytes are increased compared between:
1. Current implement that bmcweb handles https only
2. Enable BMCWEB_INSECURE, opt-out all https related code in bmcweb,
adding a basic nginx and a configure file that does the https
redirect.

We could check the binary size to see if it's acceptable. Be noted
that implementing this feature in bmcweb increases the binary size as
well.


[1]: https://lists.ozlabs.org/pipermail/openbmc/2019-June/016557.html
