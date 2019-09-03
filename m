Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C5A72C4
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2019 20:50:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGGm6MXzzDqqY
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 04:50:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OgUbUA1y"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NGG66KK1zDqbt
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 04:49:34 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id 97so15018948otr.4
 for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2019 11:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e7DPJm89OvllPke6vHXEZyJiMQTutOoFBJgNzG++DCs=;
 b=OgUbUA1y+NLyFQgJ++E9JdwtT8NAK76mkJrqDaVgBdN2/lPPWvLbMmtAweck8l9BC+
 DjVQUWmb8945+j4Z5w+B7eobqiDYNQP5i/zFr/ITrMD2p6VB5ULDRgJRtbkmfJzD9yn3
 AgmhGKcH3tlX8Pwm+bdawEtHQcoU9jIoVu42HqDFJi6iQzhRUCcSEGrKB//7cc730X1U
 mjFqTGobwpvSRaW8vAlR320Lv21ipOHNVhmrfxZsMdUN7QRZFOVUJU0iICoZE/PypfIA
 u53jr1fF1y00EDlRDtNDhUOyuUS5rGmUU4F9cjfXRXT3kz9irUcZMvMJoaBwuNCK6beq
 zQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e7DPJm89OvllPke6vHXEZyJiMQTutOoFBJgNzG++DCs=;
 b=T5QU2MTrQ5ga/93vcNYpBr3Ce6ZG2z6tartPgL1cgEQ36JdlZPmhhWRuMR7X1aM+r5
 SMjqjO3pL+Z5F8PBhlWBDGkAlaXbdcMJcgeIvySCfv6lWCHj6Rbqf4yeyDLHygekDj1P
 rHgmvu6ylgtexSNDdMv1TahLM26zWCZD1rhm1hnJaobr8e1ScmBQ3NI2eCPrej693Pfa
 /4fs+135e7S4qvFTz2o41LrHVfAkdteYeIl7Ext4w6sYJEW1cAWemptXOEYKKKqYVyNy
 id246/UDtOYOnfC4bnB3YiUPeC6RLxgiP0pIPauD/hEMUeyex6D9y1HthL//9uz7xwFk
 gTgw==
X-Gm-Message-State: APjAAAUy3yxWBldqTVR8pBaONV8RfVjkVqq2eMkesXkCx0UbBMtFzLTk
 WcIQ/x1EOo7QpOIThKLAM26egn2A5uVglbUsq08=
X-Google-Smtp-Source: APXvYqxzUxtiLrNfMYfTwwIRvBnCWXJkCQPVdCjRJb1rnZStkLhIfg7ayh57ddYT/rVUL7+L8k/rPCqxx/YgSEGZCno=
X-Received: by 2002:a9d:6d83:: with SMTP id x3mr10508217otp.263.1567536571195; 
 Tue, 03 Sep 2019 11:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <643a0f27aed44f9b95a1d0287c2e204d@lenovo.com>
In-Reply-To: <643a0f27aed44f9b95a1d0287c2e204d@lenovo.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 3 Sep 2019 13:49:15 -0500
Message-ID: <CALLMt=qXUrUWZFP7nx9sMfse1Uh-HY6AjFwZLfVvJTxG_v9YaA@mail.gmail.com>
Subject: Re: How to handle a specific platform application?
To: Andrew MS1 Peng <pengms1@lenovo.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Sep 1, 2019 at 10:18 PM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Team,
>
> If we implemented a specific application on our platform such as FPGA com=
munication tool, it's just used in our products rather than a general purpo=
se application. Could I create a repo for it on our github and create a bb =
file in our OpenBmc meta-layer to fetch it? Does it need to do OpenBmc gerr=
it code review?

Yes, if there's no use cases for other openbmc users to utilize this new to=
ol
then putting in a separate github project and pointing a recipe that is wit=
hin
your meta layer makes sense. The only thing that would go through gerrit
is your new recipe to use it.

>
> Thanks,
>
> Andrew
