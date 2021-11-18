Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DDA456226
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 19:14:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw7HX5Ctlz3cNt
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 05:14:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q+tQHB0L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f;
 helo=mail-wm1-x32f.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=q+tQHB0L; dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw7H860Ncz2ywH
 for <openbmc@lists.ozlabs.org>; Fri, 19 Nov 2021 05:14:28 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so5502411wme.4
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 10:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0XstTzwI8gX3XJ9GMe6inWvVkByifX6sbleKbf5Qpw=;
 b=q+tQHB0L86kFfUda87P7wmXZ+hapSCVhzFM6BurLFojnneiZgrsZNoMEzs98yhj0Rx
 yuloX2tkEzidoKHsHtxC40ZeEOlGJrK0yPltkx469P4zvJ+tt2xRPYoQReLRk8P6Gttm
 wi5nn8uAO5VWFvVMkwfMzEqwnWr/UILqWsQbcHFekjOJ3r10Wo+CnlOrx45hua+Ia+IW
 9RjbzWZqssAAeEX8xyDxf8XAAcT2giCxwTfp4+63k6bRwIzDroXjBEmxajhKIChqITeU
 KqMPghXzrTddXzl/oX2qzY6B6chlX44hOndHvg0S0dl7YIamXPXhrst0DHAIIxLllMZ3
 XCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0XstTzwI8gX3XJ9GMe6inWvVkByifX6sbleKbf5Qpw=;
 b=hdRO2dEAB75FsRC8QPMZt2+wdFWowtp6qE/Abbud3Q7cxBOyqcmK4+BitAuzlxmt4X
 2q3jxdK98ou1GZ4awhI75NTA71SsQCQ0V2gxFCNwPZFrgnNMQUD6OP7mIf/XKdTAJcKV
 g6Ih+nCJUj7SsH9JC3/J0CDe/OpOY5PfullhDp11M9Mgm+IWlbb64boqOJo1smtQr3aF
 9nEXlhhmht0WE3nPSrXDbiT6WRmeA5HwybmSw08zO7DcgffLoy17UQQQcL9Or1YeQ44l
 bwAY3k3/H9tUCdRugyOXTsA4JyEVrcObG1C7FjF2hFFA+5OirOV/2O5/z17quFHMiyRL
 hpGw==
X-Gm-Message-State: AOAM530H7IhrNC0BnuTwI8K0oG3lGTKuNO4/V2h07pTd43uE52U/0Hzl
 yslrWHh1VUkhGKxmDPCHReJFMntE50tIK7rI9tEISw==
X-Google-Smtp-Source: ABdhPJwJPD01U99st2KDwhP/0IKCrK2ofnbzZ28p2wIHrtn7Fym+RLqv5p604hH1NEDCL6y0k2HM9eL+QK85oggAzZU=
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr12389482wmq.117.1637259261122; 
 Thu, 18 Nov 2021 10:14:21 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR03MB309198479B59F9853399AB54979B9@HK0PR03MB3091.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB309198479B59F9853399AB54979B9@HK0PR03MB3091.apcprd03.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 18 Nov 2021 10:14:09 -0800
Message-ID: <CAH2-KxAmfQdYBVeq+PCdX2GLPhVFZvLpdUVkzH5QxuEQ6d80Ow@mail.gmail.com>
Subject: Re: Retrieve meta-lenovo
To: pengms1@lenovo.com
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

On Thu, Nov 18, 2021 at 1:09 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Patrick,
>
>
>
> According to https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47792, we would like to retrieve meta-lenovo and relative machines.
>
> And then we download and revise meta-lenovo from gerrit, but got the error message as below when push the code to gerrit, please give us some advices. Thanks.

Submit your changes directly to openbmc/openbmc.

https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/

>
>
>
> ! [remote rejected] HEAD -> refs/for/master (prohibited by Gerrit: project state does not permit write)
>
> error: failed to push some refs to 'ssh://openbmc.gerrit/openbmc/meta-lenovo'
>
>
>
> ________________________________
>
> AndrewPeng
> BMC engineer
> Lenovo Beijing
>
> 13260161340
> pengms1@lenovo.com
>
>
>
> Lenovo.com
> Twitter | Instagram | Facebook | Linkedin | YouTube | Privacy
>
>
>
>
